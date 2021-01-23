`timescale 1ns / 1ps
module D_FF(
    input D, reset, clk,
    output reg Q
    );
    always @(posedge clk)
    begin
    if (reset == 1'b1)
        Q <= 1'b0;
    else
        Q <= D;
    end
endmodule

`timescale 1ns / 1ps
module T_FF (
    input T, reset, clk,
    output Q
    );
    wire D_in = T ^ Q;
    D_FF DFFforT ( 
    // .called(caller)
       .clk (clk), .reset (reset),
       .D (D_in), .Q (Q)
    );
endmodule

`timescale 1ns / 1ps
module T_gen (
    input in, reset, clk,
    output out
    );
    wire inC, inD;
    assign out = inC & (~inD);
    D_FF DFF1 (
        .D (in), .Q (inC),
        .reset (reset), .clk (clk)
    );
    D_FF DFF2 (
        .D (inC), .Q (inD),
        .reset (reset), .clk (clk)
    );
endmodule

`timescale 1ns / 1ps
module TFF_3bits (
    input sysclk, // Zybo-Z7 (clk if Zybo)
    input [3:0] btn,
    output [3:0] led
    );
    wire [2:0] T;
    T_gen TIN2 ( // .called(caller)
       .in (btn[2]), .out (T[2]),
       .clk (sysclk), .reset (btn[3])
    );
    T_gen TIN1 (
        .in (btn[1]), .out (T[1]),
        .clk (sysclk), .reset (btn[3])
    );
    T_gen TIN0 (
        .in (btn[0]), .out (T[0]),
        .clk (sysclk), .reset (btn[3])
    );
    T_FF TFF2 (
        .T (T[2]), .Q (led[2]),
        .clk (sysclk), .reset (btn[3])
    );
    T_FF TFF1 (
        .T (T[1]), .Q (led[1]),
        .clk (sysclk), .reset (btn[3])
    );
    T_FF TFF0 (
        .T (T[0]), .Q (led[0]),
        .clk (sysclk), .reset (btn[3])
    );
    D_FF Delay_Reset (
        .D (btn[3]), .Q (led[3]),
        .clk (sysclk), .reset (1'b0) // make reset 0
    ); // to obtain the same result as the
endmodule // behavioral design
