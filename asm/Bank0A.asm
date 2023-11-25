.bank $0A slot 1
.orga $4000

Data0A4000:                         ; 0A:4000
.db $FF,$7F,$B5,$56,$4A,$29,$00,$00,\
    $FF,$7F,$B5,$56,$4A,$29,$00,$00,\
    $FF,$7F,$B5,$56,$4A,$29,$00,$00,\
    $FF,$7F,$B5,$56,$4A,$29,$00,$00,\
    $FF,$7F,$B5,$56,$4A,$29,$00,$00,\
    $FF,$7F,$9F,$52,$7F,$2D,$1C,$00,\
    $FF,$7F,$81,$6E,$57,$29,$00,$00,\
    $FF,$7F,$B5,$56,$4A,$29,$00,$00,\
    $FF,$7F,$5F,$4A,$1F,$00,$00,$00,\
    $FF,$7F,$B5,$56,$60,$7E,$00,$00,\
    $FF,$7F,$B5,$56,$4A,$29,$00,$00,\
    $FF,$7F,$B5,$56,$4A,$29,$00,$00,\
    $FF,$7F,$B5,$56,$4A,$29,$00,$00,\
    $FF,$7F,$B5,$56,$4A,$29,$00,$00,\
    $FF,$7F,$B5,$56,$4A,$29,$00,$00,\
    $FF,$7F,$9F,$3F,$DA,$25,$00,$00
Data0A4080:                         ; 0A:4080
.incbin "data/Tilemaps/Data0A4080.bin"
Data0A4350:                         ; 0A:4350
.incbin "data/Tilemaps/Data0A4350.bin"
Data0A4620:                         ; 0A:4620
.incbin "data/Tilemaps/Data0A4620.bin"
Data0A48F0:                         ; 0A:48F0
.incbin "data/Tilemaps/Data0A48F0.bin"
Data0A4BC0:                         ; 0A:4BC0
.incbin "data/Tilemaps/Data0A4BC0.bin"

DataPtrs0A4E90:                     ; 0A:4E90
.dw Data0A4080, Data0A4350, Data0A4620, Data0A48F0,\
    Data0A4BC0
DataPtrs0A4E9A:                     ; 0A:4E9A
.dw Data214000, Data215000, Data215B00, Data216600,\
    Data217100

AlbumMain:
; Game state 2C
    ldh  a,[<H_GameSubstate]        ; 0A:4EA4
    rst  $00                        ; 0A:4EA6  Execute from 16-bit pointer table
.dw Code0A4EC6                      ; 0A:4EA7
.dw Code0A4F18                      ; 0A:4EA9
.dw Code0A53F8                      ; 0A:4EAB
.dw Code0A5D97                      ; 0A:4EAD
.dw Code0A6C67                      ; 0A:4EAF
.dw Code0A6F7E                      ; 0A:4EB1
.dw Code0A702C                      ; 0A:4EB3
.dw Code0A7060                      ; 0A:4EB5
.dw Code0A70BA                      ; 0A:4EB7
.dw Code0A714B                      ; 0A:4EB9
.dw Code0A72B4                      ; 0A:4EBB
.dw Code0A7396                      ; 0A:4EBD
.dw Code0A749F                      ; 0A:4EBF

Sub0A4EC1:
    ld   hl,H_GameSubstate          ; 0A:4EC1
    inc  [hl]                       ; 0A:4EC4
    ret                             ; 0A:4EC5

Code0A4EC6:
; Album substate 0
    call Sub001258                  ; 0A:4EC6
    xor  a                          ; 0A:4EC9
    ldh  [<IE],a                    ; 0A:4ECA
    ldh  [<$FF93],a                 ; 0A:4ECC
    ld   hl,$D900                   ; 0A:4ECE
    ld   bc,$0077                   ; 0A:4ED1
    call ClearBytes                 ; 0A:4ED4
    ld   a,$0A                      ; 0A:4ED7
    rst  $10                        ; 0A:4ED9  24-bit call
.dl SubL_0756D9                     ; 0A:4EDA
    ld   a,[W_AlbumUnlockFlags+3]   ; 0A:4EDD
    and  $01                        ; 0A:4EE0
    jr   nz,Code0A4F08              ; 0A:4EE2
    ld   hl,W_AlbumUnlockFlags      ; 0A:4EE4
    ldi  a,[hl]                     ; 0A:4EE7
    and  $07                        ; 0A:4EE8
    cp   $07                        ; 0A:4EEA
    jr   nz,Code0A4F08              ; 0A:4EEC
    ldi  a,[hl]                     ; 0A:4EEE
    cp   $FF                        ; 0A:4EEF
    jr   nz,Code0A4F08              ; 0A:4EF1
    ldi  a,[hl]                     ; 0A:4EF3
    cp   $FF                        ; 0A:4EF4
    jr   nz,Code0A4F08              ; 0A:4EF6
    ld   a,[hl]                     ; 0A:4EF8
    and  $FE                        ; 0A:4EF9
    cp   $FE                        ; 0A:4EFB
    jr   nz,Code0A4F08              ; 0A:4EFD
    or   $01                        ; 0A:4EFF
    ld   [hl],a                     ; 0A:4F01
    ld   a,$0A                      ; 0A:4F02
    rst  $10                        ; 0A:4F04  24-bit call
.dl SubL_0757EF                     ; 0A:4F05
Code0A4F08:
    ld   a,$02                      ; 0A:4F08
    ld   [$C432],a                  ; 0A:4F0A
    ld   a,$0A                      ; 0A:4F0D
    call Sub001813                  ; 0A:4F0F
    call Sub0A4EC1                  ; 0A:4F12
    jp   Code0A4F20                 ; 0A:4F15

Code0A4F18:
; Album substate 1
    call Sub00126D                  ; 0A:4F18
    xor  a                          ; 0A:4F1B
    ldh  [<IE],a                    ; 0A:4F1C
    ldh  [<$FF93],a                 ; 0A:4F1E
Code0A4F20:
    call Sub0A4FE2                  ; 0A:4F20
    ld   hl,$D000                   ; 0A:4F23
    ld   de,$9800                   ; 0A:4F26
    ld   bc,$0240                   ; 0A:4F29
    call CopyBytes                  ; 0A:4F2C
    ld   a,$01                      ; 0A:4F2F
    ldh  [<VBK],a                   ; 0A:4F31
    ld   de,$9800                   ; 0A:4F33
    ld   bc,$0240                   ; 0A:4F36
    call CopyBytes                  ; 0A:4F39
    xor  a                          ; 0A:4F3C
    ldh  [<VBK],a                   ; 0A:4F3D
    ld   a,[$D900]                  ; 0A:4F3F
    sla  a                          ; 0A:4F42
    add  $9A                        ; 0A:4F44
    ld   l,a                        ; 0A:4F46
    ld   a,$4E                      ; 0A:4F47
    adc  $00                        ; 0A:4F49
    ld   h,a                        ; 0A:4F4B
    ldi  a,[hl]                     ; 0A:4F4C
    ld   h,[hl]                     ; 0A:4F4D
    ld   l,a                        ; 0A:4F4E
    ld   a,$21                      ; 0A:4F4F
    ld   [$C415],a                  ; 0A:4F51
    ld   de,$9000                   ; 0A:4F54
    ld   bc,$0800                   ; 0A:4F57
    ld   a,$0A                      ; 0A:4F5A
    call CopyBytesLong              ; 0A:4F5C
    ld   de,$8800                   ; 0A:4F5F
    ld   bc,$0300                   ; 0A:4F62
    ld   a,$0A                      ; 0A:4F65
    call CopyBytesLong              ; 0A:4F67
    ld   hl,Data214B00              ; 0A:4F6A
    ld   bc,$0500                   ; 0A:4F6D
    ld   a,$0A                      ; 0A:4F70
    call CopyBytesLong              ; 0A:4F72
    call Sub0A51B0                  ; 0A:4F75
    ld   a,$02                      ; 0A:4F78
    ldh  [<SVBK],a                  ; 0A:4F7A
    ld   hl,$9000                   ; 0A:4F7C
    ld   de,$D000                   ; 0A:4F7F
    ld   bc,$0800                   ; 0A:4F82
    call CopyBytes                  ; 0A:4F85
    ld   hl,$8800                   ; 0A:4F88
    ld   bc,$0800                   ; 0A:4F8B
    call CopyBytes                  ; 0A:4F8E
    ld   a,$00                      ; 0A:4F91
    ldh  [<SVBK],a                  ; 0A:4F93
    ld   a,$21                      ; 0A:4F95
    ld   [$C415],a                  ; 0A:4F97
    ld   hl,Data217C00              ; 0A:4F9A
    ld   de,$8000                   ; 0A:4F9D
    ld   bc,$0200                   ; 0A:4FA0
    ld   a,$0A                      ; 0A:4FA3
    call CopyBytesLong              ; 0A:4FA5
    ld   a,$0A                      ; 0A:4FA8
    ld   b,$0A                      ; 0A:4FAA
    ld   de,Data0A4000              ; 0A:4FAC
    call LoadFullPaletteLong        ; 0A:4FAF
    call Sub000E29                  ; 0A:4FB2
    ld   a,$90                      ; 0A:4FB5
    ld   [$C178],a                  ; 0A:4FB7
    xor  a                          ; 0A:4FBA
    ldh  [<H_CameraXLow],a          ; 0A:4FBB
    ldh  [<H_CameraXHigh],a         ; 0A:4FBD
    ldh  [<H_CameraY],a             ; 0A:4FBF
    ldh  [<$FFBB],a                 ; 0A:4FC1
    ld   [$C177],a                  ; 0A:4FC3
    ld   a,$08                      ; 0A:4FC6
    ld   [$D90C],a                  ; 0A:4FC8
    ld   a,$02                      ; 0A:4FCB
    ld   [$C0C1],a                  ; 0A:4FCD
    ld   a,$6D                      ; 0A:4FD0
    ld   [$DE68],a                  ; 0A:4FD2
    ld   a,$01                      ; 0A:4FD5
    ldh  [<IE],a                    ; 0A:4FD7
    ldh  [<$FF93],a                 ; 0A:4FD9
    ld   a,$E7                      ; 0A:4FDB
    ldh  [<LCDC],a                  ; 0A:4FDD
    jp   Sub0A4EC1                  ; 0A:4FDF

Sub0A4FE2:
    ld   a,[$D900]                  ; 0A:4FE2
    sla  a                          ; 0A:4FE5
    ld   c,a                        ; 0A:4FE7
    ld   b,$00                      ; 0A:4FE8
    ld   hl,DataPtrs0A4E90          ; 0A:4FEA
    add  hl,bc                      ; 0A:4FED
    ldi  a,[hl]                     ; 0A:4FEE
    ld   h,[hl]                     ; 0A:4FEF
    ld   l,a                        ; 0A:4FF0
    ld   a,$0A                      ; 0A:4FF1
    ld   [$C415],a                  ; 0A:4FF3
    ld   a,$0A                      ; 0A:4FF6
    call LoadScreenTilemapD000      ; 0A:4FF8
    ld   a,[$D900]                  ; 0A:4FFB
    rst  $00                        ; 0A:4FFE  Execute from 16-bit pointer table
.dw Code0A5013                      ; 0A:4FFF
.dw Code0A50A9                      ; 0A:5001
.dw Code0A50A9                      ; 0A:5003
.dw Code0A512F                      ; 0A:5005
.dw Code0A512F                      ; 0A:5007

Data0A5009:                         ; 0A:5009
.db $44,$00,$C9,$00,$4E,$00,$44,$01,\
    $4E,$01

Code0A5013:
    ld   a,[W_AlbumUnlockFlags+3]   ; 0A:5013
    and  $01                        ; 0A:5016
    jr   z,Code0A5030               ; 0A:5018
    ld   a,$D4                      ; 0A:501A
    ld   [$D062],a                  ; 0A:501C
    ld   [$D102],a                  ; 0A:501F
    ld   [$D1A2],a                  ; 0A:5022
    ld   a,$26                      ; 0A:5025
    ld   [$D2A2],a                  ; 0A:5027
    ld   [$D342],a                  ; 0A:502A
    ld   [$D3E2],a                  ; 0A:502D
Code0A5030:
    xor  a                          ; 0A:5030
    ldh  [<$FF97],a                 ; 0A:5031
Code0A5033:
    ldh  a,[<$FF97]                 ; 0A:5033
    ld   c,a                        ; 0A:5035
    srl  a                          ; 0A:5036
    srl  a                          ; 0A:5038
    srl  a                          ; 0A:503A
    ld   e,a                        ; 0A:503C
    ld   d,$00                      ; 0A:503D
    ld   a,c                        ; 0A:503F
    and  $07                        ; 0A:5040
    add  $68                        ; 0A:5042
    ld   c,a                        ; 0A:5044
    ld   a,$53                      ; 0A:5045
    adc  $00                        ; 0A:5047
    ld   b,a                        ; 0A:5049
    ld   hl,W_AlbumUnlockFlags      ; 0A:504A
    add  hl,de                      ; 0A:504D
    ld   a,[bc]                     ; 0A:504E
    and  [hl]                       ; 0A:504F
    jr   nz,Code0A5058              ; 0A:5050
    ld   a,$04                      ; 0A:5052
    ldh  [<$FF99],a                 ; 0A:5054
    jr   Code0A5064                 ; 0A:5056
Code0A5058:
    ld   hl,W_AlbumViewFlags        ; 0A:5058
    add  hl,de                      ; 0A:505B
    ld   a,[bc]                     ; 0A:505C
    and  [hl]                       ; 0A:505D
    jr   nz,Code0A508D              ; 0A:505E
    ld   a,$05                      ; 0A:5060
    ldh  [<$FF99],a                 ; 0A:5062
Code0A5064:
    ldh  a,[<$FF97]                 ; 0A:5064
    sla  a                          ; 0A:5066
    ld   c,a                        ; 0A:5068
    ld   b,$00                      ; 0A:5069
    ld   hl,Data0A5009              ; 0A:506B
    add  hl,bc                      ; 0A:506E
    ldi  a,[hl]                     ; 0A:506F
    add  $40                        ; 0A:5070
    ld   e,a                        ; 0A:5072
    ld   a,[hl]                     ; 0A:5073
    adc  $D2                        ; 0A:5074
    ld   h,a                        ; 0A:5076
    ld   l,e                        ; 0A:5077
    ldh  a,[<$FF99]                 ; 0A:5078
    ld   e,a                        ; 0A:507A
    ld   c,$06                      ; 0A:507B
Code0A507D:
    ld   a,e                        ; 0A:507D
    ldi  [hl],a                     ; 0A:507E
    ldi  [hl],a                     ; 0A:507F
    ldi  [hl],a                     ; 0A:5080
    ldi  [hl],a                     ; 0A:5081
    ld   a,l                        ; 0A:5082
    add  $1C                        ; 0A:5083
    ld   l,a                        ; 0A:5085
    ld   a,h                        ; 0A:5086
    adc  $00                        ; 0A:5087
    ld   h,a                        ; 0A:5089
    dec  c                          ; 0A:508A
    jr   nz,Code0A507D              ; 0A:508B
Code0A508D:
    ldh  a,[<$FF97]                 ; 0A:508D
    inc  a                          ; 0A:508F
    ldh  [<$FF97],a                 ; 0A:5090
    cp   $05                        ; 0A:5092
    jr   nz,Code0A5033              ; 0A:5094
    ret                             ; 0A:5096

Data0A5097:                         ; 0A:5097
.db $44,$00,$49,$00,$4E,$00,$E4,$00,\
    $E9,$00,$EE,$00,$84,$01,$89,$01,\
    $8E,$01
Code0A50A9:
    ld   a,[$D900]                  ; 0A:50A9
    sla  a                          ; 0A:50AC
    ld   c,a                        ; 0A:50AE
    ld   b,$00                      ; 0A:50AF
    ld   hl,AlbumPageImageIDPtrs    ; 0A:50B1
    add  hl,bc                      ; 0A:50B4
    ldi  a,[hl]                     ; 0A:50B5
    ld   h,[hl]                     ; 0A:50B6
    ld   l,a                        ; 0A:50B7
    ld   a,[hl]                     ; 0A:50B8
    ldh  [<$FF97],a                 ; 0A:50B9
    xor  a                          ; 0A:50BB
    ldh  [<$FF98],a                 ; 0A:50BC
Code0A50BE:
    ldh  a,[<$FF97]                 ; 0A:50BE
    ld   c,a                        ; 0A:50C0
    srl  a                          ; 0A:50C1
    srl  a                          ; 0A:50C3
    srl  a                          ; 0A:50C5
    ld   e,a                        ; 0A:50C7
    ld   d,$00                      ; 0A:50C8
    ld   a,c                        ; 0A:50CA
    and  $07                        ; 0A:50CB
    add  $68                        ; 0A:50CD
    ld   c,a                        ; 0A:50CF
    ld   a,$53                      ; 0A:50D0
    adc  $00                        ; 0A:50D2
    ld   b,a                        ; 0A:50D4
    ld   hl,W_AlbumUnlockFlags      ; 0A:50D5
    add  hl,de                      ; 0A:50D8
    ld   a,[bc]                     ; 0A:50D9
    and  [hl]                       ; 0A:50DA
    jr   nz,Code0A50E3              ; 0A:50DB
    ld   a,$04                      ; 0A:50DD
    ldh  [<$FF99],a                 ; 0A:50DF
    jr   Code0A50EF                 ; 0A:50E1
Code0A50E3:
    ld   hl,W_AlbumViewFlags        ; 0A:50E3
    add  hl,de                      ; 0A:50E6
    ld   a,[bc]                     ; 0A:50E7
    and  [hl]                       ; 0A:50E8
    jr   nz,Code0A5118              ; 0A:50E9
    ld   a,$05                      ; 0A:50EB
    ldh  [<$FF99],a                 ; 0A:50ED
Code0A50EF:
    ldh  a,[<$FF98]                 ; 0A:50EF
    sla  a                          ; 0A:50F1
    ld   c,a                        ; 0A:50F3
    ld   b,$00                      ; 0A:50F4
    ld   hl,Data0A5097              ; 0A:50F6
    add  hl,bc                      ; 0A:50F9
    ldi  a,[hl]                     ; 0A:50FA
    add  $40                        ; 0A:50FB
    ld   e,a                        ; 0A:50FD
    ld   a,[hl]                     ; 0A:50FE
    adc  $D2                        ; 0A:50FF
    ld   h,a                        ; 0A:5101
    ld   l,e                        ; 0A:5102
    ldh  a,[<$FF99]                 ; 0A:5103
    ld   e,a                        ; 0A:5105
    ld   c,$03                      ; 0A:5106
Code0A5108:
    ld   a,e                        ; 0A:5108
    ldi  [hl],a                     ; 0A:5109
    ldi  [hl],a                     ; 0A:510A
    ldi  [hl],a                     ; 0A:510B
    ldi  [hl],a                     ; 0A:510C
    ld   a,l                        ; 0A:510D
    add  $1C                        ; 0A:510E
    ld   l,a                        ; 0A:5110
    ld   a,h                        ; 0A:5111
    adc  $00                        ; 0A:5112
    ld   h,a                        ; 0A:5114
    dec  c                          ; 0A:5115
    jr   nz,Code0A5108              ; 0A:5116
Code0A5118:
    ldh  a,[<$FF97]                 ; 0A:5118
    inc  a                          ; 0A:511A
    ldh  [<$FF97],a                 ; 0A:511B
    ldh  a,[<$FF98]                 ; 0A:511D
    inc  a                          ; 0A:511F
    ldh  [<$FF98],a                 ; 0A:5120
    cp   $09                        ; 0A:5122
    jr   nz,Code0A50BE              ; 0A:5124
    ret                             ; 0A:5126

Data0A5127:                         ; 0A:5127
.db $64,$00,$24,$01,$6B,$00,$2B,$01
Code0A512F:
    ld   a,[$D900]                  ; 0A:512F
    sla  a                          ; 0A:5132
    ld   c,a                        ; 0A:5134
    ld   b,$00                      ; 0A:5135
    ld   hl,AlbumPageImageIDPtrs    ; 0A:5137
    add  hl,bc                      ; 0A:513A
    ldi  a,[hl]                     ; 0A:513B
    ld   h,[hl]                     ; 0A:513C
    ld   l,a                        ; 0A:513D
    ld   a,[hl]                     ; 0A:513E
    ldh  [<$FF97],a                 ; 0A:513F
    xor  a                          ; 0A:5141
    ldh  [<$FF98],a                 ; 0A:5142
Code0A5144:
    ldh  a,[<$FF97]                 ; 0A:5144
    ld   c,a                        ; 0A:5146
    srl  a                          ; 0A:5147
    srl  a                          ; 0A:5149
    srl  a                          ; 0A:514B
    ld   e,a                        ; 0A:514D
    ld   d,$00                      ; 0A:514E
    ld   a,c                        ; 0A:5150
    and  $07                        ; 0A:5151
    add  $68                        ; 0A:5153
    ld   c,a                        ; 0A:5155
    ld   a,$53                      ; 0A:5156
    adc  $00                        ; 0A:5158
    ld   b,a                        ; 0A:515A
    ld   hl,W_AlbumUnlockFlags      ; 0A:515B
    add  hl,de                      ; 0A:515E
    ld   a,[bc]                     ; 0A:515F
    and  [hl]                       ; 0A:5160
    jr   nz,Code0A5169              ; 0A:5161
    ld   a,$04                      ; 0A:5163
    ldh  [<$FF99],a                 ; 0A:5165
    jr   Code0A5175                 ; 0A:5167
Code0A5169:
    ld   hl,W_AlbumViewFlags        ; 0A:5169
    add  hl,de                      ; 0A:516C
    ld   a,[bc]                     ; 0A:516D
    and  [hl]                       ; 0A:516E
    jr   nz,Code0A51A1              ; 0A:516F
    ld   a,$05                      ; 0A:5171
    ldh  [<$FF99],a                 ; 0A:5173
Code0A5175:
    ldh  a,[<$FF98]                 ; 0A:5175
    sla  a                          ; 0A:5177
    ld   c,a                        ; 0A:5179
    ld   b,$00                      ; 0A:517A
    ld   hl,Data0A5127              ; 0A:517C
    add  hl,bc                      ; 0A:517F
    ldi  a,[hl]                     ; 0A:5180
    add  $40                        ; 0A:5181
    ld   e,a                        ; 0A:5183
    ld   a,[hl]                     ; 0A:5184
    adc  $D2                        ; 0A:5185
    ld   h,a                        ; 0A:5187
    ld   l,e                        ; 0A:5188
    ldh  a,[<$FF99]                 ; 0A:5189
    ld   e,a                        ; 0A:518B
    ld   c,$06                      ; 0A:518C
