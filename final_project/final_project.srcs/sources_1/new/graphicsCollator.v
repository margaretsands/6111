`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 06:31:53 PM
// Design Name: 
// Module Name: graphicsCollator
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

module graphicsCollator(
    input wire [23:0] charapixel,
    input wire [23:0] wallpixel,
    input wire [23:0] backpixel,
    output reg [23:0] pixel);
    
    //ordering is wall then character then background 
    
    always @(*) begin
        if (wallpixel)
            pixel <= wallpixel;
        else if (charapixel)
            pixel <= charapixel;
        else
            pixel <= backpixel;
    end

endmodule
