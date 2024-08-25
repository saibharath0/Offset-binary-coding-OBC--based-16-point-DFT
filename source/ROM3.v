`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2024 20:40:35
// Design Name: 
// Module Name: ROM3
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


module ROM3( output reg [31:0]out0_dum,out1_dum,out2_dum,out3_dum,out4_dum,out5_dum,out6_dum,out7_dum,
             input x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15
                );
wire select0 = x0^x1;
wire select1 = x2^x3;
wire select2 = x4^x5;
wire select3 = x6^x7;
wire select4 = x8^x9;
wire select5 = x10^x11;
wire select6 = x12^x13;
wire select7 = x14^x15;

always @(*)
begin
    case(select0)//1,w^3
        
        0: out0_dum = 32'b1_1111111111_010011110000010001000;
        
        1: out0_dum = 32'b1_1111111111_101100001111101111000;
        
    endcase
end

always @(*)//w^6,w^9
begin
    case(select1)
        
        0: out1_dum = 32'b0_0000000000_110100001100010000110;
        
        1: out1_dum = 32'b1_1111111111_111001000100000011010;
        
    endcase
end

always @(*)//w^12,w^15
begin
    case(select2)
        
        0: out2_dum = 32'b1_1111111111_100010011011111001010;
        
        1: out2_dum = 32'b0_0000000000_011101100100000110110;
        
    endcase
end

always @(*)//w^2,w^5
begin
    case(select3)
        
        0: out3_dum = 32'b1_1111111111_110101100111100101010;
        
        1: out3_dum = 32'b1_1111111111_011101001000000111000;
        
    endcase
end

always @(*)//w^8,w^11
begin
    case(select4)
        
        0: out4_dum = 32'b0_0000000000_101100001111101111000;
        
        1: out4_dum = 32'b0_0000000000_010011110000010001000;
        
    endcase
end

always @(*)//w14^w1
begin
    case(select5)
        
        0: out5_dum = 32'b1_1111111111_001011110011101111010;
        
        1: out5_dum = 32'b0_00000000000_000110111011111100110;
        
    endcase
end

always @(*)//w^4,w^7
begin
    case(select6)
        
        0: out6_dum = 32'b0_0000000000_011101100100000110110;
        
        1: out6_dum = 32'b1_1111111111_100010011011111001010;
        
    endcase
end

always @(*)//w^10,w^13
begin
    case(select7)
        
        0: out7_dum = 32'b0_0000000000_001010011000011010110;
        
        1: out7_dum = 32'b0_0000000000_100010110111111001000;
        
    endcase
end
endmodule