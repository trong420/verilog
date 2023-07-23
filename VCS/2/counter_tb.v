`timescale 1 ns/ 100 ps
module counter_tb;
reg clear
reg clock=1'b0;
wire [1:0]state;
counter dut(.clear(clear),.clock(clock),.state(state));
always #5 clock =~clock;
#5 clear=0;
#5 clear=1;
initial begin
$vcdplusfile("counter.vpd);
$vcdpluson;
end
endmodule

