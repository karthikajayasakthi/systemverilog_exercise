// Code your design here
module mux8to1(
    input  logic [7:0] din,
    input  logic [2:0] sel,
    output logic       y
);
    always_comb begin
        case (sel)
            3'b000: y = din[0];
            3'b001: y = din[1];
            3'b010: y = din[2];
            3'b011: y = din[3];
            3'b100: y = din[4];
            3'b101: y = din[5];
            3'b110: y = din[6];
            3'b111: y = din[7];
            default: y = 1'b0; // fixed syntax here
        endcase
    end
endmodule

// Code your testbench here
// or browse Examples
module tb_mux8to1;
    logic [7:0] din;
    logic [2:0] sel;
    logic       y;
    mux8to1 uut (
        .din(din),
        .sel(sel),
        .y(y)
    );
    initial begin
        $dumpfile("mux8to1_tb.vcd");  
        $dumpvars(0, tb_mux8to1);
        din = 8'b0110_0011;
        for (int i = 0; i < 8; i++) begin
            sel = i;
            #5;
            $display("Time=%0t | sel=%0d | y=%b | expected=%b", 
                     $time, sel, y, din[i]);
        end

      $finish();
    end

endmodule
