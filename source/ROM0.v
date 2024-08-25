`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2024 02:17:50
// Design Name: 
// Module Name: ROM0
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


module ROM0( output reg [31:0]out0_dum,
             input s1,s2
                );

wire select = s1^s2;

always @(*)
begin
    case(select)
        
        0: out0_dum = 32'b1_1111111111_000000000000000000000;
        
        1: out0_dum = 32'd0;
        
    endcase
end
endmodule
