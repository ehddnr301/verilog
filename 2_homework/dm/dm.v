module demux_1x4(
	din,
	sel,
	// output o0, o1, o2,o3
    dout
	);
    input din;
    input [1:0] sel;
    output dout;
    // output o0;
    // output o1;
    // output o2;
    // output o3;

    reg din;
    reg sel;
    wire dout;
	
    // assign o0 = (sel[1] == 0) ? ((sel[0] == 0) ? in : 0) : ((sel[0] == 0) ? 0 : 0); 
    // assign o1 = (sel[1] == 0) ? ((sel[0] == 0) ? 0 : in) : ((sel[0] == 0) ? 0 : 0); 
    // assign o2 = (sel[1] == 0) ? ((sel[0] == 0) ? 0 : 0) : ((sel[0] == 0) ? in : 0); 
    // assign o3 = (sel[1] == 0) ? ((sel[0] == 0) ? 0 : 0) : ((sel[0] == 0) ? 0 : in); 
    // assign o0 = sel === 2'b00 ? in : 2bx;
    // assign o1 = sel === 2'b01 ? in : 2bx;
    // assign o2 = sel === 2'b10 ? in : 2bx;
    // assign o3 = sel === 2'b11 ? in : 2bx;
    // assign dout = (sel == 2'b00) ? din:
    //             (sel == 2'b01) ? din:
    //             (sel == 2'b10) ? din:
    //             (sel == 2'b11) ? din: x;
    always @(*) begin
        case (sel)
            2'b00: dout = din;
            2'b01: dout = din;
            2'b10: dout = din;
            2'b11: dout = din;
            default: dout = x;
        endcase
    end
	
endmodule