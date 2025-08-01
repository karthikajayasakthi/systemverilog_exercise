// Code your design here
module encoder8to3(input logic[7:0]din,output logic[2:0]dout);
always_comb begin
  case(din)
8'b00000001: dout=3'b000;
8'b00000010: dout=3'b001;
8'b00000100: dout=3'b010;
8'b00001000: dout=3'b011;
8'b00010000: dout=3'b100;
8'b00100000: dout=3'b101;
8'b01000000: dout=3'b110;
8'b10000000: dout=3'b111;
  endcase
end 
endmodule

module tb_encoder8to3;

    logic [7:0] din;
    logic [2:0] dout;

    // Instantiate the encoder
    encoder8to3 dut (
        .din(din),
        .dout(dout)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;

        $display("8-to-3 Encoder Truth Table");
        $display("+------------+--------+");
        $display("|    din     | dout   |");
        $display("+------------+--------+");

        // Only one-hot inputs are valid
        for (int i = 0; i < 8; i++) begin
            din = 8'b00000001 << i;
            #10;
            $display("| %08b |  %03b   |", din, dout);
        end

        $display("+------------+--------+");
        $finish;
    end
endmodule
