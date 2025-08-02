// Code your design here
module decoder2to4(input logic[1:0]din,output logic[3:0]dout);
always_comb begin
  case(din)
  2'b00: dout=4'b0001;
  2'b01: dout=4'b0010;
  2'b10: dout=4'b0100;
  2'b11: dout=4'b1000;
  endcase
end
endmodule

// Code your testbench here
// or browse Examples
module tb;
    logic [1:0] din;    
    logic [3:0] dout;    
    decoder2to4 dut (.din(din), .dout(dout));
    initial begin
        $dumpfile("dump.vcd");$dumpvars;
        $display("| din | dout |");
        $display("----------------");
    for (int i = 0; i < 4; i++) begin
            din = i[1:0];
            #20;
            $display("| %02b  | %04b |", din, dout);
        end

        $display("----------------");
        $finish;
    end
endmodule
