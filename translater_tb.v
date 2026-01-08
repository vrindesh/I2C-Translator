`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/06/2026 01:25:32 AM
// Design Name: 
// Module Name: translater_tb
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


module translater_tb(

    );
    
    wire sdl_master,scl_master,scl_slave,sdl_slave;
    reg clk,d_add,v_add;
    
    
  translater t1( sdl_master,scl_master,scl_slave,sdl_slave,
 clk,d_add,v_add,rst
    );
    
    
    
    
    
parameter idle = 3'b000;//0
parameter starts = 3'b001;//1
parameter addd = 3'b010;//2
parameter ack1 = 3'b011;//3
parameter dataa = 3'b100;//4
parameter ack2 = 3'b101;//5
parameter stop = 3'b110;//6
parameter s_data= 3'b111;//7 slave sending data to master 
    
    reg scl_m,sdl_m,sdl_s,scl_s,rst;
    
    assign sdl_master= (sdl_m)? 1'bZ:0;
    assign sdl_master= 1;
    
    
     assign scl_master= (scl_m)? 1'bZ:0;
    assign scl_master= 1;
    
     assign sdl_slave= (sdl_s)? 1'bZ:0;
    assign sdl_slave= 1;
    
     assign scl_slave= (scl_s)? 1'bZ:0;
    assign scl_slave= 1;
    
      initial begin 
      rst=1;
      scl_m=1;
      sdl_m=1;
      scl_s=1;
      sdl_s=1;
     
      
      end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
