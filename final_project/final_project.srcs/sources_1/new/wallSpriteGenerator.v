
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