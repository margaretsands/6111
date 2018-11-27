`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Mitchell Gu
// Project Name: Nexys4 FFT Demo
//////////////////////////////////////////////////////////////////////////////////

module histogram(
    input wire clk,
    input wire [10:0] hcount,
    input wire [9:0] vcount,
    input wire blank,
    input wire [4:0] sensitivity,
    input wire [1:0] range,
    output wire [9:0] vaddr,
    input wire [15:0] vdata,
    output reg [2:0] pixel,
    output reg [1:0] high
    );
    
    // 1 bin per pixel, with the selected range
    assign vaddr = hcount[9:0] >> 4;
    reg [15:0] max_val = 16'b0010000000000000;
    reg [9:0] hheight; // Height of histogram bar
    reg [9:0] vheight; // The height of pixel above bottom of screen
    reg blank1; // blank pipelined 1

    always @(posedge clk) begin
        // Pipeline stage 1
        hheight <= vdata >> 5;
        vheight <= 10'd767 - vcount;
        blank1 <= blank;
        
        // Pipeline stage 2
        pixel <= blank1 ? 3'b0 : (vheight < hheight) ? 3'b111 : 3'b0;
        
        if (vaddr < 65 && vaddr > 4) begin
            if (vdata > max_val) begin
                high <= (vaddr < 21) ?  1 : 2 ;
                max_val <= vdata;
            end    
        end
        else begin
            high <= 0;
            max_val <= 16'b0010000000000000;
        end
    end

endmodule
