module datapath (opcode,lorbtype,alu_action,zero,initialize,clk,PCsel1,PCsel0,enPC,ALUsrc,immsrc,memtoreg1,memtoreg0,read_mem,write_mem,enW,opr);
  output [6:0] opcode;
  output [2:0] lorbtype;
  output [3:0] alu_action;
  output zero;
  input clk;
  input [31:0] initialize;
  input PCsel1,PCsel0,enPC,ALUsrc,memtoreg1,memtoreg0,read_mem,write_mem,enW;
  input [4:0] opr;
  input [2:0] immsrc;
  wire [31:0] ALUresult;
  wire [31:0] pcin;
  wire [19:0] immd20;
  wire [11:0] immd12;
  wire [31:0] address;
  wire [31:0] format;
  wire [4:0] rd,rs1,rs2;
  wire [31:0] readout1,readout2,aluin2,immdout,toregfile,data_out,plus4,pcjumpout;

  //Instruction Fetch
  pc_regr pc_regr (address,pcin,clk,enPC);
  instruction_memory IM (format,address);
  adder pcincrement (plus4,address,32'd4);
  adder pcjump (pcjumpout,address,immdout);
  //Instruction Decode
  insr_decoder IND (rd,rs1,rs2,opcode,immd20,immd12,lorbtype,alu_action,format,clk);
  //Instruction Execute
  mux_4x1 pcmux (pcin,plus4,pcjumpout,ALUresult,initialize,PCsel1,PCsel0);
  regr_file RGF (readout1,readout2,rs1,rs2,rd,toregfile,clk,enW);
  immediate_gen_unit IGU (immdout,immd20,immd12,clk,immsrc);
  mux_2x1 muxALU (aluin2,readout2,immdout,ALUsrc);
  alu ALU (ALUresult,zero,readout1,aluin2,opr);
  //Memory Read/Write
  data_memory DM (data_out,readout2,ALUresult,ALUresult,clk,write_mem,read_mem,lorbtype);
  //Write Back
  mux_4x1 memreg (toregfile,ALUresult,data_out,pcjumpout,plus4,memtoreg1,memtoreg0);
endmodule
