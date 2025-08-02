// Code your design here
module decoder3to8(input logic[2:0]din,output logic[7:0]dout);
always_comb begin
  case(din)
3'b000 :dout=8'b00000001;
3'b001 :dout=8'b00000010;
3'b010 :dout=8'b00000100;
3'b011 :dout=8'b00001000;
3'b100 :dout=8'b00010000;
3'b101 :dout=8'b00100000;
3'b110 :dout=8'b01000000;
3'b111 :dout=8'b10000000;
default : dout=8'b00000000;
  endcase
end
endmodule

// Code your testbench here
// or browse Examples
module tb;
  logic [2:0]din;
  logic [7:0]dout;
  decoder3to8 dut(.din(din),.dout(dout));
initial begin
$dumpfile("dump.vcd");$dumpvars;
  $display("| din  | dout |");
  for(int i=0;i<8;i++) begin
    din=i[2:0];
    #10
    $display("| %03b  | %08b |", din,dout);
  end
  $finish();
end
endmodule
