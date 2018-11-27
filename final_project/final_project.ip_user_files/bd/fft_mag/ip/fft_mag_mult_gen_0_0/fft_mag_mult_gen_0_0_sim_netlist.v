// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Wed Nov 14 18:30:53 2018
// Host        : eecs-digital-16 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /afs/athena.mit.edu/user/j/o/joannas/Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_mult_gen_0_0/fft_mag_mult_gen_0_0_sim_netlist.v
// Design      : fft_mag_mult_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_mult_gen_0_0,mult_gen_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_11,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module fft_mag_mult_gen_0_0
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
  fft_mag_mult_gen_0_0_mult_gen_v12_0_11 U0
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
module fft_mag_mult_gen_0_0_mult_gen_v12_0_11
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
  fft_mag_mult_gen_0_0_mult_gen_v12_0_11_viv i_mult
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
S1/JBzsyvKQhSxD2l+lPnQN5FQun/PlRag7JqTVCkf6tWr1lzOGlesIXEsYd6jV2ehxKDCTdzHRD
oF5FJUh+oWmH12DLbH7JABg+1iX2ef7Z/2t6fzr2g4g572RurG+4fMf/Du4pU9P95WrfVEEcUcOj
vVlnPa43TIAoqP6orzj9Yp85Bq8+/koYI77bXCjlOpm2an8P1xbFWS0wYwPmJFpZ9MOE495gtW4o
ePNzYCMfJMOJN2KLeORtt2eGFyj+0hjSAcFQ+7mc8jXzehreKq0GXWfa2+1xi8JdXGyUaVcN5jws
zu4KgV5fZjB+VdKbf+WEGhIHGFJPLXs0AfU0Hw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
wEHi+D4wvtM+gVY8cnDjPIR5bvzIOqVGurAOf/5Mv2K2Be+EWczUadczIrF8yAkc4KVSpu7PKu12
PySjopc5Wzky5Es23H8JzqfLsktulS+dTPNdMqs0jJgeerxj6laBnVrosms3afmLDVGgRb80k+Xf
5hVIfMIJ+40EqDQd/oIExUT2TnkHo0knZK+GOEOJ9FXhEcHxgUPUhs+lk8v9Bm1WLyhkwmrjaGto
kc8e3qciu0rJ6TBHGo0UO7/oEZNz+RIJPb8nII7FY1bB2Sv/l2H7QgamJ8ZNDO6rNcV/dABZ5oN4
ZJYdGhXyQdiEDUW4EcqQ7LXQ+EGw6gEPbvNHRw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7264)
`pragma protect data_block
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
AMHZZroIyNA60KjpPJwEC6WOJwoG1g8H2w==
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
