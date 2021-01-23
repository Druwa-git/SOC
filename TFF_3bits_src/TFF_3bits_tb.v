`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/10 16:51:49
// Design Name: 
// Module Name: TFF_3bits_tb
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


module TFF_3bits_tb ();
    reg clk, reset, start_sim;
    reg [2:0] din;
    wire [3:0] led;
    wire [3:0] btn = {reset, din};
    
    TFF_3bits UUT(
        .sysclk (clk), .btn (btn), .led (led)
    );
    initial begin
        clk = 1'b1; reset = 1'b0;
        start_sim =0;
        #30
        reset = 1'b1;
        #20
        reset = 1'b0;
        #20
        start_sim = 1;
    end
    always begin
        #10
        clk = ~clk;
    end
    
    always @(posedge clk)
        if(reset == 1'b1)
            din <= 3'b000;
        else if (start_sim == 1)
            din <= din + 1;
endmodule
