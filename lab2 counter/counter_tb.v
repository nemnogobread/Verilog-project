`timescale 1ns/1ns
`include "counter.v"

module counter_tb();

reg clk = 1'b0; 

always begin
    #1 clk = ~clk;
end

counter counter(.clk(clk));

initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, counter_tb);
    $display("Test complited");
    #30 $finish;
end

endmodule