module alu (out,zero,A,B,opr);
  output reg [31:0] out;
  input [31:0] A,B;
  input [4:0] opr;
  output reg zero;
  reg [31:0] dumA,dumB;
  always @ ( * ) begin
    case (opr)
      5'd0: out=A+B; //ADD
      5'd1: begin out=A-B; zero=(out==32'b0)?1:0; end //SUB
      5'd2: out=A&B; //AND
      5'd3: out=A|B; //OR
      5'd4: out=A^B; //XOR
      5'd5: begin out=(A<B)?1:0; zero=(out==32'b0)?1:0; end //SET IF B IS GREATER THAN A (SLTU)
      5'd6: out=(A==B)?1:0; //SET IF B IS EQUAL TO A (equality checker)
      5'd7: out=(A!=B)?1:0; //SET IF B IS NOT EQUAL THAN A (SLFU)
      5'd8: out=A<<B; //SLL SHIFT A by 'B' bits
      5'd9: out=A>>B; //SRL SHIFT A by 'B' bits
      5'd10: out=A>>>B; //SRA SHIFT A by 'B' bits
      5'd11:  begin //SLT
                if(A[31]==1'b1 & B[31]==1'b1) begin
                  dumA=(0-A);
                  dumB=(0-B);
                  out=(dumA<dumB)?1:0;
                end
                else if (A[31]==1'b0 & B[31]==1'b0) begin
                  out=(A<B)?1:0;
                end
                else begin
                  out=(A[31]>B[31])?1:0;
                end
                zero=(out==32'b0)?1:0;
              end
      default: out=32'bx;
    endcase

  end
endmodule
