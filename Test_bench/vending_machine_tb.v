`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:55:25 01/01/2019
// Design Name:   source_code
// Module Name:   D:/Fiver_deliveries/Vending_machine_cola_water/vending_machine_tb.v
// Project Name:  Vending_machine_cola_water
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: source_code
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vending_machine_tb;

	// Inputs
	reg selection;
	reg clk;
	reg [1:0] coin;
	reg rst;
	reg dispense;

	// Outputs
	wire cola;
	wire water;
	wire [9:0] change;
	wire [9:0] balance;

	// Instantiate the Unit Under Test (UUT)
	source_code uut (
		.selection(selection), 
		.cola(cola), 
		.water(water), 
		.clk(clk), 
		.coin(coin), 
		.rst(rst), 
		.change(change), 
		.dispense(dispense), 
		.balance(balance)
	);


 always 
   #10  clk = ! clk; 

	initial begin
		// Initialize Inputs
		selection = 0;
		clk = 00;
		coin = 0;
		rst = 1;
		dispense = 0;

		// Wait 100 ns for global reset to finish
		//comb1  water with no change
		#100;
		rst=0;
		coin = 2'b10;// 50 krs
		selection = 0;
		dispense = 0;
		
		#25 
		coin = 2'b01;// 1Tl
		selection = 0;
		dispense = 0;
		
		#25
		coin = 2'b10;// 50krs
		selection = 0; //water
		dispense = 1;
		
		//comb2 water with change
		#100
		rst=1;
		#25
		rst=0;
		#50
		coin = 2'b10;// 1 Tl
		selection = 0;
		dispense = 0;
		
		#50
		coin = 2'b01;// 50 krs
		selection = 0;
		dispense = 0;
		
		#50
		coin = 2'b10;// 1 Tl
		selection = 0;
		dispense = 0;
		
		//comp3 water with 150 krs change
		#100
		rst=1;
		#25
		rst=0;
		#25
		coin = 2'b10;// 1 Tl
		selection = 0;
		dispense = 0;
		
		#25
		coin = 2'b01;// 50 krs
		selection = 0;
		dispense = 0;
		
		#25
		coin = 2'b10;// 1 Tl
		selection = 0;
		dispense = 0;
		#25
		coin = 2'b01;// 50krs 
		selection = 0;
		dispense = 0;
		#25
		dispense=1;
		//comp4 no balance for water 
		#100
		rst=1;
		#25
		rst=0;
		#25
		coin = 2'b10;// 1 Tl
		selection = 0;
		dispense = 0;
		
		#25
		coin = 2'b00;
		selection = 0;
		dispense = 0;
		#25
		dispense=1;
		
		//comb5 cola with no change
		#100;
		rst=0;
		coin = 2'b10;// 50 krs
		selection = 1;
		dispense = 0;
		
		#25 
		coin = 2'b01;// 1Tl
		selection = 1;
		dispense = 0;
		
		#25 
		coin = 2'b01;// 50 krs
		selection = 1;
		dispense = 0;
		
		#25
		coin = 2'b10;// 50krs
		selection = 1; //cola
		dispense = 1;
		
		//comb6 cola with change 50
		#100
		rst=1;
		#25
		rst=0;
		#50
		coin = 2'b10;// 1 Tl
		selection = 1;
		dispense = 0;
		
		#50
		coin = 2'b01;// 50 krs
		selection = 1;
		dispense = 0;
		
		#50
		coin = 2'b10;// 1 Tl
		selection = 1;
		dispense = 0;
		
		//comp7 cola with 100 krs change
		#100
		rst=1;
		#25
		rst=0;
		#25
		coin = 2'b10;// 1 Tl
		selection = 1;
		dispense = 0;
		
		#25
		coin = 2'b01;// 50 krs
		selection = 1;
		dispense = 0;
		
		#25
		coin = 2'b10;// 1 Tl
		selection = 1;
		dispense = 0;
		#25
		coin = 2'b01;// 50krs 
		selection = 1;
		dispense = 0;
		#25
		coin = 2'b10;// 1 Tl 
		selection = 1;
		dispense = 0;
		
		#25
		dispense=1;
		//comp8 no balance for cola 
		#100
		rst=1;
		#25
		rst=0;
		#25
		coin = 2'b00;// 1 Tl
		selection = 1;
		dispense = 0;
		
		#25
		coin = 2'b00;// 50 krs
		selection = 1;
		dispense = 0;
		
		#25 //no input coins
		coin = 2'b00;
		selection = 1;
		dispense = 0;
		#25
		dispense=1;
		//comp9 only one TL with no dispense order
		#100
		rst=1;
		#25
		rst=0;
		#25
		coin = 2'b10;// 1 Tl
		selection = 1;
		dispense = 0;
		
		//comp10 dispense_order with no balance
		#100
		rst=1;
		#25
		rst=0;
		#25
		coin = 2'b01;// 50krs 
		selection = 1;
		dispense = 0;
	
        
        
		  

	end
      
endmodule

