module test (
    input A, 
    output B, 
    output C
);

    assign B = ~A;
    assign C = A ^ B;
endmodule