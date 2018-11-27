vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/axis_infrastructure_v1_1_0
vlib riviera/axis_register_slice_v1_1_9
vlib riviera/xbip_utils_v3_0_6
vlib riviera/c_reg_fd_v12_0_2
vlib riviera/xbip_dsp48_wrapper_v3_0_4
vlib riviera/xbip_pipe_v3_0_2
vlib riviera/xbip_dsp48_addsub_v3_0_2
vlib riviera/xbip_addsub_v3_0_2
vlib riviera/c_addsub_v12_0_9
vlib riviera/xbip_bram18k_v3_0_2
vlib riviera/mult_gen_v12_0_11
vlib riviera/axi_utils_v2_0_2
vlib riviera/cordic_v6_0_10
vlib riviera/c_mux_bit_v12_0_2
vlib riviera/c_shift_ram_v12_0_9
vlib riviera/cmpy_v6_0_11
vlib riviera/floating_point_v7_0_12
vlib riviera/xfft_v9_0_10

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap axis_infrastructure_v1_1_0 riviera/axis_infrastructure_v1_1_0
vmap axis_register_slice_v1_1_9 riviera/axis_register_slice_v1_1_9
vmap xbip_utils_v3_0_6 riviera/xbip_utils_v3_0_6
vmap c_reg_fd_v12_0_2 riviera/c_reg_fd_v12_0_2
vmap xbip_dsp48_wrapper_v3_0_4 riviera/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_2 riviera/xbip_pipe_v3_0_2
vmap xbip_dsp48_addsub_v3_0_2 riviera/xbip_dsp48_addsub_v3_0_2
vmap xbip_addsub_v3_0_2 riviera/xbip_addsub_v3_0_2
vmap c_addsub_v12_0_9 riviera/c_addsub_v12_0_9
vmap xbip_bram18k_v3_0_2 riviera/xbip_bram18k_v3_0_2
vmap mult_gen_v12_0_11 riviera/mult_gen_v12_0_11
vmap axi_utils_v2_0_2 riviera/axi_utils_v2_0_2
vmap cordic_v6_0_10 riviera/cordic_v6_0_10
vmap c_mux_bit_v12_0_2 riviera/c_mux_bit_v12_0_2
vmap c_shift_ram_v12_0_9 riviera/c_shift_ram_v12_0_9
vmap cmpy_v6_0_11 riviera/cmpy_v6_0_11
vmap floating_point_v7_0_12 riviera/floating_point_v7_0_12
vmap xfft_v9_0_10 riviera/xfft_v9_0_10

vlog -work xil_defaultlib -v2k5 -sv "+incdir+../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog" "+incdir+../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog" \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \

vcom -work xpm -93 \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axis_infrastructure_v1_1_0 -v2k5 "+incdir+../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog" "+incdir+../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_mux_enc.v" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_util_aclken_converter.v" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_util_aclken_converter_wrapper.v" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_util_axis2vector.v" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_util_vector2axis.v" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_clock_synchronizer.v" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_cdc_handshake.v" \

vlog -work axis_register_slice_v1_1_9 -v2k5 "+incdir+../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog" "+incdir+../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_register_slice_v1_1_9/hdl/verilog/axis_register_slice_v1_1_axisc_register_slice.v" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_register_slice_v1_1_9/hdl/verilog/axis_register_slice_v1_1_axis_register_slice.v" \

vlog -work xil_defaultlib -v2k5 "+incdir+../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog" "+incdir+../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog" \
"../../../bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/sim/fft_mag_axis_register_slice_2_0.v" \

vcom -work xbip_utils_v3_0_6 -93 \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/xbip_utils_v3_0_6/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_2 -93 \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/c_reg_fd_v12_0_2/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/c_reg_fd_v12_0_2/hdl/c_reg_fd_v12_0.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93 \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/xbip_dsp48_wrapper_v3_0_4/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_2 -93 \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/xbip_pipe_v3_0_2/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/xbip_pipe_v3_0_2/hdl/xbip_pipe_v3_0.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_2 -93 \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/xbip_dsp48_addsub_v3_0_2/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/xbip_dsp48_addsub_v3_0_2/hdl/xbip_dsp48_addsub_v3_0.vhd" \

vcom -work xbip_addsub_v3_0_2 -93 \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/xbip_addsub_v3_0_2/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/xbip_addsub_v3_0_2/hdl/xbip_addsub_v3_0.vhd" \

