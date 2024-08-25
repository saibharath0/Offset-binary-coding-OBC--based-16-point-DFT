`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2024 20:54:07
// Design Name: 
// Module Name: ROM8
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


module ROM8( output reg [31:0]out0_dum,
             input s14,s15
                );
wire select = s14^s15;
always @(*)
begin
    case(select)
        
        1: out0_dum = 32'b1_1111111111_000000000000000000000;
        
        0: out0_dum = 32'd0;
        
    endcase
end
endmodule
