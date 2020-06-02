`timescale 1ns / 1ps
module InstructionMemory_TF;
logic [63:0]Direccion;
logic [31:0]Instruccion;

InstructionMemory uut(.Direccion(Direccion), .Instruccion(Instruccion));

initial begin
    Direccion=0;
end
endmodule
