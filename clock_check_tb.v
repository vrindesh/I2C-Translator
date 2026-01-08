`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2025 05:26:44 PM
// Design Name: 
// Module Name: clock_check_tb
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


module clock_check_tb();
reg rst;
reg clk;
wire scl,sda;
wire [3:0]count;


clock_check t1(clk,rst ,scl,sda,count);
initial begin
clk=0;
rst=1;
#10
rst=0;



end


initial forever #5 clk=~clk;










endmodule
