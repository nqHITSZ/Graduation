onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/clk
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/rst
add wave -noupdate /Fea_Pro_tb/DUT/fsync
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/start
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/dout
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/dout_valid
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/match_done
add wave -noupdate -color Coral /Fea_Pro_tb/DUT/MC_q/DesNum_RP
add wave -noupdate -color Coral /Fea_Pro_tb/DUT/MC_q/DesNum_RR
add wave -noupdate -color Coral /Fea_Pro_tb/DUT/MC_q/DesNum_RL
add wave -noupdate -color Cyan /Fea_Pro_tb/DUT/MC_q/R_R_addr
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/R_R_data
add wave -noupdate -color Cyan /Fea_Pro_tb/DUT/MC_q/R_P_addr
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/R_P_data
add wave -noupdate -color Turquoise /Fea_Pro_tb/DUT/MC_q/R_L_addr
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
add wave -noupdate -color Gold /Fea_Pro_tb/DUT/MC_q/state
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
add wave -noupdate -color Magenta /Fea_Pro_tb/DUT/MC_q/Slave_valid
add wave -noupdate -color Magenta /Fea_Pro_tb/DUT/MC_q/Slave_valid_RR
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/mc_clr
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/cnt
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/core_enable
add wave -noupdate -expand /Fea_Pro_tb/DUT/MC_q/match_core_done_both
add wave -noupdate /Fea_Pro_tb/DUT/MC_q/zero
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10911112 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 297
configure wave -valuecolwidth 100
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
WaveRestoreZoom {10554585 ps} {11447415 ps}
