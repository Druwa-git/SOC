`timescale 1ns / 1ps
module s181703_gcd32(
    input  wireclk, resetn,
    input  wire [31:0] x_in, y_in,
    input  wire start,     // will start GCD calculation (pulse)
    input  wire gcd_done,
    output wire [31:0] gcd_out,
    output reg done // pulse after computation
    );
    reg [1:0] state, nstate; // 0:IDLE, 1:GO_GCD, 2:DONE
    wire clk = wireclk;
    wire reset = resetn;
    reg [31:0] x_out, y_out;
    reg [31:0] sub_out;
    always @(posedge clk) begin
        if(!reset) begin
            done <= 1'b0;
            sub_out <= 32'b0;
        end
        if(!reset || gcd_done) begin
            state <= 2'b00;
        end
        else begin
            state <= nstate;
        end
    end
    
    always @(*) begin
        if(state == 2'b00 && start) begin
            nstate <= 2'b01;
        end
        else if( state == 1 && x_out == y_out) begin
            nstate <= 2'b10;
            done <= 1'b1;
            sub_out <= x_out;
        end
        else begin
            nstate <= state;
            done <= 1'b0;
        end
    end
    
    always @(posedge clk) begin
        if(state == 2'b00) begin
            x_out <= x_in;
            y_out <= y_in;
        end
        /*if(state == 2'b10) begin
            done <= 1'b1;
        end*/
        else if (state == 2'b01 && x_out < y_out) begin
            y_out <= y_out - x_out;
        end
        else if (state == 2'b01 && x_out > y_out) begin
            x_out <= x_out - y_out;
        end
    end
    assign gcd_out = (state == 2'b10) ? x_out : sub_out;
    /*always @(posedge clk) begin
        if ( reset == 0 ) begin
            x_out <= x_in;
            y_out <= y_in;
            done <= 1'b0;
        end
        if(x_in == y_in)
            done <= 1'b1;
        else begin
            if ( x_out < y_out)
                y_out <= (y_out - x_out);
            else
                x_out <= (x_out - y_out);
       end
       if(done == 1) begin
           done <= 1'b0;
           gcd_out <= x_in;
       end
    end*/
endmodule
