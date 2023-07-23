module (clear,clock,state);
input clear,clock;
output reg[1:0]state;
always @(posedge clock )
if (clear)
state<=2'b0;
else
state<=state+1'b1;
endmodule

