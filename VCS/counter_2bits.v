module counter_2bits	(	input				clk		,
							input				clear	,
							output reg	[1:0]	counter
						);
always @ (posedge clk)
begin
	if (clear)
		counter	<=	2'b0	;
	else
		counter	<=	counter + 1'b1	;
end
endmodule
