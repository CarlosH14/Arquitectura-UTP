`timescale 1ns / 1ps
module DataMemory_TF;
    logic clk=0;
    logic [63:0] Direccion;
    logic [63:0] DataWr;
    logic DMWr;
    logic DMRd;
    logic [7:0] Swi;
    logic [1:0] MuxSel;
    logic [63:0] Salida_LeSw;
    logic [7:0] Led;
    
    DataMemory uut(
    .clk(clk),
    .Direccion(Direccion),
    .DataWr(DataWr),
    .DMWr(DMWr),
    .DMRd(DMRd),
    .Swi(Swi),
    .MuxSel(MuxSel),
    .Salida_LeSw(Salida_LeSw),
    .Led(Led)
    );
    
    always #50 clk=~clk;
    
    initial begin
		Direccion=64'b00000111110100000;
        DataWr=64'b1;
        DMWr=1;
        DMRd=0;
        Swi=0;
        MuxSel=0;
		#100;
		Direccion=64'b00000111110100000;
        DataWr=64'b0;
        DMWr=0;
        DMRd=1;
        Swi=0;
        MuxSel=0;
		#100;
	end
    
endmodule
