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
    input wire clk,
    input wire [9:0] character_height,
    input wire [9:0] collidingObstacleY,
    input wire [30:0] current_data_bus,
    input wire [1:0] movement,
    input wire updateState,
    input wire xCollision,
    output reg collision);
    
    wire [3:0] character_y_speed;
    wire [3:0] character_x_speed;
    wire [9:0] wall_distance;
    reg [9:0] next_height;
    
    assign character_y_speed = current_data_bus[7:4];
    assign character_x_speed = current_data_bus[3:0];
    assign wall_distance = current_data_bus[17:8];
    
    //current height for character is the top of their box
    parameter characterSize = 64;
    
    always @(*) begin
        if (updateState) begin
            next_height <= movement==2 ? character_height - character_y_speed : (movement==1 ? character_height + character_y_speed : character_height);
            //needs a && xCollision term 
            if (xCollision && (((next_height <= collidingObstacleY) || ((next_height+characterSize) >= (collidingObstacleY + wall_distance))))) begin
                collision <= 1;
            end
            else 
                collision <= 0;
        end
    end
endmodule