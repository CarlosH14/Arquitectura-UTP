module ControlUnit(
            input [3:0]Cond,
            input [10:0]OpCode,
            input [1:0]FlagsR,
            input FlagsZ,
            output logic [1:0]PCSrc,
            output logic DMWr,
            output logic DMRd,
            output logic [1:0]RFDataWrScr,
            output logic [3:0]ALUOp,
            output logic ALUBScr,
            output logic [1:0]SEUScr,
            output logic RFWr,
            output logic RegWrSrc,
            output logic FlagsWr,
            output logic RegRd2Src
    );
    
    always_comb
        begin 
        casex(OpCode)  
            11'b10001011000:    begin //ADD
                                    PCSrc=0;
                                    DMWr=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=0;
                                    ALUBScr=0;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end
            11'b11001011000:    begin //SUB
                                    PCSrc=0;
                                    DMWr=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=1;
                                    ALUBScr=0;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end
            11'b10001010000:    begin //AND
                                    PCSrc=0;
                                    DMWr=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=2;
                                    ALUBScr=0;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end
            11'b10101010000:    begin //OR
                                    DMWr=0;
                                    PCSrc=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=3;
                                    ALUBScr=0;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end    
            11'b11001010000:    begin //EOR
                                    DMWr=0;
                                    PCSrc=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=4;
                                    ALUBScr=0;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end  
            /*11'b0000000000:    begin //NOR
                                    DMWr=0;
                                    PCSrc=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=5;
                                    ALUBScr=0;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end */ 
            11'b11010011011:    begin //LSL
                                    DMWr=0;
                                    PCSrc=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=6;
                                    ALUBScr=0;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end      
            11'b11010011010:    begin //LSR
                                    DMWr=0;
                                    PCSrc=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=7;
                                    ALUBScr=0;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end 
            11'b1001000100x:    begin //ADDI
                                    DMWr=0;
                                    PCSrc=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=0;
                                    ALUBScr=1;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end  
            11'b1101000100x:    begin //SUBI
                                    DMWr=0;
                                    PCSrc=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=1;
                                    ALUBScr=1;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end   
            11'b1001001000x:    begin //ANDI
                                    DMWr=0;
                                    PCSrc=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=2;
                                    ALUBScr=1;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end 
            11'b1011001000x:    begin //ORI
                                    DMWr=0;
                                    PCSrc=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=3;
                                    ALUBScr=1;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end  
            11'b1101001000x:    begin //EORI
                                    DMWr=0;
                                    PCSrc=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=4;
                                    ALUBScr=1;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end  
            11'b11111000010:    begin //LDUR
                                    DMWr=0;
                                    PCSrc=0;
                                    DMRd=1;
                                    RFDataWrScr=1;
                                    ALUOp=0;
                                    ALUBScr=1;
                                    SEUScr=1;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=1;
                                end
            11'b11111000000:    begin //STUR
                                    DMWr=1;
                                    PCSrc=0;
                                    DMRd=0;
                                    RFDataWrScr=1;
                                    ALUOp=0;
                                    ALUBScr=1;
                                    SEUScr=1;
                                    RFWr=0;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=1;
                                end  
           11'b000101xxxxx:    begin //B
                                    PCSrc=1;
                                    DMWr=0;
                                    DMRd=0;
                                    RFDataWrScr=2;
                                    ALUOp=8;
                                    ALUBScr=0;
                                    SEUScr=2;
                                    RFWr=0;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end 
            11'b100101xxxxx:    begin //BL
                                    PCSrc=1;
                                    DMWr=0;
                                    DMRd=0;
                                    RFDataWrScr=2;
                                    ALUOp=8;
                                    ALUBScr=0;
                                    SEUScr=2;
                                    RFWr=1;
                                    RegWrSrc=1;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end   
            11'b10110100xxx:    begin //CBZ
                                    if(FlagsZ==1)  
                                        PCSrc=1; 
                                    else 
                                        PCSrc=0;
                                    DMWr=0;
                                    DMRd=0;
                                    RFDataWrScr=2;
                                    ALUOp=8;
                                    ALUBScr=1;
                                    SEUScr=3;
                                    RFWr=0;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=1;
                                end 
            11'b10110101xxx:    begin //CBNZ
                                    if(FlagsZ==0)  
                                        PCSrc=1; 
                                    else 
                                        PCSrc=0;
                                    DMWr=0;
                                    DMRd=0;
                                    RFDataWrScr=2;
                                    ALUOp=8;
                                    ALUBScr=1;
                                    SEUScr=3;
                                    RFWr=0;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=1;
                                end 
            11'b10110101xxx:    begin //B.cond
                                   case (Cond)
                                                4'b0000: if (FlagsR[0] == 0) // EQ
                                                    PCSrc = 1;
                                                else
                                                    PCSrc = 0;
                                                4'b0001: if (FlagsR[0] == 1) // NE
                                                    PCSrc = 1;
                                                else
                                                    PCSrc = 0;
                                                4'b1011: if ((FlagsR[0] == 0) & (FlagsR[1] == 1)) // LT
                                                    PCSrc = 1;
                                                else
                                                    PCSrc = 0;
                                                4'b1101: if ((FlagsR[0] == 1) | (FlagsR[1] == 1)) // LE
                                                    PCSrc = 1;
                                                else
                                                    PCSrc = 0;
                                                4'b1101: if ((FlagsR[0] == 0) & (FlagsR[1] == 0)) // GT
                                                    PCSrc = 1;
                                                else
                                                    PCSrc = 0;
                                                4'b1101: if ((FlagsR[0] == 1) | (FlagsR[1] == 0)) // GE
                                                    PCSrc = 1;
                                        else
                                                    PCSrc = 0;
                                                default:
                                                    PCSrc = 0;
                                    endcase
           
                                    DMWr=0;
                                    DMRd=0;
                                    RFDataWrScr=2;
                                    ALUOp=8;
                                    ALUBScr=0;
                                    SEUScr=2;
                                    RFWr=0;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end 
            /////////////////////////////////////////////////////////
            11'b10101011000:    begin //ADDS
                                    PCSrc=0;
                                    DMWr=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=0;
                                    ALUBScr=0;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=1;
                                    RegRd2Src=0;
                                end
            11'b11101011000:    begin //SUBs
                                    PCSrc=0;
                                    DMWr=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=1;
                                    ALUBScr=0;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=1;
                                    RegRd2Src=0;
                                end
            11'b11101010000:    begin //ANDs
                                    PCSrc=0;
                                    DMWr=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=2;
                                    ALUBScr=0;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=1;
                                    RegRd2Src=0;
                                end
            11'b1011000100x:    begin //ADDIs
                                    DMWr=0;
                                    PCSrc=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=0;
                                    ALUBScr=1;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=1;
                                    RegRd2Src=0;
                                end  
            11'b1111000100x:    begin //SUBIs
                                    DMWr=0;
                                    PCSrc=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=1;
                                    ALUBScr=1;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=1;
                                    RegRd2Src=0;
                                end   
            11'b1111001000x:    begin //ANDIs
                                    DMWr=0;
                                    PCSrc=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=2;
                                    ALUBScr=1;
                                    SEUScr=0;
                                    RFWr=1;
                                    RegWrSrc=0;
                                    FlagsWr=1;
                                    RegRd2Src=0;
                                end 
            default:            begin //Default
                                    DMWr=0;
                                    DMRd=0;
                                    RFDataWrScr=0;
                                    ALUOp=0;
                                    ALUBScr=0;
                                    SEUScr=0;
                                    RFWr=0;
                                    RegWrSrc=0;
                                    FlagsWr=0;
                                    RegRd2Src=0;
                                end   
           endcase
           end
endmodule
