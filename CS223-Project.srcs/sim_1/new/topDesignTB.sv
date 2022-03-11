`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2020 23:40:25
// Design Name: 
// Module Name: topDesignTB
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
module topDesignTB();
    logic clk;
    logic [4:0] buttons;
    logic [15:0] sw;
    logic [6:0] seg;
    logic dp;
    logic [3:0] an;
    logic [15:0] nextInst;
    
    top dut(clk, buttons, sw, seg, dp, an, nextInst);
    
    initial 
    begin
        clk = 0;
        nextInst = 16'b0;
        buttons = 5'b00001; #10;   
        buttons = 5'b00001; #10;
        buttons = 5'b00001; #10;
        buttons = 5'b00010; #10;
    end
    
    always
    begin
        clk = 1; #5;
        clk = 0; #5;
    end 
    
endmodule
