module backgroundSpriteGenerator(
    input wire [1:0] state,
    input wire [9:0] hcount,
    input wire [9:0] vcount,
    input wire clk,
    output wire [23:0] backpixel
);
    assign backpixel = state==1 ? 24'h00_00_FF : 24'h00_FF_00;

endmodule