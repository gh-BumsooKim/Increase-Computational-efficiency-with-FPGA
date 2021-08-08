module sigmoid(clk, reset, x, y);
    input clk, reset;
    input [30:0] 	x; 
    output [30:0] 	y;

    wire signed [30:0] 	x;

    reg signed [30:0]	constant_b[0:8];
	reg signed [30:0]	x1,x2,x3,b;
	reg signed [30:0]	y;
	reg [3:0]			seg;
	
    always@(posedge clk)
		begin
			if (reset)
				begin
					constant_b[0]=50000000;
					constant_b[1]=63281250;
					constant_b[2]=76562500;
					constant_b[3]=85937500;
					constant_b[4]=91796875;
					constant_b[5]=95312500;
					constant_b[6]=97265625;
					constant_b[7]=98437500;
					constant_b[8]=100000000;			
				end
			else
				begin
					if (x<0)
						x1=-x;
					else
						x1=x;
					
					if (x1>=0 && x1<106500000)
						seg=1;
					else if (x1<216400000)
						seg=2;
					else if (x1<297700000)
						seg=3;
					else if (x1<372400000)
						seg=4;
					else if (x1<444200000)
						seg=5;
					else if (x1<514700000)
					    seg=6;
					else if (x1<584600000)
					    seg=7;
					else if (x1<723600000)
					    seg=8;
					else
					    seg=9;	
						
					x2=x1>>>(seg+1);
					b=constant_b[seg-1];
					
					x3=x2+b;
					
					if (x<0)
						y=100000000-x3;
					else
						y=x3;
				end
		end
endmodule