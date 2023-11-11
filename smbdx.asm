.memorymap
    slotsize $4000
    defaultslot 1
    slot 0 $0000
    slot 1 $4000

;    slotsize $1000
;    slot 2 $C000
;    slot 3 $D000
.endme

.rombanksize $4000
.rombanks $40

.include "asm/RAMDefines.asm"

.gbheader
    nintendologo
    name "MARIO DELUXAHYE"
    romgbconly
    licenseecodenew "01"
    cartridgetype $1B       ; MBC5+RAM+battery
    romsize                 ; 05: 1 MiB -> $40 banks
    ramsize $02             ; 02: 8 KiB -> 1 bank
    destinationcode $01     ; non-Japanese
    version $01
.endgb

.include "asm/Bank00.asm"
.include "asm/Bank02.asm"
.include "asm/Bank03.asm"
.include "asm/Bank04.asm"
.include "asm/Bank06.asm"
.include "asm/Bank07.asm"
.include "asm/Bank08.asm"
.include "asm/Bank09.asm"
.include "asm/Bank0A.asm"
.include "asm/Bank0B.asm"
.include "asm/Bank11.asm"
.include "asm/Bank13.asm"
.include "asm/Bank14.asm"
.include "asm/Bank15.asm"
.include "asm/Bank1D.asm"
.include "asm/Bank1F.asm"
.include "asm/GraphicsBanks.asm"
.include "asm/LevelData.asm"
