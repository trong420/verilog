	module CU	(	input	[8:0]	IRout			,
					input			clk				,
					input			run				,
					input			rstn			,
					input	[1:0]	counter			,
					output	reg		IR_ena			,
					output	reg		clear_counter	,
					output	reg[7:0]mux_Rout_sel	,
					output	reg		mux_din_sel		,
					output	reg		mux_ALUout_sel	,
					output  reg[7:0]reg_sel		,	//reg
					output	reg		alu_A_ena		,
					output	reg		alu_G_ena		,	
					output	reg		alu_Add_SubNot	,
					output	reg		Done			
			);
reg 	[1:0]	state, nextstate	;
wire 	[2:0]	cmd	;
wire	[7:0]	rx, ry	;
assign cmd = IRout[8:6];
always @ (posedge clk)
begin
	if(!rstn)
		begin
			state	<=	2'd0		;
		end
	else
		if (run)
			begin
				state	<=	nextstate	;
			end
		else
			begin
				state	<=	state		;
			end
end
always @ (*)
begin
	case (state)
		2'd0:
			begin
				if(&(~cmd))
					nextstate	=	2'd1	;	//mov
				else
					if( !cmd[2] & !cmd[1] & cmd[0] )
						nextstate	=	2'd1	;	//movi
					else
						if	( !cmd[2]& cmd[1] )
							nextstate	=	2'd2	;	//add_sub
						else
							if ( cmd[2] & !cmd[1] & !cmd[0] )
								nextstate	=	2'd1	;	//movo
							else
								nextstate	=	2'd0	;
			end
		2'd1:	//mov - movi - add_sub_clk3 - movo
			begin
				nextstate = 2'd0	;
			end
		2'd2:	//add_sub clk1
			begin
				nextstate = 2'd3	;
			end
		2'd3:	//add_sub clk2
			begin
				nextstate = 2'd1	;
			end
	endcase
