module counter ( out, clk, reset);
	input clk, reset;
	output [3:0]out;
	reg[3:0]out;
	wire[3:0]next;
	assign next = reset?4'b0:(out+4'b1);
	always@(posedge clk)
	begin
		out<=#1 next;
	end
endmodule
