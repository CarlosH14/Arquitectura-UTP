module SignExtensionUnit(
    input signed [25:0] Inst25,
    input [1:0] SEUSrc,
    output logic signed [63:0] SEUOut
    );
    
    
    
    always_comb begin
                    casex(SEUSrc)
                        0:          SEUOut=Inst25[21:10];
                        1:          SEUOut=Inst25[20:12];
                        2:          SEUOut=Inst25<<2;
                        3:          SEUOut=Inst25[20:5]<<2;
                        default:    SEUOut=0; 
                    endcase
                end
endmodule
