module alu	(	input				clk			,
				input		[15:0]	bus		,
				input				A_ena		,
				input				Add_SubNot	,
				input				G_ena		,
				output		[15:0]	ALUout		
			);
reg [15:0]	A	;
wire[15:0]	add_sub_out	;
wire[15:0]	oA	;
assign add_sub_out =(Add_SubNot)? (oA + bus) : (oA - bus);

reg_16bits	unitA (	.clk(clk)		,
					.ena(A_ena)	,
					.d	(bus)		,
					.q	(oA)	
				  );
reg_16bits	unitG (	.clk(clk)		,
					.ena(G_ena)		,
					.d	(add_sub_out)		,
					.q	(ALUout)	
				);		 
endmodule
				