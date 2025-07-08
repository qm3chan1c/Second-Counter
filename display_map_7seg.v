`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: --
// Engineer: QJ
// 
// Create Date: 07/07/2025 12:59:04 PM
// Design Name: Display Map 7 Segment
// Module Name: display_map_7seg
// Project Name: Second-Counter
// Target Devices: Basys 3
// Tool Versions: Vivado 2024.2
// Description: Maps numbers in binary to the required bit-vector for display on a 7-segment display
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module display_map_7seg(
    input [3:0] binary_number_in,
    output reg [6:0] seven_seg_display_out
    );
    
    always @(*) begin
        case (binary_number_in) 
            4'b0000: seven_seg_display_out = 7'b1000000;
            4'b0001: seven_seg_display_out = 7'b1111001;
            4'b0010: seven_seg_display_out = 7'b0100100;
            4'b0011: seven_seg_display_out = 7'b0110000;
            4'b0100: seven_seg_display_out = 7'b0011001;
            4'b0101: seven_seg_display_out = 7'b0010010;
            4'b0110: seven_seg_display_out = 7'b0000010;
            4'b0111: seven_seg_display_out = 7'b1111000;
            4'b1000: seven_seg_display_out = 7'b0000000;
            4'b1001: seven_seg_display_out = 7'b0010000;
            default: seven_seg_display_out = 7'b1000000;
        endcase
    end
endmodule
