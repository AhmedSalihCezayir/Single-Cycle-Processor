`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2020 18:59:30
// Design Name: 
// Module Name: datamem
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
module datamem(input logic clk, writeEnable, reset,
               input logic [3:0] readAddress1, readAddress2, writeAddress,
               input logic [7:0] writeData,
               output logic [7:0] readData1, readData2);
               
    logic [7:0] dMem [15:0] = '{8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0};
         
    always_ff@(posedge clk)
        if(writeEnable)
            dMem[writeAddress] <= writeData;
        else if(reset)
            begin
                for (int i = 0; i < 16; i++)
                    dMem[i][7:0] <= 8'b00000000;
            end         
            
    assign readData1 = dMem[readAddress1];
    assign readData2 = dMem[readAddress2];      
endmodule
