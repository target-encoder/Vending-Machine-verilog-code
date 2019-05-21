`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:50:58 01/01/2019 
// Design Name: 
// Module Name:    source_code 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module source_code(selection, cola,water,clk,coin,rst, change,dispense, balance);

   input wire        selection; // 0 for water and 1 for cola
	input wire [1:0]  coin;
   input wire        clk,rst;
	input wire        dispense; //dispense button
	
   output reg cola;
	output reg water;
   output reg [9:0] change;

	
   
   reg [1:0]   state;
   reg [1:0]   next_state;
	output reg [9:0]  balance; // max balance in one process is (2^(10-1)) ~ 500 kurus= 5 TL
	
	parameter s0=2'b00;
	parameter s1=2'b01;
	parameter s2=2'b10;
	


   
  
	
	
  initial begin
  balance =10'b0;
  change =0;
  water <=0;
  cola <=0;
 
  end

   always @(posedge clk)
     begin
       if (rst)
		 
					state<=s2;
					
		
       else
         state<=next_state;
     end


   always @(state,coin,dispense,selection,balance)
     begin
		 case (state)
		  s0:
			begin 
				  if (dispense==1'b0)
				  begin
					  if (coin==2'b00 || coin==2'b11); //no coin
					  else if (coin==2'b01) // 50 krs
					  balance=balance+10'd50;
					  else if (coin==2'b10)// 1 Tl
					  balance=balance+10'd100;
					  
					  next_state=s0;
					end
				else if (dispense==1'b1) 
				  next_state= s1;
			end  
		 s1:
		 begin
			 if (selection==1'b0)
				 begin //water
					  if (balance >=150) //1.5TL
					  begin
						  water<=1'b1;
						  cola<=1'b0;
						  change=balance-10'd150;
						end
						
					 next_state=s2;
				  end  
				  
			  else if (selection==1'b1)
				  begin //cola
					  if (balance >=250) //2.5TL
					  begin
						  cola<=1'b1;
						  water<=1'b0;
						  change=balance-10'd250;
					  end
					next_state=s2;
			    end
			end
		 
		s2 :
		 begin
				 balance =10'b0;
				 change =10'b0;
				  water <=0;
				  cola <=0;
				next_state=s0; 
		 end
		 
				
	default : next_state=s2;
	
  endcase // case (state)
 end // always @ (state,next_state)
	  
endmodule
