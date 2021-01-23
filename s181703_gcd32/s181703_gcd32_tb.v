`timescale 1ns / 1ps
module s181703_gcd32_tb();
    reg clk, s181703fr_en, reset, resetd, start, flag;
    integer fp_in, fp_out, indata_gcd, eof_flag;
    reg [31:0] x_in, y_in;
    wire [31:0] gcd_out;
    reg gcd_done;
    wire done;
    initial begin
        clk <= 1'b1;
        reset <= 1'b1;
        gcd_done <= 1'b0;
        s181703fr_en <= 1'b0;
        flag <=  1'b0;
        x_in = 32'b0;
        y_in = 32'b0;
        fp_in = $fopen("C:\\WORK\\gcd_in.txt", "r");
        fp_out = $fopen("C:\\WORK\\gcd_out.txt", "w");
        eof_flag = 0;
    end
    initial begin
        reset <= 1'b1;
        #10
        reset <= 1'b0;
        #20
        reset <= 1'b1;
    end
    s181703_gcd32 UUT (
        .wireclk (clk), .x_in (x_in), .y_in (y_in), .gcd_out (gcd_out),
        .resetn(reset), .start(start), .done(done), .gcd_done(gcd_done)
    );
    always @(posedge clk) begin
        resetd <= reset;
        if (reset && !resetd) begin
            s181703fr_en <= 1'b1;
        end
        if (!reset) begin
            start <= 1'b0;
        end
    end
    always @(posedge clk) begin
        if(flag) begin
            start <= 1'b0;
        end
        if(s181703fr_en == 1 && !flag) begin
            eof_flag = $fscanf(fp_in, "%d %d %d\n", x_in, y_in, indata_gcd);
            if ( eof_flag == -1) begin
                $fclose(fp_in);
                $fclose(fp_out);
                $display( "End of Simulation");
                $stop;
            end
            start <= 1'b1;
            flag <= 1'b1;
        end
        if(gcd_done) begin
            gcd_done <= 1'b0;
        end
        if(done && !gcd_done) begin
            $fdisplay(fp_out,"%d %d %d", x_in, y_in, gcd_out);
            gcd_done <= 1'b1;
            flag <= 1'b0;
        end
    end
/*    always @(posedge clk) begin
    if ( s181703eof == -1 && s181703fr_en == 1'b0 )
        eof_flag <= 1'b1;
    end
    always @(posedge clk) begin
        $fdisplay(fp_out,"%d %d %d", x_in, y_in, gcd_out);
        if( eof_flag == 1'b1) begin
            $fclose (fp_out);
            $display( "End of Simulation");
            $stop;
        end
    end*/
    always begin
            #10
            clk <= ~clk;
    end
endmodule
