`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2020 22:07:08
// Design Name: 
// Module Name: datapath
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
module datapath(input logic clk, reset, buttonExeSw, buttonExeInst,
                input logic memwrite, regwrite, imm, branch, inwrite, halt, needalu,
                input logic [7:0] readData1_M,
                input logic [15:0] instr,
                input logic [2:0] alucontrol,
                output logic [7:0] data1,
                output logic [3:0] address,
                output logic zero);       
                
    logic [3:0] readAdd1_R, readAdd2_R, readAdd1_M, readAdd2_M, addressFinal;
    logic [7:0] readData1_R, readData2_R, readData2_M, data2, data, result;
    logic writeEnable2;
    
    mux2#(4) addressmux(instr[11:8], instr[7:4], imm, address);
    mux2 datamux1(instr[7:0], readData1_R, imm, data1); 
    mux2 datamux2(instr[7:0], readData1_M, imm, data2);
    mux2 datamux3(result, data2, needalu, data);
    mux2#(4) datamux4(instr[11:8], address, needalu, addressFinal); 
    AND3 andGate2(regwrite, buttonExeSw, buttonExeInst, writeEnable2);
    
    regfile rf(clk, writeEnable2, reset, instr[3:0], instr[7:4], addressFinal, data, readData1_R, readData2_R);
    alu alu1(readData1_R, readData2_R, alucontrol, result, zero);                  
endmodule
