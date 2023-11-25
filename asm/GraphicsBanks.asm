.bank $01 slot 1

.orga $4000
Gr_NormalGameplay:                  ; 01:4000
.incbin "data/Graphics/NormalGameplay.bin"
Gr_PlayerSuper:                     ; 01:7000
.incbin "data/Graphics/PlayerSuper.bin"
Gr_PlayerSmall:                     ; 01:7C00
.incbin "data/Graphics/PlayerSmall.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $0E slot 1

.orga $4000
Gr_OW_ChalMenu:                     ; 0E:4000
.incbin "data/Graphics/Overworld_ChalMenu.bin"
Ti_ChalMenu:                        ; 0E:5800
.incbin "data/Tilemaps/ChalMenu.bin"
Pal_ChalMenu:                       ; 0E:5AD0
.dw $7FFF,$7E6F,$7D2D,$0000,$7FFF,$3F8B,$2682,$0000,\
    $0000,$0000,$0000,$0000,$7FFF,$7D2D,$0D16,$0000,\
    $7FFF,$22FF,$0200,$0000,$7FFF,$22FF,$7D2D,$0000,\
    $7FFF,$22FF,$001F,$0000,$7FFF,$034B,$0200,$0000,\
    $7DE0,$7FFF,$3A94,$0000,$7DE0,$7FFF,$001F,$0000,\
    $7DE0,$7FFF,$7D2D,$0000,$7DE0,$025F,$001F,$0000,\
    $7DE0,$3E9C,$08CB,$001D,$7DE0,$7FFF,$02A6,$001D,\
    $7DE0,$7FFF,$02BC,$0019,$7DE0,$7FFF,$02A6,$0120
Ti_Overworlds:                      ; 0E:5B50
.incbin "data/Tilemaps/Overworld_W1.bin"
.incbin "data/Tilemaps/Overworld_W2.bin"
.incbin "data/Tilemaps/Overworld_W3.bin"
.incbin "data/Tilemaps/Overworld_W4.bin"
.incbin "data/Tilemaps/Overworld_W5.bin"
.incbin "data/Tilemaps/Overworld_W6.bin"
.incbin "data/Tilemaps/Overworld_W7.bin"
.incbin "data/Tilemaps/Overworld_W8.bin"
Ti_Data0E71D0:                      ; 0E:71D0
.incbin "data/Tilemaps/Data0E71D0.bin"
Ti_Data0E74A0:                      ; 0E:74A0
.incbin "data/Tilemaps/Data0E74A0.bin"
Ti_Data0E7770:                      ; 0E:7770
.incbin "data/Tilemaps/Data0E7770.bin"
Ti_Data0E7A40:                      ; 0E:7A40
.incbin "data/Tilemaps/Data0E7A40.bin"
Ti_Data0E7D10:                      ; 0E:7D10
.incbin "data/Tilemaps/Data0E7D10.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $0F slot 1

.orga $4000
Gr_FaceSolidSpikedAnim:             ; 0F:4000
.incbin "data/Graphics/FaceSolidSpikedAnim.bin"
.incbin "data/Graphics/Unused0F4600.bin"
Gr_321BlockAnim:                    ; 0F:4800
.incbin "data/Graphics/321BlockAnim.bin"
Gr_RedCoinAnim:                     ; 0F:4B00
.incbin "data/Graphics/RedCoinAnim.bin"
Gr_WaterLavaAnim:                   ; 0F:4C00
.incbin "data/Graphics/WaterLavaAnim.bin"
Gr_UnderwaterAnim:                  ; 0F:4C40
.incbin "data/Graphics/UnderwaterAnim.bin"
.incbin "data/Graphics/Unused0F4C80.bin"
Gr_FaceSolidDottedAnim:             ; 0F:5000
.incbin "data/Graphics/FaceSolidDottedAnim.bin"
.incbin "data/Graphics/Unused0F4600.bin"
Ti_PauseMenu0:                      ; 0F:5800
.incbin "data/Tilemaps/PauseMenu0.bin"
Ti_PauseMenuRace:                   ; 0F:5AD0
.incbin "data/Tilemaps/PauseMenuRace.bin"
Gr_SPTitle:                         ; 0F:5DA0
.incbin "data/Graphics/SPTitle.bin"
Ti_Data0F6DA0:                      ; 0F:6DA0
.incbin "data/Tilemaps/Data0F6DA0.bin"
; ??? at 0F:7070-7B12

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $16 slot 1

.orga $4000
Gr_RaceMarioWon:                    ; 16:4000
.incbin "data/Graphics/RaceMarioWon.bin"
Gr_RaceLuigiWon:                    ; 16:5000
.incbin "data/Graphics/RaceLuigiWon.bin"
Gr_RaceMarioLost:                   ; 16:6000
.incbin "data/Graphics/RaceMarioLost.bin"
Gr_RaceLuigiLost:                   ; 16:7000
.incbin "data/Graphics/RaceLuigiLost.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $17 slot 1

.orga $4000
Gr_YouVsBooMenu:                    ; 17:4000
.incbin "data/Graphics/YouVsBooMenu.bin"
Gr_RaceDraw:                        ; 17:5000
.incbin "data/Graphics/RaceDraw.bin"
Data176000:                         ; 17:6000

.orga $7200
Data177200:                         ; 17:7200

.orga $7400
Data177400:                         ; 17:7400

.orga $7500
Data177500:                         ; 17:7500

.orga $7600
Data177600:                         ; 17:7600

.orga $7900
Data177900:                         ; 17:7900

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $18 slot 1

.orga $4000
Gr_TitleScreen:                     ; 18:4000
.incbin "data/Graphics/TitleScreen.bin"
Ti_TitleScreen_Tiles:               ; 18:7000
.incbin "data/Tilemaps/TitleScreen_Tiles.bin"
Ti_TitleScreen_Attr:                ; 18:7240
.incbin "data/Tilemaps/TitleScreen_Attr.bin"
Ti_PreTitle:                        ; 18:7480
.incbin "data/Tilemaps/PreTitle.bin"
Pal_TitleScreen:                    ; 18:7750
.dw $20C6,$7E6C,$56B3,$7FFD,$20C6,$0240,$0160,$7FFD,\
    $20C6,$013D,$0097,$7FFD,$20C6,$0058,$0011,$7FFD,\
    $20C6,$7545,$5CA0,$7FFD,$20C6,$02B5,$01EF,$7FFD,\
    $6965,$7E6C,$7F73,$7FFD,$7E6C,$03BF,$0255,$090B,\
    $20C6,$7E6C,$56B3,$7FFD,$20C6,$2348,$1A26,$7FFD,\
    $20C6,$223F,$195D,$7FFD,$20C6,$215F,$18D7,$7FFD,\
    $20C6,$7E4D,$7566,$7FFD,$20C6,$23BD,$1AB5,$7FFD,\
    $6965,$7E6C,$7F73,$7FFD,$7E6C,$03BF,$0255,$090B,\
    $20C6,$7E6C,$56B3,$7FFD,$20C6,$43F0,$32EC,$7FFD,\
    $20C6,$433F,$321F,$7FFD,$20C6,$425F,$319D,$7FFD,\
    $20C6,$7F55,$7E2C,$7FFD,$20C6,$43FF,$337B,$7FFD,\
    $6965,$7E6C,$7F73,$7FFD,$7E6C,$03BF,$0255,$090B,\
    $20C6,$7E6C,$56B3,$7FFD,$20C6,$63F8,$4BB2,$7FFD,\
    $20C6,$63FF,$4ADF,$7FFD,$20C6,$635F,$4A5F,$7FFD,\
    $20C6,$7FFD,$7EF2,$7FFD,$20C6,$63FF,$4BFF,$7FFD,\
    $6965,$7E6C,$7F73,$7FFD,$7E6C,$03BF,$0255,$090B
