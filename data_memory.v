module data_memory (data_out,value,addressR,addressW,clk,write_mem,read_mem,opcode,lorbtype);
  output reg [31:0] data_out;
  input [31:0] value;
  input [6:0] opcode;
  input [2:0] lorbtype;
  input [31:0] addressR,addressW;
  input clk,write_mem,read_mem;
  reg [31:0] store [0:511];
  reg [9:0] fucn;
  reg [31:0] temp;
  always @ ( posedge clk ) begin
    fucn={lorbtype,opcode};
    $readmemb("C:/Python_Verilog/RP_PROJECT/data_mem.txt", store);
    if(write_mem) begin
      if (fucn==10'b0000100011) temp={{24{value[7]}},value[7:0]};
      else if (fucn==10'b0010100011) temp={{16{value[15]}},value[15:0]};
      else if (fucn==10'b0100100011) temp=value;
      store[addressW]=temp;
      $writememb("C:/Python_Verilog/RP_PROJECT/data_mem.txt", store);
    end
    if(read_mem) begin
        temp=store[addressR];
        if (fucn==10'b0000000011) data_out={{24{temp[7]}},temp[7:0]};
        else if (fucn==10'b0010000011) data_out={{16{temp[15]}},temp[15:0]};
        else if (fucn==10'b0100000011) data_out=temp;
        else if (fucn==10'b1000000011) data_out={24'b0,temp[7:0]};
        else if (fucn==10'b1010000011) data_out={16'b0,temp[7:0]};
    end
  end
endmodule
