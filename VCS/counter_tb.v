`timescale 1ns/10ps
	module counter_testbench();
	wire [3:0]out;
	reg clk;
	reg reset;
	counter dut (.out(out[3:0]), .reset(reset), .clk(clk));
	always #10clk= ~clk;
	initial begin
		$monitor("time=%5d ns,clk=%b, reset=%b,out=%b",$time,clk,reset, out[3:0]);
	clk=1'b0;
	reset=1'b0;
	reset=1'b1;
	@(posedge clk);#1;
	reset=1'b0;
	@(posedge clk);#1;
	@(posedge clk);#1;
	@(posedge clk);#1;
	@(posedge clk);#1;
	@(posedge clk);#1;
	@(posedge clk);#1;
	@(posedge clk);#1;
	if(out!=4'b0110)begin
		$display("ERROR 1: Out is not equal to 4'b0110");
		$finish;
	end
	$display("All tests completed sucessfully\y\n\n");
	$finish;
end
initial begin
	$vcdplusfile("counter.vpd");
	$vcdpluson;
	end
endmodule

