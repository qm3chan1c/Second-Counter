`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2025 10:50:19 PM
// Design Name: 
// Module Name: counter
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


module display(
    input clk_in,
    output reg[6:0] digit_out,
    output reg[3:0] anode_out
    );
    
    reg [31:0] incrementer_signal = {32{1'b0}};
    wire [27:0] digit_signal;
//    reg [3:0] anode_signal;
    wire divided_clk_signal;
    
    
    clock_divider one_Hz(
        .clk_in(clk_in),
        .divided_clk_out(divided_clk_signal)
    );
    
    number_counting count(
        .divided_clk_in(divided_clk_signal),
        .number_out(digit_signal)
    );
    
    always @(posedge clk_in) begin
        if (incrementer_signal <  32'b00000000000000011000011010100000) begin
            incrementer_signal <= incrementer_signal + 1;
            anode_out <= 4'b1110;
            digit_out <= digit_signal[6:0];
        
        end else if ((incrementer_signal <  32'b00000000000000110000110101000000) & (incrementer_signal >=  32'b00000000000000011000011010100000)) begin
            incrementer_signal <= incrementer_signal + 1;
            anode_out <= 4'b1101;
            digit_out <= digit_signal[13:7];
            
        end else if ((incrementer_signal <  32'b00000000000001001001001111100000) & (incrementer_signal >=  32'b00000000000000110000110101000000)) begin
            incrementer_signal <= incrementer_signal + 1;
            anode_out <= 4'b1011;
            digit_out <= digit_signal[20:14];
            
       end else if ((incrementer_signal <  32'b00000000000001100001101010000000) & (incrementer_signal >=  32'b00000000000001001001001111100000)) begin
            incrementer_signal <= incrementer_signal + 1;
            anode_out <= 4'b0111;
            digit_out <= digit_signal[27:21];
            
        end else begin
            incrementer_signal <= 32'b00000000000000000000000000000000;
//            anode_out <= 4'b1111;
//            digit_out <= 8'b11111111;
        end
        
    end
endmodule
