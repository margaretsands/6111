`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Updated 9/29/2017 V2.0
// Create Date: 10/1/2015 V1.0
// Design Name: 
// Module Name: labkit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module labkit(
   input wire CLK100MHZ,
   input wire [15:0] SW, 
   input wire BTNC, BTNU, BTNL, BTNR, BTND,
   input wire AD3P, AD3N,
   output wire [3:0] VGA_R, 
   output wire [3:0] VGA_B, 
   output wire [3:0] VGA_G,
   output wire [7:0] JA, 
   output wire AUD_PWM, AUD_SD,
   output wire VGA_HS, 
   output wire VGA_VS, 
   output wire LED16_B, LED16_G, LED16_R,
   output wire LED17_B, LED17_G, LED17_R,
   output wire [15:0] LED,
   output wire [7:0] SEG,  // segments A-G (0-6), DP (7)
   output wire [7:0] AN    // Display 0-7
   );
   

// create 25mhz system clock
    wire clock_25mhz;
    clock_quarter_divider clockgen(.clk100_mhz(CLK100MHZ), .clock_25mhz(clock_25mhz));
    wire clk_104mhz, clk_65mhz;
    clk_wiz_0 clockgen2(
       .clk_in1(CLK100MHZ),
       .clk_out1(clk_104mhz),
       .clk_out2(clk_65mhz));
    
    wire [9:0] hcount, vcount;   
    wire hsync, vsync, at_display_area, blank;
//  instantiate 7-segment display;  
    wire [31:0] data;
    wire [6:0] segments;
    display_8hex display(.clk(clock_25mhz),.data(data), .seg(segments), .strobe(AN));    
    assign SEG[6:0] = segments;
    assign SEG[7] = 1'b1;

    wire [15:0] sample_reg;
    wire eoc, xadc_reset;
    // INSTANTIATE XADC IP
    xadc_demo xadc_demo (
        .dclk_in(clk_104mhz),  // Master clock for DRP and XADC. 
        .di_in(0),             // DRP input info (0 becuase we don't need to write)
        .daddr_in(6'h13),      // The DRP register address for the third analog input register
        .den_in(1),            // DRP enable line high (we want to read)
        .dwe_in(0),            // DRP write enable low (never write)
        .drdy_out(),           // DRP ready signal (unused)
        .do_out(sample_reg),   // DRP output from register (the ADC data)
        .reset_in(xadc_reset), // reset line
        .vp_in(0),             // dedicated/built in analog channel on bank 0
        .vn_in(0),             // can't use this analog channel b/c of nexys 4 setup
        .vauxp3(AD3P),         // The third analog auxiliary input channel
        .vauxn3(AD3N),         // Choose this one b/c it's on JXADC header 1
        .channel_out(),        // Not useful in sngle channel mode
        .eoc_out(eoc),         // Pulses high on end of ADC conversion
        .alarm_out(),          // Not useful
        .eos_out(),            // End of sequence pulse, not useful
        .busy_out()            // High when conversion is in progress. unused.
    );
    assign xadc_reset = BTNC;

    // INSTANTIATE 16x OVERSAMPLING
    // This outputs 14-bit samples at a 62.5kHz sample rate
    // (2 more bits, 1/16 the sample rate)
    wire [13:0] osample16;
    wire done_osample16;
    oversample16 osamp16_1 (
        .clk(clk_104mhz),
        .sample(sample_reg[15:4]),
        .eoc(eoc),
        .oversample(osample16),
        .done(done_osample16));

    // INSTANTIATE SAMPLE FRAME BLOCK RAM 
    // This 16x4096 bram stores the frame of samples
    // The write port is written by osample16.
    // The read port is read by the bram_to_fft module and sent to the fft.
    wire fwe;
    reg [11:0] fhead = 0; // Frame head - a pointer to the write point, works as circular buffer
    wire [15:0] fsample;  // The sample data from the XADC, oversampled 15x
    wire [11:0] faddr;    // Frame address - The read address, controlled by bram_to_fft
    wire [15:0] fdata;    // Frame data - The read data, input into bram_to_fft
    bram_frame bram1 (
        .clka(clk_104mhz),
        .wea(fwe),
        .addra(fhead),
        .dina(fsample),
        .clkb(clk_104mhz),
        .addrb(faddr),
        .doutb(fdata));

    // SAMPLE FRAME BRAM WRITE PORT SETUP
    always @(posedge clk_104mhz) if (done_osample16) fhead <= fhead + 1; // Move the pointer every oversample
    assign fsample = {osample16, 2'b0}; // Pad the oversample with zeros to pretend it's 16 bits
    assign fwe = done_osample16; // Write only when we finish an oversample (every 104*16 clock cycles)

    // SAMPLE FRAME BRAM READ PORT SETUP
    // For this demo, we just need to display the FFT on 60Hz video, so let's only send the frame of samples
    // once every 60Hz. If you want to though, you can send frames much faster, one right after each other.
    // For this 4096pt fully pipelined FFT, the limit is 104Mhz/4096cycles_per_frame = 25kHz (approx)
    // The next two modules just synchronize the 60Hz vsync to the 104Mhz domain and convert it to a 1 cycle pulse.
    wire vsync_104mhz, vsync_104mhz_pulse;
    synchronize vsync_synchronize(
        .clk(clk_104mhz),
        .in(vsync),
        .out(vsync_104mhz));

    level_to_pulse vsync_ltp(
        .clk(clk_104mhz),
        .level(~vsync_104mhz),
        .pulse(vsync_104mhz_pulse));

    // INSTANTIATE BRAM TO FFT MODULE
    // This module handles the magic of reading sample frames from the BRAM whenever start is asserted,
    // and sending it to the FFT block design over the AXI-stream interface.
    wire last_missing; // All these are control lines to the FFT block design
    wire [31:0] frame_tdata;
    wire frame_tlast, frame_tready, frame_tvalid;
    bram_to_fft bram_to_fft_0(
        .clk(clk_104mhz),
        .head(fhead),
        .addr(faddr),
        .data(fdata),
        .start(vsync_104mhz_pulse),
        .last_missing(last_missing),
        .frame_tdata(frame_tdata),
        .frame_tlast(frame_tlast),
        .frame_tready(frame_tready),
        .frame_tvalid(frame_tvalid)
    );

    // This is the FFT module, implemented as a block design with a 4096pt, 16bit FFT
    // that outputs in magnitude by doing sqrt(Re^2 + Im^2) on the FFT result.
    // It's fully pipelined, so it streams 4096-wide frames of frequency data as fast as
    // you stream in 4096-wide frames of time-domain samples.
    wire [23:0] magnitude_tdata; // This output bus has the FFT magnitude for the current index
    wire [11:0] magnitude_tuser; // This represents the current index being output, from 0 to 4096
    wire [11:0] scale_factor; // This input adjusts the scaling of the FFT, which can be tuned to the input magnitude.
    wire magnitude_tlast, magnitude_tvalid;
    fft_mag fft_mag_i(
        .clk(clk_104mhz),
        .event_tlast_missing(last_missing),
        .frame_tdata(frame_tdata),
        .frame_tlast(frame_tlast),
        .frame_tready(frame_tready),
        .frame_tvalid(frame_tvalid),
        .scaling(12'b000111111000),
        .magnitude_tdata(magnitude_tdata),
        .magnitude_tlast(magnitude_tlast),
        .magnitude_tuser(magnitude_tuser),
        .magnitude_tvalid(magnitude_tvalid));

    // Let's only care about the range from index 0 to 1023, which represents frequencies 0 to omega/2
    // where omega is the nyquist frequency (sample rate / 2)
    wire in_range = ((~|magnitude_tuser[11:10]) && |magnitude_tuser[5:1]); // When 13 and 12 are 0, we're on indexes 0 to 1023

    // INSTANTIATE HISTOGRAM BLOCK RAM 
    // This 16x1024 bram stores the histogram data.
    // The write port is written by process_fft.
    // The read port is read by the video outputter or the SD care saver
    // Assign histogram bram read address to histogram module unless saving
    wire [9:0] haddr; // The read port address
    wire [15:0] hdata; // The read port data
    bram_fft bram2 (
        .clka(clk_104mhz),
        .wea(in_range & magnitude_tvalid),  // Only save FFT output if in range and output is valid
        .addra(magnitude_tuser[9:0]),       // The FFT output index, 0 to 1023
        .dina(magnitude_tdata[15:0]),       // The actual FFT magnitude
        .clkb(clk_65mhz),  // input wire clkb
        .addrb(haddr),     // input wire [9 : 0] addrb
        .doutb(hdata)      // output wire [15 : 0] doutb
    );

    // INSTANTIATE HISTOGRAM VIDEO
    // A simple module that outputs a VGA histogram based on
    // hcount, vcount, and the BRAM read values
    wire [2:0] hist_pixel;
    wire [1:0] hist_range;
    wire [1:0] high;
    wire [4:0] sensitivity;
    histogram fft_histogram(
        .clk(clk_65mhz),
        .hcount(hcount),
        .vcount(vcount),
        .blank(blank),
        .range(0), // How much to zoom on the first part of the spectrum
        .vaddr(haddr),
        .vdata(hdata),
        .pixel(hist_pixel),
        .high(high),
        .sensitivity(sensitivity));

    // INSTANTIATE PWM AUDIO OUT MODULE
    // 11 bit PWM audio out is reasonable because otherwise, the PWM frequency would
    // drop close to the audible and unfiltered range. 11bits -> 104Mhz/2^11=51Khz
    wire [10:0] pwm_sample;
    pwm11 pwm_out(
        .clk(clk_104mhz),
        .PWM_in(osample16[13:3]),
        .PWM_out(AUD_PWM),
        .PWM_sd(AUD_SD));

//////////////////////////////////////////////////////////////////////////////////
//  
    // VGA OUTPUT
    // Histogram has two pipeline stages so we'll pipeline the hs and vs accordingly
    reg [1:0] hsync_delay;
    reg [1:0] vsync_delay;
    reg hsync_out, vsync_out;
    reg video_out;
    always @(posedge clk_65mhz) begin
        {hsync_out,hsync_delay} <= {hsync_delay,hsync};
        {vsync_out,vsync_delay} <= {vsync_delay,vsync};
        video_out <= SW[14];
    end
    

    //assign VGA_R = {4{hist_pixel[0]}};
    //assign VGA_G = {4{hist_pixel[1]}};
    //assign VGA_B = {4{hist_pixel[2]}};
   // assign VGA_HS = hsync_out;
   // assign VGA_VS = vsync_out;

    // Assign RGB LEDs
    assign {LED16_R, LED16_G, LED16_B} = {1'b0, high};
    assign {LED17_R, LED17_G, LED17_B} = 3'b000;
   
//////////////////////////////////////////////////////////////////////////////////



 
//////////////////////////////////////////////////////////////////////////////////
// sample Verilog to generate color bars
    wire game_hsync;
    wire game_vsync;
    wire [23:0] pixel;
    wire [31:0] character_x;
    wire [1:0] state;
    wire [9:0] param_value;
    wire [3:0] params_seen;
    wire [30:0] data_bus;
    wire [59:0] visibleObstaclesY;
    screamyBird scgame(.clk(clock_25mhz),.start(BTNC), .increase(BTNU), .decrease(BTND), .left(BTNL), .right(BTNR), .character_x(character_x), .state(state), .movement(high),
     .pixel(pixel),.at_display_area(at_display_area),.hsync(game_hsync),.vsync(game_vsync), .param_select(SW[0]), .param_value(param_value), .visibleObstaclesY(visibleObstaclesY), .data_bus(data_bus));

    assign sensitivity = data_bus[22:18];
    xvga vga1(.vclock(clock_25mhz),.hcount(hcount),.vcount(vcount),
      .hsync(hsync),.vsync(vsync), .blank(blank));
    assign LED = {13'b0, state} ; 
    assign data = {2'd0, param_value, character_x[19:0]};   // display 0123456 + SW
    assign VGA_R = video_out ? {4{hist_pixel[0]}} : (at_display_area ? pixel[23:20] : 0);
    assign VGA_G = video_out ? {4{hist_pixel[1]}} : (at_display_area ? pixel[16:13] :0);
    assign VGA_B = video_out ? {4{hist_pixel[2]}} : (at_display_area ? pixel[7:4] :0);
    assign VGA_HS = video_out ? ~hsync : ~game_hsync;
    assign VGA_VS = video_out ? ~vsync : ~game_vsync;

endmodule

module clock_quarter_divider(input wire clk100_mhz, output reg clock_25mhz = 0);
    reg counter = 0;

    // VERY BAD VERILOG
    // VERY BAD VERILOG
    // VERY BAD VERILOG
    // But it's a quick and dirty way to create a 25Mhz clock
    // Please use the IP Clock Wizard under FPGA Features/Clocking
    //
    // For 1 Hz pulse, it's okay to use a counter to create the pulse as in
    // assign onehz = (counter == 100_000_000); 
    // be sure to have the right number of bits.

    always @(posedge clk100_mhz) begin
        counter <= counter + 1;
        if (counter == 0) begin
            clock_25mhz <= ~clock_25mhz;
        end
    end
endmodule


//////////////////////////////////////////////////////////////////////
//
// blob: generate rectangle on screen
//
//////////////////////////////////////////////////////////////////////
module blob
   #(parameter WIDTH = 64,            // default width: 64 pixels
               HEIGHT = 64,           // default height: 64 pixels
               COLOR = 24'hFF_FF_FF,  // default color: white
               OFFSET = 0)
      (input wire [9:0] x,hcount,
        input wire [9:0] y,vcount,
    output reg [23:0] pixel);

   always @ * begin
      if ((hcount >= x && hcount < (x+WIDTH) && hcount > OFFSET) &&
	 (vcount >= y && vcount < (y+HEIGHT)))
	pixel = COLOR;
      else pixel = 0;
   end
endmodule

module obstacleBlob
   #(parameter WIDTH = 64,
               COLOR = 24'hFF_FF_FF,  // default color: white
               OFFSET = 0)
   (input wire [9:0] x,hcount,
    input wire [9:0] y,vcount,
    input wire [9:0] height,
    output reg [23:0] pixel);

   always @ * begin
      if ((hcount >= x && (x) > 0 && hcount < (x+WIDTH)) &&
	 (vcount >= y && vcount < (y+height)))
	pixel = COLOR;
      else pixel = 0;
   end
endmodule

module screamyBird (
    input wire clk,
    input wire start,
    input wire increase,
    input wire decrease,
    input wire left,
    input wire right,
    input wire [1:0] param_select,
    input wire [1:0] movement,
    output wire [23:0] pixel,
    output wire at_display_area,
    output wire hsync,
    output wire vsync,
    output wire [31:0] character_x,
    output wire [1:0] state,
    output wire [9:0] param_value,
    output wire [30:0] data_bus,
    output wire [59:0] visibleObstaclesY
);
    wire [9:0] hcount;
    wire [9:0] vcount;
    wire [9:0] character_height;
    wire update_state;
    wire collision,xCollision;
    wire [30:0] current_data_bus;
    wire [9:0] collidingObstacleY;
    wire [59:0] visibleObstaclesX;
//    wire [60:0] visibleObstaclesY,visibleObstaclesX;
    gameFSM game(.clk(clk),.start(start),.collision(1'd0), .state(state), .movement(movement), .updateState(update_state), .hsync(hsync), .hcount(hcount), .data_bus(data_bus), 
    .current_data_bus(current_data_bus),.vcount(vcount),.vsync(vsync), .character_height(character_height), .at_display_area(at_display_area), .character_x(character_x));
    
    CollisionDetection detect(.clk(clk), .collidingObstacleY(collidingObstacleY),.xCollision(xCollision),.updateState(update_state), .character_height(character_height), .movement(movement),.collision(collision),.current_data_bus(current_data_bus));
    updateState us(.clk(clk), .update_state(update_state));
    obstaclePosition obPosition( .clk(clk), .updateState(update_state), .characterX(character_x), .numberOfObstacles(4'd8), .collidingObstacleY(collidingObstacleY), .visibleObstaclesY(visibleObstaclesY),.visibleObstaclesX(visibleObstaclesX), .xCollision(xCollision));
    
    //might want to move this inside graphics coallator?
    wire [23:0] charapixel;
    wire [23:0] wallpixel;
    wire [23:0] backpixel;
    wire [23:0] obpixel;
    obstacleSpriteGenerator obSprite(.clk(clk),.current_data_bus(current_data_bus),.visibleObstaclesY(visibleObstaclesY),.visibleObstaclesX(visibleObstaclesX),.hcount(hcount),.vcount(vcount),.obpixel(obpixel));
    characterSpriteGenerator cspritegen(.character_height(character_height),.hcount(hcount),.vcount(vcount), .clk(clk),.charapixel(charapixel));
    wallSpriteGenerator wspritegen(.wall_height(character_height),.hcount(hcount),.vcount(vcount),.clk(clk),.wallpixel(wallpixel));
    backgroundSpriteGenerator bspritegen(.state(state),.hcount(hcount),.vcount(vcount),.clk(clk),.backpixel(backpixel));
    
    graphicsCollator gcollator(.clk(clk),.charapixel(charapixel),.wallpixel(obpixel),.backpixel(backpixel), .pixel(pixel));
    
    //assign movement = left ? 2 : right ? 1: 0;
    paramController params(.increase(increase), .decrease(decrease), .SW(param_select), .clk(clk), .start(start), .data_bus(data_bus), .value(param_value));
    
endmodule

module updateState(input wire clk, output wire update_state);
    reg [31:0] count;
    always @(posedge clk) begin
        if (count == 100000) count <= 0;
        else count <= count + 1;
    end
    assign update_state = (count == 100000);
endmodule

module movementDecision(input clk, input wire [1:0] newSignal, output wire direction);
    reg [19:0] currentarray;
    reg [5:0] total;
    always @(posedge clk) begin
        total <= total + newSignal - currentarray[19:18];
        currentarray <= {currentarray[17:0], newSignal};
    end
    
    assign direction = total > 25 ? 2 : (total < 15 ? 1 : 0);
endmodule

