`timescale 1ns/1ns
`include "adder_4bit.v"

module adder_tb_4bit;

reg [3:0]a;
reg [3:0]b;
wire [3:0]sum;

adder_4bit adder_4bit_inst(.a(a), .b(b), .sum(sum));

initial begin
    a = 7; b = 2; #1$display("a = %d, b = %d, sum = %d", a, b, sum);
    a = 10; b = 3; #1$display("a = %d, b = %d, sum = %d", a, b, sum);
end

initial begin
    $dumpfile("adder_4bit.vcd");
    $dumpvars(0, adder_tb_4bit);
    $display("Test complited");
end

endmodule