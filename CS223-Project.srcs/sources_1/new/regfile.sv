`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2020 18:35:17
// Design Name: 
// Module Name: regfile
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
module regfile(input logic clk, writeEnable, reset,
               input logic [3:0] readAddress1, readAddress2, writeAddress,
               input logic [7:0] writeData,
               output logic [7:0] readData1, readData2);
               
    logic [7:0] rFile [15:0] = '{8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0,8'b0};
         
    always_ff@(posedge clk)
        if(writeEnable)
            rFile[writeAddress] <= writeData;
        else if (reset)
            begin
                for (int i = 0; i < 16; i++)
                    rFile[i][7:0] <= 8'b00000000;
            end 
            
    assign readData1 = rFile[readAddress1];
    assign readData2 = rFile[readAddress2];      
endmodule
