`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2020 18:26:43
// Design Name: 
// Module Name: maindec
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
module maindec(input logic [3:0] op,
               output logic memwrite, regwrite, imm, branch, inwrite, halt,
               output logic needalu,
               output logic[1:0] aluop);

    logic [8:0] controls;
    
    assign {memwrite, regwrite, imm, branch, inwrite, halt, needalu, aluop} = controls;
    
    always_comb
        case(op)
            4'b0000: controls <= 9'b100000000; // Store value 0
            4'b0001: controls <= 9'b101000000; // Store value 1
            4'b0010: controls <= 9'b010000000; //Load value 0
            4'b0011: controls <= 9'b011000000; //Load value 1
            4'b0100: controls <= 9'b010000100; //Add
            4'b0101: controls <= 9'b010000100; //Add
            4'b1010: controls <= 9'b000110101; //Branch
            4'b1011: controls <= 9'b000110101; //Branch
            4'b1110: controls <= 9'b000001000; //Halt
            4'b1111: controls <= 9'b000001000; //Halt
            default: controls <= 9'bxxxxxxxx; //Illegal op
        endcase
endmodule
