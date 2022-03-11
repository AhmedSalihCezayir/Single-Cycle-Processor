`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2020 19:42:17
// Design Name: 
// Module Name: top
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
module top(input logic clk, 
            input logic [4:0] buttons,
            input logic [15:0] switch,
            output logic [6:0] seg,
            output logic dp,
            output logic [3:0] an,
            output logic [15:0] inst);
            
    logic memwrite, regwrite, writeEnable, zero, branch, halt, writeEnable2;    
    logic [3:0] address;  
    logic [7:0] data1;  
    logic [3:0] readAddress2 = 4'b0000;
    logic [5:0] curr = 5'b0;
    logic [7:0] readData1_M;
    logic [7:0] readData2_M;  
    logic [15:0] finalInst;          
    logic buttonPrev, buttonNext, buttonReset, buttonExeSw, buttonExeInst, buttonReset2;
    
    debounce b4(clk, buttons[4], buttonExeSw);
    debounce b3(clk, buttons[3], buttonReset);
    debounce b2(clk, buttons[2], buttonPrev);
    debounce b1(clk, buttons[1], buttonExeInst);
    debounce b0(clk, buttons[0], buttonNext);
    
    mux2#(16) instmux(switch, inst, buttonExeSw, finalInst);
    AND3 andGate1(memwrite, buttonExeSw, buttonExeInst, writeEnable);
    mux2#(1) haltmux(1'b0, writeEnable, halt, writeEnable2);
    mux2#(1) haltmux2(1'b0, buttonReset, halt, buttonReset2);
    
    datamem mem(clk, writeEnable2, buttonReset2, finalInst[3:0], readAddress2, address, data1, readData1_M, readData2_M);
    mips mips(clk, buttonReset2, buttonExeSw, buttonExeInst, finalInst, readData1_M, data1, memwrite, regwrite, address, zero, branch, halt);      
    instmem im(curr, inst, nextInst);
    
    SevSeg_4digit sevSeg(clk, readAddress2, 4'b1111, readData2_M[7:4], readData2_M[3:0], seg, dp, an);
    
    always_ff@(posedge clk)
    begin
        if (!halt)
        begin
            if (buttonPrev)
            readAddress2 <= readAddress2 - 1;
        else if (buttonNext)
            readAddress2 <= readAddress2 + 1;
        else if (buttonExeInst == 1 && branch != 1)
                curr <= curr + 1;
                
        if (branch == 1 && zero == 1)
            if (buttonExeSw)
                curr <= inst[12:8];
            else if (buttonExeInst)
                curr <= inst[12:8];
                
        if (branch == 1 && zero == 0)
            if (buttonExeSw)
                curr <= curr + 1;
            else if (buttonExeInst)
                curr <= curr + 1;  
        end
    else 
        curr <= 31;
    end
                                

endmodule