Code0A518E:
    ld   a,e                        ; 0A:518E
    ldi  [hl],a                     ; 0A:518F
    ldi  [hl],a                     ; 0A:5190
    ldi  [hl],a                     ; 0A:5191
    ldi  [hl],a                     ; 0A:5192
    ldi  [hl],a                     ; 0A:5193
    ldi  [hl],a                     ; 0A:5194
    ldi  [hl],a                     ; 0A:5195
    ld   a,l                        ; 0A:5196
    add  $19                        ; 0A:5197
    ld   l,a                        ; 0A:5199
    ld   a,h                        ; 0A:519A
    adc  $00                        ; 0A:519B
    ld   h,a                        ; 0A:519D
    dec  c                          ; 0A:519E
    jr   nz,Code0A518E              ; 0A:519F
Code0A51A1:
    ldh  a,[<$FF97]                 ; 0A:51A1
    inc  a                          ; 0A:51A3
    ldh  [<$FF97],a                 ; 0A:51A4
    ldh  a,[<$FF98]                 ; 0A:51A6
    inc  a                          ; 0A:51A8
    ldh  [<$FF98],a                 ; 0A:51A9
    cp   $04                        ; 0A:51AB
    jr   nz,Code0A5144              ; 0A:51AD
    ret                             ; 0A:51AF

Sub0A51B0:
    ld   a,$17                      ; 0A:51B0
    ld   [$C415],a                  ; 0A:51B2
    ld   a,[$D900]                  ; 0A:51B5
    rst  $00                        ; 0A:51B8  Execute from 16-bit pointer table
.dw Code0A51C3                      ; 0A:51B9
.dw Code0A5228                      ; 0A:51BB
.dw Code0A5228                      ; 0A:51BD
.dw Code0A52B2                      ; 0A:51BF
.dw Code0A52B2                      ; 0A:51C1

Code0A51C3:
    xor  a                          ; 0A:51C3
    ldh  [<$FF97],a                 ; 0A:51C4
Code0A51C6:
    ldh  a,[<$FF97]                 ; 0A:51C6
    ld   c,a                        ; 0A:51C8
    sla  a                          ; 0A:51C9
    add  c                          ; 0A:51CB
    ld   e,$00                      ; 0A:51CC
    srl  a                          ; 0A:51CE
    rr   e                          ; 0A:51D0
    add  $90                        ; 0A:51D2
    ldh  [<$FF9A],a                 ; 0A:51D4
    ld   a,e                        ; 0A:51D6
    ldh  [<$FF99],a                 ; 0A:51D7
    ld   a,c                        ; 0A:51D9
    srl  a                          ; 0A:51DA
    srl  a                          ; 0A:51DC
    srl  a                          ; 0A:51DE
    ld   e,a                        ; 0A:51E0
    ld   d,$00                      ; 0A:51E1
    ld   a,c                        ; 0A:51E3
    and  $07                        ; 0A:51E4
    add  $68                        ; 0A:51E6
    ld   c,a                        ; 0A:51E8
    ld   a,$53                      ; 0A:51E9
    adc  $00                        ; 0A:51EB
    ld   b,a                        ; 0A:51ED
    ld   hl,W_AlbumUnlockFlags      ; 0A:51EE
    add  hl,de                      ; 0A:51F1
    ld   a,[bc]                     ; 0A:51F2
    and  [hl]                       ; 0A:51F3
    jr   nz,Code0A5200              ; 0A:51F4
    ld   hl,Data0A7000              ; 0A:51F6
    ld   a,$17                      ; 0A:51F9
    ld   [$C415],a                  ; 0A:51FB
    jr   Code0A5210                 ; 0A:51FE
Code0A5200:
    ld   hl,W_AlbumViewFlags        ; 0A:5200
    add  hl,de                      ; 0A:5203
    ld   a,[bc]                     ; 0A:5204
    and  [hl]                       ; 0A:5205
    jr   nz,Code0A521E              ; 0A:5206
    ld   hl,Data177200              ; 0A:5208
    ld   a,$17                      ; 0A:520B
    ld   [$C415],a                  ; 0A:520D
Code0A5210:
    ldh  a,[<$FF99]                 ; 0A:5210
    ld   e,a                        ; 0A:5212
    ldh  a,[<$FF9A]                 ; 0A:5213
    ld   d,a                        ; 0A:5215
    ld   bc,$0180                   ; 0A:5216
    ld   a,$0A                      ; 0A:5219
    call CopyBytesLong              ; 0A:521B
Code0A521E:
    ldh  a,[<$FF97]                 ; 0A:521E
    inc  a                          ; 0A:5220
    ldh  [<$FF97],a                 ; 0A:5221
    cp   $05                        ; 0A:5223
    jr   nz,Code0A51C6              ; 0A:5225
    ret                             ; 0A:5227

Code0A5228:
    ld   a,[$D900]                  ; 0A:5228
    sla  a                          ; 0A:522B
    ld   c,a                        ; 0A:522D
    ld   b,$00                      ; 0A:522E
    ld   hl,AlbumPageImageIDPtrs    ; 0A:5230
    add  hl,bc                      ; 0A:5233
    ldi  a,[hl]                     ; 0A:5234
    ld   h,[hl]                     ; 0A:5235
    ld   l,a                        ; 0A:5236
    ld   a,[hl]                     ; 0A:5237
    ldh  [<$FF97],a                 ; 0A:5238
    xor  a                          ; 0A:523A
    ldh  [<$FF98],a                 ; 0A:523B
Code0A523D:
    ldh  a,[<$FF98]                 ; 0A:523D
    ld   c,a                        ; 0A:523F
    sla  a                          ; 0A:5240
    add  c                          ; 0A:5242
    ld   e,$00                      ; 0A:5243
    srl  a                          ; 0A:5245
    rr   e                          ; 0A:5247
    srl  a                          ; 0A:5249
    rr   e                          ; 0A:524B
    add  $90                        ; 0A:524D
    ldh  [<$FF9A],a                 ; 0A:524F
    ld   a,e                        ; 0A:5251
    ldh  [<$FF99],a                 ; 0A:5252
    ldh  a,[<$FF97]                 ; 0A:5254
    ld   c,a                        ; 0A:5256
    srl  a                          ; 0A:5257
    srl  a                          ; 0A:5259
    srl  a                          ; 0A:525B
    ld   e,a                        ; 0A:525D
    ld   d,$00                      ; 0A:525E
    ld   a,c                        ; 0A:5260
    and  $07                        ; 0A:5261
    add  $68                        ; 0A:5263
    ld   c,a                        ; 0A:5265
    ld   a,$53                      ; 0A:5266
    adc  $00                        ; 0A:5268
    ld   b,a                        ; 0A:526A
    ld   hl,W_AlbumUnlockFlags      ; 0A:526B
    add  hl,de                      ; 0A:526E
    ld   a,[bc]                     ; 0A:526F
    and  [hl]                       ; 0A:5270
    jr   nz,Code0A527D              ; 0A:5271
    ld   hl,Data177400              ; 0A:5273
    ld   a,$17                      ; 0A:5276
    ld   [$C415],a                  ; 0A:5278
    jr   Code0A528D                 ; 0A:527B
Code0A527D:
    ld   hl,W_AlbumViewFlags        ; 0A:527D
    add  hl,de                      ; 0A:5280
    ld   a,[bc]                     ; 0A:5281
    and  [hl]                       ; 0A:5282
    jr   nz,Code0A529B              ; 0A:5283
    ld   hl,Data177500              ; 0A:5285
    ld   a,$17                      ; 0A:5288
    ld   [$C415],a                  ; 0A:528A
Code0A528D:
    ldh  a,[<$FF99]                 ; 0A:528D
    ld   e,a                        ; 0A:528F
    ldh  a,[<$FF9A]                 ; 0A:5290
    ld   d,a                        ; 0A:5292
    ld   bc,$00C0                   ; 0A:5293
    ld   a,$0A                      ; 0A:5296
    call CopyBytesLong              ; 0A:5298
Code0A529B:
    ldh  a,[<$FF97]                 ; 0A:529B
    inc  a                          ; 0A:529D
    ldh  [<$FF97],a                 ; 0A:529E
    ldh  a,[<$FF98]                 ; 0A:52A0
    inc  a                          ; 0A:52A2
    ldh  [<$FF98],a                 ; 0A:52A3
    cp   $09                        ; 0A:52A5
    jr   nz,Code0A523D              ; 0A:52A7
    ret                             ; 0A:52A9

Data0A52AA:                         ; 0A:52AA
.db $00,$90,$A0,$92,$40,$95,$00,$88
Code0A52B2:
    ld   a,[$D900]                  ; 0A:52B2
    sla  a                          ; 0A:52B5
    ld   c,a                        ; 0A:52B7
    ld   b,$00                      ; 0A:52B8
    ld   hl,AlbumPageImageIDPtrs    ; 0A:52BA
    add  hl,bc                      ; 0A:52BD
    ldi  a,[hl]                     ; 0A:52BE
    ld   h,[hl]                     ; 0A:52BF
    ld   l,a                        ; 0A:52C0
    ld   a,[hl]                     ; 0A:52C1
    ldh  [<$FF97],a                 ; 0A:52C2
    xor  a                          ; 0A:52C4
    ldh  [<$FF98],a                 ; 0A:52C5
Code0A52C7:
    ldh  a,[<$FF98]                 ; 0A:52C7
    sla  a                          ; 0A:52C9
    ld   c,a                        ; 0A:52CB
    ld   b,$00                      ; 0A:52CC
    ld   hl,Data0A52AA              ; 0A:52CE
    add  hl,bc                      ; 0A:52D1
    ldi  a,[hl]                     ; 0A:52D2
    ldh  [<$FF99],a                 ; 0A:52D3
    ld   a,[hl]                     ; 0A:52D5
    ldh  [<$FF9A],a                 ; 0A:52D6
    ldh  a,[<$FF97]                 ; 0A:52D8
    ld   c,a                        ; 0A:52DA
    srl  a                          ; 0A:52DB
    srl  a                          ; 0A:52DD
    srl  a                          ; 0A:52DF
    ld   e,a                        ; 0A:52E1
    ld   d,$00                      ; 0A:52E2
    ld   a,c                        ; 0A:52E4
    and  $07                        ; 0A:52E5
    add  $68                        ; 0A:52E7
    ld   c,a                        ; 0A:52E9
    ld   a,$53                      ; 0A:52EA
    adc  $00                        ; 0A:52EC
    ld   b,a                        ; 0A:52EE
    ld   hl,W_AlbumUnlockFlags      ; 0A:52EF
    add  hl,de                      ; 0A:52F2
    ld   a,[bc]                     ; 0A:52F3
    and  [hl]                       ; 0A:52F4
    jr   nz,Code0A5301              ; 0A:52F5
    ld   hl,Data177600              ; 0A:52F7
    ld   a,$17                      ; 0A:52FA
    ld   [$C415],a                  ; 0A:52FC
    jr   Code0A5344                 ; 0A:52FF
Code0A5301:
    ld   hl,W_AlbumViewFlags        ; 0A:5301
    add  hl,de                      ; 0A:5304
    ld   a,[bc]                     ; 0A:5305
    and  [hl]                       ; 0A:5306
    jr   nz,Code0A5313              ; 0A:5307
    ld   hl,Data177900              ; 0A:5309
    ld   a,$17                      ; 0A:530C
    ld   [$C415],a                  ; 0A:530E
    jr   Code0A5344                 ; 0A:5311
Code0A5313:
    ldh  a,[<$FF98]                 ; 0A:5313
    ld   d,a                        ; 0A:5315
    sla  a                          ; 0A:5316
    sla  a                          ; 0A:5318
    add  d                          ; 0A:531A
    sla  a                          ; 0A:531B
    sla  a                          ; 0A:531D
    add  d                          ; 0A:531F
    ld   e,$00                      ; 0A:5320
    srl  a                          ; 0A:5322
    rr   e                          ; 0A:5324
    srl  a                          ; 0A:5326
    rr   e                          ; 0A:5328
    srl  a                          ; 0A:532A
    rr   e                          ; 0A:532C
    ld   d,a                        ; 0A:532E
    ld   a,[$D900]                  ; 0A:532F
    sla  a                          ; 0A:5332
    ld   c,a                        ; 0A:5334
    ld   b,$00                      ; 0A:5335
    ld   hl,DataPtrs0A4E9A          ; 0A:5337
    add  hl,bc                      ; 0A:533A
    ld   a,$21                      ; 0A:533B
    ld   [$C415],a                  ; 0A:533D
    ldi  a,[hl]                     ; 0A:5340
    ld   h,[hl]                     ; 0A:5341
    ld   l,a                        ; 0A:5342
    add  hl,de                      ; 0A:5343
Code0A5344:
    ldh  a,[<$FF99]                 ; 0A:5344
    ld   e,a                        ; 0A:5346
    ldh  a,[<$FF9A]                 ; 0A:5347
    ld   d,a                        ; 0A:5349
    ld   bc,$02A0                   ; 0A:534A
    ld   a,$0A                      ; 0A:534D
    call CopyBytesLong              ; 0A:534F
    ldh  a,[<$FF97]                 ; 0A:5352
    inc  a                          ; 0A:5354
    ldh  [<$FF97],a                 ; 0A:5355
    ldh  a,[<$FF98]                 ; 0A:5357
    inc  a                          ; 0A:5359
    ldh  [<$FF98],a                 ; 0A:535A
    cp   $04                        ; 0A:535C
    jp   nz,Code0A52C7              ; 0A:535E
    ret                             ; 0A:5361

Data0A5362:                         ; 0A:5362
.db $FF,$01
Data0A5364:                         ; 0A:5364
.db $00,$04
Data0A5366:                         ; 0A:5366
.db $00,$10
BitTable8Desc:                      ; 0A:5368
.db $80,$40,$20,$10,$08,$04,$02,$01
Data0A5370:                         ; 0A:5370
.db $E4,$E5,$E6,$E7,$DF,$DF,$E8,$E9,\
    $DF,$DF,$E8,$EA,$DF,$DF,$E8,$EA,\
    $DF,$DF,$E8,$EA,$DF,$DF,$E8,$EA,\
    $DF,$DF,$E8,$EA,$DF,$DF,$E8,$EA,\
    $DF,$DF,$E8,$EA,$DF,$DF,$E8,$EA,\
    $DF,$DF,$E8,$EA,$DF,$DF,$E8,$EA,\
    $DF,$DF,$E8,$EA,$DF,$DF,$E8,$EA,\
    $DF,$DF,$EB,$EC,$DF,$DF,$ED,$EE,\
    $EF,$F0,$F1,$F2
Data0A53B4:                         ; 0A:53B4
.db $07,$07,$07,$07,$07,$07,$07,$07,\
    $07,$07,$07,$07,$07,$07,$07,$07,\
    $07,$07,$07,$07,$07,$07,$07,$07,\
    $07,$07,$07,$07,$07,$07,$07,$07,\
    $07,$07,$07,$07,$07,$07,$07,$07,\
    $07,$07,$07,$07,$07,$07,$07,$07,\
    $07,$07,$07,$07,$07,$07,$07,$07,\
    $07,$07,$07,$07,$07,$07,$07,$07,\
    $07,$07,$07,$07

Code0A53F8:
; Album substate 2
    ldh  a,[<H_ButtonsPressed]      ; 0A:53F8
    bit  1,a                        ; 0A:53FA
    jr   z,Code0A540B               ; 0A:53FC
    ld   a,$63                      ; 0A:53FE
    ldh  [<$FFF2],a                 ; 0A:5400
    ld   a,$18                      ; 0A:5402
    ldh  [<H_GameState],a           ; 0A:5404
    xor  a                          ; 0A:5406
    ld   [$C0C1],a                  ; 0A:5407
    ret                             ; 0A:540A

Code0A540B:
    bit  0,a                        ; 0A:540B
    jp   z,Code0A549F               ; 0A:540D
    ld   a,[$D927]                  ; 0A:5410
    cp   $03                        ; 0A:5413
    jr   z,Code0A5442               ; 0A:5415
    ld   a,[$D90F]                  ; 0A:5417
    srl  a                          ; 0A:541A
    srl  a                          ; 0A:541C
    srl  a                          ; 0A:541E
    add  $29                        ; 0A:5420
    ld   e,a                        ; 0A:5422
    ld   a,$C4                      ; 0A:5423
    adc  $00                        ; 0A:5425
    ld   d,a                        ; 0A:5427
    ld   a,[$D90F]                  ; 0A:5428
    and  $07                        ; 0A:542B
    ld   c,a                        ; 0A:542D
    ld   b,$00                      ; 0A:542E
    ld   hl,BitTable8Desc           ; 0A:5430
    add  hl,bc                      ; 0A:5433
    ld   a,[de]                     ; 0A:5434
    and  [hl]                       ; 0A:5435
    jr   nz,Code0A5479              ; 0A:5436
    xor  a                          ; 0A:5438
    ldh  [<$FFF2],a                 ; 0A:5439
    ld   a,$30                      ; 0A:543B
    ldh  [<$FFF3],a                 ; 0A:543D
    jp   Code0A5C31                 ; 0A:543F
Code0A5442:
    ld   a,[$D90D]                  ; 0A:5442
    sla  a                          ; 0A:5445
    ld   e,a                        ; 0A:5447
    ld   a,[$D900]                  ; 0A:5448
    sla  a                          ; 0A:544B
    ld   c,a                        ; 0A:544D
    ld   b,$00                      ; 0A:544E
    ld   hl,AlbumPageImageIDPtrs    ; 0A:5450
    add  hl,bc                      ; 0A:5453
    ldi  a,[hl]                     ; 0A:5454
    ld   h,[hl]                     ; 0A:5455
    ld   l,a                        ; 0A:5456
    ld   a,[hl]                     ; 0A:5457
    add  e                          ; 0A:5458
    ld   c,a                        ; 0A:5459
    and  $07                        ; 0A:545A
    ld   e,a                        ; 0A:545C
    ld   d,$00                      ; 0A:545D
    ld   hl,BitTable8Desc           ; 0A:545F
    add  hl,de                      ; 0A:5462
    ld   a,c                        ; 0A:5463
    srl  a                          ; 0A:5464
    srl  a                          ; 0A:5466
    srl  a                          ; 0A:5468
    add  $2D                        ; 0A:546A
    ld   e,a                        ; 0A:546C
    ld   a,$C4                      ; 0A:546D
    adc  $00                        ; 0A:546F
    ld   d,a                        ; 0A:5471
    ld   a,[de]                     ; 0A:5472
    or   [hl]                       ; 0A:5473
    ld   [de],a                     ; 0A:5474
    inc  c                          ; 0A:5475
    ld   a,c                        ; 0A:5476
    jr   Code0A547D                 ; 0A:5477
Code0A5479:
    ld   a,[$D90F]                  ; 0A:5479
    ld   c,a                        ; 0A:547C
Code0A547D:
    srl  a                          ; 0A:547D
    srl  a                          ; 0A:547F
    srl  a                          ; 0A:5481
    add  $2D                        ; 0A:5483
    ld   e,a                        ; 0A:5485
    ld   a,$C4                      ; 0A:5486
    adc  $00                        ; 0A:5488
    ld   d,a                        ; 0A:548A
    ld   a,c                        ; 0A:548B
    and  $07                        ; 0A:548C
    ld   c,a                        ; 0A:548E
    ld   b,$00                      ; 0A:548F
    ld   hl,BitTable8Desc           ; 0A:5491
    add  hl,bc                      ; 0A:5494
    ld   a,[de]                     ; 0A:5495
    or   [hl]                       ; 0A:5496
    ld   [de],a                     ; 0A:5497
    ld   a,$04                      ; 0A:5498
    ldh  [<H_GameSubstate],a        ; 0A:549A
    jp   Sub0010A9                  ; 0A:549C
Code0A549F:
    ld   a,[$D927]                  ; 0A:549F
    cp   $03                        ; 0A:54A2
    jr   z,Code0A54F2               ; 0A:54A4
    ldh  a,[<H_ButtonsPressed]      ; 0A:54A6
    and  $C0                        ; 0A:54A8
    jr   nz,Code0A54C0              ; 0A:54AA
    ld   a,[$D90C]                  ; 0A:54AC
    and  a                          ; 0A:54AF
    jr   z,Code0A54B9               ; 0A:54B0
    dec  a                          ; 0A:54B2
    ld   [$D90C],a                  ; 0A:54B3
    jp   Code0A5C31                 ; 0A:54B6
Code0A54B9:
    ldh  a,[<H_ButtonsHeld]         ; 0A:54B9
    and  $C0                        ; 0A:54BB
    jp   z,Code0A54F2               ; 0A:54BD
Code0A54C0:
    and  $80                        ; 0A:54C0
    rlca                            ; 0A:54C2
    ld   c,a                        ; 0A:54C3
    ld   b,$00                      ; 0A:54C4
    ld   a,[$D900]                  ; 0A:54C6
    sla  a                          ; 0A:54C9
    ld   e,a                        ; 0A:54CB
    ld   d,b                        ; 0A:54CC
    ld   hl,Data0A565C              ; 0A:54CD
    add  hl,bc                      ; 0A:54D0
    ld   a,[$D90E]                  ; 0A:54D1
    add  [hl]                       ; 0A:54D4
    ld   hl,Data0A5668              ; 0A:54D5
    add  hl,de                      ; 0A:54D8
    add  hl,bc                      ; 0A:54D9
    cp   [hl]                       ; 0A:54DA
    jr   nz,Code0A54E3              ; 0A:54DB
    ld   hl,Data0A567C              ; 0A:54DD
    add  hl,de                      ; 0A:54E0
    add  hl,bc                      ; 0A:54E1
    ld   a,[hl]                     ; 0A:54E2
Code0A54E3:
    ld   [$D90E],a                  ; 0A:54E3
    ld   a,$47                      ; 0A:54E6
    ldh  [<$FFF2],a                 ; 0A:54E8
    ld   a,$08                      ; 0A:54EA
    ld   [$D90C],a                  ; 0A:54EC
    jp   Code0A5C31                 ; 0A:54EF
Code0A54F2:
    ldh  a,[<H_ButtonsPressed]      ; 0A:54F2
    and  $30                        ; 0A:54F4
    jr   nz,Code0A550C              ; 0A:54F6
    ld   a,[$D90C]                  ; 0A:54F8
    and  a                          ; 0A:54FB
    jr   z,Code0A5505               ; 0A:54FC
    dec  a                          ; 0A:54FE
    ld   [$D90C],a                  ; 0A:54FF
    jp   Code0A5C31                 ; 0A:5502
Code0A5505:
    ldh  a,[<H_ButtonsHeld]         ; 0A:5505
    and  $30                        ; 0A:5507
    jp   z,Code0A5596               ; 0A:5509
