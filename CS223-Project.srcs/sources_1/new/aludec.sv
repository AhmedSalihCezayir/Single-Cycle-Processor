`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2020 21:09:42
// Design Name: 
// Module Name: aludec
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
module aludec(input logic [1:0] aluop,
              input logic needalu,
              output logic [2:0] alucontrol);
              
    always_comb
        if (needalu == 0)
            alucontrol = 3'bxxx;
        else 
        begin
            case(aluop)
                2'b00: alucontrol = 3'b010;
                2'b01: alucontrol = 3'b011;
                default: alucontrol = 3'bxxx;
            endcase
        end              
endmodule
