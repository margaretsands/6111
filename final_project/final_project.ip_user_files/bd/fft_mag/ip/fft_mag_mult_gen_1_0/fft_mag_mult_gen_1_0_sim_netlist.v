// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Wed Nov 14 18:26:46 2018
// Host        : eecs-digital-16 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /afs/athena.mit.edu/user/j/o/joannas/Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_mult_gen_1_0/fft_mag_mult_gen_1_0_sim_netlist.v
// Design      : fft_mag_mult_gen_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_mult_gen_1_0,mult_gen_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_11,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module fft_mag_mult_gen_1_0
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [31:0]P;

  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [31:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "31" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_mult_gen_1_0_mult_gen_v12_0_11 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "16" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "16" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "31" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_11" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module fft_mag_mult_gen_1_0_mult_gen_v12_0_11
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [15:0]A;
  input [15:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [31:0]P;
  output [47:0]PCASC;

  wire [15:0]A;
  wire [15:0]B;
  wire CE;
  wire CLK;
  wire [31:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "31" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_mult_gen_1_0_mult_gen_v12_0_11_viv i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(SCLR),
        .ZERO_DETECT(ZERO_DETECT));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
gD7l84kB+WAh1ATog3H36h0/cMgn9QL5jGe9p9PjvP7N+FJAVvGVlrxcgBw6dZaWDNZqNANQuRFv
ZSE8fsSCFg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
YQUcxim/tlzHeVlJ7otHN7u41KO3Yg5DFb1yF4GCsbXGLtUvWNlkFjY+UPIlgYImR4Zo4dTHJQ+j
3BaUNSUOqAVzT9CfyUelv2YD2ZTfAtzIe1Mboyb3+StKnuzxnZmIhVPiZlowdW5lQ1r7BjDPOsge
ztxOfUTbvYcTUE1ABIE=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
eu4MFD/NMz3pssr62VCh1XDd9mthYydX9VaOq3lWUwHi5/7e5dl2SAWHtYwTnBgGPY+jCcMycJhy
WSlkhQxVj5BsMm2aAItwXFvH2mSbjlPggtI0/+DNGQ4x8LQSFLTDYnnQbBrHlJymsS+/asMkXACD
SJ2tF8LF5tMhAlMPZZ0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rNAzbNlIFUMjdhvgzZ2FokzvR4AuFtV+1AHGDKa9QgeBsZ1e0Fom48uKbJ9iakvqUoUcKKAvRzeY
OBkbx9P7Imx0gvIgzFsgiVw23cBYWOhbhSqVb7mef9aKx8yeF8T48n7gKldUkwBHIPeqaayRI9/Q
HCZO+k2+HCjRZE6L/Gzd+IOdEVUFOg3NtWFPk2JFkfZkxs8X7Vg/xxtvH7uvp+/EbVyiMbnwDT/p
NSqOyA+rJwBJYD3xRIPTFDI83XJLCF+1i4E8hyu7Y0F9MtjKugqEHwAG+JK3jde00nzNNaeLVUQ1
OfFMZJpkk0Cg66d2cvJY/G11oPkmvTq/JZ4+5g==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
apuTRT8aJu0TR7Ciy6ONiGK4AT7TUEiokS4gFf1g+kDg6PdKk9VRun4HKszIadRtahjPQo0of9uS
yvu3GS4EQo+Y+T116wnAIXnZSa8EQaEsDkziOI+rCvXv8IgaPYN8Cq0aRlASFL7IHOWNI49V0c0A
FIG/+5U7ZyNQFCVwuE4gCgK/pA6apm5kY4FGJft/EdZ5YAbR/nCTzK4P53+XsKHrtGfw+/MthFWz
tI0OtloKqc7laKZWKOVFqWq8Qmq7UL6utFODtxEQqzczH+q+Gw4rkUyOosIY+cbB67hX+GlmXXEF
jMwvUcen9t6c+wiH6rmBDcUIiuUHHz6q+jCwJQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dfDj35aI8y6zqcW/IHFxmCDw2mpyex25qQAUnsL+tIRxivv/85PqpCOrf3b7NWnwUKMrsxtw+JBY
mtlPsVxQKR1gn6VkaHwbEgwxXXxFe71Z+1nWQhfF8Nt55jGvq1joWKMrurSV7Mo+HkvHMSszXj3v
8ElD0S6sN91oml0nObejOhxzHf0ybK+sGag+CFA7aBr4k4rYglf7AzOYrPl3nNoCkyrFDQFa46/w
SXJm/os7zUHbsDI5GGUH3BU+NktHZV6GK3iyhtHTwrMgDtpGk6vKHMKULM1Gjv9g1/jp9Ao4cUhr
bCVOXM1v2e8A3564rmh3if78zTzCKamPRAB5Ig==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
QiSuMTz14qcOD2WxIkWQf8sS3wCvHYv9zSgY1Zymx7CmJSUwpk7dDwmtsKEwhdBTqikVqdWhGmSN
LPjxI5/rwSjwLbhHnAAc8mVR+ZBZvBVSBnmqycUfbxVrCmZK/SGTPxytZUj2ojoWV5JfQEU6uEv0
PlagEtmaRDTmFyi36YpNdDvIBpFF5c+GcgaHagBigTRT5go4pQ7mFehVYTfRmaPSEJz/k3hnfjv7
U+uNCWt/gFloHrZV62oReO85kf4p9L8etANcMMEV/zVdCoaSxFydKAXOi7mDQFHahFBkGvXjGv2f
OzU9ud2iAqMTFw5M+u3gCiTB/17ayiKwLWzJpQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
QhEXeE+6DD9MbSHR/WEPo1Y6HhBt0Ivc9yK/Z/kDoz3uOARIeVkvQqj/vw1noV6DdBmAxFhTyZV7
/gF9BFE3Tu/Aagcf9G7lD17uS1YjoFSbN3W9ZF4JwsVciggfLhVe8x96DAWuKMyplSJcJ7vQ6mmr
RBjfLyVEWqC/WR2v0XxqiFB3NbRar7U7HhS3TOY4WmWnqwZ46FVFBWNnYfzm8GrlXNypdV1Rn6QJ
KnHqFY5oA4lX5QZamLR1STLiVPoFea4/Qs7e9Vfbw4QodcWbeI1FSGx6D/ZED5FTxae9UvkfYcH6
gTqH38LTW7TIbDRSQg0bcxO2zmw16UHAXXZcHw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7264)
`pragma protect data_block
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
r5Tf0anrv0rUNjVxzXPEkInSAOYWWmiv5Q==
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
