`timescale 1ns / 1ps
module SignExtensionUnit_TF;
logic [25:0] Inst25;
logic [1:0] SEUSrc;
logic [63:0] SEUOut;

SignExtensionUnit uut(
.Inst25(Inst25), .SEUSrc(SEUSrc), .SEUOut(SEUOut)
);

 
  initial begin
    Inst25=26'b11111111111111000000000000;
    SEUSrc=1;
  end


endmodule
