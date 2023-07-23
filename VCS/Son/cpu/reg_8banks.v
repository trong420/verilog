module reg_8banks	(	input				clk		,
						input		[7:0]	reg_sel	,
						input 		[15:0]	bus	,
						output		[15:0]	r0, r1, r2, r3, r4, r5, r6, r7
					);
reg_16bits	r0_u	(	.clk(clk)			,
					.ena(reg_sel[0])	,
					.d	(bus)			,
					.q	(r0)	
				);					
reg_16bits	r1_u	(	.clk(clk)			,
					.ena(reg_sel[1])	,
					.d	(bus)			,
					.q	(r1)	
				);					
reg_16bits	r2_u	(	.clk(clk)			,
					.ena(reg_sel[2])	,
					.d	(bus)			,
					.q	(r2)	
				);					
reg_16bits	r3_u	(	.clk(clk)			,
					.ena(reg_sel[3])	,
					.d	(bus)			,
					.q	(r3)	
				);					
reg_16bits	r4_u	(	.clk(clk)			,
					.ena(reg_sel[4])	,
					.d	(bus)			,
					.q	(r4)	
				);					
reg_16bits	r5_u	(	.clk(clk)			,
					.ena(reg_sel[5])	,
					.d	(bus)			,
					.q	(r5)	
				);					
reg_16bits	r6_u	(	.clk(clk)			,
					.ena(reg_sel[6])	,
					.d	(bus)			,
					.q	(r6)	
				);					
reg_16bits	r7_u	(	.clk(clk)			,
					.ena(reg_sel[7])	,
					.d	(bus)			,
					.q	(r7)	
				);					
endmodule