Pal_PreTitle:                       ; 18:7850
.dw $07FF,$01FF,$0014,$0000,$07FF,$013B,$0014,$0000,\
    $07FF,$01FF,$0014,$0000,$07FF,$01FF,$0014,$0000,\
    $07FF,$01FF,$0014,$0000,$07FF,$01FF,$0014,$0000,\
    $07FF,$01FF,$0014,$0000,$73FF,$01FF,$0014,$0000
Ti_Data187890:                      ; 18:7890
.incbin "data/Tilemaps/Data187890.bin"
Ti_Data187B60:                      ; 18:7B60
.incbin "data/Tilemaps/Data187B60.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $19 slot 1

.orga $4000
Gr_MainMenu_FileSelect:             ; 19:4000
.incbin "data/Graphics/MainMenu_FileSelect.bin"
Ti_MainMenu:                        ; 19:7000
.incbin "data/Tilemaps/MainMenu.bin"
Ti_FileSelect:                      ; 19:72D0
.incbin "data/Tilemaps/FileSelect.bin"
Pal_MainMenu:                       ; 19:75A0
.dw $7E6C,$7FFF,$6965,$0000,$7FFF,$3ABF,$02E0,$0000,\
    $7ECF,$7FFF,$0015,$0000,$03FF,$7FFF,$02C6,$0180,\
    $03FF,$0B12,$7FFF,$0180,$03FF,$0B12,$02C6,$0180,\
    $7E6C,$7FFF,$6965,$019F,$7D5F,$7814,$500D,$2805,\
    $02C6,$02BF,$7FFF,$0000,$02C6,$7FFF,$0015,$0000,\
    $02C6,$02BF,$3819,$0000,$02C6,$7FFF,$56B5,$0000,\
    $02C6,$7FFF,$56B5,$0000,$02C6,$7FFF,$56B5,$0000,\
    $02C6,$7FFF,$56B5,$0000,$02C6,$7FFF,$56B5,$0000
Pal_FileSelect:                     ; 19:7620
.dw $0000,$7FFF,$7E86,$0000,$0000,$0F5F,$0133,$0000,\
    $0000,$1BEE,$0222,$0000,$0000,$4F1F,$0133,$0000,\
    $0000,$0173,$0173,$0173,$0000,$7B5F,$001F,$0000,\
    $0000,$7FFF,$7D86,$0000,$0000,$7FFF,$02BC,$0180
Ti_Data197660:                      ; 19:7660
.incbin "data/Tilemaps/Data197660.bin"
Ti_Data197930:                      ; 19:7930
.incbin "data/Tilemaps/Data197930.bin"
Ti_Data197C00:                      ; 19:7C00
.incbin "data/Tilemaps/Data197C00.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $1A slot 1

.orga $4000
Gr_ChalResults:                     ; 1A:4000
.incbin "data/Graphics/ChalResults.bin"
Ti_ChalResultsNormal:               ; 1A:7000
.incbin "data/Tilemaps/ChalResultsNormal.bin"
Ti_ChalResultsCastle:               ; 1A:72D0
.incbin "data/Tilemaps/ChalResultsCastle.bin"
Pal_ChalResultsNormal:              ; 1A:75A0
.dw $7FFF,$7E6F,$7D2D,$0000,$0000,$1D4A,$3A94,$7FFF,\
    $7E6F,$034B,$7D2D,$0000,$1D4A,$001F,$3A94,$7FFF,\
    $7FFF,$22FF,$0200,$0000,$7FFF,$22FF,$7D2D,$0000,\
    $7FFF,$22FF,$001F,$0000,$7FFF,$034B,$0200,$0000,\
    $7DE0,$7FFF,$3A94,$0000,$7DE0,$7FFF,$001F,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $7DE0,$3E9C,$08CB,$001D,$7DE0,$7FFF,$02A6,$001D,\
    $7DE0,$7FFF,$02BC,$0019,$7DE0,$7FFF,$02A6,$0120
Pal_ChalResultsCastle:              ; 1A:7620
.dw $7FFF,$7E6F,$7D2D,$0000,$0000,$310B,$55D3,$7FFF,\
    $7E6F,$034B,$7D2D,$0000,$0000,$194B,$3272,$7FFF,\
    $7FFF,$22FF,$0200,$0000,$7FFF,$22FF,$7D2D,$0000,\
    $7FFF,$22FF,$001F,$0000,$7FFF,$034B,$0200,$0000,\
    $7DE0,$7FFF,$3A94,$0000,$7DE0,$7FFF,$001F,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $7DE0,$3E9C,$08CB,$001D,$7DE0,$7FFF,$02A6,$001D,\
    $7DE0,$7FFF,$02BC,$0019,$7DE0,$7FFF,$02A6,$0120

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $1B slot 1

.orga $4000
Gr_Bank1B:                          ; 1B:4000
.incbin "data/Graphics/Data1B4000.bin"
Data1B7000:                         ; 1B:7000
.incbin "data/Tilemaps/Data1B4000.bin"
Data1B72D0:                         ; 1B:72D0
.dw $7FFF,$35AD,$0000,$7D40,$7FFF,$35AD,$0000,$001B,\
    $7FFF,$56B5,$35AD,$0000,$7FFF,$7D40,$4400,$0000,\
    $0000,$294A,$56B5,$7FFF,$0000,$294A,$56B5,$7FFF,\
    $0000,$294A,$56B5,$7FFF,$0000,$294A,$56B5,$7FFF,\
    $7FFF,$00F0,$7FFF,$7FFF,$7FFF,$35AD,$0000,$001B,\
    $7FFF,$00F0,$7FFF,$7FFF,$7FFF,$00F0,$7FFF,$7FFF,\
    $7FFF,$00F0,$7FFF,$7FFF,$7FFF,$00F0,$7FFF,$7FFF,\
    $7FFF,$00F0,$7FFF,$7FFF,$7FFF,$00F0,$7FFF,$7FFF
