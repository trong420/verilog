`timescale 1ns/1ps
module alu_tb ();

reg 		Clock, A_ena, Add_SubNot, G_ena;
reg [15:0]	Bus		;
///
wire[15:0]	ALUout	;

alu 	alu_unit	(	.clk		(Clock)		,
						.bus		(Bus)		,
						.A_ena		(A_ena)		,
						.Add_SubNot	(Add_SubNot),
						.G_ena		(G_ena)		,
						.ALUout		(ALUout)
					);
					
always #5 Clock = ~Clock;	
					
initial begin
		Clock		=	1'b0	;
		A_ena		=	1'b0	;
		Add_SubNot	=	1'b0	;
		G_ena		=	1'b0	;
	#5	Bus			=	16'hf00	;
	#8	A_ena		=	1'b1	;
	#5	A_ena		=	1'b0	;
		Bus			=	16'hf	;
		Add_SubNot	=	1'b0	;
	#5	G_ena		= 	1'b1	;
	#10	G_ena		=	1'b0	;
	///////
	#5	Bus			=	16'hf0	;
	#5 	A_ena		=	1'b1	;
	#5 	A_ena		=	1'b0	;
		Bus			=	16'hf	;
		Add_SubNot	=	1'b1	;
	#5	G_ena		= 	1'b1	;
	#10	G_ena		=	1'b0	;
	
	#40	$finish	;
	
end
initial begin
	$vcdplusfile ("wave.vpd");
	$vcdpluson ;
end
endmodule

		