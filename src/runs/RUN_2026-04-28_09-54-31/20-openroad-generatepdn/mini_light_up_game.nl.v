module mini_light_up_game (btn,
    clk,
    reset,
    seg0,
    seg1,
    seg2,
    seg3,
    VPWR,
    VGND);
 input btn;
 input clk;
 input reset;
 output [6:0] seg0;
 output [6:0] seg1;
 output [6:0] seg2;
 output [6:0] seg3;
 inout VPWR;
 inout VGND;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire btn_prev;
 wire \cnt[0] ;
 wire \cnt[1] ;
 wire \cursor[0] ;
 wire \cursor[1] ;
 wire \cursor[2] ;
 wire \cursor[3] ;
 wire \cursor[4] ;
 wire \cursor[5] ;
 wire \done_comb[0] ;
 wire \done_comb[1] ;
 wire \done_comb[2] ;
 wire \done_ff[0] ;
 wire \done_ff[1] ;
 wire \done_ff[2] ;
 wire \mem0[0] ;
 wire \mem0[1] ;
 wire \mem0[2] ;
 wire \mem0[3] ;
 wire \mem0[4] ;
 wire \mem0[5] ;
 wire \mem1[0] ;
 wire \mem1[1] ;
 wire \mem1[2] ;
 wire \mem1[3] ;
 wire \mem1[4] ;
 wire \mem1[5] ;
 wire \mem2[0] ;
 wire \mem2[1] ;
 wire \mem2[2] ;
 wire \mem2[3] ;
 wire \mem2[4] ;
 wire \mem2[5] ;
 wire \mem3[0] ;
 wire \mem3[1] ;
 wire \mem3[2] ;
 wire \mem3[3] ;
 wire \mem3[4] ;
 wire \mem3[5] ;
 wire \nxt0[0] ;
 wire \nxt0[1] ;
 wire \nxt0[2] ;
 wire \nxt0[3] ;
 wire \nxt0[4] ;
 wire \nxt0[5] ;
 wire \nxt1[0] ;
 wire \nxt1[1] ;
 wire \nxt1[2] ;
 wire \nxt1[3] ;
 wire \nxt1[4] ;
 wire \nxt1[5] ;
 wire \nxt2[0] ;
 wire \nxt2[1] ;
 wire \nxt2[2] ;
 wire \nxt2[3] ;
 wire \nxt2[4] ;
 wire \nxt2[5] ;
 wire \nxt3[0] ;
 wire \nxt3[1] ;
 wire \nxt3[2] ;
 wire \nxt3[3] ;
 wire \nxt3[4] ;
 wire \nxt3[5] ;

 sky130_fd_sc_hd__inv_2 _049_ (.A(\cnt[1] ),
    .Y(_038_));
 sky130_fd_sc_hd__inv_2 _050_ (.A(\cnt[0] ),
    .Y(_039_));
 sky130_fd_sc_hd__inv_2 _051_ (.A(reset),
    .Y(_000_));
 sky130_fd_sc_hd__and4bb_2 _052_ (.A_N(\cnt[1] ),
    .B_N(btn_prev),
    .C(btn),
    .D(\cnt[0] ),
    .X(_040_));
 sky130_fd_sc_hd__a21o_2 _053_ (.A1(\done_ff[1] ),
    .A2(_040_),
    .B1(\cnt[1] ),
    .X(_037_));
 sky130_fd_sc_hd__and4b_2 _054_ (.A_N(btn_prev),
    .B(btn),
    .C(\done_ff[2] ),
    .D(\cnt[1] ),
    .X(_041_));
 sky130_fd_sc_hd__nor4b_2 _055_ (.A(\cnt[1] ),
    .B(\cnt[0] ),
    .C(btn_prev),
    .D_N(btn),
    .Y(_042_));
 sky130_fd_sc_hd__a21o_2 _056_ (.A1(\done_ff[0] ),
    .A2(_042_),
    .B1(_041_),
    .X(_043_));
 sky130_fd_sc_hd__o2bb2a_2 _057_ (.A1_N(\done_ff[1] ),
    .A2_N(_040_),
    .B1(_043_),
    .B2(\cnt[0] ),
    .X(_036_));
 sky130_fd_sc_hd__a31o_2 _058_ (.A1(_038_),
    .A2(_039_),
    .A3(\cursor[0] ),
    .B1(\mem0[0] ),
    .X(seg0[0]));
 sky130_fd_sc_hd__a21o_2 _059_ (.A1(\cursor[0] ),
    .A2(_042_),
    .B1(\mem0[0] ),
    .X(\nxt0[0] ));
 sky130_fd_sc_hd__a31o_2 _060_ (.A1(_038_),
    .A2(_039_),
    .A3(\cursor[1] ),
    .B1(\mem0[1] ),
    .X(seg0[1]));
 sky130_fd_sc_hd__a21o_2 _061_ (.A1(\cursor[1] ),
    .A2(_042_),
    .B1(\mem0[1] ),
    .X(\nxt0[1] ));
 sky130_fd_sc_hd__a31o_2 _062_ (.A1(_038_),
    .A2(_039_),
    .A3(\cursor[2] ),
    .B1(\mem0[2] ),
    .X(seg0[2]));
 sky130_fd_sc_hd__a21o_2 _063_ (.A1(\cursor[2] ),
    .A2(_042_),
    .B1(\mem0[2] ),
    .X(\nxt0[2] ));
 sky130_fd_sc_hd__a31o_2 _064_ (.A1(_038_),
    .A2(_039_),
    .A3(\cursor[3] ),
    .B1(\mem0[3] ),
    .X(seg0[3]));
 sky130_fd_sc_hd__a21o_2 _065_ (.A1(\cursor[3] ),
    .A2(_042_),
    .B1(\mem0[3] ),
    .X(\nxt0[3] ));
 sky130_fd_sc_hd__a31o_2 _066_ (.A1(_038_),
    .A2(_039_),
    .A3(\cursor[4] ),
    .B1(\mem0[4] ),
    .X(seg0[4]));
 sky130_fd_sc_hd__a21o_2 _067_ (.A1(\cursor[4] ),
    .A2(_042_),
    .B1(\mem0[4] ),
    .X(\nxt0[4] ));
 sky130_fd_sc_hd__a31o_2 _068_ (.A1(_038_),
    .A2(_039_),
    .A3(\cursor[5] ),
    .B1(\mem0[5] ),
    .X(seg0[5]));
 sky130_fd_sc_hd__a21o_2 _069_ (.A1(\cursor[5] ),
    .A2(_042_),
    .B1(\mem0[5] ),
    .X(\nxt0[5] ));
 sky130_fd_sc_hd__and4_2 _070_ (.A(\nxt0[2] ),
    .B(\nxt0[3] ),
    .C(\nxt0[4] ),
    .D(\nxt0[5] ),
    .X(_044_));
 sky130_fd_sc_hd__and3_2 _071_ (.A(\nxt0[0] ),
    .B(\nxt0[1] ),
    .C(_044_),
    .X(\done_comb[0] ));
 sky130_fd_sc_hd__a31o_2 _072_ (.A1(_038_),
    .A2(\cnt[0] ),
    .A3(\cursor[0] ),
    .B1(\mem1[0] ),
    .X(seg1[0]));
 sky130_fd_sc_hd__a21o_2 _073_ (.A1(\cursor[0] ),
    .A2(_040_),
    .B1(\mem1[0] ),
    .X(\nxt1[0] ));
 sky130_fd_sc_hd__a31o_2 _074_ (.A1(_038_),
    .A2(\cnt[0] ),
    .A3(\cursor[1] ),
    .B1(\mem1[1] ),
    .X(seg1[1]));
 sky130_fd_sc_hd__a21o_2 _075_ (.A1(\cursor[1] ),
    .A2(_040_),
    .B1(\mem1[1] ),
    .X(\nxt1[1] ));
 sky130_fd_sc_hd__a31o_2 _076_ (.A1(_038_),
    .A2(\cnt[0] ),
    .A3(\cursor[2] ),
    .B1(\mem1[2] ),
    .X(seg1[2]));
 sky130_fd_sc_hd__a21o_2 _077_ (.A1(\cursor[2] ),
    .A2(_040_),
    .B1(\mem1[2] ),
    .X(\nxt1[2] ));
 sky130_fd_sc_hd__a31o_2 _078_ (.A1(_038_),
    .A2(\cnt[0] ),
    .A3(\cursor[3] ),
    .B1(\mem1[3] ),
    .X(seg1[3]));
 sky130_fd_sc_hd__a21o_2 _079_ (.A1(\cursor[3] ),
    .A2(_040_),
    .B1(\mem1[3] ),
    .X(\nxt1[3] ));
 sky130_fd_sc_hd__a31o_2 _080_ (.A1(_038_),
    .A2(\cnt[0] ),
    .A3(\cursor[4] ),
    .B1(\mem1[4] ),
    .X(seg1[4]));
 sky130_fd_sc_hd__a21o_2 _081_ (.A1(\cursor[4] ),
    .A2(_040_),
    .B1(\mem1[4] ),
    .X(\nxt1[4] ));
 sky130_fd_sc_hd__a31o_2 _082_ (.A1(_038_),
    .A2(\cnt[0] ),
    .A3(\cursor[5] ),
    .B1(\mem1[5] ),
    .X(seg1[5]));
 sky130_fd_sc_hd__a21o_2 _083_ (.A1(\cursor[5] ),
    .A2(_040_),
    .B1(\mem1[5] ),
    .X(\nxt1[5] ));
 sky130_fd_sc_hd__and4_2 _084_ (.A(\nxt1[2] ),
    .B(\nxt1[3] ),
    .C(\nxt1[4] ),
    .D(\nxt1[5] ),
    .X(_045_));
 sky130_fd_sc_hd__and3_2 _085_ (.A(\nxt1[0] ),
    .B(\nxt1[1] ),
    .C(_045_),
    .X(\done_comb[1] ));
 sky130_fd_sc_hd__a31o_2 _086_ (.A1(\cnt[1] ),
    .A2(_039_),
    .A3(\cursor[0] ),
    .B1(\mem2[0] ),
    .X(seg2[0]));
 sky130_fd_sc_hd__and4bb_2 _087_ (.A_N(\cnt[0] ),
    .B_N(btn_prev),
    .C(btn),
    .D(\cnt[1] ),
    .X(_046_));
 sky130_fd_sc_hd__a21o_2 _088_ (.A1(\cursor[0] ),
    .A2(_046_),
    .B1(\mem2[0] ),
    .X(\nxt2[0] ));
 sky130_fd_sc_hd__a31o_2 _089_ (.A1(\cnt[1] ),
    .A2(_039_),
    .A3(\cursor[1] ),
    .B1(\mem2[1] ),
    .X(seg2[1]));
 sky130_fd_sc_hd__a21o_2 _090_ (.A1(\cursor[1] ),
    .A2(_046_),
    .B1(\mem2[1] ),
    .X(\nxt2[1] ));
 sky130_fd_sc_hd__a31o_2 _091_ (.A1(\cnt[1] ),
    .A2(_039_),
    .A3(\cursor[2] ),
    .B1(\mem2[2] ),
    .X(seg2[2]));
 sky130_fd_sc_hd__a21o_2 _092_ (.A1(\cursor[2] ),
    .A2(_046_),
    .B1(\mem2[2] ),
    .X(\nxt2[2] ));
 sky130_fd_sc_hd__a31o_2 _093_ (.A1(\cnt[1] ),
    .A2(_039_),
    .A3(\cursor[3] ),
    .B1(\mem2[3] ),
    .X(seg2[3]));
 sky130_fd_sc_hd__a21o_2 _094_ (.A1(\cursor[3] ),
    .A2(_046_),
    .B1(\mem2[3] ),
    .X(\nxt2[3] ));
 sky130_fd_sc_hd__a31o_2 _095_ (.A1(\cnt[1] ),
    .A2(_039_),
    .A3(\cursor[4] ),
    .B1(\mem2[4] ),
    .X(seg2[4]));
 sky130_fd_sc_hd__a21o_2 _096_ (.A1(\cursor[4] ),
    .A2(_046_),
    .B1(\mem2[4] ),
    .X(\nxt2[4] ));
 sky130_fd_sc_hd__a31o_2 _097_ (.A1(\cnt[1] ),
    .A2(_039_),
    .A3(\cursor[5] ),
    .B1(\mem2[5] ),
    .X(seg2[5]));
 sky130_fd_sc_hd__a21o_2 _098_ (.A1(\cursor[5] ),
    .A2(_046_),
    .B1(\mem2[5] ),
    .X(\nxt2[5] ));
 sky130_fd_sc_hd__and4_2 _099_ (.A(\nxt2[2] ),
    .B(\nxt2[3] ),
    .C(\nxt2[4] ),
    .D(\nxt2[5] ),
    .X(_047_));
 sky130_fd_sc_hd__and3_2 _100_ (.A(\nxt2[0] ),
    .B(\nxt2[1] ),
    .C(_047_),
    .X(\done_comb[2] ));
 sky130_fd_sc_hd__a31o_2 _101_ (.A1(\cnt[1] ),
    .A2(\cnt[0] ),
    .A3(\cursor[0] ),
    .B1(\mem3[0] ),
    .X(seg3[0]));
 sky130_fd_sc_hd__and4b_2 _102_ (.A_N(btn_prev),
    .B(btn),
    .C(\cnt[1] ),
    .D(\cnt[0] ),
    .X(_048_));
 sky130_fd_sc_hd__a21o_2 _103_ (.A1(\cursor[0] ),
    .A2(_048_),
    .B1(\mem3[0] ),
    .X(\nxt3[0] ));
 sky130_fd_sc_hd__a31o_2 _104_ (.A1(\cnt[1] ),
    .A2(\cnt[0] ),
    .A3(\cursor[1] ),
    .B1(\mem3[1] ),
    .X(seg3[1]));
 sky130_fd_sc_hd__a21o_2 _105_ (.A1(\cursor[1] ),
    .A2(_048_),
    .B1(\mem3[1] ),
    .X(\nxt3[1] ));
 sky130_fd_sc_hd__a31o_2 _106_ (.A1(\cnt[1] ),
    .A2(\cnt[0] ),
    .A3(\cursor[2] ),
    .B1(\mem3[2] ),
    .X(seg3[2]));
 sky130_fd_sc_hd__a21o_2 _107_ (.A1(\cursor[2] ),
    .A2(_048_),
    .B1(\mem3[2] ),
    .X(\nxt3[2] ));
 sky130_fd_sc_hd__a31o_2 _108_ (.A1(\cnt[1] ),
    .A2(\cnt[0] ),
    .A3(\cursor[3] ),
    .B1(\mem3[3] ),
    .X(seg3[3]));
 sky130_fd_sc_hd__a21o_2 _109_ (.A1(\cursor[3] ),
    .A2(_048_),
    .B1(\mem3[3] ),
    .X(\nxt3[3] ));
 sky130_fd_sc_hd__a31o_2 _110_ (.A1(\cnt[1] ),
    .A2(\cnt[0] ),
    .A3(\cursor[4] ),
    .B1(\mem3[4] ),
    .X(seg3[4]));
 sky130_fd_sc_hd__a21o_2 _111_ (.A1(\cursor[4] ),
    .A2(_048_),
    .B1(\mem3[4] ),
    .X(\nxt3[4] ));
 sky130_fd_sc_hd__a31o_2 _112_ (.A1(\cnt[1] ),
    .A2(\cnt[0] ),
    .A3(\cursor[5] ),
    .B1(\mem3[5] ),
    .X(seg3[5]));
 sky130_fd_sc_hd__a21o_2 _113_ (.A1(\cursor[5] ),
    .A2(_048_),
    .B1(\mem3[5] ),
    .X(\nxt3[5] ));
 sky130_fd_sc_hd__inv_2 _114_ (.A(reset),
    .Y(_001_));
 sky130_fd_sc_hd__inv_2 _115_ (.A(reset),
    .Y(_002_));
 sky130_fd_sc_hd__inv_2 _116_ (.A(reset),
    .Y(_003_));
 sky130_fd_sc_hd__inv_2 _117_ (.A(reset),
    .Y(_004_));
 sky130_fd_sc_hd__inv_2 _118_ (.A(reset),
    .Y(_005_));
 sky130_fd_sc_hd__inv_2 _119_ (.A(reset),
    .Y(_006_));
 sky130_fd_sc_hd__inv_2 _120_ (.A(reset),
    .Y(_007_));
 sky130_fd_sc_hd__inv_2 _121_ (.A(reset),
    .Y(_008_));
 sky130_fd_sc_hd__inv_2 _122_ (.A(reset),
    .Y(_009_));
 sky130_fd_sc_hd__inv_2 _123_ (.A(reset),
    .Y(_010_));
 sky130_fd_sc_hd__inv_2 _124_ (.A(reset),
    .Y(_011_));
 sky130_fd_sc_hd__inv_2 _125_ (.A(reset),
    .Y(_012_));
 sky130_fd_sc_hd__inv_2 _126_ (.A(reset),
    .Y(_013_));
 sky130_fd_sc_hd__inv_2 _127_ (.A(reset),
    .Y(_014_));
 sky130_fd_sc_hd__inv_2 _128_ (.A(reset),
    .Y(_015_));
 sky130_fd_sc_hd__inv_2 _129_ (.A(reset),
    .Y(_016_));
 sky130_fd_sc_hd__inv_2 _130_ (.A(reset),
    .Y(_017_));
 sky130_fd_sc_hd__inv_2 _131_ (.A(reset),
    .Y(_018_));
 sky130_fd_sc_hd__inv_2 _132_ (.A(reset),
    .Y(_019_));
 sky130_fd_sc_hd__inv_2 _133_ (.A(reset),
    .Y(_020_));
 sky130_fd_sc_hd__inv_2 _134_ (.A(reset),
    .Y(_021_));
 sky130_fd_sc_hd__inv_2 _135_ (.A(reset),
    .Y(_022_));
 sky130_fd_sc_hd__inv_2 _136_ (.A(reset),
    .Y(_023_));
 sky130_fd_sc_hd__inv_2 _137_ (.A(reset),
    .Y(_024_));
 sky130_fd_sc_hd__inv_2 _138_ (.A(reset),
    .Y(_025_));
 sky130_fd_sc_hd__inv_2 _139_ (.A(reset),
    .Y(_026_));
 sky130_fd_sc_hd__inv_2 _140_ (.A(reset),
    .Y(_027_));
 sky130_fd_sc_hd__inv_2 _141_ (.A(reset),
    .Y(_028_));
 sky130_fd_sc_hd__inv_2 _142_ (.A(reset),
    .Y(_029_));
 sky130_fd_sc_hd__inv_2 _143_ (.A(reset),
    .Y(_030_));
 sky130_fd_sc_hd__inv_2 _144_ (.A(reset),
    .Y(_031_));
 sky130_fd_sc_hd__inv_2 _145_ (.A(reset),
    .Y(_032_));
 sky130_fd_sc_hd__inv_2 _146_ (.A(reset),
    .Y(_033_));
 sky130_fd_sc_hd__inv_2 _147_ (.A(reset),
    .Y(_034_));
 sky130_fd_sc_hd__inv_2 _148_ (.A(reset),
    .Y(_035_));
 sky130_fd_sc_hd__dfrtp_2 _149_ (.CLK(clk),
    .D(\nxt0[0] ),
    .RESET_B(_000_),
    .Q(\mem0[0] ));
 sky130_fd_sc_hd__dfrtp_2 _150_ (.CLK(clk),
    .D(\nxt0[1] ),
    .RESET_B(_001_),
    .Q(\mem0[1] ));
 sky130_fd_sc_hd__dfrtp_2 _151_ (.CLK(clk),
    .D(\nxt0[2] ),
    .RESET_B(_002_),
    .Q(\mem0[2] ));
 sky130_fd_sc_hd__dfrtp_2 _152_ (.CLK(clk),
    .D(\nxt0[3] ),
    .RESET_B(_003_),
    .Q(\mem0[3] ));
 sky130_fd_sc_hd__dfrtp_2 _153_ (.CLK(clk),
    .D(\nxt0[4] ),
    .RESET_B(_004_),
    .Q(\mem0[4] ));
 sky130_fd_sc_hd__dfrtp_2 _154_ (.CLK(clk),
    .D(\nxt0[5] ),
    .RESET_B(_005_),
    .Q(\mem0[5] ));
 sky130_fd_sc_hd__dfrtp_2 _155_ (.CLK(clk),
    .D(\nxt1[0] ),
    .RESET_B(_006_),
    .Q(\mem1[0] ));
 sky130_fd_sc_hd__dfrtp_2 _156_ (.CLK(clk),
    .D(\nxt1[1] ),
    .RESET_B(_007_),
    .Q(\mem1[1] ));
 sky130_fd_sc_hd__dfrtp_2 _157_ (.CLK(clk),
    .D(\nxt1[2] ),
    .RESET_B(_008_),
    .Q(\mem1[2] ));
 sky130_fd_sc_hd__dfrtp_2 _158_ (.CLK(clk),
    .D(\nxt1[3] ),
    .RESET_B(_009_),
    .Q(\mem1[3] ));
 sky130_fd_sc_hd__dfrtp_2 _159_ (.CLK(clk),
    .D(\nxt1[4] ),
    .RESET_B(_010_),
    .Q(\mem1[4] ));
 sky130_fd_sc_hd__dfrtp_2 _160_ (.CLK(clk),
    .D(\nxt1[5] ),
    .RESET_B(_011_),
    .Q(\mem1[5] ));
 sky130_fd_sc_hd__dfrtp_2 _161_ (.CLK(clk),
    .D(\nxt2[0] ),
    .RESET_B(_012_),
    .Q(\mem2[0] ));
 sky130_fd_sc_hd__dfrtp_2 _162_ (.CLK(clk),
    .D(\nxt2[1] ),
    .RESET_B(_013_),
    .Q(\mem2[1] ));
 sky130_fd_sc_hd__dfrtp_2 _163_ (.CLK(clk),
    .D(\nxt2[2] ),
    .RESET_B(_014_),
    .Q(\mem2[2] ));
 sky130_fd_sc_hd__dfrtp_2 _164_ (.CLK(clk),
    .D(\nxt2[3] ),
    .RESET_B(_015_),
    .Q(\mem2[3] ));
 sky130_fd_sc_hd__dfrtp_2 _165_ (.CLK(clk),
    .D(\nxt2[4] ),
    .RESET_B(_016_),
    .Q(\mem2[4] ));
 sky130_fd_sc_hd__dfrtp_2 _166_ (.CLK(clk),
    .D(\nxt2[5] ),
    .RESET_B(_017_),
    .Q(\mem2[5] ));
 sky130_fd_sc_hd__dfrtp_2 _167_ (.CLK(clk),
    .D(\nxt3[0] ),
    .RESET_B(_018_),
    .Q(\mem3[0] ));
 sky130_fd_sc_hd__dfrtp_2 _168_ (.CLK(clk),
    .D(\nxt3[1] ),
    .RESET_B(_019_),
    .Q(\mem3[1] ));
 sky130_fd_sc_hd__dfrtp_2 _169_ (.CLK(clk),
    .D(\nxt3[2] ),
    .RESET_B(_020_),
    .Q(\mem3[2] ));
 sky130_fd_sc_hd__dfrtp_2 _170_ (.CLK(clk),
    .D(\nxt3[3] ),
    .RESET_B(_021_),
    .Q(\mem3[3] ));
 sky130_fd_sc_hd__dfrtp_2 _171_ (.CLK(clk),
    .D(\nxt3[4] ),
    .RESET_B(_022_),
    .Q(\mem3[4] ));
 sky130_fd_sc_hd__dfrtp_2 _172_ (.CLK(clk),
    .D(\nxt3[5] ),
    .RESET_B(_023_),
    .Q(\mem3[5] ));
 sky130_fd_sc_hd__dfrtp_2 _173_ (.CLK(clk),
    .D(\done_comb[0] ),
    .RESET_B(_024_),
    .Q(\done_ff[0] ));
 sky130_fd_sc_hd__dfrtp_2 _174_ (.CLK(clk),
    .D(\done_comb[1] ),
    .RESET_B(_025_),
    .Q(\done_ff[1] ));
 sky130_fd_sc_hd__dfrtp_2 _175_ (.CLK(clk),
    .D(\done_comb[2] ),
    .RESET_B(_026_),
    .Q(\done_ff[2] ));
 sky130_fd_sc_hd__dfstp_2 _176_ (.CLK(clk),
    .D(\cursor[5] ),
    .SET_B(_027_),
    .Q(\cursor[0] ));
 sky130_fd_sc_hd__dfrtp_2 _177_ (.CLK(clk),
    .D(\cursor[0] ),
    .RESET_B(_028_),
    .Q(\cursor[1] ));
 sky130_fd_sc_hd__dfrtp_2 _178_ (.CLK(clk),
    .D(\cursor[1] ),
    .RESET_B(_029_),
    .Q(\cursor[2] ));
 sky130_fd_sc_hd__dfrtp_2 _179_ (.CLK(clk),
    .D(\cursor[2] ),
    .RESET_B(_030_),
    .Q(\cursor[3] ));
 sky130_fd_sc_hd__dfrtp_2 _180_ (.CLK(clk),
    .D(\cursor[3] ),
    .RESET_B(_031_),
    .Q(\cursor[4] ));
 sky130_fd_sc_hd__dfrtp_2 _181_ (.CLK(clk),
    .D(\cursor[4] ),
    .RESET_B(_032_),
    .Q(\cursor[5] ));
 sky130_fd_sc_hd__dfrtp_2 _182_ (.CLK(clk),
    .D(_036_),
    .RESET_B(_033_),
    .Q(\cnt[0] ));
 sky130_fd_sc_hd__dfrtp_2 _183_ (.CLK(clk),
    .D(_037_),
    .RESET_B(_034_),
    .Q(\cnt[1] ));
 sky130_fd_sc_hd__dfrtp_2 _184_ (.CLK(clk),
    .D(btn),
    .RESET_B(_035_),
    .Q(btn_prev));
 sky130_fd_sc_hd__conb_1 _185_ (.LO(seg0[6]));
 sky130_fd_sc_hd__conb_1 _186_ (.LO(seg1[6]));
 sky130_fd_sc_hd__conb_1 _187_ (.LO(seg2[6]));
 sky130_fd_sc_hd__conb_1 _188_ (.LO(seg3[6]));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Right_0 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Right_1 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Right_2 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Right_3 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Right_4 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Right_5 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Right_6 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Right_7 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Right_8 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Right_9 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Right_10 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Right_11 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Right_12 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Right_13 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Right_14 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Right_15 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Right_16 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Right_17 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Right_18 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Right_19 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_20_Right_20 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_21 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_22 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_23 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_24 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_25 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_26 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Left_27 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Left_28 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Left_29 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Left_30 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Left_31 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Left_32 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Left_33 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Left_34 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Left_35 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Left_36 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Left_37 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Left_38 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Left_39 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Left_40 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_20_Left_41 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_42 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_43 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_44 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_45 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_46 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_47 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_48 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_49 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_50 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_51 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_52 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_53 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_54 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_55 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_56 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_57 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_58 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_59 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_60 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_61 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_62 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_63 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_64 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_65 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_66 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_67 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_68 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_69 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_70 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_71 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_72 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_73 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_74 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_75 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_76 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_77 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_78 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_79 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_80 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_81 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_82 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_83 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_84 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_85 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_86 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_87 ();
endmodule