Code0A550C:
    and  $10                        ; 0A:550C
    swap a                          ; 0A:550E
    ld   c,a                        ; 0A:5510
    ld   b,$00                      ; 0A:5511
    ld   a,$08                      ; 0A:5513
    ld   [$D90C],a                  ; 0A:5515
    ld   a,[$D900]                  ; 0A:5518
    sla  a                          ; 0A:551B
    ld   e,a                        ; 0A:551D
    ld   d,b                        ; 0A:551E
    ld   hl,Data0A565C              ; 0A:551F
    add  hl,bc                      ; 0A:5522
    ld   a,[$D90D]                  ; 0A:5523
    add  [hl]                       ; 0A:5526
    ld   hl,Data0A565E              ; 0A:5527
    add  hl,de                      ; 0A:552A
    add  hl,bc                      ; 0A:552B
    cp   [hl]                       ; 0A:552C
    jr   nz,Code0A558F              ; 0A:552D
    ld   a,c                        ; 0A:552F
    ld   [$D904],a                  ; 0A:5530
    ld   hl,Data0A5364              ; 0A:5533
    add  hl,bc                      ; 0A:5536
    ld   a,[$D900]                  ; 0A:5537
    cp   [hl]                       ; 0A:553A
    jr   nz,Code0A555C              ; 0A:553B
    cp   $00                        ; 0A:553D
    jr   nz,Code0A5552              ; 0A:553F
    ld   a,[W_AlbumUnlockFlags+3]   ; 0A:5541
    and  $01                        ; 0A:5544
    jr   z,Code0A5552               ; 0A:5546
    ld   a,$05                      ; 0A:5548
    ld   [$D900],a                  ; 0A:554A
    ld   a,$0B                      ; 0A:554D
    ldh  [<H_GameSubstate],a        ; 0A:554F
    ret                             ; 0A:5551

Code0A5552:
    xor  a                          ; 0A:5552
    ldh  [<$FFF2],a                 ; 0A:5553
    ld   a,$30                      ; 0A:5555
    ldh  [<$FFF3],a                 ; 0A:5557
    jp   Code0A5C31                 ; 0A:5559
Code0A555C:
    ld   hl,Data0A5362              ; 0A:555C
    add  hl,bc                      ; 0A:555F
    add  [hl]                       ; 0A:5560
    ld   [$D900],a                  ; 0A:5561
    sla  a                          ; 0A:5564
    ld   e,a                        ; 0A:5566
    ld   c,$01                      ; 0A:5567
    ld   hl,Data0A5668              ; 0A:5569
    add  hl,de                      ; 0A:556C
    add  hl,bc                      ; 0A:556D
    ld   a,[$D90E]                  ; 0A:556E
    cp   [hl]                       ; 0A:5571
    jr   z,Code0A5576               ; 0A:5572
    jr   c,Code0A557B               ; 0A:5574
Code0A5576:
    ld   a,[hl]                     ; 0A:5576
    dec  a                          ; 0A:5577
    ld   [$D90E],a                  ; 0A:5578
Code0A557B:
    ld   a,[$D904]                  ; 0A:557B
    ld   c,a                        ; 0A:557E
    ld   hl,Data0A5672              ; 0A:557F
    add  hl,bc                      ; 0A:5582
    add  hl,de                      ; 0A:5583
    ld   a,[hl]                     ; 0A:5584
    ld   [$D90D],a                  ; 0A:5585
    ld   a,$46                      ; 0A:5588
    ldh  [<$FFF4],a                 ; 0A:558A
    jp   Code0A5599                 ; 0A:558C
Code0A558F:
    ld   [$D90D],a                  ; 0A:558F
    ld   a,$47                      ; 0A:5592
    ldh  [<$FFF2],a                 ; 0A:5594
Code0A5596:
    jp   Code0A5C31                 ; 0A:5596
Code0A5599:
    ld   hl,$D000                   ; 0A:5599
    ld   de,$D240                   ; 0A:559C
    ld   bc,$0240                   ; 0A:559F
Code0A55A2:
    ld   a,[hl]                     ; 0A:55A2
    cp   $AA                        ; 0A:55A3
    jr   nc,Code0A55AC              ; 0A:55A5
    ld   a,$DF                      ; 0A:55A7
    ld   [hl],a                     ; 0A:55A9
    xor  a                          ; 0A:55AA
    ld   [de],a                     ; 0A:55AB
Code0A55AC:
    inc  hl                         ; 0A:55AC
    inc  de                         ; 0A:55AD
    dec  bc                         ; 0A:55AE
    ld   a,b                        ; 0A:55AF
    or   c                          ; 0A:55B0
    jr   nz,Code0A55A2              ; 0A:55B1
    ld   a,[$D904]                  ; 0A:55B3
    ld   c,a                        ; 0A:55B6
    ld   hl,Data0A5366              ; 0A:55B7
    add  hl,bc                      ; 0A:55BA
    ld   c,[hl]                     ; 0A:55BB
    ld   hl,$D000                   ; 0A:55BC
    add  hl,bc                      ; 0A:55BF
    ld   de,Data0A5370              ; 0A:55C0
    ld   b,$11                      ; 0A:55C3
Code0A55C5:
    ld   a,[de]                     ; 0A:55C5
    ldi  [hl],a                     ; 0A:55C6
    inc  de                         ; 0A:55C7
    ld   a,[de]                     ; 0A:55C8
    ldi  [hl],a                     ; 0A:55C9
    inc  de                         ; 0A:55CA
    ld   a,[de]                     ; 0A:55CB
    ldi  [hl],a                     ; 0A:55CC
    inc  de                         ; 0A:55CD
    ld   a,[de]                     ; 0A:55CE
    ldi  [hl],a                     ; 0A:55CF
    inc  de                         ; 0A:55D0
    ld   a,l                        ; 0A:55D1
    add  $1C                        ; 0A:55D2
    ld   l,a                        ; 0A:55D4
    ld   a,h                        ; 0A:55D5
    adc  $00                        ; 0A:55D6
    ld   h,a                        ; 0A:55D8
    dec  b                          ; 0A:55D9
    jr   nz,Code0A55C5              ; 0A:55DA
    ld   a,[$D904]                  ; 0A:55DC
    ld   c,a                        ; 0A:55DF
    ld   hl,Data0A5366              ; 0A:55E0
    add  hl,bc                      ; 0A:55E3
    ld   c,[hl]                     ; 0A:55E4
    ld   hl,$D240                   ; 0A:55E5
    add  hl,bc                      ; 0A:55E8
    ld   de,Data0A53B4              ; 0A:55E9
    ld   b,$11                      ; 0A:55EC
Code0A55EE:
    ld   a,[de]                     ; 0A:55EE
    ldi  [hl],a                     ; 0A:55EF
    inc  de                         ; 0A:55F0
    ld   a,[de]                     ; 0A:55F1
    ldi  [hl],a                     ; 0A:55F2
    inc  de                         ; 0A:55F3
    ld   a,[de]                     ; 0A:55F4
    ldi  [hl],a                     ; 0A:55F5
    inc  de                         ; 0A:55F6
    ld   a,[de]                     ; 0A:55F7
    ldi  [hl],a                     ; 0A:55F8
    inc  de                         ; 0A:55F9
    ld   a,l                        ; 0A:55FA
    add  $1C                        ; 0A:55FB
    ld   l,a                        ; 0A:55FD
    ld   a,h                        ; 0A:55FE
    adc  $00                        ; 0A:55FF
    ld   h,a                        ; 0A:5601
    dec  b                          ; 0A:5602
    jr   nz,Code0A55EE              ; 0A:5603
    ld   a,$01                      ; 0A:5605
    ld   [$C423],a                  ; 0A:5607
    ld   a,$00                      ; 0A:560A
    ld   [$C425],a                  ; 0A:560C
    ld   a,$D0                      ; 0A:560F
    ld   [$C426],a                  ; 0A:5611
    ld   a,$40                      ; 0A:5614
    ld   [$C427],a                  ; 0A:5616
    ld   a,$D2                      ; 0A:5619
    ld   [$C428],a                  ; 0A:561B
    xor  a                          ; 0A:561E
    ld   [$D902],a                  ; 0A:561F
    ld   [$D903],a                  ; 0A:5622
    jp   Sub0A4EC1                  ; 0A:5625

AlbumPage1ImageIDs:                 ; 0A:5628
.db $00,$01,$02,$03,$01,$04
AlbumPage2ImageIDs:                 ; 0A:562E
.db $05,$06,$07,$08,$09,$0A,$0B,$0C,\
    $0D
AlbumPage3ImageIDs:                 ; 0A:5637
.db $0E,$0F,$10,$11,$12,$13,$14,$15,\
    $16
AlbumPage4ImageIDs:                 ; 0A:5640
.db $17,$19,$18,$1A
AlbumPage5ImageIDs:                 ; 0A:5644
.db $1B,$1D,$1C,$1E
AlbumPageImageIDPtrs:               ; 0A:5648
.dw AlbumPage1ImageIDs, AlbumPage2ImageIDs, AlbumPage3ImageIDs, AlbumPage4ImageIDs,\
    AlbumPage5ImageIDs
AlbumPageColumnsRows:               ; 0A:5652
.db $03,$03,$03,$02,$02
.db $02,$03,$03,$02,$02
Data0A565C:                         ; 0A:565C
.db $FF,$01
Data0A565E:                         ; 0A:565E
.db $FF,$03,$FF,$03,$FF,$03,$FF,$02,\
    $FF,$02
Data0A5668:                         ; 0A:5668
.db $FF,$02,$FF,$03,$FF,$03,$FF,$02,\
    $FF,$02
Data0A5672:                         ; 0A:5672
.db $02,$00,$02,$00,$02,$00,$01,$00,\
    $01,$00
Data0A567C:                         ; 0A:567C
.db $01,$00,$02,$00,$02,$00,$01,$00,\
    $01,$00
Data0A5686:                         ; 0A:5686
.db $10,$08,$12,$20,$10,$10,$0C,$00,\
    $10,$18,$0A,$00,$10,$20,$0C,$00,\
    $10,$28,$0A,$00,$10,$30,$08,$20,\
    $20,$08,$14,$20,$20,$30,$0E,$20,\
    $30,$08,$14,$20,$30,$30,$0E,$20,\
    $40,$08,$12,$60,$40,$10,$0C,$40,\
    $40,$18,$0A,$40,$40,$20,$0C,$40,\
    $40,$28,$0A,$40,$40,$30,$08,$60
Data0A56C6:                         ; 0A:56C6
.db $10,$08,$18,$00,$10,$10,$02,$20,\
    $10,$18,$02,$00,$10,$20,$02,$20,\
    $10,$28,$02,$00,$10,$30,$18,$20,\
    $20,$08,$04,$40,$20,$30,$04,$60,\
    $30,$08,$04,$40,$30,$30,$04,$60,\
    $40,$08,$00,$40,$40,$10,$02,$40,\
    $40,$18,$02,$60,$40,$20,$02,$40,\
    $40,$28,$02,$60,$40,$30,$00,$60
Data0A5706:                         ; 0A:5706
.db $10,$08,$08,$00,$10,$10,$0A,$00,\
    $10,$18,$0C,$00,$10,$20,$0A,$00,\
    $10,$28,$0C,$00,$10,$30,$12,$00,\
    $20,$08,$0E,$00,$20,$30,$14,$00,\
    $30,$08,$0E,$00,$30,$30,$14,$00,\
    $40,$08,$08,$40,$40,$10,$0A,$40,\
    $40,$18,$0C,$40,$40,$20,$0A,$40,\
    $40,$28,$0C,$40,$40,$30,$12,$40
Data0A5746:                         ; 0A:5746
.db $10,$08,$00,$00,$10,$10,$02,$00,\
    $10,$18,$02,$20,$10,$20,$02,$00,\
    $10,$28,$02,$20,$10,$30,$00,$20,\
    $20,$08,$04,$00,$20,$30,$04,$20,\
    $30,$08,$04,$00,$30,$30,$04,$20,\
    $40,$08,$18,$40,$40,$10,$02,$60,\
    $40,$18,$02,$40,$40,$20,$02,$60,\
    $40,$28,$02,$40,$40,$30,$18,$60
Data0A5786:                         ; 0A:5786
.db $10,$08,$12,$20,$10,$10,$0C,$00,\
    $10,$18,$0A,$00,$10,$20,$0C,$00,\
    $10,$28,$0A,$00,$10,$30,$08,$20,\
    $20,$08,$14,$20,$20,$30,$0E,$20,\
    $30,$08,$16,$20,$28,$10,$0A,$40,\
    $28,$18,$0C,$40,$28,$20,$0A,$40,\
    $28,$28,$0C,$40,$30,$30,$10,$20
Data0A57BE:                         ; 0A:57BE
.db $10,$08,$18,$00,$10,$10,$02,$20,\
    $10,$18,$02,$00,$10,$20,$02,$20,\
    $10,$28,$02,$00,$10,$30,$18,$20,\
    $20,$08,$04,$40,$20,$30,$04,$60,\
    $30,$08,$1A,$00,$28,$10,$02,$60,\
    $28,$18,$02,$40,$28,$20,$02,$60,\
    $28,$28,$02,$40,$30,$30,$1A,$20
Data0A57F6:                         ; 0A:57F6
.db $10,$08,$08,$00,$10,$10,$0A,$00,\
    $10,$18,$0C,$00,$10,$20,$0A,$00,\
    $10,$28,$0C,$00,$10,$30,$12,$00,\
    $20,$08,$0E,$00,$20,$30,$14,$00,\
    $30,$08,$10,$00,$28,$10,$0C,$40,\
    $28,$18,$0A,$40,$28,$20,$0C,$40,\
    $28,$28,$0A,$40,$30,$30,$16,$00
Data0A582E:                         ; 0A:582E
.db $10,$08,$00,$00,$10,$10,$02,$00,\
    $10,$18,$02,$20,$10,$20,$02,$00,\
    $10,$28,$02,$20,$10,$30,$00,$20,\
    $20,$08,$04,$00,$20,$30,$04,$20,\
    $30,$08,$06,$00,$28,$10,$02,$40,\
    $28,$18,$02,$60,$28,$20,$02,$40,\
    $28,$28,$02,$60,$30,$30,$06,$20
Data0A5866:                         ; 0A:5866
.db $10,$08,$12,$20,$10,$10,$0C,$00,\
    $10,$18,$0A,$00,$10,$20,$0C,$00,\
    $10,$28,$0A,$00,$10,$30,$0C,$00,\
    $10,$38,$0A,$00,$10,$40,$0C,$00,\
    $10,$48,$12,$00,$20,$08,$14,$20,\
    $20,$48,$14,$00,$30,$08,$14,$20,\
    $30,$48,$14,$00,$40,$08,$12,$60,\
    $40,$10,$0C,$40,$40,$18,$0A,$40,\
    $40,$20,$0C,$40,$40,$28,$0A,$40,\
    $40,$30,$0C,$40,$40,$38,$0A,$40,\
    $40,$40,$0C,$40,$40,$48,$12,$40
Data0A58BE:                         ; 0A:58BE
.db $10,$08,$18,$00,$10,$10,$02,$20,\
    $10,$18,$02,$00,$10,$20,$02,$20,\
    $10,$28,$02,$00,$10,$30,$02,$20,\
    $10,$38,$02,$00,$10,$40,$02,$20,\
    $10,$48,$00,$20,$20,$08,$04,$40,\
    $20,$48,$04,$20,$30,$08,$04,$40,\
    $30,$48,$04,$20,$40,$08,$00,$40,\
    $40,$10,$02,$40,$40,$18,$02,$60,\
    $40,$20,$02,$40,$40,$28,$02,$60,\
    $40,$30,$02,$40,$40,$38,$02,$60,\
    $40,$40,$02,$40,$40,$48,$18,$60
Data0A5916:                         ; 0A:5916
.db $10,$08,$08,$00,$10,$10,$0A,$00,\
    $10,$18,$0C,$00,$10,$20,$0A,$00,\
    $10,$28,$0C,$00,$10,$30,$0A,$00,\
    $10,$38,$0C,$00,$10,$40,$0A,$00,\
    $10,$48,$08,$20,$20,$08,$0E,$00,\
    $20,$48,$0E,$20,$30,$08,$0E,$00,\
    $30,$48,$0E,$20,$40,$08,$08,$40,\
    $40,$10,$0A,$40,$40,$18,$0C,$40,\
    $40,$20,$0A,$40,$40,$28,$0C,$40,\
    $40,$30,$0A,$40,$40,$38,$0C,$40,\
    $40,$40,$0A,$40,$40,$48,$08,$60
Data0A596E:                         ; 0A:596E
.db $10,$08,$00,$00,$10,$10,$02,$00,\
    $10,$18,$02,$20,$10,$20,$02,$00,\
    $10,$28,$02,$20,$10,$30,$02,$00,\
    $10,$38,$02,$20,$10,$40,$02,$00,\
    $10,$48,$18,$20,$20,$08,$04,$00,\
    $20,$48,$04,$60,$30,$08,$04,$00,\
    $30,$48,$04,$60,$40,$08,$18,$40,\
    $40,$10,$02,$60,$40,$18,$02,$40,\
    $40,$20,$02,$60,$40,$28,$02,$40,\
    $40,$30,$02,$60,$40,$38,$02,$40,\
    $40,$40,$02,$60,$40,$48,$00,$60
Data0A59C6:                         ; 0A:59C6
.db $10,$08,$12,$20,$10,$10,$0C,$00,\
    $10,$18,$0A,$00,$10,$20,$0C,$00,\
    $10,$28,$0A,$00,$10,$30,$0C,$00,\
    $10,$38,$0A,$00,$10,$40,$0C,$00,\
    $10,$48,$12,$00,$20,$08,$14,$20,\
    $20,$48,$14,$00,$30,$08,$14,$20,\
    $30,$48,$14,$00,$40,$08,$14,$20,\
    $40,$48,$14,$00,$50,$08,$14,$20,\
    $50,$48,$14,$00,$60,$08,$14,$20,\
    $60,$48,$14,$00,$70,$08,$12,$60,\
    $70,$10,$0C,$40,$70,$18,$0A,$40,\
    $70,$20,$0C,$40,$70,$28,$0A,$40,\
    $70,$30,$0C,$40,$70,$38,$0A,$40,\
    $70,$40,$0C,$40,$70,$48,$12,$40
Data0A5A36:                         ; 0A:5A36
.db $10,$08,$18,$00,$10,$10,$02,$20,\
    $10,$18,$02,$00,$10,$20,$02,$20,\
    $10,$28,$02,$00,$10,$30,$02,$20,\
    $10,$38,$02,$00,$10,$40,$02,$20,\
    $10,$48,$00,$20,$20,$08,$04,$40,\
    $20,$48,$04,$20,$30,$08,$04,$40,\
    $30,$48,$04,$20,$40,$08,$04,$40,\
    $40,$48,$04,$20,$50,$08,$04,$40,\
    $50,$48,$04,$20,$60,$08,$04,$40,\
    $60,$48,$04,$20,$70,$08,$00,$40,\
    $70,$10,$02,$40,$70,$18,$02,$60,\
    $70,$20,$02,$40,$70,$28,$02,$60,\
    $70,$30,$02,$40,$70,$38,$02,$60,\
    $70,$40,$02,$40,$70,$48,$18,$60
Data0A5AA6:                         ; 0A:5AA6
.db $10,$08,$08,$00,$10,$10,$0A,$00,\
    $10,$18,$0C,$00,$10,$20,$0A,$00,\
    $10,$28,$0C,$00,$10,$30,$0A,$00,\
    $10,$38,$0C,$00,$10,$40,$0A,$00,\
    $10,$48,$08,$20,$20,$08,$0E,$00,\
    $20,$48,$0E,$20,$30,$08,$0E,$00,\
    $30,$48,$0E,$20,$40,$08,$0E,$00,\
    $40,$48,$0E,$20,$50,$08,$0E,$00,\
    $50,$48,$0E,$20,$60,$08,$0E,$00,\
    $60,$48,$0E,$20,$70,$08,$08,$40,\
    $70,$10,$0A,$40,$70,$18,$0C,$40,\
    $70,$20,$0A,$40,$70,$28,$0C,$40,\
    $70,$30,$0A,$40,$70,$38,$0C,$40,\
    $70,$40,$0A,$40,$70,$48,$08,$60
Data0A5B16:                         ; 0A:5B16
.db $10,$08,$00,$00,$10,$10,$02,$00,\
    $10,$18,$02,$20,$10,$20,$02,$00,\
    $10,$28,$02,$20,$10,$30,$02,$00,\
    $10,$38,$02,$20,$10,$40,$02,$00,\
    $10,$48,$18,$20,$20,$08,$04,$00,\
    $20,$48,$04,$60,$30,$08,$04,$00,\
    $30,$48,$04,$60,$40,$08,$04,$00,\
    $40,$48,$04,$60,$50,$08,$04,$00,\
    $50,$48,$04,$60,$60,$08,$04,$00,\
    $60,$48,$04,$60,$70,$08,$18,$40,\
    $70,$10,$02,$60,$70,$18,$02,$40,\
    $70,$20,$02,$60,$70,$28,$02,$40,\
    $70,$30,$02,$60,$70,$38,$02,$40,\
    $70,$40,$02,$60,$70,$48,$00,$60
DataPtrs0A5B86:                     ; 0A:5B86
.dw Data0A5686, Data0A56C6, Data0A5706, Data0A5746,\
    Data0A5786, Data0A57BE, Data0A57F6, Data0A582E,\
    Data0A5786, Data0A57BE, Data0A57F6, Data0A582E,\
    Data0A5866, Data0A58BE, Data0A5916, Data0A596E,\
    Data0A5866, Data0A58BE, Data0A5916, Data0A596E
DataPtrs0A5BAE:                     ; 0A:5BAE
.dw Data0A59C6, Data0A5A36, Data0A5AA6, Data0A5B16
Data0A5BB6:                         ; 0A:5BB6
.db $10,$0E,$0E,$16,$16
Data0A5BBB:                         ; 0A:5BBB
.db $08,$28,$08,$48,$48,$08,$08,$08,\
    $30,$30,$30,$58,$58,$58,$08,$08,\
    $08,$30,$30,$30,$58,$58,$58,$10,\
    $40,$10,$40,$10,$40,$10,$40
Data0A5BDA:                         ; 0A:5BDA
.db $18,$40,$68,$18,$68,$18,$40,$68,\
    $18,$40,$68,$18,$40,$68,$18,$40,\
    $68,$18,$40,$68,$18,$40,$68,$18,\
    $18,$50,$50,$18,$18,$50,$50
Data0A5BF9:                         ; 0A:5BF9
.dw $7DE0,$7FFF,$7D2D,$0000
Data0A5C01:                         ; 0A:5C01
.dw $7DE0,$025F,$001F,$0000
Data0A5C09:                         ; 0A:5C09
.dw $7DE0,$7FFF,$02BC,$0019
Data0A5C11:                         ; 0A:5C11
.dw $7DE0,$7FFF,$02A6,$001D
Data0A5C19:                         ; 0A:5C19
.dw $7DE0,$7FFF,$02A6,$0120
DataPtrs0A5C21:                     ; 0A:5C21
.dw Data0A5BF9, Data0A5BF9, Data0A5C01, Data0A5C01,\
    Data0A5C09, Data0A5C09, Data0A5C11, Data0A5C19

Code0A5C31:
    ld   a,[$D900]                  ; 0A:5C31
    ld   c,a                        ; 0A:5C34
    ld   b,$00                      ; 0A:5C35
    ld   hl,Data0A5BB6              ; 0A:5C37
    add  hl,bc                      ; 0A:5C3A
    ld   a,[hl]                     ; 0A:5C3B
    ldh  [<$FF97],a                 ; 0A:5C3C
    ld   hl,AlbumPageColumnsRows    ; 0A:5C3E
    add  hl,bc                      ; 0A:5C41
    ld   e,[hl]                     ; 0A:5C42
    ld   a,[$D90E]                  ; 0A:5C43
    ld   c,a                        ; 0A:5C46
    ld   d,$08                      ; 0A:5C47
    xor  a                          ; 0A:5C49
