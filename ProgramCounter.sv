module ProgramCounter(input clk,
                      input [63:0]PCInput,
                      output logic [63:0]PCOutput=0);
  always@(posedge clk)
    PCOutput <= PCInput;
endmodule