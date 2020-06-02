module DataMemory(input clk,
                  input [63:0]Direccion,
                  input [63:0]DataWr,
                  input DMWr,
                  input DMRd,
                  input [7:0]Swi,
                  input [1:0]MuxSel,
                  output logic [63:0]Salida_LeSw,
                  output logic [7:0]Led);
  logic [63:0]DataRd;
  logic [7:0] Memoria[63:0];
  logic AND1;//Posicion13 y ~Posicion 14
  logic AND2;//~Posicion 13 y ~Posicion 14


  initial
    $readmemb ("C:/Users/carlo/Desktop/ProcesadorMC/ProcesadorMonociclo/Memoria.txt",Memoria);

  assign DataRd = DMRd?{Memoria[Direccion],Memoria[Direccion + 1],Memoria[Direccion + 2],Memoria[Direccion + 3],
                        Memoria[Direccion + 4],Memoria[Direccion + 5],Memoria[Direccion + 6],Memoria[Direccion + 7]}:DataRd;//Si DMRd es 1 se asigna la direccion de la memoria.
  assign AND1 = DMWr? (Direccion[12] & (~ Direccion[13])):0; //Si DMWr es 1 se realiza el AND.
  assign AND2 = DMWr?((~ Direccion[12]) & (~ Direccion[13])):0;
  always_comb begin
  case(MuxSel)
        1:  Salida_LeSw ={{55{Led[7]}},Led};
        2:  Salida_LeSw ={{55{Swi[7]}},Swi};
        default: Salida_LeSw =DataRd;
  endcase
  end

  always@(posedge clk) //Escritura sincrona
    begin
      if(AND2 == 1)
        begin
          Memoria[Direccion] <= DataWr[63:56];
          Memoria[Direccion + 1] <= DataWr[55:48];
          Memoria[Direccion + 2] <= DataWr[47:40];
          Memoria[Direccion + 3] <= DataWr[39:32];
          Memoria[Direccion + 4] <= DataWr[31:24];
          Memoria[Direccion + 5] <= DataWr[23:16];
          Memoria[Direccion + 6] <= DataWr[15:8];
          Memoria[Direccion + 7] <= DataWr[7:0];
        end
    end
  always@(posedge clk)
    begin
      if(AND1 == 1)
        Led <= DataWr[7:0];
    end
endmodule
