module InstructionMemory(input [63:0]Direccion,
                         output logic [31:0]Instruccion);

  logic [7:0] InstructionesTexto[63:0];

  initial 
    $readmemb("C:/Users/carlo/Desktop/ProcesadorMC/ProcesadorMonociclo/InstruccionesM.txt" , InstructionesTexto);

  assign Instruccion = {InstructionesTexto[Direccion],
                     InstructionesTexto[Direccion + 1],
                     InstructionesTexto[Direccion + 2],
                     InstructionesTexto[Direccion + 3]};

endmodule
