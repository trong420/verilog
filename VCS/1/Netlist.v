
module FFRS_0 ( R, S, clock, clear, Q );
  input R, S, clock, clear;
  output Q;
  wire   n1, n2, n3, n4, n5;

  DFFX1 Q_reg ( .D(n5), .CLK(clock), .Q(Q), .QN(n1) );
  OA22X1 U6 ( .IN1(S), .IN2(n4), .IN3(n2), .IN4(n1), .Q(n3) );
  NOR2X0 U3 ( .IN1(clear), .IN2(n3), .QN(n5) );
  INVX0 U4 ( .IN(R), .QN(n2) );
  NOR2X0 U5 ( .IN1(R), .IN2(Q), .QN(n4) );
endmodule


module FFRS_1 ( R, S, clock, clear, Q );
  input R, S, clock, clear;
  output Q;
  wire   n6, n7, n8, n9, n10;

  DFFX1 Q_reg ( .D(n6), .CLK(clock), .Q(Q), .QN(n10) );
  OA22X1 U6 ( .IN1(S), .IN2(n7), .IN3(n9), .IN4(n10), .Q(n8) );
  NOR2X0 U3 ( .IN1(clear), .IN2(n8), .QN(n6) );
  INVX0 U4 ( .IN(R), .QN(n9) );
  NOR2X0 U5 ( .IN1(R), .IN2(Q), .QN(n7) );
endmodule


module FFRS_2 ( R, S, clock, clear, Q );
  input R, S, clock, clear;
  output Q;
  wire   n6, n7, n8, n9, n10;

  DFFX1 Q_reg ( .D(n6), .CLK(clock), .Q(Q), .QN(n10) );
  OA22X1 U6 ( .IN1(S), .IN2(n7), .IN3(n9), .IN4(n10), .Q(n8) );
  NOR2X0 U3 ( .IN1(clear), .IN2(n8), .QN(n6) );
  INVX0 U4 ( .IN(R), .QN(n9) );
  NOR2X0 U5 ( .IN1(R), .IN2(Q), .QN(n7) );
endmodule


module johnson_shift ( in, clock, clear, state );
  output [2:0] state;
  input in, clock, clear;
  wire   n1, n2, n3, n4;

  FFRS_0 U0 ( .R(n3), .S(n4), .clock(clock), .clear(clear), .Q(state[0]) );
  FFRS_2 U1 ( .R(state[0]), .S(n1), .clock(clock), .clear(clear), .Q(state[1])
         );
  FFRS_1 U2 ( .R(state[1]), .S(n2), .clock(clock), .clear(clear), .Q(state[2])
         );
  INVX0 U7 ( .IN(n4), .QN(n3) );
  NOR2X0 U8 ( .IN1(state[2]), .IN2(in), .QN(n4) );
  INVX0 U9 ( .IN(state[0]), .QN(n1) );
  INVX0 U10 ( .IN(state[1]), .QN(n2) );
endmodule

