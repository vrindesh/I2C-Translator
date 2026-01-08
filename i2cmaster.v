`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2025 02:22:33 PM
// Design Name: 
// Module Name: i2cmaster
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



    module i2c_master(inout wand scl, sdl, 
    input clk,rst,start,
    input [7:0]data, input [7:0]add

    );
wire c1,c2;
wire [3:0]cnt;
wire scl_m;
reg sdl_m;
reg [3:0]state;
reg [3:0]count =0;
reg i2c_clk;
reg [7:0]rdata;
reg rw;
assign scl= 1;
assign sdl= 1;

assign scl=(scl_m)? 1'bZ:0;
assign sdl=(sdl_m)? 1'bZ:0;
//assign scl_m=(i2c_clk==0)? 1:~clk;

parameter idle = 3'b000;//0
parameter starts = 3'b001;//1
parameter addd = 3'b010;//2
parameter ack1 = 3'b011;//3
parameter dataa = 3'b100;//4
parameter ack2 = 3'b101;//5
parameter stop = 3'b110;//6
parameter s_data= 3'b111;//7 slave sending data to master 
clock_check c4 (clk,rst,c1,c2,cnt);

reg c=1;
assign scl_m= (c)? 1 : c1;

always@(  posedge c1 or posedge rst ) begin
    if(rst)
    c<=1;
    else 
    begin
    if ((state==idle)||(state==starts))
        c<=1;
    else if((state==addd)||(state==ack1)||(state==dataa)||(state==ack2)||(state==stop)||(state==s_data))
          c<=0;
    
    end
    
    end


always@ (posedge c2 or posedge rst)
    begin
       if(rst)
        begin
        
        sdl_m<=1;
       // scl_m=1;
        state<=0;
        count<=0;
        end
     else
     case(state)
     
     
     idle: begin
     
        if(start)
          state<=1;
        else begin  
             sdl_m<=1;
//             scl_m<=1;
             
             end
           end
      starts:begin
      sdl_m<=0;
      state<=2;
      count<=7;
      
             end
       addd: begin      
       
      
       if(count==0)
       state<=3;
       else
       count<=count-1;
        end
        
        
        
        
     ack1: begin
           if(sdl==0)begin  
             count<=7;
             if(!rw) 
             state<=7;
             else
             state<=4;
             end
           else begin
             state<=2;
             count<=7;
                end
              end
        
        
        
     dataa:begin 
        
       if(count==0)
        state<=5;
       else
       count<=count-1;  
          end
        
        
     ack2: begin
            if(sdl==0)begin
             state<=6;
             count<=0;
             
             end
           else begin
             count<=7;
             if(!rw) 
             state<=7;
             else
             state<=4;
             
             
             
                end
        
             
        end
    stop: begin
           state<=0;   
        //   sdl_m<=1;
           end
  
    s_data: begin
          sdl_m<=1;
          if(count==0)
          begin
          rdata[count]<=sdl;
          state<=ack2;
          end           
          else begin
          rdata[count]<=sdl;
          count=count-1;
          
          end
    
          end
   
    
    
    
       
     default : begin  
       
       state<=idle;
       sdl_m<=1;
       count<=0;
       
       end
       
       
       
       
               
             


     endcase
       
    
    end
    
    
    
    
    


always@ (negedge c2 or posedge rst)
    begin
       if(rst)
        begin
        
        sdl_m=1;
//        scl_m=0;
        state=0;
        count=0;
        end
     else
     case(state)
     
     
     idle: begin
     
        if(!start)  
             sdl_m<=1;
//             scl_m<=1;
             
         
           end
      starts:begin
      sdl_m<=1;
      
      
      
             end
       addd: begin      
       if(count==1)
         begin
         rw<=add[count];
         sdl_m<=add[count];
         end
         else if(count==0)
         begin
         sdl_m<=add[count];
         sdl_m<=rw;
         end
         else
       sdl_m<=add[count];
       
       
     
        end
        
        
        
        
     ack1: begin
          sdl_m<=0; 
      
        end
        
     dataa:begin   
     sdl_m<=data[count];
       
          end
        
        
     ack2: begin
        sdl_m<=0;
        
             
        end
    stop: begin
     
   
     //   sdl_m<=1;
    
    
    
    
          end
       
       
        s_data:begin   
           sdl_m<=1;
        
        
              end
       
       
       
               
             


     endcase
       
    
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    
   initial $monitor($time ," count=%d, scl=%d,sdl=%d,state=%d,c2=%d",count,scl,sdl,state,c2); 
    

endmodule

                     


