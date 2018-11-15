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
   

// create 25mhz system clock
    wire clock_25mhz;
    clock_quarter_divider clockgen(.clk100_mhz(CLK100MHZ), .clock_25mhz(clock_25mhz));

//  instantiate 7-segment display;  
    wire [31:0] data;
    wire [6:0] segments;
    display_8hex display(.clk(clock_25mhz),.data(data), .seg(segments), .strobe(AN));    
    assign SEG[6:0] = segments;
    assign SEG[7] = 1'b1;

//////////////////////////////////////////////////////////////////////////////////
//
//  remove these lines and insert your lab here

    assign LED = SW;     
    assign JA[7:0] = 8'b0;
    
    assign LED16_R = BTNL;                  // left button -> red led
    assign LED16_G = BTNC;                  // center button -> green led
    assign LED16_B = BTNR;                  // right button -> blue led
    assign LED17_R = BTNL;
    assign LED17_G = BTNC;
    assign LED17_B = BTNR; 



//
//////////////////////////////////////////////////////////////////////////////////




 
//////////////////////////////////////////////////////////////////////////////////
// sample Verilog to generate color bars
    
    wire [9:0] hcount;
    wire [9:0] vcount;
    wire hsync, vsync, at_display_area;
    wire [23:0] pixel;
    screamyBird scgame(.clk(clock_25mhz),.pixel(pixel),.at_display_area(at_display_area),.hsync(hsync),.vsync(vsync));

//    vga vga1(.vga_clock(clock_25mhz),.hcount(hcount),.vcount(vcount),
//      .hsync(hsync),.vsync(vsync),.at_display_area(at_display_area));
    
    assign data = {4'd1, pixel};   // display 0123456 + SW
    assign VGA_R = at_display_area ? pixel[23:20] : 0;
    assign VGA_G = at_display_area ? pixel[16:13] :0;
    assign VGA_B = at_display_area ? pixel[7:4] :0;
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

//////////////////////////////////////////////////////////////////////
//
// blob: generate rectangle on screen
//
//////////////////////////////////////////////////////////////////////
module blob
   #(parameter WIDTH = 64,            // default width: 64 pixels
               HEIGHT = 64,           // default height: 64 pixels
               COLOR = 24'hFF_FF_FF)  // default color: white
   (input [9:0] x,hcount,
    input [9:0] y,vcount,
    output reg [23:0] pixel);

   always @ * begin
      if ((hcount >= x && hcount < (x+WIDTH)) &&
	 (vcount >= y && vcount < (y+HEIGHT)))
	pixel = COLOR;
      else pixel = 0;
   end
endmodule

module screamyBird (
    input clk,
    output [23:0] pixel,
    output at_display_area,
    output hsync,
    output vsync
);
    wire [9:0] hcount;
    wire [9:0] vcount;
    wire [9:0] character_height;
    wire [23:0] charapixel;
    wire [23:0] wallpixel;
    gameFSM game(.clk(clk),.start(clk),.hsync(hsync), .hcount(hcount),.vcount(vcount),.vsync(vsync), .character_height(character_height), .at_display_area(at_display_area));
    characterSpriteGenerator cspritegen(.character_height(character_height),.hcount(hcount),.vcount(vcount), .clk(clk),.charapixel(charapixel));
    wallSpriteGenerator wspritegen(.wall_height(character_height),.hcount(hcount),.vcount(vcount),.clk(clk),.wallpixel(wallpixel));
    assign pixel = charapixel | wallpixel;
endmodule

module gameFSM (
    //game FSM inputs will go here after being debounced
    input clk,
    input start,
    output hsync,
    output vsync,
    output at_display_area,
    output [9:0] hcount,
    output [9:0] vcount,
    output reg [9:0] character_height,
    output reg [9:0] wall_height
    );
    vga vga1(.vga_clock(clk),.hcount(hcount),.vcount(vcount),
      .hsync(hsync),.vsync(vsync),.at_display_area(at_display_area));
    
   always @(start) begin
    character_height = 200;
    wall_height = 150;
   end
    
endmodule

module characterSpriteGenerator(
    input [9:0] character_height,
    input [9:0] hcount,
    input [9:0] vcount,
    input clk,
    output [23:0] charapixel
);
    
    blob charactersprite(.x(10'd320),.y(character_height),.hcount(hcount), .vcount(vcount), .pixel(charapixel));

endmodule

module wallSpriteGenerator(
    input [9:0] wall_height,
//    input [9:0] wall_distance,
    input [9:0] hcount,
    input [9:0] vcount,
    input clk,
    output [23:0] wallpixel
);
    parameter [9:0] wallLength = 100;
    parameter [9:0] wallHeight = 10;
    parameter [9:0] constantx = 320 - wallLength;
    
    parameter [9:0] wallDistance = 100;
    
    wire [23:0] wall1pixel, wall2pixel;
    blob #(.WIDTH(wallLength),.HEIGHT(wallHeight),.COLOR(24'hFF_FF_00)) wallsprite(.x(constantx),.y(10'd300),.hcount(hcount), .vcount(vcount), .pixel(wall1pixel));
    blob #(.WIDTH(wallLength),.HEIGHT(wallHeight),.COLOR(24'hFF_FF_00)) wall2sprite(.x(constantx),.y(10'd300+wallDistance),.hcount(hcount), .vcount(vcount), .pixel(wall2pixel));
    assign wallpixel = wall1pixel | wall2pixel;
endmodule

module CollisionDetection(
    input [9:0] character_height,
    input [9:0] wall_position,
    //input [9:0] wallDistance,
    //input [?:0] character_speed,
    //input [?:0] wall_speed
    output collision);
    
    parameter characterSize = 64;
    parameter wallHeight = 10;
    
    parameter [9:0] wallDistance = 100;
    
    //actually need to take in speed too rip
    always @(character_height,wall_position) begin 
    end
endmodule
