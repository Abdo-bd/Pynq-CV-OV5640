// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module dilate (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        p_src_rows_read,
        p_src_cols_read,
        p_src_data_V_dout,
        p_src_data_V_empty_n,
        p_src_data_V_read,
        p_dst_data_V_din,
        p_dst_data_V_full_n,
        p_dst_data_V_write
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] p_src_rows_read;
input  [31:0] p_src_cols_read;
input  [7:0] p_src_data_V_dout;
input   p_src_data_V_empty_n;
output   p_src_data_V_read;
output  [7:0] p_dst_data_V_din;
input   p_dst_data_V_full_n;
output   p_dst_data_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg p_src_data_V_read;
reg p_dst_data_V_write;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [15:0] imgheight_fu_68_p1;
reg   [15:0] imgheight_reg_78;
wire   [15:0] imgwidth_fu_73_p1;
reg   [15:0] imgwidth_reg_83;
wire    grp_xfdilate_fu_58_ap_start;
wire    grp_xfdilate_fu_58_ap_done;
wire    grp_xfdilate_fu_58_ap_idle;
wire    grp_xfdilate_fu_58_ap_ready;
wire    grp_xfdilate_fu_58_p_src_data_V_read;
wire   [7:0] grp_xfdilate_fu_58_p_dst_data_V_din;
wire    grp_xfdilate_fu_58_p_dst_data_V_write;
reg    grp_xfdilate_fu_58_ap_start_reg;
wire    ap_CS_fsm_state2;
reg   [1:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 grp_xfdilate_fu_58_ap_start_reg = 1'b0;
end

xfdilate grp_xfdilate_fu_58(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_xfdilate_fu_58_ap_start),
    .ap_done(grp_xfdilate_fu_58_ap_done),
    .ap_idle(grp_xfdilate_fu_58_ap_idle),
    .ap_ready(grp_xfdilate_fu_58_ap_ready),
    .p_src_data_V_dout(p_src_data_V_dout),
    .p_src_data_V_empty_n(p_src_data_V_empty_n),
    .p_src_data_V_read(grp_xfdilate_fu_58_p_src_data_V_read),
    .p_dst_data_V_din(grp_xfdilate_fu_58_p_dst_data_V_din),
    .p_dst_data_V_full_n(p_dst_data_V_full_n),
    .p_dst_data_V_write(grp_xfdilate_fu_58_p_dst_data_V_write),
    .img_height(imgheight_reg_78),
    .img_width(imgwidth_reg_83)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_xfdilate_fu_58_ap_start_reg <= 1'b0;
    end else begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_xfdilate_fu_58_ap_start_reg <= 1'b1;
        end else if ((grp_xfdilate_fu_58_ap_ready == 1'b1)) begin
            grp_xfdilate_fu_58_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        imgheight_reg_78 <= imgheight_fu_68_p1;
        imgwidth_reg_83 <= imgwidth_fu_73_p1;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) | ((grp_xfdilate_fu_58_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((grp_xfdilate_fu_58_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        p_dst_data_V_write = grp_xfdilate_fu_58_p_dst_data_V_write;
    end else begin
        p_dst_data_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        p_src_data_V_read = grp_xfdilate_fu_58_p_src_data_V_read;
    end else begin
        p_src_data_V_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_xfdilate_fu_58_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign grp_xfdilate_fu_58_ap_start = grp_xfdilate_fu_58_ap_start_reg;

assign imgheight_fu_68_p1 = p_src_rows_read[15:0];

assign imgwidth_fu_73_p1 = p_src_cols_read[15:0];

assign p_dst_data_V_din = grp_xfdilate_fu_58_p_dst_data_V_din;

endmodule //dilate
