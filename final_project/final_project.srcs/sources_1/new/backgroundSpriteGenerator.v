module backgroundSpriteGenerator(
    input [1:0] state,
    input [9:0] hcount,
    input [9:0] vcount,
    input clk,
    output [23:0] backpixel
);
    assign backpixel = state==1 ? 24'h00_00_FF : 24'h00_FF_00;

endmodule