`timescale 1ns/10ps
module register_tb();
reg rin;
reg [15:0]Datain;
reg clk;
wire [15:0]Dataout;
register DUT (.rin(rin),.clk(clk),.Datain(Datain),.Dataout(Dataout))
always #10 clk=~clk;
initial begin
$monitor ("time=%5d ns, clk=%b, rin=%b, datain=%b, dataout=%b", $time ,clk, rin, Datain[15:0], Dataout[15:0]);
clk=1'b0;
rin=0;
datain=16'b1111111111111111;
#20 rin=1;
#30 Datain=16'd20;
#35 Datain=16'b1111111111111111;
#35 Datain=16'b0000000000000000;
#50 rin=0;
#200 $finish;
end
initial begin
$vcdplusfile ("register.vpd");
$vcdpluson;
end
endmodule
