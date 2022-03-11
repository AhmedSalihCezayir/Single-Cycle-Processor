`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2020 20:56:42
// Design Name: 
// Module Name: alu
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
module alu(input logic [7:0] a, b,
           input logic [2:0] aluControl,
           output logic [7:0] result,
           output logic zero);
           
    always_comb
    begin
        case(aluControl)
            3'b000: result = a & b; // A AND B
            3'b001: result = a | b; // A OR B
            3'b010: result = a + b; // A + B
            3'b011: result = a - b; // A - B
            3'b100: result = a < b; 
            default: result = 8'bxxxx;
        endcase
    end
    
    assign zero = (result == 8'b0);              
endmodule
