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
Data0E71D0:                         ; 0E:71D0
.incbin "data/Tilemaps/Data0E71D0.bin"
Data0E74A0:                         ; 0E:74A0
.incbin "data/Tilemaps/Data0E74A0.bin"
Data0E7770:                         ; 0E:7770
.incbin "data/Tilemaps/Data0E7770.bin"
Data0E7A40:                         ; 0E:7A40
.incbin "data/Tilemaps/Data0E7A40.bin"
Data0E7D10:                         ; 0E:7D10
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
Data0F6DA0:                         ; 0F:6DA0
.incbin "data/Tilemaps/Data0F6DA0.bin"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $16 slot 1

.orga $4000
Data164000:                         ; 16:4000

.orga $5000
Data165000:                         ; 16:5000

.orga $6000
Data166000:                         ; 16:6000

.orga $7000
Data167000:                         ; 16:7000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $17 slot 1

.orga $4000
Gr_Bank17:                          ; 17:4000

.orga $5000
Data175000:                         ; 17:5000

.orga $6000
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
Data187890:                         ; 18:7890

.orga $7B60
Data187B60:                         ; 18:7B60

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
Data197660:                         ; 19:7660

.orga $7930
Data197930:                         ; 19:7930

.orga $7C00
Data197C00:                         ; 19:7C00

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
Data1C7620:                         ; 1C:7620

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $1E slot 1

.orga $4000

.orga $4000
Data1E4000:                         ; 1E:4000

.orga $40E0
Data1E40E0:                         ; 1E:40E0

.orga $46E0
Data1E46E0:                         ; 1E:46E0

.orga $4EC0
Data1E4EC0:                         ; 1E:4EC0

.orga $5560
Data1E5560:                         ; 1E:5560

.orga $5AF0
Data1E5AF0:                         ; 1E:5AF0

.orga $6120
Data1E6120:                         ; 1E:6120

.orga $6880
Data1E6880:                         ; 1E:6880

.orga $6CB0
Data1E6CB0:                         ; 1E:6CB0

.orga $7040
Data1E7040:                         ; 1E:7040

.orga $7540
Data1E7540:                         ; 1E:7540

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
Data225AD0:                         ; 22:5AD0

.orga $5F80
Data225F80:                         ; 22:5F80

.orga $6E80
Data226E80:                         ; 22:6E80

.orga $7BB0
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
Data244000:                         ; 24:4000

.orga $4800
Data244800:                         ; 24:4800

.orga $5000
Data245000:                         ; 24:5000

.orga $5800
Data245800:                         ; 24:5800

.orga $5E00
Data245E00:                         ; 24:5E00

.orga $63A0
Data2463A0:                         ; 24:63A0

.orga $6C10
Data246C10:                         ; 24:6C10

.orga $6EE0
Data246EE0:                         ; 24:6EE0

.orga $71B0
Data2471B0:                         ; 24:71B0

.orga $7262
Data247262:                         ; 24:7262

.orga $7480
Data247480:                         ; 24:7480

.orga $7750
Data247750:                         ; 24:7750

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $25 slot 1

.orga $4000
Data254000:                         ; 25:4000

.orga $4800
Data254800:                         ; 25:4800

.orga $5800
Data255800:                         ; 25:5800

.orga $6000
Data256000:                         ; 25:6000

.orga $6800
Data256800:                         ; 25:6800

.orga $7000
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
Data2C5820:                         ; 2C:5820

.orga $61C0
Data2C61C0:                         ; 2C:61C0

.orga $6940
Data2C6940:                         ; 2C:6940

.orga $7120
Data2C7120:                         ; 2C:7120

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $2D slot 1

.orga $4000
Data2D4000:                         ; 2D:4000

.orga $47F0
Data2D47F0:                         ; 2D:47F0

.orga $51C0
Data2D51C0:                         ; 2D:51C0

.orga $5B50
Data2D5B50:                         ; 2D:5B50

.orga $6600
Data2D6600:                         ; 2D:6600

.orga $7050
Data2D7050:                         ; 2D:7050

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $2E slot 1

.orga $4000
Data2E4000:                         ; 2E:4000

