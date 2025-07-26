// Code your design here
module mux4to1 (
    input  logic [1:0] sel,      // 2-bit selector
    input  logic [3:0] data_in,  // 4 input lines
    output logic       y         // Output
);
    always_comb begin
        case (sel)
            2'b00: y = data_in[0];
            2'b01: y = data_in[1];
            2'b10: y = data_in[2];
            2'b11: y = data_in[3];
            default: y = 1'b0;
        endcase
    end
endmodule

// Code your testbench here
// or browse Examples
module tb_mux4to1;

    logic [1:0] sel;
    logic [3:0] data_in;
    logic       y;

    // Instantiate the design
    mux4to1 uut (
        .sel(sel),
        .data_in(data_in),
        .y(y)
    );

    initial begin
 
       $dumpfile("dump.vcd");$dumpvars; 
        $display("Time\tSel\tData\tOutput");
        $monitor("%0t\t%b\t%b\t%b", $time, sel, data_in, y);

        // Test case 1
        sel = 2'b00; data_in = 4'b0001; #10;
        // Test case 2
        sel = 2'b01; data_in = 4'b0010; #10;
        // Test case 3
        sel = 2'b10; data_in = 4'b0100; #10;
        // Test case 4
        sel = 2'b11; data_in = 4'b1000; #10;
        // Additional test case
        sel = 2'b10; data_in = 4'b1111; #10;

      $finish();
    end

endmodule
