`timescale 1 ns / 1 ns
module johnson_shift_tb ();
reg in, clock, clear;
wire [2:0] state;
johnson_shift DUT (in,clock,clear,state);
initial begin
	in = 1'b1;
	clear = 1'b1;
	clock = 1'b0;
end
always #10 clock = ~clock;
initial begin
	#200 clear = 1'b0; in = 1'b1;
	#070 $finish;
end
initial begin
	$vcdplusfile ("shift.vpd");
	$vcdpluson;
end
endmodule