Code0A5C4A:
    sla  e                          ; 0A:5C4A
    jr   nc,Code0A5C4F              ; 0A:5C4C
    add  c                          ; 0A:5C4E
Code0A5C4F:
    sla  a                          ; 0A:5C4F
    dec  d                          ; 0A:5C51
    jr   nz,Code0A5C4A              ; 0A:5C52
    srl  a                          ; 0A:5C54
    ld   c,a                        ; 0A:5C56
    ld   a,[$D90D]                  ; 0A:5C57
    add  c                          ; 0A:5C5A
    ld   e,a                        ; 0A:5C5B
    ld   a,[$D900]                  ; 0A:5C5C
    sla  a                          ; 0A:5C5F
    ld   c,a                        ; 0A:5C61
    ld   b,$00                      ; 0A:5C62
    ld   hl,AlbumPageImageIDPtrs    ; 0A:5C64
    add  hl,bc                      ; 0A:5C67
    ldi  a,[hl]                     ; 0A:5C68
    add  e                          ; 0A:5C69
    ld   e,a                        ; 0A:5C6A
    ld   a,[hl]                     ; 0A:5C6B
    adc  $00                        ; 0A:5C6C
    ld   d,a                        ; 0A:5C6E
    ld   a,[de]                     ; 0A:5C6F
    ld   c,a                        ; 0A:5C70
    ld   b,$00                      ; 0A:5C71
    ld   [$D90F],a                  ; 0A:5C73
    ld   a,[$D900]                  ; 0A:5C76
    cp   $03                        ; 0A:5C79
    jr   c,Code0A5C83               ; 0A:5C7B
    call Sub0A5CE2                  ; 0A:5C7D
    jp   Code0A5CAF                 ; 0A:5C80
Code0A5C83:
    xor  a                          ; 0A:5C83
    ld   [$D927],a                  ; 0A:5C84
    ld   hl,Data0A5BBB              ; 0A:5C87
    add  hl,bc                      ; 0A:5C8A
    ld   e,[hl]                     ; 0A:5C8B
    ld   hl,Data0A5BDA              ; 0A:5C8C
    add  hl,bc                      ; 0A:5C8F
    ld   d,[hl]                     ; 0A:5C90
    ld   a,[$D900]                  ; 0A:5C91
    sla  a                          ; 0A:5C94
    sla  a                          ; 0A:5C96
    ld   c,a                        ; 0A:5C98
    ldh  a,[<H_GlobalTimer]         ; 0A:5C99
    srl  a                          ; 0A:5C9B
    srl  a                          ; 0A:5C9D
    and  $03                        ; 0A:5C9F
    add  c                          ; 0A:5CA1
    sla  a                          ; 0A:5CA2
    ld   c,a                        ; 0A:5CA4
    ld   hl,DataPtrs0A5B86          ; 0A:5CA5
    add  hl,bc                      ; 0A:5CA8
    ldi  a,[hl]                     ; 0A:5CA9
    ld   h,[hl]                     ; 0A:5CAA
    ld   l,a                        ; 0A:5CAB
    ld   bc,W_OAMBuffer             ; 0A:5CAC
Code0A5CAF:
    ldi  a,[hl]                     ; 0A:5CAF
    add  e                          ; 0A:5CB0
    ld   [bc],a                     ; 0A:5CB1
    inc  bc                         ; 0A:5CB2
    ldi  a,[hl]                     ; 0A:5CB3
    add  d                          ; 0A:5CB4
    ld   [bc],a                     ; 0A:5CB5
    inc  bc                         ; 0A:5CB6
    ldi  a,[hl]                     ; 0A:5CB7
    ld   [bc],a                     ; 0A:5CB8
    inc  bc                         ; 0A:5CB9
    ldi  a,[hl]                     ; 0A:5CBA
    ld   [bc],a                     ; 0A:5CBB
    inc  bc                         ; 0A:5CBC
    ldh  a,[<$FF97]                 ; 0A:5CBD
    dec  a                          ; 0A:5CBF
    ldh  [<$FF97],a                 ; 0A:5CC0
    jr   nz,Code0A5CAF              ; 0A:5CC2
Code0A5CC4:
    ldh  a,[<H_GlobalTimer]         ; 0A:5CC4
    srl  a                          ; 0A:5CC6
    and  $0E                        ; 0A:5CC8
    ld   c,a                        ; 0A:5CCA
    ld   b,$00                      ; 0A:5CCB
    ld   hl,DataPtrs0A5C21          ; 0A:5CCD
    add  hl,bc                      ; 0A:5CD0
    ldi  a,[hl]                     ; 0A:5CD1
    ld   h,[hl]                     ; 0A:5CD2
    ld   l,a                        ; 0A:5CD3
    ld   de,W_PalBufferSpr          ; 0A:5CD4
    ld   bc,$0008                   ; 0A:5CD7
    call CopyBytes                  ; 0A:5CDA
    ld   a,$01                      ; 0A:5CDD
    ldh  [<$FFC0],a                 ; 0A:5CDF
    ret                             ; 0A:5CE1

Sub0A5CE2:
    ld   a,[$D900]                  ; 0A:5CE2
    sla  a                          ; 0A:5CE5
    ld   c,a                        ; 0A:5CE7
    ld   b,$00                      ; 0A:5CE8
    ld   hl,AlbumPageImageIDPtrs    ; 0A:5CEA
    add  hl,bc                      ; 0A:5CED
    ldi  a,[hl]                     ; 0A:5CEE
    ld   h,[hl]                     ; 0A:5CEF
    ld   l,a                        ; 0A:5CF0
    ld   a,[hl]                     ; 0A:5CF1
    ld   c,a                        ; 0A:5CF2
    ld   a,[$D90D]                  ; 0A:5CF3
    sla  a                          ; 0A:5CF6
    add  c                          ; 0A:5CF8
    ld   c,a                        ; 0A:5CF9
    and  $07                        ; 0A:5CFA
    ld   e,a                        ; 0A:5CFC
    ld   d,b                        ; 0A:5CFD
    ld   hl,BitTable8Desc           ; 0A:5CFE
    add  hl,de                      ; 0A:5D01
    ld   a,c                        ; 0A:5D02
    srl  a                          ; 0A:5D03
    srl  a                          ; 0A:5D05
    srl  a                          ; 0A:5D07
    add  $29                        ; 0A:5D09
    ld   e,a                        ; 0A:5D0B
    ld   a,$C4                      ; 0A:5D0C
    adc  $00                        ; 0A:5D0E
    ld   d,a                        ; 0A:5D10
    ld   b,$00                      ; 0A:5D11
    ld   a,[de]                     ; 0A:5D13
    and  [hl]                       ; 0A:5D14
    jr   z,Code0A5D18               ; 0A:5D15
    inc  b                          ; 0A:5D17
Code0A5D18:
    inc  c                          ; 0A:5D18
    ld   a,c                        ; 0A:5D19
    and  $07                        ; 0A:5D1A
    ld   e,a                        ; 0A:5D1C
    ld   d,$00                      ; 0A:5D1D
    ld   hl,BitTable8Desc           ; 0A:5D1F
    add  hl,de                      ; 0A:5D22
    ld   a,c                        ; 0A:5D23
    srl  a                          ; 0A:5D24
    srl  a                          ; 0A:5D26
    srl  a                          ; 0A:5D28
    add  $29                        ; 0A:5D2A
    ld   e,a                        ; 0A:5D2C
    ld   a,$C4                      ; 0A:5D2D
    adc  $00                        ; 0A:5D2F
    ld   d,a                        ; 0A:5D31
    ld   a,[de]                     ; 0A:5D32
    and  [hl]                       ; 0A:5D33
    jr   z,Code0A5D38               ; 0A:5D34
    inc  b                          ; 0A:5D36
    inc  b                          ; 0A:5D37
Code0A5D38:
    ld   a,b                        ; 0A:5D38
    ld   [$D927],a                  ; 0A:5D39
    cp   $03                        ; 0A:5D3C
    jr   nz,Code0A5D68              ; 0A:5D3E
    ld   a,$1C                      ; 0A:5D40
    ldh  [<$FF97],a                 ; 0A:5D42
    ld   hl,DataPtrs0A5BAE          ; 0A:5D44
    ldh  a,[<H_GlobalTimer]         ; 0A:5D47
    srl  a                          ; 0A:5D49
    srl  a                          ; 0A:5D4B
    and  $03                        ; 0A:5D4D
    sla  a                          ; 0A:5D4F
    ld   c,a                        ; 0A:5D51
    ld   b,$00                      ; 0A:5D52
    add  hl,bc                      ; 0A:5D54
    ldi  a,[hl]                     ; 0A:5D55
    ld   h,[hl]                     ; 0A:5D56
    ld   l,a                        ; 0A:5D57
    ld   e,$10                      ; 0A:5D58
    ld   d,$18                      ; 0A:5D5A
    ld   a,[$D90D]                  ; 0A:5D5C
    and  a                          ; 0A:5D5F
    jr   z,Code0A5D64               ; 0A:5D60
    ld   d,$50                      ; 0A:5D62
Code0A5D64:
    ld   bc,W_OAMBuffer             ; 0A:5D64
    ret                             ; 0A:5D67

Code0A5D68:
    ld   a,[$D90F]                  ; 0A:5D68
    ld   c,a                        ; 0A:5D6B
    ld   b,$00                      ; 0A:5D6C
    ld   hl,Data0A5BBB              ; 0A:5D6E
    add  hl,bc                      ; 0A:5D71
    ld   e,[hl]                     ; 0A:5D72
    ld   hl,Data0A5BDA              ; 0A:5D73
    add  hl,bc                      ; 0A:5D76
    ld   d,[hl]                     ; 0A:5D77
    ld   a,[$D900]                  ; 0A:5D78
    sla  a                          ; 0A:5D7B
    sla  a                          ; 0A:5D7D
    ld   c,a                        ; 0A:5D7F
    ldh  a,[<H_GlobalTimer]         ; 0A:5D80
    srl  a                          ; 0A:5D82
    srl  a                          ; 0A:5D84
    and  $03                        ; 0A:5D86
    add  c                          ; 0A:5D88
    sla  a                          ; 0A:5D89
    ld   c,a                        ; 0A:5D8B
    ld   hl,DataPtrs0A5B86          ; 0A:5D8C
    add  hl,bc                      ; 0A:5D8F
    ldi  a,[hl]                     ; 0A:5D90
    ld   h,[hl]                     ; 0A:5D91
    ld   l,a                        ; 0A:5D92
    ld   bc,W_OAMBuffer             ; 0A:5D93
    ret                             ; 0A:5D96

Code0A5D97:
; Album substate 3
    call Sub0A5DC4                  ; 0A:5D97
    ld   a,[$D904]                  ; 0A:5D9A
    and  a                          ; 0A:5D9D
    jr   z,Code0A5DB2               ; 0A:5D9E
    call Sub0A6117                  ; 0A:5DA0
    ld   a,[$D903]                  ; 0A:5DA3
    inc  a                          ; 0A:5DA6
    ld   [$D903],a                  ; 0A:5DA7
    cp   $14                        ; 0A:5DAA
    ret  nz                         ; 0A:5DAC
    ld   a,$02                      ; 0A:5DAD
    ldh  [<H_GameSubstate],a        ; 0A:5DAF
    ret                             ; 0A:5DB1

Code0A5DB2:
    call Sub0A626D                  ; 0A:5DB2
    ld   a,[$D903]                  ; 0A:5DB5
    inc  a                          ; 0A:5DB8
    ld   [$D903],a                  ; 0A:5DB9
    cp   $14                        ; 0A:5DBC
    ret  nz                         ; 0A:5DBE
    ld   a,$02                      ; 0A:5DBF
    ldh  [<H_GameSubstate],a        ; 0A:5DC1
    ret                             ; 0A:5DC3

Sub0A5DC4:
    ld   a,[$D900]                  ; 0A:5DC4
    rst  $00                        ; 0A:5DC7  Execute from 16-bit pointer table
.dw Code0A5DF0                      ; 0A:5DC8
.dw Code0A5EE7                      ; 0A:5DCA
.dw Code0A5EE7                      ; 0A:5DCC
.dw Code0A5FEC                      ; 0A:5DCE
.dw Code0A5FEC                      ; 0A:5DD0

Data0A5DD2:                         ; 0A:5DD2
.db $00,$90,$00,$91,$80,$91,$80,$92,\
    $00,$93,$00,$94,$80,$94,$80,$95,\
    $00,$96,$00,$97
Data0A5DE6:                         ; 0A:5DE6
.db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$07

Code0A5DF0:
    ld   a,[$D902]                  ; 0A:5DF0
    cp   $0A                        ; 0A:5DF3
    ret  z                          ; 0A:5DF5
    ld   a,[$D900]                  ; 0A:5DF6
    sla  a                          ; 0A:5DF9
    ld   c,a                        ; 0A:5DFB
    ld   b,$00                      ; 0A:5DFC
    ld   hl,AlbumPageImageIDPtrs    ; 0A:5DFE
    add  hl,bc                      ; 0A:5E01
    ldi  a,[hl]                     ; 0A:5E02
    ld   h,[hl]                     ; 0A:5E03
    ld   l,a                        ; 0A:5E04
    ld   a,[$D902]                  ; 0A:5E05
    srl  a                          ; 0A:5E08
    add  [hl]                       ; 0A:5E0A
    ldh  [<$FF97],a                 ; 0A:5E0B
    ld   c,a                        ; 0A:5E0D
    srl  a                          ; 0A:5E0E
    srl  a                          ; 0A:5E10
    srl  a                          ; 0A:5E12
    add  $29                        ; 0A:5E14
    ld   e,a                        ; 0A:5E16
    ld   a,$C4                      ; 0A:5E17
    adc  $00                        ; 0A:5E19
    ld   d,a                        ; 0A:5E1B
    ld   a,c                        ; 0A:5E1C
    and  $07                        ; 0A:5E1D
    ld   c,a                        ; 0A:5E1F
    ld   hl,BitTable8Desc           ; 0A:5E20
    add  hl,bc                      ; 0A:5E23
    ld   a,[de]                     ; 0A:5E24
    and  [hl]                       ; 0A:5E25
    jr   nz,Code0A5E3E              ; 0A:5E26
    ld   a,$00                      ; 0A:5E28
    ld   [$C4ED],a                  ; 0A:5E2A
    ld   a,[$D902]                  ; 0A:5E2D
    and  $01                        ; 0A:5E30
    add  $70                        ; 0A:5E32
    ld   [$C4EE],a                  ; 0A:5E34
    ld   a,$17                      ; 0A:5E37
    ld   [$C4EF],a                  ; 0A:5E39
    jr   Code0A5E9F                 ; 0A:5E3C
Code0A5E3E:
    ldh  a,[<$FF97]                 ; 0A:5E3E
    ld   c,a                        ; 0A:5E40
    srl  a                          ; 0A:5E41
    srl  a                          ; 0A:5E43
    srl  a                          ; 0A:5E45
    add  $2D                        ; 0A:5E47
    ld   e,a                        ; 0A:5E49
    ld   a,$C4                      ; 0A:5E4A
    adc  $00                        ; 0A:5E4C
    ld   d,a                        ; 0A:5E4E
    ld   a,c                        ; 0A:5E4F
    and  $07                        ; 0A:5E50
    ld   c,a                        ; 0A:5E52
    ld   b,$00                      ; 0A:5E53
    ld   hl,BitTable8Desc           ; 0A:5E55
    add  hl,bc                      ; 0A:5E58
    ld   a,[de]                     ; 0A:5E59
    and  [hl]                       ; 0A:5E5A
    jr   nz,Code0A5E75              ; 0A:5E5B
    ld   a,$00                      ; 0A:5E5D
    ld   [$C4ED],a                  ; 0A:5E5F
    ld   a,[$D902]                  ; 0A:5E62
    and  $01                        ; 0A:5E65
    inc  a                          ; 0A:5E67
    inc  a                          ; 0A:5E68
    add  $70                        ; 0A:5E69
    ld   [$C4EE],a                  ; 0A:5E6B
    ld   a,$17                      ; 0A:5E6E
    ld   [$C4EF],a                  ; 0A:5E70
    jr   Code0A5E9F                 ; 0A:5E73
Code0A5E75:
    ld   a,[$D902]                  ; 0A:5E75
    srl  a                          ; 0A:5E78
    ld   b,a                        ; 0A:5E7A
    sla  a                          ; 0A:5E7B
    add  b                          ; 0A:5E7D
    ld   c,$00                      ; 0A:5E7E
    srl  a                          ; 0A:5E80
    ld   b,a                        ; 0A:5E82
    rr   c                          ; 0A:5E83
    ld   hl,Data0A4000              ; 0A:5E85
    add  hl,bc                      ; 0A:5E88
    ld   a,[$D902]                  ; 0A:5E89
    and  $01                        ; 0A:5E8C
    ld   b,a                        ; 0A:5E8E
    ld   c,$00                      ; 0A:5E8F
    add  hl,bc                      ; 0A:5E91
    ld   a,l                        ; 0A:5E92
    ld   [$C4ED],a                  ; 0A:5E93
    ld   a,h                        ; 0A:5E96
    ld   [$C4EE],a                  ; 0A:5E97
    ld   a,$21                      ; 0A:5E9A
    ld   [$C4EF],a                  ; 0A:5E9C
Code0A5E9F:
    ld   a,[$D902]                  ; 0A:5E9F
    ld   c,a                        ; 0A:5EA2
    ld   b,$00                      ; 0A:5EA3
    ld   hl,Data0A5DE6              ; 0A:5EA5
    add  hl,bc                      ; 0A:5EA8
    ld   a,[hl]                     ; 0A:5EA9
    ld   [$C4F2],a                  ; 0A:5EAA
    sla  c                          ; 0A:5EAD
    ld   hl,Data0A5DD2              ; 0A:5EAF
    add  hl,bc                      ; 0A:5EB2
    ldi  a,[hl]                     ; 0A:5EB3
    ld   [$C4F0],a                  ; 0A:5EB4
    ld   a,[hl]                     ; 0A:5EB7
    ld   [$C4F1],a                  ; 0A:5EB8
    ld   a,[$D902]                  ; 0A:5EBB
    inc  a                          ; 0A:5EBE
    ld   [$D902],a                  ; 0A:5EBF
    ld   a,$01                      ; 0A:5EC2
    ld   [$C424],a                  ; 0A:5EC4
    xor  a                          ; 0A:5EC7
    ld   [$C4F4],a                  ; 0A:5EC8
    ret                             ; 0A:5ECB

Data0A5ECC:                         ; 0A:5ECC
.db $00,$90,$C0,$90,$80,$91,$40,$92,\
    $00,$93,$C0,$93,$80,$94,$40,$95,\
    $00,$96
Data0A5EDE:                         ; 0A:5EDE
.db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,\
    $0B
Code0A5EE7:
    ld   a,[$D902]                  ; 0A:5EE7
    cp   $09                        ; 0A:5EEA
    ret  z                          ; 0A:5EEC
    ld   a,[$D900]                  ; 0A:5EED
    sla  a                          ; 0A:5EF0
    ld   c,a                        ; 0A:5EF2
    ld   b,$00                      ; 0A:5EF3
    ld   hl,AlbumPageImageIDPtrs    ; 0A:5EF5
    add  hl,bc                      ; 0A:5EF8
    ldi  a,[hl]                     ; 0A:5EF9
    ld   h,[hl]                     ; 0A:5EFA
    ld   l,a                        ; 0A:5EFB
    ld   a,[$D902]                  ; 0A:5EFC
    add  [hl]                       ; 0A:5EFF
    ldh  [<$FF97],a                 ; 0A:5F00
    ld   c,a                        ; 0A:5F02
    srl  a                          ; 0A:5F03
    srl  a                          ; 0A:5F05
    srl  a                          ; 0A:5F07
    add  $29                        ; 0A:5F09
    ld   e,a                        ; 0A:5F0B
    ld   a,$C4                      ; 0A:5F0C
    adc  $00                        ; 0A:5F0E
    ld   d,a                        ; 0A:5F10
    ld   a,c                        ; 0A:5F11
    and  $07                        ; 0A:5F12
    ld   c,a                        ; 0A:5F14
    ld   hl,BitTable8Desc           ; 0A:5F15
    add  hl,bc                      ; 0A:5F18
    ld   a,[de]                     ; 0A:5F19
    and  [hl]                       ; 0A:5F1A
    jr   nz,Code0A5F30              ; 0A:5F1B
    ld   a,$00                      ; 0A:5F1D
    ld   [$C4ED],a                  ; 0A:5F1F
    ld   a,$04                      ; 0A:5F22
    add  $70                        ; 0A:5F24
    ld   [$C4EE],a                  ; 0A:5F26
    ld   a,$17                      ; 0A:5F29
    ld   [$C4EF],a                  ; 0A:5F2B
    jr   Code0A5F92                 ; 0A:5F2E
Code0A5F30:
    ldh  a,[<$FF97]                 ; 0A:5F30
    ld   c,a                        ; 0A:5F32
    srl  a                          ; 0A:5F33
    srl  a                          ; 0A:5F35
    srl  a                          ; 0A:5F37
    add  $2D                        ; 0A:5F39
    ld   e,a                        ; 0A:5F3B
    ld   a,$C4                      ; 0A:5F3C
    adc  $00                        ; 0A:5F3E
    ld   d,a                        ; 0A:5F40
    ld   a,c                        ; 0A:5F41
    and  $07                        ; 0A:5F42
    ld   c,a                        ; 0A:5F44
    ld   b,$00                      ; 0A:5F45
    ld   hl,BitTable8Desc           ; 0A:5F47
    add  hl,bc                      ; 0A:5F4A
    ld   a,[de]                     ; 0A:5F4B
    and  [hl]                       ; 0A:5F4C
    jr   nz,Code0A5F62              ; 0A:5F4D
    ld   a,$00                      ; 0A:5F4F
    ld   [$C4ED],a                  ; 0A:5F51
    ld   a,$05                      ; 0A:5F54
    add  $70                        ; 0A:5F56
    ld   [$C4EE],a                  ; 0A:5F58
    ld   a,$17                      ; 0A:5F5B
    ld   [$C4EF],a                  ; 0A:5F5D
    jr   Code0A5F92                 ; 0A:5F60
