-makelib ies/xil_defaultlib -sv \
  "/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
  "/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
  "/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
  "/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
  "/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
  "/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
  "/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \
-endlib
-makelib ies/xpm \
  "/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/axis_infrastructure_v1_1_0 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_mux_enc.v" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_util_aclken_converter.v" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_util_aclken_converter_wrapper.v" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_util_axis2vector.v" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_util_vector2axis.v" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_clock_synchronizer.v" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_infrastructure_v1_1_0/hdl/verilog/axis_infrastructure_v1_1_cdc_handshake.v" \
-endlib
-makelib ies/axis_register_slice_v1_1_9 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_register_slice_v1_1_9/hdl/verilog/axis_register_slice_v1_1_axisc_register_slice.v" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/axis_register_slice_v1_1_9/hdl/verilog/axis_register_slice_v1_1_axis_register_slice.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/sim/fft_mag_axis_register_slice_2_0.v" \
-endlib
-makelib ies/xbip_utils_v3_0_6 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/xbip_utils_v3_0_6/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/c_reg_fd_v12_0_2 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/c_reg_fd_v12_0_2/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/c_reg_fd_v12_0_2/hdl/c_reg_fd_v12_0.vhd" \
-endlib
-makelib ies/xbip_dsp48_wrapper_v3_0_4 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/xbip_dsp48_wrapper_v3_0_4/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/xbip_pipe_v3_0_2 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/xbip_pipe_v3_0_2/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/xbip_pipe_v3_0_2/hdl/xbip_pipe_v3_0.vhd" \
-endlib
-makelib ies/xbip_dsp48_addsub_v3_0_2 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/xbip_dsp48_addsub_v3_0_2/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/xbip_dsp48_addsub_v3_0_2/hdl/xbip_dsp48_addsub_v3_0.vhd" \
-endlib
-makelib ies/xbip_addsub_v3_0_2 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/xbip_addsub_v3_0_2/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/xbip_addsub_v3_0_2/hdl/xbip_addsub_v3_0.vhd" \
-endlib
-makelib ies/c_addsub_v12_0_9 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/c_addsub_v12_0_9/hdl/c_addsub_v12_0_vh_rfs.vhd" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/c_addsub_v12_0_9/hdl/c_addsub_v12_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/fft_mag/ip/fft_mag_c_addsub_0_0/sim/fft_mag_c_addsub_0_0.vhd" \
-endlib
-makelib ies/xbip_bram18k_v3_0_2 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_cordic_0_0/xbip_bram18k_v3_0_2/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_cordic_0_0/xbip_bram18k_v3_0_2/hdl/xbip_bram18k_v3_0.vhd" \
-endlib
-makelib ies/mult_gen_v12_0_11 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_cordic_0_0/mult_gen_v12_0_11/hdl/mult_gen_v12_0_vh_rfs.vhd" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_cordic_0_0/mult_gen_v12_0_11/hdl/mult_gen_v12_0.vhd" \
-endlib
-makelib ies/axi_utils_v2_0_2 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_cordic_0_0/axi_utils_v2_0_2/hdl/axi_utils_v2_0_vh_rfs.vhd" \
-endlib
-makelib ies/cordic_v6_0_10 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_cordic_0_0/cordic_v6_0_10/hdl/cordic_v6_0_vh_rfs.vhd" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_cordic_0_0/cordic_v6_0_10/hdl/cordic_v6_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/fft_mag/ip/fft_mag_cordic_0_0/sim/fft_mag_cordic_0_0.vhd" \
  "../../../bd/fft_mag/ip/fft_mag_mult_gen_0_0/sim/fft_mag_mult_gen_0_0.vhd" \
  "../../../bd/fft_mag/ip/fft_mag_mult_gen_1_0/sim/fft_mag_mult_gen_1_0.vhd" \
-endlib
-makelib ies/c_mux_bit_v12_0_2 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/c_mux_bit_v12_0_2/hdl/c_mux_bit_v12_0_vh_rfs.vhd" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/c_mux_bit_v12_0_2/hdl/c_mux_bit_v12_0.vhd" \
-endlib
-makelib ies/c_shift_ram_v12_0_9 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/c_shift_ram_v12_0_9/hdl/c_shift_ram_v12_0_vh_rfs.vhd" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/c_shift_ram_v12_0_9/hdl/c_shift_ram_v12_0.vhd" \
-endlib
-makelib ies/cmpy_v6_0_11 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/cmpy_v6_0_11/hdl/cmpy_v6_0_vh_rfs.vhd" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/cmpy_v6_0_11/hdl/cmpy_v6_0.vhd" \
-endlib
-makelib ies/floating_point_v7_0_12 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/floating_point_v7_0_12/hdl/floating_point_v7_0_vh_rfs.vhd" \
-endlib
-makelib ies/xfft_v9_0_10 \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/xfft_v9_0_10/hdl/xfft_v9_0_vh_rfs.vhd" \
  "../../../../../../Nexys4FFTDemo/src/bd/fft_mag/ip/fft_mag_xfft_0_0/xfft_v9_0_10/hdl/xfft_v9_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/fft_mag/ip/fft_mag_xfft_0_0/sim/fft_mag_xfft_0_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
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
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

