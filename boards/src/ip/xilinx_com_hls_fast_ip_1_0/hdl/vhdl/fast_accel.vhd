-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fast_accel is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    start_full_n : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    start_out : OUT STD_LOGIC;
    start_write : OUT STD_LOGIC;
    p_src_rows_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    p_src_rows_empty_n : IN STD_LOGIC;
    p_src_rows_read : OUT STD_LOGIC;
    p_src_cols_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    p_src_cols_empty_n : IN STD_LOGIC;
    p_src_cols_read : OUT STD_LOGIC;
    p_src_data_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    p_src_data_V_empty_n : IN STD_LOGIC;
    p_src_data_V_read : OUT STD_LOGIC;
    imgOutput1_rows_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    imgOutput1_rows_empty_n : IN STD_LOGIC;
    imgOutput1_rows_read : OUT STD_LOGIC;
    imgOutput1_cols_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    imgOutput1_cols_empty_n : IN STD_LOGIC;
    imgOutput1_cols_read : OUT STD_LOGIC;
    p_dst_data_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    p_dst_data_V_full_n : IN STD_LOGIC;
    p_dst_data_V_write : OUT STD_LOGIC;
    threshold_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    threshold_empty_n : IN STD_LOGIC;
    threshold_read : OUT STD_LOGIC;
    imgOutput1_rows_out_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    imgOutput1_rows_out_full_n : IN STD_LOGIC;
    imgOutput1_rows_out_write : OUT STD_LOGIC;
    imgOutput1_cols_out_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    imgOutput1_cols_out_full_n : IN STD_LOGIC;
    imgOutput1_cols_out_write : OUT STD_LOGIC );
end;


architecture behav of fast_accel is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal real_start : STD_LOGIC;
    signal start_once_reg : STD_LOGIC := '0';
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal internal_ap_ready : STD_LOGIC;
    signal p_src_rows_blk_n : STD_LOGIC;
    signal p_src_cols_blk_n : STD_LOGIC;
    signal imgOutput1_rows_blk_n : STD_LOGIC;
    signal imgOutput1_cols_blk_n : STD_LOGIC;
    signal threshold_blk_n : STD_LOGIC;
    signal imgOutput1_rows_out_blk_n : STD_LOGIC;
    signal imgOutput1_cols_out_blk_n : STD_LOGIC;
    signal imgOutput1_rows_read_reg_104 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal imgOutput1_cols_read_reg_109 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_99_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_reg_114 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_src_rows_read_reg_119 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_src_cols_read_reg_124 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fast_fu_82_p_src_mat_data_V_read : STD_LOGIC;
    signal grp_fast_fu_82_p_dst_mat_data_V_din : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fast_fu_82_p_dst_mat_data_V_write : STD_LOGIC;
    signal grp_fast_fu_82_ap_done : STD_LOGIC;
    signal grp_fast_fu_82_ap_start : STD_LOGIC;
    signal grp_fast_fu_82_ap_ready : STD_LOGIC;
    signal grp_fast_fu_82_ap_idle : STD_LOGIC;
    signal grp_fast_fu_82_ap_continue : STD_LOGIC;
    signal grp_fast_fu_82_ap_start_reg : STD_LOGIC := '0';
    signal ap_block_state1_ignore_call17 : BOOLEAN;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_sync_grp_fast_fu_82_ap_ready : STD_LOGIC;
    signal ap_sync_grp_fast_fu_82_ap_done : STD_LOGIC;
    signal ap_block_state2_on_subcall_done : BOOLEAN;
    signal ap_sync_reg_grp_fast_fu_82_ap_ready : STD_LOGIC := '0';
    signal ap_sync_reg_grp_fast_fu_82_ap_done : STD_LOGIC := '0';
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);

    component fast IS
    port (
        p_src_mat_rows_read : IN STD_LOGIC_VECTOR (31 downto 0);
        p_src_mat_cols_read : IN STD_LOGIC_VECTOR (31 downto 0);
        p_src_mat_data_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        p_src_mat_data_V_empty_n : IN STD_LOGIC;
        p_src_mat_data_V_read : OUT STD_LOGIC;
        p_dst_mat_rows_read : IN STD_LOGIC_VECTOR (31 downto 0);
        p_dst_mat_cols_read : IN STD_LOGIC_VECTOR (31 downto 0);
        p_dst_mat_data_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        p_dst_mat_data_V_full_n : IN STD_LOGIC;
        p_dst_mat_data_V_write : OUT STD_LOGIC;
        p_threshold : IN STD_LOGIC_VECTOR (7 downto 0);
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        p_src_mat_rows_read_ap_vld : IN STD_LOGIC;
        p_src_mat_cols_read_ap_vld : IN STD_LOGIC;
        p_dst_mat_rows_read_ap_vld : IN STD_LOGIC;
        p_dst_mat_cols_read_ap_vld : IN STD_LOGIC;
        p_threshold_ap_vld : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC );
    end component;