.orga $4DD0
Data2E4DD0:                         ; 2E:4DD0

.orga $58F0
Data2E58F0:                         ; 2E:58F0

.orga $63F0
Data2E63F0:                         ; 2E:63F0

.orga $6F40
Data2E6F40:                         ; 2E:6F40

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $2F slot 1

.orga $4000
Data2F4000:                         ; 2F:4000

.orga $4B40
Data2F4B40:                         ; 2F:4B40

.orga $5680
Data2F5680:                         ; 2F:5680

.orga $5FB0
Data2F5FB0:                         ; 2F:5FB0

.orga $6B20
Data2F6B20:                         ; 2F:6B20

.orga $7360
Data2F7360:                         ; 2F:7360

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $30 slot 1

.orga $4000
Data304000:                         ; 30:4000

.orga $4990
Data304990:                         ; 30:4990

.orga $50D0
Data3050D0:                         ; 30:50D0

.orga $5970
Data305970:                         ; 30:5970

.orga $5FB0
Data305FB0:                         ; 30:5FB0

.orga $6820
Data306820:                         ; 30:6820

.orga $7090
Data307090:                         ; 30:7090

.orga $7360
Data307360:                         ; 30:7360

.orga $7630
Data307630:                         ; 30:7630

.orga $7900
Data307900:                         ; 30:7900

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $31 slot 1

.orga $4000
Data314000:                         ; 31:4000

.orga $43E6
Data3143E6:                         ; 31:43E6

.orga $43FC
Data3143FC:                         ; 31:43FC

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $33 slot 1

.orga $4000
Data334000:                         ; 33:4000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $34 slot 1

.orga $4000
Data344000:                         ; 34:4000

.orga $46E0
Data3446E0:                         ; 34:46E0

.orga $4CF0
Data344CF0:                         ; 34:4CF0

.orga $54B0
Data3454B0:                         ; 34:54B0

.orga $5B40
Data345B40:                         ; 34:5B40

.orga $6310
Data346310:                         ; 34:6310

.orga $6840
Data346840:                         ; 34:6840

.orga $6EE0
Data346EE0:                         ; 34:6EE0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $35 slot 1

.orga $4000
Data354000:                         ; 35:4000

.orga $4A60
Data354A60:                         ; 35:4A60

.orga $5200
Data355200:                         ; 35:5200

.orga $57A0
Data3557A0:                         ; 35:57A0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $36 slot 1

.orga $4000
Gr_AlbumHighScore:                  ; 36:4000
.incbin "data/Graphics/AlbumHighScore.bin"
Data364930:                         ; 36:4930

.orga $4F00
Data364F00:                         ; 36:4F00

.orga $5620
Data365620:                         ; 36:5620

.orga $5DC0
Data365DC0:                         ; 36:5DC0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $37 slot 1

.orga $4000
Data374000:                         ; 37:4000

.orga $42D0
Data3742D0:                         ; 37:42D0

.orga $45A0
Data3745A0:                         ; 37:45A0

.orga $4870
Data374870:                         ; 37:4870

.orga $4B40
Data374B40:                         ; 37:4B40

.orga $4E10
Data374E10:                         ; 37:4E10

.orga $50E0
Data3750E0:                         ; 37:50E0

.orga $53B0
Data3753B0:                         ; 37:53B0

.orga $5680
Data375680:                         ; 37:5680

.orga $5950
Data375950:                         ; 37:5950

.orga $5C20
Data375C20:                         ; 37:5C20

.orga $5EF0
Data375EF0:                         ; 37:5EF0

.orga $61C0
Data3761C0:                         ; 37:61C0

.orga $6490
Data376490:                         ; 37:6490

.orga $6760
Data376760:                         ; 37:6760

.orga $72A0
Data3772A0:                         ; 37:72A0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $38 slot 1

.orga $4000
Data384000:                         ; 38:4000

.orga $4520
Data384520:                         ; 38:4520

.orga $4B50
Data384B50:                         ; 38:4B50

.orga $50D0
Data3850D0:                         ; 38:50D0

