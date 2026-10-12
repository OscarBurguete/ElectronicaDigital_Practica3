`timescale 1ns / 1ps
module mode_toggle(
    input wire clk_div,
    input wire reset,
    input wire [3:0] count,
    output reg toggle // 1 = Ascendente, 0 = Descendente
);
    always @(posedge reset, posedge clk_div) begin
        if (reset) begin
            toggle <= 1'b1; 
        end else begin
            if (toggle && count >= 4'd4) begin
                toggle <= 1'b0; 
            end else if (!toggle && count <= 4'd1) begin
                toggle <= 1'b1; 
            end
        end
    end
endmodule