////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.68d
//  \   \         Application: netgen
//  /   /         Filename: weighted_sum_slice.v
// /___/   /\     Timestamp: Fri Jun  6 14:29:25 2014
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog /afs/ir.stanford.edu/users/s/h/shanel/research/neural-hardware/single-perceptron-demo/ipcore_dir/tmp/_cg/weighted_sum_slice.ngc /afs/ir.stanford.edu/users/s/h/shanel/research/neural-hardware/single-perceptron-demo/ipcore_dir/tmp/_cg/weighted_sum_slice.v 
// Device	: 6slx9tqg144-3
// Input file	: /afs/ir.stanford.edu/users/s/h/shanel/research/neural-hardware/single-perceptron-demo/ipcore_dir/tmp/_cg/weighted_sum_slice.ngc
// Output file	: /afs/ir.stanford.edu/users/s/h/shanel/research/neural-hardware/single-perceptron-demo/ipcore_dir/tmp/_cg/weighted_sum_slice.v
// # of Modules	: 1
// Design Name	: weighted_sum_slice
// Xilinx        : /afs/ir.stanford.edu/class/ee/xilinx/14.6/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module weighted_sum_slice (
  clk, pcin, a, b, pcout, p
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input [47 : 0] pcin;
  input [17 : 0] a;
  input [17 : 0] b;
  output [47 : 0] pcout;
  output [47 : 0] p;
  
  // synthesis translate_off
  
  wire \blk00000001/sig000000e1 ;
  wire \blk00000001/sig000000e0 ;
  wire \blk00000001/sig000000df ;
  wire \blk00000001/sig000000de ;
  wire \blk00000001/sig000000dd ;
  wire \blk00000001/sig000000dc ;
  wire \blk00000001/sig000000db ;
  wire \blk00000001/sig000000da ;
  wire \blk00000001/sig000000d9 ;
  wire \blk00000001/sig000000d8 ;
  wire \blk00000001/sig000000d7 ;
  wire \blk00000001/sig000000d6 ;
  wire \blk00000001/sig000000d5 ;
  wire \blk00000001/sig000000d4 ;
  wire \blk00000001/sig000000d3 ;
  wire \blk00000001/sig000000d2 ;
  wire \blk00000001/sig000000d1 ;
  wire \blk00000001/sig000000d0 ;
  wire \blk00000001/sig000000cf ;
  wire \blk00000001/sig000000ce ;
  wire \blk00000001/sig000000cd ;
  wire \blk00000001/sig000000cc ;
  wire \blk00000001/sig000000cb ;
  wire \blk00000001/sig000000ca ;
  wire \blk00000001/sig000000c9 ;
  wire \blk00000001/sig000000c8 ;
  wire \blk00000001/sig00000067 ;
  wire \blk00000001/sig00000066 ;
  wire \blk00000001/sig00000065 ;
  wire \blk00000001/sig00000064 ;
  wire \blk00000001/sig00000063 ;
  wire \blk00000001/sig00000062 ;
  wire \blk00000001/sig00000061 ;
  wire \blk00000001/sig00000060 ;
  wire \blk00000001/sig0000005f ;
  wire \blk00000001/sig0000005e ;
  wire \blk00000001/sig0000005d ;
  wire \blk00000001/sig0000005c ;
  wire \blk00000001/sig0000005b ;
  wire \blk00000001/sig0000005a ;
  wire \blk00000001/sig00000059 ;
  wire \blk00000001/sig00000058 ;
  wire \blk00000001/sig00000057 ;
  wire \blk00000001/sig00000056 ;
  wire \NLW_blk00000001/blk00000004_M<35>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<34>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<33>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<32>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<31>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<30>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_M<0>_UNCONNECTED ;
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001a  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000cb )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000019  (
    .C(clk),
    .D(\blk00000001/sig000000ca ),
    .Q(\blk00000001/sig000000d1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000018  (
    .C(clk),
    .D(\blk00000001/sig000000ca ),
    .Q(\blk00000001/sig000000d2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000017  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000d4 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000016  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000d5 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000015  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000d6 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000014  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000d7 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000013  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000d8 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000012  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000d9 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000011  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000da )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000010  (
    .C(clk),
    .D(\blk00000001/sig000000d1 ),
    .Q(\blk00000001/sig000000cc )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000f  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000cd )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000e  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000db )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000d  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000dc )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000c  (
    .C(clk),
    .D(\blk00000001/sig000000d2 ),
    .Q(\blk00000001/sig000000ce )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000b  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000cf )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000a  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000dd )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000009  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000d0 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000008  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000de )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000007  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000df )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000006  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000e0 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000005  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000e1 )
  );
  DSP48A1 #(
    .A0REG ( 1 ),
    .A1REG ( 1 ),
    .B0REG ( 1 ),
    .B1REG ( 1 ),
    .CARRYINREG ( 1 ),
    .CARRYINSEL ( "OPMODE5" ),
    .CARRYOUTREG ( 1 ),
    .CREG ( 1 ),
    .DREG ( 1 ),
    .MREG ( 1 ),
    .OPMODEREG ( 0 ),
    .PREG ( 1 ),
    .RSTTYPE ( "SYNC" ))
  \blk00000001/blk00000004  (
    .CECARRYIN(\blk00000001/sig000000ca ),
    .RSTC(\blk00000001/sig000000d3 ),
    .RSTCARRYIN(\blk00000001/sig000000d3 ),
    .CED(\blk00000001/sig000000ca ),
    .RSTD(\blk00000001/sig000000d3 ),
    .CEOPMODE(\blk00000001/sig000000d3 ),
    .CEC(\blk00000001/sig000000ca ),
    .CARRYOUTF(\blk00000001/sig000000c8 ),
    .RSTOPMODE(\blk00000001/sig000000d3 ),
    .RSTM(\blk00000001/sig000000d3 ),
    .CLK(clk),
    .RSTB(\blk00000001/sig000000d3 ),
    .CEM(\blk00000001/sig000000ca ),
    .CEB(\blk00000001/sig000000ca ),
    .CARRYIN(\blk00000001/sig000000d3 ),
    .CEP(\blk00000001/sig000000ca ),
    .CEA(\blk00000001/sig000000ca ),
    .CARRYOUT(\blk00000001/sig000000c9 ),
    .RSTA(\blk00000001/sig000000d3 ),
    .RSTP(\blk00000001/sig000000d3 ),
    .B({a[17], a[16], a[15], a[14], a[13], a[12], a[11], a[10], a[9], a[8], a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]}),
    .BCOUT({\blk00000001/sig00000056 , \blk00000001/sig00000057 , \blk00000001/sig00000058 , \blk00000001/sig00000059 , \blk00000001/sig0000005a , 
\blk00000001/sig0000005b , \blk00000001/sig0000005c , \blk00000001/sig0000005d , \blk00000001/sig0000005e , \blk00000001/sig0000005f , 
\blk00000001/sig00000060 , \blk00000001/sig00000061 , \blk00000001/sig00000062 , \blk00000001/sig00000063 , \blk00000001/sig00000064 , 
\blk00000001/sig00000065 , \blk00000001/sig00000066 , \blk00000001/sig00000067 }),
    .PCIN({pcin[47], pcin[46], pcin[45], pcin[44], pcin[43], pcin[42], pcin[41], pcin[40], pcin[39], pcin[38], pcin[37], pcin[36], pcin[35], pcin[34]
, pcin[33], pcin[32], pcin[31], pcin[30], pcin[29], pcin[28], pcin[27], pcin[26], pcin[25], pcin[24], pcin[23], pcin[22], pcin[21], pcin[20], pcin[19]
, pcin[18], pcin[17], pcin[16], pcin[15], pcin[14], pcin[13], pcin[12], pcin[11], pcin[10], pcin[9], pcin[8], pcin[7], pcin[6], pcin[5], pcin[4], 
pcin[3], pcin[2], pcin[1], pcin[0]}),
    .C({\blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , 
\blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , 
\blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , 
\blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , 
\blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , 
\blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , 
\blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , 
\blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , 
\blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , 
\blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 }),
    .P({p[47], p[46], p[45], p[44], p[43], p[42], p[41], p[40], p[39], p[38], p[37], p[36], p[35], p[34], p[33], p[32], p[31], p[30], p[29], p[28], 
p[27], p[26], p[25], p[24], p[23], p[22], p[21], p[20], p[19], p[18], p[17], p[16], p[15], p[14], p[13], p[12], p[11], p[10], p[9], p[8], p[7], p[6], 
p[5], p[4], p[3], p[2], p[1], p[0]}),
    .OPMODE({\blk00000001/sig000000d0 , \blk00000001/sig000000d3 , \blk00000001/sig000000cb , \blk00000001/sig000000d3 , \blk00000001/sig000000cf , 
\blk00000001/sig000000ce , \blk00000001/sig000000cd , \blk00000001/sig000000cc }),
    .D({\blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , 
\blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , 
\blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 , 
\blk00000001/sig000000d3 , \blk00000001/sig000000d3 , \blk00000001/sig000000d3 }),
    .PCOUT({pcout[47], pcout[46], pcout[45], pcout[44], pcout[43], pcout[42], pcout[41], pcout[40], pcout[39], pcout[38], pcout[37], pcout[36], 
pcout[35], pcout[34], pcout[33], pcout[32], pcout[31], pcout[30], pcout[29], pcout[28], pcout[27], pcout[26], pcout[25], pcout[24], pcout[23], 
pcout[22], pcout[21], pcout[20], pcout[19], pcout[18], pcout[17], pcout[16], pcout[15], pcout[14], pcout[13], pcout[12], pcout[11], pcout[10], 
pcout[9], pcout[8], pcout[7], pcout[6], pcout[5], pcout[4], pcout[3], pcout[2], pcout[1], pcout[0]}),
    .A({b[17], b[16], b[15], b[14], b[13], b[12], b[11], b[10], b[9], b[8], b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0]}),
    .M({\NLW_blk00000001/blk00000004_M<35>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<34>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_M<33>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<32>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<31>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_M<30>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<29>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<28>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_M<27>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<26>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<25>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_M<24>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<23>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<22>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_M<21>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<20>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<19>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_M<18>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<17>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<16>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_M<15>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<14>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<13>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_M<12>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<11>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<10>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_M<9>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<8>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<7>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_M<6>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<5>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<4>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_M<3>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<2>_UNCONNECTED , \NLW_blk00000001/blk00000004_M<1>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_M<0>_UNCONNECTED })
  );
  GND   \blk00000001/blk00000003  (
    .G(\blk00000001/sig000000d3 )
  );
  VCC   \blk00000001/blk00000002  (
    .P(\blk00000001/sig000000ca )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
