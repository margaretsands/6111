`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 06:31:53 PM
// Design Name: 
// Module Name: CollisionDetection
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
module CollisionDetection(
    input clk,
    input [9:0] character_height,
    input [9:0] wall_position,
    //input [9:0] wallDistance,
    //input [?:0] character_speed,
    //input [?:0] xCollision
    output reg collision);
    
    //current height for character is the top of their box
    parameter characterSize = 64;
    
    //wall height is the height it comes down from the top of the screen
//    parameter wallHeight = 10;
    
    //wall distance is the amount of space between the bottom of the top wall and the top of the bottom wall
    parameter [9:0] wallDistance = 100;
    
    //actually need to take in speed too rip
    always @(*) begin
        if ((character_height <= wall_position) || ((character_height+characterSize) >= (wall_position + wallDistance))) begin
            collision <= 1;
        end
        else 
            collision <= 0;
    end
endmodule