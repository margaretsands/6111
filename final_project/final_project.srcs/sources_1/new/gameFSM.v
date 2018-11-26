`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 06:33:59 PM
// Design Name: 
// Module Name: gameFSM
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


module gameFSM (
    //game FSM inputs will go here after being debounced
    input clk,
    input start,
    input [1:0] movement,
    input collision,
    input updateState,
    input [30:0] data_bus,
    output [1:0] state,
    output hsync,
    output vsync,
    output at_display_area,
    output [9:0] hcount,
    output [9:0] vcount,
    output [9:0] character_height,
    output [31:0] character_x,
    output reg [9:0] wall_height,
    output reg [30:0] current_data_bus
    );
    vga vga1(.vga_clock(clk),.hcount(hcount),.vcount(vcount),
      .hsync(hsync),.vsync(vsync),.at_display_area(at_display_area));
    
    parameter NUM_PARAMS = 3;
    parameter STATE_IN_GAME = 0;
    parameter STATE_GAME_OVER = 1;
    parameter STATE_LOAD_PARAMS = 2;
    reg [1:0] new_state = 1;
    reg old_start = 0;
    wire [3:0] character_y_speed;
    wire [3:0] character_x_speed;
    wire [9:0] wall_distance = 100;
    reg [9:0] height = 9'd200;
    reg [31:0] new_x = 500;
    reg count; 
    reg old_value_transmitting;
    reg [1:0] x_counter = 0;
    always @(posedge clk) begin
        old_start <= start;
        if (old_start != start && start) begin
            new_x <= 0;
            new_state <= STATE_LOAD_PARAMS;
            height <= 200;
            count <= 0;
        end 
        if (state == STATE_LOAD_PARAMS) begin
            count <= count + 1;
            if (count == 1) begin
                current_data_bus <= data_bus; 
                count <= 0;
                new_state <= STATE_IN_GAME;
            end
        end
        else if (state == STATE_IN_GAME) begin
            if (collision) new_state <= 1;
            if (updateState) begin
                if (x_counter==3) begin
                    new_x <= new_x + character_x_speed;
                    x_counter <= 0;
                end
                else x_counter <= 1+ x_counter;
                if (movement == 1) height <= height + character_y_speed;
                if (movement == 2) height <= height - character_y_speed;
            end
        end
    end 
    
    assign character_height = height;
    assign state = new_state;
    assign character_x = new_x;
    assign load = (old_start != start && start);
    assign character_y_speed = current_data_bus[7:4];
    assign character_x_speed = current_data_bus[3:0];
    assign wall_distance = current_data_bus[17:8];
endmodule
