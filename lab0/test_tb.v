`timescale 1ns/1ns
`include "test.v"

module test_tb;

reg A = 1;
wire B;
wire C;

test out(.A(A), .B(B), .C(C));

always begin
    #1 A = ~A;
end

initial begin
    $dumpfile("test_tb.vcd");
    $dumpvars(0, test_tb);
    $display("Test complited");
    #10 $finish;
end

endmodule