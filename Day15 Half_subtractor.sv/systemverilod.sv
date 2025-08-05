// Code your design here
module half_subtractor(input logic a, b ,output logic diff,borrow);
always_comb begin
diff=a^b;
  borrow=(~a)&b;
end
endmodule

module tb;
logic a,b;
logic diff,borrow;
  half_subtractor dut(.a(a),.b(b),.diff(diff),.borrow(borrow));
initial begin
  $dumpfile("dump.vcd");$dumpvars;
a=0;b=0;#10;
a=0;b=1;#10;
a=1;b=0;#10;
a=1;b=1;#10;
  $finish();
end
initial begin
  $monitor("Time=%0t | a=%b  b=%b | diff=%b borrow=%b",$time,a,b,diff,borrow);
  end
endmodule
