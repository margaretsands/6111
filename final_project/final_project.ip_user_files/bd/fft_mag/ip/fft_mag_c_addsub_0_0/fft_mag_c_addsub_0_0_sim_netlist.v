// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Wed Nov 14 18:31:13 2018
// Host        : eecs-digital-16 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /afs/athena.mit.edu/user/j/o/joannas/Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/fft_mag_c_addsub_0_0_sim_netlist.v
// Design      : fft_mag_c_addsub_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_c_addsub_0_0,c_addsub_v12_0_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_9,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module fft_mag_c_addsub_0_0
   (A,
    B,
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [31:0]S;

  wire [31:0]A;
  wire [31:0]B;
  wire CE;
  wire [31:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_c_addsub_0_0_c_addsub_v12_0_9 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(CE),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "32" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "00000000000000000000000000000000" *) 
(* C_B_WIDTH = "32" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "32" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_9" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module fft_mag_c_addsub_0_0_c_addsub_v12_0_9
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [31:0]A;
  input [31:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [31:0]S;

  wire [31:0]A;
  wire ADD;
  wire [31:0]B;
  wire BYPASS;
  wire CE;
  wire CLK;
  wire C_IN;
  wire C_OUT;
  wire [31:0]S;
  wire SCLR;
  wire SINIT;
  wire SSET;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_c_addsub_0_0_c_addsub_v12_0_9_viv xst_addsub
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(BYPASS),
        .CE(CE),
        .CLK(CLK),
        .C_IN(C_IN),
        .C_OUT(C_OUT),
        .S(S),
        .SCLR(SCLR),
        .SINIT(SINIT),
        .SSET(SSET));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
A13f8tlz6UJG9JfCNcYl8NLUw8Tlctm35dCRvt/KCTpBFIuXlOawHL7sTHowWNnYPdFQNufThU2P
nq6r7CYRfg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
oJAsCu5zl/OMFEQsA8TK81YQdELnJEDcFa6KQ0EHWxmJrxei82pUrFKy5/0YZah/J8433WTkuMYX
n4DxKRAShIrdY1X7G4VuvTy06p94vL5LjcHyEy4fxae5eyT8gPJ2ix4XQa8NTiv0ndfGQZyw3Nh2
G2fKlAI5x3f8zwZZQY8=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
wvBGFVtHjRF0sOMF1pCWFAGskoPwO7T2ijyj/eL3cj3Mn4RaSun2E2ii2aHguV5ZVFP65oRsiH5d
RuZPDUKAsxBDhHSsGkFSPIwX9KivlJTo2FZHlBDTlkfDQbn+a3fWxc1HcR9KUBo8QndFpzMmqgOV
oDGrjFRMryCx3hlDJdU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UMkVtIsRH0SCXq8LQlXc2SFapNVFtJ6lm3Wp55oPh2JHEa2eDcLuSNAMzka2zwzCEXltR/XJthW1
e74yTmf22SChtep5vBZ+ajUd7h2t8MuWnhQAMciHkyF4IkU7ju3JOoQFlih3FqDO3aUJPcamhd7Q
ccMUMAhIvZFp44NdLzl8HbXnE1qh9bi1m8qU8jMCKESUZ7pg4lNlsQjd+Goa1H9iXaLEv3OfHZuq
AS/RQip05I1DUFL5hACAmmneYHUVM5S4EEaO3aHf1jZ3r/piru3ZRDHXxDir2Y9zXiL2oDUfsV5l
w+Pp691O/rBEAjBLQdevDcp/mZn7axrfo7gedQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BizuB2M20zTA5t6lHKGfnJrucOUdZ0HEVkxiYzkxLH0WP9VZIREBo09OejVavblw0lBdoToGD/Dx
ZN2JWgxB3v9b0Oe7EvwN3oB8w0TKm0RoqDmuPV8JuY7RwxtxkHcrVvcjXuOt8j2BPe5Ix86NYRxZ
8RqRFVGNyOVCKZuaFMVHI+ktnNU/xi6ZGsd+L0PEmNWeJ+y+7ubRYuJBTcZK6n0e0Rv144/nsqdy
X+40+rhcynqZUh14Jaqxwmyc8eu2wmo21it2TUiXXzLiWf9C/rPTasxTNu6GgF2yKIv/qtG5zsH5
iEI5vhFnzG+RShh+IHFb+FdSgnifLxcvxMZyfQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WBEZpdyDr9NfPjFUCp37UUdIujNIa897wZZ58/x9eMPhksqlKdy3SYhoDdl4U5n1JXPWIonhbpyY
qfWTq0gV9NaH1PiTuV9w+nrQziNvPhnHnWOzNrltlMQ+uTbMRquXZffmAQGphp7ekw56wGNMIqvn
BRmPzqHv8wZfX/RCaFbjfXAJEmAF89kl5TL3IWnE72Kb9o1cSvFtKTxyRoh9m9E0ghJdkhnRh4Pm
wU/+pIGwon3nUS1E00edVC7apMYbKm+8akp/2UT8ovmuCYJtcE90yRZZaeiFNpLq2UTmaGHp3XHC
2ziTOAA9fjUjv2jhCi5RMA2D0eDmOlHleltm9Q==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
J4yiBHGJC+gw849h18iGQMPciOuEGH+msbAUK3DPDWq6r+y4jhUGiSSANPyLV7S2BkvQ880V5uZH
/7+sS25z7oJMfr+IL1b4ec4qeHK2UYQGSmaqP35IItX/mvuvVgPNrKvY6ozQfsG9TZzdOwWLN6A7
07nbPkgkJbdHEtLV2eeGx0+IKR1cwFRBTwHUSwikQ5DsAUiZcvuFy3lp1lgFWLuBdf6YDcor9+70
LOEoDS6ULPj7T1jXA4E9rAqgxVu6yxFaSH/Ynw2OJffDcnakOXYxZXvWiMnyYdh24sIBNm3Gribb
Xcfa+ECfeTW3V6K/zaMpvu2FKDdAafmVtZVysw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
yIdUz7V6tyxEIxyUjJr9k9J7vAjL+bKkMKHxiah+HPQmVvhpv2fyiWK3nq09QjbsECxvAadHqesc
eLDAmNCzk09odxj0rRCmyOYb1oM4DZFbY09mxV+k3fIwD+WWuRNQwjpy6Q1YlVARt+cVe/4ejbAf
QcgpxZbWhTr38E24W0TUN844ju85YaJDl4yXJ/iKjwKIZgOUxbeHkmKCBzAJET34wjc59wHs9Pr9
TamV576DnIalKMNFbYp7Wa08AEU4u8r3837UBq9Wvs1ho+sEbmGLTyWzscL/IHwkndcNe1s0kG8w
xLXhdyO5tJZWH7vv7+ZCipcC18YBeck1CrDg/Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18768)
`pragma protect data_block
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
AHbhAYKcb3TRtmdp4yXK
`pragma protect end_protected
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
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
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
