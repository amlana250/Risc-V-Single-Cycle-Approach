module immediate_gen_unit (out,inx20,inx12,clk,enx20,enx12,shamt,opcode);
  output reg [31:0] out;
  input [19:0] inx20;
  input [11:0] inx12;
  input [6:0] opcode;
  input clk,enx20,enx12,shamt;
  parameter jtype=7'b1101111, itype=7'b0010011, imemtype=7'b0000011, shamttype=7'b0010011, stype=7'b0100011, btype=7'b1100011, ultype=7'b0010111, uatype=7'b0110111, ijalrtype=7'b1100111;

  always @ ( posedge clk ) begin
    case (opcode)
      ultype: if(enx20) out={inx20,12'b0}; //ultype
      uatype: if(enx20) out={inx20,12'b0}; //uatype
      jtype: if(enx20) out={{12{inx20[19]}},inx20[7:0],inx20[8],inx20[18:9],1'b0}; //jtype
      itype: begin  //itype
              if(enx12) out={{20{inx12[11]}},inx12[11:0]};
              else if(shamt) out={{27{inx12[11]}},inx12[4:0]};
             end
      imemtype: if(enx12) out={{20{inx12[11]}},inx12[11:0]};  //imemtype
      ijalrtype: if(enx12) out={{20{inx12[11]}},inx12[11:0]}; //ijalrtype
      stype: if(enx12) out={{20{inx12[11]}},inx12[11:5],inx12[4:0]};  //stype
      btype: if(enx12) out={{20{inx12[11]}},inx12[0],inx12[10:5],inx12[4:1],1'b0}; //btype
      default: out=32'bx;
    endcase
  end
endmodule
