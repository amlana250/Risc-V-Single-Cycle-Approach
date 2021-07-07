module controller (PCsel1,PCsel0,ALUsrc,enPC,done,opr,immsrc,memtoreg1,memtoreg0,read_mem,write_mem,enW,lorbtype,alu_action,opcode,start,clk,zero);
  input clk,start,zero;
  input [6:0] opcode;
  input [2:0] lorbtype;
  input [3:0] alu_action;
  output reg PCsel1,PCsel0,enPC,done;
  output reg [4:0] opr;
  output reg [2:0] immsrc;
  output reg ALUsrc,memtoreg1,memtoreg0,read_mem,write_mem,enW;
  reg [4:0] state=5'dx;
  parameter rtype=7'b0110011, ijalrtype=7'b1100111, itype=7'b0010011, imemtype=7'b0000011, stype=7'b0100011, ultype=7'b0110111, uatype=7'b0010111, jtype=7'b1101111, btype=7'b1100011;
  parameter S0=5'd0, S1=5'd1, S2=5'd2, S3=5'd3, S4=5'd4, S5=5'd5, S6=5'd6, S7=5'd7, S8=5'd8, S9=5'd9, S10=5'd10;
  always @ ( posedge clk ) begin
    case (state)
      S0: if(start&&opcode) state=S2;
      S1: if(opcode) state=S2;
      S2: state=S3;
      S3: if (opcode==btype) begin state=S4; end
          else if(opcode==jtype) state=S5;
          else if(opcode==ijalrtype) state=S6;
          else state=S7;
      S4: state=S8;
      S5: state=S8;
      S6: state=S8;
      S7: state=S8;
      S8: state=S1;
      default: state=S0;
    endcase
  end
  always @ ( state ) begin
    case (state)
      S0: begin enPC=1'b1; PCsel1=1'b1; PCsel0=1'b1; done=1'b0; end //initial setup
      S1: begin enPC=1'b0; done=1'b0; end //pc on common step
      S2: begin
            if(opcode==rtype)
            begin
              immsrc=3'dx;
              ALUsrc=1'b0;
              enW=1'b1;
              memtoreg1=1'b0; memtoreg0=1'b0;
              read_mem=1'b0;
              write_mem=1'b0;
              case (alu_action)
                4'b0000: opr=5'd0;
                4'b1000: opr=5'd1;
                4'b0001: opr=5'd8;
                4'b0010: opr=5'd11;
                4'b0011: opr=5'd5;
                4'b0100: opr=5'd4;
                4'b0101: opr=5'd9;
                4'b1101: opr=5'd10;
                4'b0110: opr=5'd3;
                4'b0111: opr=5'd2;
              endcase
            end
            else if(opcode==itype) begin
              ALUsrc=1'b1;
              enW=1'b1;
              memtoreg1=1'b0; memtoreg0=1'b0;
              read_mem=1'b0;
              write_mem=1'b0;
              case (alu_action)
                4'b0000|4'b1000: begin immsrc=3'd2; opr=5'd0; end
                4'b0010|4'b1010: begin immsrc=3'd2; opr=5'd11; end
                4'b0011|4'b1011: begin immsrc=3'd2; opr=5'd5; end
                4'b0100|4'b1100: begin immsrc=3'd2; opr=5'd4; end
                4'b0110|4'b1110: begin immsrc=3'd2; opr=5'd3; end
                4'b0111|4'b1111: begin immsrc=3'd2; opr=5'd2; end
                4'b0001: begin immsrc=3'd3; opr=5'd8; end //slli
                4'b0101: begin immsrc=3'd3; opr=5'd9; end //srli
                4'b1101: begin immsrc=3'd3; opr=5'd10; end //srai
              endcase
            end
            else if(opcode==imemtype) begin
              immsrc=3'd4;
              ALUsrc=1'b1;
              read_mem=1'b1;
              write_mem=1'b0;
              opr=5'd0;
              enW=1'b1;
              memtoreg1=1'b0; memtoreg0=1'b1;
            end
            else if(opcode==stype) begin
              immsrc=3'd5;
              ALUsrc=1'b1;
              enW=1'b0;
              opr=5'd0;
              read_mem=1'b0;
              write_mem=1'b1;
              memtoreg1=1'bx; memtoreg0=1'bx;
            end
            else if(opcode==btype) begin
              immsrc=3'd6;
              ALUsrc=1'b0;
              enW=1'b0;
              read_mem=1'b0;
              write_mem=1'b0;
              memtoreg1=1'bx; memtoreg0=1'bx;
              case (lorbtype)
                3'd0: opr=5'd1;
                3'd1: opr=5'd1;
                3'd4: opr=5'd11;
                3'd5: opr=5'd11;
                3'd6: opr=5'd5;
                3'd7: opr=5'd5;
              endcase
            end
            else if(opcode==jtype) begin
              immsrc=3'd1;
              ALUsrc=1'b1;
              enW=1'b1;
              memtoreg1=1'b1; memtoreg0=1'b1;
              read_mem=1'b0;
              write_mem=1'b0;
              opr=5'dx;
            end
            else if(opcode==ijalrtype) begin
              immsrc=3'd4;
              ALUsrc=1'b1;
              read_mem=1'b0;
              write_mem=1'b0;
              enW=1'b1;
              opr=5'd0;
              memtoreg1=1'b1; memtoreg0=1'b1;
            end
            else if(opcode==ultype) begin
              immsrc=3'd0;
              ALUsrc=1'b1;
              enW=1'b1;
              read_mem=1'b0;
              write_mem=1'b0;
              memtoreg1=1'b0; memtoreg0=1'b0;
              opr=5'd0;
            end
            else if(opcode==uatype) begin
              immsrc=3'd0;
              ALUsrc=1'b1;
              enW=1'b1;
              read_mem=1'b0;
              write_mem=1'b0;
              opr=5'dx;
              memtoreg1=1'b1; memtoreg0=1'b0;
            end
          end

      S3: begin enPC=1'b0; end
      S4: begin enPC=1'b1;
          case (lorbtype)
            3'd0: begin if(zero) begin PCsel1=1'b0; PCsel0=1'b1; end
                        else begin PCsel1=1'b0; PCsel0=1'b0; end
                  end
            3'd1: begin if(!zero) begin PCsel1=1'b0; PCsel0=1'b1; end
                        else begin PCsel1=1'b0; PCsel0=1'b0; end
                  end
            3'd4: begin if(zero) begin PCsel1=1'b0; PCsel0=1'b1; end
                        else begin PCsel1=1'b0; PCsel0=1'b0; end
                  end
            3'd5: begin if(!zero) begin PCsel1=1'b0; PCsel0=1'b1; end
                        else begin PCsel1=1'b0; PCsel0=1'b0; end
                  end
            3'd6: begin if(zero) begin PCsel1=1'b0; PCsel0=1'b1; end
                        else begin PCsel1=1'b0; PCsel0=1'b0; end
                  end
            3'd7: begin if(!zero) begin PCsel1=1'b0; PCsel0=1'b1; end
                        else begin PCsel1=1'b0; PCsel0=1'b0; end
                  end
          endcase
          end
      S5: begin enPC=1'b1; PCsel1=1'b0; PCsel0=1'b1; end
      S6: begin enPC=1'b1; PCsel1=1'b1; PCsel0=1'b0; end
      S7: begin enPC=1'b1; PCsel1=1'b0; PCsel0=1'b0; end
      S8: begin enPC=1'b0; done=1'b1; end
      default: begin enPC=1'bx; end
    endcase
  end
endmodule
