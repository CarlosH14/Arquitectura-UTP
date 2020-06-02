module RegisterFile(input clk,
                    input [4:0]RdReg1,//Rn
                    input [4:0]RdReg2,//Rm
                    input [4:0]RdReg3,//Rd
                    input [63:0]DataWr,//Dato para guardar
                    input RFWr,//Señal de control
                    output logic [63:0]RegsRn,//Salida 1
                    output logic [63:0]RegsRm);//Salida 2
  logic [63:0] Registros [31:0];
  initial begin
    $readmemb("C:/Users/carlo/Desktop/ProcesadorMC/ProcesadorMonociclo/RegistrosT.txt",Registros);
  end
  always@(posedge clk)
    begin
      if((RFWr == 1)&&(RdReg3!= 31))
        Registros[RdReg3] <= DataWr;
    end
  always@(*)
    begin
      RegsRn = Registros[RdReg1];
      RegsRm = Registros[RdReg2];
    end
endmodule