Data1B7350:                         ; 1B:7350
.incbin "data/Graphics/Data1B7350.bin"
Gr_NonGBCError:                     ; 1B:7750
.incbin "data/Graphics/NonGBCError.bin"
Ti_NonGBCError:                     ; 1B:7D50
.incbin "data/Tilemaps/NonGBCError.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $1C slot 1

.orga $4000
Gr_ChalMissYoshiHatch:              ; 1C:4000
.incbin "data/Graphics/ChalMissYoshiHatch.bin"
Ti_ChalMiss:                        ; 1C:7000
.incbin "data/Tilemaps/ChalMiss.bin"
Ti_ChalYoshiHatch:                  ; 1C:72D0
.incbin "data/Tilemaps/ChalYoshiHatch.bin"
Pal_ChalMiss:                       ; 1C:75A0
.dw $0000,$03FF,$023F,$0159,$7FFF,$7F79,$001F,$0000,\
    $3F1F,$7F79,$2A3C,$0000,$3F1F,$6C16,$00ED,$0000,\
    $3F1F,$00ED,$2A3C,$0000,$3F1F,$6C16,$7FFF,$0000,\
    $03FF,$7FFF,$7F79,$0000,$03FF,$00ED,$2A3C,$0000
Pal_ChalYoshiHatch:                 ; 1C:75E0
.dw $7FFF,$0329,$0013,$0000,$7FFF,$0329,$01C7,$0000,\
    $7FFF,$0329,$0113,$0000,$7FFF,$165E,$0113,$0000,\
    $7FFF,$0329,$7716,$0000,$7FFF,$031E,$15DE,$0000,\
    $7FFF,$7FFF,$7FFF,$0000,$7FFF,$7FFF,$7FFF,$0000
Gr_Data1C7620:                      ; 1C:7620
.incbin "data/Graphics/Data1C7620.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $1E slot 1

.orga $4000
Gr_Toad4Image0:                     ; 1E:4000
.incbin "data/Graphics/Toad4Image0.bin"
Gr_Toad4Image1:                     ; 1E:40E0
.incbin "data/Graphics/Toad4Image1.bin"
Gr_Toad4Image2:                     ; 1E:46E0
.incbin "data/Graphics/Toad4Image2.bin"
Gr_Toad4Image3:                     ; 1E:4EC0
.incbin "data/Graphics/Toad4Image3.bin"
Gr_Toad4Image4:                     ; 1E:5560
.incbin "data/Graphics/Toad4Image4.bin"
Gr_Toad4Image5:                     ; 1E:5AF0
.incbin "data/Graphics/Toad4Image5.bin"
Gr_Toad4Image6:                     ; 1E:6120
.incbin "data/Graphics/Toad4Image6.bin"
Gr_Toad4Image7:                     ; 1E:6880
.incbin "data/Graphics/Toad4Image7.bin"
Gr_Toad4Image8:                     ; 1E:6CB0
.incbin "data/Graphics/Toad4Image8.bin"
Gr_Toad4Image9:                     ; 1E:7040
.incbin "data/Graphics/Toad4Image9.bin"
GrPrinter_AlbumCheepCheep:          ; 1E:7540
.incbin "data/Graphics/Printer_AlbumCheepCheep.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $20 slot 1

.orga $4000
Gr_PeachGivesMarioAward:            ; 20:4000
.incbin "data/Graphics/PeachGivesMarioAward.bin"
Gr_PeachGivesLuigiAward:            ; 20:5800
.incbin "data/Graphics/PeachGivesLuigiAward.bin"
Ti_PeachGivesMarioAward:            ; 20:7000
.incbin "data/Tilemaps/PeachGivesMarioAwardTop.bin"
.incbin "data/Tilemaps/PeachGivesMarioAwardBottom.bin"
Ti_PeachGivesLuigiAward:            ; 20:75A0
.incbin "data/Tilemaps/PeachGivesLuigiAwardTop.bin"
.incbin "data/Tilemaps/PeachGivesLuigiAwardBottom.bin"
Pal_PeachGivesAward:                ; 20:7B40
.dw $0000,$7A8D,$79AB,$7FFF,$00C0,$36BF,$001B,$7FFF,\
    $00C0,$0150,$7406,$36BF,$00C0,$001B,$7406,$7FFF,\
    $00C0,$0200,$034B,$0150,$00C0,$597F,$481B,$0150,\
    $00C0,$597F,$01BF,$7FFF,$00C0,$03FF,$01BF,$7FFF,\
    $00C0,$4F1E,$7CED,$1CFF,$00C0,$03E0,$481B,$03E0,\
    $00C0,$03E0,$03E0,$03E0,$00C0,$03E0,$03E0,$03E0,\
    $00C0,$03E0,$481B,$03E0,$00C0,$03E0,$03E0,$03E0,\
    $00C0,$03E0,$03E0,$03E0,$00C0,$03E0,$03E0,$03E0,\
    $0000,$7A8D,$79AB,$7FFF,$00C0,$36BF,$0240,$7FFF,\
    $00C0,$0150,$7406,$36BF,$00C0,$0240,$7406,$7FFF,\
    $00C0,$0240,$034B,$7FFF,$00C0,$597F,$481B,$0150,\
    $00C0,$597F,$01BF,$7FFF,$00C0,$03FF,$01BF,$7FFF,\
    $01C0,$4F1E,$7CED,$109C,$00C0,$4F1E,$481B,$0112,\
    $00C0,$03FF,$7CED,$109C,$00C0,$034B,$034B,$034B,\
    $00C0,$034B,$034B,$034B,$00C0,$034B,$034B,$034B,\
    $00C0,$034B,$034B,$034B,$00C0,$034B,$034B,$034B
Data207C40:                         ; 20:7C40
.incbin "data/Tilemaps/Data207C40.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $21 slot 1

.orga $4000
Data214000:                         ; 21:4000

.orga $4B00
Data214B00:                         ; 21:4B00

.orga $5000
Data215000:                         ; 21:5000

.orga $5B00
Data215B00:                         ; 21:5B00

.orga $6600
Data216600:                         ; 21:6600

.orga $7100
Data217100:                         ; 21:7100

.orga $7C00
Data217C00:                         ; 21:7C00

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $22 slot 1

.orga $4000
Data224000:                         ; 22:4000

.orga $5800
Data225800:                         ; 22:5800

