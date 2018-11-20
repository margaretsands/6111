
module characterSpriteGenerator(
    input [9:0] character_height,
    input [9:0] hcount,
    input [9:0] vcount,
    input clk,
    output [23:0] charapixel
);
    
    blob charactersprite(.x(10'd320),.y(character_height),.hcount(hcount), .vcount(vcount), .pixel(charapixel));

endmodule
