module VecMul16bit (a, b, c, clk, rst);
// To vektorers indre produkt, hver har 8 elementer
// Hvert element er 16 bits
// Utgangen må være minst 2^32 * 2^3 = 2^35 for å forhindre overflow 
// Utgangen er 35 bits
input clk;
input rst;
input [127:0] a, b; // 128-bits inngangsvektorer (8 elementer à 16 bits)
output [35:0] c; // 36-bits utgangsvektor (indre produkt)
reg [15:0] a_cp [0:7]; // Midlertidig array for elementene i vektor a
reg [15:0] b_cp [0:7]; // Midlertidig array for elementene i vektor b
reg [35:0] c_reg; // Register for å holde resultatet av indre produkt
reg [2:0] k; // Teller som bare trenger 3 bits siden den teller fra 0 til 7
reg c_done; // Indikator for når beregningen er ferdig

integer i;
// Alltid-blokk for å dele opp vektor a i 8 elementer med 16 bits
always @ (a) begin
    for (i = 0; i <= 7; i = i + 1) begin
        a_cp[i] = a[i*16+:16]; // Korrigert slicing
    end
end

// Alltid-blokk for å dele opp vektor b i 8 elementer med 16 bits
always @ (b) begin 
    for (i = 0; i <= 7; i = i + 1) begin
        b_cp[i] = b[i*16+:16]; // Korrigert slicing
    end
end 

assign c = c_reg; // Tildeler resultatregisteret til utgangen

// Alltid-blokk som utføres ved positiv klokke- eller resetkant
always @(posedge clk or posedge rst) begin
    if (rst) begin
        c_reg <= 0; // Nullstill resultatregisteret ved reset
        k <= 0; // Nullstill telleren ved reset
        c_done <= 0; // Nullstill ferdig-indikatoren ved reset
    end else begin
        if (!c_done) begin
          c_reg <= c_reg + a_cp[k] * b_cp[k]; // Beregn og akkumuler produktene av elementene
            k <= k + 1; // Øk telleren
            if (k == 7) begin
                c_done <= 1; // Sett ferdig-indikatoren når alle elementene er behandlet
            end
        end
    end
end

endmodule

module VecMulParallel #(parameter N) (
    input clk,
    input rst,
  input [N*128-1:0] a, // N vektorer på 128 bits hver
  input [N*128-1:0] b, // N vektorer på 128 bits hver
  output [N*36-1:0] c // N resultater på 36 bits hver
);
    // Generer N instanser av VecMul16bit
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : vecmul_instances
            VecMul16bit vecmul (
                .clk(clk),
                .rst(rst),
                .a(a[i*128 +: 128]), // Del av vektor a for hver instans
                .b(b[i*128 +: 128]), // Del av vektor b for hver instans
                .c(c[i*36 +: 36]) // Del av utgangsvektor c for hver instans
            );
        end
    endgenerate
endmodule
