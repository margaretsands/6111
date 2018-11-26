`timescale 1ns / 1ps

module obstacleSpriteGenerator(
    input [30:0] current_data_bus,
    input [59:0] visibleObstaclesY,
    input [59:0] visibleObstaclesX,
    input [9:0] hcount,
    input [9:0] vcount,
    input clk,
    output reg [23:0] obpixel
);
    wire wallDistance = current_data_bus[17:8];
    parameter obstacleWidth = 50;
    
    wire [23:0] wall1pixel, wall2pixel, wall3pixel, wall4pixel, wall5pixel, wall6pixel;
    obstacleBlob #(.WIDTH(obstacleWidth),.COLOR(24'h60_FF_00),.OFFSET(6'd50)) wallsprite(.height(visibleObstaclesY[59:50]),.x(visibleObstaclesX[59:50]),.y(10'd0),.hcount(hcount), .vcount(vcount), .pixel(wall1pixel));
    obstacleBlob #(.WIDTH(obstacleWidth),.COLOR(24'h60_FF_00),.OFFSET(6'd50)) wall1sprite(.height(visibleObstaclesY[49:40]),.x(visibleObstaclesX[49:40]),.y(10'd0),.hcount(hcount), .vcount(vcount), .pixel(wall2pixel));
    obstacleBlob #(.WIDTH(obstacleWidth),.COLOR(24'h60_FF_00),.OFFSET(6'd50)) wall2sprite(.height(visibleObstaclesY[39:30]),.x(visibleObstaclesX[39:30]),.y(10'd0),.hcount(hcount), .vcount(vcount), .pixel(wall3pixel));
    obstacleBlob #(.WIDTH(obstacleWidth),.COLOR(24'h60_FF_00),.OFFSET(6'd50)) wall3sprite(.height(visibleObstaclesY[29:20]),.x(visibleObstaclesX[29:20]),.y(10'd0),.hcount(hcount), .vcount(vcount), .pixel(wall4pixel));
    obstacleBlob #(.WIDTH(obstacleWidth),.COLOR(24'h60_FF_00),.OFFSET(6'd50)) wall4sprite(.height(visibleObstaclesY[19:10]),.x(visibleObstaclesX[19:10]),.y(10'd0),.hcount(hcount), .vcount(vcount), .pixel(wall5pixel));
    obstacleBlob #(.WIDTH(obstacleWidth),.COLOR(24'h60_FF_00),.OFFSET(6'd50)) wall5sprite(.height(visibleObstaclesY[9:0]),.x(visibleObstaclesX[9:0]),.y(10'd0),.hcount(hcount), .vcount(vcount), .pixel(wall6pixel));
    //REMEMBER THAT YOU TURNED COLLISIONS OFF PLS DON'T BE DUMB THX
    
    
//    blob #(.WIDTH(wallLength),.HEIGHT(wallHeight),.COLOR(24'h60_FF_00),.OFFSET(6'd50)) wall2sprite(.x(constantx),.y(10'd300+wallDistance),.hcount(hcount), .vcount(vcount), .pixel(wall2pixel));
    always @(clk) begin
        obpixel = wall1pixel | wall2pixel | wall3pixel | wall4pixel | wall5pixel | wall6pixel;
    end
//    assign obpixel = wall2pixel | wall6pixel;
endmodule