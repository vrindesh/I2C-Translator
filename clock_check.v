`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2025 04:44:19 PM
// Design Name: 
// Module Name: clock_check
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


module clock_check(input clk,rst , output reg c1,c2,
output reg [3:0]count  );


always@(posedge clk)
begin
if(rst)
begin
count=0;
c1=0;
c2=0; 
end
if(count==3)
count<=0;
else
count<=count+1;
end


always@(posedge clk)
begin
if(count==2||count==3)
c1<=~c1;
end

always@(negedge clk)
begin
if(count==0||count==2)
begin
c2<=~c2;
end

end









endmodule
