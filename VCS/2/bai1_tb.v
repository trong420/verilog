`timescale 1 ns/ 100 ps
module bai1_tb;
reg a,b,c;
wire y;
bai1 tb(.a(a),.b(b),.c(c),.y(y));
initial 
begin
a=0;
b=0;
c=0;
#10
a=1;
b=0;
c=0;
#10
a=0;
b=1;
c=0;
#10
a=1;
b=1;
c=0;
#10
a=0;
b=0;
c=1;
#10
a=1;
b=0;
c=1;
#10
a=0;
b=1;
c=1;
#10
a=1;
b=1;
c=1;
#10 $finish;
initial 
begin
$vcdplusfile("bai1_tb.vpd");
$ vcdpluson;
end
endmodule

