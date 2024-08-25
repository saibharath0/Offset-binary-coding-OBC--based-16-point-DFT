`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2024 20:21:31
// Design Name: 
// Module Name: ROM1
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


module ROM1( output reg [31:0]out0_dum,out1_dum,out2_dum,out3_dum,out4_dum,out5_dum,out6_dum,out7_dum,
            input x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x1_10,x1_11,x1_12,x1_13,x1_14,x1_15 );

wire select0 = x10^x11;
wire select1 = x12^x13;
wire select2 = x14^x15;
wire select3 = x16^x17;
wire select4 = x18^x19;
wire select5 = x1_10^x1_11;
wire select6 = x1_12^x1_13;
wire select7 = x1_14^x1_15;


always @(*)//w^4,w^5
begin
    case(select0)//1,w^1
        
        1: out0_dum = 32'b1_1111111111_111101100100000110110;
        
        0: out0_dum = 32'b1_1111111111_000010011011111001010;
        
    endcase
end

always @(*)//w^2,w^3
begin
    case(select1)
        
        1: out1_dum = 32'b1_1111111111_110101100111100101010;
        
        0: out1_dum = 32'b1_1111111111_011101001000000111000;
        
    endcase
end

always @(*)//w^4,w^5
begin
    case(select2)
        
        1: out2_dum = 32'b1_1111111111_110011110000010001000;
        
        0: out2_dum = 32'b0_0000000000_001100001111101111000;
        
    endcase
end

always @(*)//w^6,w^7
begin
    case(select3)
        
        1: out3_dum = 32'b1_1111111111_111001000100000011010;
        
        0: out3_dum = 32'b0_0000000000_110100001100010000110;
        
    endcase
end

always @(*)//w^8,w^9
begin
    case(select4)
        
        1: out4_dum = 32'b0_0000000000_000010011011111001010;
        
        0: out4_dum = 32'b0_0000000000_111101100100000110110;
        
    endcase
end

always @(*)//w10^w11
begin
    case(select5)
        
        1: out5_dum = 32'b0_0000000000_001010011000011010110;
        
        0: out5_dum = 32'b0_0000000000_100010110111111001000;
        
    endcase
end

always @(*)//w^12,w^13
begin
    case(select6)
        
        1: out6_dum = 32'b0_0000000000_001100001111101111000;
        
        0: out6_dum = 32'b1_1111111111_110011110000010001000;
        
    endcase
end

always @(*)//w^14,w^15
begin
    case(select7)
        
        1: out7_dum = 32'b0_00000000000_000110111011111100110;
        
        0: out7_dum = 32'b1_1111111111_001011110011101111010;
        
    endcase
end
endmodule
