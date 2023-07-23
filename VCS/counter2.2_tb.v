`timescale 1ns/10ps
	module counter2_testbench();
	reg A,B,C;
	wire [2:0]Y;
	counter2 dut (.A(A),.B(B),.C(C),.Y([2:0]));
	initial begin
		$monitor(
