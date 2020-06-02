`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Universidad Tecnologica de Pereira
// Engineer: Carlos Eduardo Hincapie Lopez
// 
// Create Date: 29.05.2020 18:51:26
// Design Name: Procesador Monociclo Modulo TOP
// Module Name: ProcesadorTOP
// Project Name: Procesador Monociclo
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ProcesadorTOP(
        input clk,
        input [7:0]switches,
        output logic [7:0]LEDs);
        
        logic [1:0]RegFlag;//
        logic [1:0]RegFlagIn;//
        
        logic [63:0]PCInput;
        logic [63:0]PCOutput;
        logic [31:0]Instruccion;
        
        logic [3:0]Cond;
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
        
        logic [4:0]RegWr; //Input RegisterFile
        logic [4:0]RegRd2;
        
        logic [63:0]DataWr;//Dato para guardar
        logic [63:0]RegsRn;//Salida 1
        logic [63:0]RegsRm;//Salida 2
        
        logic  [63:0] SEUOut;
        
        logic [63:0]B;
        logic [63:0]C;
       
       logic [63:0]Salida_LeSw;
       logic [63:0]SumOut1;
        logic [63:0]SumOut2;
       
        ProgramCounter PC(.clk(clk), .PCInput(PCInput), .PCOutput(PCOutput));
        
        InstructionMemory IM(.Direccion(PCOutput), .Instruccion(Instruccion));
        
        ControlUnit CU(.Cond(Instruccion[3:0]), .OpCode(Instruccion[31:21]), .FlagsR(RegFlag), .FlagsZ(RegFlagIn[0]), 
        .PCSrc(PCSrc), .DMWr(DMWr), .DMRd(DMRd), .RFDataWrScr(RFDataWrScr), .ALUOp(ALUOp), .ALUBScr(ALUBScr), 
        .SEUScr(SEUScr), .RFWr(RFWr), .RegWrSrc(RegWrSrc), .FlagsWr(FlagsWr), .RegRd2Src(RegRd2Src));
        
        assign RegWr=(RegWrSrc==0)? Instruccion[4:0]: 30;
        assign RegRd2=(RegRd2Src==0)? Instruccion[20:16]: Instruccion[4:0];
        
        RegisterFile RF (.clk(clk), .RdReg1(Instruccion[9:5]), .RdReg2(RegRd2), .RdReg3(RegWr), .DataWr(DataWr), 
        .RFWr(RFWr), .RegsRn(RegsRn), .RegsRm(RegsRm)); 
        
        SignExtensionUnit SEU (.Inst25(Instruccion[25:0]), .SEUSrc(SEUScr), .SEUOut(SEUOut));
        
        assign B=(ALUBScr==0)? RegsRm: SEUOut;
        
        ALU ALU(.A(RegsRn), .B(B), .ALUOp(ALUOp), .shamt(Instruccion[15:10]), .Flags(RegFlagIn), .C(C));
        
        always@(posedge clk) begin
            if (FlagsWr==1) 
                RegFlag=RegFlagIn;
            else
                RegFlag=RegFlag;
        end
        
        
        DataMemory DM(.clk(clk), .Direccion(C), .DataWr(RegsRm), .DMWr(DMWr), .DMRd(DMRd), .Swi(switches), .MuxSel(C[17:16]),
        .Salida_LeSw(Salida_LeSw), .Led(LEDs));
        
        
        assign SumOut1=PCOutput+4;
        assign SumOut2=PCOutput+SEUOut;
        
        always_comb begin
        case(RFDataWrScr)
            0: DataWr=C;
            1: DataWr=Salida_LeSw;
            2: DataWr=SumOut1;
            default: DataWr=C;
        endcase
        case(PCSrc)
            0: PCInput=SumOut1;
            1: PCInput=SumOut2;
            2: PCInput=RegsRm;
            default PCInput=SumOut1;
        endcase
        end
        
        
        
        
        
         
endmodule