.orga $5AD0
Gr_Toad37Images:                    ; 22:5AD0
.incbin "data/Graphics/Toad37Images.bin"
Gr_Toad2Image3:                     ; 22:5F80
.incbin "data/Graphics/Toad2Image3.bin"
Gr_Toad2Image4:                     ; 22:6E80
.incbin "data/Graphics/Toad2Image4.bin"
Ti_ToadAward:                       ; 22:7BB0
.incbin "data/Tilemaps/ToadAward.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $23 slot 1

.orga $4000
Data234000:                         ; 23:4000

.orga $5800
Gr_FortuneCardsBank23:              ; 23:5800
.incbin "data/Graphics/FortuneCardsBank23.bin"

.orga $7000
Data237000:                         ; 23:7000

.orga $7400
Data237400:                         ; 23:7400

.orga $7800
Data237800:                         ; 23:7800

.orga $7C00
Data237C00:                         ; 23:7C00

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $24 slot 1

.orga $4000
Gr_CalendarMonth:                   ; 24:4000
.incbin "data/Graphics/CalendarMonth.bin"
Data245800:                         ; 24:5800

.orga $5A00
Data245A00:                         ; 24:5A00

.orga $5C00
Data245C00:                         ; 24:5C00

.orga $5E00
TiPrinter_ToadAward:                ; 24:5E00
.incbin "data/Tilemaps/Printer_ToadAward.bin"
TiPrinter_MarioAward:               ; 24:63A0
.incbin "data/Tilemaps/Printer_MarioAward.bin"
TiPrinter_AlbumMarioLuigi5:         ; 24:6C10
.incbin "data/Tilemaps/Printer_AlbumMarioLuigi5.bin"
TiPrinter_AlbumMarioLuigi6:         ; 24:6EE0
.incbin "data/Tilemaps/Printer_AlbumMarioLuigi6.bin"
TiPrinter_AlbumMarioLuigi7:         ; 24:71B0
.incbin "data/Tilemaps/Printer_AlbumMarioLuigi7.bin"
TiPrinter_AlbumMarioLuigi8 :        ; 24:7480
.incbin "data/Tilemaps/Printer_AlbumMarioLuigi8.bin"
GrPrinter_AlbumGoomba:              ; 24:7750
.incbin "data/Graphics/Printer_AlbumGoomba.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $25 slot 1

.orga $4000
Data254000:                         ; 25:4000

.orga $4800
Data254800:                         ; 25:4800

.orga $5800
Gr_PrintMenu:                       ; 25:5800
.incbin "data/Graphics/PrintMenu.bin"
Data257000:                         ; 25:7000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $26 slot 1

.orga $4000
Ti_YoshiIsHereW1_1:                 ; 26:4000
.incbin "data/Tilemaps/YoshiIsHereW1_1.bin"
Ti_YoshiIsHereW1_2:                 ; 26:42D0
.incbin "data/Tilemaps/YoshiIsHereW1_2.bin"
Ti_YoshiIsHereW1_3:                 ; 26:45A0
.incbin "data/Tilemaps/YoshiIsHereW1_3.bin"
Ti_YoshiIsHereW1_4:                 ; 26:4870
.incbin "data/Tilemaps/YoshiIsHereW1_4.bin"
Ti_YoshiIsHereW2_1:                 ; 26:4B40
.incbin "data/Tilemaps/YoshiIsHereW2_1.bin"
Ti_YoshiIsHereW2_2:                 ; 26:4E10
.incbin "data/Tilemaps/YoshiIsHereW2_2.bin"
Ti_YoshiIsHereW2_3:                 ; 26:50E0
.incbin "data/Tilemaps/YoshiIsHereW2_3.bin"
Ti_YoshiIsHereW2_4:                 ; 26:53B0
.incbin "data/Tilemaps/YoshiIsHereW2_4.bin"
Ti_YoshiIsHereW3_1:                 ; 26:5680
.incbin "data/Tilemaps/YoshiIsHereW3_1.bin"
Ti_YoshiIsHereW3_2:                 ; 26:5950
.incbin "data/Tilemaps/YoshiIsHereW3_2.bin"
Ti_YoshiIsHereW3_3:                 ; 26:5C20
.incbin "data/Tilemaps/YoshiIsHereW3_3.bin"
Ti_YoshiIsHereW3_4:                 ; 26:5EF0
.incbin "data/Tilemaps/YoshiIsHereW3_4.bin"
Ti_YoshiIsHereW4_1:                 ; 26:61C0
.incbin "data/Tilemaps/YoshiIsHereW4_1.bin"
Ti_YoshiIsHereW4_2:                 ; 26:6490
.incbin "data/Tilemaps/YoshiIsHereW4_2.bin"
Ti_YoshiIsHereW4_3:                 ; 26:6760
.incbin "data/Tilemaps/YoshiIsHereW4_3.bin"
Ti_YoshiIsHereW4_4:                 ; 26:6A30
.incbin "data/Tilemaps/YoshiIsHereW4_4.bin"
Ti_YoshiIsHereW5_1:                 ; 26:6D00
.incbin "data/Tilemaps/YoshiIsHereW5_1.bin"
Ti_YoshiIsHereW5_2:                 ; 26:6FD0
.incbin "data/Tilemaps/YoshiIsHereW5_2.bin"
Ti_YoshiIsHereW5_3:                 ; 26:72A0
.incbin "data/Tilemaps/YoshiIsHereW5_3.bin"
Ti_YoshiIsHereW5_4:                 ; 26:7570
.incbin "data/Tilemaps/YoshiIsHereW5_4.bin"
Ti_YoshiIsHereW6_1:                 ; 26:7840
.incbin "data/Tilemaps/YoshiIsHereW6_1.bin"
Ti_YoshiIsHereW6_2:                 ; 26:7B10
.incbin "data/Tilemaps/YoshiIsHereW6_2.bin"
Data267DE0:                         ; 26:7DE0
.incbin "data/Graphics/Data267DE0.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $27 slot 1

