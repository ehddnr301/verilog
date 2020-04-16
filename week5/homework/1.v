module addsub8 ( A ,B ,mode ,result ,overflow );

output [7:0] result ;
wire [7:0] result ;
output overflow ;
wire overflow ;

input   [7:0] A ;
wire   [7:0] A ;
input    [7:0] B ;
wire   [7:0] B ;
input mode ;
wire mode ;

//}} End of automatically maintained section

// -- Enter your statements here -- //

wire B0; 
wire B1; 
wire B2; 
wire B3; 
wire B4; 
wire B5; 
wire B6; 
wire B7; 

wire C0; 
wire C1; 
wire C2; 
wire C3;
wire C4; 
wire C5; 
wire C6; 
wire C7;  

xor(B0, B[0], mode);
xor(B1, B[1], mode);
xor(B2, B[2], mode);
xor(B3, B[3], mode);
xor(B4, B[4], mode);
xor(B5, B[5], mode);
xor(B6, B[6], mode);
xor(B7, B[7], mode);


fa U0(A[0],B0,mode,C0,result[0]);
fa U1(A[1],B1,C0,C1,result[1]);
fa U2(A[2],B2,C1,C2,result[2]);
fa U3(A[3],B3,C2,C3,result[3]);
fa U4(A[4],B4,C3,C4,result[4]);
fa U5(A[5],B5,C4,C5,result[5]);
fa U6(A[6],B6,C5,C6,result[6]);
fa U7(A[7],B7,C6,C7,result[7]);  

xor (overflow,C6,C7);                

endmodule


module fa ( A ,B ,Cin ,Cout ,S );

output Cout ;
output  S ;           


input A ;
wire A ;
input B ;
wire B ;
input Cin ;
wire Cin ;    

reg Cout;
reg S;


//}} End of automatically maintained section

// -- Enter your statements here -- //

always @(A or B or Cin) begin
    case ({A,B,Cin})
     0: begin Cout=0; S=0; end
     1: begin Cout=0; S=1; end
     2: begin Cout=0; S=1; end      
     3: begin Cout=1; S=0; end
     4: begin Cout=0; S=1; end
     5: begin Cout=1; S=0; end
     6: begin Cout=1; S=0; end
     7: begin Cout=1; S=1; end
    endcase
    end

endmodule