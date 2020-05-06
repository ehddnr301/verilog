# Assignment types

## Continuous assignment

- assign 을 이용해서 값을 줌
  - `assign #5 c = a & b`
- c 는 nets type
- wire c

## Procedural assignment

- initial or always
  - initial 은 time = 0 일때 실행 ( 합성이 반영되지 않음 ) - testbench에서만 사용
  - always 는 합성이 반영됨.

- sensitivity list
  - sequential always block 
    - clock, reset, set 만 주로 들어간다.

- 하나의 always block 안에서 blocking, nonblocking 둘중 하나만 사용해야합니다.
- blocking assigment
  - combinational logci
  - `c = a & b`
  - begin 과 end 사이에서는 위에서 아래로 순차적으로 실행.
- Nonblocking assignment
  - `c <= a & b`
  - sequential logic
    -  현재의 입력값과 더불어 이전 값의 상태에 따라 출력값을 결정해주는 논리 회로

```
always @(posedge clock or reset)
    if(!reset)

always @(posedge clock)
    if(!reset)
```
- 위에꺼는 clock에 동기화가 안되있음
  - asynchorous reset
- 밑에꺼는 clock에 동기화
  - synchorous reset

### blocking assignment

```
always @(posedge clk)
begin
word[15:8] = word[7:0];
word[7:0] = word[15:8];
end
```

```
// 8'b00000000
// 8'b11111111

word[15:8] = word[7:0];
word[7:0] = word[15:8];

// 8'b11111111
// 8'b11111111 

```

# Nonblocking assignments

- 시작하자마자 모든 오른쪽문장(RHS) 을 실행한후 왼쪽에 업데이트
-  something1 <= 1
-  something2 <= 2
-  something3 <= 3
-  이면 1,2,3 가 다 실행된 후에 마지막에 something1,2,3 에 값을 집어넣음.

```
always @(posedge clk)
begin
word[15:8] <= word[7:0];
word[7:0] <= word[15:8];
end
```

```
// 8'b00000000
// 8'b11111111

word[15:8] <= word[7:0];
word[7:0] <= word[15:8];

// 8'b11111111
// 8'b00000000
```

# Verilog event queue

# Recommended coding style

```
module and(A,B,C);

    input A,B;
    output C;
    assign C = A & B;
endmodule
```
- 간단한것은 continuous assignment
- 복잡한 것은 procedure assignment

- Sequential logic
```
module FF (CLK, D, Q, RST);
    input CLK, D, RST;
    output Q;

    reg Q;

    always @(posedge CLK) begin

    if (RST)begin
        Q <= 1'b0;
    end
    else begin
        Q <= D;
    end

    end

endmodule
```

# Sequential logic description