// Code your design here
module demux_1to2 (
    input  logic din,
    input  logic sel,
    output logic y0,
    output logic y1
);

    always_comb begin
        case (sel)
            1'b0: begin
                y0 = din;
                y1 = 0;
            end
            1'b1: begin
                y0 = 0;
                y1 = din;
            end
        endcase
    end

endmodule


// Code your testbench here
// or browse Examples

module tb_demux_1to2;
    logic din;
    logic sel;
    logic y0, y1;

    demux_1to2 uut (
        .din(din),
        .sel(sel),
        .y0(y0),
        .y1(y1)
    );
    initial begin
       $dumpfile("dump.vcd");$dumpvars;
        $display("Time | din sel | y0 y1");
        $display("-----------------------");
        din = 0; sel = 0; #10;
        $display("%4t |  %b   %b  |  %b  %b", $time, din, sel, y0, y1);

        din = 1; sel = 0; #10;
        $display("%4t |  %b   %b  |  %b  %b", $time, din, sel, y0, y1);

        din = 0; sel = 1; #10;
        $display("%4t |  %b   %b  |  %b  %b", $time, din, sel, y0, y1);

        din = 1; sel = 1; #10;
        $display("%4t |  %b   %b  |  %b  %b", $time, din, sel, y0, y1);

        $finish;
    end

endmodule
