module tb_demux();

reg t_din;
reg [2:0] t_sel;
wire [7:0] t_dout;

integer i;

demux dm (.din(t_din), .sel(t_sel), .dout(t_dout));

initial begin
$dumpfile("testbench.vcd"); $dumpvars; 

#5 t_din = 1;
#5 t_sel = 3'b000;

for (i = 0; i < 8; i = i + 1'b1)
  begin
   #5
   $display("Count: %d Select: %b", i, t_sel);
   #5 t_sel = t_sel + 3'b001;
  end

end

endmodule // tb_demux