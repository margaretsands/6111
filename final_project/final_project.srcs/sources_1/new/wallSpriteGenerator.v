`timescale 1ns / 1ps
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
    blob #(.WIDTH(wallLength),.HEIGHT(wallHeight),.COLOR(24'h60_FF_00),.OFFSET(6'd50)) wallsprite(.x(constantx),.y(10'd300),.hcount(hcount), .vcount(vcount), .pixel(wall1pixel));
    blob #(.WIDTH(wallLength),.HEIGHT(wallHeight),.COLOR(24'h60_FF_00),.OFFSET(6'd50)) wall2sprite(.x(constantx),.y(10'd300+wallDistance),.hcount(hcount), .vcount(vcount), .pixel(wall2pixel));
    assign wallpixel = wall1pixel | wall2pixel;
endmodule