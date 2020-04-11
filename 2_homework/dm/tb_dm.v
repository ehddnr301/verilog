module tb_demux();

wire t_out;
wire t_in;
reg [1:0] t_sel;

demux_1x4 dm4 (.din(t_in), .sel(t_sel), .dout(t_out));

initial begin

t_in = 1;

t_sel = 2'b00;
t_sel = 2'b01;
t_sel = 2'b10;
t_sel = 2'b11;
  
end

endmodule