.orga $4000
Ti_YoshiIsHereW6_3:                 ; 27:4000
.incbin "data/Tilemaps/YoshiIsHereW6_3.bin"
Ti_YoshiIsHereW6_4:                 ; 27:42D0
.incbin "data/Tilemaps/YoshiIsHereW6_4.bin"
Ti_YoshiIsHereW7_1:                 ; 27:45A0
.incbin "data/Tilemaps/YoshiIsHereW7_1.bin"
Ti_YoshiIsHereW7_2:                 ; 27:4870
.incbin "data/Tilemaps/YoshiIsHereW7_2.bin"
Ti_YoshiIsHereW7_3:                 ; 27:4B40
.incbin "data/Tilemaps/YoshiIsHereW7_3.bin"
Ti_YoshiIsHereW7_4:                 ; 27:4E10
.incbin "data/Tilemaps/YoshiIsHereW7_4.bin"
Ti_YoshiIsHereW8_1:                 ; 27:50E0
.incbin "data/Tilemaps/YoshiIsHereW8_1.bin"
Ti_YoshiIsHereW8_2:                 ; 27:53B0
.incbin "data/Tilemaps/YoshiIsHereW8_2.bin"
Ti_YoshiIsHereW8_3:                 ; 27:5680
.incbin "data/Tilemaps/YoshiIsHereW8_3.bin"
Ti_YoshiIsHereW8_4:                 ; 27:5950
.incbin "data/Tilemaps/YoshiIsHereW8_4.bin"
Ti_MarioAward:                      ; 27:5C20
.incbin "data/Tilemaps/MarioAward.bin"
Ti_PeachAward:                      ; 27:5EF0
.incbin "data/Tilemaps/PeachAward.bin"
Ti_BowserAward:                     ; 27:61C0
.incbin "data/Tilemaps/BowserAward.bin"
Ti_YoshiAward:                      ; 27:6490
.incbin "data/Tilemaps/YoshiAward.bin"
Ti_AlbumFireworks:                  ; 27:6760
.incbin "data/Tilemaps/AlbumFireworks.bin"
Ti_Album1up:                        ; 27:6A30
.incbin "data/Tilemaps/Album1up.bin"
Ti_AlbumVine:                       ; 27:6D00
.incbin "data/Tilemaps/AlbumVine.bin"
Ti_AlbumVS:                         ; 27:6FD0
.incbin "data/Tilemaps/AlbumVS.bin"
Ti_AlbumPeachKiss:                  ; 27:72A0
.incbin "data/Tilemaps/AlbumPeachKiss.bin"
Ti_AlbumInfrared:                   ; 27:7570
.incbin "data/Tilemaps/AlbumInfrared.bin"
Ti_AlbumRedCoin:                    ; 27:7840
.incbin "data/Tilemaps/AlbumRedCoin.bin"
Ti_AlbumHighScore:                  ; 27:7B10
.incbin "data/Tilemaps/AlbumHighScore.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $28 slot 1

.orga $4000
Ti_AlbumYoshi:                      ; 28:4000
.incbin "data/Tilemaps/AlbumYoshi.bin"
Ti_AlbumGoomba:                     ; 28:42D0
.incbin "data/Tilemaps/AlbumGoomba.bin"
Ti_AlbumBlooper:                    ; 28:45A0
.incbin "data/Tilemaps/AlbumBlooper.bin"
Ti_AlbumLakitu:                     ; 28:4870
.incbin "data/Tilemaps/AlbumLakitu.bin"
Ti_AlbumCheepCheep:                 ; 28:4B40
.incbin "data/Tilemaps/AlbumCheepCheep.bin"
Ti_AlbumHammerBro:                  ; 28:4E10
.incbin "data/Tilemaps/AlbumHammerBro.bin"
Ti_AlbumBulletBill:                 ; 28:50E0
.incbin "data/Tilemaps/AlbumBulletBill.bin"
Ti_AlbumKoopa:                      ; 28:53B0
.incbin "data/Tilemaps/AlbumKoopa.bin"
Ti_AlbumSpiny:                      ; 28:5680
.incbin "data/Tilemaps/AlbumSpiny.bin"
Ti_AlbumBuzzy:                      ; 28:5950
.incbin "data/Tilemaps/AlbumBuzzy.bin"
Ti_AlbumBowser:                     ; 28:5C20
.incbin "data/Tilemaps/AlbumBowser.bin"
Ti_AlbumMarioLuigi:                 ; 28:5EF0
.incbin "data/Tilemaps/AlbumMarioLuigi.bin"
Gr_FortuneCardsBank28:              ; 28:61C0
.incbin "data/Graphics/FortuneCardsBank28.bin"

.orga $78A0
.incbin "data/Graphics/Unused2878A0.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $29 slot 1

.orga $4000
Gr_ToadAward:                       ; 29:4000
.incbin "data/Graphics/ToadAward.bin"
Gr_MarioAward:                      ; 29:4420
.incbin "data/Graphics/MarioAward.bin"
Gr_PeachAward:                      ; 29:4920
.incbin "data/Graphics/PeachAward.bin"
Gr_BowserAward:                     ; 29:4E80
.incbin "data/Graphics/BowserAward.bin"
Gr_YoshiAward:                      ; 29:5410
.incbin "data/Graphics/YoshiAward.bin"
Gr_AlbumFireworks:                  ; 29:58C0
.incbin "data/Graphics/AlbumFireworks.bin"
Gr_Album1up:                        ; 29:63C0
.incbin "data/Graphics/Album1up.bin"
Gr_AlbumVine:                       ; 29:6B60
.incbin "data/Graphics/AlbumVine.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $2A slot 1

.orga $4000
Gr_AlbumVS:                         ; 2A:4000
.incbin "data/Graphics/AlbumVS.bin"
Gr_AlbumPeachKiss:                  ; 2A:4B00
.incbin "data/Graphics/AlbumPeachKiss.bin"
Gr_AlbumInfrared:                   ; 2A:5640
.incbin "data/Graphics/AlbumInfrared.bin"
Gr_AlbumRedCoin:                    ; 2A:6180
.incbin "data/Graphics/AlbumRedCoin.bin"
Gr_AlbumYoshi:                      ; 2A:6E40
.incbin "data/Graphics/AlbumYoshi.bin"
Gr_AlbumGoomba:                     ; 2A:79B0
.incbin "data/Graphics/AlbumGoomba.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $2B slot 1

.orga $4000
Gr_AlbumBlooper:                    ; 2B:4000
.incbin "data/Graphics/AlbumBlooper.bin"
Gr_AlbumLakitu:                     ; 2B:4840
.incbin "data/Graphics/AlbumLakitu.bin"
Gr_AlbumCheepCheep:                 ; 2B:4FC0
.incbin "data/Graphics/AlbumCheepCheep.bin"
Gr_AlbumHammerBro:                  ; 2B:5620
.incbin "data/Graphics/AlbumHammerBro.bin"
Gr_AlbumBulletBill:                 ; 2B:5FB0
.incbin "data/Graphics/AlbumBulletBill.bin"
Gr_AlbumKoopa:                      ; 2B:6590
.incbin "data/Graphics/AlbumKoopa.bin"
Gr_AlbumSpiny:                      ; 2B:6CD0
.incbin "data/Graphics/AlbumSpiny.bin"
Gr_AlbumBuzzy:                      ; 2B:7570
.incbin "data/Graphics/AlbumBuzzy.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $2C slot 1

