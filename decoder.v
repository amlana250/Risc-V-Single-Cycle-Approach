module decoder (in,enrx00,enrx09,enrx18,enrx19,enrx20,enrx21,enrx22,enrx23,enrx24,enrx25,enrx26,enrx27);
  output reg enrx00,enrx09,enrx18,enrx19,enrx20,enrx21,enrx22,enrx23,enrx24,enrx25,enrx26,enrx27;
  input [4:0] in;
  always @ ( * ) begin
    case(in)
      5'd00: begin enrx00=1'b0; enrx09=1'b0; enrx18=1'b0; enrx19=1'b0; enrx20=1'b0; enrx21=1'b0; enrx22=1'b0; enrx23=1'b0; enrx24=1'b0; enrx25=1'b0; enrx26=1'b0; enrx27=1'b0; end
      5'd09: begin enrx00=1'b0; enrx09=1'b1; enrx18=1'b0; enrx19=1'b0; enrx20=1'b0; enrx21=1'b0; enrx22=1'b0; enrx23=1'b0; enrx24=1'b0; enrx25=1'b0; enrx26=1'b0; enrx27=1'b0; end
      5'd18: begin enrx00=1'b0; enrx09=1'b0; enrx18=1'b1; enrx19=1'b0; enrx20=1'b0; enrx21=1'b0; enrx22=1'b0; enrx23=1'b0; enrx24=1'b0; enrx25=1'b0; enrx26=1'b0; enrx27=1'b0; end
      5'd19: begin enrx00=1'b0; enrx09=1'b0; enrx18=1'b0; enrx19=1'b1; enrx20=1'b0; enrx21=1'b0; enrx22=1'b0; enrx23=1'b0; enrx24=1'b0; enrx25=1'b0; enrx26=1'b0; enrx27=1'b0; end
      5'd20: begin enrx00=1'b0; enrx09=1'b0; enrx18=1'b0; enrx19=1'b0; enrx20=1'b1; enrx21=1'b0; enrx22=1'b0; enrx23=1'b0; enrx24=1'b0; enrx25=1'b0; enrx26=1'b0; enrx27=1'b0; end
      5'd21: begin enrx00=1'b0; enrx09=1'b0; enrx18=1'b0; enrx19=1'b0; enrx20=1'b0; enrx21=1'b1; enrx22=1'b0; enrx23=1'b0; enrx24=1'b0; enrx25=1'b0; enrx26=1'b0; enrx27=1'b0; end
      5'd22: begin enrx00=1'b0; enrx09=1'b0; enrx18=1'b0; enrx19=1'b0; enrx20=1'b0; enrx21=1'b0; enrx22=1'b1; enrx23=1'b0; enrx24=1'b0; enrx25=1'b0; enrx26=1'b0; enrx27=1'b0; end
      5'd23: begin enrx00=1'b0; enrx09=1'b0; enrx18=1'b0; enrx19=1'b0; enrx20=1'b0; enrx21=1'b0; enrx22=1'b0; enrx23=1'b1; enrx24=1'b0; enrx25=1'b0; enrx26=1'b0; enrx27=1'b0; end
      5'd24: begin enrx00=1'b0; enrx09=1'b0; enrx18=1'b0; enrx19=1'b0; enrx20=1'b0; enrx21=1'b0; enrx22=1'b0; enrx23=1'b0; enrx24=1'b1; enrx25=1'b0; enrx26=1'b0; enrx27=1'b0; end
      5'd25: begin enrx00=1'b0; enrx09=1'b0; enrx18=1'b0; enrx19=1'b0; enrx20=1'b0; enrx21=1'b0; enrx22=1'b0; enrx23=1'b0; enrx24=1'b0; enrx25=1'b1; enrx26=1'b0; enrx27=1'b0; end
      5'd26: begin enrx00=1'b0; enrx09=1'b0; enrx18=1'b0; enrx19=1'b0; enrx20=1'b0; enrx21=1'b0; enrx22=1'b0; enrx23=1'b0; enrx24=1'b0; enrx25=1'b0; enrx26=1'b1; enrx27=1'b0; end
      5'd27: begin enrx00=1'b0; enrx09=1'b0; enrx18=1'b0; enrx19=1'b0; enrx20=1'b0; enrx21=1'b0; enrx22=1'b0; enrx23=1'b0; enrx24=1'b0; enrx25=1'b0; enrx26=1'b0; enrx27=1'b1; end
      default: begin enrx00=1'b0; enrx09=1'b0; enrx18=1'b0; enrx19=1'b0; enrx20=1'b0; enrx21=1'b0; enrx22=1'b0; enrx23=1'b0; enrx24=1'b0; enrx25=1'b0; enrx26=1'b0; enrx27=1'b0; end
    endcase
  end
endmodule
