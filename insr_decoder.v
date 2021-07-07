module insr_decoder (rd,rs1,rs2,opcode,immd20,immd12,lorbtype,alu_action,format,clk);
  output reg [11:0] immd12;
  output reg [19:0] immd20;
  output reg [4:0] rd,rs1,rs2;
  output reg [6:0] opcode;
  output reg [2:0] lorbtype;
  output reg [3:0] alu_action;
  input [31:0] format;
  input clk;
  parameter rtype=7'b0110011, ijalrtype=7'b1100111, itype=7'b0010011, imemtype=7'b0000011, stype=7'b0100011, ultype=7'b0110111, uatype=7'b0010111, jtype=7'b1101111, btype=7'b1100011;
  always @ ( posedge clk ) begin
    opcode=format[6:0];
    immd12=12'dx;
    immd20=20'dx;
    lorbtype=3'dx;
    rs1=5'dx;
    rs2=5'dx;
    rd=5'dx;
    alu_action=4'dx;
    case (opcode)
      rtype: begin
              rd=format[11:7];
              rs1=format[19:15];
              rs2=format[24:20];
              alu_action={format[30],format[14:12]};
             end
      itype: begin
              rd=format[11:7];
              rs1=format[19:15];
              immd12=format[31:20];
              alu_action={format[30],format[14:12]};
             end
      imemtype:  begin
                  rd=format[11:7];
                  rs1=format[19:15];
                  immd12=format[31:20];
                  lorbtype=format[14:12];
                end
      stype: begin
              rs1=format[19:15];
              rs2=format[24:20];
              immd12={format[31:25],format[11:7]};
              lorbtype=format[14:12];
            end
      btype: begin
              rs1=format[19:15];
              rs2=format[24:20];
              immd12={format[31:25],format[11:7]};
              lorbtype=format[14:12];
             end
      ultype: begin
                rd=format[11:7];
                immd20=format[31:12];
                rs1=5'd0;
             end
      uatype: begin
                rd=format[11:7];
                immd20=format[31:12];
              end
      jtype:  begin
                rd=format[11:7];
                immd20=format[31:12];
              end
    ijalrtype: begin
                  rd=format[11:7];
                  rs1=format[19:15];
                  immd12=format[24:20];
                end
      default:  begin
                rd=5'dx;
                rs1=5'dx;
                rs2=5'dx;
                opcode=7'dx;
                immd20=20'dx;
                immd12=12'dx;
                alu_action=4'dx;
                lorbtype=3'dx;
                end
    endcase
  end
endmodule
