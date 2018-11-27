onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+fft_mag -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -L axis_infrastructure_v1_1_0 -L axis_register_slice_v1_1_9 -L xbip_utils_v3_0_6 -L c_reg_fd_v12_0_2 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_2 -L xbip_dsp48_addsub_v3_0_2 -L xbip_addsub_v3_0_2 -L c_addsub_v12_0_9 -L xbip_bram18k_v3_0_2 -L mult_gen_v12_0_11 -L axi_utils_v2_0_2 -L cordic_v6_0_10 -L c_mux_bit_v12_0_2 -L c_shift_ram_v12_0_9 -L cmpy_v6_0_11 -L floating_point_v7_0_12 -L xfft_v9_0_10 -O5 xil_defaultlib.fft_mag xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {fft_mag.udo}

run -all

endsim

quit -force
