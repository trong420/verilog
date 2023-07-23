`timescale 1ns/1ps
module reg_16bits_tb ();

reg 		Clock, ena	;
reg	[15:0]	d			;
///
wire [15:0]	q			;

reg_16bits	r0_u	(	.clk(Clock)			,
						.ena(ena)	,
						.d	(d)			,
						.q	(q)	
					);	
					
always #5 Clock = ~Clock;	
initial begin
		Clock	=	1'b0	;
	#5	d		=	16'hf0f	;
	#8	ena		=	1'b1	;
	#5	ena		=	1'b0	;
	#5	d		=	16'hf0f0;
		ena		=	1'b1	;
	#10	ena		=	1'b0	;
		
	#30	$finish	;
	

end
initial begin
	$vcdplusfile ("wave.vpd");
	$vcdpluson ;
end
endmodule
		