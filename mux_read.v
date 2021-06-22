module mux_read (readout,in0,in9,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,readreg);
  output reg [31:0] readout;
  input [31:0] in0,in9,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27;
  input [4:0] readreg;
  always @ ( * ) begin
    case (readreg)
      5'd00: readout=in0;  
      5'd09: readout=in9;
      5'd18: readout=in18;
      5'd19: readout=in19;
      5'd20: readout=in20;
      5'd21: readout=in21;
      5'd22: readout=in22;
      5'd23: readout=in23;
      5'd24: readout=in24;
      5'd25: readout=in25;
      5'd26: readout=in26;
      5'd27: readout=in27;

      default: ;
    endcase
  end
endmodule
