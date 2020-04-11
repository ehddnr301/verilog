module tb_seg;

    reg [3:0] t_sin;
    wire [8:0] t_seg;
    integer i;

    seg s0 (
        .sin(t_sin), 
        .seg(t_seg)
    );

    initial begin
    $dumpfile("testbench.vcd"); $dumpvars; 


    #5 t_sin = 4'b0000;

        for(i = 0;i < 16;i = i+1) //run loop for 0 to 15.
        begin
            #5 t_sin = t_sin + 4'b0001;
        end     
    end
      
endmodule