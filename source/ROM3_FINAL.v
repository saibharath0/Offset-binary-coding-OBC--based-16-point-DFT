`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2024 03:31:08
// Design Name: 
// Module Name: ROM3_FINAL
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


module ROM3_FINAL( output [31:0]romout,
                   input x30,x31,x32,x33,x34,x35,x36,x37,
                         x38,x39,x310,x311,x312,x313,x314,x315,i
    );
wire [31:0]out0_dum,out1_dum,out2_dum,out3_dum,out4_dum,out5_dum,out6_dum,out7_dum;
reg [31:0]out_dum0,out_dum1,out_dum2,out_dum3,out_dum4,out_dum5,out_dum6,out_dum7;
wire s1,s2,s3,s4,s5,s6,s7,s8;

assign s1 = i^x314;
assign s2 = i^x312;
assign s3 = i^x310;
assign s4 = i^x38;
assign s5 = i^x36;
assign s6 = i^x34;
assign s7 = i^x32;
assign s8 = i^x30;

ROM3 rom1( out0_dum,out1_dum,out2_dum,out3_dum,out4_dum,out5_dum,out6_dum,out7_dum,
            x30,x31,x32,x33,x34,x35,x36,x37,x38,x39,x310,x311,x312,x313,x314,x315 );

always @(*)
begin

    if(s8 == 0) out_dum0 = out0_dum;
    else out_dum0 = ~out0_dum + 1;
    
    if(s7 == 0) out_dum1 = out1_dum;
    else out_dum1 = ~out1_dum + 1;
    
    if(s6 == 0) out_dum2 = out2_dum;
    else out_dum2 = ~out2_dum + 1;
    
    if(s5 == 0) out_dum3 = out3_dum;
    else out_dum3 = ~out3_dum + 1;
    
    if(s4 == 0) out_dum4 = out4_dum;
    else out_dum4 = ~out4_dum + 1;
    
    if(s3 == 0) out_dum5 = out5_dum;
    else out_dum5 = ~out5_dum + 1;
    
    if(s2 == 0) out_dum6 = out6_dum;
    else out_dum6 = ~out6_dum + 1;
    
    if(s1 == 0) out_dum7 = out7_dum;
    else out_dum7 = ~out7_dum + 1;
end

assign romout = out_dum0 + out_dum1 + out_dum2 + out_dum3 + out_dum4 + out_dum5 + out_dum6 + out_dum7;
endmodule
