iverilog -o testbench.vvp tb_fa.v fa.v

vvp testbench.vvp 

# 정리

## Primitive value

- 0 : low logic or false
- 1 : high logic or true
- x : unknown logic (0,1 이 동시에 들어올때) (conflict)
- z : high impedence

## numbers

- `<size>'<radix> <value>`
- 크기'몇진법 값
- 8'hax = 1010xxxx
  - a: 1010
  - x: xxxx
- 12'o3zx7 = 011zzzxxx111
  - 3: 011
  - z: zzz
  - x: xxx
  - 7: 111
- 16'b0000_1111_0000_1001 == 16'b0000111100001001 == 16'h0f09

## 연산자 operators

- bit-select operator
  - [] : `wire [3:0] b` = `assign b=4'b0000`
- parenthesis
  - () : 연산 우선순위
- negations operators
  - !(logical), ~(bit-wise)
  - !b => 0001
  - ~b => 1111
- unary arithmetic operators
  - +, -
- Concatenation
  - `{a, b[2:1],c}` : 1000
- Replication
  - { n{m} } (m 을 n times 반복)
  - {4 {1}} => 1111
- Shift
  - `<<` : 왼쪽쉬프트
  - `>>` : 오른쪽쉬프트
- Bitwise logical operators
  - `&` : AND
  - `^` : XOR
  - `^~`, `~^` : XNOR
  - `|`: OR
- Boolean logical operators
  - && : AND
  - || : OR
- Conditional operator
  - Conditional expression ? True expression : False expression

## module

- [Example](./decoded_counter.v)
  - rst와 clk를 입력으로 받아서 ctrl을 출력으로 내보낸다.
  - Port list: 어떤 포트가있는지 모듈네임 옆에 적기
  - port declarations : 포트가 인풋인지 아웃풋인지

- [Multiplier]
  - 호출할때 parameter를 overriding 할수있다.
  - Multiplier #(8,6) M1 (RA, RB, Prod);
  - 8은 EM 6은 EN 의 값이된다.

### 호출할때 포트
- HA h2 (.A(Cin), .S(Sum), .B(S1), .C(C2))
  - HA 모듈을 h2라는 instance name으로 불러온다.
  - HA 모듈의 A 에는 Cin, S에는 Sum, B에는 S1, C에는 C2


## Data types

### Nets

- wire : 0,1 no logical function( AND, OR )
  - `wire Rdy, start;` : two 1-bit wire
  - `wire [2:0] addr;` : 3-bit vector wire

### Registers

- 어떤 값을 저장하고 있는것을 나타낼때
- reg : holds values until another value is put
  - `reg [0:31] opA;` : opA는 32-bit
  - `reg gt, lt` : gt, lt 는 1-bit


## Continuous assignment

- net으로 선언된 변수에 값을 할당할때.
- data flow style of modeling

- `assign [delay] LHS_target = RHS_expr`
  - ex)
  - `wire [0:3] out, in1, in2;`
  - `assign #5 out = in1 & in2;`

- `assign #2 D = A && B;`
- `assign #1 E = ~A;`
- `assign #3 F = A || C;`
 - 동시에 동작함
 - 만약에 A의 값이 변하면 2딜레이 후에 D에 반영이 된다.

### wire

- 내부에 값을 저장하지 않음. 
- 신호가 들어오면 그값이 그대로 전달
- procedure에서 사용할수없다.
- continuous에서만 사용
- assign으로만 적을수있다.

## Procedural assignment

- register에 값을 할당한다 always나 initial block 안에서
- 무조건 reg 타입

- procedural block 내에서 이루어 져야함.
  - initial block
  - always block
  - 모든 procedural block들은 동시에 동작한다.

- begin 과 end 로 범위를 정함.

### reg
- assign 문에서는 사용 불가
- 레지스터나 플립플롭을 만들떄는 클록에 의해 작동해야함


### initial blocks

- 시뮬레이션 처음에 시작된다.
- `not a synthesizable` : HW 로 만들어지지않는다.
- used only for testbenches

```
initial
begin
    clr =0;
    preset = 0;
end
```

### always blocks

- sensitivity list에 어느블럭에 의해 실행되어야 할지 적어야함
- sensitivity list안의 값이 변화될때 마다 실행

#### list

- Combinational logic 이면 `always @(*)`
- sequential logic 이면 주로`clock`, reset, set


### Blocking

- 주로 할 것
`target = [] expr;`

- a = # 7 0;
- b - # 5 1;

- 총 12 가 걸림.

### Non-Blocking

target <= expr;

- c <= #7 0;
- d <= #5 1;

- 총 7이 걸림.

## Combinational logic

### Decoder

- n개의 2진정보를 받아서 총 2^n개의 아웃풋을 만들어낸다.

```
 Input             Output
X2 X1 X0 | D7 D6 D5 D4 D3 D2 D1 D0
0  0   0 | 0  0  0  0  0  0  0  1 
0  0   1 | 0  0  0  0  0  0  1  0
0  1   0 | 0  0  0  0  0  1  0  0
0  1   1 | 0  0  0  0  1  0  0  0
1  0   0 | 0  0  0  1  0  0  0  0
1  0   1 | 0  0  1  0  0  0  0  0
1  1   0 | 0  1  0  0  0  0  0  0
1  1   1 | 1  0  0  0  0  0  0  0
```

