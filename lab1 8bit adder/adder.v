module adder(
    input a,
    input b,
    input carry_in,
    output sum,
    output carry_out
);

assign sum = (a ^ b) ^ carry_in;
assign carry_out = (a & b) | ((a ^ b) & carry_in);

endmodule

module adder_8bit (
    input [7:0]a,
    input [7:0]b,
    output [7:0]sum
);

adder adder0(.a(a[0]), .b(b[0]), .sum(sum[0]), .carry_in(1'b0), .carry_out(c0));
adder adder1(.a(a[1]), .b(b[1]), .sum(sum[1]), .carry_in(c0), .carry_out(c1));
adder adder2(.a(a[2]), .b(b[2]), .sum(sum[2]), .carry_in(c1), .carry_out(c2));
adder adder3(.a(a[3]), .b(b[3]), .sum(sum[3]), .carry_in(c2), .carry_out(c3));
adder adder4(.a(a[4]), .b(b[4]), .sum(sum[4]), .carry_in(c3), .carry_out(c4));
adder adder5(.a(a[5]), .b(b[5]), .sum(sum[5]), .carry_in(c4), .carry_out(c5));
adder adder6(.a(a[6]), .b(b[6]), .sum(sum[6]), .carry_in(c5), .carry_out(c6));
adder adder7(.a(a[7]), .b(b[7]), .sum(sum[7]), .carry_in(c6));
    
endmodule