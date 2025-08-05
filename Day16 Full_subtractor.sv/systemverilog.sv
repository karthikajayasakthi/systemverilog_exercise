module full_subtractor(input logic a,b,c ,
output logic diff,borrow);
always_comb begin
diff=a^b^c;
  borrow=(~a&b) |(~(a^b) &c);
end
endmodule

// Code your testbench here
// or browse Examples
module tb;
logic a,b,c;
logic diff,borrow;
  full_subtractor dut(.a(a),.b(b),.c(c),.diff(diff),.borrow(borrow));
initial begin
  $dumpfile("dump.vcd");$dumpvars; $display("Time\tA\tB\tBin\tDiff\tBout");
        $display("-------------------------------------");



  for(int i=0;i<8;i=i+1) begin
    {a,b,c}=i[2:0];
#10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b",$time,a,b,c,diff,borrow);
  end
  $finish();
end
endmodule