.orga $4000
Gr_AlbumBowser:                     ; 2C:4000
.incbin "data/Graphics/AlbumBowser.bin"
Gr_AlbumMarioLuigi:                 ; 2C:4AC0
.incbin "data/Graphics/AlbumMarioLuigi.bin"
GrPrinter_AlbumBowser1:             ; 2C:5820
.incbin "data/Graphics/Printer_AlbumBowser1.bin"
GrPrinter_AlbumBowser2:             ; 2C:61C0
.incbin "data/Graphics/Printer_AlbumBowser2.bin"
GrPrinter_AlbumBowser3:             ; 2C:6940
.incbin "data/Graphics/Printer_AlbumBowser3.bin"
GrPrinter_AlbumBowser4:             ; 2C:7120
.incbin "data/Graphics/Printer_AlbumBowser4.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $2D slot 1

.orga $4000
GrPrinter_AlbumMarioLuigi5:         ; 2D:4000
.incbin "data/Graphics/Printer_AlbumMarioLuigi5.bin"
GrPrinter_AlbumMarioLuigi6:         ; 2D:47F0
.incbin "data/Graphics/Printer_AlbumMarioLuigi6.bin"
GrPrinter_AlbumMarioLuigi7:         ; 2D:51C0
.incbin "data/Graphics/Printer_AlbumMarioLuigi7.bin"
GrPrinter_AlbumMarioLuigi8:         ; 2D:5B50
.incbin "data/Graphics/Printer_AlbumMarioLuigi8.bin"
GrPrinter_ToadAward:                ; 2D:6600
.incbin "data/Graphics/Printer_ToadAward.bin"
GrPrinter_MarioAward:               ; 2D:7050
.incbin "data/Graphics/Printer_MarioAward.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $2E slot 1

.orga $4000
GrPrinter_BowserAward:              ; 2E:4000
.incbin "data/Graphics/Printer_BowserAward.bin"
GrPrinter_YoshiAward:               ; 2E:4DD0
.incbin "data/Graphics/Printer_YoshiAward.bin"
GrPrinter_AlbumFireworks:           ; 2E:58F0
.incbin "data/Graphics/Printer_AlbumFireworks.bin"
GrPrinter_AlbumVine:                ; 2E:63F0
.incbin "data/Graphics/Printer_AlbumVine.bin"
GrPrinter_AlbumVS:                  ; 2E:6F40
.incbin "data/Graphics/Printer_AlbumVS.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $2F slot 1

.orga $4000
GrPrinter_AlbumPeachKiss:           ; 2F:4000
.incbin "data/Graphics/Printer_AlbumPeachKiss.bin"
GrPrinter_AlbumInfrared:            ; 2F:4B40
.incbin "data/Graphics/Printer_AlbumInfrared.bin"
GrPrinter_AlbumHighScore:           ; 2F:5680
.incbin "data/Graphics/Printer_AlbumHighScore.bin"
GrPrinter_AlbumYoshi:               ; 2F:5FB0
.incbin "data/Graphics/Printer_AlbumYoshi.bin"
GrPrinter_AlbumBlooper:             ; 2F:6B20
.incbin "data/Graphics/Printer_AlbumBlooper.bin"
GrPrinter_AlbumLakitu:              ; 2F:7360
.incbin "data/Graphics/Printer_AlbumLakitu.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $30 slot 1

.orga $4000
GrPrinter_AlbumHammerBro:           ; 30:4000
.incbin "data/Graphics/Printer_AlbumHammerBro.bin"
GrPrinter_AlbumKoopa:               ; 30:4990
.incbin "data/Graphics/Printer_AlbumKoopa.bin"
GrPrinter_AlbumSpiny:               ; 30:50D0
.incbin "data/Graphics/Printer_AlbumSpiny.bin"
GrPrinter_AlbumBuzzy:               ; 30:5970
.incbin "data/Graphics/Printer_AlbumBuzzy.bin"
TiPrinter_PeachAward:               ; 30:5FB0
.incbin "data/Tilemaps/Printer_PeachAward.bin"
TiPrinter_BowserAward:              ; 30:6820
.incbin "data/Tilemaps/Printer_BowserAward.bin"
TiPrinter_AlbumBowser1:             ; 30:7090
.incbin "data/Tilemaps/Printer_AlbumBowser1.bin"
TiPrinter_AlbumBowser2:             ; 30:7360
.incbin "data/Tilemaps/Printer_AlbumBowser2.bin"
TiPrinter_AlbumBowser3:             ; 30:7630
.incbin "data/Tilemaps/Printer_AlbumBowser3.bin"
TiPrinter_AlbumBowser4:             ; 30:7900
.incbin "data/Tilemaps/Printer_AlbumBowser4.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $31 slot 1

.orga $4000
Data314000:                         ; 31:4000

.orga $4800
Data314800:                         ; 31:4800

.orga $5000
Data315000:                         ; 31:5000

.orga $5800
Data315800:                         ; 31:5800

.orga $5B60
Data315B60:                         ; 31:5B60

.orga $5EC0
Data315EC0:                         ; 31:5EC0

.orga $6220
Data316220:                         ; 31:6220

.orga $6580
Data316580:                         ; 31:6580

.orga $68E0
Data3168E0:                         ; 31:68E0

.orga $6C40
Data316C40:                         ; 31:6C40

.orga $6FA0
Data316FA0:                         ; 31:6FA0

.orga $7300
Data317300:                         ; 31:7300

.orga $7660
Data317660:                         ; 31:7660

.orga $79C0
Data3179C0:                         ; 31:79C0
.db $22,$22,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $22,$22,$22,$22,$08,$09,$0A,$0B,\
    $0C,$0D,$22,$22,$20,$00,$01,$02,\
    $03,$20,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $22,$22,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00
Data317A20:                         ; 31:7A20
.db $22,$22,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $22,$22,$22,$22,$20,$0E,$0F,$10,\
    $11,$20,$22,$22,$20,$00,$01,$02,\
    $03,$20,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $22,$22,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00
Data317A80:                         ; 31:7A80
.db $22,$22,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $22,$22,$22,$22,$20,$04,$05,$06,\
    $07,$20,$22,$22,$20,$00,$01,$02,\
    $03,$20,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $22,$22,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00
Data317AE0:                         ; 31:7AE0
.db $22,$22,$22,$22,$22,$22,$22,$22,\
    $22,$22,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $22,$22,$22,$22,$22,$22,$22,$22,\
    $22,$22,$22,$22,$20,$00,$01,$02,\
    $03,$20,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $22,$22,$22,$22,$22,$22,$22,$22,\
    $22,$22,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00
Data317B40:                         ; 31:7B40
.db $22,$22,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $22,$22,$22,$22,$20,$1A,$1B,$1C,\
    $1D,$20,$22,$22,$20,$00,$01,$02,\
    $03,$20,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $22,$22,$22,$22,$1E,$1F,$1F,$1F,\
    $24,$1E,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00
