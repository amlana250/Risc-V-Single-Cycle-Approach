module immediate_gen_unit (out,inx20,inx12,clk,immsrc);
  output reg [31:0] out;
  input [19:0] inx20;
  input [11:0] inx12;
  input [2:0] immsrc;
  input clk;
  /*parameter jtype=7'b1101111, itype=7'b0010011, imemtype=7'b0000011, shamttype=7'b0010011, stype=7'b0100011, btype=7'b1100011, ultype=7'b0010111, uatype=7'b0110111, ijalrtype=7'b1100111;
  */
  always @ ( posedge clk ) begin
    case (immsrc)
      3'd0: out={inx20,12'b0}; //ultype & uatype
      3'd1: out={{12{inx20[19]}},inx20[7:0],inx20[8],inx20[18:9],1'b0}; //jtype
      3'd2: out={{20{inx12[11]}},inx12[11:0]}; //ii
      3'd3: out={{27{inx12[11]}},inx12[4:0]}; // shamttype
      3'd4: out={{20{inx12[11]}},inx12[11:0]};  //imemtype & ijalrtype
      3'd5: out={{20{inx12[11]}},inx12[11:5],inx12[4:0]};  //stype
      3'd6: out={{20{inx12[11]}},inx12[0],inx12[10:5],inx12[4:1],1'b0}; //btype
    endcase
  end
endmodule
