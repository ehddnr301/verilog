# Design

- logic synthesis
  - C = A+B 같은 behavioral 에서 AND 같은 low 로직으로 바꾸기

- net list 를 가지고 post synthesis simulation 진행

- Mapping, placement, routing
  - 맵핑 : 어떤부분을 어떻게 구현할 것인가
  - 플레이스먼트 : 하드웨어 상에서 배치
  - 라우팅 : 연결

- FPGA programming unit
  - configured FPGAs
  
# 최적화

- 툴에 구현에 되어있음.

# 동작

- Z7010 보드

## Zynq board

- XC7Z010CLG225-1

# Zynqberry board

## Zynq Board

## Xilinx Zynq-7000 soc

- IP : 재사용 가능한 모듈
- Hard IP : 칩형태로 만들어져 있음 레이아웃같은게 픽스 되어있음. (커스텀 힘듬)
- Soft IP : 코드로 이루어져 있음 (커스텀 쉬움)

## Zynq

- 프로세싱 시스템 : cortex 가 듀얼코어 존재 800mb 속도
- 프로그래머블 로직 : FPGA 로직
  - axi 포트를 통해 프로세서와 데이터를 주고받음.


# 프로그래머블 로직

- 로직 페브릭 : 실제로 동작시키기 위한 장치들
- 컴피규러블 로직 블럭 : CLB : 슬라이스가 두개씩
- 바깥쪽 회색블럭 : IO 블럭

# 하나의 CLB

- LUT : Look Up Table : 입력이 여러개 경우면 진리표를 기술할수있는데 진리표를 담고있는것이 LUT, (Combinaional logic)
- FF : Flip Flop (Sequential logic)
- finite state machine 구현 가능.

# 정리

- CLB : regular grouping of logic elements, array 형태, 두개의 slice 를 가짐
- Slice : combinational, sequential logic 을 구현하기 위한 장치
- 징크 : 하나의 슬라이스 안에 4개의 lut, 8 ff

- lut : 최대 입력이 6개 까지 받아들일수 있는 로직펑션
  - 읽을수만 있는 ROM
  - 읽고 쓰는 RAM
  - 하나의 로직 function
  - lut를 묶어서 더큰 로직 구현

- FF
  - sequential logic 을 구현할때 필요
  - 1bit register
- Switch matrix
  - 라우팅 기능 제공

- Carry logic
- Input / Output Blocks
  - 각각의 IOB 는 1 bit 의 입력 또는 출력만 handle 가능

# RAM

- RAM : 데이터 저장
- DSP : lut를 쓰면 느리니까 dsp 사용


