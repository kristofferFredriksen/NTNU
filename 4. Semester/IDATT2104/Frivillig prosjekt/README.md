# VecMulParallel Project

Dette prosjektet inneholder Verilog-kode for å utføre parallell vektormultiplikasjon ved hjelp av moduler for 16-bits vektorer. Koden inkluderer både designmodulene og en testbenk for å verifisere funksjonaliteten.

## Innhold

- `VecMul16bit.v`: Modulen som beregner det indre produktet av to 128-bits vektorer, delt opp i 16-bits elementer.
- `VecMulParallel.v`: Modulen som instansierer flere `VecMul16bit`-moduler for parallell beregning.
- `tb_VecMulParallel.v`: Testbenken for å verifisere funksjonaliteten til `VecMulParallel`-modulen.

## Kjøring av koden i EDA Playground med Icarus Verilog 12.0

Følg disse trinnene for å kjøre koden i EDA Playground:

1. **Åpne EDA Playground:**
   - Gå til [EDA Playground](https://www.edaplayground.com/).

2. **Velg Icarus Verilog 12.0 som simulator:**
   - I panelet til høyre, under "Tools & Simulators", velg "Icarus Verilog 12.0" som simulator.

3. **Legg til Verilog-filer:**
   - Klikk på "Add Files" og legg til følgende filer:
     - `VecMul16bit.v`
     - `VecMulParallel.v`
     - `tb_VecMulParallel.v`

4. **Kopier innholdet fra GitHub-repoet:**
   - Kopier innholdet fra hver fil i repoet ditt til de tilsvarende filene i EDA Playground.

5. **Konfigurer kjøreskript:**
   - Under "Run" i panelet til høyre, sørg for at simuleringskommandoen ser slik ut:
     ```
     iverilog -o a.out tb_VecMulParallel.v VecMulParallel.v VecMul16bit.v
     vvp a.out
     ```

6. **Kjør simuleringen:**
   - Klikk på "Run" øverst til venstre i EDA Playground for å starte simuleringen.

7. **Se resultatene:**
   - Resultatene fra testbenken vil vises i utdataområdet nederst på siden. Du kan også se bølgeformene hvis du har aktivert `$dumpfile` og `$dumpvars` i testbenken.

## Eksempel på output

Når du kjører simuleringen, vil du se noe lignende følgende utdata:

Dot product result 1: <resultat1>
Dot product result 2: <resultat2>
Dot product result 3: <resultat3>
Dot product result 4: <resultat4>

## Forfatter

- [Kristoffer Thorsdal Fredriksen](https://github.com/kristofferFredriksen)
