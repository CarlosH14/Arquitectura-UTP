module ALU(input [63:0]A,
           input [63:0]B,
           input [3:0] ALUOp,
           input [5:0]shamt,
           output logic [1:0]Flags,
           output logic [63:0]C);
always_comb begin
case(ALUOp)
    0: C=A+B;
    1: C=A-B;
    2: C=A&B;
    3: C=A|B;
    4: C=(A&~B)|(~A&B);
    //5: C=~A|B;
    6: C=A<<shamt;
    7: C=A>>shamt;
    default C=B;
 endcase
 
 
 if (C==0) Flags[0]=1;
 else Flags[0]=0;
 if (C<0) Flags[1]=1;
 else Flags[1]=0;
 end
 
endmodule