end
always @ (posedge clk)
begin
	if (!rstn)
		begin
			IR_ena			<= 1'b1		;
			clear_counter	<= 1'b0		;
			mux_din_sel		<= 1'b0		;
			mux_ALUout_sel	<= 1'b0		;
			mux_Rout_sel	<= 8'b0		;
			reg_sel			<= 8'b0		;
			alu_A_ena		<= 1'b0		;
			alu_G_ena		<= 1'b0		;
			alu_Add_SubNot	<= 1'b1		;
			Done			<= 1'b0		;
		end
	else
	begin
		case (state)
			2'd0: //Initial
				begin
					IR_ena			<= 1'b0		;	//fixed
					clear_counter	<= 1'b1		;
					mux_ALUout_sel	<= 1'b0		;
					alu_G_ena		<= 1'b0		;
					alu_Add_SubNot	<= 1'b1		;
					Done			<= 1'b0		;			
					if( &(~cmd) )	//mov
					begin
						mux_din_sel		<= 1'b0		;
						mux_Rout_sel	<= ry		;
						reg_sel			<= rx		;
						alu_A_ena		<= 1'b0		;
					end
					else
						if ( !cmd[2] & !cmd[1] & cmd[0] )	//movi
						begin
							mux_din_sel		<= 1'b1		;	
							mux_Rout_sel	<= 8'b0		;
							reg_sel			<= rx		;
							alu_A_ena		<= 1'b0		;
						end
						else
							if	( !cmd[2]& cmd[1] )		//add_sub
							begin
								mux_din_sel		<= 1'b0		;	
								mux_Rout_sel	<= rx		;
								reg_sel			<= 8'b0		;
								alu_A_ena		<= 1'b1		;	
							end
							else
								if ( cmd[2] & !cmd[1] & !cmd[0] )	//movo
								begin
									mux_din_sel		<= 1'b0		;	
									mux_Rout_sel	<= rx		;
									reg_sel			<= 8'b0		;
									alu_A_ena		<= 1'b0		;
								end
								else
								begin
									mux_din_sel		<= mux_din_sel	;	
									mux_Rout_sel	<= mux_Rout_sel	;
									reg_sel			<= reg_sel		;
									alu_A_ena		<= alu_A_ena	;
								end
				end
			2'd1: //mov - movi - add_sub_cl3 - movo
				begin
					IR_ena			<= 1'b1		;
					clear_counter	<= 1'b0		;
					mux_din_sel		<= 1'b0		;
					mux_ALUout_sel	<= 1'b0		;
					mux_Rout_sel	<= 8'b0		;
					reg_sel			<= 8'b0		;
					alu_A_ena		<= 1'b0		;
					alu_G_ena		<= 1'b0		;
					alu_Add_SubNot	<= 1'b1		;
					Done			<= 1'b1		;
				end
			2'd2: //add_sub clk1
				begin
					IR_ena			<= 1'b0		;
					clear_counter	<= 1'b1		;
					mux_din_sel		<= 1'b0		;
					mux_ALUout_sel	<= 1'b0		;
					mux_Rout_sel	<= ry		;
					reg_sel			<= 8'b0		;
					alu_A_ena		<= 1'b0		;
					alu_G_ena		<= 1'b1		;
					if (cmd [0])	alu_Add_SubNot	<= 1'b0		;
					else			alu_Add_SubNot	<= 1'b1		;
					Done			<= 1'b0		;			
				end
			2'd3: //add_sub clk2
				begin
					IR_ena			<= 1'b0		;
					clear_counter	<= 1'b1		;
					mux_din_sel		<= 1'b0		;
					mux_ALUout_sel	<= 1'b1		;
					mux_Rout_sel	<= 8'b0		;
					reg_sel			<= rx		;
					alu_A_ena		<= 1'b0		;
					alu_G_ena		<= 1'b0		;
					alu_Add_SubNot	<= 1'b1		;
					Done			<= 1'b0		;			
				end
			/* 2'd2: //movi
				begin
					IR_ena			<= 1'b1		;
					clear_counter	<= 1'b0		;
					mux_din_sel		<= 1'b0		;
					mux_ALUout_sel	<= 1'b0		;
					mux_Rout_sel	<= 8'b0		;
					reg_sel			<= 8'b0		;
					alu_A_ena		<= 1'b0		;
					alu_G_ena		<= 1'b0		;
					alu_Add_SubNot	<= 1'b1		;
					Done			<= 1'b1		;		
				end */
			
			/* 2'd5: //add_sub clk3
				begin
					IR_ena			<= 1'b1		;
					clear_counter	<= 1'b0		;
					mux_din_sel		<= 1'b0		;
					mux_ALUout_sel	<= 1'b0		;
					mux_Rout_sel	<= 8'b0		;
					reg_sel			<= 8'b0		;
					alu_A_ena		<= 1'b0		;
					alu_G_ena		<= 1'b0		;
					alu_Add_SubNot	<= 1'b1		;
					Done			<= 1'b1		;	
				end */
			/* 2'd6: //movo
				begin
					IR_ena			<= 1'b1		;
					clear_counter	<= 1'b0		;
					mux_din_sel		<= 1'b0		;
					mux_ALUout_sel	<= 1'b0		;
					mux_Rout_sel	<= 8'b0		;
					reg_sel			<= 8'b0		;
					alu_A_ena		<= 1'b0		;
					alu_G_ena		<= 1'b0		;
					alu_Add_SubNot	<= 1'b1		;
					Done			<= 1'b1		;		
				end */
			/* default: 
				begin
					IR_ena			<= IR_ena			;
					clear_counter	<= clear_counter	;	
					mux_din_sel		<= mux_din_sel		;
					mux_ALUout_sel	<= mux_ALUout_sel	;
					mux_Rout_sel	<= mux_Rout_sel		;
					reg_sel			<= reg_sel			;
					alu_A_ena		<= alu_A_ena		;
					alu_G_ena		<= alu_G_ena		;
					alu_Add_SubNot	<= alu_Add_SubNot	;
					Done			<= Done				;					
				end */
		endcase
	end
end
decode3bits ry_unit	(	.in		(IRout[2:0])	,
								.out	(ry)
							);
decode3bits rx_unit (	.in		(IRout[5:3])	,
								.out	(rx)
							);
endmodule