Code0A5F62:
    ld   a,[$D902]                  ; 0A:5F62
    ld   b,a                        ; 0A:5F65
    ld   c,$00                      ; 0A:5F66
    sla  a                          ; 0A:5F68
    add  b                          ; 0A:5F6A
    srl  a                          ; 0A:5F6B
    rr   c                          ; 0A:5F6D
    srl  a                          ; 0A:5F6F
    rr   c                          ; 0A:5F71
    ld   b,a                        ; 0A:5F73
    ld   a,[$D900]                  ; 0A:5F74
    sla  a                          ; 0A:5F77
    ld   e,a                        ; 0A:5F79
    ld   d,$00                      ; 0A:5F7A
    ld   hl,DataPtrs0A4E9A          ; 0A:5F7C
    add  hl,de                      ; 0A:5F7F
    ldi  a,[hl]                     ; 0A:5F80
    ld   e,a                        ; 0A:5F81
    ld   d,[hl]                     ; 0A:5F82
    ld   a,$21                      ; 0A:5F83
    ld   [$C4EF],a                  ; 0A:5F85
    ld   a,c                        ; 0A:5F88
    add  e                          ; 0A:5F89
    ld   [$C4ED],a                  ; 0A:5F8A
    ld   a,b                        ; 0A:5F8D
    adc  d                          ; 0A:5F8E
    ld   [$C4EE],a                  ; 0A:5F8F
Code0A5F92:
    ld   a,[$D902]                  ; 0A:5F92
    ld   c,a                        ; 0A:5F95
    ld   b,$00                      ; 0A:5F96
    ld   hl,Data0A5EDE              ; 0A:5F98
    add  hl,bc                      ; 0A:5F9B
    ld   a,[hl]                     ; 0A:5F9C
    ld   [$C4F2],a                  ; 0A:5F9D
    sla  c                          ; 0A:5FA0
    ld   hl,Data0A5ECC              ; 0A:5FA2
    add  hl,bc                      ; 0A:5FA5
    ldi  a,[hl]                     ; 0A:5FA6
    ld   [$C4F0],a                  ; 0A:5FA7
    ld   a,[hl]                     ; 0A:5FAA
    ld   [$C4F1],a                  ; 0A:5FAB
    ld   a,[$D902]                  ; 0A:5FAE
    inc  a                          ; 0A:5FB1
    ld   [$D902],a                  ; 0A:5FB2
    ld   a,$01                      ; 0A:5FB5
    ld   [$C424],a                  ; 0A:5FB7
    xor  a                          ; 0A:5FBA
    ld   [$C4F4],a                  ; 0A:5FBB
    ret                             ; 0A:5FBE

Data0A5FBF:                         ; 0A:5FBF
.db $00,$90,$00,$91,$00,$92,$00,$00,\
    $A0,$92,$A0,$93,$A0,$94,$00,$00,\
    $40,$95,$40,$96,$40,$97,$00,$00,\
    $00,$88,$00,$89,$00,$8A
Data0A5FDD:                         ; 0A:5FDD
.db $0F,$0F,$09,$00,$0F,$0F,$09,$00,\
    $0F,$0F,$09,$00,$0F,$0F,$09
Code0A5FEC:
    ld   a,[$D902]                  ; 0A:5FEC
    cp   $0F                        ; 0A:5FEF
    ret  z                          ; 0A:5FF1
    and  $03                        ; 0A:5FF2
    cp   $03                        ; 0A:5FF4
    jr   nz,Code0A5FFF              ; 0A:5FF6
    ld   a,[$D902]                  ; 0A:5FF8
    inc  a                          ; 0A:5FFB
    ld   [$D902],a                  ; 0A:5FFC
Code0A5FFF:
    ld   a,[$D900]                  ; 0A:5FFF
    sla  a                          ; 0A:6002
    ld   c,a                        ; 0A:6004
    ld   b,$00                      ; 0A:6005
    ld   hl,AlbumPageImageIDPtrs    ; 0A:6007
    add  hl,bc                      ; 0A:600A
    ldi  a,[hl]                     ; 0A:600B
    ld   h,[hl]                     ; 0A:600C
    ld   l,a                        ; 0A:600D
    ld   a,[$D902]                  ; 0A:600E
    srl  a                          ; 0A:6011
    srl  a                          ; 0A:6013
    add  [hl]                       ; 0A:6015
    ldh  [<$FF97],a                 ; 0A:6016
    ld   c,a                        ; 0A:6018
    srl  a                          ; 0A:6019
    srl  a                          ; 0A:601B
    srl  a                          ; 0A:601D
    add  $29                        ; 0A:601F
    ld   e,a                        ; 0A:6021
    ld   a,$C4                      ; 0A:6022
    adc  $00                        ; 0A:6024
    ld   d,a                        ; 0A:6026
    ld   a,c                        ; 0A:6027
    and  $07                        ; 0A:6028
    ld   c,a                        ; 0A:602A
    ld   hl,BitTable8Desc           ; 0A:602B
    add  hl,bc                      ; 0A:602E
    ld   a,[de]                     ; 0A:602F
    and  [hl]                       ; 0A:6030
    jr   nz,Code0A604C              ; 0A:6031
    ld   a,$00                      ; 0A:6033
    ld   [$C4ED],a                  ; 0A:6035
    ld   a,[$D902]                  ; 0A:6038
    and  $03                        ; 0A:603B
    add  $06                        ; 0A:603D
    add  $70                        ; 0A:603F
    ld   [$C4EE],a                  ; 0A:6041
    ld   a,$17                      ; 0A:6044
    ld   [$C4EF],a                  ; 0A:6046
    jp   Code0A60BE                 ; 0A:6049
Code0A604C:
    ldh  a,[<$FF97]                 ; 0A:604C
    srl  a                          ; 0A:604E
    srl  a                          ; 0A:6050
    srl  a                          ; 0A:6052
    add  $2D                        ; 0A:6054
    ld   e,a                        ; 0A:6056
    ld   a,$C4                      ; 0A:6057
    adc  $00                        ; 0A:6059
    ld   d,a                        ; 0A:605B
    ld   a,[de]                     ; 0A:605C
    and  [hl]                       ; 0A:605D
    jr   nz,Code0A6078              ; 0A:605E
    ld   a,$00                      ; 0A:6060
    ld   [$C4ED],a                  ; 0A:6062
    ld   a,[$D902]                  ; 0A:6065
    and  $03                        ; 0A:6068
    add  $09                        ; 0A:606A
    add  $70                        ; 0A:606C
    ld   [$C4EE],a                  ; 0A:606E
    ld   a,$17                      ; 0A:6071
    ld   [$C4EF],a                  ; 0A:6073
    jr   Code0A60BE                 ; 0A:6076
Code0A6078:
    ld   a,[$D902]                  ; 0A:6078
    srl  a                          ; 0A:607B
    srl  a                          ; 0A:607D
    ld   b,a                        ; 0A:607F
    sla  a                          ; 0A:6080
    sla  a                          ; 0A:6082
    add  b                          ; 0A:6084
    sla  a                          ; 0A:6085
    sla  a                          ; 0A:6087
    add  b                          ; 0A:6089
    ld   c,$00                      ; 0A:608A
    srl  a                          ; 0A:608C
    rr   c                          ; 0A:608E
    srl  a                          ; 0A:6090
    rr   c                          ; 0A:6092
    srl  a                          ; 0A:6094
    rr   c                          ; 0A:6096
    ld   b,a                        ; 0A:6098
    ld   a,[$D900]                  ; 0A:6099
    sla  a                          ; 0A:609C
    ld   e,a                        ; 0A:609E
    ld   d,$00                      ; 0A:609F
    ld   hl,DataPtrs0A4E9A          ; 0A:60A1
    add  hl,de                      ; 0A:60A4
    ldi  a,[hl]                     ; 0A:60A5
    ld   e,a                        ; 0A:60A6
    ld   d,[hl]                     ; 0A:60A7
    ld   a,$21                      ; 0A:60A8
    ld   [$C4EF],a                  ; 0A:60AA
    ld   a,[$D902]                  ; 0A:60AD
    and  $03                        ; 0A:60B0
    add  d                          ; 0A:60B2
    ld   d,a                        ; 0A:60B3
    ld   a,c                        ; 0A:60B4
    add  e                          ; 0A:60B5
    ld   [$C4ED],a                  ; 0A:60B6
    ld   a,b                        ; 0A:60B9
    adc  d                          ; 0A:60BA
    ld   [$C4EE],a                  ; 0A:60BB
Code0A60BE:
    ld   a,[$D902]                  ; 0A:60BE
    ld   c,a                        ; 0A:60C1
    ld   b,$00                      ; 0A:60C2
    ld   hl,Data0A5FDD              ; 0A:60C4
    add  hl,bc                      ; 0A:60C7
    ld   a,[hl]                     ; 0A:60C8
    ld   [$C4F2],a                  ; 0A:60C9
    sla  c                          ; 0A:60CC
    ld   hl,Data0A5FBF              ; 0A:60CE
    add  hl,bc                      ; 0A:60D1
    ldi  a,[hl]                     ; 0A:60D2
    ld   [$C4F0],a                  ; 0A:60D3
    ld   a,[hl]                     ; 0A:60D6
    ld   [$C4F1],a                  ; 0A:60D7
    ld   a,[$D902]                  ; 0A:60DA
    inc  a                          ; 0A:60DD
    ld   [$D902],a                  ; 0A:60DE
    ld   a,$01                      ; 0A:60E1
    ld   [$C424],a                  ; 0A:60E3
    xor  a                          ; 0A:60E6
    ld   [$C4F4],a                  ; 0A:60E7
    ret                             ; 0A:60EA

Data0A60EB:                         ; 0A:60EB
.db $13,$12,$11
Data0A60EE:                         ; 0A:60EE
.db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,\
    $08,$07,$06,$05,$04,$03,$02,$01,\
    $00,$1F,$1E,$1D,$1C
Data0A6103:                         ; 0A:6103
.db $13,$12,$11,$10,$0F,$0E,$0D,$0C,\
    $0B,$0A,$09,$08,$07,$06,$05,$04,\
    $03,$02,$01,$00

Sub0A6117:
    ld   a,[$D903]                  ; 0A:6117
    cp   $13                        ; 0A:611A
    jr   nz,Code0A6124              ; 0A:611C
    call Sub0A4FE2                  ; 0A:611E
    jp   Code0A6227                 ; 0A:6121
Code0A6124:
    ld   c,a                        ; 0A:6124
    ld   b,$00                      ; 0A:6125
    ld   hl,Data0A60EE              ; 0A:6127
    add  hl,bc                      ; 0A:612A
    ldi  a,[hl]                     ; 0A:612B
    ld   e,a                        ; 0A:612C
    ld   l,[hl]                     ; 0A:612D
    ld   h,$D0                      ; 0A:612E
    ld   d,h                        ; 0A:6130
    ld   c,$04                      ; 0A:6131
    push hl                         ; 0A:6133
    push de                         ; 0A:6134
Code0A6135:
    ld   b,$11                      ; 0A:6135
    push hl                         ; 0A:6137
    push de                         ; 0A:6138
Code0A6139:
    ld   a,[de]                     ; 0A:6139
    ld   [hl],a                     ; 0A:613A
    ld   a,l                        ; 0A:613B
    add  $20                        ; 0A:613C
    ld   l,a                        ; 0A:613E
    ld   a,h                        ; 0A:613F
    adc  $00                        ; 0A:6140
    ld   h,a                        ; 0A:6142
    ld   a,e                        ; 0A:6143
    add  $20                        ; 0A:6144
    ld   e,a                        ; 0A:6146
    ld   a,d                        ; 0A:6147
    adc  $00                        ; 0A:6148
    ld   d,a                        ; 0A:614A
    dec  b                          ; 0A:614B
    jr   nz,Code0A6139              ; 0A:614C
    pop  de                         ; 0A:614E
    pop  hl                         ; 0A:614F
    inc  de                         ; 0A:6150
    ld   a,e                        ; 0A:6151
    and  $1F                        ; 0A:6152
    jr   nz,Code0A615B              ; 0A:6154
    dec  de                         ; 0A:6156
    ld   a,e                        ; 0A:6157
    and  $E0                        ; 0A:6158
    ld   e,a                        ; 0A:615A
Code0A615B:
    inc  hl                         ; 0A:615B
    ld   a,l                        ; 0A:615C
    and  $1F                        ; 0A:615D
    jr   nz,Code0A6166              ; 0A:615F
    dec  hl                         ; 0A:6161
    ld   a,l                        ; 0A:6162
    and  $E0                        ; 0A:6163
    ld   l,a                        ; 0A:6165
Code0A6166:
    dec  c                          ; 0A:6166
    jr   nz,Code0A6135              ; 0A:6167
    pop  de                         ; 0A:6169
    pop  hl                         ; 0A:616A
    ld   a,l                        ; 0A:616B
    add  $40                        ; 0A:616C
    ld   l,a                        ; 0A:616E
    ld   a,h                        ; 0A:616F
    adc  $02                        ; 0A:6170
    ld   h,a                        ; 0A:6172
    ld   a,e                        ; 0A:6173
    add  $40                        ; 0A:6174
    ld   e,a                        ; 0A:6176
    ld   a,d                        ; 0A:6177
    adc  $02                        ; 0A:6178
    ld   d,a                        ; 0A:617A
    ld   c,$04                      ; 0A:617B
Code0A617D:
    ld   b,$11                      ; 0A:617D
    push hl                         ; 0A:617F
    push de                         ; 0A:6180
Code0A6181:
    ld   a,[de]                     ; 0A:6181
    ld   [hl],a                     ; 0A:6182
    ld   a,l                        ; 0A:6183
    add  $20                        ; 0A:6184
    ld   l,a                        ; 0A:6186
    ld   a,h                        ; 0A:6187
    adc  $00                        ; 0A:6188
    ld   h,a                        ; 0A:618A
    ld   a,e                        ; 0A:618B
    add  $20                        ; 0A:618C
    ld   e,a                        ; 0A:618E
    ld   a,d                        ; 0A:618F
    adc  $00                        ; 0A:6190
    ld   d,a                        ; 0A:6192
    dec  b                          ; 0A:6193
    jr   nz,Code0A6181              ; 0A:6194
    pop  de                         ; 0A:6196
    pop  hl                         ; 0A:6197
    inc  de                         ; 0A:6198
    ld   a,e                        ; 0A:6199
    and  $1F                        ; 0A:619A
    jr   nz,Code0A61A3              ; 0A:619C
    dec  de                         ; 0A:619E
    ld   a,e                        ; 0A:619F
    and  $E0                        ; 0A:61A0
    ld   e,a                        ; 0A:61A2
Code0A61A3:
    inc  hl                         ; 0A:61A3
    ld   a,l                        ; 0A:61A4
    and  $1F                        ; 0A:61A5
    jr   nz,Code0A61AE              ; 0A:61A7
    dec  hl                         ; 0A:61A9
    ld   a,l                        ; 0A:61AA
    and  $E0                        ; 0A:61AB
    ld   l,a                        ; 0A:61AD
Code0A61AE:
    dec  c                          ; 0A:61AE
    jr   nz,Code0A617D              ; 0A:61AF
    ld   a,[$D903]                  ; 0A:61B1
    ld   c,a                        ; 0A:61B4
    ld   hl,Data0A60EB              ; 0A:61B5
    add  hl,bc                      ; 0A:61B8
    ld   a,$00                      ; 0A:61B9
    add  [hl]                       ; 0A:61BB
    ld   e,a                        ; 0A:61BC
    ld   a,$D0                      ; 0A:61BD
    adc  $00                        ; 0A:61BF
    ld   d,a                        ; 0A:61C1
    ld   a,[$D903]                  ; 0A:61C2
    ld   c,a                        ; 0A:61C5
    ld   b,$00                      ; 0A:61C6
    ld   hl,Data0A6103              ; 0A:61C8
    add  hl,bc                      ; 0A:61CB
    ld   a,[hl]                     ; 0A:61CC
    ldh  [<$FF97],a                 ; 0A:61CD
    ld   a,[$D900]                  ; 0A:61CF
    sla  a                          ; 0A:61D2
    ld   c,a                        ; 0A:61D4
    ld   hl,DataPtrs0A4E90          ; 0A:61D5
    add  hl,bc                      ; 0A:61D8
    ldh  a,[<$FF97]                 ; 0A:61D9
    add  [hl]                       ; 0A:61DB
    ld   c,a                        ; 0A:61DC
    inc  hl                         ; 0A:61DD
    ld   a,[hl]                     ; 0A:61DE
    adc  $00                        ; 0A:61DF
    ld   h,a                        ; 0A:61E1
    ld   l,c                        ; 0A:61E2
    ld   a,e                        ; 0A:61E3
    add  $40                        ; 0A:61E4
    ld   c,a                        ; 0A:61E6
    ld   a,d                        ; 0A:61E7
    adc  $02                        ; 0A:61E8
    ld   b,a                        ; 0A:61EA
    ld   a,$11                      ; 0A:61EB
    ldh  [<$FF98],a                 ; 0A:61ED
Code0A61EF:
    ld   a,[hl]                     ; 0A:61EF
    cp   $AA                        ; 0A:61F0
    jr   nc,Code0A61FB              ; 0A:61F2
    ld   a,$DF                      ; 0A:61F4
    ld   [de],a                     ; 0A:61F6
    xor  a                          ; 0A:61F7
    ld   [bc],a                     ; 0A:61F8
    jr   Code0A6208                 ; 0A:61F9
Code0A61FB:
    ld   [de],a                     ; 0A:61FB
    push hl                         ; 0A:61FC
    ld   a,l                        ; 0A:61FD
    add  $68                        ; 0A:61FE
    ld   l,a                        ; 0A:6200
    ld   a,h                        ; 0A:6201
    adc  $01                        ; 0A:6202
    ld   h,a                        ; 0A:6204
    ld   a,[hl]                     ; 0A:6205
    ld   [bc],a                     ; 0A:6206
    pop  hl                         ; 0A:6207
Code0A6208:
    ld   a,l                        ; 0A:6208
    add  $14                        ; 0A:6209
    ld   l,a                        ; 0A:620B
    ld   a,h                        ; 0A:620C
    adc  $00                        ; 0A:620D
    ld   h,a                        ; 0A:620F
    ld   a,e                        ; 0A:6210
    add  $20                        ; 0A:6211
    ld   e,a                        ; 0A:6213
    ld   a,d                        ; 0A:6214
    adc  $00                        ; 0A:6215
    ld   d,a                        ; 0A:6217
    ld   a,c                        ; 0A:6218
    add  $20                        ; 0A:6219
    ld   c,a                        ; 0A:621B
    ld   a,b                        ; 0A:621C
    adc  $00                        ; 0A:621D
    ld   b,a                        ; 0A:621F
    ldh  a,[<$FF98]                 ; 0A:6220
    dec  a                          ; 0A:6222
    ldh  [<$FF98],a                 ; 0A:6223
    jr   nz,Code0A61EF              ; 0A:6225
Code0A6227:
    ld   a,$01                      ; 0A:6227
    ld   [$C423],a                  ; 0A:6229
    ld   a,$00                      ; 0A:622C
    ld   [$C425],a                  ; 0A:622E
    ld   a,$D0                      ; 0A:6231
    ld   [$C426],a                  ; 0A:6233
    ld   a,$40                      ; 0A:6236
    ld   [$C427],a                  ; 0A:6238
    ld   a,$D2                      ; 0A:623B
    ld   [$C428],a                  ; 0A:623D
    ret                             ; 0A:6240

Data0A6241:                         ; 0A:6241
.db $00,$01,$02
Data0A6244:                         ; 0A:6244
.db $03,$04,$05,$06,$07,$08,$09,$0A,\
    $0B,$0C,$0D,$0E,$0F,$10,$11,$12,\
    $13,$14,$15,$16,$17
Data0A6259:                         ; 0A:6259
.db $00,$01,$02,$03,$04,$05,$06,$07,\
    $08,$09,$0A,$0B,$0C,$0D,$0E,$0F,\
    $10,$11,$12,$13

Sub0A626D:
    ld   a,[$D903]                  ; 0A:626D
    cp   $13                        ; 0A:6270
    jr   nz,Code0A627A              ; 0A:6272
    call Sub0A4FE2                  ; 0A:6274
    jp   Code0A6355                 ; 0A:6277
Code0A627A:
    ld   c,a                        ; 0A:627A
    ld   b,$00                      ; 0A:627B
    ld   hl,Data0A6244              ; 0A:627D
    add  hl,bc                      ; 0A:6280
    ldi  a,[hl]                     ; 0A:6281
    ld   e,a                        ; 0A:6282
    ld   l,[hl]                     ; 0A:6283
    ld   h,$D0                      ; 0A:6284
    ld   d,h                        ; 0A:6286
    ld   c,$04                      ; 0A:6287
    push hl                         ; 0A:6289
    push de                         ; 0A:628A
Code0A628B:
    ld   b,$11                      ; 0A:628B
    push hl                         ; 0A:628D
    push de                         ; 0A:628E
Code0A628F:
    ld   a,[de]                     ; 0A:628F
    ld   [hl],a                     ; 0A:6290
    ld   a,l                        ; 0A:6291
    add  $20                        ; 0A:6292
    ld   l,a                        ; 0A:6294
    ld   a,h                        ; 0A:6295
    adc  $00                        ; 0A:6296
    ld   h,a                        ; 0A:6298
    ld   a,e                        ; 0A:6299
    add  $20                        ; 0A:629A
    ld   e,a                        ; 0A:629C
    ld   a,d                        ; 0A:629D
    adc  $00                        ; 0A:629E
    ld   d,a                        ; 0A:62A0
    dec  b                          ; 0A:62A1
    jr   nz,Code0A628F              ; 0A:62A2
    pop  de                         ; 0A:62A4
    pop  hl                         ; 0A:62A5
    dec  de                         ; 0A:62A6
    dec  hl                         ; 0A:62A7
    dec  c                          ; 0A:62A8
    jr   nz,Code0A628B              ; 0A:62A9
    pop  de                         ; 0A:62AB
    pop  hl                         ; 0A:62AC
    ld   a,l                        ; 0A:62AD
    add  $40                        ; 0A:62AE
    ld   l,a                        ; 0A:62B0
    ld   a,h                        ; 0A:62B1
    adc  $02                        ; 0A:62B2
    ld   h,a                        ; 0A:62B4
    ld   a,e                        ; 0A:62B5
    add  $40                        ; 0A:62B6
    ld   e,a                        ; 0A:62B8
    ld   a,d                        ; 0A:62B9
    adc  $02                        ; 0A:62BA
    ld   d,a                        ; 0A:62BC
    ld   c,$04                      ; 0A:62BD
Code0A62BF:
    ld   b,$11                      ; 0A:62BF
    push hl                         ; 0A:62C1
    push de                         ; 0A:62C2
