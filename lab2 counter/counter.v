module counter(
    input clk
);

reg [3:0]count = 0;

always @(posedge clk) begin
    if (count == 9)
        count <= 0;
    else
        count <= count + 1;
end
    
endmodule