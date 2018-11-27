`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2018 03:10:30 PM
// Design Name: 
// Module Name: obstaclePosition
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


module obstaclePosition(
    input clk,
    input updateState,
    input [9:0] characterX,
    output [3:0] numberOfObstacles, //currently can only have up to 8 obstacles on screen which seems reasonable
    output [9:0] collidingObstacleY,
    output reg [59:0] visibleObstaclesY,
    output reg [59:0] visibleObstaclesX,
    output xCollision
    );
    //starting with 8 obstacles whose heights were picked by random.org's number generator
//    parameter [79:0] obstacleArray = {10'd300,10'd430,10'd229,10'd50,10'd429,10'd92,10'd356,10'd156};
    reg [9:0] obstacleArray[7:0];
    
    initial begin
        obstacleArray[0] = 10'd300;
        obstacleArray[1] = 10'd230;
        obstacleArray[2] = 10'd229;
        obstacleArray[3] = 10'd50;
        obstacleArray[4] = 10'd129;
        obstacleArray[5] = 10'd92;
        obstacleArray[6] = 10'd326;
        obstacleArray[7] = 10'd156;
    end
    
    
    parameter characterWidth = 64;
    parameter obstacleWidth = 50;
    parameter spaceBetweenObstacles = 78; //previously 78
    parameter indexShift = 7; // log(widthPerObstacle) so that we can find the current obstacle
    parameter maximumVisible = 6; //previously 6
    parameter widthPerObstacle = obstacleWidth + spaceBetweenObstacles;
    
    //tried switching this to -
    parameter characterOffset = (320 - characterWidth/2 + obstacleWidth);
    
    wire [2:0] currentObstacle;
    reg [2:0] lowbound;
    //x values are evenly distributed to each obstacle and with the same amount of space between so the x value of an obstacle is obstacle#*
    assign currentObstacle = characterX >> indexShift;
    assign xCollision = characterX[6:0] < obstacleWidth;
    
    wire [9:0] closestObstacle = (lowbound*widthPerObstacle > characterX) ? (lowbound*widthPerObstacle - characterX) + characterOffset : characterOffset-(characterX - lowbound*widthPerObstacle);
    wire [9:0] secondclosestObstacle = closestObstacle + widthPerObstacle;
    wire [9:0] thirdclosestObstacle = closestObstacle + 2*widthPerObstacle;
    wire [9:0] fourthclosestObstacle = closestObstacle + 3*widthPerObstacle;
    wire [9:0] fifthclosestObstacle = closestObstacle + 4*widthPerObstacle;
    wire [9:0] sixthclosestObstacle = closestObstacle + 5*widthPerObstacle;
    
    reg needUpdate = 0;
    //possibly rethink when to increment indexCount
    always @(clk) begin
        lowbound <= characterX >= characterOffset ? ((characterX-characterOffset) >> indexShift)-1 : ((8*widthPerObstacle - (characterOffset- characterX)) >> indexShift)-1;
//        visibleObstaclesY <= {obstacleArray[lowbound],obstacleArray[lowbound+1],obstacleArray[lowbound+2],obstacleArray[lowbound+3], 20'd0};
//        visibleObstaclesX <= {closestObstacle, closestObstacle, thirdclosestObstacle, fourthclosestObstacle, 20'd0};
        visibleObstaclesY <= {obstacleArray[lowbound],obstacleArray[lowbound+1],obstacleArray[lowbound+2],obstacleArray[lowbound+3],obstacleArray[lowbound+4],obstacleArray[lowbound+5]};
        visibleObstaclesX <= {closestObstacle, closestObstacle, thirdclosestObstacle, fourthclosestObstacle, fifthclosestObstacle, sixthclosestObstacle};
    end
    //visibility is determined by the x of a obstacle being between characterX-(320-.5*birdwidth) and characterX + 320 + .5*birdWidth from  and 
    
    
endmodule
