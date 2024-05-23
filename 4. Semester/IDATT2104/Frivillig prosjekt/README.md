# Elementvis multiplikasjon og dot produkt

Dette prosjektet inneholder Verilog-kode for å utføre parallell vektormultiplikasjon ved hjelp av moduler for 16-bits vektorer. Koden inkluderer både designmodulene og en testbenk for å verifisere funksjonaliteten.

## Innhold

- `parallell_dot_product_d.v`: Modulen som beregner det indre produktet av to 128-bits vektorer, delt opp i 16-bits elementer. og Modulen som instansierer flere `VecMul16bit`-moduler for parallell beregning
- `parallell_dot_product_tb.v`: Testbenken for å verifisere funksjonaliteten til `VecMulParallel`-modulen.

## Kjøring av koden i EDA Playground med Icarus Verilog 12.0

Følg disse trinnene for å kjøre koden i EDA Playground:

1. **Åpne EDA Playground:**
   - Gå til [EDA Playground](https://www.edaplayground.com/).

2. **Velg SystemVerilog/Verilog som språk**
   - I panelet til venstre, under Testbench + design, velg SystemVerilog/Verilog som språk.

4. **Velg Icarus Verilog 12.0 som simulator:**
   - I panelet til venstre, under "Tools & Simulators", velg "Icarus Verilog 12.0" som simulator.

5. **Legg til Verilog-filer:**
   - Klikk på "Add Files" og legg til følgende filer:
     - parallell_dot_product_d.v
     - parallell_dot_product_tb.v

6. **Kopier innholdet fra GitHub-repoet:**
   - Kopier innholdet fra hver fil i repoet ditt til de tilsvarende filene i EDA Playground.

7. **Kjør simuleringen:**
   - Klikk på "Run" øverst til venstre i EDA Playground for å starte simuleringen.

8. **Se resultatene:**
   - Resultatene fra testbenken vil vises i utdataområdet nederst på siden. Du kan også se bølgeformene hvis du har aktivert `$dumpfile` og `$dumpvars` i testbenken.

## Eksempel på output

Når du kjører simuleringen, vil du se noe lignende følgende utdata:

Dot product result 1: <resultat1>
Dot product result 2: <resultat2>
Dot product result 3: <resultat3>
Dot product result 4: <resultat4>

## Forfatter

- [Kristoffer Thorsdal Fredriksen](https://github.com/kristofferFredriksen)
