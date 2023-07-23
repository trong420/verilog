module reg_16bits	(	input		clk			,
						input		ena			,
						input		[15:0]	d	,
						output reg	[15:0]	q	
					);
always @ (posedge clk)
begin
	if(ena)
		q	<=	d	;
	else
		q	<=	q	;
end
endmodule