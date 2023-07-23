module mux	(	input	[7:0]	Rout_sel	,	
				input			din_sel	,
				input			ALUout_sel,
				input	[15:0]	din		,
				input	[15:0]	r0		,
				input	[15:0]	r1		,
				input	[15:0]	r2		,
				input	[15:0]	r3		,
				input	[15:0]	r4		,
				input	[15:0]	r5		,
				input	[15:0]	r6		,
				input	[15:0]	r7		,
				input	[15:0]	ALUout	,
				output	[15:0]	obus	
			);

assign obus =	(	{(16){Rout_sel[0]}}		&	r0)	|
				(	{(16){Rout_sel[1]}}		&	r1)	|
				(	{(16){Rout_sel[2]}}		&	r2)	|
				(	{(16){Rout_sel[3]}}		&	r3)	|
				(	{(16){Rout_sel[4]}}		&	r4)	|
				(	{(16){Rout_sel[5]}}		&	r5)	|
				(	{(16){Rout_sel[6]}}		&	r6)	|
				(	{(16){Rout_sel[7]}}		&	r7)	|
				(	{(16){din_sel}}			&	din)|
				(	{(16){ALUout_sel}}		&	ALUout)	;	
				
endmodule
				