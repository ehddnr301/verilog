# push button extension module

- 캐패시터로 너무 빠르게 반응하여 오동작 하지않게 딜레이를 줌.

## 저항 스위치 위치

- 스위치 위 , 저항 아래
  - 안눌리면 0
  - 눌리면 1
- 스위치 아래, 저항 위 (지금 쓰는거)
  - 버튼이 눌리면 0
  - 버튼이 안눌리면 1

# LED extension module

- 입력된 그대로 쭉 타고 들어온다 ?
- 1을 내보내면 불 들어오고
- 0을 내보내면 불이 꺼짐

# EX

```
module HA(a,b,s,c);
    input a,b;
    output s,c;

    assign s = a^b;
    assign c = a&b;
endmodule
```

# 실습

- 왼쪽 탭 RTL analysis ? 
  - open 어쩌구 클릭
  - ok 클릭
- 왼쪽 탭 schemtic 클릭하면 게이트를 볼수있음.

## 핀정보 주기

- 메뉴 - 레이아웃 - I/O planning
- a : J14
- b : H12
- c : P15
- s : H13
- LVCMOS33 : high 가 3.3v

- 하단 탭
- 밑에 패키지 핀을 조정해서 mapping 시켜주면 된다.
- IO standard 를 LVCMOS33 으로 설정.

- Save constraints
  - .xdc 형태로 저장
  - 만들어진 파일은 텍스트로 기록됨.
  - 어떤 포트에 뭐가 연결된지 적혀있음.

# 합성

- 왼쪽 탭 Generate Bitstream 클릭
- 창 yes 클릭 (synthesis 부터 진행) ok 클릭

- 아래 탭 design runs 를 보면 진행과정을 볼수있음.
- 다 끝나면 창이뜨면서 뭘 할지 정하면 됨.
- open hard ware manager 선택후 ok

# 연결

- 하드웨어 메니저를 열어서 auto connect
- 연결된 장치들이 뜨면
  - zc70101~ 
- 프로그램 을 누르면 fpga상에 코드가 구현이 됨.

# Open hardware manager

- auto connect
- 프로젝트 네임/ 프로젝트네임.runs /impl_1 folder
  - project이름.bit 클릭 하고 ok