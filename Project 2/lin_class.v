//b04502105 __ NTUEE G3 IC design

//Combinational logic 1
module Combi1 (input [5:0] a,
					input [5:0] b,
					input [5:0] c_c,
					output wna5,
					output wpa8,
					output wpa7,
					output wa6,
					//output wc5,
					output wcp5,
					output wcp4,
					output wcp3,
					output wcp2,
					output wc6,
					output pac5,
					output wac5,
					output [4:0]wabc,
					output pabc4,
					output [1:0]wb65,
					output [50:0] number);
	//null gate_count 2~6,27~28

	wire [50:0] gc0,gc1,gc2,gc3,gc4,gc5,gc6,gc7,gc8,gc9,gc10;
	wire [50:0] gc11,gc12,gc13,gc14,gc15;
	wire [5:0]c;
	wire [5:0]nc_c;
	wire [4:0]w;
	DRIVER z0 (c[0],c_c[0],gc0);
	IV iv11 (nc_c[1],c_c[1],gc1);
	IV iv12 (nc_c[2],c_c[2],gc2);
	IV iv13 (nc_c[3],c_c[3],gc3);
	IV iv14 (nc_c[4],c_c[4],gc4);
	IV iv15 (nc_c[5],c_c[5],gc5);
	IV iv10 (w[0],c_c[0],gc6);
	EO eo10 (c[1],nc_c[1],w[0],gc7);
	AN2 and0 (w[1],nc_c[1],w[0],gc8);
	EO eo1 (c[2],nc_c[2],w[1],gc9);
	AN2 and1 (w[2],nc_c[2],w[1],gc10);
	EO eo2 (c[3],nc_c[3],w[2],gc11);
	AN2 and2 (w[3],nc_c[3],w[2],gc12);
	EO eo3 (c[4],nc_c[4],w[3],gc13);
	AN2 and3 (w[4],nc_c[4],w[3],gc14);
	EO eo4 (c[5],nc_c[5],w[4],gc15);
	wire [50:0]countc0,countc1,countc2,countc3;
	assign countc0 = gc0 + gc1 + gc2 + gc3;
	assign countc1 = gc4 + gc5 + gc6 + gc7;
	assign countc2 = gc8 + gc9 + gc10 + gc11;
	assign countc3 = gc12 + gc13 + gc14 + gc15;
	assign c_number = countc0 + countc1 + countc2 + countc3;

	wire [50:0] gate_count0,gate_count1,gate_count2,gate_count3,gate_count4,gate_count5,gate_count6,gate_count7,gate_count8,gate_count9,gate_count10;
	wire [50:0] gate_count20,gate_count11,gate_count12,gate_count13,gate_count14,gate_count15,gate_count16,gate_count17,gate_count18,gate_count19;
	wire [50:0] gate_count30,gate_count21,gate_count22,gate_count23,gate_count24,gate_count25,gate_count26,gate_count27,gate_count28,gate_count29;
	wire [50:0] gate_count40,gate_count31,gate_count32,gate_count33,gate_count34,gate_count35,gate_count36,gate_count37,gate_count38,gate_count39;
	wire [50:0] gate_count41,gate_count42,gate_count43,gate_count44;
	//invert
	wire na5,nb5,nc0,nc1,nc2,nc3,nc4,nc5;
	IV iv1 (na5,a[5],gate_count0);
	IV iv2 (nb5,b[5],gate_count1);
	IV iv3 (nc5,c[5],gate_count7);
	//A part
	//wa0, wa1
	wire [5:2]wa;
	wire [9:0]wire_a;
	HA1 haa0 (wire_a[0],wa[2],a[0],a[2],gate_count8);
	FA1 faa0 (wire_a[1],wa[3],wire_a[0],a[1],a[3],gate_count9);
	FA1 faa1 (wire_a[2],wa[4],wire_a[1],a[2],a[4],gate_count10);
	FA1 faa2 (wire_a[4],wire_a[3],a[3],na5,1'b1,gate_count11);
	HA1 haa1 (wire_a[5],wa[5],wire_a[3],wire_a[2],gate_count12);
	FA1 faa3 (wpa7,wire_a[6],a[4],1'b1,wire_a[4],gate_count13);
	HA1 haa2 (wpa8,wa6,wire_a[6],wire_a[5],gate_count14);
	DRIVER dda (wna5,na5,gate_count15);
	//C part
	//wc0,wc1,wc2
	wire [5:3]wc;
	wire [10:0]wire_c;
	HA1 hac0 (wire_c[0],wc[3],c[0],c[3],gate_count17);
	FA1 fac0 (wire_c[1],wc[4],wire_c[0],c[1],c[4],gate_count18);
	HA1 hac1 (wire_c[3],wire_c[2],1'b1,c[2],gate_count20);
	FA1 fac1 (wire_c[4],wc[5],nc5,wire_c[1],wire_c[2],gate_count19);
	FA1 fac2 (wire_c[6],wire_c[5],c[3],1'b1,wire_c[3],gate_count21);
	FA1 fac3 (wcp4,wcp3,c[4],1'b1,wire_c[6],gate_count23);
	HA1 hac2 (wcp2,wc6,wire_c[5],wire_c[4],gate_count22);
	DRIVER dcc0 (wcp5,nc5,gate_count24);

	//B part
	//wb0,wb1
	wire [4:2]wb;
	wire [2:0]wire_b;
	HA1 hab0 (wire_b[0],wb[2],b[2],1'b1,gate_count29);
	HA1 hab1 (wire_b[1],wb[3],b[3],wire_b[0],gate_count30);
	FA1 fab0 (wire_b[2],wb[4],wire_b[1],b[4],1'b1,gate_count31);
	HA1 hab2 (wb65[1],wb65[0],nb5,wire_b[2],gate_count32);
	//A+C part
	wire [4:0]wac;
	wire [4:0]wire_ac;
	HA1 haac0 (wire_ac[0],wac[0],a[0],c[0],gate_count33);
	FA1 faac0 (wire_ac[1],wac[1],wire_ac[0],a[1],c[1],gate_count34);
	FA1 faac1 (wire_ac[2],wac[2],wire_ac[1],wa[2],c[2],gate_count35);
	FA1 faac2 (wire_ac[3],wac[3],wire_ac[2],wa[3],wc[3],gate_count36);
	FA1 faac3 (wire_ac[4],wac[4],wire_ac[3],wa[4],wc[4],gate_count37);
	FA1 faac4 (pac5,wac5,wire_ac[4],wa[5],wc[5],gate_count38);
	//A+B+C part
	wire [3:0]wire_abc;
	HA1 haabc0 (wire_abc[0],wabc[0],wac[0],b[0],gate_count39);
	FA1 faabc0 (wire_abc[1],wabc[1],wire_abc[0],wac[1],b[1],gate_count40);
	FA1 faabc1 (wire_abc[2],wabc[2],wire_abc[1],wac[2],wb[2],gate_count41);
	FA1 faabc2 (wire_abc[3],wabc[3],wire_abc[2],wac[3],wb[3],gate_count42);
	FA1 faabc3 (pabc4,wabc[4],wire_abc[3],wac[4],wb[4],gate_count43);

	wire [50:0]count0,count1,count2,count3,count4,count5,count6,count7,count8,count9,count10;
	assign count0 = gate_count0 + gate_count1 ;
	assign count1 = gate_count7;
	assign count2 = gate_count8 + gate_count9 + gate_count10 + gate_count11;
	assign count3 = gate_count12 + gate_count13 + gate_count14 + gate_count15;
	assign count4 = gate_count17 + gate_count18 + gate_count19;
	assign count5 = gate_count20 + gate_count21 + gate_count22 + gate_count23;
	assign count6 = gate_count24 ;
	assign count7 = gate_count29 + gate_count30 + gate_count31;
	assign count8 = gate_count32 + gate_count33 + gate_count34 + gate_count35;
	assign count9 = gate_count36 + gate_count37 + gate_count38 + gate_count39;
	assign count10 = gate_count40 + gate_count41 + gate_count42 + gate_count43;
	wire [50:0]count_10,count_11,count_12;
	assign count_10 = count0 + count1 + count2 + count3;
	assign count_11 = count4 + count5 + count6 + count7;
	assign count_12 = count8 + count9 + count10;
	assign number = count_10 + count_11 + count_12 + c_number;

endmodule

module Combi2 (input wna5,
					input wpa8,
					input wpa7,
					input wa6,
					input wcp5,
					input wcp4,
					input wcp3,
					input wcp2,
					input wc6,
					input pac5,
					input wac5,
					input pabc4,
					input [1:0]wb65,
					output wa11,
					output wc11,
					output pac10,
					output wac10,
					output pabc9,
					output [4:0]wabc95,
					output [50:0] number
					);

	wire [50:0] gate_count0,gate_count1,gate_count2,gate_count3,gate_count4,gate_count5,gate_count6,gate_count7,gate_count8,gate_count9,gate_count10;
	wire [50:0] gate_count11,gate_count12,gate_count13,gate_count14,gate_count15,gate_count16,gate_count17,gate_count18,gate_count19;
	//A part
	wire wa7,wa8,wa9,wa10;
	wire [3:0]wire_a;
	wire [1:0]null;
	FA1 faa4 (wire_a[2],wa7,wpa7,wna5,wpa8,gate_count18);
	HA1 haa3 (wire_a[3],wa8,wire_a[2],1'b1,gate_count19);
	HA1 haa0 (wire_a[0],wa9,1'b1,wire_a[3],gate_count0);
	HA1 haa1 (wire_a[1],wa10,wire_a[0],1'b1,gate_count1);
	HA1 haa2 (null[0],wa11,wire_a[1],1'b1,gate_count2);
	//C part
	wire wc7,wc8,wc9,wc10;
	wire [3:0]wire_c;
	HA1 hac0 (wire_c[0],wc7,wcp2,wcp3,gate_count3);
	FA1 hac1 (wire_c[1],wc8,wcp4,wcp5,wire_c[0],gate_count16);
	HA1 hac2 (wire_c[2],wc9,wire_c[1],1'b1,gate_count17);
	HA1 hac3 (wire_c[3],wc10,wire_c[2],1'b1,gate_count4);
	HA1 hac4 (null[1],wc11,wire_c[3],1'b1,gate_count15);
	//A+C part
	wire [9:6]wac;
	wire [3:0]wire_ac;
	FA1 faac0 (wire_ac[0],wac[6],pac5,wa6,wc6,gate_count5);
	FA1 faac1 (wire_ac[1],wac[7],wire_ac[0],wa7,wc7,gate_count6);
	FA1 faac2 (wire_ac[2],wac[8],wire_ac[1],wa8,wc8,gate_count7);
	FA1 faac3 (wire_ac[3],wac[9],wire_ac[2],wa9,wc9,gate_count8);
	FA1 faac4 (pac10,wac10,wire_ac[3],wa10,wc10,gate_count9);
	//A+B+C part
	wire [3:0]wire_abc;
	FA1 faabc0 (wire_abc[0],wabc95[0],pabc4,wb65[0],wac5,gate_count10);
	FA1 faabc1 (wire_abc[1],wabc95[1],wire_abc[0],wb65[1],wac[6],gate_count11);
	FA1 faabc2 (wire_abc[2],wabc95[2],wire_abc[1],1'b1,wac[7],gate_count12);
	FA1 faabc3 (wire_abc[3],wabc95[3],wire_abc[2],1'b1,wac[8],gate_count13);
	FA1 faabc4 (pabc9,wabc95[4],wire_abc[3],1'b1,wac[9],gate_count14);

	wire [50:0]count0,count1,count2,count3;
	assign count0 = gate_count0 + gate_count1 + gate_count2 + gate_count3;
	assign count1 = gate_count4 + gate_count5 + gate_count6 + gate_count7;
	assign count2 = gate_count8 + gate_count9 + gate_count10 + gate_count11 + gate_count18 + gate_count19;
	assign count3 = gate_count12 + gate_count13 + gate_count14 + gate_count15 + gate_count16 + gate_count17;

	assign number = count0 + count1 + count2 + count3;

endmodule

module Combi3 (input wa11,
					input wc11,
					input pac10,
					input wac10,
					input pabc9,
					output [5:0]wabc1510,
					output o_p,
					output [50:0] number
					);

	wire [50:0] gate_count0,gate_count1,gate_count2,gate_count3,gate_count4,gate_count5,gate_count6,gate_count7,gate_count8,gate_count9,gate_count10;
	//A+C part
	wire wac11,wac12;
	wire null,ctrl,nac12;
	FA1 faac0 (null,wac11,pac10,wa11,wc11,gate_count0);
	EO xo0 (ctrl,wa11,wc11,gate_count1);
	MUX21H mux0 (wac12,wa11,wac11,ctrl,gate_count2);
	//A+B+C part
	wire [3:0]wire_abc;
	FA1 faabc0 (wire_abc[0],wabc1510[0],pabc9,wac10,1'b1,gate_count3);
	FA1 faabc1 (wire_abc[1],wabc1510[1],wire_abc[0],wac11,1'b1,gate_count4);
	FA1 faabc2 (wire_abc[2],wabc1510[2],wire_abc[1],1'b1,wac12,gate_count5);
	IV iv (nac12,wac12,gate_count6);
	MUX21H mux1 (wabc1510[3],1'b1,wabc1510[2],nac12,gate_count7);
	DRIVER d0 (wabc1510[4],wabc1510[3],gate_count8);
	DRIVER d1 (wabc1510[5],wabc1510[3],gate_count9);
	IV iv1 (o_p,wabc1510[3],gate_count10);

	wire [50:0]count0,count1,count2;
	assign count0 = gate_count0 + gate_count1 + gate_count2 + gate_count3;
	assign count1 = gate_count4 + gate_count5 + gate_count6 + gate_count7;
	assign count2 = gate_count8 + gate_count9 + gate_count10 ;

	assign number = count0 + count1 + count2;

endmodule

//com c
module compl (output [5:0]Z,input [5:0]A,output [50:0]number);
	wire [50:0] gate_count0,gate_count1,gate_count2,gate_count3,gate_count4,gate_count5,gate_count6,gate_count7,gate_count8,gate_count9,gate_count10;
	wire [50:0] gate_count11,gate_count12,gate_count13,gate_count14,gate_count15;
	wire [5:0]nA;
	wire [4:0]w;
	DRIVER z0 (Z[0],A[0],gate_count0);
	IV iv1 (nA[1],A[1],gate_count1);
	IV iv2 (nA[2],A[2],gate_count2);
	IV iv3 (nA[3],A[3],gate_count3);
	IV iv4 (nA[4],A[4],gate_count4);
	IV iv5 (nA[5],A[5],gate_count5);
	IV iv0 (w[0],A[0],gate_count6);
	EO eo0 (Z[1],nA[1],w[0],gate_count7);
	AN2 and0 (w[1],nA[1],w[0],gate_count8);
	EO eo1 (Z[2],nA[2],w[1],gate_count9);
	AN2 and1 (w[2],nA[2],w[1],gate_count10);
	EO eo2 (Z[3],nA[3],w[2],gate_count11);
	AN2 and2 (w[3],nA[3],w[2],gate_count12);
	EO eo3 (Z[4],nA[4],w[3],gate_count13);
	AN2 and3 (w[4],nA[4],w[3],gate_count14);
	EO eo4 (Z[5],nA[5],w[4],gate_count15);

	wire [50:0]count0,count1,count2,count3;
	assign count0 = gate_count0 + gate_count1 + gate_count2 + gate_count3;
	assign count1 = gate_count4 + gate_count5 + gate_count6 + gate_count7;
	assign count2 = gate_count8 + gate_count9 + gate_count10 + gate_count11;
	assign count3 = gate_count12 + gate_count13 + gate_count14 + gate_count15;
	assign number = count0 + count1 + count2 + count3;

endmodule

module lin_class (input      i_clk,
				  input         i_rst_n,
				  input  [5:0]  i_im1,
				  input  [5:0]  i_im2,
				  input  [5:0]  i_im3,
				  output [15:0] o_wgt_sum,
				  output        o_pos,
				  output [50:0] number);

	wire [50:0] gate_count0,gate_count1,gate_count2,gate_count3,gate_count4,gate_count5,gate_count6,gate_count7,gate_count8,gate_count9,gate_count10;
	wire [50:0] gate_count20,gate_count11,gate_count12,gate_count13,gate_count14,gate_count15,gate_count16,gate_count17,gate_count18,gate_count19;
	wire [50:0] gate_count30,gate_count21,gate_count22,gate_count23,gate_count24,gate_count25,gate_count26,gate_count27,gate_count28,gate_count29;
	wire [50:0] gate_count40,gate_count31,gate_count32,gate_count33,gate_count34,gate_count35,gate_count36,gate_count37,gate_count38,gate_count39;
	wire [50:0] gate_count41,gate_count42,gate_count43,gate_count44,gate_count45,gate_count46,gate_count47,gate_count48,gate_count49,gate_count50;
	wire [50:0] gate_count51,gate_count52;

	//wire [5:0]i_im3_n;
	wire [50:0]tc_number;
	//compl compl_c (i_im3_n[5:0],i_im3[5:0],tc_number);
	//comp1
	wire t_wcp5,t_wcp4,t_wcp3,t_wcp2,t_pac5,t_pabc4;
	wire t_wa6,t_wna5,t_wpa7,t_wpa8;
	wire t_wc6;
	wire t_wac5;
	wire [15:0]t_wabc;
	wire [1:0]t_wb65;
	wire [50:0]t1_number;
	//IV iv3 (rst_n,i_rst_n,gate_count0);
	Combi1 my_comb1 (i_im1[5:0],i_im2[5:0],i_im3[5:0],t_wna5,t_wpa8,t_wpa7,t_wa6,t_wcp5,t_wcp4,t_wcp3,t_wcp2,t_wc6,t_pac5,t_wac5,t_wabc[4:0],t_pabc4,t_wb65[1:0],t1_number[50:0]);

	wire tr_wcp5,tr_wcp4,tr_wcp3,tr_wcp2,tr_pac5,tr_pabc4;
	wire tr_wa6,tr_wna5,tr_wpa7,tr_wpa8;
	wire tr_wc6;
	wire tr_wac5;
	wire [15:0]tr_wabc;
	wire [1:0]tr_wb65;
	FD2 r10 (tr_wna5,t_wna5,i_clk,i_rst_n,gate_count1);
	FD2 r12 (tr_wcp5,t_wcp5,i_clk,i_rst_n,gate_count2);
	FD2 r11 (tr_wcp2,t_wcp2,i_clk,i_rst_n,gate_count3);
	FD2 r13 (tr_pac5,t_pac5,i_clk,i_rst_n,gate_count4);
	FD2 r14 (tr_pabc4,t_pabc4,i_clk,i_rst_n,gate_count5);
	FD2 r15 (tr_wpa7,t_wpa7,i_clk,i_rst_n,gate_count6);
	FD2 r16 (tr_wpa8,t_wpa8,i_clk,i_rst_n,gate_count7);
	FD2 r17 (tr_wa6,t_wa6,i_clk,i_rst_n,gate_count8);
	FD2 r18 (tr_wc6,t_wc6,i_clk,i_rst_n,gate_count9);
	FD2 r19 (tr_wcp4,t_wcp4,i_clk,i_rst_n,gate_count10);
	FD2 r110 (tr_wcp3,t_wcp3,i_clk,i_rst_n,gate_count11);
	FD2 r112 (tr_wac5,t_wac5,i_clk,i_rst_n,gate_count13);
	FD2 r113 (tr_wabc[0],t_wabc[0],i_clk,i_rst_n,gate_count14);
	FD2 r114 (tr_wabc[1],t_wabc[1],i_clk,i_rst_n,gate_count15);
	FD2 r115 (tr_wabc[2],t_wabc[2],i_clk,i_rst_n,gate_count16);
	FD2 r116 (tr_wabc[3],t_wabc[3],i_clk,i_rst_n,gate_count17);
	FD2 r117 (tr_wabc[4],t_wabc[4],i_clk,i_rst_n,gate_count18);
	FD2 r118 (tr_wb65[0],t_wb65[0],i_clk,i_rst_n,gate_count19);
	FD2 r119 (tr_wb65[1],t_wb65[1],i_clk,i_rst_n,gate_count20);

	//comp2
	wire [50:0]t2_number;
	wire t_wa11;
	wire t_wc11;
	wire t_pac10,t_pabc9,t_wac10;
	wire [4:0]t_wabc95;
	Combi2 my_comb2(tr_wna5,tr_wpa8,tr_wpa7,tr_wa6,tr_wcp5,tr_wcp4,tr_wcp3,tr_wcp2,tr_wc6,tr_pac5,tr_wac5,tr_pabc4,tr_wb65[1:0],t_wa11,t_wc11,t_pac10,t_wac10,t_pabc9,t_wabc95[4:0],t2_number[50:0]);
	wire tr_wa11,tr_wc11;
	wire tr_pac10,tr_pabc9;
	wire tr_wac10;
	FD2 r20(tr_pac10,t_pac10,i_clk,i_rst_n,gate_count22);
	FD2 r21(tr_pabc9,t_pabc9,i_clk,i_rst_n,gate_count23);
	FD2 r22(tr_wa11,t_wa11,i_clk,i_rst_n,gate_count24);
	FD2 r23(tr_wc11,t_wc11,i_clk,i_rst_n,gate_count25);
	FD2 r24(tr_wac10,t_wac10,i_clk,i_rst_n,gate_count26);
	FD2 r26(tr_wabc[5],t_wabc95[0],i_clk,i_rst_n,gate_count28);
	FD2 r27(tr_wabc[6],t_wabc95[1],i_clk,i_rst_n,gate_count29);
	FD2 r28(tr_wabc[7],t_wabc95[2],i_clk,i_rst_n,gate_count30);
	FD2 r29(tr_wabc[8],t_wabc95[3],i_clk,i_rst_n,gate_count31);
	FD2 r210(tr_wabc[9],t_wabc95[4],i_clk,i_rst_n,gate_count32);
	//comp3
	wire [50:0]t3_number;

	Combi3 my_comb3 (tr_wa11,tr_wc11,tr_pac10,tr_wac10,tr_pabc9,t_wabc[15:10],o_pos,t3_number[50:0]);
	FD2 r30(o_wgt_sum[10],t_wabc[10],i_clk,i_rst_n,gate_count33);
	FD2 r31(o_wgt_sum[11],t_wabc[11],i_clk,i_rst_n,gate_count34);
	FD2 r32(o_wgt_sum[12],t_wabc[12],i_clk,i_rst_n,gate_count35);
	FD2 r33(o_wgt_sum[13],t_wabc[13],i_clk,i_rst_n,gate_count36);
	FD2 r34(o_wgt_sum[14],t_wabc[14],i_clk,i_rst_n,gate_count37);
	FD2 r35(o_wgt_sum[15],t_wabc[15],i_clk,i_rst_n,gate_count38);

	//-2
	wire [4:0]tr1_wabc;
	FD2 r40(tr1_wabc[0],tr_wabc[0],i_clk,i_rst_n,gate_count39);
	FD2 r41(tr1_wabc[1],tr_wabc[1],i_clk,i_rst_n,gate_count40);
	FD2 r42(tr1_wabc[2],tr_wabc[2],i_clk,i_rst_n,gate_count41);
	FD2 r43(tr1_wabc[3],tr_wabc[3],i_clk,i_rst_n,gate_count42);
	FD2 r44(tr1_wabc[4],tr_wabc[4],i_clk,i_rst_n,gate_count43);

	FD2 r50(o_wgt_sum[0],tr1_wabc[0],i_clk,i_rst_n,gate_count44);
	FD2 r51(o_wgt_sum[1],tr1_wabc[1],i_clk,i_rst_n,gate_count45);
	FD2 r52(o_wgt_sum[2],tr1_wabc[2],i_clk,i_rst_n,gate_count46);
	FD2 r53(o_wgt_sum[3],tr1_wabc[3],i_clk,i_rst_n,gate_count47);
	FD2 r54(o_wgt_sum[4],tr1_wabc[4],i_clk,i_rst_n,gate_count48);
	//-1

	FD2 r60(o_wgt_sum[5],tr_wabc[5],i_clk,i_rst_n,gate_count49);
	FD2 r61(o_wgt_sum[6],tr_wabc[6],i_clk,i_rst_n,gate_count50);
	FD2 r62(o_wgt_sum[7],tr_wabc[7],i_clk,i_rst_n,gate_count51);
	FD2 r63(o_wgt_sum[8],tr_wabc[8],i_clk,i_rst_n,gate_count52);
	FD2 r64(o_wgt_sum[9],tr_wabc[9],i_clk,i_rst_n,gate_count27);

	wire [50:0]count0,count1,count2,count3,count4,count5,count6,count7,count8,count9,count10,count11,count12;
	assign count0 = gate_count1 + gate_count2 + gate_count3;
	assign count1 = gate_count4 + gate_count5 + gate_count6 + gate_count7;
	assign count2 = gate_count8 + gate_count9 + gate_count10 + gate_count11;
	assign count3 = gate_count13 + gate_count14 + gate_count15;
	assign count4 = gate_count16 + gate_count17 + gate_count18 + gate_count19;
	assign count5 = gate_count20 + gate_count22 + gate_count23;
	assign count6 = gate_count24 + gate_count25 + gate_count26 + gate_count27;
	assign count7 = gate_count28 + gate_count29 + gate_count30 + gate_count31;
	assign count8 = gate_count32 + gate_count33 + gate_count34 + gate_count35;
	assign count9 = gate_count36 + gate_count37 + gate_count38 + gate_count39;
	assign count10 = gate_count40 + gate_count41 + gate_count42 + gate_count43 +gate_count44;
	assign count11 = gate_count45 + gate_count46 + gate_count47 + gate_count48 +gate_count49;
	assign count12 = gate_count50 + gate_count51 + gate_count52 ;
	wire [50:0]count_10,count_11,count_12;
	assign count_10 = count0 + count1 + count2 + count3;
	assign count_11 = count4 + count5 + count6 + count7;
	assign count_12 = count8 + count9 + count10 + count11 + count12;
	assign number = count_10 + count_11 + count_12 + t1_number + t2_number + t3_number;

endmodule
