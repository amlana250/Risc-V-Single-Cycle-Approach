module regr (out,in,clk,enW);
  output reg [31:0] out;
  input clk,enW;
  input [31:0] in;
  always @ ( posedge clk ) begin
    if(enW) out=in;
  end
endmodule
