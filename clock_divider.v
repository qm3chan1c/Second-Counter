`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: --
// Engineer: QJ
// 
// Create Date: 07/06/2025 08:56:51 PM
// Design Name: Clock Divider
// Module Name: clock_divider
// Project Name: Second-Counter
// Target Devices: Basys 3
// Tool Versions: Vivado 2024.2
// Description: Divides a 100MHz clock to a 1Hz clock
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clock_divider(
    input clk_in,
    output reg divided_clk_out
    );
    

    reg [31:0] counter_signal = {32{1'b0}};
    
    
    always @(posedge clk_in) begin
        
        
        
        if (counter_signal < 32'b00000010111110101111000010000000) begin
            counter_signal <= counter_signal + 1;
            divided_clk_out <= 1'b0;
        
        end else if ((counter_signal < 32'b00000101111101011110000100000000) & (counter_signal >= 32'b00000010111110101111000010000000)) begin
            counter_signal <= counter_signal + 1;
            divided_clk_out <= 1'b1;
        
        end else begin
            counter_signal <= {32{1'b0}};
        end
    end
endmodule
