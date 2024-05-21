`timescale 1ns/1ns
`include "fadder_4bit.v"

module fadder_tb_4bit;

reg [3:0]a;
reg [3:0]b;
wire [3:0]sum;

fadder_4bit fadder_4bit(.a(a), .b(b), .sum(sum));

initial begin
    a = 5; b = 7; #1$display("a = %d, b = %d, sum = %d", a, b, sum);
    a = 10; b = 3; #1$display("a = %d, b = %d, sum = %d", a, b, sum);
end

initial begin
    $dumpfile("fadder_4bit.vcd");
    $dumpvars(0, fadder_tb_4bit);
    $display("Test complited");
end

endmodule