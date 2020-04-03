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