Code0A62C3:
    ld   a,[de]                     ; 0A:62C3
    ld   [hl],a                     ; 0A:62C4
    ld   a,l                        ; 0A:62C5
    add  $20                        ; 0A:62C6
    ld   l,a                        ; 0A:62C8
    ld   a,h                        ; 0A:62C9
    adc  $00                        ; 0A:62CA
    ld   h,a                        ; 0A:62CC
    ld   a,e                        ; 0A:62CD
    add  $20                        ; 0A:62CE
    ld   e,a                        ; 0A:62D0
    ld   a,d                        ; 0A:62D1
    adc  $00                        ; 0A:62D2
    ld   d,a                        ; 0A:62D4
    dec  b                          ; 0A:62D5
    jr   nz,Code0A62C3              ; 0A:62D6
    pop  de                         ; 0A:62D8
    pop  hl                         ; 0A:62D9
    dec  de                         ; 0A:62DA
    dec  hl                         ; 0A:62DB
    dec  c                          ; 0A:62DC
    jr   nz,Code0A62BF              ; 0A:62DD
    ld   a,[$D903]                  ; 0A:62DF
    ld   c,a                        ; 0A:62E2
    ld   hl,Data0A6241              ; 0A:62E3
    add  hl,bc                      ; 0A:62E6
    ld   a,$00                      ; 0A:62E7
    add  [hl]                       ; 0A:62E9
    ld   e,a                        ; 0A:62EA
    ld   a,$D0                      ; 0A:62EB
    adc  $00                        ; 0A:62ED
    ld   d,a                        ; 0A:62EF
    ld   a,[$D903]                  ; 0A:62F0
    ld   c,a                        ; 0A:62F3
    ld   b,$00                      ; 0A:62F4
    ld   hl,Data0A6259              ; 0A:62F6
    add  hl,bc                      ; 0A:62F9
    ld   a,[hl]                     ; 0A:62FA
    ldh  [<$FF97],a                 ; 0A:62FB
    ld   a,[$D900]                  ; 0A:62FD
    sla  a                          ; 0A:6300
    ld   c,a                        ; 0A:6302
    ld   hl,DataPtrs0A4E90          ; 0A:6303
    add  hl,bc                      ; 0A:6306
    ldh  a,[<$FF97]                 ; 0A:6307
    add  [hl]                       ; 0A:6309
    ld   c,a                        ; 0A:630A
    inc  hl                         ; 0A:630B
    ld   a,[hl]                     ; 0A:630C
    adc  $00                        ; 0A:630D
    ld   h,a                        ; 0A:630F
    ld   l,c                        ; 0A:6310
    ld   a,e                        ; 0A:6311
    add  $40                        ; 0A:6312
    ld   c,a                        ; 0A:6314
    ld   a,d                        ; 0A:6315
    adc  $02                        ; 0A:6316
    ld   b,a                        ; 0A:6318
    ld   a,$11                      ; 0A:6319
    ldh  [<$FF98],a                 ; 0A:631B
Code0A631D:
    ld   a,[hl]                     ; 0A:631D
    cp   $AA                        ; 0A:631E
    jr   nc,Code0A6329              ; 0A:6320
    ld   a,$DF                      ; 0A:6322
    ld   [de],a                     ; 0A:6324
    xor  a                          ; 0A:6325
    ld   [bc],a                     ; 0A:6326
    jr   Code0A6336                 ; 0A:6327
Code0A6329:
    ld   [de],a                     ; 0A:6329
    push hl                         ; 0A:632A
    ld   a,l                        ; 0A:632B
    add  $68                        ; 0A:632C
    ld   l,a                        ; 0A:632E
    ld   a,h                        ; 0A:632F
    adc  $01                        ; 0A:6330
    ld   h,a                        ; 0A:6332
    ld   a,[hl]                     ; 0A:6333
    ld   [bc],a                     ; 0A:6334
    pop  hl                         ; 0A:6335
Code0A6336:
    ld   a,l                        ; 0A:6336
    add  $14                        ; 0A:6337
    ld   l,a                        ; 0A:6339
    ld   a,h                        ; 0A:633A
    adc  $00                        ; 0A:633B
    ld   h,a                        ; 0A:633D
    ld   a,e                        ; 0A:633E
    add  $20                        ; 0A:633F
    ld   e,a                        ; 0A:6341
    ld   a,d                        ; 0A:6342
    adc  $00                        ; 0A:6343
    ld   d,a                        ; 0A:6345
    ld   a,c                        ; 0A:6346
    add  $20                        ; 0A:6347
    ld   c,a                        ; 0A:6349
    ld   a,b                        ; 0A:634A
    adc  $00                        ; 0A:634B
    ld   b,a                        ; 0A:634D
    ldh  a,[<$FF98]                 ; 0A:634E
    dec  a                          ; 0A:6350
    ldh  [<$FF98],a                 ; 0A:6351
    jr   nz,Code0A631D              ; 0A:6353
Code0A6355:
    ld   a,$01                      ; 0A:6355
    ld   [$C423],a                  ; 0A:6357
    ld   a,$00                      ; 0A:635A
    ld   [$C425],a                  ; 0A:635C
    ld   a,$D0                      ; 0A:635F
    ld   [$C426],a                  ; 0A:6361
    ld   a,$40                      ; 0A:6364
    ld   [$C427],a                  ; 0A:6366
    ld   a,$D2                      ; 0A:6369
    ld   [$C428],a                  ; 0A:636B
    ret                             ; 0A:636E

Pal_AlbumImageSpr:                  ; 0A:636F
.dw $7FFF,$4A5F,$001F,$0000,$7FFF,$56B5,$7E60,$0000,\
    $7FFF,$56B5,$294A,$0000,$7FFF,$56B5,$294A,$0000,\
    $7FFF,$56B5,$294A,$0000,$7FFF,$56B5,$294A,$0000,\
    $7DE0,$7FFF,$02BC,$0019,$7FFF,$22FF,$04D3,$0000
Pal_AlbumImageBG:                   ; 0A:63AF
; image 00: Toad Award
.dw $0000,$7CFF,$7CFF,$0000,$7D4A,$7FFF,$033F,$0000,\
    $7FFF,$01FF,$02A0,$0000,$7FFF,$7D4A,$0019,$0000,\
    $7FFF,$2E5F,$0D5F,$0000,$7FFF,$7D5F,$0019,$0000,\
    $7FFF,$2E5F,$0019,$0000,$7FFF,$04D3,$22FF,$0000,
; image 01: Mario Award
.dw $0000,$03FF,$027B,$0159,$0000,$03FF,$01F9,$0000,\
    $7FFF,$03FF,$01F9,$0000,$0000,$03FF,$0019,$0000,\
    $7FFF,$7D5F,$0019,$0000,$7FFF,$327F,$7E80,$0000,\
    $7FFF,$327F,$0016,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 02: Peach Award
.dw $0000,$03FF,$3EDF,$01BF,$7FFF,$03FF,$7C1F,$0000,\
    $7C1F,$03FF,$3EDF,$0000,$7FFF,$03FF,$3EDF,$0000,\
    $3FE0,$03FF,$0014,$0000,$0000,$03FF,$0014,$7FFF,\
    $7FFF,$03FF,$01F9,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 03: Bowser Award
.dw $0000,$0096,$0199,$2129,$7FFF,$03FF,$0199,$0000,\
    $7FFF,$03FF,$3E80,$0000,$7FFF,$000D,$0199,$0000,\
    $7FFF,$2129,$0199,$0000,$7FFF,$03E0,$0199,$0000,\
    $0096,$03FF,$0199,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 04: Yoshi Award
.dw $0000,$03FF,$027B,$0159,$7FFF,$03FF,$01F9,$0000,\
    $7FFF,$25E0,$0300,$00E0,$7FFF,$01F9,$25E0,$00E0,\
    $7DFF,$7FFF,$0019,$0000,$7FFF,$7DFF,$0019,$0000,\
    $7FFF,$03FF,$7812,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 05
.dw $7FFF,$02DF,$0016,$0000,$5617,$4114,$200D,$0000,\
    $7FFF,$0220,$0120,$0000,$7FFF,$0018,$365F,$0000,\
    $7FFF,$7E60,$365F,$0000,$7C65,$0018,$365F,$0000,\
    $7C65,$03FF,$0000,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 06
.dw $7FFF,$037F,$012D,$0000,$7FFF,$037F,$0DC0,$0000,\
    $7FFF,$367F,$64A2,$0000,$7FFF,$0018,$64A2,$0000,\
    $367F,$0018,$64A2,$0000,$7FFF,$0018,$367F,$0000,\
    $7FFF,$012D,$64A2,$0000,$0000,$294A,$56B5,$7FFF,
; image 07
.dw $7FFF,$2A5F,$001A,$0000,$7FFF,$001A,$7C08,$0000,\
    $2A5F,$0240,$001A,$0000,$7FFF,$0240,$17AB,$0000,\
    $001A,$0240,$7C08,$0000,$0240,$7C08,$0109,$0000,\
    $7FFF,$0240,$0109,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 08
.dw $7FFF,$7C83,$0018,$0000,$7FFF,$32BE,$0018,$0000,\
    $7FFF,$023F,$008C,$0000,$7FFF,$7C83,$008C,$0000,\
    $7FFF,$7C83,$0220,$0000,$7FFF,$32BE,$0220,$0000,\
    $7FFF,$7FFF,$7FFF,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 09
.dw $7FFF,$7E20,$46FF,$0000,$7FFF,$01FF,$46FF,$0000,\
    $7FFF,$5CBF,$46FF,$0000,$7E20,$01FF,$5CBF,$0000,\
    $7C00,$0016,$46FF,$0000,$7FFF,$0016,$7C00,$0000,\
    $7FFF,$0016,$013F,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 0A
.dw $7FFF,$01FF,$7E20,$0000,$7FFF,$01FF,$3A9F,$0000,\
    $7FFF,$5CBF,$3A9F,$0000,$7E20,$01FF,$5CBF,$0000,\
    $7FFF,$001A,$3A9F,$0000,$7FFF,$5CCD,$3A9F,$0000,\
    $7FFF,$001A,$0010,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 0B
.dw $147F,$0012,$000D,$0827,$311F,$1895,$104B,$0824,\
    $7FFF,$56B5,$294A,$0000,$7FFF,$56B5,$294A,$0000,\
    $7FFF,$56B5,$294A,$0000,$7FFF,$56B5,$294A,$0000,\
    $7FFF,$56B5,$294A,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 0C
.dw $7FFF,$5800,$7CC0,$0000,$7FFF,$011F,$0016,$0000,\
    $2A5F,$0016,$7CC0,$0000,$7FFF,$2A5F,$0016,$0000,\
    $7FFF,$2A5F,$7E20,$0000,$7FFF,$2A5F,$00EB,$0000,\
    $7FFF,$00EB,$7CC0,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 0D
.dw $7FFF,$02E0,$0112,$0000,$7FFF,$02E0,$2812,$0000,\
    $7FFF,$16DF,$0112,$0000,$7FFF,$02E0,$01E0,$0000,\
    $7FFF,$02E0,$7EB5,$0000,$008C,$16DF,$0112,$0000,\
    $7FFF,$16DF,$008C,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 0E
.dw $7FFF,$0218,$110E,$0000,$7FFF,$0218,$231C,$0000,\
    $7FFF,$7EF4,$110E,$0000,$7FFF,$1109,$110E,$0000,\
    $1109,$0218,$110E,$0000,$7FFF,$56B5,$294A,$0000,\
    $7FFF,$56B5,$294A,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 0F
.dw $7FFF,$427F,$673F,$0000,$7FFF,$56B5,$294A,$0000,\
    $7FFF,$56B5,$294A,$0000,$7FFF,$56B5,$294A,$0000,\
    $7FFF,$56B5,$294A,$0000,$7FFF,$56B5,$294A,$0000,\
    $7FFF,$56B5,$294A,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 10
.dw $7FFF,$02BB,$02C2,$0000,$7FFF,$02BB,$437E,$0000,\
    $437E,$02BB,$02C2,$0000,$7FFF,$7EF7,$02BB,$0000,\
    $7FFF,$7EF7,$02C2,$0000,$7FFF,$02BB,$0179,$0000,\
    $7FFF,$7FFF,$7FFF,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 11
.dw $7FFF,$021F,$0C9C,$0000,$7FFF,$27BF,$0C9C,$0000,\
    $7FFF,$021F,$0C93,$0000,$7FFF,$27BF,$021F,$0000,\
    $7FFF,$27BF,$736F,$0000,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$25DA,$3F9F,$0000,
; image 12
.dw $7FFF,$017F,$0282,$0000,$7FFF,$017F,$5693,$0000,\
    $5693,$017F,$238A,$0000,$7FFF,$017F,$03F9,$0000,\
    $7FFF,$017F,$052C,$0000,$7FFF,$238A,$0282,$0000,\
    $7FFF,$017F,$238A,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 13
.dw $7FFF,$0218,$294A,$0000,$7FFF,$3FFF,$294A,$0000,\
    $7FFF,$0131,$294A,$0000,$7FFF,$5295,$294A,$0000,\
    $294A,$0218,$0131,$0000,$7FFF,$7FFF,$7FFF,$0000,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$25DA,$3F9F,$7FFF,
; image 14
.dw $7FFF,$0220,$01FC,$0000,$7FFF,$033F,$01FC,$0000,\
    $7FFF,$0220,$0140,$0000,$7FFF,$0136,$01FC,$0000,\
    $0136,$033F,$01FC,$0000,$021A,$033F,$01FC,$0000,\
    $7FFF,$56B5,$294A,$0000,$7FFF,$56B5,$294A,$0000,
; image 15
.dw $7FFF,$033F,$0019,$0000,$019F,$033F,$0019,$0000,\
    $7FFF,$033F,$019F,$0000,$7FFF,$019F,$0019,$0000,\
    $7FFF,$56B5,$019F,$0000,$7FFF,$0019,$000E,$0000,\
    $7FFF,$56B5,$294A,$0000,$7FFF,$56B5,$294A,$0000,
; image 16
.dw $7FFF,$6A80,$4183,$0000,$7FFF,$03FF,$2D03,$0000,\
    $4183,$6A80,$2D03,$0000,$7FFF,$56B5,$294A,$0000,\
    $7FFF,$56B5,$294A,$0000,$7FFF,$56B5,$294A,$0000,\
    $7FFF,$56B5,$294A,$0000,$7FFF,$56B5,$294A,$0000,
; image 17: Bowser
.dw $7FFF,$0260,$001F,$0421,$7FFF,$03FF,$001F,$0421,\
    $7FFF,$0260,$021E,$0421,$7FFF,$354A,$021E,$0421,\
    $7FFF,$03FF,$0260,$0421,$7FFF,$001F,$021E,$0000,\
    $7FFF,$03FF,$021E,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 18: Bowser
.dw $7FFF,$0260,$001F,$0421,$7FFF,$03FF,$001F,$0421,\
    $7FFF,$0260,$021E,$0421,$7FFF,$354A,$021E,$0421,\
    $7FFF,$03FF,$0260,$0421,$7FFF,$001F,$021E,$0000,\
    $7FFF,$03FF,$021E,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 19: Bowser
.dw $7FFF,$0260,$001F,$0421,$7FFF,$03FF,$001F,$0421,\
    $7FFF,$0260,$021E,$0421,$7FFF,$354A,$021E,$0421,\
    $7FFF,$03FF,$0260,$0421,$7FFF,$001F,$021E,$0000,\
    $7FFF,$03FF,$021E,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 1A: Bowser
.dw $7FFF,$0260,$001F,$0421,$7FFF,$03FF,$001F,$0421,\
    $7FFF,$0260,$021E,$0421,$7FFF,$354A,$021E,$0421,\
    $7FFF,$03FF,$0260,$0421,$7FFF,$001F,$021E,$0000,\
    $7FFF,$03FF,$021E,$0000,$7FFF,$25DA,$3F9F,$0000,
; image 1B: Mario & Luigi
.dw $7FFF,$329E,$0018,$10C6,$7FFF,$329E,$02C0,$10C6,\
    $7FFF,$6D23,$014F,$10C6,$7FFF,$329E,$7E2E,$10C6,\
    $7FFF,$6D23,$0018,$10C6,$7FFF,$6D23,$02C0,$10C6,\
    $7FFF,$035E,$014F,$10C6,$7FFF,$25DA,$3F9F,$0000,
; image 1C: Mario & Luigi
.dw $7FFF,$329E,$0018,$10C6,$7FFF,$329E,$02C0,$10C6,\
    $7FFF,$6D23,$014F,$10C6,$7FFF,$329E,$7E2E,$10C6,\
    $7FFF,$6D23,$0018,$10C6,$7FFF,$6D23,$02C0,$10C6,\
    $7FFF,$035E,$014F,$10C6,$7FFF,$25DA,$3F9F,$0000,
; image 1D: Mario & Luigi
.dw $7FFF,$329E,$0018,$10C6,$7FFF,$329E,$02C0,$10C6,\
    $7FFF,$6D23,$014F,$10C6,$7FFF,$329E,$7E2E,$10C6,\
    $7FFF,$6D23,$0018,$10C6,$7FFF,$6D23,$02C0,$10C6,\
    $7FFF,$035E,$014F,$10C6,$7FFF,$25DA,$3F9F,$0000,
; image 1E: Mario & Luigi
.dw $7FFF,$329E,$0018,$10C6,$7FFF,$329E,$02C0,$10C6,\
    $7FFF,$6D23,$014F,$10C6,$7FFF,$329E,$7E2E,$10C6,\
    $7FFF,$6D23,$0018,$10C6,$7FFF,$6D23,$02C0,$10C6,\
    $7FFF,$035E,$014F,$10C6,$7FFF,$25DA,$3F9F,$0000
AlbumImageGrLengths:                ; 0A:6B6F
.dw $0420,$0500,$0560,$0590,$04B0,$0B00,$07A0,$0B50,\
    $0B00,$0B40,$0B40,$0CC0,$0930,$0B70,$0650,$0840,\
    $0780,$0660,$0990,$05E0,$0740,$08A0,$0640,$0AC0,\
    $0AC0,$0AC0,$0AC0,$0D60,$0D60,$0D60,$0D60
AlbumImageGrPtrs:                   ; 0A:6BAD
.dl Gr_ToadAward                    ; 00
.dl Gr_MarioAward                   ; 01
.dl Gr_PeachAward                   ; 02
.dl Gr_BowserAward                  ; 03
.dl Gr_YoshiAward                   ; 04
.dl Gr_AlbumFireworks               ; 05
.dl Gr_Album1up                     ; 06
.dl Gr_AlbumVine                    ; 07
.dl Gr_AlbumVS                      ; 08
.dl Gr_AlbumPeachKiss               ; 09
.dl Gr_AlbumInfrared                ; 0A
.dl Gr_AlbumRedCoin                 ; 0B
.dl Gr_AlbumHighScore               ; 0C
.dl Gr_AlbumYoshi                   ; 0D
.dl Gr_AlbumGoomba                  ; 0E
.dl Gr_AlbumBlooper                 ; 0F
.dl Gr_AlbumLakitu                  ; 10
.dl Gr_AlbumCheepCheep              ; 11
.dl Gr_AlbumHammerBro               ; 12
.dl Gr_AlbumBulletBill              ; 13
.dl Gr_AlbumKoopa                   ; 14
.dl Gr_AlbumSpiny                   ; 15
.dl Gr_AlbumBuzzy                   ; 16
.dl Gr_AlbumBowser                  ; 17
.dl Gr_AlbumBowser                  ; 18
.dl Gr_AlbumBowser                  ; 19
.dl Gr_AlbumBowser                  ; 1A
.dl Gr_AlbumMarioLuigi              ; 1B
.dl Gr_AlbumMarioLuigi              ; 1C
.dl Gr_AlbumMarioLuigi              ; 1D
.dl Gr_AlbumMarioLuigi              ; 1E
AlbumImageTilemapPtrs:              ; 0A:6C0A
.dl Ti_ToadAward                    ; 00
.dl Ti_MarioAward                   ; 01
.dl Ti_PeachAward                   ; 02
.dl Ti_BowserAward                  ; 03
.dl Ti_YoshiAward                   ; 04
.dl Ti_AlbumFireworks               ; 05
.dl Ti_Album1up                     ; 06
.dl Ti_AlbumVine                    ; 07
.dl Ti_AlbumVS                      ; 08
.dl Ti_AlbumPeachKiss               ; 09
.dl Ti_AlbumInfrared                ; 0A
.dl Ti_AlbumRedCoin                 ; 0B
.dl Ti_AlbumHighScore               ; 0C
.dl Ti_AlbumYoshi                   ; 0D
.dl Ti_AlbumGoomba                  ; 0E
.dl Ti_AlbumBlooper                 ; 0F
.dl Ti_AlbumLakitu                  ; 10
.dl Ti_AlbumCheepCheep              ; 11
.dl Ti_AlbumHammerBro               ; 12
.dl Ti_AlbumBulletBill              ; 13
.dl Ti_AlbumKoopa                   ; 14
.dl Ti_AlbumSpiny                   ; 15
.dl Ti_AlbumBuzzy                   ; 16
.dl Ti_AlbumBowser                  ; 17
.dl Ti_AlbumBowser                  ; 18
.dl Ti_AlbumBowser                  ; 19
.dl Ti_AlbumBowser                  ; 1A
.dl Ti_AlbumMarioLuigi              ; 1B
.dl Ti_AlbumMarioLuigi              ; 1C
.dl Ti_AlbumMarioLuigi              ; 1D
.dl Ti_AlbumMarioLuigi              ; 1E

Code0A6C67:
; Album substate 4
    call Sub00126D                  ; 0A:6C67
    xor  a                          ; 0A:6C6A
    ldh  [<IE],a                    ; 0A:6C6B
    ldh  [<$FF93],a                 ; 0A:6C6D
    ld   a,$0A                      ; 0A:6C6F
    rst  $10                        ; 0A:6C71  24-bit call
.dl SubL_0757EF                     ; 0A:6C72
    ld   a,$0A                      ; 0A:6C75
    rst  $10                        ; 0A:6C77  24-bit call
