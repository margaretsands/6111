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
   input CLK100MHZ,
   input[15:0] SW, 
   input BTNC, BTNU, BTNL, BTNR, BTND,
   output[3:0] VGA_R, 
   output[3:0] VGA_B, 
   output[3:0] VGA_G,
   output[7:0] JA, 
   output VGA_HS, 
   output VGA_VS, 
   output LED16_B, LED16_G, LED16_R,
   output LED17_B, LED17_G, LED17_R,
   output[15:0] LED,
   output[7:0] SEG,  // segments A-G (0-6), DP (7)
   output[7:0] AN    // Display 0-7
   );
 
//////////////////////////////////////////////////////////////////////////////////
// sample Verilog to generate color bars
    
    wire [9:0] hcount;
    wire [9:0] vcount;
    wire [23:0] pixel;
    wire hsync, vsync, at_display_area;
    vga vga1(.vga_clock(clock_25mhz),.hcount(hcount),.vcount(vcount),
          .hsync(hsync),.vsync(vsync),.at_display_area(at_display_area));
    pong_game game1(.vclock(clock_25mhz), .reset(reset),.up(BTNU),.down(BTND),.pspeed(2'd3),.hcount(hcount),.vcount(vcount),.hsync(hsync),.vsync(vsync),.pixel(pixel));
    assign VGA_R = pixel[23:20];
    assign VGA_G = pixel[15:12];
    assign VGA_B = pixel[7:4];
    assign VGA_HS = ~hsync;
    assign VGA_VS = ~vsync;
endmodule

module clock_quarter_divider(input clk100_mhz, output reg clock_25mhz = 0);
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

module vga(input vga_clock,
            output reg [9:0] hcount = 0,    // pixel number on current line
            output reg [9:0] vcount = 0,    // line number
            output reg vsync, hsync, 
            output at_display_area);

   // Comments applies to XVGA 1024x768, left in for reference
   // horizontal: 1344 pixels total
   // display 1024 pixels per line
   reg hblank,vblank;
   wire hsyncon,hsyncoff,hreset,hblankon;
   assign hblankon = (hcount == 639);    // active H  1023
   assign hsyncon = (hcount == 655);     // active H + FP 1047
   assign hsyncoff = (hcount == 751);    // active H + fp + sync  1183
   assign hreset = (hcount == 799);      // active H + fp + sync + bp 1343

   // vertical: 806 lines total
   // display 768 lines
   wire vsyncon,vsyncoff,vreset,vblankon;
   assign vblankon = hreset & (vcount == 479);    // active V   767
   assign vsyncon = hreset & (vcount ==490 );     // active V + fp   776
   assign vsyncoff = hreset & (vcount == 492);    // active V + fp + sync  783
   assign vreset = hreset & (vcount == 523);      // active V + fp + sync + bp 805

   // sync and blanking
   wire next_hblank,next_vblank;
   assign next_hblank = hreset ? 0 : hblankon ? 1 : hblank;
   assign next_vblank = vreset ? 0 : vblankon ? 1 : vblank;
   always @(posedge vga_clock) begin
      hcount <= hreset ? 0 : hcount + 1;
      hblank <= next_hblank;
      hsync <= hsyncon ? 0 : hsyncoff ? 1 : hsync;  // active low

      vcount <= hreset ? (vreset ? 0 : vcount + 1) : vcount;
      vblank <= next_vblank;
      vsync <= vsyncon ? 0 : vsyncoff ? 1 : vsync;  // active low

   end

   assign at_display_area = ((hcount >= 0) && (hcount < 640) && (vcount >= 0) && (vcount < 480));

endmodule

module pong_game (
   input vclock,	// 65MHz clock
   input reset,		// 1 to initialize module
   input up,		// 1 when paddle should move up
   input down,  	// 1 when paddle should move down
   input [3:0] pspeed,  // puck speed in pixels/tick 
   input [10:0] hcount,	// horizontal index of current pixel (0..1023)
   input [9:0] 	vcount, // vertical index of current pixel (0..767)
   input hsync,		// XVGA horizontal sync signal (active low)
   input vsync,		// XVGA vertical sync signal (active low)
 	input switch_sides, //input from button 0, 1 when toggling sides
	
   output phsync,	// pong game's horizontal sync
   output pvsync,	// pong game's vertical sync
   output [23:0] pixel	// pong game's pixel  // r=23:16, g=15:8, b=7:0 
   );
	parameter [9:0] screen_height = 768;
	parameter [10:0] screen_width = 1024;
	parameter [10:0] death_width = 256;
	parameter [9:0] death_height = 240;
	parameter [4:0] paddle_width = 16;
	parameter [9:0] paddle_height = 128;
	parameter [4:0] paddle_speed = 4;
	parameter [4:0] alpha_m = 1;
	parameter [4:0] alpha_log_n = 3;
	parameter [4:0] alpha_n = 8;
	
	
	
	reg [10:0] x = screen_width/2-death_width/2;
	reg [9:0] y = screen_height/2-death_height/2;
	reg x_prime_sign = 1;
	reg y_prime_sign = 1;
   	wire [2:0] checkerboard;
	reg old_vsync=0;
	reg ongoing_game=1;
	reg left_side_play=1;
	
   assign phsync = hsync;
   assign pvsync = vsync;
	wire [23:0] death_pixel;
	blob #(.WIDTH(death_width), .HEIGHT(death_height), .COLOR(24'hFF_00_00)) blob1(.x(x),.y(y),.hcount(hcount),.vcount(vcount),.pixel(death_pixel));
	
	reg[9:0] paddle_y = screen_width/2-paddle_width/2;
	reg[9:0] paddle_x = 0;
	wire [23:0] paddle_pixel;
	blob #(.WIDTH(paddle_width),.HEIGHT(paddle_height),.COLOR(24'hFF_FF_00))   // yellow!
     paddle1(.x(paddle_x),.y(paddle_y),.hcount(hcount),.vcount(vcount),
             .pixel(paddle_pixel));
						 
	assign pixel = (paddle_pixel || death_pixel);
	always @ (posedge vclock) begin
		if ((old_vsync != vsync) && !vsync) begin
			if (ongoing_game) begin
				//change x postion
				if (x_prime_sign) x <= x + pspeed;
				else x <= x - pspeed;
				
				//change y postion
				if (y_prime_sign) y <= y + pspeed;
				else y <= y - pspeed;
				
				//check if puck is approaching the side walls
				if ((x < 2*pspeed && !x_prime_sign) || (x > (screen_width-pspeed-death_width) && x_prime_sign)) begin
						//assume we bounce
						x_prime_sign <= !x_prime_sign;
						//check if the approaching side is the one with the paddle
						if ((x < 2*pspeed && !x_prime_sign && left_side_play) || (x > (screen_width-pspeed-death_width) && x_prime_sign && !left_side_play)) begin
							//check if the paddle missed
							if (!((paddle_y >= y && paddle_y <= y+death_height) || (y <= paddle_y+paddle_height && (paddle_height + paddle_y <= y+death_height)))) ongoing_game <= 0;
						end
				end	
				
				//check if puck is approaching top or bottom wall, flip velocity sign
				if ((y < 2*pspeed && !y_prime_sign) || ((y > (screen_height-pspeed-death_height)) && y_prime_sign)) y_prime_sign <= !y_prime_sign;
				
				//move the paddle up until it reaches the top of the screen
				if (up) begin
				if (paddle_y < 2*paddle_speed) paddle_y <= 0;
				else paddle_y <= paddle_y - paddle_speed;
				end
				
				//move the paddle down until it reaches the bottom edge of the screen
				if (down) begin
				if (paddle_y > (screen_height-2*paddle_speed-paddle_height)) paddle_y <= screen_height- paddle_height;
				else paddle_y <= paddle_y + paddle_speed;
				end
				
				//use game mode to determine the paddle's x location
				if (left_side_play) paddle_x=0;
				else paddle_x = screen_width-16;
			end
			
			//reset variables back to the original conditions (except the side of play)	
			if (reset) begin
				x <= screen_width/2-death_width/2;
				y <= screen_height/2-death_height/2;
				x_prime_sign <= 1;
				y_prime_sign <= 1;
				old_vsync <= 0;
				paddle_y <= screen_height/2-paddle_height/2;
				ongoing_game <= 1;
				end
			
			//if the side toggle button is pressed, toggle to left side  mode or right side mode depending on current state
			if (switch_sides) left_side_play <= !left_side_play;
			
		end
		old_vsync <= vsync;
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
               COLOR = 24'hFF_FF_FF)  // default color: white
   (input [10:0] x,hcount,
    input [9:0] y,vcount,
    output reg [23:0] pixel);

   always @ * begin
      if ((hcount >= x && hcount < (x+WIDTH)) &&
	 (vcount >= y && vcount < (y+HEIGHT)))
	pixel = COLOR;
      else pixel = 0;
   end
endmodule

