`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2024 17:30:26
// Design Name: 
// Module Name: DFT
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


module DFT( output reg [31:0]real_value,
            output [31:0]imag_value,
            input [7:0]in,
            input clk,rst
            );
            
reg [3:0]i,j,k;
reg [7:0]x[15:0];

reg x_r0,x_r1,x_r2,x_r3,x_r4,x_r5,x_r6,x_r7,x_r8,x_r9,x_r10,x_r11,x_r12,x_r13,x_r14,x_r15;
reg x_i0,x_i1,x_i2,x_i3,x_i4,x_i5,x_i6,x_i7,x_i8,x_i9,x_i10,x_i11,x_i12,x_i13,x_i14,x_i15;

reg [31:0]rom;
wire [31:0]result,feedback;

reg [31:0]romi;
wire [31:0]resulti,feedbacki;

reg [31:0]imag_value_dum;

assign imag_value = ~imag_value_dum+1;

reg [31:0] in_r1,in_r2;

reg [31:0] in_i1,in_i2;

parameter s0 = 0,s1 = 1,s2 = 2,s3 = 3,s4 = 4,s5 = 5;
reg [3:0]state,nxt_state;

reg x00,x01,x02,x03,x04,x05,x06,x07,x08,x09,x010,x011,x012,x013,x014,x015;
wire [31:0]rom0;

reg x10, x11,x12,x13,x14,x15,x16,x17,x18,x19,x1_10,x1_11,x1_12,x1_13,x1_14,x1_15;
wire [31:0]rom1;

reg x20, x21,x22,x23,x24,x25,x26,x27,x28,x29,x210,x211,x212,x213,x214,x215;
wire [31:0]rom2;

reg x30, x31,x32,x33,x34,x35,x36,x37,x38,x39,x310,x311,x312,x313,x314,x315;
wire [31:0]rom3;

reg x40, x41,x42,x43,x44,x45,x46,x47,x48,x49,x410,x411,x412,x413,x414,x415;
wire [31:0]rom4;

reg x50, x51,x52,x53,x54,x55,x56,x57,x58,x59,x510,x511,x512,x513,x514,x515;
wire [31:0]rom5;

reg x60, x61,x62,x63,x64,x65,x66,x67,x68,x69,x610,x611,x612,x613,x614,x615;
wire [31:0]rom6;

reg x70, x71,x72,x73,x74,x75,x76,x77,x78,x79,x710,x711,x712,x713,x714,x715;
wire [31:0]rom7;

reg x80, x81,x82,x83,x84,x85,x86,x87,x88,x89,x810,x811,x812,x813,x814,x815;
wire [31:0]rom8;

reg x90, x91,x92,x93,x94,x95,x96,x97,x98,x99,x910,x911,x912,x913,x914,x915;
wire [31:0]rom9;

reg x100, x101,x102,x103,x104,x105,x106,x107,x108,x109,x1010,x1011,x1012,x1013,x1014,x1015;
wire [31:0]rom10;

reg x110, x111,x112,x113,x114,x115,x116,x117,x118,x119,x1110,x1111,x1112,x1113,x1114,x1115;
wire [31:0]rom11;

reg x120, x121,x122,x123,x124,x125,x126,x127,x128,x129,x1210,x1211,x1212,x1213,x1214,x1215;
wire [31:0]rom12;

reg x130, x131,x132,x133,x134,x135,x136,x137,x138,x139,x1310,x1311,x1312,x1313,x1314,x1315;
wire [31:0]rom13;

reg x140, x141,x142,x143,x144,x145,x146,x147,x148,x149,x1410,x1411,x1412,x1413,x1414,x1415;
wire [31:0]rom14;

reg x150, x151,x152,x153,x154,x155,x156,x157,x158,x159,x1510,x1511,x1512,x1513,x1514,x1515;
wire [31:0]rom15;


reg xi10, xi11,xi12,xi13,xi14,xi15,xi16,xi17,xi18,xi19,xi1_10,xi1_11,xi1_12,xi1_13,xi1_14,xi1_15;
wire [31:0]romi1;

reg xi20, xi21,xi22,xi23,xi24,xi25,xi26,xi27,xi28,xi29,xi210,xi211,xi212,xi213,xi214,xi215;
wire [31:0]romi2;

reg xi30, xi31,xi32,xi33,xi34,xi35,xi36,xi37,xi38,xi39,xi310,xi311,xi312,xi313,xi314,xi315;
wire [31:0]romi3;

reg xi40, xi41,xi42,xi43,xi44,xi45,xi46,xi47,xi48,xi49,xi410,xi411,xi412,xi413,xi414,xi415;
wire [31:0]romi4;

reg xi50, xi51,xi52,xi53,xi54,xi55,xi56,xi57,xi58,xi59,xi510,xi511,xi512,xi513,xi514,xi515;
wire [31:0]romi5;

reg xi60, xi61,xi62,xi63,xi64,xi65,xi66,xi67,xi68,xi69,xi610,xi611,xi612,xi613,xi614,xi615;
wire [31:0]romi6;

reg xi70, xi71,xi72,xi73,xi74,xi75,xi76,xi77,xi78,xi79,xi710,xi711,xi712,xi713,xi714,xi715;
wire [31:0]romi7;


reg xi90, xi91,xi92,xi93,xi94,xi95,xi96,xi97,xi98,xi99,xi910,xi911,xi912,xi913,xi914,xi915;
wire [31:0]romi9;

reg xi100, xi101,xi102,xi103,xi104,xi105,xi106,xi107,xi108,xi109,xi1010,xi1011,xi1012,xi1013,xi1014,xi1015;
wire [31:0]romi10;

reg xi110, xi111,xi112,xi113,xi114,xi115,xi116,xi117,xi118,xi119,xi1110,xi1111,xi1112,xi1113,xi1114,xi1115;
wire [31:0]romi11;

reg xi120, xi121,xi122,xi123,xi124,xi125,xi126,xi127,xi128,xi129,xi1210,xi1211,xi1212,xi1213,xi1214,xi1215;
wire [31:0]romi12;

reg xi130, xi131,xi132,xi133,xi134,xi135,xi136,xi137,xi138,xi139,xi1310,xi1311,xi1312,xi1313,xi1314,xi1315;
wire [31:0]romi13;

reg xi140, xi141,xi142,xi143,xi144,xi145,xi146,xi147,xi148,xi149,xi1410,xi1411,xi1412,xi1413,xi1414,xi1415;
wire [31:0]romi14;

reg xi150, xi151,xi152,xi153,xi154,xi155,xi156,xi157,xi158,xi159,xi1510,xi1511,xi1512,xi1513,xi1514,xi1515;
wire [31:0]romi15;

reg m;

add_shift add_shiftby2( result,in_r1,in_r2 );
feedback_control feedback_ctrl( feedback,i,k,result);     
        
add_shift add_shiftby2i( resulti,in_i1,in_i2 );
feedback_control feedback_ctrli( feedbacki,i,k,resulti); 

Rom0_FINAL  memory0( rom0,x00,x01,x02,x03,x04,x05,x06,x07,x08,x09,x010,x011,x012,x013,x014,x015,m );
ROM1_FINAL  memory1( rom1,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x1_10,x1_11,x1_12,x1_13,x1_14,x1_15,m );
ROM2_FINAL  memory2( rom2,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x210,x211,x212,x213,x214,x215,m );
ROM3_FINAL  memory3( rom3,x30,x31,x32,x33,x34,x35,x36,x37,x38,x39,x310,x311,x312,x313,x314,x315,m );
ROM4_FINAL  memory4( rom4,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x410,x411,x412,x413,x414,x415,m );
ROM5_FINAL  memory5( rom5,x50,x51,x52,x53,x54,x55,x56,x57,x58,x59,x510,x511,x512,x513,x514,x515,m );
ROM6_FINAL  memory6( rom6,x60,x61,x62,x63,x64,x65,x66,x67,x68,x69,x610,x611,x612,x613,x614,x615,m );
ROM7_FINAL  memory7( rom7,x70,x71,x72,x73,x74,x75,x76,x77,x78,x79,x710,x711,x712,x713,x714,x715,m );
ROM8_FINAL  memory8( rom8,x80,x81,x82,x83,x84,x85,x86,x87,x88,x89,x810,x811,x812,x813,x814,x815,m );
ROM9_FINAL  memory9( rom9,x90,x91,x92,x93,x94,x95,x96,x97,x98,x99,x910,x911,x912,x913,x914,x915,m );
ROM10_FINAL  memory10( rom10,x100,x101,x102,x103,x104,x105,x106,x107,x108,x109,x1010,x1011,x1012,x1013,x1014,x1015,m );
ROM11_FINAL  memory11( rom11,x110,x111,x112,x113,x114,x115,x116,x117,x118,x119,x1110,x1111,x1112,x1113,x1114,x1115,m );
ROM12_FINAL  memory12( rom12,x120,x121,x122,x123,x124,x125,x126,x127,x128,x129,x1210,x1211,x1212,x1213,x1214,x1215,m );
ROM13_FINAL  memory13( rom13,x130,x131,x132,x133,x134,x135,x136,x137,x138,x139,x1310,x1311,x1312,x1313,x1314,x1315,m );
ROM14_FINAL  memory14( rom14,x140,x141,x142,x143,x144,x145,x146,x147,x148,x149,x1410,x1411,x1412,x1413,x1414,x1415,m );
ROM15_FINAL  memory15( rom15,x150,x151,x152,x153,x154,x155,x156,x157,x158,x159,x1510,x1511,x1512,x1513,x1514,x1515,m );

ROM1_FINAL_I  memory_i_1( romi1,xi10,xi11,xi12,xi13,xi14,xi15,xi16,xi17,xi18,xi19,xi1_10,xi1_11,xi1_12,xi1_13,xi1_14,xi1_15,m );
ROM2_FINAL_I  memory_i_2( romi2,xi20,xi21,xi22,xi23,xi24,xi25,xi26,xi27,xi28,xi29,xi210,xi211,xi212,xi213,xi214,xi215,m );
ROM3_FINAL_I  memory_i_3( romi3,xi30,xi31,xi32,xi33,xi34,xi35,xi36,xi37,xi38,xi39,xi310,xi311,xi312,xi313,xi314,xi315,m );
ROM4_FINAL_I  memory_i_4( romi4,xi40,xi41,xi42,xi43,xi44,xi45,xi46,xi47,xi48,xi49,xi410,xi411,xi412,xi413,xi414,xi415,m );
ROM5_FINAL_I  memory_i_5( romi5,xi50,xi51,xi52,xi53,xi54,xi55,xi56,xi57,xi58,xi59,xi510,xi511,xi512,xi513,xi514,xi515,m );
ROM6_FINAL_I  memory_i_6( romi6,xi60,xi61,xi62,xi63,xi64,xi65,xi66,xi67,xi68,xi69,xi610,xi611,xi612,xi613,xi614,xi615,m );
ROM_7_FINAL_I  memory_i_7( romi7,xi70,xi71,xi72,xi73,xi74,xi75,xi76,xi77,xi78,xi79,xi710,xi711,xi712,xi713,xi714,xi715,m );
ROM9_FINAL_I  memory_i_9( romi9,xi90,xi91,xi92,xi93,xi94,xi95,xi96,xi97,xi98,xi99,xi910,xi911,xi912,xi913,xi914,xi915,m );
ROM10_FINAL_I  memory_i_10( romi10,xi100,xi101,xi102,xi103,xi104,xi105,xi106,xi107,xi108,xi109,xi1010,xi1011,xi1012,xi1013,xi1014,xi1015,m );
ROM11_FINAL_I  memory_i_11( romi11,xi110,xi111,xi112,xi113,xi114,xi115,xi116,xi117,xi118,xi119,xi1110,xi1111,xi1112,xi1113,xi1114,xi1115,m );
ROM12_FINAL_I  memory_i_12( romi12,xi120,xi121,xi122,xi123,xi124,xi125,xi126,xi127,xi128,xi129,xi1210,xi1211,xi1212,xi1213,xi1214,xi1215,m );
ROM13_FINAL_I  memory_i_13( romi13,xi130,xi131,xi132,xi133,xi134,xi135,xi136,xi137,xi138,xi139,xi1310,xi1311,xi1312,xi1313,xi1314,xi1315,m );
ROM14_FINAL_I  memory_i_14( romi14,xi140,xi141,xi142,xi143,xi144,xi145,xi146,xi147,xi148,xi149,xi1410,xi1411,xi1412,xi1413,xi1414,xi1415,m );
ROM15_FINAL_I  memory_i_15( romi15,xi150,xi151,xi152,xi153,xi154,xi155,xi156,xi157,xi158,xi159,xi1510,xi1511,x1512,x1513,x1514,x1515,m );

     
always @(*)
begin
    case(k)
    
        5'd0: begin
              x00 = x_r0 ; x01 = x_r1; x02 = x_r2; x03 = x_r3;
              x04 = x_r4; x05 = x_r5; x06 = x_r6; x07 = x_r7;
              x08 = x_r8; x09 = x_r9; x010 = x_r10; x011 = x_r11;
              x012 = x_r12; x013 = x_r13; x014 = x_r14; x015 = x_r15;
              
              rom = rom0;
              end
        
        5'd1: begin
              x10 = x_r0 ; x11 = x_r1; x12 = x_r2; x13 = x_r3;
              x14 = x_r4; x15 = x_r5; x16 = x_r6; x17 = x_r7;
              x18 = x_r8; x19 = x_r9; x1_10 = x_r10; x1_11 = x_r11;
              x1_12 = x_r12; x1_13 = x_r13; x1_14 = x_r14; x1_15 = x_r15;
              
              rom = rom1;
              end
        
        5'd2: begin
              x20 = x_r0 ; x21 = x_r1; x22 = x_r2; x23 = x_r3;
              x24 = x_r4; x25 = x_r5; x26 = x_r6; x27 = x_r7;
              x28 = x_r8; x29 = x_r9; x210 = x_r10; x211 = x_r11;
              x212 = x_r12; x213 = x_r13; x214 = x_r14; x215 = x_r15;
              
              rom = rom2;
              end
        
        5'd3: begin
              x30 = x_r0 ; x31 = x_r1; x32 = x_r2; x33 = x_r3;
              x34 = x_r4; x35 = x_r5; x36 = x_r6; x37 = x_r7;
              x38 = x_r8; x39 = x_r9; x310 = x_r10; x311 = x_r11;
              x312 = x_r12; x313 = x_r13; x314 = x_r14; x315 = x_r15;
              
              rom = rom3;
              end
        
        5'd4: begin
              x40 = x_r0 ; x41 = x_r1; x42 = x_r2; x43 = x_r3;
              x44 = x_r4; x45 = x_r5; x46 = x_r6; x47 = x_r7;
              x48 = x_r8; x49 = x_r9; x410 = x_r10; x411 = x_r11;
              x412 = x_r12; x413 = x_r13; x414 = x_r14; x415 = x_r15;
              
              rom = rom4;
              end
        
        5'd5: begin
              x50 = x_r0 ; x51 = x_r1; x52 = x_r2; x53 = x_r3;
              x54 = x_r4; x55 = x_r5; x56 = x_r6; x57 = x_r7;
              x58 = x_r8; x59 = x_r9; x510 = x_r10; x511 = x_r11;
              x512 = x_r12; x513 = x_r13; x514 = x_r14; x515 = x_r15;
              
              rom = rom5;
              end
        
        5'd6: begin
              x60 = x_r0 ; x61 = x_r1; x62 = x_r2; x63 = x_r3;
              x64 = x_r4; x65 = x_r5; x66 = x_r6; x67 = x_r7;
              x68 = x_r8; x69 = x_r9; x610 = x_r10; x611 = x_r11;
              x612 = x_r12; x613 = x_r13; x614 = x_r14; x615 = x_r15;
              
              rom = rom6;
              end
        
        5'd7: begin
              x70 = x_r0 ; x71 = x_r1; x72 = x_r2; x73 = x_r3;
              x74 = x_r4; x75 = x_r5; x76 = x_r6; x77 = x_r7;
              x78 = x_r8; x79 = x_r9; x710 = x_r10; x711 = x_r11;
              x712 = x_r12; x713 = x_r13; x714 = x_r14; x715 = x_r15;
              
              rom = rom7;
              end
        
        5'd8: begin
              x80 = x_r0 ; x81 = x_r1; x82 = x_r2; x83 = x_r3;
              x84 = x_r4; x85 = x_r5; x86 = x_r6; x87 = x_r7;
              x88 = x_r8; x89 = x_r9; x810 = x_r10; x811 = x_r11;
              x812 = x_r12; x813 = x_r13; x814 = x_r14; x815 = x_r15;
              
              rom = rom8;
              end
        
        5'd9: begin
              x90 = x_r0 ; x91 = x_r1; x92 = x_r2; x93 = x_r3;
              x94 = x_r4; x95 = x_r5; x96 = x_r6; x97 = x_r7;
              x98 = x_r8; x99 = x_r9; x910 = x_r10; x911 = x_r11;
              x912 = x_r12; x913 = x_r13; x914 = x_r14; x915 = x_r15;
              
              rom = rom9;
              end
        
        5'd10: begin
              x100 = x_r0 ; x101 = x_r1; x102 = x_r2; x103 = x_r3;
              x104 = x_r4; x105 = x_r5; x106 = x_r6; x107 = x_r7;
              x108 = x_r8; x109 = x_r9; x1010 = x_r10; x1011 = x_r11;
              x1012 = x_r12; x1013 = x_r13; x1014 = x_r14; x1015 = x_r15;
              
              rom = rom10;
              end
        
        5'd11: begin
              x110 = x_r0 ; x111 = x_r1; x112 = x_r2; x113 = x_r3;
              x114 = x_r4; x115 = x_r5; x116 = x_r6; x117 = x_r7;
              x118 = x_r8; x119 = x_r9; x1110 = x_r10; x1111 = x_r11;
              x1112 = x_r12; x1113 = x_r13; x1114 = x_r14; x1115 = x_r15;
              
              rom = rom11;
              end
        
        5'd12: begin
              x120 = x_r0 ; x121 = x_r1; x122 = x_r2; x123 = x_r3;
              x124 = x_r4; x125 = x_r5; x126 = x_r6; x127 = x_r7;
              x128 = x_r8; x129 = x_r9; x1210 = x_r10; x1211 = x_r11;
              x1212 = x_r12; x1213 = x_r13; x1214 = x_r14; x1215 = x_r15;
              
              rom = rom12;
              end
        
        5'd13: begin
              x130 = x_r0 ; x131 = x_r1; x132 = x_r2; x133 = x_r3;
              x134 = x_r4; x135 = x_r5; x136 = x_r6; x137 = x_r7;
              x138 = x_r8; x139 = x_r9; x1310 = x_r10; x1311 = x_r11;
              x1312 = x_r12; x1313 = x_r13; x1314 = x_r14; x1315 = x_r15;
              
              rom = rom13;
              end
        
        5'd14: begin
              x140 = x_r0 ; x141 = x_r1; x142 = x_r2; x143 = x_r3;
              x144 = x_r4; x145 = x_r5; x146 = x_r6; x147 = x_r7;
              x148 = x_r8; x149 = x_r9; x1410 = x_r10; x1411 = x_r11;
              x1412 = x_r12; x1413 = x_r13; x1414 = x_r14; x1415 = x_r15;
              
              rom = rom14;
              end
        
        5'd15: begin
              x150 = x_r0 ; x151 = x_r1; x152 = x_r2; x153 = x_r3;
              x154 = x_r4; x155 = x_r5; x156 = x_r6; x157 = x_r7;
              x158 = x_r8; x159 = x_r9; x1510 = x_r10; x1511 = x_r11;
              x1512 = x_r12; x1513 = x_r13; x1514 = x_r14; x1515 = x_r15;
              
              rom = rom15;
              end
       default : rom = 0;
    endcase
end

always @(*)
begin
    case(k)
        5'd1: begin
              xi10 = x_i0 ; xi11 = x_i1; xi12 = x_i2; xi13 = x_i3;
              xi14 = x_i4; xi15 = x_i5; xi16 = x_i6; xi17 = x_i7;
              xi18 = x_i8; xi19 = x_i9; xi1_10 = x_i10; xi1_11 = x_i11;
              xi1_12 = x_i12; xi1_13 = x_i13; xi1_14 = x_i14; xi1_15 = x_i15;
              
              romi = romi1;
              end
        
        5'd2: begin
              xi20 = x_i0 ; xi21 = x_i1; xi22 = x_i2; xi23 = x_i3;
              xi24 = x_i4; xi25 = x_i5; xi26 = x_i6; xi27 = x_i7;
              xi28 = x_i8; xi29 = x_i9; xi210 = x_i10; xi211 = x_i11;
              xi212 = x_i12; xi213 = x_i13; xi214 = x_i14; xi215 = x_i15;
              
              romi = romi2;
              end
        
        5'd3: begin
              xi30 = x_i0 ; xi31 = x_i1; xi32 = x_i2; xi33 = x_i3;
              xi34 = x_i4; xi35 = x_i5; xi36 = x_i6; xi37 = x_i7;
              xi38 = x_i8; xi39 = x_i9; xi310 = x_i10; xi311 = x_i11;
              xi312 = x_i12; xi313 = x_i13; xi314 = x_i14; xi315 = x_i15;
              
              romi = romi3;
              end
        
        5'd4: begin
              xi40 = x_i0 ; xi41 = x_i1; xi42 = x_i2; xi43 = x_i3;
              xi44 = x_i4; xi45 = x_i5; xi46 = x_i6; xi47 = x_i7;
              xi48 = x_i8; xi49 = x_i9; xi410 = x_i10; xi411 = x_i11;
              xi412 = x_i12; xi413 = x_i13; xi414 = x_i14; xi415 = x_i15;
              
              romi = romi4;
              end
        
        5'd5: begin
              xi50 = x_i0 ; xi51 = x_i1; xi52 = x_i2; xi53 = x_i3;
              xi54 = x_i4; xi55 = x_i5; xi56 = x_i6; xi57 = x_i7;
              xi58 = x_i8; xi59 = x_i9; xi510 = x_i10; xi511 = x_i11;
              xi512 = x_i12; xi513 = x_i13; xi514 = x_i14; xi515 = x_i15;
              
              romi = romi5;
              end
        
        5'd6: begin
              xi60 = x_i0 ; xi61 = x_i1; xi62 = x_i2; xi63 = x_i3;
              xi64 = x_i4; xi65 = x_i5; xi66 = x_i6; xi67 = x_i7;
              xi68 = x_i8; xi69 = x_i9; xi610 = x_i10; xi611 = x_i11;
              xi612 = x_i12; xi613 = x_i13; xi614 = x_i14; xi615 = x_i15;
              
              romi = romi6;
              end
        
        5'd7: begin
              xi70 = x_i0 ; xi71 = x_i1; xi72 = x_i2; xi73 = x_i3;
              xi74 = x_i4; xi75 = x_i5; xi76 = x_i6; xi77 = x_i7;
              xi78 = x_i8; xi79 = x_i9; xi710 = x_i10; xi711 = x_i11;
              xi712 = x_i12; xi713 = x_i13; xi714 = x_i14; xi715 = x_i15;
              
              romi = romi7;
              end

        5'd9: begin
              xi90 = x_i0 ; xi91 = x_i1; xi92 = x_i2; xi93 = x_i3;
              xi94 = x_i4; xi95 = x_i5; xi96 = x_i6; xi97 = x_i7;
              xi98 = x_i8; xi99 = x_i9; xi910 = x_i10; xi911 = x_i11;
              xi912 = x_i12; xi913 = x_i13; xi914 = x_i14; xi915 = x_i15;
              
              romi = romi9;
              end
        
        5'd10: begin
              xi100 = x_i0 ; xi101 = x_i1; xi102 = x_i2; xi103 = x_i3;
              xi104 = x_i4; xi105 = x_i5; xi106 = x_i6; xi107 = x_i7;
              xi108 = x_i8; xi109 = x_i9; xi1010 = x_i10; xi1011 = x_i11;
              xi1012 = x_i12; xi1013 = x_i13; xi1014 = x_i14; xi1015 = x_i15;
              
              romi = romi10;
              end
        
        5'd11: begin
              xi110 = x_i0 ; xi111 = x_i1; xi112 = x_i2; xi113 = x_i3;
              xi114 = x_i4; xi115 = x_i5; xi116 = x_i6; xi117 = x_i7;
              xi118 = x_i8; xi119 = x_i9; xi1110 = x_i10; xi1111 = x_i11;
              xi1112 = x_i12; xi1113 = x_i13; xi1114 = x_i14; xi1115 = x_i15;
              
              romi = romi11;
              end
        
        5'd12: begin
              xi120 = x_i0 ; xi121 = x_i1; xi122 = x_i2; xi123 = x_i3;
              xi124 = x_i4; xi125 = x_i5; xi126 = x_i6; xi127 = x_i7;
              xi128 = x_i8; xi129 = x_i9; xi1210 = x_i10; xi1211 = x_i11;
              xi1212 = x_i12; xi1213 = x_i13; xi1214 = x_i14; xi1215 = x_i15;
              
              romi = romi12;
              end
        
        5'd13: begin
              xi130 = x_i0 ; xi131 = x_i1; xi132 = x_i2; xi133 = x_i3;
              xi134 = x_i4; xi135 = x_i5; xi136 = x_i6; xi137 = x_i7;
              xi138 = x_i8; xi139 = x_i9; xi1310 = x_i10; xi1311 = x_i11;
              xi1312 = x_i12; xi1313 = x_i13; xi1314 = x_i14; xi1315 = x_i15;
              
              romi = romi13;
              end
        
        5'd14: begin
              xi140 = x_i0 ; xi141 = x_i1; xi142 = x_i2; xi143 = x_i3;
              xi144 = x_i4; xi145 = x_i5; xi146 = x_i6; xi147 = x_i7;
              xi148 = x_i8; xi149 = x_i9; xi1410 = x_i10; xi1411 = x_i11;
              xi1412 = x_i12; xi1413 = x_i13; xi1414 = x_i14; xi1415 = x_i15;
              
              romi = romi14;
              end
        
        5'd15: begin
              xi150 = x_i0 ; xi151 = x_i1; xi152 = x_i2; xi153 = x_i3;
              xi154 = x_i4; xi155 = x_i5; xi156 = x_i6; xi157 = x_i7;
              xi158 = x_i8; xi159 = x_i9; xi1510 = x_i10; xi1511 = x_i11;
              xi1512 = x_i12; xi1513 = x_i13; xi1514 = x_i14; xi1515 = x_i15;
              
              romi = romi15;
              end
              
        default: romi = 0;
    endcase
end


always @(posedge clk)
begin
    if(rst)
    begin
        state <= s0;
    end
    
    else
    begin
        state <= nxt_state;
        if(state == s0)
        begin
            i <= 0;
            j <= 0;
            k <= 0;
            m <= 0;
        end
        
        else if(state == s1)
        begin
            j <= j + 1;
        end
        
        else if(state == s2)
        begin
            x[j] <= in;
        end
        
        else if(state == s3)
        begin
            x_r0 <= x[0][i];x_r1 <= x[1][i];x_r2 <= x[2][i];x_r3 <= x[3][i];
            x_r4 <= x[4][i];x_r5 <= x[5][i];x_r6 <= x[6][i];x_r7 <= x[7][i];
            x_r8 <= x[8][i];x_r9 <= x[9][i];x_r10 <= x[10][i];x_r11 <= x[11][i];
            x_r12 <= x[12][i];x_r13 <= x[13][i];x_r14 <= x[14][i];x_r15 <= x[15][i];
            
            x_i0 <= x[0][i];x_i1 <= x[1][i];x_i2 <= x[2][i];x_i3 <= x[3][i];
            x_i4 <= x[4][i];x_i5 <= x[5][i];x_i6 <= x[6][i];x_i7 <= x[7][i];
            x_i8 <= x[8][i];x_i9 <= x[9][i];x_i10 <= x[10][i];x_i11 <= x[11][i];
            x_i12 <= x[12][i];x_i13 <= x[13][i];x_i14 <= x[14][i];x_i15 <= x[15][i];
            
        end
        
        else if(state == s4)
        begin
            in_r1 <= rom;
            in_r2 <= feedback;
            
            in_i1 <= romi;
            in_i2 <= feedbacki;
        end
        
        else if(state == s5)
        begin
            if(i == 6) m <= 1;
                else m <= 0;
            if(i<7 ) i<= i+1;
            else
            begin
                i <= 0;
                real_value <= result<<3;
                if(k == 0 | k == 8) imag_value_dum <= 0;
                else imag_value_dum <= resulti<<3;
                if(k<15) k <= k+1;
                else k <= 0;
            end
        end
    end
end

always @(*)
begin
    case(state)
    
        s0: nxt_state = s2;
        
        s1: nxt_state = s2;
        
        s2: if(j==15)nxt_state = s3;
            else nxt_state = s1;
            
        s3: nxt_state = s4;

        s4: nxt_state = s5;
        
        s5: nxt_state = s3;
        
        default: nxt_state = s0;

    endcase
end
endmodule
