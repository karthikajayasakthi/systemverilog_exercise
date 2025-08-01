// Code your design here
module encoder16to4 (
  input  logic [15:0] din,
  output logic [3:0] dout
);
    always_comb begin
        case (din)
    16'b0000000000000001 : dout=4'd0;
    16'b0000000000000010 : dout=4'd1;
    16'b0000000000000100 : dout=4'd2;
    16'b0000000000001000 : dout=4'd3;
    16'b0000000000010000 : dout=4'd4;
    16'b0000000000100000 : dout=4'd5;
    16'b0000000001000000 : dout=4'd6;
    16'b0000000010000000 : dout=4'd7;
    16'b0000000100000000 : dout=4'd8;
    16'b0000001000000000 : dout=4'd9;
    16'b0000010000000000 : dout=4'd10;
    16'b0000100000000000 : dout=4'd11;
    16'b0001000000000000 : dout=4'd12;
    16'b0010000000000000 : dout=4'd13;
    16'b0100000000000000 : dout=4'd14;
    16'b1000000000000000 : dout=4'd15;
    default :dout=4'd0;
endcase
    end
endmodule


// Code your testbench here
// or browse Example`timescale 1ns/1ps
   module testbench;
    logic [15:0] din;
    logic [3:0] dout;
    encoder16to4 uut (
   .din(din),
        .dout(dout)
    );

    initial begin
        $dumpfile("dump.vcd");$dumpvars;
        $display("|        Input         | Output |");
         for (int i = 0; i < 16; i++) begin
            din = 16'b1 << i;
            #5;
            $display("| %016b |  %04b  |", din, dout);
        end
       $finish();
    end
endmodule
