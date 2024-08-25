`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2024 21:06:52
// Design Name: 
// Module Name: ROM14
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


module ROM14( output reg [31:0]out0_dum,out1_dum,out2_dum,out3_dum,
             input x0,x1,x2,x3,x4,x5,x6,x7
                );
wire select0 = x0^x1;
wire select1 = x2^x3;
wire select2 = x4^x5;
wire select3 = x6^x7;


always @(*)
begin
    case(select0)//1,w^6
        
        1: out0_dum = 32'b1_1111111111_110110101000001010000;
        
        0: out0_dum = 32'b1_1111111111_001001010111110110000;
        
    endcase
end

always @(*)//w^4,w^6
begin
    case(select1)
        
        0: out1_dum = 32'b0_0000000000_010110101000001010000;//0.3535533959
        
        1: out1_dum = 32'b1_1111111111_101001010111110110000;//-0.3535533959
        
    endcase
end

always @(*)//w^8,w^10
begin
    case(select2)
        
        0: out2_dum = 32'b0_0000000000_110110101000001010000;//0.85255339059
        
        1: out2_dum = 32'b0_0000000000_001001010111110110000;//0.14644660941
        
    endcase
end


always @(*)//w^12,w^14
begin
    case(select3)
        
        0: out3_dum = 32'b1_1111111111_101001010111110110000;//-0.3535533959
        
        1: out3_dum = 32'b0_0000000000_010110101000001010000;//0.3535533959
        
    endcase
end

endmodule

