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
    wire [31:0] character_x;
    wire [1:0] state;
    wire [9:0] param_value;
    wire [3:0] params_seen;
    wire [59:0] visibleObstaclesY;
    screamyBird scgame(.clk(clock_25mhz),.start(BTNC), .increase(BTNU), .decrease(BTND), .left(BTNL), .right(BTNR), .character_x(character_x), .state(state),
     .pixel(pixel),.at_display_area(at_display_area),.hsync(hsync),.vsync(vsync), .param_select(SW[0]), .param_value(param_value), .visibleObstaclesY(visibleObstaclesY));

//    vga vga1(.vga_clock(clock_25mhz),.hcount(hcount),.vcount(vcount),
//      .hsync(hsync),.vsync(vsync),.at_display_area(at_display_area));
    assign LED = {13'b0, state} ; 
//    assign data = {2'd0, param_value, character_x[19:0]};   // display 0123456 + SW
    assign data = visibleObstaclesY[59:50];
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
   (input [9:0] x,hcount,
    input [9:0] y,vcount,
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
   (input [9:0] x,hcount,
    input [9:0] y,vcount,
    input [9:0] height,
    output reg [23:0] pixel);

   always @ * begin
      if ((hcount >= x && (x) > 1'd0 && hcount < (x+WIDTH)) &&
	 (vcount >= y && vcount < (y+height)))
	pixel = COLOR;
      else pixel = 0;
   end
endmodule

module screamyBird (
    input clk,
    input start,
    input increase,
    input decrease,
    input left,
    input right,
    input param_select,
    // input [?:0] param_selector_switches,
    output [23:0] pixel,
    output at_display_area,
    output hsync,
    output vsync,
    output [31:0] character_x,
    output [1:0] state,
    output [9:0] param_value,
    output [59:0] visibleObstaclesY
);
    wire [9:0] hcount;
    wire [9:0] vcount;
    wire [9:0] character_height;
    wire [1:0] movement;
    wire update_state;
    wire [30:0] data_bus;
    wire collision,x_collision;
    wire [30:0] current_data_bus;
    wire [9:0] collidingObstacleY;
    wire [59:0] visibleObstaclesX;
//    wire [60:0] visibleObstaclesY,visibleObstaclesX;
    gameFSM game(.clk(clk),.start(start),.collision(1'd0), .state(state), .movement(movement), .updateState(update_state), .hsync(hsync), .hcount(hcount), .data_bus(data_bus), 
    .current_data_bus(current_data_bus),.vcount(vcount),.vsync(vsync), .character_height(character_height), .at_display_area(at_display_area), .character_x(character_x));
    
    
    CollisionDetection detect(.clk(clk), .collidingObstacleY(collidingObstacleY),.xCollision(x_collision),.updateState(update_state), .character_height(character_height), .movement(movement),.collision(collision),.current_data_bus(current_data_bus));
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
    
    assign movement = left ? 2 : right ? 1: 0;
    paramController params(.increase(increase), .decrease(decrease), .SW(param_select), .clk(clk), .start(start), .data_bus(data_bus), .value(param_value));
    
endmodule

module updateState(input clk, output update_state);
    reg [31:0] count;
    always @(posedge clk) begin
        if (count == 100000) count <= 0;
        else count <= count + 1;
    end
    assign update_state = (count == 100000);
endmodule
