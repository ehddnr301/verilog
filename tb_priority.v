module tb_priority_encoder();

reg [7:0] t_d;
wire [2:0] t_x;
wire t_v;

integer i;

priority_encoder pe0 (.d(t_d), .x(t_x), .v(t_v));

initial begin
  t_d = 8'h00;
  for (i=0; i<256; i= i+1) begin
    #5 t_d = t_d +1;
    $display("Input: %8b ouput: %d Valid: %b", i, t_x, t_v);
  end
  #5 $finish;
end

endmodule // tb_priority_encoder