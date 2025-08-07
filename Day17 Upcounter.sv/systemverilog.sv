// Code your design here
module upcounter4bit(
  input logic clk,
  input logic reset,
  input logic enable,
  output logic [3:0] count);
  always_ff @(posedge clk) begin
    if(reset)
      count<=4'b0000;
    else if(enable)
      count<=count+1;
  end
endmodule
//testbench
module tb_upcounter4bit;
  logic clk;
  logic reset;
  logic enable;
  logic [3:0] count;
  upcounter4bit dut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .count(count)
  );
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    $dumpfile("upcounter4bit.vcd");
    $dumpvars(0, tb_upcounter4bit);
    reset = 1; enable = 0;
    #10;
    reset = 0; enable = 1;
    #80;
    enable = 0;
    #20;
    enable = 1;
    #40;
    reset = 1;
    #10;
    reset = 0;
    #20;

    $finish;
  end
endmodule
