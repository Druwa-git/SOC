`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/10 16:40:52
// Design Name: 
// Module Name: TFF_3bits
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


module TFF_3bits(
    input sysclk,
    input [3:0] btn,
    output [3:0] led
    );
    wire [2:0] T;
    reg [2:0] btnC, btnD, Q;
    reg resetD;
    wire reset = btn[3], clk = sysclk;
    assign led = {resetD, Q};
    assign T = btnC & (~btnD);
    
    always @(posedge clk) begin
        btnC <= btn;
        btnD <= btnC;
        resetD <= btn[3];
    end
    always @(posedge clk) 
    begin
        if( reset == 1'b1)
            Q[2:0] <= 3'b000;
        else begin
            if(T[2] == 1'b1)
                Q[2] <= ~led[2];
            if(T[1] == 1'b1)
                Q[1] <= ~led[1];
            if(T[0] == 1'b1)
                Q[0] <= ~led[0];
        end
    end
endmodule
