module counter2(out,clk,reset);
	input  A, B, C;
	output [2:0]Y;
	reg [2:0]Y;
	assign Y=((~A)&(~B)&(~C) | A&(~B)&(~C) | A&(~B)&C);
endmodule
	