vcom -work c_addsub_v12_0_9 -93 \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/c_addsub_v12_0_9/hdl/c_addsub_v12_0_vh_rfs.vhd" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/c_addsub_v12_0_9/hdl/c_addsub_v12_0.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/fft_mag/ip/fft_mag_c_addsub_0_0/sim/fft_mag_c_addsub_0_0.vhd" \

vcom -work xbip_bram18k_v3_0_2 -93 \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_cordic_0_0/xbip_bram18k_v3_0_2/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_cordic_0_0/xbip_bram18k_v3_0_2/hdl/xbip_bram18k_v3_0.vhd" \

vcom -work mult_gen_v12_0_11 -93 \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_cordic_0_0/mult_gen_v12_0_11/hdl/mult_gen_v12_0_vh_rfs.vhd" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_cordic_0_0/mult_gen_v12_0_11/hdl/mult_gen_v12_0.vhd" \

vcom -work axi_utils_v2_0_2 -93 \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_cordic_0_0/axi_utils_v2_0_2/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work cordic_v6_0_10 -93 \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_cordic_0_0/cordic_v6_0_10/hdl/cordic_v6_0_vh_rfs.vhd" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_cordic_0_0/cordic_v6_0_10/hdl/cordic_v6_0.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/fft_mag/ip/fft_mag_cordic_0_0/sim/fft_mag_cordic_0_0.vhd" \
"../../../bd/fft_mag/ip/fft_mag_mult_gen_0_0/sim/fft_mag_mult_gen_0_0.vhd" \
"../../../bd/fft_mag/ip/fft_mag_mult_gen_1_0/sim/fft_mag_mult_gen_1_0.vhd" \

vcom -work c_mux_bit_v12_0_2 -93 \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/c_mux_bit_v12_0_2/hdl/c_mux_bit_v12_0_vh_rfs.vhd" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/c_mux_bit_v12_0_2/hdl/c_mux_bit_v12_0.vhd" \

vcom -work c_shift_ram_v12_0_9 -93 \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/c_shift_ram_v12_0_9/hdl/c_shift_ram_v12_0_vh_rfs.vhd" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/c_shift_ram_v12_0_9/hdl/c_shift_ram_v12_0.vhd" \

vcom -work cmpy_v6_0_11 -93 \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/cmpy_v6_0_11/hdl/cmpy_v6_0_vh_rfs.vhd" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/cmpy_v6_0_11/hdl/cmpy_v6_0.vhd" \

vcom -work floating_point_v7_0_12 -93 \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/floating_point_v7_0_12/hdl/floating_point_v7_0_vh_rfs.vhd" \

vcom -work xfft_v9_0_10 -93 \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/xfft_v9_0_10/hdl/xfft_v9_0_vh_rfs.vhd" \
"../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/xfft_v9_0_10/hdl/xfft_v9_0.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/fft_mag/ip/fft_mag_xfft_0_0/sim/fft_mag_xfft_0_0.vhd" \

vlog -work xil_defaultlib -v2k5 "+incdir+../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog" "+incdir+../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog" \
"../../../bd/fft_mag/ip/fft_mag_xlconstant_0_0/work/xlconstant.v" \
"../../../bd/fft_mag/ip/fft_mag_xlconstant_0_0/sim/fft_mag_xlconstant_0_0.v" \
"../../../bd/fft_mag/ip/fft_mag_xlconstant_1_0/sim/fft_mag_xlconstant_1_0.v" \
"../../../bd/fft_mag/ip/fft_mag_xlconstant_2_0/sim/fft_mag_xlconstant_2_0.v" \
"../../../bd/fft_mag/ip/fft_mag_xlslice_0_0/work/xlslice.v" \
"../../../bd/fft_mag/ip/fft_mag_xlslice_0_0/sim/fft_mag_xlslice_0_0.v" \
"../../../bd/fft_mag/ip/fft_mag_xlslice_1_0/sim/fft_mag_xlslice_1_0.v" \
"../../../bd/fft_mag/ip/fft_mag_xlconcat_0_0/work/xlconcat.v" \
"../../../bd/fft_mag/ip/fft_mag_xlconcat_0_0/sim/fft_mag_xlconcat_0_0.v" \
"../../../bd/fft_mag/hdl/fft_mag.v" \

vlog -work xil_defaultlib "glbl.v"

