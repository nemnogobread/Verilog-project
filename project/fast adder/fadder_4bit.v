module adder(
    input a,
    input b,
    input carry_in,
    output sum
);

assign sum = (a ^ b) ^ carry_in;

endmodule

module fast_shift (
    input [3:0]a,
    input [3:0]b,
    output [4:0]c,
    input cin
);

wire p0, g0, p1, g1, p2, g2, p3, g3;

assign	p0 = a[0] ^ b[0],
	    p1 = a[1] ^ b[1],
	    p2 = a[2] ^ b[2],
    	p3 = a[3] ^ b[3];

assign	g0 = a[0] & b[0],
	    g1 = a[1] & b[1],
	    g2 = a[2] & b[2],
	    g3 = a[3] & b[3];

assign  c[0] = cin,
        c[1] = g0 | (p0 & cin),
    	c[2] = g1 | (p1 & g0) | (p1 & p0 & cin),
    	c[3] = g2 | (p2 & g1) | (p2 & p1 & p0 & cin),
    	c[4] = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & cin);

endmodule

module fadder_4bit (
    input [3:0]a,
    input [3:0]b,
    output [3:0]sum,
    output [4:0]carry_in
);

fast_shift fast_shift(.a(a), .b(b), .c(carry_in), .cin(1'b0));

adder adder0(.a(a[0]), .b(b[0]), .sum(sum[0]), .carry_in(carry_in[0]));
adder adder1(.a(a[1]), .b(b[1]), .sum(sum[1]), .carry_in(carry_in[1]));
adder adder2(.a(a[2]), .b(b[2]), .sum(sum[2]), .carry_in(carry_in[2]));
adder adder3(.a(a[3]), .b(b[3]), .sum(sum[3]), .carry_in(carry_in[3]));

endmodule