onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Fea_Pro_tb/DUT/rst
add wave -noupdate /Fea_Pro_tb/DUT/rst
add wave -noupdate /Fea_Pro_tb/DUT/img_din
add wave -noupdate -color Salmon -itemcolor Salmon /Fea_Pro_tb/DUT/img_din_valid
add wave -noupdate /Fea_Pro_tb/DUT/dout_valid
add wave -noupdate /Fea_Pro_tb/DUT/dout_data
add wave -noupdate /Fea_Pro_tb/DUT/done
add wave -noupdate /Fea_Pro_tb/DUT/fsync
add wave -noupdate /Fea_Pro_tb/DUT/fsync_L
add wave -noupdate /Fea_Pro_tb/DUT/fsync_R
add wave -noupdate /Fea_Pro_tb/DUT/fsync_state
add wave -noupdate /Fea_Pro_tb/DUT/des_coor
add wave -noupdate /Fea_Pro_tb/DUT/feature_flag
add wave -noupdate /Fea_Pro_tb/DUT/Det_Des_valid
add wave -noupdate /Fea_Pro_tb/DUT/WRE
add wave -noupdate /Fea_Pro_tb/DUT/WLE
add wave -noupdate /Fea_Pro_tb/DUT/Det_Des_Ctrl_state
add wave -noupdate /Fea_Pro_tb/DUT/WR_num
add wave -noupdate /Fea_Pro_tb/DUT/WL_num
add wave -noupdate /Fea_Pro_tb/DUT/W_R_addr
add wave -noupdate /Fea_Pro_tb/DUT/W_L_addr
add wave -noupdate /Fea_Pro_tb/DUT/des_num_state
add wave -noupdate /Fea_Pro_tb/DUT/des_num_1
add wave -noupdate /Fea_Pro_tb/DUT/des_num_2
add wave -noupdate /Fea_Pro_tb/DUT/des_num_3
add wave -noupdate /Fea_Pro_tb/DUT/des_num_4
add wave -noupdate /Fea_Pro_tb/DUT/des_num_5
add wave -noupdate /Fea_Pro_tb/DUT/RC_q/RAM_1/raddr
add wave -noupdate /Fea_Pro_tb/DUT/RC_q/RAM_1/re
add wave -noupdate /Fea_Pro_tb/DUT/RC_q/RAM_1/waddr
add wave -noupdate /Fea_Pro_tb/DUT/RC_q/RAM_1/we
add wave -noupdate /Fea_Pro_tb/DUT/RC_q/RAM_1/din
add wave -noupdate /Fea_Pro_tb/DUT/RC_q/RAM_1/dout
add wave -noupdate /Fea_Pro_tb/DUT/RC_q/RAM_1/rdata
add wave -noupdate /Fea_Pro_tb/DUT/RC_q/RAM_2/raddr
add wave -noupdate /Fea_Pro_tb/DUT/RC_q/RAM_2/re
add wave -noupdate /Fea_Pro_tb/DUT/RC_q/RAM_2/waddr
add wave -noupdate /Fea_Pro_tb/DUT/RC_q/RAM_2/we
add wave -noupdate /Fea_Pro_tb/DUT/RC_q/RAM_2/din
add wave -noupdate /Fea_Pro_tb/DUT/RC_q/RAM_2/dout
add wave -noupdate /Fea_Pro_tb/DUT/RC_q/RAM_2/rdata
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_1/mem[12]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_1/mem[11]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_1/mem[10]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_1/mem[9]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_1/mem[8]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_1/mem[7]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_1/mem[6]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_1/mem[5]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_1/mem[4]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_1/mem[3]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_1/mem[2]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_1/mem[1]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_1/mem[0]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_2/mem[12]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_2/mem[11]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_2/mem[10]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_2/mem[9]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_2/mem[8]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_2/mem[7]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_2/mem[6]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_2/mem[5]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_2/mem[4]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_2/mem[3]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_2/mem[2]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_2/mem[1]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_2/mem[0]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_3/mem[12]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_3/mem[11]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_3/mem[10]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_3/mem[9]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_3/mem[8]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_3/mem[7]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_3/mem[6]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_3/mem[5]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_3/mem[4]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_3/mem[3]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_3/mem[2]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_3/mem[1]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_3/mem[0]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_4/mem[12]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_4/mem[11]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_4/mem[10]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_4/mem[9]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_4/mem[8]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_4/mem[7]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_4/mem[6]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_4/mem[5]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_4/mem[4]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_4/mem[3]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_4/mem[2]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_4/mem[1]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_4/mem[0]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_5/mem[12]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_5/mem[11]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_5/mem[10]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_5/mem[9]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_5/mem[8]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_5/mem[7]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_5/mem[6]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_5/mem[5]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_5/mem[4]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_5/mem[3]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_5/mem[2]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_5/mem[1]}
add wave -noupdate {/Fea_Pro_tb/DUT/RC_q/RAM_5/mem[0]}
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/clk
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/rst
add wave -noupdate -color Gold -itemcolor Gold /Fea_Pro_tb/DUT/MC_q/start
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/dout
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/dout_valid
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/DesNum_RP
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/DesNum_RR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/DesNum_RL
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/R_R_addr
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/R_R_data
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/R_P_addr
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/R_P_data
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/R_L_addr
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/R_L_data
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/coor_des_Main_1
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/coor_des_Main_2
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/coor_des_Main_3
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/coor_des_Main_4
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/coor_des_Slave
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/coor_des_Slave_LR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/index_Slave_1
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/index_Slave_2
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/index_Slave_3
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/index_Slave_4
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/coor_Slave_1
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/coor_Slave_2
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/coor_Slave_3
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/coor_Slave_4
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/minHD_Slave_1
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/minHD_Slave_2
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/minHD_Slave_3
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/minHD_Slave_4
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/index_Slave_1_LR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/index_Slave_2_LR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/index_Slave_3_LR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/index_Slave_4_LR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/coor_Slave_1_LR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/coor_Slave_2_LR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/coor_Slave_3_LR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/coor_Slave_4_LR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/minHD_Slave_1_LR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/minHD_Slave_2_LR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/minHD_Slave_3_LR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/minHD_Slave_4_LR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/state
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/RL_addr
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/RR_addr
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/RP_addr
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/txFifo_dout
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/txFifo_din
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/txFifo_wr_en
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/txFifo_rd_en
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/txFifo_empty
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/match_core_done
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/match_core_done_LR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/Slave_valid
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/Slave_valid_RR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/mc_clr
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/cnt
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/core_enable
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/match_core_done_both
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {535020000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 268
configure wave -valuecolwidth 278
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ms
update
WaveRestoreZoom {0 ps} {788172 ns}
