`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 12:48:35
// Design Name: 
// Module Name: Rom4_imag
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


module Rom4_imag( output reg [31:0]out0_dum,out1_dum,
             input s14,s15,s12,s11
                );
wire select0 = s14^s15;
wire select1 = s12^s11;
always @(*)
begin
    case(select0)
        
        0: out0_dum = 32'b1_1111111111_100000000000000000000;
        
        1: out0_dum = 32'b0_0000000000_100000000000000000000;
        
    endcase
end

always @(*)
begin
    case(select1)
        
        0: out1_dum = 32'b0_0000000000_100000000000000000000;
        
        1: out1_dum = 32'b1_1111111111_100000000000000000000;
        
    endcase
end
endmodule
