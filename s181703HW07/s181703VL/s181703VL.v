`timescale 1ns / 1ps
module TFF_3bits (
    input sysclk, // Zybo-Z7 (clk if Zybo)
    input [3:0] btn, output [3:0] led 
    );
    wire [2:0] T;
    reg [2:0] btnC, btnD, Q;
    reg resetD; // one clock delayed reset
    wire reset = btn[3], clk = sysclk;
    assign led = {resetD, Q};
    assign T = btnC & (~btnD); // single pulse gen
    always @(posedge clk) begin
        btnC <= btn; // synchronize btn to clock
        btnD <= btnC; // delay one clock
        resetD <= btn[3]; // to avoid warning msgs
        end // (actually not needed)
    always @(posedge clk)
        begin // 3 bits T-FF
        if ( reset == 1'b1 )
            Q[2:0] <= 3'b000;
        else begin
            if (T[2] == 1'b1)
                 Q[2] <= ~led[2];
            if (T[1] == 1'b1)
                Q[1] <= ~led[1];
            if (T[0] == 1'b1)
                Q[0] <= ~led[0];
        end
    end
endmodule