.orga $56B0
Data3856B0:                         ; 38:56B0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $39 slot 1

.orga $4000
Data394000:                         ; 39:4000

.orga $4B40
Data394B40:                         ; 39:4B40

.orga $61C0
Data3961C0:                         ; 39:61C0

.orga $6A30
Data396A30:                         ; 39:6A30

.orga $6D00
Data396D00:                         ; 39:6D00

.orga $6FD0
Data396FD0:                         ; 39:6FD0

.orga $72A0
Data3972A0:                         ; 39:72A0

.orga $7570
Data397570:                         ; 39:7570

.orga $7840
Data397840:                         ; 39:7840

.orga $7B10
Data397B10:                         ; 39:7B10

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $3A slot 1

.orga $4000
Data3A4000:                         ; 3A:4000

.orga $4800
Data3A4800:                         ; 3A:4800

.orga $4870
Data3A4870:                         ; 3A:4870

.orga $5870
Data3A5870:                         ; 3A:5870

.orga $5B70
Data3A5B70:                         ; 3A:5B70

.orga $5EA0
Data3A5EA0:                         ; 3A:5EA0

.orga $6070
Data3A6070:                         ; 3A:6070

.orga $6E80
Data3A6E80:                         ; 3A:6E80

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $3B slot 1

.orga $4000
Data3B4000:                         ; 3B:4000

.orga $42D0
Data3B42D0:                         ; 3B:42D0

.orga $45A0
Data3B45A0:                         ; 3B:45A0

.orga $4870
Data3B4870:                         ; 3B:4870

.orga $4B40
Data3B4B40:                         ; 3B:4B40

.orga $4E10
Data3B4E10:                         ; 3B:4E10

.orga $50E0
Data3B50E0:                         ; 3B:50E0

.orga $53B0
Data3B53B0:                         ; 3B:53B0

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
Data3C59D0:                         ; 3C:59D0

.orga $65A0
Data3C65A0:                         ; 3C:65A0

.orga $7430
Data3C7430:                         ; 3C:7430

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $3D slot 1

.orga $4000
Data3D4000:                         ; 3D:4000

.orga $45E0
Data3D45E0:                         ; 3D:45E0

.orga $4E90
Data3D4E90:                         ; 3D:4E90

.orga $55B0
Data3D55B0:                         ; 3D:55B0

.orga $5F00
Data3D5F00:                         ; 3D:5F00

.orga $61D0
Data3D61D0:                         ; 3D:61D0

.orga $64A0
Data3D64A0:                         ; 3D:64A0

.orga $6770
Data3D6770:                         ; 3D:6770

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $3E slot 1

.orga $4000
Data3E4000:                         ; 3E:4000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $3F slot 1

.orga $4000
Data3F4000:                         ; 3F:4000

.orga $42D0
Data3F42D0:                         ; 3F:42D0

.orga $45A0
Data3F45A0:                         ; 3F:45A0

.orga $4870
Data3F4870:                         ; 3F:4870

.orga $4B40
Data3F4B40:                         ; 3F:4B40

.orga $4E10
Data3F4E10:                         ; 3F:4E10

.orga $50E0
Data3F50E0:                         ; 3F:50E0

.orga $53B0
Data3F53B0:                         ; 3F:53B0

.orga $5680
Data3F5680:                         ; 3F:5680

.orga $5950
Data3F5950:                         ; 3F:5950

.orga $5C20
Data3F5C20:                         ; 3F:5C20

.orga $5EF0
Data3F5EF0:                         ; 3F:5EF0

.orga $61C0
Data3F61C0:                         ; 3F:61C0

.orga $6490
Data3F6490:                         ; 3F:6490

.orga $6760
Data3F6760:                         ; 3F:6760

.orga $6A30
Data3F6A30:                         ; 3F:6A30

.orga $6D00
Data3F6D00:                         ; 3F:6D00

.orga $6FD0
Data3F6FD0:                         ; 3F:6FD0

.orga $72A0
Data3F72A0:                         ; 3F:72A0

.orga $7570
Data3F7570:                         ; 3F:7570

.orga $7840
Data3F7840:                         ; 3F:7840
