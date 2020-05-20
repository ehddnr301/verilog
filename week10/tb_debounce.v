module tb_debounce;

    reg clk;
    reg n_reset;
    reg button_in;

    wire DB_out;

    debounce UUT (
        .clk(clk),
        .n_reset(n_reset),
        .button_in(button_in),
        .DB_out(DB_out)
    );

    always
    //  every 40 nanoseconds invert the clock
    #20 clk = ~clk;

    // initialize Inputs
    initial begin
        clk = 1'b0;
        n_reset = 1'b0;

        // at time 200 release the reset
        #200 n_reset = 1'b1;
        button in = 1'b0;

        #24000 button_in = 1'b1;
        #400 button_in = 1'b0;
        #800 button_in = 1'b1;
        #800 button_in = 1'b0;
        #800 button_in = 1'b1;
        #80000 button_in = 1'b0;
        #4000 button_in = 1'b1;
        #80000 button_in = 1'b0;
        #400 button_in = 1'b1;
        #800 button_in = 1'b0;
        #800 button_in = 1'b1;
        #800 button_in = 1'b0;
        #80000 button_in = 1'b1;
        #4000 button_in = 1'b0;
        $finish;

    end

endmodule