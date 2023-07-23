module cpu 	(	input 			Clock		,
						input	[15:0]	DIN		,
						input			Run		,
						input			Resetn	,
						output	[15:0]	Bus		,
						output			Done
					);
wire [7:0]	reg_sel, Rout_sel		;
wire [15:0]	r0, r1, r2, r3, r4, r5, r6, r7, ALUout	;		
wire		din_sel, ALUout_sel, A_ena, Add_SubNot, G_ena, IR_ena		;		
reg  [8:0]	IRout		;
always @ (Clock)					
begin
	if (IR_ena)
		IRout	<=	DIN	[8:0]	;
	else
		IRout	<= IRout		;
end

////////internal module
reg_8banks reg_bank	(	.clk		(Clock)		,
						.reg_sel	(reg_sel)	,
						.bus		(Bus)		,
						.r0			(r0)		,
						.r1			(r1)		,
						.r2			(r2)		,
						.r3			(r3)		,
						.r4			(r4)		,
						.r5			(r5)		,
						.r6			(r6)		,
						.r7			(r7)		
					);
mux 	mux_unit	(	.Rout_sel	(Rout_sel)	,
						.din_sel	(din_sel)	,
						.ALUout_sel	(ALUout_sel),
						.din		(DIN)		,
						.r0			(r0)		,
						.r1			(r1)		,
						.r2			(r2)		,
						.r3			(r3)		,
						.r4			(r4)		,
						.r5			(r5)		,
						.r6			(r6)		,
						.r7			(r7)		,
						.ALUout		(ALUout)	,
						.obus		(Bus)		
					);
alu 	alu_unit	(	.clk		(Clock)		,
						.bus		(Bus)		,
						.A_ena		(A_ena)		,
						.Add_SubNot	(Add_SubNot),
						.G_ena		(G_ena)		,
						.ALUout		(ALUout)
					);					
CU 		CU_unit		(	.IRout		(IRout)		,
						.clk		(Clock)		,
						.run		(Run)		,
						.rstn		(Resetn)		,
						.IR_ena		(IR_ena)	,
						.mux_Rout_sel(Rout_sel)	,
						.mux_din_sel(din_sel)	,
						.mux_ALUout_sel(ALUout_sel),
						.reg_sel	(reg_sel)	,
						.alu_A_ena	(A_ena)		,
						.alu_G_ena	(G_ena)		,
						.alu_Add_SubNot(Add_SubNot),
						.Done		(Done)
					);
endmodule
					