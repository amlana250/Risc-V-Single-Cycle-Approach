module pc_regr (out,pcin,clk,enW);
  output reg [31:0] out;
  input clk,enW;
  input [31:0] pcin;
  reg [31:0] temp=32'b0;
  always @ ( posedge clk ) begin
    if(enW) out=pcin;
  end
endmodule
