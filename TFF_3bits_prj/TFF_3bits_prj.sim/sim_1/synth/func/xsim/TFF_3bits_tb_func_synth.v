// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed Nov 11 10:38:56 2020
// Host        : DESKTOP-L84ILBF running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               D:/s181703/TFF_3bits_prj/TFF_3bits_prj.sim/sim_1/synth/func/xsim/TFF_3bits_tb_func_synth.v
// Design      : TFF_3bits
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module TFF_3bits
   (sysclk,
    btn,
    led);
  input sysclk;
  input [3:0]btn;
  output [3:0]led;

  wire \Q[0]_i_1_n_0 ;
  wire \Q[1]_i_1_n_0 ;
  wire \Q[2]_i_1_n_0 ;
  wire [3:0]btn;
  wire [2:0]btnC;
  wire [2:0]btnD;
  wire [3:0]btn_IBUF;
  wire [3:0]led;
  wire [3:0]led_OBUF;
  wire sysclk;
  wire sysclk_IBUF;
  wire sysclk_IBUF_BUFG;

  LUT4 #(
    .INIT(16'h00A6)) 
    \Q[0]_i_1 
       (.I0(led_OBUF[0]),
        .I1(btnC[0]),
        .I2(btnD[0]),
        .I3(btn_IBUF[3]),
        .O(\Q[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00A6)) 
    \Q[1]_i_1 
       (.I0(led_OBUF[1]),
        .I1(btnC[1]),
        .I2(btnD[1]),
        .I3(btn_IBUF[3]),
        .O(\Q[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00A6)) 
    \Q[2]_i_1 
       (.I0(led_OBUF[2]),
        .I1(btnC[2]),
        .I2(btnD[2]),
        .I3(btn_IBUF[3]),
        .O(\Q[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q[0]_i_1_n_0 ),
        .Q(led_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q[1]_i_1_n_0 ),
        .Q(led_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q[2]_i_1_n_0 ),
        .Q(led_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \btnC_reg[0] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(btn_IBUF[0]),
        .Q(btnC[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \btnC_reg[1] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(btn_IBUF[1]),
        .Q(btnC[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \btnC_reg[2] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(btn_IBUF[2]),
        .Q(btnC[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \btnD_reg[0] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(btnC[0]),
        .Q(btnD[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \btnD_reg[1] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(btnC[1]),
        .Q(btnD[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \btnD_reg[2] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(btnC[2]),
        .Q(btnD[2]),
        .R(1'b0));
  IBUF \btn_IBUF[0]_inst 
       (.I(btn[0]),
        .O(btn_IBUF[0]));
  IBUF \btn_IBUF[1]_inst 
       (.I(btn[1]),
        .O(btn_IBUF[1]));
  IBUF \btn_IBUF[2]_inst 
       (.I(btn[2]),
        .O(btn_IBUF[2]));
  IBUF \btn_IBUF[3]_inst 
       (.I(btn[3]),
        .O(btn_IBUF[3]));
  OBUF \led_OBUF[0]_inst 
       (.I(led_OBUF[0]),
        .O(led[0]));
  OBUF \led_OBUF[1]_inst 
       (.I(led_OBUF[1]),
        .O(led[1]));
  OBUF \led_OBUF[2]_inst 
       (.I(led_OBUF[2]),
        .O(led[2]));
  OBUF \led_OBUF[3]_inst 
       (.I(led_OBUF[3]),
        .O(led[3]));
  FDRE #(
    .INIT(1'b0)) 
    resetD_reg
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(btn_IBUF[3]),
        .Q(led_OBUF[3]),
        .R(1'b0));
  BUFG sysclk_IBUF_BUFG_inst
       (.I(sysclk_IBUF),
        .O(sysclk_IBUF_BUFG));
  IBUF sysclk_IBUF_inst
       (.I(sysclk),
        .O(sysclk_IBUF));
endmodule
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

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
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