Data317BA0:                         ; 31:7BA0
.db $22,$22,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $22,$22,$22,$22,$20,$12,$13,$14,\
    $15,$20,$22,$22,$20,$00,$01,$02,\
    $03,$20,$22,$22,$22,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $22,$22,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$22,$22,$22,$22,\
    $22,$00,$00,$00,$00,$00,$00,$00
Data317C00:                         ; 31:7C00
.db $22,$22,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$22,$22,$22,$22,\
    $22,$00,$00,$00,$00,$00,$00,$00,\
    $22,$22,$22,$22,$20,$16,$17,$18,\
    $19,$20,$22,$22,$20,$00,$01,$02,\
    $03,$20,$22,$22,$22,$22,$22,$22,\
    $22,$00,$00,$00,$00,$00,$00,$00,\
    $22,$22,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$22,$22,$22,$22,\
    $22,$00,$00,$00,$00,$00,$00,$00
Data317C60:                         ; 31:7C60
.db $22,$22,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$22,$22,$22,$22,\
    $22,$00,$00,$00,$00,$00,$00,$00,\
    $22,$22,$22,$22,$25,$26,$27,$28,\
    $2A,$2C,$22,$22,$20,$16,$17,$18,\
    $19,$20,$22,$22,$22,$22,$22,$22,\
    $22,$00,$00,$00,$00,$00,$00,$00,\
    $22,$22,$22,$22,$1E,$1F,$1F,$29,\
    $2B,$1E,$22,$22,$1E,$1F,$1F,$1F,\
    $1F,$1E,$22,$22,$22,$22,$22,$22,\
    $22,$00,$00,$00,$00,$00,$00,$00
Data317CC0:                         ; 31:7CC0
.db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08,\
    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08,\
    $0F,$0F,$0F,$0F,$4F,$4F,$4F,$4F,\
    $4F,$6F,$0F,$0F,$4F,$4F,$4F,$4F,\
    $4F,$6F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08
Data317D20:                         ; 31:7D20
.db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08,\
    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08,\
    $0F,$0F,$0F,$0F,$4F,$6F,$6F,$6F,\
    $6F,$6F,$0F,$0F,$4F,$4F,$4F,$4F,\
    $4F,$6F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08
Data317D80:                         ; 31:7D80
.db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08,\
    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08,\
    $0F,$0F,$0F,$0F,$4F,$4F,$4F,$4F,\
    $4F,$6F,$0F,$0F,$4F,$4F,$4F,$4F,\
    $4F,$6F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08
Data317DE0:                         ; 31:7DE0
.db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08,\
    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08,\
    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$0F,$0F,$0F,$4F,$4F,$4F,$4F,\
    $4F,$6F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08
Data317E40:                         ; 31:7E40
.db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08,\
    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08,\
    $0F,$0F,$0F,$0F,$4F,$4F,$4F,$4F,\
    $0F,$6F,$0F,$0F,$4F,$4F,$4F,$4F,\
    $4F,$6F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08
Data317EA0:                         ; 31:7EA0
.db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08,\
    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$08,$08,$08,\
    $08,$08,$08,$08,$08,$08,$08,$08,\
    $0F,$0F,$0F,$0F,$4F,$4F,$4F,$4F,\
    $4F,$6F,$0F,$0F,$4F,$4F,$4F,$4F,\
    $4F,$6F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$08,$08,$08,$08,$08,$08,$08
Data317F00:                         ; 31:7F00
.db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$08,$08,$08,$08,$08,$08,$08,\
    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$08,$08,$08,$08,$08,$08,$08,\
    $0F,$0F,$0F,$0F,$4F,$4F,$4F,$4F,\
    $4F,$6F,$0F,$0F,$4F,$4F,$4F,$4F,\
    $4F,$6F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$08,$08,$08,$08,$08,$08,$08
Data317F60:                         ; 31:7F60
.db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$08,$08,$08,$08,$08,$08,$08,\
    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$2F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$08,$08,$08,$08,$08,$08,$08,\
    $0F,$0F,$0F,$0F,$4F,$4F,$4F,$0F,\
    $0F,$6F,$0F,$0F,$4F,$4F,$4F,$4F,\
    $4F,$6F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$08,$08,$08,$08,$08,$08,$08,\

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $33 slot 1

.orga $4000
Data334000:                         ; 33:4000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $34 slot 1

.orga $4000
Gr_Toad5Image0:                     ; 34:4000
.incbin "data/Graphics/Toad5Image0.bin"
Gr_Toad5Image1:                     ; 34:46E0
.incbin "data/Graphics/Toad5Image1.bin"
Gr_Toad5Image2:                     ; 34:4CF0
.incbin "data/Graphics/Toad5Image2.bin"
Gr_Toad5Image3:                     ; 34:54B0
.incbin "data/Graphics/Toad5Image3.bin"
Gr_Toad5Image4:                     ; 34:5B40
.incbin "data/Graphics/Toad5Image4.bin"
Gr_Toad5Image5:                     ; 34:6310
.incbin "data/Graphics/Toad5Image5.bin"
Gr_Toad5Image6:                     ; 34:6840
.incbin "data/Graphics/Toad5Image6.bin"
Gr_Toad5Image7:                     ; 34:6EE0
.incbin "data/Graphics/Toad5Image7.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $35 slot 1

.orga $4000
GrPrinter_PeachAward:               ; 35:4000
.incbin "data/Graphics/Printer_PeachAward.bin"
GrPrinter_Album1up:                 ; 35:4A60
.incbin "data/Graphics/Printer_Album1up.bin"
Ti_Data355200:                      ; 35:5200

.orga $57A0
Ti_Data3557A0:                      ; 35:57A0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $36 slot 1

.orga $4000
Gr_AlbumHighScore:                  ; 36:4000
.incbin "data/Graphics/AlbumHighScore.bin"
Gr_ToyBoxPeachImage0:               ; 36:4930
.incbin "data/Graphics/ToyBoxPeachImage0.bin"
Gr_ToyBoxPeachImage1:               ; 36:4F00
.incbin "data/Graphics/ToyBoxPeachImage1.bin"
Gr_ToyBoxPeachImage2:               ; 36:5620
.incbin "data/Graphics/ToyBoxPeachImage2.bin"
Gr_ToyBoxPeachImage3:               ; 36:5DC0
.incbin "data/Graphics/ToyBoxPeachImage3.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $37 slot 1

.orga $4000
Ti_Data374000:                      ; 37:4000

.orga $42D0
Ti_Data3742D0:                      ; 37:42D0

.orga $45A0
Ti_Data3745A0:                      ; 37:45A0

