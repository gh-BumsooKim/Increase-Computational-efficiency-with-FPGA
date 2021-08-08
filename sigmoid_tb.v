`timescale 1ns/1ns

module sigmoid_tb;
	reg clk, reset;
	reg signed [30:0] 	x;
	wire signed [30:0]	y;
	
	integer i;
	
	sigmoid i0(clk, reset, x, y);
	
	always
		#5 clk=~clk;
		
	initial
		begin
			clk=0;
			reset=1;
			x=0;
			#10 reset=0;
			
			for (i=0; i<16; i=i+1)
				begin
					#10
						x=(i-7)*100000000;
				end
		end
endmodule