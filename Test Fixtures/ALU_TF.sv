`timescale 1ns / 1ps
module ALU_TF;
logic [63:0]A;
logic [63:0]B;
logic [3:0] ALUOp;
logic [5:0]shamt;
logic [1:0]Flags;
logic [63:0]C;

ALU uut(.A(A), .B(B), .ALUOp(ALUOp), .shamt(shamt), .Flags(Flags), .C(C)
);

initial begin
    A=1;
    B=1;
    ALUOp=0;
    shamt=0;
end
endmodule
