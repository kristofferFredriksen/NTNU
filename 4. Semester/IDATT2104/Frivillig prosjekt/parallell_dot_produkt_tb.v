`timescale 1ns / 1ps

module tb_VecMulParallel;
    parameter N = 4; // Antall parallelle operasjoner
    reg clk;
    reg rst;
    reg [N*128-1:0] a; // Inngangsvektor a
    reg [N*128-1:0] b; // Inngangsvektor b
    wire [N*36-1:0] c; // Utgangsvektor c

    // Instansiering av VecMulParallel-modulen med parameter N
    VecMulParallel #(N) uut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        // Initialiser signaler
        clk = 0;
        rst = 1;
        a = {
            128'h0001_0002_0003_0004_0005_0006_0007_0008, // Vektorset 1
            128'h0009_000A_000B_000C_000D_000E_000F_0010, // Vektorset 2
            128'h0011_0012_0013_0014_0015_0016_0017_0018, // Vektorset 3
            128'h0019_001A_001B_001C_001D_001E_001F_0020  // Vektorset 4
        };
        b = {
            128'h0001_0002_0003_0004_0005_0006_0007_0008, // Vektorset 1
            128'h0009_000A_000B_000C_000D_000E_000F_0010, // Vektorset 2
            128'h0011_0012_0013_0014_0015_0016_0017_0018, // Vektorset 3
            128'h0019_001A_001B_001C_001D_001E_001F_0020  // Vektorset 4
        };

        // Tilbakestill designet
        #10 rst = 0;
        
        // Vent på at beregningen skal fullføres
        #200;
        
        // Vis resultatene
        $display("Dot product result 1: %d", c[35:0]);
        $display("Dot product result 2: %d", c[71:36]);
        $display("Dot product result 3: %d", c[107:72]);
        $display("Dot product result 4: %d", c[143:108]);
        
        // Avslutt simuleringen
        $finish;
    end

    // Genererer klokkesignal
    always #5 clk = ~clk;

    // Dump bølgeformer
    initial begin
        $dumpfile("VecMulParallel.vcd");
        $dumpvars(0, tb_VecMulParallel);
    end

endmodule
