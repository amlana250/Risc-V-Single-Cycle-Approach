module mux_4x1 (out,in0,in1,in2,in3,sel1,sel0);
  output [31:0] out;
  input sel1,sel0;
  input [31:0] in3,in2,in1,in0;
  assign out=sel1?(sel0?in3:in2):(sel0?in1:in0);
endmodule
