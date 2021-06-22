module insr_tb ();
  wire [6:0] opcode;
  wire [2:0] lorbtype;
  wire [4:0] opr;
  wire [3:0] alu_action;
  reg clk,start;
  reg [31:0] initialize;

  datapath DP (opcode,lorbtype,alu_action,zero,initialize,clk,PCsel1,PCsel0,enPC,ALUsrc,enx12,enx20,shamt,memtoreg1,memtoreg0,read_mem,write_mem,enW,opr);
  insr_controller INC (PCsel1,PCsel0,ALUsrc,enPC,done,opr, enx12,enx20,shamt,memtoreg1,memtoreg0,read_mem,write_mem,enW,lorbtype,alu_action,opcode,start,clk,zero);
  always #1 clk=~clk;
  initial begin
    initialize=32'b0;
    clk=1'b0; start=1'b1;
    #1000 $finish;
  end
  initial begin
     $monitor($time," %b %b %b %b %b %b",opcode,opr,lorbtype,alu_action,start,clk);
  end
endmodule
