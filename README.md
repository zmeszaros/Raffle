# Tombola Sorsoló (Raffle Draw)

Egy Delphi nyelven írt tombola/sorsolás program vizuális animációval.

## Leírás

Ez a program egy automatikus sorsjegy sorsolót valósít meg, amely 120 ember számára (személyenként 10 sorsjeggyel) végez véletlenszerű sorsolást. A program vizuális animációval jeleníti meg a kisorsolt 4 számjegyű sorsjegyszámot.

## Funkciók

- **Sorsjegy rendszer**: 120 személy, egyenként 10 sorsjegy (6-15, 16-25, ..., 1196-1205)
- **Vizuális animáció**: A sorsolás során 4 számjegy animáltan gurul, majd egyenként áll meg
- **Egyedi sorsolás**: Minden sorsjegy csak egyszer nyerhet, a program eltávolítja a kisorsolt számokat
- **Dinamikus lassulás**: Az animáció fokozatosan lassul, mielőtt megáll az eredményen

## Műszaki részletek

### Konfigurációs paraméterek

- `hatar = 120`: 120 ember vesz részt a sorsoláson
- `delta = 10`: Az animáció lassulásának mértéke milliszekundumban
- `timerTo = 200`: Az animáció maximális intervalluma
- `eltolas = 6`: A sorsjegyek kezdő számjegye (6-15, 16-25, stb.)

### Sorsolási algoritmus

1. A program inicializáláskor létrehoz egy 0-119 közötti számokból álló tömböt
2. Sorsoláskor véletlenszerűen kiválaszt egy indexet
3. Az indexhez rendelt számot megszorozza 10-zel, hozzáad egy véletlenszerű 0-9 közötti számot, majd hozzáadja az eltolás értékét (6)
4. Az eredmény egy 6-1205 közötti sorsjegyszám (pl. 736 = 73. ember, 6. sorsjegye)
5. A kisorsolt szám törlődik a tömbből, így nem kerülhet újra kisorsolásra

### Felhasználói felület

- **Képernyőméret**: 1024x768 pixel
- **Animáció**: 4 label komponens, amelyek 0-9 között változnak
- **Indítógomb**: BitButton a sorsolás elindításához
- **Háttérkép**: Egyedi tombola háttérkép (sorsolo.bmp)

## Használat

1. Indítsd el a `Sorsolas.exe` programot
2. Kattints a sorsolás gomra
3. Az animáció elindul, és 4 számjegy fog egyesével megállni
4. A végeredmény egy 4 számjegyű sorsjegyszám lesz (pl. 0736)
5. Ismételd a folyamatot a következő nyertesek sorsolásához

## Fordítás

A program Delphi környezetben fordítható:
- Projekt fájl: `Sources/Sorsolas.dpr`
- Főmodul: `Sources/Unit1.pas`
- Erőforrás fájlok: `gomb.bmp`, `sorsolo.bmp`

## Licenc

MIT License - lásd a [LICENSE](LICENSE) fájlt a részletekért.

## Szerző

zmeszaros