.dl SubL_075D90                     ; 0A:6C78
    ld   a,[$D90F]                  ; 0A:6C7B
    sla  a                          ; 0A:6C7E
    ld   c,a                        ; 0A:6C80
    ld   b,$00                      ; 0A:6C81
    ld   hl,AlbumImageGrLengths     ; 0A:6C83
    add  hl,bc                      ; 0A:6C86
    ldi  a,[hl]                     ; 0A:6C87
    ldh  [<$FF99],a                 ; 0A:6C88
    ld   a,[hl]                     ; 0A:6C8A
    ldh  [<$FF9A],a                 ; 0A:6C8B
    ld   a,[$D90F]                  ; 0A:6C8D
    ld   c,a                        ; 0A:6C90
    sla  a                          ; 0A:6C91
    add  c                          ; 0A:6C93
    ld   c,a                        ; 0A:6C94
    ldh  [<$FF97],a                 ; 0A:6C95
    ld   b,$00                      ; 0A:6C97
    push bc                         ; 0A:6C99
    ld   hl,AlbumImageGrPtrs        ; 0A:6C9A
    add  hl,bc                      ; 0A:6C9D
    ld   e,[hl]                     ; 0A:6C9E
    inc  hl                         ; 0A:6C9F
    ld   d,[hl]                     ; 0A:6CA0
    inc  hl                         ; 0A:6CA1
    ld   a,[hl]                     ; 0A:6CA2
    ld   [$C415],a                  ; 0A:6CA3
    ld   l,e                        ; 0A:6CA6
    ld   h,d                        ; 0A:6CA7
    ld   de,$8800                   ; 0A:6CA8
    ldh  a,[<$FF99]                 ; 0A:6CAB
    ld   c,a                        ; 0A:6CAD
    ldh  a,[<$FF9A]                 ; 0A:6CAE
    ld   b,a                        ; 0A:6CB0
    ld   a,$0A                      ; 0A:6CB1
    call CopyBytesLong              ; 0A:6CB3
    pop  bc                         ; 0A:6CB6
    ld   hl,AlbumImageTilemapPtrs   ; 0A:6CB7
    add  hl,bc                      ; 0A:6CBA
    ld   e,[hl]                     ; 0A:6CBB
    inc  hl                         ; 0A:6CBC
    ld   d,[hl]                     ; 0A:6CBD
    inc  hl                         ; 0A:6CBE
    ld   a,[hl]                     ; 0A:6CBF
    ld   l,e                        ; 0A:6CC0
    ld   h,d                        ; 0A:6CC1
    ld   b,$0A                      ; 0A:6CC2
    ld   de,$9800                   ; 0A:6CC4
    call LoadScreenTilemapVRAM      ; 0A:6CC7
    call Sub0A6E12                  ; 0A:6CCA
    ld   hl,$9800                   ; 0A:6CCD
    ld   de,$D480                   ; 0A:6CD0
    ld   bc,$0240                   ; 0A:6CD3
    call CopyBytes                  ; 0A:6CD6
    ld   a,$01                      ; 0A:6CD9
    ldh  [<VBK],a                   ; 0A:6CDB
    ld   hl,$9800                   ; 0A:6CDD
    ld   bc,$0240                   ; 0A:6CE0
    call CopyBytes                  ; 0A:6CE3
    ld   a,[$D90F]                  ; 0A:6CE6
    ld   c,$00                      ; 0A:6CE9
    srl  a                          ; 0A:6CEB
    rr   c                          ; 0A:6CED
    srl  a                          ; 0A:6CEF
    rr   c                          ; 0A:6CF1
    ld   b,a                        ; 0A:6CF3
    ld   hl,Pal_AlbumImageBG        ; 0A:6CF4
    add  hl,bc                      ; 0A:6CF7
    ld   de,W_PalBuffer             ; 0A:6CF8
    ld   bc,$0038                   ; 0A:6CFB
    call CopyBytes                  ; 0A:6CFE
    ld   hl,Pal_AlbumImageBG+$38    ; 0A:6D01
    ld   bc,$0008                   ; 0A:6D04
    call CopyBytes                  ; 0A:6D07
    ld   hl,Pal_AlbumImageSpr       ; 0A:6D0A
    ld   bc,$0040                   ; 0A:6D0D
    call CopyBytes                  ; 0A:6D10
    ld   a,$01                      ; 0A:6D13
    ldh  [<$FFC0],a                 ; 0A:6D15
    call Sub000E29                  ; 0A:6D17
    xor  a                          ; 0A:6D1A
    ld   [$C4EC],a                  ; 0A:6D1B
    ld   a,$0A                      ; 0A:6D1E
    call Sub000FCF                  ; 0A:6D20
    xor  a                          ; 0A:6D23
    ldh  [<H_CameraXLow],a          ; 0A:6D24
    ldh  [<H_CameraXHigh],a         ; 0A:6D26
    ldh  [<H_CameraY],a             ; 0A:6D28
    ldh  [<$FFBB],a                 ; 0A:6D2A
    ld   [$C431],a                  ; 0A:6D2C
    ld   [$C418],a                  ; 0A:6D2F
    ld   a,$0F                      ; 0A:6D32
    ld   [$D90C],a                  ; 0A:6D34
    ld   a,$FF                      ; 0A:6D37
    ld   [$DE68],a                  ; 0A:6D39
    ld   a,$09                      ; 0A:6D3C
    ldh  [<IE],a                    ; 0A:6D3E
    ldh  [<$FF93],a                 ; 0A:6D40
    ld   a,$E7                      ; 0A:6D42
    ldh  [<LCDC],a                  ; 0A:6D44
    jp   Sub0A4EC1                  ; 0A:6D46

AlbumPrintGrPtrs:                   ; 0A:6D49
.dl GrPrinter_ToadAward             ; 00
.dl GrPrinter_MarioAward            ; 01
.dl GrPrinter_PeachAward            ; 02
.dl GrPrinter_BowserAward           ; 03
.dl GrPrinter_YoshiAward            ; 04
.dl GrPrinter_AlbumFireworks        ; 05
.dl GrPrinter_Album1up              ; 06
.dl GrPrinter_AlbumVine             ; 07
.dl GrPrinter_AlbumVS               ; 08
.dl GrPrinter_AlbumPeachKiss        ; 09
.dl GrPrinter_AlbumInfrared         ; 0A
.dl Gr_AlbumRedCoin                 ; 0B
.dl GrPrinter_AlbumHighScore        ; 0C
.dl GrPrinter_AlbumYoshi            ; 0D
.dl GrPrinter_AlbumGoomba           ; 0E
.dl GrPrinter_AlbumBlooper          ; 0F
.dl GrPrinter_AlbumLakitu           ; 10
.dl GrPrinter_AlbumCheepCheep       ; 11
.dl GrPrinter_AlbumHammerBro        ; 12
.dl GrPrinter_AlbumBulletBill       ; 13
.dl GrPrinter_AlbumKoopa            ; 14
.dl GrPrinter_AlbumSpiny            ; 15
.dl GrPrinter_AlbumBuzzy            ; 16
.dl GrPrinter_AlbumBowser1          ; 17
.dl GrPrinter_AlbumBowser2          ; 18
.dl GrPrinter_AlbumBowser3          ; 19
.dl GrPrinter_AlbumBowser4          ; 1A
.dl GrPrinter_AlbumMarioLuigi5      ; 1B
.dl GrPrinter_AlbumMarioLuigi6      ; 1C
.dl GrPrinter_AlbumMarioLuigi7      ; 1D
.dl GrPrinter_AlbumMarioLuigi8      ; 1E
AlbumPrintTilemapPtrs:              ; 0A:6DA6
.dl TiPrinter_ToadAward             ; 00
.dl TiPrinter_MarioAward            ; 01
.dl TiPrinter_PeachAward            ; 02
.dl TiPrinter_BowserAward           ; 03
.dl TiPrinter_YoshiAward            ; 04
.dl Ti_AlbumFireworks               ; 05
.dl Ti_Album1up                     ; 06
.dl Ti_AlbumVine                    ; 07
.dl Ti_AlbumVS                      ; 08
.dl Ti_AlbumPeachKiss               ; 09
.dl Ti_AlbumInfrared                ; 0A
.dl Ti_AlbumRedCoin                 ; 0B
.dl Ti_AlbumHighScore               ; 0C
.dl Ti_AlbumYoshi                   ; 0D
.dl Ti_AlbumGoomba                  ; 0E
.dl Ti_AlbumBlooper                 ; 0F
.dl Ti_AlbumLakitu                  ; 10
.dl Ti_AlbumCheepCheep              ; 11
.dl Ti_AlbumHammerBro               ; 12
.dl Ti_AlbumBulletBill              ; 13
.dl Ti_AlbumKoopa                   ; 14
.dl Ti_AlbumSpiny                   ; 15
.dl Ti_AlbumBuzzy                   ; 16
.dl TiPrinter_AlbumBowser1          ; 17
.dl TiPrinter_AlbumBowser2          ; 18
.dl TiPrinter_AlbumBowser3          ; 19
.dl TiPrinter_AlbumBowser4          ; 1A
.dl TiPrinter_AlbumMarioLuigi5      ; 1B
.dl TiPrinter_AlbumMarioLuigi6      ; 1C
.dl TiPrinter_AlbumMarioLuigi7      ; 1D
.dl TiPrinter_AlbumMarioLuigi8      ; 1E
Data0A6E03:                         ; 0A:6E03
.db $03,$01,$01,$01,$01
Data0A6E08:                         ; 0A:6E08
.db $02,$08,$03,$07,$03,$01,$03,$04,\
    $03,$02

Sub0A6E12:
    ld   a,[$D900]                  ; 0A:6E12
    ld   c,a                        ; 0A:6E15
    ld   b,$00                      ; 0A:6E16
    cp   $00                        ; 0A:6E18
    jr   nz,Code0A6E31              ; 0A:6E1A
    ld   a,[$D90F]                  ; 0A:6E1C
    sla  a                          ; 0A:6E1F
    ld   e,a                        ; 0A:6E21
    ld   d,b                        ; 0A:6E22
    ld   hl,Data0A6E08              ; 0A:6E23
    add  hl,de                      ; 0A:6E26
    ldi  a,[hl]                     ; 0A:6E27
    ld   [$CDF3],a                  ; 0A:6E28
    ld   a,[hl]                     ; 0A:6E2B
    ld   [$C4E1],a                  ; 0A:6E2C
    jr   Code0A6E39                 ; 0A:6E2F
Code0A6E31:
    ld   hl,Data0A6E03              ; 0A:6E31
    add  hl,bc                      ; 0A:6E34
    ld   a,[hl]                     ; 0A:6E35
    ld   [$CDF3],a                  ; 0A:6E36
Code0A6E39:
    ld   a,$00                      ; 0A:6E39
    ld   [$D913],a                  ; 0A:6E3B
    ld   a,$D0                      ; 0A:6E3E
    ld   [$D914],a                  ; 0A:6E40
    ld   a,$02                      ; 0A:6E43
    ld   [$D915],a                  ; 0A:6E45
    ld   a,[$D90F]                  ; 0A:6E48
    ldh  [<$FF97],a                 ; 0A:6E4B
    ld   a,c                        ; 0A:6E4D
    cp   $03                        ; 0A:6E4E
    jr   c,Code0A6E7F               ; 0A:6E50
    call Sub0A6EF0                  ; 0A:6E52
    ld   a,[$D927]                  ; 0A:6E55
    cp   $03                        ; 0A:6E58
    jr   nz,Code0A6E7F              ; 0A:6E5A
    ld   a,$02                      ; 0A:6E5C
    ld   [$CDF3],a                  ; 0A:6E5E
    ld   a,$09                      ; 0A:6E61
    ld   [$C4E1],a                  ; 0A:6E63
    ld   a,[$D90D]                  ; 0A:6E66
    sla  a                          ; 0A:6E69
    ld   e,a                        ; 0A:6E6B
    ld   a,[$D900]                  ; 0A:6E6C
    sla  a                          ; 0A:6E6F
    ld   c,a                        ; 0A:6E71
    ld   b,$00                      ; 0A:6E72
    ld   hl,AlbumPageImageIDPtrs    ; 0A:6E74
    add  hl,bc                      ; 0A:6E77
    ldi  a,[hl]                     ; 0A:6E78
    ld   h,[hl]                     ; 0A:6E79
    ld   l,a                        ; 0A:6E7A
    ld   a,[hl]                     ; 0A:6E7B
    add  e                          ; 0A:6E7C
    ldh  [<$FF97],a                 ; 0A:6E7D
Code0A6E7F:
    ldh  a,[<$FF97]                 ; 0A:6E7F
    ld   c,a                        ; 0A:6E81
    sla  a                          ; 0A:6E82
    add  c                          ; 0A:6E84
    ld   c,a                        ; 0A:6E85
    ld   b,$00                      ; 0A:6E86
    ld   hl,AlbumPrintGrPtrs        ; 0A:6E88
    add  hl,bc                      ; 0A:6E8B
    ld   e,[hl]                     ; 0A:6E8C
    inc  hl                         ; 0A:6E8D
    ld   d,[hl]                     ; 0A:6E8E
    inc  hl                         ; 0A:6E8F
    ld   a,[hl]                     ; 0A:6E90
    inc  hl                         ; 0A:6E91
    ld   [$C415],a                  ; 0A:6E92
    ld   [$C438],a                  ; 0A:6E95
    ldi  a,[hl]                     ; 0A:6E98
    ld   [$C436],a                  ; 0A:6E99
    ldi  a,[hl]                     ; 0A:6E9C
    ld   [$C437],a                  ; 0A:6E9D
    ld   l,e                        ; 0A:6EA0
    ld   h,d                        ; 0A:6EA1
    ld   a,$02                      ; 0A:6EA2
    ldh  [<SVBK],a                  ; 0A:6EA4
    ld   de,$D800                   ; 0A:6EA6
    ld   bc,$0800                   ; 0A:6EA9
    ld   a,$0A                      ; 0A:6EAC
    call CopyBytesLong              ; 0A:6EAE
    ld   de,$D000                   ; 0A:6EB1
    ld   bc,$0800                   ; 0A:6EB4
    ld   a,$0A                      ; 0A:6EB7
    call CopyBytesLong              ; 0A:6EB9
    ld   a,$00                      ; 0A:6EBC
    ldh  [<SVBK],a                  ; 0A:6EBE
    ldh  a,[<$FF97]                 ; 0A:6EC0
    ld   c,a                        ; 0A:6EC2
    sla  a                          ; 0A:6EC3
    add  c                          ; 0A:6EC5
    ld   c,a                        ; 0A:6EC6
    ld   b,$00                      ; 0A:6EC7
    ld   hl,AlbumPrintTilemapPtrs   ; 0A:6EC9
    add  hl,bc                      ; 0A:6ECC
    ld   e,[hl]                     ; 0A:6ECD
    inc  hl                         ; 0A:6ECE
    ld   d,[hl]                     ; 0A:6ECF
    inc  hl                         ; 0A:6ED0
    ld   a,[hl]                     ; 0A:6ED1
    ld   [$C415],a                  ; 0A:6ED2
    ld   [$C435],a                  ; 0A:6ED5
    ld   l,e                        ; 0A:6ED8
    ld   h,d                        ; 0A:6ED9
    ld   a,$0A                      ; 0A:6EDA
    call LoadScreenTilemapD000      ; 0A:6EDC
    ld   a,l                        ; 0A:6EDF
    ld   [$C433],a                  ; 0A:6EE0
    ld   a,h                        ; 0A:6EE3
    ld   [$C434],a                  ; 0A:6EE4
    ret                             ; 0A:6EE7

VRAMPtrs0A6EE8:                     ; 0A:6EE8
.dw $9800,$9920,$980A,$992A

Sub0A6EF0:
    ld   a,[$D900]                  ; 0A:6EF0
    sla  a                          ; 0A:6EF3
    ld   c,a                        ; 0A:6EF5
    ld   b,$00                      ; 0A:6EF6
    ld   hl,AlbumPageImageIDPtrs    ; 0A:6EF8
    add  hl,bc                      ; 0A:6EFB
    ldi  a,[hl]                     ; 0A:6EFC
    ld   h,[hl]                     ; 0A:6EFD
    ld   l,a                        ; 0A:6EFE
    ld   b,$00                      ; 0A:6EFF
    ld   a,[hl]                     ; 0A:6F01
    ld   c,a                        ; 0A:6F02
    ld   a,$04                      ; 0A:6F03
    ldh  [<$FF9A],a                 ; 0A:6F05
Code0A6F07:
    ld   a,c                        ; 0A:6F07
    srl  a                          ; 0A:6F08
    srl  a                          ; 0A:6F0A
    srl  a                          ; 0A:6F0C
    add  $29                        ; 0A:6F0E
    ld   e,a                        ; 0A:6F10
    ld   a,$C4                      ; 0A:6F11
    adc  $00                        ; 0A:6F13
    ld   d,a                        ; 0A:6F15
    ld   a,c                        ; 0A:6F16
    srl  a                          ; 0A:6F17
    srl  a                          ; 0A:6F19
    srl  a                          ; 0A:6F1B
    add  $2D                        ; 0A:6F1D
    ld   l,a                        ; 0A:6F1F
    ld   a,$C4                      ; 0A:6F20
    adc  $00                        ; 0A:6F22
    ld   h,a                        ; 0A:6F24
    ld   a,[de]                     ; 0A:6F25
    and  [hl]                       ; 0A:6F26
    ldh  [<$FF99],a                 ; 0A:6F27
    ld   a,c                        ; 0A:6F29
    and  $07                        ; 0A:6F2A
    ld   e,a                        ; 0A:6F2C
    ld   d,$00                      ; 0A:6F2D
    ld   hl,BitTable8Desc           ; 0A:6F2F
    add  hl,de                      ; 0A:6F32
    ldh  a,[<$FF99]                 ; 0A:6F33
    and  [hl]                       ; 0A:6F35
    jr   z,Code0A6F3C               ; 0A:6F36
    ld   a,b                        ; 0A:6F38
    add  $10                        ; 0A:6F39
    ld   b,a                        ; 0A:6F3B
Code0A6F3C:
    srl  b                          ; 0A:6F3C
    inc  c                          ; 0A:6F3E
    ldh  a,[<$FF9A]                 ; 0A:6F3F
    dec  a                          ; 0A:6F41
    ldh  [<$FF9A],a                 ; 0A:6F42
    jr   nz,Code0A6F07              ; 0A:6F44
    ld   c,$00                      ; 0A:6F46
Code0A6F48:
    srl  b                          ; 0A:6F48
    jr   c,Code0A6F77               ; 0A:6F4A
    ld   a,c                        ; 0A:6F4C
    sla  a                          ; 0A:6F4D
    ld   e,a                        ; 0A:6F4F
    ld   d,$00                      ; 0A:6F50
    ld   hl,VRAMPtrs0A6EE8          ; 0A:6F52
    add  hl,de                      ; 0A:6F55
    ldi  a,[hl]                     ; 0A:6F56
    ld   h,[hl]                     ; 0A:6F57
    ld   l,a                        ; 0A:6F58
    ld   e,$09                      ; 0A:6F59
Code0A6F5B:
    ld   d,$0A                      ; 0A:6F5B
Code0A6F5D:
    ld   a,$01                      ; 0A:6F5D
    ldh  [<VBK],a                   ; 0A:6F5F
    ld   [hl],$07                   ; 0A:6F61
    xor  a                          ; 0A:6F63
    ldh  [<VBK],a                   ; 0A:6F64
    ld   a,$81                      ; 0A:6F66
    ldi  [hl],a                     ; 0A:6F68
    dec  d                          ; 0A:6F69
    jr   nz,Code0A6F5D              ; 0A:6F6A
    ld   a,l                        ; 0A:6F6C
    add  $16                        ; 0A:6F6D
    ld   l,a                        ; 0A:6F6F
    ld   a,h                        ; 0A:6F70
    adc  $00                        ; 0A:6F71
    ld   h,a                        ; 0A:6F73
    dec  e                          ; 0A:6F74
    jr   nz,Code0A6F5B              ; 0A:6F75
Code0A6F77:
    inc  c                          ; 0A:6F77
    ld   a,c                        ; 0A:6F78
    cp   $04                        ; 0A:6F79
    jr   nz,Code0A6F48              ; 0A:6F7B
    ret                             ; 0A:6F7D

Code0A6F7E:
; Album substate 5
    ld   a,$0A                      ; 0A:6F7E
    call Sub00160F                  ; 0A:6F80
    ldh  a,[<H_ButtonsPressed]      ; 0A:6F83
    bit  1,a                        ; 0A:6F85
    jr   z,Code0A6F92               ; 0A:6F87
    ld   a,$63                      ; 0A:6F89
    ldh  [<$FFF2],a                 ; 0A:6F8B
    ld   a,$01                      ; 0A:6F8D
    ldh  [<H_GameSubstate],a        ; 0A:6F8F
    ret                             ; 0A:6F91

Code0A6F92:
    bit  0,a                        ; 0A:6F92
    jr   z,Return0A6FAB             ; 0A:6F94
    ld   a,$31                      ; 0A:6F96
    ldh  [<$FFF3],a                 ; 0A:6F98
    ldh  a,[<H_GameState]           ; 0A:6F9A
    ld   [$C416],a                  ; 0A:6F9C
    ldh  a,[<H_GameSubstate]        ; 0A:6F9F
    ld   [$C417],a                  ; 0A:6FA1
    ld   a,$06                      ; 0A:6FA4
    ldh  [<H_GameSubstate],a        ; 0A:6FA6
    jp   Sub0010AD                  ; 0A:6FA8
Return0A6FAB:
    ret                             ; 0A:6FAB

Data0A6FAC:                         ; 0A:6FAC
.db $10,$19,$00,$0F,$10,$21,$38,$0F,\
    $10,$29,$3C,$0F,$10,$31,$40,$0F,\
    $10,$39,$44,$0F,$10,$41,$48,$0F,\
    $10,$49,$4C,$0F,$10,$51,$1C,$0F,\
    $20,$19,$02,$0F,$20,$21,$3A,$0F,\
    $20,$29,$3E,$0F,$20,$31,$42,$0F,\
    $20,$39,$46,$0F,$20,$41,$4A,$0F,\
    $20,$49,$4E,$0F,$20,$51,$1E,$0F
Data0A6FEC:                         ; 0A:6FEC
.db $10,$59,$00,$0F,$10,$61,$50,$0F,\
    $10,$69,$54,$0F,$10,$71,$58,$0F,\
    $10,$79,$5C,$0F
Data0A7000:                         ; 0A:7000
.db $10,$81,$60,$0F,$10,$89,$64,$0F,\
    $10,$91,$1C,$0F,$20,$59,$02,$0F,\
    $20,$61,$52,$0F,$20,$69,$56,$0F,\
    $20,$71,$5A,$0F,$20,$79,$5E,$0F,\
    $20,$81,$62,$0F,$20,$89,$66,$0F,\
    $20,$91,$1E,$0F

Code0A702C:
; Album substate 6
    ld   hl,$C178                   ; 0A:702C
    dec  [hl]                       ; 0A:702F
    dec  [hl]                       ; 0A:7030
    ld   a,[hl]                     ; 0A:7031
    cp   $78                        ; 0A:7032
    jr   nz,Code0A703A              ; 0A:7034
    ld   hl,H_GameSubstate          ; 0A:7036
    inc  [hl]                       ; 0A:7039
Code0A703A:
    ld   hl,Data0A6FAC              ; 0A:703A
    ld   a,[$C418]                  ; 0A:703D
    and  a                          ; 0A:7040
    jr   z,Code0A7046               ; 0A:7041
    ld   hl,Data0A6FEC              ; 0A:7043
Code0A7046:
    ld   de,W_OAMBuffer             ; 0A:7046
    ld   a,[$C178]                  ; 0A:7049
    ld   c,a                        ; 0A:704C
    ld   b,$10                      ; 0A:704D
Code0A704F:
    ldi  a,[hl]                     ; 0A:704F
    add  c                          ; 0A:7050
    ld   [de],a                     ; 0A:7051
    inc  de                         ; 0A:7052
    ldi  a,[hl]                     ; 0A:7053
    ld   [de],a                     ; 0A:7054
    inc  de                         ; 0A:7055
    ldi  a,[hl]                     ; 0A:7056
    ld   [de],a                     ; 0A:7057
    inc  de                         ; 0A:7058
    ldi  a,[hl]                     ; 0A:7059
    ld   [de],a                     ; 0A:705A
    inc  de                         ; 0A:705B
    dec  b                          ; 0A:705C
    jr   nz,Code0A704F              ; 0A:705D
    ret                             ; 0A:705F