- Boolean equation for each output
  - D7 = X2X1X0
  - D6 = X2X1X0'
  - D5 = X2X1'X0
  - D4 = X2X1'X0'
  - D3 = X2'X1X0
  - D2 = X2'X1X0'
  - D1 = X2'X1'X0
  - D0 = X2'X1'X0'

- [Decoder예제](./decoder.v)
  - `x[2] x[1] x[0] 는 [2:0] x 랑 똑같다 `;
  - combinational logic 에서는 blocking사용
    - 위에서부터 하나하나 순차적으로 이루어짐.
- [Decoder_Testbench](./tb_decoder.v)
  - procedure내에서 사용할것이기때문에 변수형태 reg
  - t_d는 decoder로직의 출력을 받아서 보는거기때문에 wire
  - `$finish`
    - $ : system task 미리 만들어진 것임
    - 시뮬레이션을 진행하다가 finish를 만나면 시뮬레이션을 종료하게됨

- Data Validity concern
  - internal signal always has 0 or 1 value
  - use Enable signal
    - Enable signal이 1일경우에만 decodere신호를 보냄

- Improved decoder
```
 Input             Output
En X2 X1 X0 | D7 D6 D5 D4 D3 D2 D1 D0
0  x  x   x | 0  0  0  0  0  0  0  0
1  0  0   0 | 0  0  0  0  0  0  0  1 
1  0  0   1 | 0  0  0  0  0  0  1  0
1  0  1   0 | 0  0  0  0  0  1  0  0
1  0  1   1 | 0  0  0  0  1  0  0  0
1  1  0   0 | 0  0  0  1  0  0  0  0
1  1  0   1 | 0  0  1  0  0  0  0  0
1  1  1   0 | 0  1  0  0  0  0  0  0
1  1  1   1 | 1  0  0  0  0  0  0  0
```


# Encoder

- Produce a binary code equivalent to the input, which is actice High
  - `2^n input` to `n-bit code`

```
          Input             Output
 D7 D6 D5 D4 D3 D2 D1 D0 | X2 X1 X0 
 0  0  0  0  0  0  0  1  | 0  0   0 
 0  0  0  0  0  0  1  0  | 0  0   1 
 0  0  0  0  0  1  0  0  | 0  1   0 
 0  0  0  0  1  0  0  0  | 0  1   1 
 0  0  0  1  0  0  0  0  | 1  0   0 
 0  0  1  0  0  0  0  0  | 1  0   1 
 0  1  0  0  0  0  0  0  | 1  1   0 
 1  0  0  0  0  0  0  0  | 1  1   1 
```

- 진리표는 2^8개의 조합중에서 8개만 커버하고있다.
- 나머지 248개의 경우에는 어떻게 출력될지 모른다.

# Priority Encoder

- 여러개의 입력이 들어오면 highest order를 씀.
- 우선순위가 높은 코드값을 사용해서 출력을 보냄.
- valid bit
  - 1 : 000 D0가 high
  - 0 : 000 어떤값도 high가 아님

# 합성

- verilog -> 회로
- for문은 verilog -> 회로 가 구현되지않음.
- testbench에서만 사용해야함.

# $display

- system task
- printf 와 동일

# Multiplexer
```
  Selection lines   Output
    S1    S0      |   Y
    0     0       |   I0
    0     1       |   I1
    1     0       |   I2
    1     1       |   I3
```

- Maximum of 2^n data inputs, n selection lines and single ouput
- 4 * 1 Multiplexer
  - 2 bit selection 라인 필요
- 여러개의 입력중 하나의 입력을 선택해서 동작

# Demultiplexer

```
  Selection lines   Output
    S1    S0      |   Y3 Y2 Y1 Y0
    0     0       |   0  0  0  I
    0     1       |   0  0  I  0
    1     0       |   0  I  0  0
    1     1       |   I  0  0  0
```
- I 는 input

- 하나의 입력을 가지고 여러개의 로직중 어디로 출력을 내보낼지 결정하는 로직
- single input
- n selection lines
- maximum 2^n outputs

# Driving LED

- Sink current : Vcc -> registor -> LED -> FPGA
- Source current : FPGA -> LED -> registor -> GND

- LED 특성 : 전류가 흐르지 않으면 양단의 전압차가 거의 무한대에 가까워짐
  - 전류가 흐르면 일정한 전압차 발생

# 7 segment

- common cathode 타입을 사용함.

- table
```
Number | Segment | DP | G | F | E | D | C | B | A | Hex value
  0    |   0     |  0 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 0x3f
  1    |   1     |  0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0x06
  2    |   2     |  0 | 1 | 0 | 1 | 1 | 0 | 1 | 1 | 0x5b
  3    |   3     |  0 | 1 | 0 | 0 | 1 | 1 | 1 | 1 | 0x4f
  4    |   4     |  0 | 1 | 1 | 0 | 0 | 1 | 1 | 0 | 0x66
  5    |   5     |  0 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | 0x6d
  6    |   6     |  0 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0x7d
  7    |   7     |  0 | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 0x07
  8    |   8     |  0 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0x7f
  9    |   9     |  0 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 0x6f
