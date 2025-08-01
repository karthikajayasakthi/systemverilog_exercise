module priorityencoder8to3 (
    input  logic [7:0] din,
    output logic [2:0] dout
);
    always_comb begin
        casez (din)
            8'b1???????: dout = 3'b000;
            8'b01??????: dout = 3'b001;
            8'b001?????: dout = 3'b010;
            8'b0001????: dout = 3'b011;
            8'b00001???: dout = 3'b100;
            8'b000001??: dout = 3'b101;
            8'b0000001?: dout = 3'b110;
            8'b00000001: dout = 3'b111;
            default    : dout = 3'bxxx;
        endcase
    end
endmodule


//testbench
module tb;
    logic [7:0] din;
    logic [2:0] dout;

    priorityencoder8to3 dut (.din(din), .dout(dout));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;

        $display("Time\tInput\t\tOutput");
        $display("------------------------------");

        for (int i = 0; i < 8; i++) begin
            din = 8'b00000001 << i;
            #10;
            $display("%0t\t%b\t%b", $time, din, dout);
        end

        // Test invalid case: multiple bits high
        din = 8'b00000111;
        #10;
        $display("%0t\t%b\t%b (Invalid)", $time, din, dout);

      $finish();
    end
endmodule

  
