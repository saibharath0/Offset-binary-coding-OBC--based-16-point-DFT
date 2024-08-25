`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2024 03:27:25
// Design Name: 
// Module Name: ROM1_FINAL
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


module ROM1_FINAL( output [31:0]romout,
                   input x10,x11,x12,x13,x14,x15,x16,x17,
                         x18,x19,x1_10,x1_11,x1_12,x1_13,x1_14,x1_15,i
                    );
wire [31:0]out0_dum,out1_dum,out2_dum,out3_dum,out4_dum,out5_dum,out6_dum,out7_dum;
reg [31:0]out_dum0,out_dum1,out_dum2,out_dum3,out_dum4,out_dum5,out_dum6,out_dum7;

wire s1,s2,s3,s4,s5,s6,s7,s8;

assign s1 = i^x1_14;
assign s2 = i^x1_12;
assign s3 = i^x1_10;
assign s4 = i^x18;
assign s5 = i^x16;
assign s6 = i^x14;
assign s7 = i^x12;
assign s8 = i^x10;

ROM1 rom1( out0_dum,out1_dum,out2_dum,out3_dum,out4_dum,out5_dum,out6_dum,out7_dum,
            x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x1_10,x1_11,x1_12,x1_13,x1_14,x1_15 );

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
