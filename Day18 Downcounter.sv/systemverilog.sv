// Code your design here
module downcounter4bit(
  input  logic clk,
  input  logic reset,
  input  logic enable,
  output logic [3:0] count= 4'b0000
);

  always_ff @(posedge clk) begin
    if (reset)
      count <= 4'b1111; 
    else if (enable)
      count <= count - 1;
  end

endmodule

// Code your testbench here
// or browse Examples
module tb_downcounter;
  logic clk;
  logic reset;
  logic enable;
  logic [3:0] count;
  downcounter4bit uut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .count(count)
  );
  always #5 clk = ~clk;
  initial begin
    $dumpfile("downcounter.vcd");
    $dumpvars(0, tb_downcounter);
    clk = 0;
    reset = 1;
    enable = 0;
    #10 reset = 0; enable = 1;
    #100;
    enable = 0;
    #20 $finish;
  end
endmodule
