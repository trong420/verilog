module johnson_shift (in,clock,clear,state);
input in, clock, clear;
output [2:0] state;
wire c0, c1, c2, c3;
assign c0 = c3|in;
FFRS U0 (.R(c0),.S(~c0),.clock(clock),.clear(clear),.Q(c1));
FFRS U1 (.R(c1),.S(~c1),.clock(clock),.clear(clear),.Q(c2));
FFRS U2 (.R(c2),.S(~c2),.clock(clock),.clear(clear),.Q(c3));
assign state[0] = c1;
assign state[1] = c2;
assign state[2] = c3;
endmodule

module FFRS (R,S,clock,clear,Q);
input R, S, clock, clear;
output reg Q;
always @ (posedge clock)
if (clear == 1'b1)
	Q <= 1'b0;
else
begin
	if ((R==1'b0)&&(S==1'b0))
	begin
		Q <= Q;
	end
	else
	begin
		if ((R==1'b0)&&(S==1'b1))
		begin
			Q <= 1'b0;
		end
		else
		begin
			if ((R==1'b1)&&(S==1'b0))
			begin
				Q <= 1'b1;
			end
		end			
	end
end
endmodule 