begin
    grp_fast_fu_82 : component fast
    port map (
        p_src_mat_rows_read => p_src_rows_read_reg_119,
        p_src_mat_cols_read => p_src_cols_read_reg_124,
        p_src_mat_data_V_dout => p_src_data_V_dout,
        p_src_mat_data_V_empty_n => p_src_data_V_empty_n,
        p_src_mat_data_V_read => grp_fast_fu_82_p_src_mat_data_V_read,
        p_dst_mat_rows_read => imgOutput1_rows_read_reg_104,
        p_dst_mat_cols_read => imgOutput1_cols_read_reg_109,
        p_dst_mat_data_V_din => grp_fast_fu_82_p_dst_mat_data_V_din,
        p_dst_mat_data_V_full_n => p_dst_data_V_full_n,
        p_dst_mat_data_V_write => grp_fast_fu_82_p_dst_mat_data_V_write,
        p_threshold => tmp_reg_114,
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        p_src_mat_rows_read_ap_vld => ap_const_logic_1,
        p_src_mat_cols_read_ap_vld => ap_const_logic_1,
        p_dst_mat_rows_read_ap_vld => ap_const_logic_1,
        p_dst_mat_cols_read_ap_vld => ap_const_logic_1,
        p_threshold_ap_vld => ap_const_logic_1,
        ap_done => grp_fast_fu_82_ap_done,
        ap_start => grp_fast_fu_82_ap_start,
        ap_ready => grp_fast_fu_82_ap_ready,
        ap_idle => grp_fast_fu_82_ap_idle,
        ap_continue => grp_fast_fu_82_ap_continue);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_grp_fast_fu_82_ap_done_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_grp_fast_fu_82_ap_done <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then 
                    ap_sync_reg_grp_fast_fu_82_ap_done <= ap_const_logic_0;
                elsif ((grp_fast_fu_82_ap_done = ap_const_logic_1)) then 
                    ap_sync_reg_grp_fast_fu_82_ap_done <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_grp_fast_fu_82_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_grp_fast_fu_82_ap_ready <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then 
                    ap_sync_reg_grp_fast_fu_82_ap_ready <= ap_const_logic_0;
                elsif ((grp_fast_fu_82_ap_ready = ap_const_logic_1)) then 
                    ap_sync_reg_grp_fast_fu_82_ap_ready <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_fast_fu_82_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_fast_fu_82_ap_start_reg <= ap_const_logic_0;
            else
                if (((not(((real_start = ap_const_logic_0) or (imgOutput1_cols_out_full_n = ap_const_logic_0) or (imgOutput1_rows_out_full_n = ap_const_logic_0) or (threshold_empty_n = ap_const_logic_0) or (imgOutput1_cols_empty_n = ap_const_logic_0) or (imgOutput1_rows_empty_n = ap_const_logic_0) or (p_src_cols_empty_n = ap_const_logic_0) or (p_src_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((ap_sync_grp_fast_fu_82_ap_ready = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
                    grp_fast_fu_82_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_fast_fu_82_ap_ready = ap_const_logic_1)) then 
                    grp_fast_fu_82_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    start_once_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                start_once_reg <= ap_const_logic_0;
            else
                if (((internal_ap_ready = ap_const_logic_0) and (real_start = ap_const_logic_1))) then 
                    start_once_reg <= ap_const_logic_1;
                elsif ((internal_ap_ready = ap_const_logic_1)) then 
                    start_once_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((real_start = ap_const_logic_0) or (imgOutput1_cols_out_full_n = ap_const_logic_0) or (imgOutput1_rows_out_full_n = ap_const_logic_0) or (threshold_empty_n = ap_const_logic_0) or (imgOutput1_cols_empty_n = ap_const_logic_0) or (imgOutput1_rows_empty_n = ap_const_logic_0) or (p_src_cols_empty_n = ap_const_logic_0) or (p_src_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                imgOutput1_cols_read_reg_109 <= imgOutput1_cols_dout;
                imgOutput1_rows_read_reg_104 <= imgOutput1_rows_dout;
                p_src_cols_read_reg_124 <= p_src_cols_dout;
                p_src_rows_read_reg_119 <= p_src_rows_dout;
                tmp_reg_114 <= tmp_fu_99_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (real_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, p_src_rows_empty_n, p_src_cols_empty_n, imgOutput1_rows_empty_n, imgOutput1_cols_empty_n, threshold_empty_n, imgOutput1_rows_out_full_n, imgOutput1_cols_out_full_n, ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((real_start = ap_const_logic_0) or (imgOutput1_cols_out_full_n = ap_const_logic_0) or (imgOutput1_rows_out_full_n = ap_const_logic_0) or (threshold_empty_n = ap_const_logic_0) or (imgOutput1_cols_empty_n = ap_const_logic_0) or (imgOutput1_rows_empty_n = ap_const_logic_0) or (p_src_cols_empty_n = ap_const_logic_0) or (p_src_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);

    ap_block_state1_assign_proc : process(real_start, ap_done_reg, p_src_rows_empty_n, p_src_cols_empty_n, imgOutput1_rows_empty_n, imgOutput1_cols_empty_n, threshold_empty_n, imgOutput1_rows_out_full_n, imgOutput1_cols_out_full_n)
    begin
                ap_block_state1 <= ((real_start = ap_const_logic_0) or (imgOutput1_cols_out_full_n = ap_const_logic_0) or (imgOutput1_rows_out_full_n = ap_const_logic_0) or (threshold_empty_n = ap_const_logic_0) or (imgOutput1_cols_empty_n = ap_const_logic_0) or (imgOutput1_rows_empty_n = ap_const_logic_0) or (p_src_cols_empty_n = ap_const_logic_0) or (p_src_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state1_ignore_call17_assign_proc : process(real_start, ap_done_reg, p_src_rows_empty_n, p_src_cols_empty_n, imgOutput1_rows_empty_n, imgOutput1_cols_empty_n, threshold_empty_n, imgOutput1_rows_out_full_n, imgOutput1_cols_out_full_n)
    begin
                ap_block_state1_ignore_call17 <= ((real_start = ap_const_logic_0) or (imgOutput1_cols_out_full_n = ap_const_logic_0) or (imgOutput1_rows_out_full_n = ap_const_logic_0) or (threshold_empty_n = ap_const_logic_0) or (imgOutput1_cols_empty_n = ap_const_logic_0) or (imgOutput1_rows_empty_n = ap_const_logic_0) or (p_src_cols_empty_n = ap_const_logic_0) or (p_src_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state2_on_subcall_done_assign_proc : process(ap_sync_grp_fast_fu_82_ap_ready, ap_sync_grp_fast_fu_82_ap_done)
    begin
                ap_block_state2_on_subcall_done <= ((ap_sync_grp_fast_fu_82_ap_ready and ap_sync_grp_fast_fu_82_ap_done) = ap_const_logic_0);
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(real_start, ap_CS_fsm_state1)
    begin
        if (((real_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_ready <= internal_ap_ready;
    ap_sync_grp_fast_fu_82_ap_done <= (grp_fast_fu_82_ap_done or ap_sync_reg_grp_fast_fu_82_ap_done);
    ap_sync_grp_fast_fu_82_ap_ready <= (grp_fast_fu_82_ap_ready or ap_sync_reg_grp_fast_fu_82_ap_ready);

    grp_fast_fu_82_ap_continue_assign_proc : process(ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then 
            grp_fast_fu_82_ap_continue <= ap_const_logic_1;
        else 
            grp_fast_fu_82_ap_continue <= ap_const_logic_0;
        end if; 
    end process;

    grp_fast_fu_82_ap_start <= grp_fast_fu_82_ap_start_reg;

    imgOutput1_cols_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, imgOutput1_cols_empty_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            imgOutput1_cols_blk_n <= imgOutput1_cols_empty_n;
        else 
            imgOutput1_cols_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    imgOutput1_cols_out_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, imgOutput1_cols_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            imgOutput1_cols_out_blk_n <= imgOutput1_cols_out_full_n;
        else 
            imgOutput1_cols_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    imgOutput1_cols_out_din <= imgOutput1_cols_dout;

    imgOutput1_cols_out_write_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, p_src_rows_empty_n, p_src_cols_empty_n, imgOutput1_rows_empty_n, imgOutput1_cols_empty_n, threshold_empty_n, imgOutput1_rows_out_full_n, imgOutput1_cols_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (imgOutput1_cols_out_full_n = ap_const_logic_0) or (imgOutput1_rows_out_full_n = ap_const_logic_0) or (threshold_empty_n = ap_const_logic_0) or (imgOutput1_cols_empty_n = ap_const_logic_0) or (imgOutput1_rows_empty_n = ap_const_logic_0) or (p_src_cols_empty_n = ap_const_logic_0) or (p_src_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            imgOutput1_cols_out_write <= ap_const_logic_1;
        else 
            imgOutput1_cols_out_write <= ap_const_logic_0;
        end if; 
    end process;


    imgOutput1_cols_read_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, p_src_rows_empty_n, p_src_cols_empty_n, imgOutput1_rows_empty_n, imgOutput1_cols_empty_n, threshold_empty_n, imgOutput1_rows_out_full_n, imgOutput1_cols_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (imgOutput1_cols_out_full_n = ap_const_logic_0) or (imgOutput1_rows_out_full_n = ap_const_logic_0) or (threshold_empty_n = ap_const_logic_0) or (imgOutput1_cols_empty_n = ap_const_logic_0) or (imgOutput1_rows_empty_n = ap_const_logic_0) or (p_src_cols_empty_n = ap_const_logic_0) or (p_src_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            imgOutput1_cols_read <= ap_const_logic_1;
        else 
            imgOutput1_cols_read <= ap_const_logic_0;
        end if; 
    end process;


    imgOutput1_rows_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, imgOutput1_rows_empty_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            imgOutput1_rows_blk_n <= imgOutput1_rows_empty_n;
        else 
            imgOutput1_rows_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    imgOutput1_rows_out_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, imgOutput1_rows_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            imgOutput1_rows_out_blk_n <= imgOutput1_rows_out_full_n;
        else 
            imgOutput1_rows_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    imgOutput1_rows_out_din <= imgOutput1_rows_dout;

    imgOutput1_rows_out_write_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, p_src_rows_empty_n, p_src_cols_empty_n, imgOutput1_rows_empty_n, imgOutput1_cols_empty_n, threshold_empty_n, imgOutput1_rows_out_full_n, imgOutput1_cols_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (imgOutput1_cols_out_full_n = ap_const_logic_0) or (imgOutput1_rows_out_full_n = ap_const_logic_0) or (threshold_empty_n = ap_const_logic_0) or (imgOutput1_cols_empty_n = ap_const_logic_0) or (imgOutput1_rows_empty_n = ap_const_logic_0) or (p_src_cols_empty_n = ap_const_logic_0) or (p_src_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            imgOutput1_rows_out_write <= ap_const_logic_1;
        else 
            imgOutput1_rows_out_write <= ap_const_logic_0;
        end if; 
    end process;


    imgOutput1_rows_read_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, p_src_rows_empty_n, p_src_cols_empty_n, imgOutput1_rows_empty_n, imgOutput1_cols_empty_n, threshold_empty_n, imgOutput1_rows_out_full_n, imgOutput1_cols_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (imgOutput1_cols_out_full_n = ap_const_logic_0) or (imgOutput1_rows_out_full_n = ap_const_logic_0) or (threshold_empty_n = ap_const_logic_0) or (imgOutput1_cols_empty_n = ap_const_logic_0) or (imgOutput1_rows_empty_n = ap_const_logic_0) or (p_src_cols_empty_n = ap_const_logic_0) or (p_src_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            imgOutput1_rows_read <= ap_const_logic_1;
        else 
            imgOutput1_rows_read <= ap_const_logic_0;
        end if; 
    end process;


    internal_ap_ready_assign_proc : process(ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then 
            internal_ap_ready <= ap_const_logic_1;
        else 
            internal_ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    p_dst_data_V_din <= grp_fast_fu_82_p_dst_mat_data_V_din;

    p_dst_data_V_write_assign_proc : process(grp_fast_fu_82_p_dst_mat_data_V_write, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            p_dst_data_V_write <= grp_fast_fu_82_p_dst_mat_data_V_write;
        else 
            p_dst_data_V_write <= ap_const_logic_0;
        end if; 
    end process;


    p_src_cols_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, p_src_cols_empty_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            p_src_cols_blk_n <= p_src_cols_empty_n;
        else 
            p_src_cols_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    p_src_cols_read_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, p_src_rows_empty_n, p_src_cols_empty_n, imgOutput1_rows_empty_n, imgOutput1_cols_empty_n, threshold_empty_n, imgOutput1_rows_out_full_n, imgOutput1_cols_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (imgOutput1_cols_out_full_n = ap_const_logic_0) or (imgOutput1_rows_out_full_n = ap_const_logic_0) or (threshold_empty_n = ap_const_logic_0) or (imgOutput1_cols_empty_n = ap_const_logic_0) or (imgOutput1_rows_empty_n = ap_const_logic_0) or (p_src_cols_empty_n = ap_const_logic_0) or (p_src_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            p_src_cols_read <= ap_const_logic_1;
        else 
            p_src_cols_read <= ap_const_logic_0;
        end if; 
    end process;


    p_src_data_V_read_assign_proc : process(grp_fast_fu_82_p_src_mat_data_V_read, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            p_src_data_V_read <= grp_fast_fu_82_p_src_mat_data_V_read;
        else 
            p_src_data_V_read <= ap_const_logic_0;
        end if; 
    end process;


    p_src_rows_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, p_src_rows_empty_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            p_src_rows_blk_n <= p_src_rows_empty_n;
        else 
            p_src_rows_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    p_src_rows_read_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, p_src_rows_empty_n, p_src_cols_empty_n, imgOutput1_rows_empty_n, imgOutput1_cols_empty_n, threshold_empty_n, imgOutput1_rows_out_full_n, imgOutput1_cols_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (imgOutput1_cols_out_full_n = ap_const_logic_0) or (imgOutput1_rows_out_full_n = ap_const_logic_0) or (threshold_empty_n = ap_const_logic_0) or (imgOutput1_cols_empty_n = ap_const_logic_0) or (imgOutput1_rows_empty_n = ap_const_logic_0) or (p_src_cols_empty_n = ap_const_logic_0) or (p_src_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            p_src_rows_read <= ap_const_logic_1;
        else 
            p_src_rows_read <= ap_const_logic_0;
        end if; 
    end process;


    real_start_assign_proc : process(ap_start, start_full_n, start_once_reg)
    begin
        if (((start_full_n = ap_const_logic_0) and (start_once_reg = ap_const_logic_0))) then 
            real_start <= ap_const_logic_0;
        else 
            real_start <= ap_start;
        end if; 
    end process;

    start_out <= real_start;

    start_write_assign_proc : process(real_start, start_once_reg)
    begin
        if (((start_once_reg = ap_const_logic_0) and (real_start = ap_const_logic_1))) then 
            start_write <= ap_const_logic_1;
        else 
            start_write <= ap_const_logic_0;
        end if; 
    end process;


    threshold_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, threshold_empty_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            threshold_blk_n <= threshold_empty_n;
        else 
            threshold_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    threshold_read_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, p_src_rows_empty_n, p_src_cols_empty_n, imgOutput1_rows_empty_n, imgOutput1_cols_empty_n, threshold_empty_n, imgOutput1_rows_out_full_n, imgOutput1_cols_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (imgOutput1_cols_out_full_n = ap_const_logic_0) or (imgOutput1_rows_out_full_n = ap_const_logic_0) or (threshold_empty_n = ap_const_logic_0) or (imgOutput1_cols_empty_n = ap_const_logic_0) or (imgOutput1_rows_empty_n = ap_const_logic_0) or (p_src_cols_empty_n = ap_const_logic_0) or (p_src_rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            threshold_read <= ap_const_logic_1;
        else 
            threshold_read <= ap_const_logic_0;
        end if; 
    end process;

    tmp_fu_99_p1 <= threshold_dout(8 - 1 downto 0);
end behav;
