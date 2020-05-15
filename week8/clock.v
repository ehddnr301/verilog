module counter(
    input wire clk, reset,
    output reg clk1hz
);

reg [23:0] counter;

always @(posedge clk or posedge reset) begin
    if(reset == 1)begin
        clk1hz <= 0;
        counter <= 0;
    end
    else
        counter <= counter+1;
        if(counter == 12500000) begin
            counter <= 0;
            clk1hz <= ~clk1hz;
        end
end



endmodule