.orga $4870
Ti_Data374870:                      ; 37:4870

.orga $4B40
Ti_Data374B40:                      ; 37:4B40

.orga $4E10
Ti_Data374E10:                      ; 37:4E10

.orga $50E0
Ti_Data3750E0:                      ; 37:50E0

.orga $53B0
Ti_Data3753B0:                      ; 37:53B0

.orga $5680
Ti_Data375680:                      ; 37:5680

.orga $5950
Ti_Data375950:                      ; 37:5950

.orga $5C20
Ti_Data375C20:                      ; 37:5C20

.orga $5EF0
Ti_Data375EF0:                      ; 37:5EF0

.orga $61C0
Ti_Data3761C0:                      ; 37:61C0

.orga $6490
Ti_Data376490:                      ; 37:6490

.orga $6760
Ti_Data376760:                      ; 37:6760

.orga $72A0
Ti_Data3772A0:                      ; 37:72A0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $38 slot 1

.orga $4000
Gr_Data384000:                      ; 38:4000

.orga $4520
Gr_Data384520:                      ; 38:4520

.orga $4B50
Gr_Data384B50:                      ; 38:4B50

.orga $50D0
Gr_Data3850D0:                      ; 38:50D0

.orga $56B0
Gr_Data3856B0:                      ; 38:56B0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $39 slot 1

.orga $4000
Ti_Data394000:                      ; 39:4000

.orga $4B40
Ti_Data394B40:                      ; 39:4B40

.orga $61C0
Ti_Data3961C0:                      ; 39:61C0

.orga $6A30
Ti_Data396A30:                      ; 39:6A30

.orga $6D00
Ti_Data396D00:                      ; 39:6D00

.orga $6FD0
Ti_Data396FD0:                      ; 39:6FD0

.orga $72A0
Ti_Data3972A0:                      ; 39:72A0

.orga $7570
Ti_Data397570:                      ; 39:7570

.orga $7840
Ti_Data397840:                      ; 39:7840

.orga $7B10
Ti_Data397B10:                      ; 39:7B10

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $3A slot 1

.orga $4000
TiPrinter_YoshiAward:               ; 3A:4000
.incbin "data/Tilemaps/Printer_YoshiAward.bin"
Gr_CalendarDayErase:                ; 3A:4870
.incbin "data/Graphics/CalendarDayErase.bin"

.orga $5870
Gr_CalendarDay:                     ; 3A:5870
.incbin "data/Graphics/CalendarDay.bin"

.orga $5B70
Data3A5B70:                         ; 3A:5B70

.orga $5EA0
Data3A5EA0:                         ; 3A:5EA0

.orga $6070
Ti_Data3A6070:                      ; 3A:6070

.orga $6E80
Gr_Toad2Image1:                     ; 3A:6E80
.incbin "data/Graphics/Toad2Image1.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $3B slot 1

.orga $4000
Ti_Data3B4000:                      ; 3B:4000

.orga $42D0
Ti_Data3B42D0:                      ; 3B:42D0

.orga $45A0
Ti_Data3B45A0:                      ; 3B:45A0

.orga $4870
Ti_Data3B4870:                      ; 3B:4870

.orga $4B40
Ti_Data3B4B40:                      ; 3B:4B40

.orga $4E10
Ti_Data3B4E10:                      ; 3B:4E10

.orga $50E0
Ti_Data3B50E0:                      ; 3B:50E0

.orga $53B0
Ti_Data3B53B0:                      ; 3B:53B0

.orga $5680
Data3B5680:                         ; 3B:5680

.orga $5950
Data3B5950:                         ; 3B:5950

.orga $5C20
Data3B5C20:                         ; 3B:5C20

.orga $5EF0
Data3B5EF0:                         ; 3B:5EF0

.orga $61C0
Data3B61C0:                         ; 3B:61C0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $3C slot 1

.orga $4000
Data3C4000:                         ; 3C:4000

.orga $59D0
Gr_Toad2Image0:                     ; 3C:59D0
.incbin "data/Graphics/Toad2Image0.bin"
Gr_Toad1Images:                     ; 3C:65A0
.incbin "data/Graphics/Toad1Images.bin"
Gr_Toad2Image2:                     ; 3C:7430
.incbin "data/Graphics/Toad2Image2.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $3D slot 1

.orga $4000
GrPrinter_AlbumBulletBill:          ; 3D:4000
.incbin "data/Graphics/Printer_AlbumBulletBill.bin"
Gr_Data3D45E0:                      ; 3D:45E0
.incbin "data/Graphics/Data3D45E0.bin"
Gr_Data3D4E90:                      ; 3D:4E90
.incbin "data/Graphics/Data3D4E90.bin"
Data3D55B0:                         ; 3D:55B0

.orga $5F00
Ti_Data3D5F00:                      ; 3D:5F00

.orga $61D0
Ti_Data3D61D0:                      ; 3D:61D0

.orga $64A0
Ti_Data3D64A0:                      ; 3D:64A0

.orga $6770
Ti_Data3D6770:                      ; 3D:6770

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $3E slot 1

.orga $4000
Data3E4000:                         ; 3E:4000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $3F slot 1

.orga $4000
Ti_Data3F4000:                      ; 3F:4000

.orga $42D0
Ti_Data3F42D0:                      ; 3F:42D0

.orga $45A0
Ti_Data3F45A0:                      ; 3F:45A0

.orga $4870
Ti_Data3F4870:                      ; 3F:4870

.orga $4B40
Ti_Data3F4B40:                      ; 3F:4B40

.orga $4E10
Ti_Data3F4E10:                      ; 3F:4E10

.orga $50E0
Ti_Data3F50E0:                      ; 3F:50E0

.orga $53B0
Ti_Data3F53B0:                      ; 3F:53B0

.orga $5680
Ti_Data3F5680:                      ; 3F:5680

.orga $5950
Ti_Data3F5950:                      ; 3F:5950

.orga $5C20
Ti_Data3F5C20:                      ; 3F:5C20

.orga $5EF0
Ti_Data3F5EF0:                      ; 3F:5EF0

.orga $61C0
Ti_Data3F61C0:                      ; 3F:61C0

.orga $6490
Ti_Data3F6490:                      ; 3F:6490

.orga $6760
Ti_Data3F6760:                      ; 3F:6760

.orga $6A30
Ti_Data3F6A30:                      ; 3F:6A30

.orga $6D00
Ti_Data3F6D00:                      ; 3F:6D00

.orga $6FD0
Ti_Data3F6FD0:                      ; 3F:6FD0

.orga $72A0
Ti_Data3F72A0:                      ; 3F:72A0

.orga $7570
Ti_Data3F7570:                      ; 3F:7570

.orga $7840
Ti_Data3F7840:                      ; 3F:7840
