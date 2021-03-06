`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 08:52:29 PM
// Design Name: 
// Module Name: paramController
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


module paramController(
    input clk,
    input increase,
    input decrease,
    input SW,
    input start,
    output reg [30:0] data_bus,
    output reg [9:0] value
    );
    
    reg [9:0] wallDistance = 150;
    reg [3:0] characterYSpeed = 4;
    reg [1:0] characterXSpeed = 1; 
    reg [3:0] count = 0;
    reg transmitting;
    reg old_increase;
    reg old_decrease;
    wire should_increase;
    wire should_decrease;
    //character speed
    //sensitivity
    //volume?
    always @(posedge clk) begin
        old_increase <= increase;
        old_decrease <= decrease;
        if (start) begin
            data_bus <= {13'b0, wallDistance, characterYSpeed, characterXSpeed}; // xspeed is [1:0], yspeed is [5:2], walldistance is [15:6]
        end
        else begin
            if (should_increase || should_decrease) begin
                case (SW)
                0: wallDistance <= wallDistance + (should_increase ? 10 : -10);
                1: characterYSpeed <= characterYSpeed + (should_increase ? 1 : -1);
                2: characterXSpeed <= characterXSpeed + (should_increase ? 1: -1); 
                endcase
            end
            case (SW)
                0: value <= wallDistance;
                1: value <= characterYSpeed;
                2: value <= characterXSpeed;
                default: value <= 0;
            endcase
        end
    end
    
    assign should_increase = (old_increase != increase && !increase);
    assign should_decrease = (old_decrease != decrease && decrease);
endmodule
