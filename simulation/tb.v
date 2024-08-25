`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2024 04:14:59
// Design Name: 
// Module Name: tb
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


module tb( );

wire [31:0]real_value,imag_value;
reg [7:0]in;
reg clk,rst;
            
DFT dft(real_value,imag_value,in, clk,rst );

initial 
begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin
    rst = 1;
    #100 rst = 0;
    in = 8'b1_010_0000;
    #20
    in = 8'b0_001_0000;
    #20
    in = 8'b1_111_1111;
    #20
    in = 8'b0_011_0100;
    #20
    in = 8'b0_000_0000;
    #20
    in = 8'b1_100_0000;
    #20
    in = 8'b0_111_0100;
    #20
    in = 8'b0_010_0001;
    #20
    in = 8'b1_101_0000;
    #20
    in = 8'b0_110_0100;
    #20
    in = 8'b1_101_0000;
    #20
    in = 8'b1_010_0101;
    #20
    in = 8'b0_100_0000;
    #20
    in = 8'b0_001_0100;
    #20
    in = 8'b1_010_0000;
    #20
    in = 8'b0_011_1100; 
end
endmodule
