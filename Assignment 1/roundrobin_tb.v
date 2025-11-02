`timescale 1ns/1ps
module roundrobin_tb;

reg clk, reset;
reg [3:0] req;
wire [3:0] gnt;

roundrobin uut(.clk(clk), .reset(reset), .req(req), .gnt(gnt));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    req = 4'b0000;
    #10 reset = 0;

    req = 4'b0001; #20;
    req = 4'b0011; #20;
    req = 4'b1111; #40;
    req = 4'b0100; #20;
    req = 4'b0000; #20;
    req = 4'b1000; #20;
    req = 4'b1100; #20;
    req = 4'b0110; #20;
    req = 4'b1010; #20;
end

endmodule
