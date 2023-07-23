`timescale 1ns/1ps
module counter_2bits_tb ();
reg			Clock, clear	;
wire [1:0]	counter		;



counter_2bits U	(	.clk	(Clock)	,
					.clear	(clear)	,
					.counter(counter)
				);
				
always #5 Clock = ~Clock;	
initial begin
		Clock	=	1'b0	;
		clear	=	1'b1	;
	#10	clear	=	1'b0	;
	#7	clear	=	1'b1	;
	
	#60	clear	=	1'b0	;
	#10	clear	=	1'b1	;
	
	#40	$finish	;


end
initial begin
	$vcdplusfile ("wave.vpd");
	$vcdpluson ;
end

endmodule
		