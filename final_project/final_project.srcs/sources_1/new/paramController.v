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
    input wire clk,
    input wire increase,
    input wire decrease,
    input wire [1:0] SW,
    input wire start,
    output reg [30:0] data_bus,
    output reg [9:0] value
    );
    
    reg [9:0] wallDistance = 100;
    reg [3:0] characterYSpeed = 4;
    reg [1:0] characterXSpeed = 1; 
    reg [4:0] voiceSensitivity = 20;
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
            data_bus <= {8'b0, voiceSensitivity, wallDistance, characterYSpeed, characterXSpeed};
        end
        else begin
            if (should_increase || should_decrease) begin
                case (SW)
                0: wallDistance <= wallDistance + (should_increase ? 10 : -10);
                1: characterYSpeed <= characterYSpeed + (should_increase ? 1 : -1);
                2: characterXSpeed <= characterXSpeed + (should_increase ? 1: -1); 
                3: voiceSensitivity <= voiceSensitivity + (should_increase ? 1: -1); 
                endcase
            end
            case (SW)
                0: value <= wallDistance;
                1: value <= characterYSpeed;
                2: value <= characterXSpeed;
                3: value <= voiceSensitivity;
                default: value <= 0;
            endcase
        end
    end
    
    assign should_increase = (old_increase != increase && !increase);
    assign should_decrease = (old_decrease != decrease && decrease);
endmodule
