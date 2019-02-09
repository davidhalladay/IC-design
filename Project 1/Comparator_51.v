`timescale 1ns/1ps

module two_comp(s8,i8);
  output [7:0]s8;
  input [7:0]i8;
  wire [7:0]w;
  wire w12,w23,w34,w45,w56,w67,w78;
  wire ni_1;
  wire Co;
  DRIVER gnd1(gnd,0);
  DRIVER dr(s8[0],i8[0]);
  IV carry1(w12,i8[0]);
  IV iv2(w[1],i8[1]);
  IV iv3(w[2],i8[2]);
  IV iv4(w[3],i8[3]);
  IV iv5(w[4],i8[4]);
  IV iv6(w[5],i8[5]);
  IV iv7(w[6],i8[6]);
  IV iv8(w[7],i8[7]);
  //FA1 fa1(w12,s8[0],w[0],1,0);
  FA1 fa2(w23,s8[1],w[1],gnd,w12);
  FA1 fa3(w34,s8[2],w[2],gnd,w23);
  FA1 fa4(w45,s8[3],w[3],gnd,w34);
  FA1 fa5(w56,s8[4],w[4],gnd,w45);
  FA1 fa6(w67,s8[5],w[5],gnd,w56);
  FA1 fa7(w78,s8[6],w[6],gnd,w67);
  FA1 fa8(Co ,s8[7],w[7],gnd,w78);
endmodule

module Cout(co, a, b,c);
   output co;
   input a,b,c;
   wire w1,w2,w3;
   ND2 nd1 (w1,a,b);
   ND2 nd2 (w2,b,c);
   ND2 nd3 (w3,a,c);
   ND3 nd4 (co,w1,w2,w3);
endmodule

//only output 1 bit least sign.
module FA_8(s8, a8, b8, cb8);
  output s8;
  input [7:0]a8, b8,cb8;
  wire w12,w23,w34,w45,w56,w67,w78;
  wire w_xo,tmp_s8;

  AN2 co1 (w12,a8[0],cb8[0]);
  Cout co2 (w23,a8[1],cb8[1],w12);
  Cout co3 (w34,a8[2],cb8[2],w23);
  Cout co4 (w45,a8[3],cb8[3],w34);
  Cout co5 (w56,a8[4],cb8[4],w45);
  Cout co6 (w67,a8[5],cb8[5],w56);
  Cout co7 (w78,a8[6],cb8[6],w67);
  EO3 co8 (tmp_s8,a8[7],cb8[7],w78);
  EO  xo2 (w_xo,a8[7],b8[7]);
  MUX21H mx1(s8,tmp_s8,a8[7],w_xo);

endmodule

module median(isMedian, c1, c2, c3, c4);
   output isMedian;
   input c1, c2, c3, c4;
   wire nc1, nc2, nc3, nc4;
   IV iv1 (nc1,c1);
   IV iv2 (nc2,c2);
	IV iv3 (nc3,c3);
   IV iv4 (nc4,c4);
   wire t1,t2,t3,t4,t5,t6,t7,t8,t9;
   ND4 nd1 (t1,c1,c2,nc3,nc4);
   ND4 nd2 (t2,c1,nc2,c3,nc4);
   ND4 nd3 (t3,c1,nc2,nc3,c4);
   ND4 nd4 (t4,nc1,c2,c3,nc4);
   ND4 nd5 (t5,nc1,c2,nc3,c4);
   ND4 nd6 (t6,nc1,nc2,c3,c4);
   ND3 nd7 (t7,t1,t2,t3);
   ND3 nd8 (t8,t4,t5,t6);
   NR2 nr1 (t9,t7,t8);
   IV iv5 (isMedian,t9);
endmodule

module COMPARATOR_51(median, i0, i1, i2, i3, i4);
	 //DO NOT CHANGE!
  output [2:0] median;
  input  [7:0] i0, i1, i2, i3, i4;
  wire m0,m1,m2,m3;
  wire [7:0]ci0,ci1,ci2,ci3,ci4;
  wire c01,c02,c03,c04,c12,c13,c14,c23,c24,c34;
  wire c10,c20,c30,c40,c21,c31,c41,c32,c42,c43;
  //---------------------------------------------------
  two_comp comp1 (ci0,i0);
  two_comp comp2 (ci1,i1);
  two_comp comp3 (ci2,i2);
  two_comp comp4 (ci3,i3);
  two_comp comp5 (ci4,i4);
  //---------------------------------------------------
  FA_8 c1(c01, i0, i1, ci1);
  FA_8 c2(c02, i0, i2, ci2);
  FA_8 c3(c03, i0, i3, ci3);
  FA_8 c4(c04, i0, i4, ci4);
  FA_8 c5(c12, i1, i2, ci2);
  FA_8 c6(c13, i1, i3, ci3);
  FA_8 c7(c14, i1, i4, ci4);
  FA_8 c8(c23, i2, i3, ci3);
  FA_8 c9(c24, i2, i4, ci4);
  FA_8 c0(c34, i3, i4, ci4);
  //---------------------------------------------------
  IV iv1(c10,c01);
  IV iv2(c20,c02);
  IV iv3(c30,c03);
  IV iv4(c40,c04);
  IV iv5(c21,c12);
  IV iv6(c31,c13);
  IV iv7(c41,c14);
  IV iv8(c32,c23);
  IV iv9(c42,c24);
  IV iv0(c43,c34);
  //---------------------------------------------------
  median me1 (m0,c01,c02,c03,c04);
  median me2 (m1,c10,c12,c13,c14);
  median me3 (m2,c20,c21,c23,c24);
  median me4 (m3,c30,c31,c32,c34);
  median me5 (median[2],c40,c41,c42,c43);
  OR2 o1 (median[1],m2,m3);
  OR2 o2 (median[0],m1,m3);
endmodule
