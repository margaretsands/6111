
module characterSpriteGenerator(
    input wire [9:0] character_height,
    input wire [9:0] hcount,
    input wire [9:0] vcount,
    input wire clk,
    output wire [23:0] charapixel
);
    
    blob charactersprite(.x(10'd320),.y(character_height),.hcount(hcount), .vcount(vcount), .pixel(charapixel));

endmodule
