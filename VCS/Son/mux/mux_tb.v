`timescale 1ns/1ps
module mux_tb ();


reg 		din_sel, ALUout_sel	;
reg	[7:0]	Rout_sel			;
reg	[15:0]	din, r0, r1, r2, r3, r4, r5, r6, r7, ALUout	;
///
wire[15:0]	obus				;


 mux U1	(	.Rout_sel(Rout_sel)	,	
			.din_sel(din_sel)	,
			.ALUout_sel(ALUout_sel),
			.din 	(din)		,
			.r0(r0)		,
			.r1	(r1)	,
			.r2	(r2)	,
			.r3	(r3)	,
			.r4	(r4)	,
			.r5	(r5)	,
			.r6	(r6)	,
			.r7	(r7)	,
			.ALUout (ALUout)	,
			.obus	(obus)
		);
	
initial begin
		Rout_sel	=	8'b0	;
		din_sel		=	1'b0	;
		ALUout_sel	=	1'b0	;
		r0			=	16'h0001;
		r1			=	16'h0010;
		r2			=	16'h0100;
		r3			=	16'h1000;
		r4			=	16'h000f;
		r5			=	16'h00f0;
		r6			=	16'h0f00;
		r7			=	16'hf000;
		din			=	16'hf00f;
		ALUout		=	16'h0ff0;
	#10	Rout_sel	=	8'b1	;		//r0
	#10	Rout_sel	=	8'b10	;		//r1
	#10	Rout_sel	=	8'b100	;		//r2
	#10	Rout_sel	=	8'b1000	;		//r3
	#10	Rout_sel	=	8'b10000	;	//r4
	#10	Rout_sel	=	8'b100000	;	//r5
	#10	Rout_sel	=	8'b1000000	;	//r6
	#10	Rout_sel	=	8'b10000000	;	//r7
	#10	Rout_sel	=	8'b0		;
		din_sel		=	1'b1		;	//din
	#10	din_sel		=	1'b0		;
		ALUout_sel	=	1'b1		;	//ALUout
	#20 $finish;	
end
initial begin
	$vcdplusfile ("wave.vpd");
	$vcdpluson ;
end
endmodule
