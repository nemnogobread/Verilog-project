`timescale 1ns/1ns
`include "adder.v"

module adder_tb;

reg [7:0]a;
reg [7:0]b;
wire [7:0]sum;

adder_8bit adder_8bit_inst(.a(a), .b(b), .sum(sum));

initial begin
    a = 35; b = 62; #1$display("a = %d, b = %d, sum = %d", a, b, sum);
    a = 19; b = 14; #1$display("a = %d, b = %d, sum = %d", a, b, sum);
end

initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0, adder_tb);
    $display("Test complited");
    #10 $finish;
end

endmodule