////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.49d
//  \   \         Application: netgen
//  /   /         Filename: weighted_sum_start_slice.v
// /___/   /\     Timestamp: Sun Jun  8 04:02:39 2014
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog /home/shanel/research/neural-hardware/single-perceptron-demo/ipcore_dir/tmp/_cg/weighted_sum_start_slice.ngc /home/shanel/research/neural-hardware/single-perceptron-demo/ipcore_dir/tmp/_cg/weighted_sum_start_slice.v 
// Device	: 6slx9tqg144-3
// Input file	: /home/shanel/research/neural-hardware/single-perceptron-demo/ipcore_dir/tmp/_cg/weighted_sum_start_slice.ngc
// Output file	: /home/shanel/research/neural-hardware/single-perceptron-demo/ipcore_dir/tmp/_cg/weighted_sum_start_slice.v
// # of Modules	: 1
// Design Name	: weighted_sum_start_slice
// Xilinx        : /opt/Xilinx/14.4/ISE_DS/ISE/
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

module weighted_sum_start_slice (
  clk, a, b, pcout, p
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input [17 : 0] a;
  input [17 : 0] b;
  output [47 : 0] pcout;
  output [35 : 0] p;
  
  // synthesis translate_off
  
  wire \blk00000001/sig000000a4 ;
  wire \blk00000001/sig000000a3 ;
  wire \blk00000001/sig000000a2 ;
  wire \blk00000001/sig000000a1 ;
  wire \blk00000001/sig000000a0 ;
  wire \blk00000001/sig0000009f ;
  wire \blk00000001/sig0000009e ;
  wire \blk00000001/sig0000009d ;
  wire \blk00000001/sig0000009c ;
  wire \blk00000001/sig0000009b ;
  wire \blk00000001/sig0000009a ;
  wire \blk00000001/sig00000099 ;
  wire \blk00000001/sig00000098 ;
  wire \blk00000001/sig00000097 ;
  wire \blk00000001/sig00000096 ;
  wire \blk00000001/sig00000095 ;
  wire \blk00000001/sig00000094 ;
  wire \blk00000001/sig00000093 ;
  wire \blk00000001/sig00000092 ;
  wire \blk00000001/sig00000091 ;
  wire \blk00000001/sig00000090 ;
  wire \blk00000001/sig0000008f ;
  wire \blk00000001/sig0000008e ;
  wire \blk00000001/sig0000008d ;
  wire \blk00000001/sig0000008c ;
  wire \blk00000001/sig00000037 ;
  wire \blk00000001/sig00000036 ;
  wire \blk00000001/sig00000035 ;
  wire \blk00000001/sig00000034 ;
  wire \blk00000001/sig00000033 ;
  wire \blk00000001/sig00000032 ;
  wire \blk00000001/sig00000031 ;
  wire \blk00000001/sig00000030 ;
  wire \blk00000001/sig0000002f ;
  wire \blk00000001/sig0000002e ;
  wire \blk00000001/sig0000002d ;
  wire \blk00000001/sig0000002c ;
  wire \blk00000001/sig0000002b ;
  wire \blk00000001/sig0000002a ;
  wire \blk00000001/sig00000029 ;
  wire \blk00000001/sig00000028 ;
  wire \blk00000001/sig00000027 ;
  wire \blk00000001/sig00000026 ;
  wire \NLW_blk00000001/blk00000019_P<47>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_P<46>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_P<45>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_P<44>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_P<43>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_P<42>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_P<41>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_P<40>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_P<39>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_P<38>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_P<37>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_P<36>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<35>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<34>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<33>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<32>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<31>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<30>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000019_M<0>_UNCONNECTED ;
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
  \blk00000001/blk00000019  (
    .CECARRYIN(\blk00000001/sig0000008e ),
    .RSTC(\blk00000001/sig00000096 ),
    .RSTCARRYIN(\blk00000001/sig00000096 ),
    .CED(\blk00000001/sig0000008e ),
    .RSTD(\blk00000001/sig00000096 ),
    .CEOPMODE(\blk00000001/sig00000096 ),
    .CEC(\blk00000001/sig0000008e ),
    .CARRYOUTF(\blk00000001/sig0000008c ),
    .RSTOPMODE(\blk00000001/sig00000096 ),
    .RSTM(\blk00000001/sig00000096 ),
    .CLK(clk),
    .RSTB(\blk00000001/sig00000096 ),
    .CEM(\blk00000001/sig0000008e ),
    .CEB(\blk00000001/sig0000008e ),
    .CARRYIN(\blk00000001/sig00000096 ),
    .CEP(\blk00000001/sig0000008e ),
    .CEA(\blk00000001/sig0000008e ),
    .CARRYOUT(\blk00000001/sig0000008d ),
    .RSTA(\blk00000001/sig00000096 ),
    .RSTP(\blk00000001/sig00000096 ),
    .B({a[17], a[16], a[15], a[14], a[13], a[12], a[11], a[10], a[9], a[8], a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]}),
    .BCOUT({\blk00000001/sig00000026 , \blk00000001/sig00000027 , \blk00000001/sig00000028 , \blk00000001/sig00000029 , \blk00000001/sig0000002a , 
\blk00000001/sig0000002b , \blk00000001/sig0000002c , \blk00000001/sig0000002d , \blk00000001/sig0000002e , \blk00000001/sig0000002f , 
\blk00000001/sig00000030 , \blk00000001/sig00000031 , \blk00000001/sig00000032 , \blk00000001/sig00000033 , \blk00000001/sig00000034 , 
\blk00000001/sig00000035 , \blk00000001/sig00000036 , \blk00000001/sig00000037 }),
    .PCIN({\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 }),
    .C({\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 }),
    .P({\NLW_blk00000001/blk00000019_P<47>_UNCONNECTED , \NLW_blk00000001/blk00000019_P<46>_UNCONNECTED , 
\NLW_blk00000001/blk00000019_P<45>_UNCONNECTED , \NLW_blk00000001/blk00000019_P<44>_UNCONNECTED , \NLW_blk00000001/blk00000019_P<43>_UNCONNECTED , 
\NLW_blk00000001/blk00000019_P<42>_UNCONNECTED , \NLW_blk00000001/blk00000019_P<41>_UNCONNECTED , \NLW_blk00000001/blk00000019_P<40>_UNCONNECTED , 
\NLW_blk00000001/blk00000019_P<39>_UNCONNECTED , \NLW_blk00000001/blk00000019_P<38>_UNCONNECTED , \NLW_blk00000001/blk00000019_P<37>_UNCONNECTED , 
\NLW_blk00000001/blk00000019_P<36>_UNCONNECTED , p[35], p[34], p[33], p[32], p[31], p[30], p[29], p[28], p[27], p[26], p[25], p[24], p[23], p[22], 
p[21], p[20], p[19], p[18], p[17], p[16], p[15], p[14], p[13], p[12], p[11], p[10], p[9], p[8], p[7], p[6], p[5], p[4], p[3], p[2], p[1], p[0]}),
    .OPMODE({\blk00000001/sig00000094 , \blk00000001/sig00000096 , \blk00000001/sig0000008f , \blk00000001/sig00000096 , \blk00000001/sig00000093 , 
\blk00000001/sig00000092 , \blk00000001/sig00000091 , \blk00000001/sig00000090 }),
    .D({\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 , 
\blk00000001/sig00000096 , \blk00000001/sig00000096 , \blk00000001/sig00000096 }),
    .PCOUT({pcout[47], pcout[46], pcout[45], pcout[44], pcout[43], pcout[42], pcout[41], pcout[40], pcout[39], pcout[38], pcout[37], pcout[36], 
pcout[35], pcout[34], pcout[33], pcout[32], pcout[31], pcout[30], pcout[29], pcout[28], pcout[27], pcout[26], pcout[25], pcout[24], pcout[23], 
pcout[22], pcout[21], pcout[20], pcout[19], pcout[18], pcout[17], pcout[16], pcout[15], pcout[14], pcout[13], pcout[12], pcout[11], pcout[10], 
pcout[9], pcout[8], pcout[7], pcout[6], pcout[5], pcout[4], pcout[3], pcout[2], pcout[1], pcout[0]}),
    .A({b[17], b[16], b[15], b[14], b[13], b[12], b[11], b[10], b[9], b[8], b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0]}),
    .M({\NLW_blk00000001/blk00000019_M<35>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<34>_UNCONNECTED , 
\NLW_blk00000001/blk00000019_M<33>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<32>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<31>_UNCONNECTED , 
\NLW_blk00000001/blk00000019_M<30>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<29>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<28>_UNCONNECTED , 
\NLW_blk00000001/blk00000019_M<27>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<26>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<25>_UNCONNECTED , 
\NLW_blk00000001/blk00000019_M<24>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<23>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<22>_UNCONNECTED , 
\NLW_blk00000001/blk00000019_M<21>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<20>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<19>_UNCONNECTED , 
\NLW_blk00000001/blk00000019_M<18>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<17>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<16>_UNCONNECTED , 
\NLW_blk00000001/blk00000019_M<15>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<14>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<13>_UNCONNECTED , 
\NLW_blk00000001/blk00000019_M<12>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<11>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<10>_UNCONNECTED , 
\NLW_blk00000001/blk00000019_M<9>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<8>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<7>_UNCONNECTED , 
\NLW_blk00000001/blk00000019_M<6>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<5>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<4>_UNCONNECTED , 
\NLW_blk00000001/blk00000019_M<3>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<2>_UNCONNECTED , \NLW_blk00000001/blk00000019_M<1>_UNCONNECTED , 
\NLW_blk00000001/blk00000019_M<0>_UNCONNECTED })
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000018  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig0000008f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000017  (
    .C(clk),
    .D(\blk00000001/sig0000008e ),
    .Q(\blk00000001/sig00000095 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000016  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig00000097 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000015  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig00000098 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000014  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig00000099 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000013  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig0000009a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000012  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig0000009b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000011  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig0000009c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000010  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig0000009d )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000f  (
    .C(clk),
    .D(\blk00000001/sig00000095 ),
    .Q(\blk00000001/sig00000090 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000e  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig00000091 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000d  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig0000009e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000c  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig0000009f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000b  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig00000092 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000a  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig00000093 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000009  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig000000a0 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000008  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig00000094 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000007  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig000000a1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000006  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig000000a2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000005  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig000000a3 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000004  (
    .C(clk),
    .D(\blk00000001/sig00000096 ),
    .Q(\blk00000001/sig000000a4 )
  );
  GND   \blk00000001/blk00000003  (
    .G(\blk00000001/sig00000096 )
  );
  VCC   \blk00000001/blk00000002  (
    .P(\blk00000001/sig0000008e )
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
