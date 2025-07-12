`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: --
// Engineer: QJ
// 
// Create Date: 07/06/2025 08:45:51 PM
// Design Name: Number Counter
// Module Name: number_counting
// Project Name: Second Counter
// Target Devices: Basys 3
// Tool Versions: Vivado 2024.2
// Description: increments the number on screen by 1 every second
// 
// Dependencies: display_map_7seg.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module number_counting(
    input enable_clk_in,
    input clk_in,
    output wire [27:0] number_out
//    output reg [3:0] active_anode_out
    );
    
    reg [15:0] number_counter_signal = {16{1'b0}};
//    reg [6:0] number_out_signal [3:0];
    display_map_7seg ones(
        .binary_number_in(number_counter_signal[3:0]),
        .seven_seg_display_out(number_out[6:0])
    );
    
    display_map_7seg tens(
        .binary_number_in(number_counter_signal[7:4]),
        .seven_seg_display_out(number_out[13:7])
    );
    
    display_map_7seg hundreds(
        .binary_number_in(number_counter_signal[11:8]),
        .seven_seg_display_out(number_out[20:14])
    );
    
    display_map_7seg thousands(
        .binary_number_in(number_counter_signal[15:12]),
        .seven_seg_display_out(number_out[27:21])
    );
    
    
    
    always @(posedge clk_in) begin
        if (enable_clk_in) begin
            number_counter_signal <= number_counter_signal + 1;
            
            if (number_counter_signal[3:0] == 4'b1001) begin
                number_counter_signal[3:0] <= 4'b0000;
                number_counter_signal[7:4] <= number_counter_signal[7:4] + 1;
                
                if (number_counter_signal[7:4] == 4'b1001) begin
                    number_counter_signal[11:8] <= number_counter_signal[11:8] + 1;
                    number_counter_signal[7:4] <= 4'b0000;
                    
                    if (number_counter_signal[11:8] == 4'b1001) begin
                        number_counter_signal[15:12] <= number_counter_signal[15:12] + 1;
                        number_counter_signal[11:8] <= 4'b0000;
                        
                        if (number_counter_signal[15:12] == 4'b1001) begin
                            number_counter_signal[11:8] <= 4'b0000;
                            
                        end
                    end
                    
                end
                
            end else if (number_counter_signal[7:4] == 4'b1010) begin
                number_counter_signal[7:4] <= 4'b0000;
                number_counter_signal[11:8] <= number_counter_signal[11:8] + 1;
                
            end else if (number_counter_signal[11:8] == 4'b1010) begin
                number_counter_signal[11:8] <= 4'b0000;
                number_counter_signal[15:12] <= number_counter_signal[15:12] + 1;
                
                
            end else begin
                number_counter_signal <= {16{1'b0}};
                number_counter_signal <= number_counter_signal + 1;
            end
            
            
        end else begin
            number_counter_signal <= number_counter_signal;
        end
    end

endmodule
