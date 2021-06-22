module regr_file (readout1,readout2,rs1,rs2,rd,in,clk,enW);
  output [31:0] readout1,readout2;
  input [4:0] rs1,rs2;
  input [4:0] rd;
  input clk,enW;
  input [31:0] in;
  wire in00,in09,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27;
  wire [31:0] out00,out09,out18,out19,out20,out21,out22,out23,out24,out25,out26,out27;
  wire enrx00,enrx09,enrx18,enrx19,enrx20,enrx21,enrx22,enrx23,enrx24,enrx25,enrx26,enrx27;

  decoder dcr (rd,in00,in09,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27);
  and and00 (enrx00,enW,in00);
  and and09 (enrx09,enW,in09);
  and and18 (enrx18,enW,in18);
  and and19 (enrx19,enW,in19);
  and and20 (enrx20,enW,in20);
  and and21 (enrx21,enW,in21);
  and and22 (enrx22,enW,in22);
  and and23 (enrx23,enW,in23);
  and and24 (enrx24,enW,in24);
  and and25 (enrx25,enW,in25);
  and and26 (enrx26,enW,in26);
  and and27 (enrx27,enW,in27);
  regr rx00 (out00,32'd0,clk,1'b1);
  regr rx09 (out09,in,clk,enrx09);
  regr rx18 (out18,in,clk,enrx18);
  regr rx19 (out19,in,clk,enrx19);
  regr rx20 (out20,in,clk,enrx20);
  regr rx21 (out21,in,clk,enrx21);
  regr rx22 (out22,in,clk,enrx22);
  regr rx23 (out23,in,clk,enrx23);
  regr rx24 (out24,in,clk,enrx24);
  regr rx25 (out25,in,clk,enrx25);
  regr rx26 (out26,in,clk,enrx26);
  regr rx27 (out27,in,clk,enrx27);
  mux_read ris1 (readout1,out00,out09,out18,out19,out20,out21,out22,out23,out24,out26,out26,out27,rs1);
  mux_read ris2 (readout2,out00,out09,out18,out19,out20,out21,out22,out23,out24,out26,out26,out27,rs2);

endmodule
