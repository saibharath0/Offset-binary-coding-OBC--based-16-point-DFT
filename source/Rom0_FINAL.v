`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2024 02:27:30
// Design Name: 
// Module Name: Rom0_FINAL
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


module Rom0_FINAL( output [31:0]romout,
                   input x00,x01,x02,x03,x04,x05,x06,x07,
                         x08,x09,x010,x011,x012,x013,x014,x015,i
    );
    
wire [31:0]out0_dum,out1_dum,out2_dum,out3_dum,out4_dum,out5_dum,out6_dum,out7_dum;
reg [31:0]out_dum0,out_dum1,out_dum2,out_dum3,out_dum4,out_dum5,out_dum6,out_dum7;

wire s1,s2,s3,s4,s5,s6,s7,s8;

assign s1 = i^x014;
assign s2 = i^x012;
assign s3 = i^x010;
assign s4 = i^x08;
assign s5 = i^x06;
assign s6 = i^x04;
assign s7 = i^x02;
assign s8 = i^x00;

ROM0 R00( out0_dum,x00,x01);
ROM0 R01( out1_dum,x02,x03);
ROM0 R02( out2_dum,x04,x05);
ROM0 R03( out3_dum,x06,x07);
ROM0 R04( out4_dum,x08,x09);
ROM0 R05( out5_dum,x010,x011);
ROM0 R06( out6_dum,x012,x013);
ROM0 R07( out7_dum,x014,x015);

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
