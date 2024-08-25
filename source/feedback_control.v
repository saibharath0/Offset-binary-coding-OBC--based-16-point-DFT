`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2024 18:01:34
// Design Name: 
// Module Name: feedback_control
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


module feedback_control( output reg [31:0]feedback,
                         input [3:0]i,k,
                         input [31:0]result
                           );
                           
always @(*)
begin
    if(k == 0 && i == 0) feedback = 32'b1_1111111000_000000000000000000000;
    else if(i == 0) feedback = 0;
    else feedback = $signed(result)>>>1;  
end
endmodule