Code0A7060:
; Album substate 7
    ldh  a,[<H_ButtonsPressed]      ; 0A:7060
    bit  1,a                        ; 0A:7062
    jr   z,Code0A7071               ; 0A:7064
    ld   a,$31                      ; 0A:7066
    ldh  [<$FFF3],a                 ; 0A:7068
    ld   hl,H_GameSubstate          ; 0A:706A
    inc  [hl]                       ; 0A:706D
    jp   Code0A703A                 ; 0A:706E
Code0A7071:
    bit  0,a                        ; 0A:7071
    jr   z,Code0A7099               ; 0A:7073
    call Sub0010A9                  ; 0A:7075
    ld   a,[$C418]                  ; 0A:7078
    and  a                          ; 0A:707B
    jr   z,Code0A7092               ; 0A:707C
    ld   a,$09                      ; 0A:707E
    ld   [$CDF4],a                  ; 0A:7080
    ld   a,$2E                      ; 0A:7083
    ldh  [<H_GameState],a           ; 0A:7085
    ld   a,$05                      ; 0A:7087
    ldh  [<H_GameSubstate],a        ; 0A:7089
    ldh  a,[<LCDC]                  ; 0A:708B
    res  5,a                        ; 0A:708D
    ldh  [<LCDC],a                  ; 0A:708F
    ret                             ; 0A:7091

Code0A7092:
    ld   a,$09                      ; 0A:7092
    ldh  [<H_GameSubstate],a        ; 0A:7094
    jp   Code0A703A                 ; 0A:7096
Code0A7099:
    and  $30                        ; 0A:7099
    jr   z,Code0A70B7               ; 0A:709B
    and  $10                        ; 0A:709D
    swap a                          ; 0A:709F
    ld   c,a                        ; 0A:70A1
    ld   a,[$C418]                  ; 0A:70A2
    cp   c                          ; 0A:70A5
    jr   nz,Code0A70AF              ; 0A:70A6
    ld   a,$30                      ; 0A:70A8
    ldh  [<$FFF3],a                 ; 0A:70AA
    jp   Code0A703A                 ; 0A:70AC
Code0A70AF:
    ld   a,c                        ; 0A:70AF
    ld   [$C418],a                  ; 0A:70B0
    ld   a,$47                      ; 0A:70B3
    ldh  [<$FFF2],a                 ; 0A:70B5
Code0A70B7:
    jp   Code0A703A                 ; 0A:70B7

Code0A70BA:
; Album substate 8
    ld   hl,$C178                   ; 0A:70BA
    inc  [hl]                       ; 0A:70BD
    inc  [hl]                       ; 0A:70BE
    ld   a,[hl]                     ; 0A:70BF
    cp   $90                        ; 0A:70C0
    jr   nz,Code0A70C8              ; 0A:70C2
    ld   a,$05                      ; 0A:70C4
    ldh  [<H_GameSubstate],a        ; 0A:70C6
Code0A70C8:
    jp   Code0A703A                 ; 0A:70C8

Pal_0A70CB:                         ; 0A:70CB
.dw $7FFF,$7E4A,$0180,$0000,$4FDA,$7FBC,$294A,$0000,\
    $7E4A,$7FBC,$7FFF,$0000,$7FFF,$5294,$35AD,$0000,\
    $0000,$5294,$294A,$0180,$4FDA,$365F,$0015,$0009,\
    $7FFF,$1998,$000E,$0000,$7FFF,$04D3,$22FF,$0000,\
    $4FDA,$7FFF,$0180,$0000,$4FDA,$365F,$0C9F,$0000,\
    $7E4A,$7FFF,$7FFF,$0000,$7FFF,$5294,$39CE,$0000,\
    $473D,$1998,$000E,$0000,$7FFF,$5294,$294A,$0000,\
    $7DE0,$7FFF,$02BC,$0019,$7FFF,$22FF,$04D3,$0000

Code0A714B:
; Album substate 9
    call Sub00126D                  ; 0A:714B
    xor  a                          ; 0A:714E
    ldh  [<IE],a                    ; 0A:714F
    ldh  [<$FF93],a                 ; 0A:7151
    ld   a,:Data267DE0              ; 0A:7153
    ld   [$C415],a                  ; 0A:7155
    ld   hl,Data267DE0              ; 0A:7158
    ld   de,$9000                   ; 0A:715B
    ld   bc,$0100                   ; 0A:715E
    ld   a,$0A                      ; 0A:7161
    call CopyBytesLong              ; 0A:7163
    ld   a,$25                      ; 0A:7166
    ld   [$C415],a                  ; 0A:7168
    ld   hl,$C471                   ; 0A:716B
    ld   de,$8800                   ; 0A:716E
    ld   a,$6C                      ; 0A:7171
    ldh  [<$FF97],a                 ; 0A:7173
Code0A7175:
    ldi  a,[hl]                     ; 0A:7175
    push hl                         ; 0A:7176
    xor  $80                        ; 0A:7177
    ld   c,$00                      ; 0A:7179
    srl  a                          ; 0A:717B
    rr   c                          ; 0A:717D
    srl  a                          ; 0A:717F
    rr   c                          ; 0A:7181
    srl  a                          ; 0A:7183
    rr   c                          ; 0A:7185
    srl  a                          ; 0A:7187
    rr   c                          ; 0A:7189
    ld   b,a                        ; 0A:718B
    ld   hl,Data254800              ; 0A:718C
    add  hl,bc                      ; 0A:718F
    ld   bc,$0010                   ; 0A:7190
    ld   a,$0A                      ; 0A:7193
    call CopyBytesLong              ; 0A:7195
    pop  hl                         ; 0A:7198
    ldh  a,[<$FF97]                 ; 0A:7199
    dec  a                          ; 0A:719B
    ldh  [<$FF97],a                 ; 0A:719C
    jr   nz,Code0A7175              ; 0A:719E
    ld   a,$02                      ; 0A:71A0
    ldh  [<SVBK],a                  ; 0A:71A2
    ld   hl,$9000                   ; 0A:71A4
    ld   de,$D000                   ; 0A:71A7
    ld   bc,$0800                   ; 0A:71AA
    call CopyBytes                  ; 0A:71AD
    ld   hl,$8800                   ; 0A:71B0
    ld   bc,$0800                   ; 0A:71B3
    call CopyBytes                  ; 0A:71B6
    ld   a,$00                      ; 0A:71B9
    ldh  [<SVBK],a                  ; 0A:71BB
    ld   hl,$D000                   ; 0A:71BD
    ld   de,$D240                   ; 0A:71C0
    ld   bc,$0240                   ; 0A:71C3
Code0A71C6:
    ld   a,$0B                      ; 0A:71C6
    ldi  [hl],a                     ; 0A:71C8
    ld   a,$06                      ; 0A:71C9
    ld   [de],a                     ; 0A:71CB
    inc  de                         ; 0A:71CC
    dec  bc                         ; 0A:71CD
    ld   a,b                        ; 0A:71CE
    or   c                          ; 0A:71CF
    jr   nz,Code0A71C6              ; 0A:71D0
    ld   a,$24                      ; 0A:71D2
    ld   [$C415],a                  ; 0A:71D4
    ld   hl,Data245800              ; 0A:71D7
    ld   de,$D0A0                   ; 0A:71DA
    ld   bc,$0100                   ; 0A:71DD
    ld   a,$0A                      ; 0A:71E0
    call CopyBytesLong              ; 0A:71E2
    ld   de,$D2E0                   ; 0A:71E5
    ld   bc,$0100                   ; 0A:71E8
    ld   a,$0A                      ; 0A:71EB
    call CopyBytesLong              ; 0A:71ED
    call Sub0A7268                  ; 0A:71F0
    ld   hl,$D000                   ; 0A:71F3
    ld   de,$9800                   ; 0A:71F6
    ld   bc,$0240                   ; 0A:71F9
    call CopyBytes                  ; 0A:71FC
    ld   a,$01                      ; 0A:71FF
    ldh  [<VBK],a                   ; 0A:7201
    ld   de,$9800                   ; 0A:7203
    ld   bc,$0240                   ; 0A:7206
    call CopyBytes                  ; 0A:7209
    xor  a                          ; 0A:720C
    ldh  [<VBK],a                   ; 0A:720D
    ld   a,$03                      ; 0A:720F
    ld   [$C4EC],a                  ; 0A:7211
    ld   a,$0A                      ; 0A:7214
    call Sub000FCF                  ; 0A:7216
    ld   a,$0A                      ; 0A:7219
    ld   b,$0A                      ; 0A:721B
    ld   de,Pal_0A70CB              ; 0A:721D
    call LoadFullPaletteLong        ; 0A:7220
    call Sub000E29                  ; 0A:7223
    xor  a                          ; 0A:7226
    ldh  [<H_CameraXLow],a          ; 0A:7227
    ldh  [<H_CameraXHigh],a         ; 0A:7229
    ldh  [<H_CameraY],a             ; 0A:722B
    ldh  [<$FFBB],a                 ; 0A:722D
    ld   [$C4EC],a                  ; 0A:722F
    ld   [$C418],a                  ; 0A:7232
    ld   a,$01                      ; 0A:7235
    ld   [$CDF3],a                  ; 0A:7237
    ld   a,$80                      ; 0A:723A
    ld   [$D913],a                  ; 0A:723C
    ld   a,$D0                      ; 0A:723F
    ld   [$D914],a                  ; 0A:7241
    ld   a,$02                      ; 0A:7244
    ld   [$D915],a                  ; 0A:7246
    ld   a,$05                      ; 0A:7249
    ld   [$CDF4],a                  ; 0A:724B
    ld   a,$01                      ; 0A:724E
    ld   [$C431],a                  ; 0A:7250
    ld   a,$09                      ; 0A:7253
    ldh  [<IE],a                    ; 0A:7255
    ldh  [<$FF93],a                 ; 0A:7257
    ld   a,$E7                      ; 0A:7259
    ldh  [<LCDC],a                  ; 0A:725B
    ld   hl,H_GameSubstate          ; 0A:725D
    inc  [hl]                       ; 0A:7260
    ret                             ; 0A:7261

DataPtrs0A7262:
.dw Data245800, Data245A00, Data245C00

Sub0A7268:
    ld   a,$24                      ; 0A:7268
    ld   [$C415],a                  ; 0A:726A
    ld   a,[$C4FD]                  ; 0A:726D
    cp   $03                        ; 0A:7270
    jr   z,Code0A7296               ; 0A:7272
    sla  a                          ; 0A:7274
    ld   c,a                        ; 0A:7276
    ld   b,$00                      ; 0A:7277
    ld   hl,DataPtrs0A7262          ; 0A:7279
    add  hl,bc                      ; 0A:727C
    ldi  a,[hl]                     ; 0A:727D
    ld   h,[hl]                     ; 0A:727E
    ld   l,a                        ; 0A:727F
    ld   de,$D0A0                   ; 0A:7280
    ld   bc,$0100                   ; 0A:7283
    ld   a,$0A                      ; 0A:7286
    call CopyBytesLong              ; 0A:7288
    ld   de,$D2E0                   ; 0A:728B
    ld   bc,$0100                   ; 0A:728E
    ld   a,$0A                      ; 0A:7291
    jp   CopyBytesLong              ; 0A:7293
Code0A7296:
    ld   hl,$D0A0                   ; 0A:7296
    ld   de,$D2E0                   ; 0A:7299
    ld   bc,$0100                   ; 0A:729C
Code0A729F:
    ld   a,[hl]                     ; 0A:729F
    bit  7,a                        ; 0A:72A0
    jr   z,Code0A72A7               ; 0A:72A2
    inc  hl                         ; 0A:72A4
    jr   Code0A72AD                 ; 0A:72A5
Code0A72A7:
    ld   a,$0B                      ; 0A:72A7
    ldi  [hl],a                     ; 0A:72A9
    ld   a,$06                      ; 0A:72AA
    ld   [de],a                     ; 0A:72AC
Code0A72AD:
    inc  de                         ; 0A:72AD
    dec  bc                         ; 0A:72AE
    ld   a,b                        ; 0A:72AF
    or   c                          ; 0A:72B0
    jr   nz,Code0A729F              ; 0A:72B1
    ret                             ; 0A:72B3

Code0A72B4:
; Album substate A
    ld   a,$0A                      ; 0A:72B4
    call Sub00160F                  ; 0A:72B6
    ldh  a,[<H_ButtonsPressed]      ; 0A:72B9
    bit  1,a                        ; 0A:72BB
    jr   z,Code0A72C9               ; 0A:72BD
    ld   a,$63                      ; 0A:72BF
    ldh  [<$FFF2],a                 ; 0A:72C1
    ld   a,$04                      ; 0A:72C3
    ldh  [<H_GameSubstate],a        ; 0A:72C5
    jr   Return0A7315               ; 0A:72C7
Code0A72C9:
    bit  0,a                        ; 0A:72C9
    jr   z,Code0A72E8               ; 0A:72CB
    ld   a,$31                      ; 0A:72CD
    ldh  [<$FFF3],a                 ; 0A:72CF
    ldh  a,[<H_GameState]           ; 0A:72D1
    ld   [$C416],a                  ; 0A:72D3
    ldh  a,[<H_GameSubstate]        ; 0A:72D6
    ld   [$C417],a                  ; 0A:72D8
    ld   a,$2E                      ; 0A:72DB
    ldh  [<H_GameState],a           ; 0A:72DD
    xor  a                          ; 0A:72DF
    ldh  [<H_GameSubstate],a        ; 0A:72E0
    ld   [$C418],a                  ; 0A:72E2
    jp   Sub0010AD                  ; 0A:72E5
Code0A72E8:
    and  $30                        ; 0A:72E8
    jr   z,Return0A7315             ; 0A:72EA
    ld   a,[$C4FD]                  ; 0A:72EC
    inc  a                          ; 0A:72EF
    and  $03                        ; 0A:72F0
    ld   [$C4FD],a                  ; 0A:72F2
    call Sub0A7268                  ; 0A:72F5
    ld   a,$01                      ; 0A:72F8
    ld   [$C423],a                  ; 0A:72FA
    ld   a,$00                      ; 0A:72FD
    ld   [$C425],a                  ; 0A:72FF
    ld   a,$D0                      ; 0A:7302
    ld   [$C426],a                  ; 0A:7304
    ld   a,$40                      ; 0A:7307
    ld   [$C427],a                  ; 0A:7309
    ld   a,$D2                      ; 0A:730C
    ld   [$C428],a                  ; 0A:730E
    ld   a,$47                      ; 0A:7311
    ldh  [<$FFF2],a                 ; 0A:7313
Return0A7315:
    ret                             ; 0A:7315

Data0A7316:                         ; 0A:7316
.dw $7FFF,$3699,$044F,$0006,$7FFF,$0000,$0000,$0000,\
    $7FFF,$1A77,$044F,$0006,$7FFF,$3699,$044F,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$7FFF,$04D3,$22FF,$0000,\
    $7DE0,$72BF,$3CBF,$04D3,$7DE0,$7FFF,$7D2D,$0000,\
    $7DE0,$025F,$001F,$0000,$7DE0,$7FFF,$02A6,$001D,\
    $7DE0,$7FFF,$02BC,$0019,$7DE0,$7FFF,$02A6,$0120,\
    $7DE0,$7FFF,$02BC,$0019,$7FFF,$22FF,$04D3,$0000

Code0A7396:
; Album substate B
    call Sub001258                  ; 0A:7396
    xor  a                          ; 0A:7399
    ldh  [<IE],a                    ; 0A:739A
    ldh  [<$FF93],a                 ; 0A:739C
    ld   a,$0A                      ; 0A:739E
    rst  $10                        ; 0A:73A0  24-bit call
.dl SubL_075D90                     ; 0A:73A1
    ld   a,$21                      ; 0A:73A4
    ld   [$C415],a                  ; 0A:73A6
    ld   hl,Data217C00              ; 0A:73A9
    ld   de,$8000                   ; 0A:73AC
    ld   bc,$0200                   ; 0A:73AF
    ld   a,$0A                      ; 0A:73B2
    call CopyBytesLong              ; 0A:73B4
    ld   a,$1B                      ; 0A:73B7
    ld   [$C415],a                  ; 0A:73B9
    ld   hl,Data1B7350              ; 0A:73BC
    ld   de,$8800                   ; 0A:73BF
    ld   bc,$0400                   ; 0A:73C2
    ld   a,$0A                      ; 0A:73C5
    call CopyBytesLong              ; 0A:73C7
    call Sub0A7464                  ; 0A:73CA
    ld   a,$02                      ; 0A:73CD
    ldh  [<SVBK],a                  ; 0A:73CF
    ld   hl,$9000                   ; 0A:73D1
    ld   de,$D000                   ; 0A:73D4
    ld   bc,$0800                   ; 0A:73D7
    call CopyBytes                  ; 0A:73DA
    ld   hl,$8800                   ; 0A:73DD
    ld   bc,$0800                   ; 0A:73E0
    call CopyBytes                  ; 0A:73E3
    xor  a                          ; 0A:73E6
    ldh  [<SVBK],a                  ; 0A:73E7
    ld   a,$20                      ; 0A:73E9
    ld   [$C415],a                  ; 0A:73EB
    ld   hl,Data207C40              ; 0A:73EE
    ld   a,$0A                      ; 0A:73F1
    call LoadScreenTilemapD000      ; 0A:73F3
    ld   hl,$D000                   ; 0A:73F6
    ld   de,$9800                   ; 0A:73F9
    ld   bc,$0240                   ; 0A:73FC
    call CopyBytes                  ; 0A:73FF
    ld   a,$01                      ; 0A:7402
    ldh  [<VBK],a                   ; 0A:7404
    ld   de,$9800                   ; 0A:7406
    ld   bc,$0240                   ; 0A:7409
    call CopyBytes                  ; 0A:740C
    xor  a                          ; 0A:740F
    ldh  [<VBK],a                   ; 0A:7410
    ld   a,$0A                      ; 0A:7412
    ld   de,Data0A7316              ; 0A:7414
    ld   b,$0A                      ; 0A:7417
    call LoadFullPaletteLong        ; 0A:7419
    call Sub000E29                  ; 0A:741C
    ld   a,$03                      ; 0A:741F
    ld   [$C4EC],a                  ; 0A:7421
    ld   a,$0A                      ; 0A:7424
    call Sub000FCF                  ; 0A:7426
    xor  a                          ; 0A:7429
    ldh  [<H_CameraXLow],a          ; 0A:742A
    ldh  [<H_CameraXHigh],a         ; 0A:742C
    ldh  [<H_CameraY],a             ; 0A:742E
    ldh  [<$FFBB],a                 ; 0A:7430
    ld   [$C177],a                  ; 0A:7432
    ld   a,$01                      ; 0A:7435
    ld   [$CDF3],a                  ; 0A:7437
    ld   a,$00                      ; 0A:743A
    ld   [$D913],a                  ; 0A:743C
    ld   a,$D0                      ; 0A:743F
    ld   [$D914],a                  ; 0A:7441
    ld   a,$02                      ; 0A:7444
    ld   [$D915],a                  ; 0A:7446
    ld   a,$09                      ; 0A:7449
    ld   [$CDF4],a                  ; 0A:744B
    ld   a,$6D                      ; 0A:744E
    ld   [$DE68],a                  ; 0A:7450
    ld   a,$46                      ; 0A:7453
    ldh  [<$FFF4],a                 ; 0A:7455
    ld   a,$09                      ; 0A:7457
    ldh  [<IE],a                    ; 0A:7459
    ldh  [<$FF93],a                 ; 0A:745B
    ld   a,$E7                      ; 0A:745D
    ldh  [<LCDC],a                  ; 0A:745F
    jp   Sub0A4EC1                  ; 0A:7461

Sub0A7464:
    ld   hl,$C471                   ; 0A:7464
    ld   de,$9100                   ; 0A:7467
    ld   a,$6C                      ; 0A:746A
    ldh  [<$FF97],a                 ; 0A:746C
    ld   a,$25                      ; 0A:746E
    ld   [$C415],a                  ; 0A:7470
Code0A7473:
    ld   b,$00                      ; 0A:7473
    ldi  a,[hl]                     ; 0A:7475
    push hl                         ; 0A:7476
    xor  $80                        ; 0A:7477
    sla  a                          ; 0A:7479
    rl   b                          ; 0A:747B
    sla  a                          ; 0A:747D
    rl   b                          ; 0A:747F
    sla  a                          ; 0A:7481
    rl   b                          ; 0A:7483
    sla  a                          ; 0A:7485
    rl   b                          ; 0A:7487
    ld   c,a                        ; 0A:7489
    ld   hl,Data254800              ; 0A:748A
    add  hl,bc                      ; 0A:748D
    ld   bc,$0010                   ; 0A:748E
    ld   a,$0A                      ; 0A:7491
    call CopyBytesLong              ; 0A:7493
    pop  hl                         ; 0A:7496
    ldh  a,[<$FF97]                 ; 0A:7497
    dec  a                          ; 0A:7499
    ldh  [<$FF97],a                 ; 0A:749A
    jr   nz,Code0A7473              ; 0A:749C
    ret                             ; 0A:749E

Code0A749F:
; Album substate C
    ldh  a,[<H_ButtonsPressed]      ; 0A:749F
    bit  1,a                        ; 0A:74A1
    jr   z,Code0A74B2               ; 0A:74A3
    ld   a,$63                      ; 0A:74A5
    ldh  [<$FFF2],a                 ; 0A:74A7
    ld   a,$18                      ; 0A:74A9
    ldh  [<H_GameState],a           ; 0A:74AB
    xor  a                          ; 0A:74AD
    ld   [$C0C1],a                  ; 0A:74AE
    ret                             ; 0A:74B1

Code0A74B2:
    bit  0,a                        ; 0A:74B2
    jr   z,Code0A74D1               ; 0A:74B4
    ld   a,$31                      ; 0A:74B6
    ldh  [<$FFF3],a                 ; 0A:74B8
    ldh  a,[<H_GameState]           ; 0A:74BA
    ld   [$C416],a                  ; 0A:74BC
    ldh  a,[<H_GameSubstate]        ; 0A:74BF
    ld   [$C417],a                  ; 0A:74C1
    ld   a,$2E                      ; 0A:74C4
    ldh  [<H_GameState],a           ; 0A:74C6
    xor  a                          ; 0A:74C8
    ldh  [<H_GameSubstate],a        ; 0A:74C9
    ld   [$C418],a                  ; 0A:74CB
    jp   Sub0010AD                  ; 0A:74CE
Code0A74D1:
    and  $30                        ; 0A:74D1
    ret  z                          ; 0A:74D3
    and  $10                        ; 0A:74D4
    jr   nz,Code0A74DD              ; 0A:74D6
    ld   a,$30                      ; 0A:74D8
    ldh  [<$FFF3],a                 ; 0A:74DA
    ret                             ; 0A:74DC

Code0A74DD:
    xor  a                          ; 0A:74DD
    ld   [$D900],a                  ; 0A:74DE
    ld   a,$01                      ; 0A:74E1
    ldh  [<H_GameSubstate],a        ; 0A:74E3
    ld   a,$46                      ; 0A:74E5
    ldh  [<$FFF4],a                 ; 0A:74E7
    ret                             ; 0A:74E9
