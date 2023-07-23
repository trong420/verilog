//****************************
//	vung thu nhat
//****************************
`timescale 1ns/1ps
module CPU_tb ();

reg iClk;
reg iRst_n;
reg run;
reg [15:0] din;
wire done;
wire [15:0]dout;
//*****************************
//	end vung thu nhat
//*****************************

//*****************************
//	vung thu hai
//*****************************
      cpu		U1( 
					// Inputs
					.DIN 		(din), 
					.Resetn 	(iRst_n), 
					.Clock		(iClk), 
					.Run		(run),	  
					// Outputs		  
					.Done		(done), 
					.Bus 		(dout)
				);
//*****************************
//	end vung thu hai
//*****************************

//*****************************
//	vung thu ba
//*****************************
always #5 iClk = ~iClk;	
//*****************************
//	end vung thu ba
//*****************************

//*****************************
//	vung thu tu
//*****************************
initial begin
	iClk = 1'b0;
	iRst_n = 1'b0;
	run = 1'b0;
	#36 iRst_n = 1'b1;
	    run = 1'b1;
	    din = {7'bz,6'b001000,3'bz};
	#10 din = 16'h000A;
	#10 din = {7'bz,6'b001001,3'bz};
	#10 din = 16'h0008;
	#10 din = {7'bz,6'b001010,3'bz};
	#10 din = 16'h0006;
	#10 din = {7'bz,6'b001011,3'bz};
	#10 din = 16'h0002;
	#10 din = {7'bz,6'b001100,3'bz};
	#10 din = 16'hFFFF;
	#10 din = {7'bz,6'b001101,3'bz};
	#10 din = 16'hEEEE;
	#10 din = {7'bz,6'b001110,3'bz};
	#10 din = 16'hCCCC;
	#10 din = {7'bz,6'b001111,3'bz};
	#10 din = 16'hDDDD;
	#10 din = {7'bz,9'b000111000};
	#20 din = {7'bz,9'b000110001};
	#20 din = {7'bz,9'b000101010};
	#20 din = {7'bz,9'b000100011};
	#20 din = {7'bz,9'b000011111};
	#20 din = {7'bz,9'b000010110};
	#20 din = {7'bz,9'b000001101};
	#20 din = {7'bz,9'b000000100};
	#20 din = {7'bz,9'b010000001};
	#40 din = {7'bz,9'b100111zzz};
	#40 din = {7'bz,9'b010001010};
	#40 din = {7'bz,9'b010010011};
	#40 din = {7'bz,9'b010011100};
	#40 din = {7'bz,9'b010100101};
	#40 din = {7'bz,9'b010101110};
	#40 din = {7'bz,9'b010111001};
	#40 din = {7'bz,9'b011111110};
	#40 din = {7'bz,9'b011110101};
	#40 din = {7'bz,9'b011101100};
	#40 din = {7'bz,9'b011011100};
	#40 din = {7'bz,9'b011100011};
	#40 din = {7'bz,9'b011010011};
	#40 din = {7'bz,9'b011001000};
	#40 din = {7'bz,9'b011000001};
end

initial begin
	$vcdplusfile ("wave.vpd");
	$vcdpluson ;
end
initial 
begin
	#1000 $finish;

end

//*******************************
//	end vung thu tu
//*******************************
endmodule 