`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2024 03:41:57
// Design Name: 
// Module Name: ROM12_FINAL
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


module ROM12_FINAL( output [31:0]romout,
                   input x00,x01,x02,x03,x04,x05,x06,x07,
                         x08,x09,x010,x011,x012,x013,x014,x015,
                   input m
    );
wire [31:0]out0_dum,out1_dum,out2_dum,out3_dum,out4_dum,out5_dum,out6_dum,out7_dum;
reg [31:0]out_dum0,out_dum1,out_dum2,out_dum3,out_dum4,out_dum5,out_dum6,out_dum7;
wire s1,s2,s3,s4,s5,s6,s7,s8;

assign s1 = m^x014;
assign s2 = m^x012;
assign s3 = m^x010;
assign s4 = m^x08;
assign s5 = m^x06;
assign s6 = m^x04;
assign s7 = m^x02;
assign s8 = m^x00;

ROM12 R00( out0_dum,out1_dum,x00,x01,x02,x03);
ROM12 R01( out2_dum,out3_dum,x04,x05,x06,x07);
ROM12 R02( out4_dum,out5_dum,x08,x09,x010,x011);
ROM12 R03( out6_dum,out7_dum,x012,x013,x014,x015);


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

