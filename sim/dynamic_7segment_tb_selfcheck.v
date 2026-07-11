`timescale 1ns/1ps
module dynamic_7segment_tb_selfcheck;
    reg clk = 1'b0;
    reg rst_n = 1'b0;
    reg en = 1'b1;
    wire [7:0] seg_data;
    wire [2:0] sel;

    dymc_seg dut (.clk(clk), .rst_n(rst_n), .en(en), .seg_data(seg_data), .sel(sel));
    always #15 clk = ~clk;

    initial begin
        #90 rst_n = 1'b1;
        repeat (600) @(posedge clk);
        if ((^seg_data === 1'bx) || (^sel === 1'bx)) $fatal(1, "display outputs contain X");
        if (sel == 3'b111) $fatal(1, "no digit is selected");
        $display("PASS: dynamic seven-segment scan is active");
        $finish;
    end
endmodule
