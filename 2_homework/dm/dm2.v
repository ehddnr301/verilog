module demux(din, sel,
            dout1,
            dout2,
            dout3,
            dout4,
            dout5,
            dout6,
            dout7,
            dout8
            );

    input din;
    input [2:0] sel;
    output dout1;
    output dout2;
    output dout3;
    output dout4;
    output dout5;
    output dout6;
    output dout7;
    output dout8;

    reg dout1;
    reg dout2;
    reg dout3;
    reg dout4;
    reg dout5;
    reg dout6;
    reg dout7;
    reg dout8;

    reg dout;
    
    always @(*) begin

        dout1= (sel == 3'b000) ? din : 1'dx;
        dout2= (sel == 3'b001) ? din : 1'dx;
        dout3= (sel == 3'b010) ? din : 1'dx;
        dout4= (sel == 3'b011) ? din : 1'dx;
        dout5= (sel == 3'b100) ? din : 1'dx;
        dout6= (sel == 3'b101) ? din : 1'dx;
        dout7= (sel == 3'b110) ? din : 1'dx;
        dout8= (sel == 3'b111) ? din : 1'dx;
        
    end

endmodule