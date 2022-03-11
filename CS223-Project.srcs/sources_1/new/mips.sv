`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2020 18:34:28
// Design Name: 
// Module Name: mips
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
module mips(input logic clk, reset, buttonExeSw, buttonExeInst,
            input logic [15:0] instr,
            input logic [7:0] readData1_M,
            output logic [7:0] data1,
            output logic memwrite, regwrite,
            output logic [3:0] address,
            output logic zero, branch, halt);
            
    logic imm, inwrite, needalu;
    logic [2:0] alucontrol;            
            
    controller c(instr[15:12], memwrite, regwrite, imm, branch, inwrite, halt, needalu, alucontrol);
    datapath d(clk, reset, buttonExeSw, buttonExeInst, memwrite, regwrite, imm, branch, inwrite, halt, needalu, readData1_M, instr, alucontrol, data1, address, zero);
endmodule
