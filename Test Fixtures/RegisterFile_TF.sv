`timescale 1ns / 1ps
module RegisterFile_TF;
                    logic clk=0;
                    logic [4:0]RdReg1;//Rn
                    logic [4:0]RdReg2;//Rm
                    logic [4:0]RdReg3;//Rd
                    logic [63:0]DataWr;//Dato para guardar
                    logic RFWr;//Señal de control
                    logic [63:0]RegsRn;//Salida 1
                    logic [63:0]RegsRm;//Salida 2
	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.clk(clk),
		.RdReg1(RdReg1), 
		.RdReg2(RdReg2), 
		.RdReg3(RdReg3), 
		.DataWr(DataWr), 
		.RFWr(RFWr),
		.RegsRn(RegsRn), 
		.RegsRm(RegsRm)
	);
	always #20 clk=~clk;
	
	always @(posedge clk)
	begin
		RdReg1 = 5'b00001;
		RdReg2 = 5'b00010;
		RdReg3 = 5'b00011;
		DataWr = 1;
		RFWr=1;
		#50;
		RdReg1 = 5'b00011;
		RdReg2 = 5'b00011;
		RdReg3 = 5'b00000;
		DataWr = 0;
		RFWr=0;
		#50;
	end
	
      
endmodule


