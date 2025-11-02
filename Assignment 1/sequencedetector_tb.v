`timescale 1ns/1ps
module sequencedetector_tb();

reg clk, x, reset;
wire y;

sequencedetector uut(.clk(clk), .x(x), .reset(reset), .y(y));

initial begin
    clk=0;
    forever #5 clk=~clk;
end

initial begin
    reset=1;
    x=0;
    #10;

    reset=0;
    x=0;
    #10;
    x=1;
    #10;
    x=1;
    #10;
    x=0;
    #10;
    x=1;
    #10;
    x=1;
    #10;
    x=0;
    #10;
    x=1;
    #10;
    x=0;
    #10;
    x=1;
    #10;
    x=1;
    #10;
    x=0;
    #10;
    x=1;
    #10;
    x=0;
    #10;
end
endmodule
