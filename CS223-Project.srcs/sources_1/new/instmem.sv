`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2020 19:10:50
// Design Name: 
// Module Name: instmem
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
module instmem(input logic [31:0] address,
               output logic [15:0] readData,
               output logic [15:0] nextReadData);
               
    logic [15:0] mem [31:0];
    
    assign mem[0] = 16'b001_0_0000_0000_0000;
    assign mem[1] = 16'b001_0_0000_0001_0001; 
    assign mem[2] = 16'b001_1_0010_00000000; 
    assign mem[3] = 16'b001_1_0011_00000000; 
    assign mem[4] = 16'b001_1_0100_00000001;
    assign mem[5] = 16'b101_01001_0010_0001; 
    assign mem[6] = 16'b010_0_0011_0011_0000; 
    assign mem[7] = 16'b010_0_0010_0010_0100;
    assign mem[8] = 16'b101_00101_0000_0000;
    assign mem[9] = 16'b000_0_0000_0011_0011; 
    assign mem[10] = 16'b0; 
    assign mem[11] = 16'b0; 
    assign mem[12] = 16'b0;
    assign mem[13] = 16'b0; 
    assign mem[14] = 16'b0; 
    assign mem[15] = 16'b0;
    assign mem[16] = 16'b0;
    assign mem[17] = 16'b0; 
    assign mem[18] = 16'b0; 
    assign mem[19] = 16'b0; 
    assign mem[20] = 16'b0;
    assign mem[21] = 16'b0; 
    assign mem[22] = 16'b0; 
    assign mem[23] = 16'b0;
    assign mem[24] = 16'b0;
    assign mem[25] = 16'b0; 
    assign mem[26] = 16'b0; 
    assign mem[27] = 16'b0; 
    assign mem[28] = 16'b0;
    assign mem[29] = 16'b0; 
    assign mem[30] = 16'b0; 
    assign mem[31] = 16'b1110000000000000; 
                                     
    assign readData = mem[address]; 
    assign nextReadData = mem[address + 1];                               
endmodule
