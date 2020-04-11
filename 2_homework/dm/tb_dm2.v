module tb_demux();

reg t_din;
reg [2:0] t_sel;
wire t_dout1;
wire t_dout2;
wire t_dout3;
wire t_dout4;
wire t_dout5;
wire t_dout6;
wire t_dout7;
wire t_dout8;

integer i;

demux dm (.din(t_din),
 .sel(t_sel),
 .dout1(t_dout1),
 .dout2(t_dout2),
 .dout3(t_dout3),
 .dout4(t_dout4),
 .dout5(t_dout5),
 .dout6(t_dout6),
 .dout7(t_dout7),
 .dout8(t_dout8)
);

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