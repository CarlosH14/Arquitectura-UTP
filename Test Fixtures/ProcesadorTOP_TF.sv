`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Universidad Tecnologica de Pereira
// Engineer: Carlos Eduadro Hincapie - 1010112674
// 
// Create Date: 31.05.2020 20:30:15
// Design Name: Procesador Monociclo Test Fixture
// Module Name: ProcesadorTOP_TF
// Project Name: Procesador Monociclo
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ProcesadorTOP_TF;
    logic clk=0;
    logic [7:0]switches=0;
    logic [7:0]LEDs;
    
ProcesadorTOP uut(
    .clk(clk),
    .switches(switches),
    .LEDs(LEDs));
  
  
  always #10 clk = ~clk;
 
endmodule
