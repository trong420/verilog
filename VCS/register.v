module register(rin,Datain,Dataout,clk);
input rin;
input [15:0]Datain;
input clk;
output reg [15:0]Dataout;
always @(posedge clk)
begin
if (rin)
else Dataout<=Dataout;
end
endmodule
