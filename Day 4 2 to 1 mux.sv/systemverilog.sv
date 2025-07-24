module mux_2to1 (
    input  logic sel,
    input  logic a,
    input  logic b,
    output logic y
);
    always_comb begin
        case (sel)
            1'b0: y = a;
            1'b1: y = b;
        endcase
    end
endmodule


// Code your testbench here
// or browse Examples
module tb_mux_2to1;
    logic sel;
    logic a, b;
    logic y;

    // Instantiate the DUT
    mux_2to1 uut (
        .sel(sel),
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
      $dumpfile("dump.vcd");$dumpvars;
      

        // Test case 1
        a = 0; b = 1; sel = 0;
        #10;
        $display("sel=%b, a=%b, b=%b => y=%b", sel, a, b, y);

        // Test case 2
        sel = 1;
        #10;
        $display("sel=%b, a=%b, b=%b => y=%b", sel, a, b, y);

        $finish;
    end
endmodule
