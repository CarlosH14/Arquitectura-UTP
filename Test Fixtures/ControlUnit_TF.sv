`timescale 1ns / 1ps
module ControlUnit_TF;
    logic [3:0]Cond;
    logic [10:0]OpCode;
    logic [1:0]FlagsR;
    logic FlagsZ;
    logic [1:0]PCSrc;
    logic DMWr;
    logic DMRd;
    logic [1:0]RFDataWrScr;
    logic [3:0]ALUOp;
    logic ALUBScr;
    logic [1:0]SEUScr;
    logic RFWr;
    logic RegWrSrc;
    logic FlagsWr;
    logic RegRd2Src;
    
    ControlUnit uut (
		.Cond(Cond),
        .OpCode(OpCode),
        .FlagsR(FlagsR),
        .FlagsZ(FlagsZ),
        .PCSrc(PCSrc),
        .DMWr(DMWr),
        .DMRd(DMRd),
        .RFDataWrScr(RFDataWrScr),
        .ALUOp(ALUOp),
        .ALUBScr(ALUBScr),
        .SEUScr(SEUScr),
        .RFWr(RFWr),
        .RegWrSrc(RegWrSrc),
        .FlagsWr(FlagsWr),
        .RegRd2Src(RegRd2Src)
	);
	
	initial begin
		Cond=4'b0000;
        OpCode=11'b11110010000;
        FlagsR=2;
        FlagsZ=0;
		#50;
	end
endmodule
