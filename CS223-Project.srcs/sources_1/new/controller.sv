`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2020 22:01:09
// Design Name: 
// Module Name: controller
// Project Name: 
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
module controller(input logic [3:0] opcode,
                  output logic memwrite, regwrite, imm, branch, inwrite, halt,
                  output logic needalu,
                  output logic[2:0] alucontrol);
                  
    logic [1:0] aluop;
    
    maindec md(opcode, memwrite, regwrite, imm, branch, inwrite, halt, needalu, aluop);  
    
    aludec ad(aluop, needalu, alucontrol);
                    
endmodule
