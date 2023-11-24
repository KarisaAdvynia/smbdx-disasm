.bank $09 slot 1
.orga $4000

Sub094000:
; called by game state 00
    ld   a,$00                      ; 09:4000
    ldh  [<IE],a                    ; 09:4002
    inc  a                          ; 09:4004
    ldh  [<SB],a                    ; 09:4005
    call Sub00126D                  ; 09:4007
    ld   a,$09                      ; 09:400A
    rst  $10                        ; 09:400C  24-bit call
.dl SubL_0756D9                     ; 09:400D
    ld   a,[W_ChalUnlockFlags_x_4]  ; 09:4010
    and  $80                        ; 09:4013
    jr   z,Code09401D               ; 09:4015
    ld   a,[$C4FB]                  ; 09:4017
    and  a                          ; 09:401A
    jr   nz,Code09406C              ; 09:401B
Code09401D:
    ld   a,:Gr_TitleScreen          ; 09:401D
    ld   b,$09                      ; 09:401F
    call LoadGraphicsBank           ; 09:4021
    ld   a,:Pal_PreTitle            ; 09:4024
    ld   b,$09                      ; 09:4026
    ld   de,Pal_PreTitle            ; 09:4028
    call LoadFullPaletteLong        ; 09:402B
    call Sub00128D                  ; 09:402E
    ld   a,:Ti_PreTitle             ; 09:4031
    ld   b,$09                      ; 09:4033
    ld   de,$99C0                   ; 09:4035
    ld   hl,Ti_PreTitle             ; 09:4038
    call LoadScreenTilemapVRAM      ; 09:403B
    ld   a,$00                      ; 09:403E
    ldh  [<H_GameSubstate],a        ; 09:4040
    ld   [$C1B4],a                  ; 09:4042
    ldh  [<H_CameraXHigh],a         ; 09:4045
    ldh  [<$FFBB],a                 ; 09:4047
    ld   a,$04                      ; 09:4049
    ldh  [<H_CameraXLow],a          ; 09:404B
    ld   a,$70                      ; 09:404D
    ldh  [<H_CameraY],a             ; 09:404F
    ld   hl,W_TiUpBuffer            ; 09:4051
    ld   [hl],$99                   ; 09:4054 \ Tilemap upload: 99 D4 D2 08 7F 00
    inc  hl                         ; 09:4056
    ld   [hl],$D4                   ; 09:4057
    inc  hl                         ; 09:4059
    ld   [hl],$D2                   ; 09:405A
    inc  hl                         ; 09:405C
    ld   [hl],$08                   ; 09:405D
    inc  hl                         ; 09:405F
    ld   [hl],$7F                   ; 09:4060
    inc  hl                         ; 09:4062
    ld   [hl],$00                   ; 09:4063 /
    ld   a,$09                      ; 09:4065
    call Sub001480                  ; 09:4067
    jr   Code094096                 ; 09:406A
Code09406C:
    ld   a,$07                      ; 09:406C
    ld   [$C500],a                  ; 09:406E
    ld   a,$09                      ; 09:4071
    rst  $10                        ; 09:4073  24-bit call
.dl SubL_075F15                     ; 09:4074
    ld   a,$09                      ; 09:4077
    rst  $10                        ; 09:4079  24-bit call
.dl SubL_157B22                     ; 09:407A
    ld   hl,$C471                   ; 09:407D
    ld   a,[hl]                     ; 09:4080
    cp   $C0                        ; 09:4081
    jr   z,Code09408D               ; 09:4083
    cp   $DB                        ; 09:4085
    jr   z,Code09408D               ; 09:4087
    cp   $DC                        ; 09:4089
    jr   nz,Code094096              ; 09:408B
Code09408D:
    ld   a,$01                      ; 09:408D
    ld   [$C4F5],a                  ; 09:408F
    ld   a,$02                      ; 09:4092
    ldh  [<H_GameSubstate],a        ; 09:4094
Code094096:
    ld   a,$09                      ; 09:4096
    ldh  [<IE],a                    ; 09:4098
    ld   a,$87                      ; 09:409A
    ldh  [<LCDC],a                  ; 09:409C
    ld   hl,H_GameState             ; 09:409E
    inc  [hl]                       ; 09:40A1
    ld   a,$01                      ; 09:40A2
    ld   [$DA6E],a                  ; 09:40A4
    ret                             ; 09:40A7

PreTitleMain_CallSubstate:
; called by game state 01
    ldh  a,[<H_GameSubstate]        ; 09:40A8
    rst  $00                        ; 09:40AA  Execute from 16-bit pointer table
.dw Code0940B1                      ; 09:40AB
.dw Code0940CB                      ; 09:40AD
.dw Code0940E0                      ; 09:40AF

Code0940B1:
    ld   a,[$C164]                  ; 09:40B1
    dec  a                          ; 09:40B4
    ld   [$C164],a                  ; 09:40B5
    jr   z,@Code0940C1              ; 09:40B8
    ldh  a,[<H_ButtonsPressed]      ; 09:40BA
    and  $09                        ; 09:40BC
    jr   nz,@Code0940C1             ; 09:40BE
    ret                             ; 09:40C0
@Code0940C1:
    ld   a,$20                      ; 09:40C1
    ld   [$C1AD],a                  ; 09:40C3
    ld   hl,H_GameSubstate          ; 09:40C6
    inc  [hl]                       ; 09:40C9
    ret                             ; 09:40CA

Code0940CB:
    ld   a,$09                      ; 09:40CB
    rst  $10                        ; 09:40CD  24-bit call
.dl SubL_0451A4                     ; 09:40CE
    ld   a,[$C1AD]                  ; 09:40D1
    dec  a                          ; 09:40D4
    ld   [$C1AD],a                  ; 09:40D5
    jr   z,@Code0940DB              ; 09:40D8
    ret                             ; 09:40DA
@Code0940DB:
    ld   a,$02                      ; 09:40DB
    ldh  [<H_GameState],a           ; 09:40DD
    ret                             ; 09:40DF

Code0940E0:
    ld   a,$09                      ; 09:40E0
    call Sub00160F                  ; 09:40E2
    ld   a,[$C4F5]                  ; 09:40E5
    and  a                          ; 09:40E8
    jr   nz,@Return                 ; 09:40E9
    ld   a,$20                      ; 09:40EB
    ld   [$C1AD],a                  ; 09:40ED
    ld   a,$01                      ; 09:40F0
    ldh  [<H_GameSubstate],a        ; 09:40F2
@Return:
    ret                             ; 09:40F4

Data0940F5:                         ; 09:40F5
.dw $0000,$03BF,$0255,$090B,$0000,$03BF,$7FFF,$0000

Sub094105:
; called by game state 02
    ld   a,$01                      ; 09:4105
    ldh  [<SB],a                    ; 09:4107
    call Sub00126D                  ; 09:4109
    xor  a                          ; 09:410C
    ldh  [<IE],a                    ; 09:410D
    ld   a,:Gr_TitleScreen          ; 09:410F
    ld   b,$09                      ; 09:4111
    call LoadGraphicsBank           ; 09:4113
    ld   a,$07                      ; 09:4116
    ldh  [<SVBK],a                  ; 09:4118
    ld   a,$18                      ; 09:411A
    ld   b,$09                      ; 09:411C
    ld   de,Pal_TitleScreen         ; 09:411E
    call LoadFullPaletteLong        ; 09:4121
    xor  a                          ; 09:4124
    ldh  [<SVBK],a                  ; 09:4125
    ld   hl,W_PalBuffer             ; 09:4127
    ld   b,$20                      ; 09:412A
Code09412C:
    ld   [hl],$FF                   ; 09:412C
    inc  hl                         ; 09:412E
    ld   [hl],$7F                   ; 09:412F
    inc  hl                         ; 09:4131
    dec  b                          ; 09:4132
    jr   nz,Code09412C              ; 09:4133
    ld   hl,W_PalBufferSpr          ; 09:4135
    ld   de,Data0940F5              ; 09:4138
    ld   b,$10                      ; 09:413B
Code09413D:
    ld   a,[de]                     ; 09:413D
    ldi  [hl],a                     ; 09:413E
    inc  de                         ; 09:413F
    dec  b                          ; 09:4140
    jr   nz,Code09413D              ; 09:4141
    call Sub00128D                  ; 09:4143
    ld   a,$01                      ; 09:4146
    ldh  [<VBK],a                   ; 09:4148
    ld   hl,Ti_TitleScreen_Attr     ; 09:414A
    ld   de,$99C0                   ; 09:414D
    ld   bc,$0240                   ; 09:4150
    ld   a,$18                      ; 09:4153
    ld   [$C415],a                  ; 09:4155
    ld   a,$09                      ; 09:4158
    call CopyBytesLong              ; 09:415A
    xor  a                          ; 09:415D
    ldh  [<VBK],a                   ; 09:415E
    ld   hl,Ti_TitleScreen_Tiles    ; 09:4160
    ld   de,$99C0                   ; 09:4163
    ld   bc,$0240                   ; 09:4166
    ld   a,$18                      ; 09:4169
    ld   [$C415],a                  ; 09:416B
    ld   a,$09                      ; 09:416E
    call CopyBytesLong              ; 09:4170
    xor  a                          ; 09:4173
    ld   [$C0C4],a                  ; 09:4174
    ld   [W_PlayerFireFlag],a       ; 09:4177
    ld   [W_PlayerSize],a           ; 09:417A
    ld   [$C174],a                  ; 09:417D
    ld   [$C168],a                  ; 09:4180
    ldh  [<H_GameSubstate],a        ; 09:4183
    ld   [W_GameMode],a             ; 09:4185
    ld   [$C0C1],a                  ; 09:4188
    ld   [$C170],a                  ; 09:418B
    ld   [W_PlayerCoins],a          ; 09:418E
    ld   [W_PlayerScoreLow],a       ; 09:4191
    ld   [W_PlayerScoreMid],a       ; 09:4194
    ld   [W_PlayerScoreHigh],a      ; 09:4197
    ld   [$C187],a                  ; 09:419A
    ld   [W_SublevelID],a           ; 09:419D
    ld   [W_LevelID],a              ; 09:41A0
    ld   [$C362],a                  ; 09:41A3
    ld   [$C35C],a                  ; 09:41A6
    ldh  [<H_CameraXLow],a          ; 09:41A9
    ldh  [<H_CameraXHigh],a         ; 09:41AB
    ldh  [<$FFBB],a                 ; 09:41AD
    ld   [$C175],a                  ; 09:41AF
    ld   [$C178],a                  ; 09:41B2
    ld   [$C177],a                  ; 09:41B5
    ld   a,$70                      ; 09:41B8
    ldh  [<H_CameraY],a             ; 09:41BA
    ld   [$C176],a                  ; 09:41BC
    ld   a,$0A                      ; 09:41BF
    ld   [$C356],a                  ; 09:41C1
    ld   a,$01                      ; 09:41C4
    ld   [$C381],a                  ; 09:41C6
    ld   a,$20                      ; 09:41C9
    ld   [$C1AD],a                  ; 09:41CB
    ld   a,$09                      ; 09:41CE
    rst  $10                        ; 09:41D0  24-bit call
.dl SubL_0756D9                     ; 09:41D1
    ld   a,$0B                      ; 09:41D4
    ldh  [<IE],a                    ; 09:41D6
    ld   a,$87                      ; 09:41D8
    ldh  [<LCDC],a                  ; 09:41DA
    ld   hl,H_GameState             ; 09:41DC
    inc  [hl]                       ; 09:41DF
    ld   a,$01                      ; 09:41E0
    ld   [$DA6E],a                  ; 09:41E2
    ld   [$C409],a                  ; 09:41E5
    ld   [$C40A],a                  ; 09:41E8
    ld   [$C0C4],a                  ; 09:41EB
    ld   [$C410],a                  ; 09:41EE
    dec  a                          ; 09:41F1
    ld   [$C400],a                  ; 09:41F2
    ld   [$C401],a                  ; 09:41F5
    ld   [$C3FD],a                  ; 09:41F8
    ld   [$C407],a                  ; 09:41FB
    ld   [$C408],a                  ; 09:41FE
    ld   [$C40B],a                  ; 09:4201
    ld   [$C40C],a                  ; 09:4204
    ld   [$C40E],a                  ; 09:4207
    ld   [$C40D],a                  ; 09:420A
    ld   [$C411],a                  ; 09:420D
    ld   a,$FF                      ; 09:4210
    ld   [$C40F],a                  ; 09:4212
    ld   a,$86                      ; 09:4215
    ld   [$C402],a                  ; 09:4217
    ld   a,$01                      ; 09:421A
    ld   [$C403],a                  ; 09:421C
    ld   a,$0A                      ; 09:421F
    ld   [$C3FF],a                  ; 09:4221
    ld   a,$10                      ; 09:4224
    ld   [$C3FE],a                  ; 09:4226
    ld   a,$44                      ; 09:4229
    ldh  [<STAT],a                  ; 09:422B
    ret                             ; 09:422D

Data09422E:                         ; 09:422E
.db $4F,$58,$10,$00,$4F,$60,$12,$00,\
    $4F,$68,$14,$00,$4F,$70,$16,$00,\
    $4F,$79,$18,$00,$4F,$81,$1A,$00,\
    $4F,$93,$1C,$00,$5F,$58,$1E,$00,\
    $5F,$60,$20,$00,$5F,$68,$22,$00,\
    $5F,$70,$24,$00,$5F,$78,$26,$00,\
    $5F,$80,$28,$00,$5F,$88,$2A,$00,\
    $5F,$90,$2C,$00,$5F,$98,$2E,$00,\
    $5F,$A0,$30,$00,$5F,$88,$40,$00,\
    $5F,$88,$42,$00,$5F,$90,$44,$00,\
    $5F,$90,$46,$00,$5F,$98,$48,$00,\
    $5F,$98,$4A,$00,$5F,$90,$4C,$00,\
    $5F,$88,$4E,$00,$5F,$80,$50,$00,\
    $4F,$80,$52,$00,$5F,$78,$54,$00,\
    $5F,$80,$56,$00,$5F,$78,$58,$00,\
    $5F,$70,$5A,$00,$4F,$60,$5C,$00,\
    $5F,$58,$5E,$00,$5F,$70,$60,$00,\
    $4F,$60,$62,$00,$4F,$68,$64,$00,\
    $5F,$68,$66,$00,$5F,$70,$68,$00,\
    $5F,$60,$6A,$00,$5F,$60,$6C,$00,\
    $4F,$68,$6E,$00,$28,$04,$FF,$22,\
    $08,$27,$04,$FF,$20,$04,$22,$04,\
    $23,$04,$26,$04,$FF,$08,$04,$20,\
    $04,$22,$10,$FF,$02,$08,$08,$08,\
    $1F,$0C,$FF,$00,$10,$07,$0C,$1E,\
    $04,$FF,$00,$10,$07,$10,$1D,$04,\
    $FF,$00,$10,$07,$10,$1A,$0C,$FF,\
    $00,$18,$07,$14,$19,$04,$FF,$00,\
    $18,$07,$18,$18,$04,$FF,$00,$18,\
    $07,$18,$12,$04,$17,$04,$FF,$00,\
    $18,$07,$18,$12,$04,$14,$04,$16,\
    $04,$FF,$00,$18,$07,$18,$10,$04,\
    $12,$04,$14,$08,$FF,$00,$34,$0F,\
    $08,$12,$08,$FF,$00,$34,$0E,$10,\
    $FF,$00,$48,$FF
Data094342:                         ; 09:4342
.db $4A,$69,$70,$00,$4A,$71,$70,$20,\
    $4A,$69,$72,$00,$4A,$70,$72,$20,\
    $4A,$69,$74,$00,$4A,$70,$74,$20,\
    $4A,$69,$76,$00,$4A,$70,$76,$20
Data094362:                         ; 09:4362
.db $3F,$43,$3A,$43,$33,$43,$28,$43,\
    $1D,$43,$14,$43,$0D,$43,$06,$43,\
    $FF,$42,$F8,$42,$F1,$42,$EA,$42,\
    $E3,$42,$DA,$42,$D5,$42,$D2,$42
Data094382:                         ; 09:4382
.db $03,$02,$02,$04,$01,$06,$00,$04,\
    $01,$04,$00,$04,$01,$04,$00,$04,\
    $01,$04,$00,$04

TitleScreenMain_CallSubstate:
; called by game state 03
    ldh  a,[<H_GameSubstate]        ; 09:4396
    rst  $00                        ; 09:4398  Execute from 16-bit pointer table
.dw Code09439D                      ; 09:4399
.dw Code0943C9                      ; 09:439B

Code09439D:
    ld   a,[$C1AD]                  ; 09:439D
    dec  a                          ; 09:43A0
    ld   [$C1AD],a                  ; 09:43A1
    jr   z,Code0943B7               ; 09:43A4
    ld   a,$09                      ; 09:43A6
    rst  $10                        ; 09:43A8  24-bit call
.dl SubL_045221                     ; 09:43A9
    ldh  a,[<H_GlobalTimer]         ; 09:43AC
    and  $01                        ; 09:43AE
    jr   z,Return0943B6             ; 09:43B0
    ld   hl,$C40E                   ; 09:43B2
    inc  [hl]                       ; 09:43B5
Return0943B6:
    ret                             ; 09:43B6

Code0943B7:
    ld   a,$76                      ; 09:43B7
    ld   [$DE68],a                  ; 09:43B9
    ld   hl,$C164                   ; 09:43BC
    ld   [hl],$F0                   ; 09:43BF
    inc  hl                         ; 09:43C1
    ld   [hl],$04                   ; 09:43C2
    ld   hl,H_GameSubstate          ; 09:43C4
    inc  [hl]                       ; 09:43C7
    ret                             ; 09:43C8

Code0943C9:
    ldh  a,[<H_GlobalTimer]         ; 09:43C9
    and  $01                        ; 09:43CB
    jr   z,Code0943D3               ; 09:43CD
    ld   hl,$C40E                   ; 09:43CF
    inc  [hl]                       ; 09:43D2
Code0943D3:
    ld   a,[$C40C]                  ; 09:43D3
    and  a                          ; 09:43D6
    jr   nz,Code0943E0              ; 09:43D7
    ld   a,[$C403]                  ; 09:43D9
    and  a                          ; 09:43DC
    jp   nz,Code09443F              ; 09:43DD
Code0943E0:
    ld   a,[$C40F]                  ; 09:43E0
    and  a                          ; 09:43E3
    jr   z,Code0943ED               ; 09:43E4
    dec  a                          ; 09:43E6
    ld   [$C40F],a                  ; 09:43E7
    jp   Code09443F                 ; 09:43EA
Code0943ED:
    ld   a,[$C407]                  ; 09:43ED
    ld   h,$00                      ; 09:43F0
    ld   l,a                        ; 09:43F2
    ld   c,$06                      ; 09:43F3
    call Sub001802                  ; 09:43F5
    ld   hl,Pal_TitleScreen         ; 09:43F8
    add  hl,de                      ; 09:43FB
    ld   de,W_PalBuffer             ; 09:43FC
    ld   bc,$0040                   ; 09:43FF
    ld   a,[$C40C]                  ; 09:4402
    and  a                          ; 09:4405
    jr   nz,Code094420              ; 09:4406
    ld   a,[$C408]                  ; 09:4408
    sla  a                          ; 09:440B
    sla  a                          ; 09:440D
    sla  a                          ; 09:440F
    ld   b,$00                      ; 09:4411
    ld   c,a                        ; 09:4413
    add  hl,bc                      ; 09:4414
    push hl                         ; 09:4415
    ld   hl,W_PalBuffer             ; 09:4416
    add  hl,bc                      ; 09:4419
    ld   d,h                        ; 09:441A
    ld   e,l                        ; 09:441B
    pop  hl                         ; 09:441C
    ld   bc,$0008                   ; 09:441D
Code094420:
    ld   a,:Pal_TitleScreen         ; 09:4420
    ld   [$C415],a                  ; 09:4422
    ld   a,$09                      ; 09:4425
    call CopyBytesLong              ; 09:4427
    ld   a,$01                      ; 09:442A
    ldh  [<$FFC0],a                 ; 09:442C
    ld   b,$02                      ; 09:442E
    ld   a,[$C40C]                  ; 09:4430
    and  a                          ; 09:4433
    jr   nz,Code094438              ; 09:4434
    ld   b,$00                      ; 09:4436
Code094438:
    ld   a,b                        ; 09:4438
    ld   [$C40F],a                  ; 09:4439
    call Sub09453C                  ; 09:443C
Code09443F:
    ld   a,[$C3FE]                  ; 09:443F
    and  a                          ; 09:4442
    jr   nz,Code0944B5              ; 09:4443
    ld   a,[$C402]                  ; 09:4445
    and  a                          ; 09:4448
    jr   z,Code094452               ; 09:4449
    dec  a                          ; 09:444B
    ld   [$C402],a                  ; 09:444C
    jp   Code0944B5                 ; 09:444F
Code094452:
    ld   a,[$C403]                  ; 09:4452
    and  a                          ; 09:4455
    jr   z,Code094464               ; 09:4456
    dec  a                          ; 09:4458
    ld   [$C403],a                  ; 09:4459
    ld   a,$FF                      ; 09:445C
    ld   [$C402],a                  ; 09:445E
    jp   Code0944B5                 ; 09:4461
Code094464:
    ld   a,[$C3FF]                  ; 09:4464
    and  a                          ; 09:4467
    jr   nz,Code094479              ; 09:4468
    ld   [$C401],a                  ; 09:446A
    ld   a,$5A                      ; 09:446D
    ld   [$C402],a                  ; 09:446F
    ld   a,$0A                      ; 09:4472
    ld   [$C3FF],a                  ; 09:4474
    jr   Code0944B5                 ; 09:4477
Code094479:
    ld   a,[$C401]                  ; 09:4479
    and  a                          ; 09:447C
    jr   nz,Code094497              ; 09:447D
    ld   a,[$C3FF]                  ; 09:447F
    dec  a                          ; 09:4482
    ld   [$C3FF],a                  ; 09:4483
    sla  a                          ; 09:4486
    ld   b,$00                      ; 09:4488
    ld   c,a                        ; 09:448A
    ld   hl,Data094382              ; 09:448B
    add  hl,bc                      ; 09:448E
    ldi  a,[hl]                     ; 09:448F
    ld   [$C404],a                  ; 09:4490
    ld   a,[hl]                     ; 09:4493
    ld   [$C401],a                  ; 09:4494
Code094497:
    ld   a,[$C404]                  ; 09:4497
    sla  a                          ; 09:449A
    sla  a                          ; 09:449C
    sla  a                          ; 09:449E
    ld   c,$08                      ; 09:44A0
    ld   h,$00                      ; 09:44A2
    ld   l,a                        ; 09:44A4
    ld   de,Data094342              ; 09:44A5
    add  hl,de                      ; 09:44A8
    ld   d,h                        ; 09:44A9
    ld   e,l                        ; 09:44AA
    ld   hl,W_OAMBuffer             ; 09:44AB
    call Sub0945BB                  ; 09:44AE
    ld   hl,$C401                   ; 09:44B1
    dec  [hl]                       ; 09:44B4
Code0944B5:
    ld   a,[$C3FE]                  ; 09:44B5
    and  a                          ; 09:44B8
    jr   z,Code0944C8               ; 09:44B9
    ld   b,a                        ; 09:44BB
    ld   a,[$C3FD]                  ; 09:44BC
    and  $01                        ; 09:44BF
    ld   a,b                        ; 09:44C1
    jr   nz,Code0944C8              ; 09:44C2
    dec  a                          ; 09:44C4
    ld   [$C3FE],a                  ; 09:44C5
Code0944C8:
    sla  a                          ; 09:44C8
    ld   h,$00                      ; 09:44CA
    ld   l,a                        ; 09:44CC
    ld   de,Data094362              ; 09:44CD
    add  hl,de                      ; 09:44D0
    ld   e,[hl]                     ; 09:44D1
    inc  hl                         ; 09:44D2
    ld   d,[hl]                     ; 09:44D3
    ld   hl,$C008                   ; 09:44D4
Code0944D7:
    ld   a,[de]                     ; 09:44D7
    inc  de                         ; 09:44D8
    cp   $FF                        ; 09:44D9
    jr   z,Code0944F9               ; 09:44DB
    sla  a                          ; 09:44DD
    sla  a                          ; 09:44DF
    ld   b,$00                      ; 09:44E1
    ld   c,a                        ; 09:44E3
    push hl                         ; 09:44E4
    ld   hl,Data09422E              ; 09:44E5
    add  hl,bc                      ; 09:44E8
    push hl                         ; 09:44E9
    pop  bc                         ; 09:44EA
    pop  hl                         ; 09:44EB
    ld   a,[de]                     ; 09:44EC
    inc  de                         ; 09:44ED
    push de                         ; 09:44EE
    ld   d,a                        ; 09:44EF
Code0944F0:
    ld   a,[bc]                     ; 09:44F0
    ldi  [hl],a                     ; 09:44F1
    inc  bc                         ; 09:44F2
    dec  d                          ; 09:44F3
    jr   nz,Code0944F0              ; 09:44F4
    pop  de                         ; 09:44F6
    jr   Code0944D7                 ; 09:44F7
Code0944F9:
    ld   a,[$C3FD]                  ; 09:44F9
    xor  $01                        ; 09:44FC
    ld   [$C3FD],a                  ; 09:44FE
    ld   hl,$C164                   ; 09:4501
    ldi  a,[hl]                     ; 09:4504
    ld   c,a                        ; 09:4505
    ld   a,[hl]                     ; 09:4506
    ld   b,a                        ; 09:4507
    or   c                          ; 09:4508
    jp   nz,Code0945C2              ; 09:4509
    ld   a,[$C411]                  ; 09:450C
    and  a                          ; 09:450F
    jp   nz,Code0945C6              ; 09:4510
    ld   a,[$C1B4]                  ; 09:4513
    cp   $03                        ; 09:4516
    jr   z,Code09452E               ; 09:4518
    cp   $02                        ; 09:451A
    jr   z,Code094528               ; 09:451C
    cp   $01                        ; 09:451E
    jr   z,Code09452E               ; 09:4520
    ld   a,$3B                      ; 09:4522
    ldh  [<H_GameState],a           ; 09:4524
    jr   Code094532                 ; 09:4526
Code094528:
    ld   a,$3D                      ; 09:4528
    ldh  [<H_GameState],a           ; 09:452A
    jr   Code094532                 ; 09:452C
Code09452E:
    ld   a,$3F                      ; 09:452E
    ldh  [<H_GameState],a           ; 09:4530
Code094532:
    ld   a,[$C1B4]                  ; 09:4532
    inc  a                          ; 09:4535
    and  $03                        ; 09:4536
    ld   [$C1B4],a                  ; 09:4538
    ret                             ; 09:453B

Sub09453C:
    ld   a,[$C409]                  ; 09:453C
    ld   b,a                        ; 09:453F
    ld   a,[$C407]                  ; 09:4540
    add  b                          ; 09:4543
    cp   $04                        ; 09:4544
    jr   nz,Code09454E              ; 09:4546
    dec  a                          ; 09:4548
    dec  a                          ; 09:4549
    dec  b                          ; 09:454A
    dec  b                          ; 09:454B
    jr   Code09456F                 ; 09:454C
Code09454E:
    cp   $FF                        ; 09:454E
    jr   nz,Code09456F              ; 09:4550
    inc  a                          ; 09:4552
    inc  a                          ; 09:4553
    ld   c,a                        ; 09:4554
    inc  b                          ; 09:4555
    inc  b                          ; 09:4556
    ld   a,[$C40C]                  ; 09:4557
    and  a                          ; 09:455A
    jr   nz,Code094562              ; 09:455B
    call Sub094577                  ; 09:455D
    jr   Code09456F                 ; 09:4560
Code094562:
    ld   a,$01                      ; 09:4562
    ld   [$C409],a                  ; 09:4564
    dec  a                          ; 09:4567
    ld   [$C40F],a                  ; 09:4568
    ld   [$C407],a                  ; 09:456B
    ld   a,c                        ; 09:456E
Code09456F:
    ld   [$C407],a                  ; 09:456F
    ld   a,b                        ; 09:4572
    ld   [$C409],a                  ; 09:4573
    ret                             ; 09:4576

Sub094577:
    push af                         ; 09:4577
    push bc                         ; 09:4578
    ld   a,[$C40A]                  ; 09:4579
    ld   b,a                        ; 09:457C
    ld   a,[$C408]                  ; 09:457D
    add  b                          ; 09:4580
    cp   $06                        ; 09:4581
    jr   nz,Code09458B              ; 09:4583
    dec  a                          ; 09:4585
    dec  a                          ; 09:4586
    dec  b                          ; 09:4587
    dec  b                          ; 09:4588
    jr   Code0945B1                 ; 09:4589
Code09458B:
    cp   $FF                        ; 09:458B
    jr   nz,Code0945B1              ; 09:458D
    inc  a                          ; 09:458F
    inc  a                          ; 09:4590
    ld   c,a                        ; 09:4591
    inc  b                          ; 09:4592
    inc  b                          ; 09:4593
    ld   a,[$C40D]                  ; 09:4594
    inc  a                          ; 09:4597
    ld   [$C40D],a                  ; 09:4598
    cp   $03                        ; 09:459B
    jr   nz,Code0945B0              ; 09:459D
    ld   a,$3C                      ; 09:459F
    ld   [$C40F],a                  ; 09:45A1
    ld   a,$01                      ; 09:45A4
    ld   [$C40A],a                  ; 09:45A6
    dec  a                          ; 09:45A9
    ld   [$C40D],a                  ; 09:45AA
    ld   [$C408],a                  ; 09:45AD
Code0945B0:
    ld   a,c                        ; 09:45B0
Code0945B1:
    ld   [$C408],a                  ; 09:45B1
    ld   a,b                        ; 09:45B4
    ld   [$C40A],a                  ; 09:45B5
    pop  bc                         ; 09:45B8
    pop  af                         ; 09:45B9
    ret                             ; 09:45BA

Sub0945BB:
    ld   a,[de]                     ; 09:45BB
    ldi  [hl],a                     ; 09:45BC
    inc  de                         ; 09:45BD
    dec  c                          ; 09:45BE
    jr   nz,Sub0945BB               ; 09:45BF
    ret                             ; 09:45C1

Code0945C2:
    dec  bc                         ; 09:45C2
    ld   [hl],b                     ; 09:45C3
    dec  hl                         ; 09:45C4
    ld   [hl],c                     ; 09:45C5
Code0945C6:
    ld   a,[$C411]                  ; 09:45C6
    and  a                          ; 09:45C9
    jr   nz,Code0945EE              ; 09:45CA
    ldh  a,[<H_ButtonsPressed]      ; 09:45CC
    and  %00001001                  ; 09:45CE  Start or A
    jr   z,Code09460D               ; 09:45D0
    call Sub0010A9                  ; 09:45D2
    ld   a,$76                      ; 09:45D5
    ldh  [<$FFF2],a                 ; 09:45D7
    ld   a,$01                      ; 09:45D9
    ld   [$C411],a                  ; 09:45DB
    ld   [$C40C],a                  ; 09:45DE
    ld   [$C40F],a                  ; 09:45E1
    dec  a                          ; 09:45E4
    ld   [$C40D],a                  ; 09:45E5
    ld   a,$3F                      ; 09:45E8
    ld   [$C412],a                  ; 09:45EA
    ret                             ; 09:45ED

Code0945EE:
    ld   a,[$C412]                  ; 09:45EE
    dec  a                          ; 09:45F1
    ld   [$C412],a                  ; 09:45F2
    jr   nz,Return09460C            ; 09:45F5
    ld   a,$01                      ; 09:45F7
    ldh  [<SB],a                    ; 09:45F9
    ld   a,$00                      ; 09:45FB
    ldh  [<SC],a                    ; 09:45FD
    ld   a,$00                      ; 09:45FF
    ld   [$DA6E],a                  ; 09:4601
    xor  a                          ; 09:4604
    ld   [$C1B4],a                  ; 09:4605
    ld   a,$18                      ; 09:4608
    ldh  [<H_GameState],a           ; 09:460A
Return09460C:
    ret                             ; 09:460C

Code09460D:
    ld   a,$00                      ; 09:460D
    cp   $01                        ; 09:460F
    ret  nz                         ; 09:4611  return always (if 0 != 1)
    ldh  a,[<H_ButtonsHeld]         ; 09:4612 \ debug code
    and  $40                        ; 09:4614  if up is held...
    ret  z                          ; 09:4616
    ldh  a,[<H_ButtonsPressed]      ; 09:4617
    and  $02                        ; 09:4619  ...and B is pressed...
    ret  z                          ; 09:461B
    ld   a,$24                      ; 09:461C  24: coin sound
    ldh  [<$FFF3],a                 ; 09:461E
    call Sub094624                  ; 09:4620  run debug code? clear $A2AA, $B6B5, $A37C
    ret                             ; 09:4623 /

Sub094624:
    ld   hl,SRAMENABLE              ; 09:4624
    ld   [hl],$0A                   ; 09:4627
    xor  a                          ; 09:4629
    ld   [$A2AA],a                  ; 09:462A
    ld   hl,SRAMENABLE              ; 09:462D
    ld   [hl],$FF                   ; 09:4630
    ld   a,$09                      ; 09:4632
    rst  $10                        ; 09:4634  24-bit call
.dl SubL_0B75A6                     ; 09:4635
    ret                             ; 09:4638

Unused094639:
    ld   c,$00                      ; 09:4639
    ldh  a,[<H_ButtonsHeld]         ; 09:463B
    bit  1,a                        ; 09:463D
    jr   z,Code094642               ; 09:463F
    inc  c                          ; 09:4641
Code094642:
    ld   a,c                        ; 09:4642
    ld   [$C282],a                  ; 09:4643
    ret                             ; 09:4646

TiUp_094647:                        ; 09:4647
.db $9A,$A6,$09,$00,$E0,$00,$DA,$00,\
    $E6,$00,$DE,$00,$F4,$00,$E8,$00,\
    $EF,$00,$DE,$00,$EB,$00

Sub09465D:
; Game state 0E
    call Sub00126D                  ; 09:465D
    ld   a,$00                      ; 09:4660
    ldh  [<IE],a                    ; 09:4662
    ldh  [<$FF93],a                 ; 09:4664
    call Sub00128D                  ; 09:4666
    xor  a                          ; 09:4669
    ld   [$C0C4],a                  ; 09:466A
    ld   [$C174],a                  ; 09:466D
    ld   [$C168],a                  ; 09:4670
    ldh  [<H_GameSubstate],a        ; 09:4673
    ldh  [<H_CameraXLow],a          ; 09:4675
    ldh  [<H_CameraXHigh],a         ; 09:4677
    ldh  [<$FFBB],a                 ; 09:4679
    ld   a,$70                      ; 09:467B
    ldh  [<H_CameraY],a             ; 09:467D
    ld   a,$01                      ; 09:467F
    ld   [$C171],a                  ; 09:4681
    ld   a,$09                      ; 09:4684
    call Sub001480                  ; 09:4686
    xor  a                          ; 09:4689
    ld   hl,W_PalBuffer             ; 09:468A
    ldi  [hl],a                     ; 09:468D
    ld   [hl],a                     ; 09:468E
    inc  a                          ; 09:468F
    ldh  [<$FFC0],a                 ; 09:4690
    ld   a,$80                      ; 09:4692
    ld   [$C285],a                  ; 09:4694
    ld   a,$00                      ; 09:4697
    ld   [$C286],a                  ; 09:4699
    ld   a,[W_SPFlag]               ; 09:469C
    and  a                          ; 09:469F
    jr   z,Code0946A7               ; 09:46A0
    call Sub0946FB                  ; 09:46A2
    jr   Code0946E9                 ; 09:46A5
Code0946A7:
    ld   a,[W_PlayerScoreHigh]      ; 09:46A7
    and  a                          ; 09:46AA
    jr   nz,Code0946BD              ; 09:46AB
    ld   a,[W_PlayerScoreMid]       ; 09:46AD
    cp   $27                        ; 09:46B0
    jr   c,Code0946E3               ; 09:46B2
    jr   nz,Code0946BD              ; 09:46B4
    ld   a,[W_PlayerScoreLow]       ; 09:46B6
    cp   $10                        ; 09:46B9
    jr   c,Code0946E3               ; 09:46BB
Code0946BD:
    ld   a,[W_ModeUnlockFlags]      ; 09:46BD
    or   $02                        ; 09:46C0
    ld   [W_ModeUnlockFlags],a      ; 09:46C2
    ld   a,[W_PlayerScoreHigh]      ; 09:46C5
    and  a                          ; 09:46C8
    jr   nz,Code0946DB              ; 09:46C9
    ld   a,[W_PlayerScoreMid]       ; 09:46CB
    cp   $75                        ; 09:46CE
    jr   c,Code0946E3               ; 09:46D0
    jr   nz,Code0946DB              ; 09:46D2
    ld   a,[W_PlayerScoreLow]       ; 09:46D4
    cp   $30                        ; 09:46D7
    jr   c,Code0946E3               ; 09:46D9
Code0946DB:
    ld   a,[W_ModeUnlockFlags]      ; 09:46DB
    or   $01                        ; 09:46DE
    ld   [W_ModeUnlockFlags],a      ; 09:46E0
Code0946E3:
    ld   a,$09                      ; 09:46E3
    rst  $10                        ; 09:46E5  24-bit call
.dl SubL_0757EF                     ; 09:46E6
Code0946E9:
    ld   a,$69                      ; 09:46E9
    ld   [$DE68],a                  ; 09:46EB
    ld   a,$01                      ; 09:46EE
    ldh  [<IE],a                    ; 09:46F0
    ld   a,$87                      ; 09:46F2
    ldh  [<LCDC],a                  ; 09:46F4
    ld   hl,H_GameState             ; 09:46F6
    inc  [hl]                       ; 09:46F9
    ret                             ; 09:46FA

Sub0946FB:
    ld   hl,W_PlayerScoreHigh       ; 09:46FB
    ld   a,[$C16F]                  ; 09:46FE
    cp   [hl]                       ; 09:4701
    jr   z,@CheckMid                ; 09:4702
    jr   nc,@Return                 ; 09:4704
    jr   c,@SetHighScore            ; 09:4706
@CheckMid:
    ld   hl,W_PlayerScoreMid        ; 09:4708
    ld   a,[$C16E]                  ; 09:470B
    cp   [hl]                       ; 09:470E
    jr   z,@CheckLow                ; 09:470F
    jr   nc,@Return                 ; 09:4711
    jr   c,@SetHighScore            ; 09:4713
@CheckLow:
    ld   hl,W_PlayerScoreLow        ; 09:4715
    ld   a,[$C16D]                  ; 09:4718
    cp   [hl]                       ; 09:471B
    jr   z,@Return                  ; 09:471C
    jr   nc,@Return                 ; 09:471E
@SetHighScore:
    ld   hl,W_PlayerScoreLow        ; 09:4720
    ldi  a,[hl]                     ; 09:4723
    ld   [$C16D],a                  ; 09:4724
    ldi  a,[hl]                     ; 09:4727
    ld   [$C16E],a                  ; 09:4728
    ldi  a,[hl]                     ; 09:472B
    ld   [$C16F],a                  ; 09:472C
    ld   a,$09                      ; 09:472F
    rst  $10                        ; 09:4731  24-bit call
.dl SubL_075669                     ; 09:4732
@Return:
    ret                             ; 09:4735

SubL_094736:
    ld   hl,W_PlayerScoreHigh       ; 09:4736
    ld   a,[$C16F]                  ; 09:4739
    cp   [hl]                       ; 09:473C
    jr   z,Code094743               ; 09:473D
    jr   nc,ReturnL_09476A          ; 09:473F
    jr   c,Code09475B               ; 09:4741
Code094743:
    ld   hl,W_PlayerScoreMid        ; 09:4743
    ld   a,[$C16E]                  ; 09:4746
    cp   [hl]                       ; 09:4749
    jr   z,Code094750               ; 09:474A
    jr   nc,ReturnL_09476A          ; 09:474C
    jr   c,Code09475B               ; 09:474E
Code094750:
    ld   hl,W_PlayerScoreLow        ; 09:4750
    ld   a,[$C16D]                  ; 09:4753
    cp   [hl]                       ; 09:4756
    jr   z,ReturnL_09476A           ; 09:4757
    jr   nc,ReturnL_09476A          ; 09:4759
Code09475B:
    ld   hl,W_PlayerScoreLow        ; 09:475B
    ldi  a,[hl]                     ; 09:475E
    ld   [$C16D],a                  ; 09:475F
    ldi  a,[hl]                     ; 09:4762
    ld   [$C16E],a                  ; 09:4763
    ldi  a,[hl]                     ; 09:4766
    ld   [$C16F],a                  ; 09:4767
ReturnL_09476A:
    rst  $18                        ; 09:476A  Return from 24-bit call

GameOverMain:
; Game state 0F
    ldh  a,[<H_GameSubstate]        ; 09:476B
    rst  $00                        ; 09:476D  Execute from 16-bit pointer table
.dw Code094772                      ; 09:476E
.dw Code094791                      ; 09:4770

Code094772:
    ld   hl,$C285                   ; 09:4772
    ld   a,[hl]                     ; 09:4775
    dec  [hl]                       ; 09:4776
    and  a                          ; 09:4777
    jr   nz,Return094790            ; 09:4778
    ld   hl,$C286                   ; 09:477A
    ld   a,[hl]                     ; 09:477D
    dec  [hl]                       ; 09:477E
    and  a                          ; 09:477F
    jr   nz,Return094790            ; 09:4780
    ld   a,$70                      ; 09:4782
    ld   [$C285],a                  ; 09:4784
    ld   a,$01                      ; 09:4787
    ld   [$C286],a                  ; 09:4789
    ld   hl,H_GameSubstate          ; 09:478C
    inc  [hl]                       ; 09:478F
Return094790:
    ret                             ; 09:4790

Code094791:
    ldh  a,[<H_ButtonsPressed]      ; 09:4791
    and  $09                        ; 09:4793
    jr   nz,Code09479F              ; 09:4795
    ld   hl,$C285                   ; 09:4797
    ld   a,[hl]                     ; 09:479A
    dec  [hl]                       ; 09:479B
    and  a                          ; 09:479C
    jr   nz,Return0947BB            ; 09:479D
Code09479F:
    xor  a                          ; 09:479F
    ld   [$C285],a                  ; 09:47A0
    ld   [$C286],a                  ; 09:47A3
    ldh  [<H_GameSubstate],a        ; 09:47A6
    ld   [W_ChallengeFlag],a        ; 09:47A8
    ld   a,[W_SPFlag]               ; 09:47AB
    and  a                          ; 09:47AE
    jr   nz,Code0947B7              ; 09:47AF
    ld   a,$14                      ; 09:47B1
    ldh  [<H_GameState],a           ; 09:47B3
    jr   Return0947BB               ; 09:47B5
Code0947B7:
    ld   a,$1A                      ; 09:47B7
    ldh  [<H_GameState],a           ; 09:47B9
Return0947BB:
    ret                             ; 09:47BB

TiUp_0947BC:                        ; 09:47BC
.db $9A,$A7,$07,$00,$ED,$00,$E2,$00,\
    $E6,$00,$DE,$00,$F4,$00,$EE,$00,\
    $E9,$00

Sub0947CE:
; Game state 10
    ld   a,$00                      ; 09:47CE
    ldh  [<IE],a                    ; 09:47D0
    ldh  [<$FF93],a                 ; 09:47D2
    call Sub00126D                  ; 09:47D4
    call Sub00128D                  ; 09:47D7
    ld   a,$00                      ; 09:47DA
    ld   [$C0C4],a                  ; 09:47DC
    ldh  [<H_GameSubstate],a        ; 09:47DF
    ldh  [<H_CameraXLow],a          ; 09:47E1
    ldh  [<H_CameraXHigh],a         ; 09:47E3
    ldh  [<$FFBB],a                 ; 09:47E5
    ld   a,$70                      ; 09:47E7
    ldh  [<H_CameraY],a             ; 09:47E9
    ld   de,W_TiUpBuffer            ; 09:47EB
    ld   hl,TiUp_0947BC             ; 09:47EE
    ld   bc,$0012                   ; 09:47F1
    call CopyBytes                  ; 09:47F4
    ld   a,$09                      ; 09:47F7
    call Sub001480                  ; 09:47F9
    ld   a,$00                      ; 09:47FC
    ld   hl,W_PalBuffer             ; 09:47FE
    ldi  [hl],a                     ; 09:4801
    ld   [hl],a                     ; 09:4802
    inc  a                          ; 09:4803
    ldh  [<$FFC0],a                 ; 09:4804
    ld   a,$40                      ; 09:4806
    ld   [$C285],a                  ; 09:4808
    ld   a,$00                      ; 09:480B
    ld   [$C286],a                  ; 09:480D
    ld   a,$01                      ; 09:4810
    ldh  [<IE],a                    ; 09:4812
    ldh  [<$FF93],a                 ; 09:4814
    ld   a,$87                      ; 09:4816
    ldh  [<LCDC],a                  ; 09:4818
    ld   hl,H_GameState             ; 09:481A
    inc  [hl]                       ; 09:481D
    ret                             ; 09:481E

Sub09481F:
; Game state 11
    ldh  a,[<H_GameSubstate]        ; 09:481F
    rst  $00                        ; 09:4821  Execute from 16-bit pointer table
.dw Code094826                      ; 09:4822
.dw Code094845                      ; 09:4824

Code094826:
    ld   hl,$C285                   ; 09:4826
    ld   a,[hl]                     ; 09:4829
    dec  [hl]                       ; 09:482A
    and  a                          ; 09:482B
    jr   nz,Return094844            ; 09:482C
    ld   hl,$C286                   ; 09:482E
    ld   a,[hl]                     ; 09:4831
    dec  [hl]                       ; 09:4832
    and  a                          ; 09:4833
    jr   nz,Return094844            ; 09:4834
    ld   a,$E0                      ; 09:4836
    ld   [$C285],a                  ; 09:4838
    ld   a,$00                      ; 09:483B
    ld   [$C286],a                  ; 09:483D
    ld   hl,H_GameSubstate          ; 09:4840
    inc  [hl]                       ; 09:4843
Return094844:
    ret                             ; 09:4844

Code094845:
    ldh  a,[<H_ButtonsPressed]      ; 09:4845
    and  $09                        ; 09:4847
    jr   nz,Code094853              ; 09:4849
    ld   hl,$C285                   ; 09:484B
    ld   a,[hl]                     ; 09:484E
    dec  [hl]                       ; 09:484F
    and  a                          ; 09:4850
    jr   nz,Return09488D            ; 09:4851
Code094853:
    ld   a,$00                      ; 09:4853
    ld   [$C285],a                  ; 09:4855
    ld   [$C286],a                  ; 09:4858
    ldh  [<H_GameSubstate],a        ; 09:485B
    ld   a,[W_ChallengeFlag]        ; 09:485D
    and  a                          ; 09:4860
    jr   z,Code094868               ; 09:4861
    ld   a,$1D                      ; 09:4863
    ldh  [<H_GameState],a           ; 09:4865
    ret                             ; 09:4867

Code094868:
    ld   a,[W_PlayerLives]          ; 09:4868
    dec  a                          ; 09:486B
    ld   [W_PlayerLives],a          ; 09:486C
    bit  7,a                        ; 09:486F
    jr   nz,Code094889              ; 09:4871
    and  a                          ; 09:4873
    jr   z,Code094889               ; 09:4874
    ld   a,$04                      ; 09:4876
    ldh  [<H_GameState],a           ; 09:4878
    ld   a,[W_LevelID]              ; 09:487A
    ld   [W_SublevelID],a           ; 09:487D
    ld   hl,$C164                   ; 09:4880
    ld   [hl],$FF                   ; 09:4883
    inc  hl                         ; 09:4885
    ld   [hl],$01                   ; 09:4886
    ret                             ; 09:4888

Code094889:
    ld   a,$0E                      ; 09:4889
    ldh  [<H_GameState],a           ; 09:488B
Return09488D:
    ret                             ; 09:488D

Ti_RecordsTitleDemo:                ; 09:488E
.incbin "data/Tilemaps/RecordsTitleDemo.bin"

Sub094B5E:
; called by game state 3F
    call Sub00126D                  ; 09:4B5E
    ld   a,$00                      ; 09:4B61
    ldh  [<IE],a                    ; 09:4B63
    ld   [$C0C4],a                  ; 09:4B65
    ld   a,:Gr_Bank1B               ; 09:4B68
    ld   b,$09                      ; 09:4B6A
    call LoadGraphicsBank           ; 09:4B6C
    ld   a,$00                      ; 09:4B6F
    ld   [$C356],a                  ; 09:4B71
    ld   a,$FF                      ; 09:4B74
    ld   [$DE68],a                  ; 09:4B76
    jr   Code094B82                 ; 09:4B79

Sub094B7B:
; Game state 12
    call Sub00126D                  ; 09:4B7B
    ld   a,$00                      ; 09:4B7E
    ldh  [<IE],a                    ; 09:4B80
Code094B82:
    call Sub00128D                  ; 09:4B82
    ld   a,$00                      ; 09:4B85
    ld   [W_SublevelID],a           ; 09:4B87
    ldh  [<H_GameSubstate],a        ; 09:4B8A
    ldh  [<H_CameraXLow],a          ; 09:4B8C
    ldh  [<H_CameraXHigh],a         ; 09:4B8E
    ldh  [<$FFBB],a                 ; 09:4B90
    ld   a,$70                      ; 09:4B92
    ldh  [<H_CameraY],a             ; 09:4B94
    ld   a,$30                      ; 09:4B96
    ld   [$C326],a                  ; 09:4B98
    ld   a,$09                      ; 09:4B9B
    ld   [$C357],a                  ; 09:4B9D
    ld   a,$09                      ; 09:4BA0
    ld   b,a                        ; 09:4BA2
    ld   de,Pal_RecordsTitleDemo    ; 09:4BA3
    call LoadFullPaletteLong        ; 09:4BA6
    ld   a,:Code094B82              ; 09:4BA9
    ld   b,a                        ; 09:4BAB
    ld   de,$99C0                   ; 09:4BAC
    ld   hl,Ti_RecordsTitleDemo     ; 09:4BAF
    call LoadScreenTilemapVRAM      ; 09:4BB2
    ld   a,:Code094B82              ; 09:4BB5
    rst  $10                        ; 09:4BB7  24-bit call
.dl SubL_07588C                     ; 09:4BB8
    ld   a,$01                      ; 09:4BBB
    ldh  [<IE],a                    ; 09:4BBD
    ld   a,$87                      ; 09:4BBF
    ldh  [<LCDC],a                  ; 09:4BC1
    ld   hl,H_GameState             ; 09:4BC3
    inc  [hl]                       ; 09:4BC6
    ret                             ; 09:4BC7

Sub094BC8:
; Game state 13
    ldh  a,[<H_GameSubstate]        ; 09:4BC8
    rst  $00                        ; 09:4BCA  Execute from 16-bit pointer table
.dw Code094BD1                      ; 09:4BCB
.dw Code094C1D                      ; 09:4BCD
.dw Code094C0A                      ; 09:4BCF

Code094BD1:
    ldh  a,[<H_ButtonsPressed]      ; 09:4BD1
    and  $01                        ; 09:4BD3
    jr   z,Code094BDD               ; 09:4BD5
    ld   a,$02                      ; 09:4BD7
    ldh  [<H_GameSubstate],a        ; 09:4BD9
    jr   Code094C0A                 ; 09:4BDB
Code094BDD:
    ld   a,[$C326]                  ; 09:4BDD
    dec  a                          ; 09:4BE0
    ld   [$C326],a                  ; 09:4BE1
    and  $1F                        ; 09:4BE4
    jp   nz,Return094C09            ; 09:4BE6
    call Sub094D0C                  ; 09:4BE9
    ld   a,[$C356]                  ; 09:4BEC
    ld   b,a                        ; 09:4BEF
    ld   a,[$C357]                  ; 09:4BF0
    cp   b                          ; 09:4BF3
    jr   nz,Code094BFA              ; 09:4BF4
    ld   a,$24                      ; 09:4BF6
    ldh  [<$FFF3],a                 ; 09:4BF8
Code094BFA:
    ld   a,[$C357]                  ; 09:4BFA
    dec  a                          ; 09:4BFD
    ld   [$C357],a                  ; 09:4BFE
    bit  7,a                        ; 09:4C01
    jr   z,Return094C09             ; 09:4C03
    ld   hl,H_GameSubstate          ; 09:4C05
    inc  [hl]                       ; 09:4C08
Return094C09:
    ret                             ; 09:4C09

Code094C0A:
    call Sub094D0C                  ; 09:4C0A
    ld   a,[$C357]                  ; 09:4C0D
    dec  a                          ; 09:4C10
    ld   [$C357],a                  ; 09:4C11
    bit  7,a                        ; 09:4C14
    jr   z,Return094C1C             ; 09:4C16
    ld   hl,H_GameSubstate          ; 09:4C18
    dec  [hl]                       ; 09:4C1B
Return094C1C:
    ret                             ; 09:4C1C

Code094C1D:
    ldh  a,[<$FFA6]                 ; 09:4C1D
    dec  a                          ; 09:4C1F
    ldh  [<$FFA6],a                 ; 09:4C20
    and  $0F                        ; 09:4C22
    jr   nz,Code094C3A              ; 09:4C24
    ldh  a,[<$FFA6]                 ; 09:4C26
    bit  4,a                        ; 09:4C28
    jr   nz,Code094C37              ; 09:4C2A
    ld   a,[$C356]                  ; 09:4C2C
    ld   [$C357],a                  ; 09:4C2F
    call Sub094D0C                  ; 09:4C32
    jr   Code094C3A                 ; 09:4C35
Code094C37:
    call Sub094D3E                  ; 09:4C37
Code094C3A:
    ldh  a,[<H_ButtonsPressed]      ; 09:4C3A
    and  $09                        ; 09:4C3C
    jr   z,Return094C5F             ; 09:4C3E
    call Sub0010A9                  ; 09:4C40
    ld   a,$0A                      ; 09:4C43
    ld   [$C356],a                  ; 09:4C45
    ld   a,$00                      ; 09:4C48
    ldh  [<H_GameSubstate],a        ; 09:4C4A
    ld   a,[$C362]                  ; 09:4C4C
    and  a                          ; 09:4C4F
    jr   z,Code094C5B               ; 09:4C50
    ld   a,$00                      ; 09:4C52
    ld   [W_LevelID],a              ; 09:4C54
    inc  a                          ; 09:4C57
    ld   [W_HardFlag],a             ; 09:4C58
Code094C5B:
    ld   a,$1A                      ; 09:4C5B
    ldh  [<H_GameState],a           ; 09:4C5D
Return094C5F:
    ret                             ; 09:4C5F

Sub094C60:
    ld   hl,SRAMENABLE              ; 09:4C60
    ld   [hl],$0A                   ; 09:4C63
    ld   a,$07                      ; 09:4C65
    ldh  [<SVBK],a                  ; 09:4C67
    ld   hl,$D878                   ; 09:4C69
    ld   b,$00                      ; 09:4C6C
    ldh  a,[<$FFA0]                 ; 09:4C6E
    ld   c,a                        ; 09:4C70
    sla  a                          ; 09:4C71
    add  c                          ; 09:4C73
    ld   c,a                        ; 09:4C74
    add  hl,bc                      ; 09:4C75
    push hl                         ; 09:4C76
    pop  de                         ; 09:4C77
    call LoadScoreTileBuffer        ; 09:4C78
    ld   hl,Data09507F              ; 09:4C7B
    ldh  a,[<$FFA0]                 ; 09:4C7E
    sla  a                          ; 09:4C80
    sla  a                          ; 09:4C82
    ld   c,a                        ; 09:4C84
    ld   b,$00                      ; 09:4C85
    add  hl,bc                      ; 09:4C87
    ld   e,l                        ; 09:4C88
    ld   d,h                        ; 09:4C89
    ld   b,$04                      ; 09:4C8A
    ld   hl,$C327                   ; 09:4C8C
Code094C8F:
    ld   a,[de]                     ; 09:4C8F
    ldi  [hl],a                     ; 09:4C90
    inc  de                         ; 09:4C91
    dec  b                          ; 09:4C92
    jr   nz,Code094C8F              ; 09:4C93
    ld   de,W_ScoreTileBuffer       ; 09:4C95
    ld   b,$06                      ; 09:4C98
Code094C9A:
    ld   a,$04                      ; 09:4C9A
    ldi  [hl],a                     ; 09:4C9C
    ld   a,[de]                     ; 09:4C9D
    ldi  [hl],a                     ; 09:4C9E
    inc  de                         ; 09:4C9F
    dec  b                          ; 09:4CA0
    jr   nz,Code094C9A              ; 09:4CA1
    ld   [hl],$04                   ; 09:4CA3
    inc  hl                         ; 09:4CA5
    ld   [hl],$D0                   ; 09:4CA6
    inc  hl                         ; 09:4CA8
    ld   [hl],$04                   ; 09:4CA9
    inc  hl                         ; 09:4CAB
    ld   [hl],$F4                   ; 09:4CAC
    inc  hl                         ; 09:4CAE
    push hl                         ; 09:4CAF
    ld   hl,$D800                   ; 09:4CB0
    ld   b,$00                      ; 09:4CB3
    ldh  a,[<$FFA0]                 ; 09:4CB5
    sla  a                          ; 09:4CB7
    sla  a                          ; 09:4CB9
    ld   c,a                        ; 09:4CBB
    sla  a                          ; 09:4CBC
    add  c                          ; 09:4CBE
    ld   c,a                        ; 09:4CBF
    add  hl,bc                      ; 09:4CC0
    push hl                         ; 09:4CC1
    pop  de                         ; 09:4CC2
    pop  hl                         ; 09:4CC3
    ld   b,$0C                      ; 09:4CC4
Code094CC6:
    ld   a,[de]                     ; 09:4CC6
    ldi  [hl],a                     ; 09:4CC7
    inc  de                         ; 09:4CC8
    dec  b                          ; 09:4CC9
    jr   nz,Code094CC6              ; 09:4CCA
    ld   [hl],$04                   ; 09:4CCC
    inc  hl                         ; 09:4CCE
    ld   [hl],$F4                   ; 09:4CCF
    inc  hl                         ; 09:4CD1
    push hl                         ; 09:4CD2
    ld   hl,$D8A0                   ; 09:4CD3
    ld   b,$00                      ; 09:4CD6
    ldh  a,[<$FFA0]                 ; 09:4CD8
    ld   c,a                        ; 09:4CDA
    add  hl,bc                      ; 09:4CDB
    ld   a,[hl]                     ; 09:4CDC
    and  a                          ; 09:4CDD
    jr   nz,Code094CE4              ; 09:4CDE
    ld   d,$F8                      ; 09:4CE0
    jr   Code094CE6                 ; 09:4CE2
Code094CE4:
    ld   d,$CD                      ; 09:4CE4
Code094CE6:
    ld   hl,$D896                   ; 09:4CE6
    ld   b,$00                      ; 09:4CE9
    ldh  a,[<$FFA0]                 ; 09:4CEB
    ld   c,a                        ; 09:4CED
    add  hl,bc                      ; 09:4CEE
    ld   a,[hl]                     ; 09:4CEF
    srl  a                          ; 09:4CF0
    srl  a                          ; 09:4CF2
    add  $D1                        ; 09:4CF4
    ld   b,a                        ; 09:4CF6
    ld   a,[hl]                     ; 09:4CF7
    and  $03                        ; 09:4CF8
    add  $D1                        ; 09:4CFA
    ld   c,a                        ; 09:4CFC
    pop  hl                         ; 09:4CFD
    ld   a,$04                      ; 09:4CFE
    ldi  [hl],a                     ; 09:4D00
    ld   [hl],b                     ; 09:4D01
    inc  hl                         ; 09:4D02
    ldi  [hl],a                     ; 09:4D03
    ld   [hl],d                     ; 09:4D04
    inc  hl                         ; 09:4D05
    ldi  [hl],a                     ; 09:4D06
    ld   [hl],c                     ; 09:4D07
    xor  a                          ; 09:4D08
    ldh  [<SVBK],a                  ; 09:4D09
    ret                             ; 09:4D0B

Sub094D0C:
    ld   a,[$C357]                  ; 09:4D0C
    ldh  [<$FFA0],a                 ; 09:4D0F
    call Sub094C60                  ; 09:4D11
    ld   b,$00                      ; 09:4D14
    ld   a,[$C357]                  ; 09:4D16
    swap a                          ; 09:4D19
    ld   c,a                        ; 09:4D1B
    sla  c                          ; 09:4D1C
    rl   b                          ; 09:4D1E
    ld   hl,$9A40                   ; 09:4D20
    add  hl,bc                      ; 09:4D23
    ld   c,l                        ; 09:4D24
    ld   b,h                        ; 09:4D25
    ld   hl,W_TiUpBuffer            ; 09:4D26
    ld   [hl],b                     ; 09:4D29
    inc  hl                         ; 09:4D2A
    ld   [hl],c                     ; 09:4D2B
    inc  hl                         ; 09:4D2C
    ld   [hl],$14                   ; 09:4D2D
    inc  hl                         ; 09:4D2F
    ld   de,$C327                   ; 09:4D30
    ld   b,$28                      ; 09:4D33
Code094D35:
    ld   a,[de]                     ; 09:4D35
    ldi  [hl],a                     ; 09:4D36
    inc  de                         ; 09:4D37
    dec  b                          ; 09:4D38
    jr   nz,Code094D35              ; 09:4D39
    ld   [hl],$00                   ; 09:4D3B
    ret                             ; 09:4D3D

Sub094D3E:
    ld   b,$00                      ; 09:4D3E
    ld   a,[$C356]                  ; 09:4D40
    swap a                          ; 09:4D43
    ld   c,a                        ; 09:4D45
    sla  c                          ; 09:4D46
    rl   b                          ; 09:4D48
    ld   hl,$9A40                   ; 09:4D4A
    add  hl,bc                      ; 09:4D4D
    ld   c,l                        ; 09:4D4E
    ld   b,h                        ; 09:4D4F
    ld   hl,W_TiUpBuffer            ; 09:4D50
    ld   [hl],b                     ; 09:4D53
    inc  hl                         ; 09:4D54
    ld   [hl],c                     ; 09:4D55
    inc  hl                         ; 09:4D56
    ld   [hl],$54                   ; 09:4D57
    inc  hl                         ; 09:4D59
    ld   [hl],$00                   ; 09:4D5A
    inc  hl                         ; 09:4D5C
    ld   [hl],$F4                   ; 09:4D5D
    inc  hl                         ; 09:4D5F
    ld   [hl],$00                   ; 09:4D60
    ret                             ; 09:4D62

Sub094D63:
; Game state 40
    ldh  a,[<H_GameSubstate]        ; 09:4D63
    rst  $00                        ; 09:4D65  Execute from 16-bit pointer table
.dw Code094D6A                      ; 09:4D66
.dw Code094D94                      ; 09:4D68

Code094D6A:
    ldh  a,[<H_ButtonsPressed]      ; 09:4D6A
    and  $0B                        ; 09:4D6C
    jr   nz,Code094DA7              ; 09:4D6E
    ld   a,[$C326]                  ; 09:4D70
    dec  a                          ; 09:4D73
    ld   [$C326],a                  ; 09:4D74
    and  $1F                        ; 09:4D77
    ret  nz                         ; 09:4D79
    call Sub094D0C                  ; 09:4D7A
    ld   a,[$C357]                  ; 09:4D7D
    dec  a                          ; 09:4D80
    ld   [$C357],a                  ; 09:4D81
    bit  7,a                        ; 09:4D84
    ret  z                          ; 09:4D86
    ld   hl,$C164                   ; 09:4D87
    ld   [hl],$BA                   ; 09:4D8A
    inc  hl                         ; 09:4D8C
    ld   [hl],$03                   ; 09:4D8D
    ld   hl,H_GameSubstate          ; 09:4D8F
    inc  [hl]                       ; 09:4D92
    ret                             ; 09:4D93

Code094D94:
    ld   hl,$C164                   ; 09:4D94
    ld   e,[hl]                     ; 09:4D97
    inc  hl                         ; 09:4D98
    ld   d,[hl]                     ; 09:4D99
    dec  de                         ; 09:4D9A
    ld   [hl],d                     ; 09:4D9B
    dec  hl                         ; 09:4D9C
    ld   [hl],e                     ; 09:4D9D
    ld   a,d                        ; 09:4D9E
    or   e                          ; 09:4D9F
    jr   z,Code094DA7               ; 09:4DA0
    ldh  a,[<H_ButtonsPressed]      ; 09:4DA2
    and  $0B                        ; 09:4DA4
    ret  z                          ; 09:4DA6
Code094DA7:
    xor  a                          ; 09:4DA7
    ldh  [<H_GameSubstate],a        ; 09:4DA8
    ld   a,$02                      ; 09:4DAA
    ldh  [<H_GameState],a           ; 09:4DAC
    ret                             ; 09:4DAE

Ti_Data094DAF:                      ; 09:4DAF
.incbin "data/Tilemaps/Data094DAF.bin"
Data09507F:                         ; 09:507F
.db $05,$C4,$05,$C5,$05,$C6,$05,$C7,\
    $05,$70,$05,$71,$04,$72,$04,$73,\
    $04,$74,$04,$75,$04,$76,$04,$77,\
    $04,$78,$04,$79,$04,$7A,$04,$7B,\
    $04,$7C,$04,$7D,$04,$C2,$04,$C3
Pal_RecordsTitleDemo:               ; 09:50A7
.dw $0000,$7FFF,$0000,$0000,$639F,$3A98,$25D2,$0000,\
    $0000,$0000,$0000,$7FFF,$0000,$0000,$0000,$0000,\
    $0000,$7FFF,$0000,$0000,$0000,$001F,$0000,$0000,\
    $0000,$03E0,$0000,$0000,$0000,$7C00,$0000,$0000

Sub0950E7:
    ld   a,$09                      ; 09:50E7
    rst  $10                        ; 09:50E9  24-bit call
.dl SubL_07588C                     ; 09:50EA
    call Sub0951D9                  ; 09:50ED
    ret                             ; 09:50F0

Sub0950F1:
    call Sub00126D                  ; 09:50F1
    ld   a,$00                      ; 09:50F4
    ldh  [<IE],a                    ; 09:50F6
    ld   a,:Gr_Bank1B               ; 09:50F8
    ld   b,$09                      ; 09:50FA
    call LoadGraphicsBank           ; 09:50FC
    call Sub00128D                  ; 09:50FF
    ld   a,$00                      ; 09:5102
    ld   [W_SublevelID],a           ; 09:5104
    ldh  [<H_GameSubstate],a        ; 09:5107
    ld   [$C28F],a                  ; 09:5109
    ld   [$C290],a                  ; 09:510C
    ld   [$C324],a                  ; 09:510F
    ld   [$C325],a                  ; 09:5112
    ldh  [<$FFA3],a                 ; 09:5115
    ldh  [<$FFA4],a                 ; 09:5117
    ldh  [<H_CameraXLow],a          ; 09:5119
    ldh  [<H_CameraXHigh],a         ; 09:511B
    ldh  [<$FFBB],a                 ; 09:511D
    ld   a,$70                      ; 09:511F
    ldh  [<H_CameraY],a             ; 09:5121
    ld   a,$60                      ; 09:5123
    ld   [$C326],a                  ; 09:5125
    ld   a,:Sub0950F1               ; 09:5128
    ld   b,a                        ; 09:512A
    ld   de,Pal_RecordsTitleDemo    ; 09:512B
    call LoadFullPaletteLong        ; 09:512E
    ld   hl,$DFC2                   ; 09:5131
    ld   [hl],$FF                   ; 09:5134
    inc  hl                         ; 09:5136
    ld   [hl],$7F                   ; 09:5137
    ld   a,:Sub0950F1               ; 09:5139
    ld   b,a                        ; 09:513B
    ld   de,$99C0                   ; 09:513C
    ld   hl,Ti_Data094DAF           ; 09:513F
    call LoadScreenTilemapVRAM      ; 09:5142
    ld   hl,$C291                   ; 09:5145
    ld   b,$06                      ; 09:5148
Code09514A:
    ld   a,$04                      ; 09:514A
    ldi  [hl],a                     ; 09:514C
    ld   a,$F4                      ; 09:514D
    ldi  [hl],a                     ; 09:514F
    dec  b                          ; 09:5150
    jr   nz,Code09514A              ; 09:5151
    ld   a,[$C362]                  ; 09:5153
    and  a                          ; 09:5156
    jr   z,Code09516A               ; 09:5157
    ld   a,$1F                      ; 09:5159
    ld   [W_LevelID],a              ; 09:515B
    ld   a,[$C362]                  ; 09:515E
    bit  7,a                        ; 09:5161
    jr   nz,Code09516A              ; 09:5163
    ld   a,$00                      ; 09:5165
    ld   [W_HardFlag],a             ; 09:5167
Code09516A:
    ld   de,W_PlayerScoreLow        ; 09:516A
    call LoadScoreTileBuffer        ; 09:516D
    ld   a,[W_HardFlag]             ; 09:5170
    and  a                          ; 09:5173
    jr   nz,Code09517A              ; 09:5174
    ld   c,$F8                      ; 09:5176
    jr   Code09517C                 ; 09:5178
Code09517A:
    ld   c,$CD                      ; 09:517A
Code09517C:
    ld   a,[W_LevelID]              ; 09:517C
    srl  a                          ; 09:517F
    srl  a                          ; 09:5181
    add  $D1                        ; 09:5183
    ld   d,a                        ; 09:5185
    ld   a,[W_LevelID]              ; 09:5186
    and  $03                        ; 09:5189
    add  $D1                        ; 09:518B
    ld   e,a                        ; 09:518D
    ld   a,$04                      ; 09:518E
    ld   hl,W_TiUpBuffer            ; 09:5190
    ld   [hl],$9A                   ; 09:5193
    inc  hl                         ; 09:5195
    ld   [hl],$41                   ; 09:5196
    inc  hl                         ; 09:5198
    ld   [hl],$0B                   ; 09:5199
    inc  hl                         ; 09:519B
    ldi  [hl],a                     ; 09:519C
    ld   [hl],d                     ; 09:519D
    inc  hl                         ; 09:519E
    ldi  [hl],a                     ; 09:519F
    ld   [hl],c                     ; 09:51A0
    inc  hl                         ; 09:51A1
    ldi  [hl],a                     ; 09:51A2
    ld   [hl],e                     ; 09:51A3
    inc  hl                         ; 09:51A4
    ldi  [hl],a                     ; 09:51A5
    ld   [hl],$F4                   ; 09:51A6
    inc  hl                         ; 09:51A8
    ld   de,W_ScoreTileBuffer       ; 09:51A9
    ld   b,$06                      ; 09:51AC
Code0951AE:
    ld   a,$04                      ; 09:51AE
    ldi  [hl],a                     ; 09:51B0
    ld   a,[de]                     ; 09:51B1
    ldi  [hl],a                     ; 09:51B2
    inc  de                         ; 09:51B3
    dec  b                          ; 09:51B4
    jr   nz,Code0951AE              ; 09:51B5
    ld   [hl],$04                   ; 09:51B7
    inc  hl                         ; 09:51B9
    ld   [hl],$D0                   ; 09:51BA
    inc  hl                         ; 09:51BC
    ld   [hl],$00                   ; 09:51BD
    ld   a,$09                      ; 09:51BF
    call Sub001480                  ; 09:51C1
    call Sub09521A                  ; 09:51C4
    ld   a,$77                      ; 09:51C7
    ld   [$DE68],a                  ; 09:51C9
    ld   a,$01                      ; 09:51CC
    ldh  [<IE],a                    ; 09:51CE
    ld   a,$87                      ; 09:51D0
    ldh  [<LCDC],a                  ; 09:51D2
    ld   hl,H_GameState             ; 09:51D4
    inc  [hl]                       ; 09:51D7
    ret                             ; 09:51D8

Sub0951D9:
    ld   hl,SRAMENABLE              ; 09:51D9
    ld   [hl],$0A                   ; 09:51DC
    ld   a,$07                      ; 09:51DE
    ldh  [<SVBK],a                  ; 09:51E0
    ld   a,$0A                      ; 09:51E2
    ld   [$C356],a                  ; 09:51E4
Code0951E7:
    ld   a,[$C356]                  ; 09:51E7
    dec  a                          ; 09:51EA
    ld   e,a                        ; 09:51EB
    sla  a                          ; 09:51EC
    add  e                          ; 09:51EE
    ld   e,a                        ; 09:51EF
    ld   d,$00                      ; 09:51F0
    ld   hl,$D87A                   ; 09:51F2
    add  hl,de                      ; 09:51F5
    ld   de,W_PlayerScoreHigh       ; 09:51F6
    ld   c,$03                      ; 09:51F9
Code0951FB:
    ld   a,[hl]                     ; 09:51FB
    ld   b,a                        ; 09:51FC
    ld   a,[de]                     ; 09:51FD
    cp   b                          ; 09:51FE
    jr   c,Code095211               ; 09:51FF
    jr   nz,Code095208              ; 09:5201
    dec  de                         ; 09:5203
    dec  hl                         ; 09:5204
    dec  c                          ; 09:5205
    jr   nz,Code0951FB              ; 09:5206
Code095208:
    ld   a,[$C356]                  ; 09:5208
    dec  a                          ; 09:520B
    ld   [$C356],a                  ; 09:520C
    jr   nz,Code0951E7              ; 09:520F
Code095211:
    xor  a                          ; 09:5211
    ldh  [<SVBK],a                  ; 09:5212
    ld   hl,SRAMENABLE              ; 09:5214
    ld   [hl],$FF                   ; 09:5217
    ret                             ; 09:5219

Sub09521A:
    ld   de,$C291                   ; 09:521A
    ld   hl,$C29D                   ; 09:521D
    ld   b,$0C                      ; 09:5220
Code095222:
    ld   a,[de]                     ; 09:5222
    ldi  [hl],a                     ; 09:5223
    inc  de                         ; 09:5224
    dec  b                          ; 09:5225
    jr   nz,Code095222              ; 09:5226
    ld   a,$07                      ; 09:5228
    ldh  [<SVBK],a                  ; 09:522A
    ld   de,$D800                   ; 09:522C
    ld   hl,$C2A9                   ; 09:522F
    ld   b,$78                      ; 09:5232
Code095234:
    ld   a,[de]                     ; 09:5234
    ldi  [hl],a                     ; 09:5235
    inc  de                         ; 09:5236
    dec  b                          ; 09:5237
    jr   nz,Code095234              ; 09:5238
    xor  a                          ; 09:523A
    ldh  [<SVBK],a                  ; 09:523B
    ret                             ; 09:523D

Data09523E:                         ; 09:523E
.db $48,$48,$48,$48,$48,$48,$48,$48,\
    $48,$48,$00,$00,$00,$00,$00,$00,\
    $58,$58,$58,$58,$58,$58,$58,$58,\
    $58,$58,$00,$00,$00,$00,$00,$00,\
    $68,$68,$68,$68,$68,$68,$68,$68,\
    $68,$68,$00,$00,$00,$00,$00,$00,\
    $78,$78,$78,$78,$78,$78,$78,$78,\
    $78,$78,$00,$00,$00,$00,$00,$00,\
    $88,$88,$88,$88,$88,$88,$88,$88,\
    $88,$88,$00,$00,$00,$00,$00,$00,\
    $98,$98,$98,$98,$98,$98,$98,$98,\
    $98,$98,$00,$00,$00,$00,$00,$00
Data09529E:                         ; 09:529E
.db $08,$18,$28,$38,$48,$58,$68,$78,\
    $88,$98,$00,$00,$00,$00,$00,$00,\
    $08,$18,$28,$38,$48,$58,$68,$78,\
    $88,$98,$00,$00,$00,$00,$00,$00,\
    $08,$18,$28,$38,$48,$58,$68,$78,\
    $88,$98,$00,$00,$00,$00,$00,$00,\
    $08,$18,$28,$38,$48,$58,$68,$78,\
    $88,$98,$00,$00,$00,$00,$00,$00,\
    $08,$18,$28,$38,$48,$58,$68,$78,\
    $88,$98,$00,$00,$00,$00,$00,$00,\
    $10,$20,$30,$48,$48,$48,$80,$80,\
    $80,$80,$00,$00,$00,$00,$00,$00
Data0952FE:                         ; 09:52FE
.db $DA,$DB,$DC,$DD,$DE,$DF,$E0,$E1,\
    $E2,$E3,$00,$00,$00,$00,$00,$00,\
    $E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,\
    $EC,$ED,$00,$00,$00,$00,$00,$00,\
    $EE,$EF,$F0,$F1,$F2,$F3,$CE,$C9,\
    $F8,$F4,$00,$00,$00,$00,$00,$00,\
    $D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,\
    $D8,$D9,$00,$00,$00,$00,$00,$00,\
    $CD,$FA,$FB,$FC,$F4,$F4,$F4,$F4,\
    $F4,$F4,$00,$00,$00,$00,$00,$00,\
    $00,$F4,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00
Data09535E:                         ; 09:535E
.db $70,$78,$80,$88,$90,$98
Data095364:                         ; 09:5364
.dw $7FFF,$001F,$03E0,$7C00,$0000,$03FF

Sub095370:
; Game state 15
    ldh  a,[<H_GameSubstate]        ; 09:5370
    rst  $00                        ; 09:5372  Execute from 16-bit pointer table
.dw Code095377                      ; 09:5373
.dw Code0954E1                      ; 09:5375

Code095377:
    call Sub0954F9                  ; 09:5377
    ld   a,[$C28F]                  ; 09:537A
    and  $F0                        ; 09:537D
    cp   $F0                        ; 09:537F
    jr   nc,Code095391              ; 09:5381
    cp   $60                        ; 09:5383
    jr   c,Code09539B               ; 09:5385
    ld   a,[$C28F]                  ; 09:5387
    and  $0F                        ; 09:538A
    ld   [$C28F],a                  ; 09:538C
    jr   Code09539B                 ; 09:538F
Code095391:
    ld   a,[$C28F]                  ; 09:5391
    and  $0F                        ; 09:5394
    or   $50                        ; 09:5396
    ld   [$C28F],a                  ; 09:5398
Code09539B:
    ld   a,[$C28F]                  ; 09:539B
    ld   c,a                        ; 09:539E
    ld   b,$00                      ; 09:539F
    ld   hl,Data09523E              ; 09:53A1
    add  hl,bc                      ; 09:53A4
    ld   d,[hl]                     ; 09:53A5
    ld   hl,Data09529E              ; 09:53A6
    add  hl,bc                      ; 09:53A9
    ld   e,[hl]                     ; 09:53AA
    ld   a,[$C290]                  ; 09:53AB
    ld   c,a                        ; 09:53AE
    ld   b,$00                      ; 09:53AF
    ld   hl,Data09535E              ; 09:53B1
    add  hl,bc                      ; 09:53B4
    ld   c,[hl]                     ; 09:53B5
    ld   hl,W_OAMBuffer             ; 09:53B6
    ld   [hl],d                     ; 09:53B9
    inc  hl                         ; 09:53BA
    ld   [hl],e                     ; 09:53BB
    inc  hl                         ; 09:53BC
    ld   [hl],$B4                   ; 09:53BD
    inc  hl                         ; 09:53BF
    ld   [hl],$00                   ; 09:53C0
    ldh  a,[<$FFA6]                 ; 09:53C2
    dec  a                          ; 09:53C4
    ldh  [<$FFA6],a                 ; 09:53C5
    bit  5,a                        ; 09:53C7
    jr   z,Code0953D6               ; 09:53C9
    inc  hl                         ; 09:53CB
    ld   [hl],$30                   ; 09:53CC
    inc  hl                         ; 09:53CE
    ld   [hl],c                     ; 09:53CF
    inc  hl                         ; 09:53D0
    ld   [hl],$B6                   ; 09:53D1
    inc  hl                         ; 09:53D3
    ld   [hl],$00                   ; 09:53D4
Code0953D6:
    ldh  a,[<H_ButtonsPressed]      ; 09:53D6
    and  $08                        ; 09:53D8
    jr   z,Code0953EA               ; 09:53DA
Code0953DC:
    ld   a,$FF                      ; 09:53DC
    ld   [$DE68],a                  ; 09:53DE
    ld   a,$24                      ; 09:53E1
    ldh  [<$FFF3],a                 ; 09:53E3
    ld   hl,H_GameSubstate          ; 09:53E5
    inc  [hl]                       ; 09:53E8
    ret                             ; 09:53E9

Code0953EA:
    ldh  a,[<H_ButtonsPressed]      ; 09:53EA
    and  $04                        ; 09:53EC
    jr   z,Code095424               ; 09:53EE
    ld   a,$47                      ; 09:53F0
    ldh  [<$FFF2],a                 ; 09:53F2
    call Sub0955A5                  ; 09:53F4
    ld   a,[$C325]                  ; 09:53F7
    inc  a                          ; 09:53FA
    cp   $0B                        ; 09:53FB
    jr   c,Code095401               ; 09:53FD
    ld   a,$00                      ; 09:53FF
Code095401:
    ld   [$C325],a                  ; 09:5401
    call Sub0955BA                  ; 09:5404
    ld   a,[$C325]                  ; 09:5407
    and  a                          ; 09:540A
    jr   nz,Code095417              ; 09:540B
    xor  a                          ; 09:540D
    ld   [$C290],a                  ; 09:540E
    ld   [$C28F],a                  ; 09:5411
    jp   Code0954C7                 ; 09:5414
Code095417:
    ld   a,$05                      ; 09:5417
    ld   [$C290],a                  ; 09:5419
    ld   a,$56                      ; 09:541C
    ld   [$C28F],a                  ; 09:541E
    jp   Code0954C7                 ; 09:5421
Code095424:
    ldh  a,[<H_ButtonsPressed]      ; 09:5424
    and  $02                        ; 09:5426
    jp   nz,Code0954A9              ; 09:5428
    ldh  a,[<H_ButtonsPressed]      ; 09:542B
    and  $01                        ; 09:542D
    ret  z                          ; 09:542F
    ld   a,[$C28F]                  ; 09:5430
    cp   $56                        ; 09:5433
    jr   nc,Code0953DC              ; 09:5435
    cp   $53                        ; 09:5437
    jr   nc,Code095484              ; 09:5439
    cp   $52                        ; 09:543B
    jr   nc,Code0954B8              ; 09:543D
    cp   $51                        ; 09:543F
    jr   nc,Code095447              ; 09:5441
    cp   $50                        ; 09:5443
    jr   nc,Code0954A9              ; 09:5445
Code095447:
    ld   a,$44                      ; 09:5447
    ldh  [<$FFF2],a                 ; 09:5449
    ld   a,$00                      ; 09:544B
    ld   [$C325],a                  ; 09:544D
    ld   a,[$C290]                  ; 09:5450
    sla  a                          ; 09:5453
    ld   c,a                        ; 09:5455
    ld   b,$00                      ; 09:5456
    ld   hl,$C291                   ; 09:5458
    add  hl,bc                      ; 09:545B
    ld   a,[$C324]                  ; 09:545C
    add  $04                        ; 09:545F
    ldi  [hl],a                     ; 09:5461
    push hl                         ; 09:5462
    ld   a,[$C28F]                  ; 09:5463
    ld   c,a                        ; 09:5466
    ld   b,$00                      ; 09:5467
    ld   hl,Data0952FE              ; 09:5469
    add  hl,bc                      ; 09:546C
    ld   a,[hl]                     ; 09:546D
    pop  hl                         ; 09:546E
    ld   [hl],a                     ; 09:546F
    ld   a,[$C290]                  ; 09:5470
    cp   $05                        ; 09:5473
    jr   c,Code09547E               ; 09:5475
    ld   a,$56                      ; 09:5477
    ld   [$C28F],a                  ; 09:5479
    jr   Code0954C7                 ; 09:547C
Code09547E:
    inc  a                          ; 09:547E
    ld   [$C290],a                  ; 09:547F
    jr   Code0954C7                 ; 09:5482
Code095484:
    ld   a,$44                      ; 09:5484
    ldh  [<$FFF2],a                 ; 09:5486
    ld   a,[$C324]                  ; 09:5488
    inc  a                          ; 09:548B
    and  $03                        ; 09:548C
    ld   [$C324],a                  ; 09:548E
    sla  a                          ; 09:5491
    ld   c,a                        ; 09:5493
    ld   b,$00                      ; 09:5494
    ld   hl,Data095364              ; 09:5496
    add  hl,bc                      ; 09:5499
    ld   e,l                        ; 09:549A
    ld   d,h                        ; 09:549B
    ld   hl,$DF82                   ; 09:549C
    ld   a,[de]                     ; 09:549F
    ldi  [hl],a                     ; 09:54A0
    inc  de                         ; 09:54A1
    ld   a,[de]                     ; 09:54A2
    ld   [hl],a                     ; 09:54A3
    ld   a,$01                      ; 09:54A4
    ldh  [<$FFC0],a                 ; 09:54A6
    ret                             ; 09:54A8

Code0954A9:
    ld   a,$63                      ; 09:54A9
    ldh  [<$FFF2],a                 ; 09:54AB
    ld   a,[$C290]                  ; 09:54AD
    cp   $00                        ; 09:54B0
    ret  z                          ; 09:54B2
    dec  a                          ; 09:54B3
    ld   [$C290],a                  ; 09:54B4
    ret                             ; 09:54B7

Code0954B8:
    ld   a,$44                      ; 09:54B8
    ldh  [<$FFF2],a                 ; 09:54BA
    ld   a,[$C290]                  ; 09:54BC
    cp   $05                        ; 09:54BF
    ret  nc                         ; 09:54C1
    inc  a                          ; 09:54C2
    ld   [$C290],a                  ; 09:54C3
    ret                             ; 09:54C6

Code0954C7:
    ld   hl,W_TiUpBuffer            ; 09:54C7
    ld   [hl],$9A                   ; 09:54CA
    inc  hl                         ; 09:54CC
    ld   [hl],$4D                   ; 09:54CD
    inc  hl                         ; 09:54CF
    ld   [hl],$06                   ; 09:54D0
    inc  hl                         ; 09:54D2
    ld   de,$C291                   ; 09:54D3
    ld   b,$0C                      ; 09:54D6
Code0954D8:
    ld   a,[de]                     ; 09:54D8
    ldi  [hl],a                     ; 09:54D9
    inc  de                         ; 09:54DA
    dec  b                          ; 09:54DB
    jr   nz,Code0954D8              ; 09:54DC
    ld   [hl],$00                   ; 09:54DE
    ret                             ; 09:54E0

Code0954E1:
    ld   a,[$C326]                  ; 09:54E1
    dec  a                          ; 09:54E4
    ld   [$C326],a                  ; 09:54E5
    jr   nz,Return0954F8            ; 09:54E8
    ld   a,$09                      ; 09:54EA
    rst  $10                        ; 09:54EC  24-bit call
.dl SubL_075A04                     ; 09:54ED
    ld   a,$00                      ; 09:54F0
    ldh  [<H_GameSubstate],a        ; 09:54F2
    ld   a,$12                      ; 09:54F4
    ldh  [<H_GameState],a           ; 09:54F6
Return0954F8:
    ret                             ; 09:54F8

Sub0954F9:
    ldh  a,[<H_ButtonsHeld]         ; 09:54F9
    ld   c,a                        ; 09:54FB
    ld   b,$04                      ; 09:54FC
Code0954FE:
    rlc  c                          ; 09:54FE
    jr   c,Code09550B               ; 09:5500
    dec  b                          ; 09:5502
    jr   nz,Code0954FE              ; 09:5503
    xor  a                          ; 09:5505
    ldh  [<$FFA3],a                 ; 09:5506
    ldh  [<$FFA4],a                 ; 09:5508
    ret                             ; 09:550A

Code09550B:
    ldh  a,[<$FFA3]                 ; 09:550B
    cp   $20                        ; 09:550D
    jr   nc,Code09551B              ; 09:550F
    ldh  a,[<$FFA3]                 ; 09:5511
    inc  a                          ; 09:5513
    ldh  [<$FFA3],a                 ; 09:5514
    cp   $01                        ; 09:5516
    jr   z,Code095525               ; 09:5518
    ret                             ; 09:551A

Code09551B:
    ldh  a,[<$FFA4]                 ; 09:551B
    inc  a                          ; 09:551D
    ldh  [<$FFA4],a                 ; 09:551E
    and  $03                        ; 09:5520
    jr   z,Code095525               ; 09:5522
    ret                             ; 09:5524

Code095525:
    ld   a,$47                      ; 09:5525
    ldh  [<$FFF2],a                 ; 09:5527
    ld   a,b                        ; 09:5529
    cp   $04                        ; 09:552A
    jr   z,Code09553B               ; 09:552C
    cp   $03                        ; 09:552E
    jr   z,Code095544               ; 09:5530
    cp   $02                        ; 09:5532
    jr   z,Code09554D               ; 09:5534
    cp   $01                        ; 09:5536
    jr   z,Code095579               ; 09:5538
    ret                             ; 09:553A

Code09553B:
    ld   a,[$C28F]                  ; 09:553B
    add  $10                        ; 09:553E
    ld   [$C28F],a                  ; 09:5540
    ret                             ; 09:5543

Code095544:
    ld   a,[$C28F]                  ; 09:5544
    sub  $10                        ; 09:5547
    ld   [$C28F],a                  ; 09:5549
    ret                             ; 09:554C

Code09554D:
    ld   a,[$C28F]                  ; 09:554D
    cp   $56                        ; 09:5550
    jr   nc,Code09556C              ; 09:5552
    cp   $53                        ; 09:5554
    jr   nc,Code095573              ; 09:5556
    dec  a                          ; 09:5558
    ld   [$C28F],a                  ; 09:5559
    and  $0F                        ; 09:555C
    cp   $0F                        ; 09:555E
    jr   nz,Return0955A4            ; 09:5560
    ld   a,[$C28F]                  ; 09:5562
    add  $0A                        ; 09:5565
    ld   [$C28F],a                  ; 09:5567
    jr   Return0955A4               ; 09:556A
Code09556C:
    ld   a,$55                      ; 09:556C
    ld   [$C28F],a                  ; 09:556E
    jr   Return0955A4               ; 09:5571
Code095573:
    ld   a,$52                      ; 09:5573
    ld   [$C28F],a                  ; 09:5575
    ret                             ; 09:5578

Code095579:
    ld   a,[$C28F]                  ; 09:5579
    cp   $56                        ; 09:557C
    jr   nc,Code095598              ; 09:557E
    cp   $53                        ; 09:5580
    jr   nc,Code09559F              ; 09:5582
    inc  a                          ; 09:5584
    ld   [$C28F],a                  ; 09:5585
    and  $0F                        ; 09:5588
    cp   $0A                        ; 09:558A
    jr   c,Return0955A4             ; 09:558C
    ld   a,[$C28F]                  ; 09:558E
    sub  $0A                        ; 09:5591
    ld   [$C28F],a                  ; 09:5593
    jr   Return0955A4               ; 09:5596
Code095598:
    ld   a,$50                      ; 09:5598
    ld   [$C28F],a                  ; 09:559A
    jr   Return0955A4               ; 09:559D
Code09559F:
    ld   a,$56                      ; 09:559F
    ld   [$C28F],a                  ; 09:55A1
Return0955A4:
    ret                             ; 09:55A4

Sub0955A5:
    ld   a,[$C325]                  ; 09:55A5
    and  a                          ; 09:55A8
    jr   nz,Return0955B9            ; 09:55A9
    ld   de,$C291                   ; 09:55AB
    ld   hl,$C29D                   ; 09:55AE
    ld   b,$0C                      ; 09:55B1
Code0955B3:
    ld   a,[de]                     ; 09:55B3
    ldi  [hl],a                     ; 09:55B4
    inc  de                         ; 09:55B5
    dec  b                          ; 09:55B6
    jr   nz,Code0955B3              ; 09:55B7
Return0955B9:
    ret                             ; 09:55B9

Sub0955BA:
    ld   a,[$C325]                  ; 09:55BA
    sla  a                          ; 09:55BD
    sla  a                          ; 09:55BF
    ld   c,a                        ; 09:55C1
    sla  a                          ; 09:55C2
    add  c                          ; 09:55C4
    ld   c,a                        ; 09:55C5
    ld   b,$00                      ; 09:55C6
    ld   hl,$C29D                   ; 09:55C8
    add  hl,bc                      ; 09:55CB
    push hl                         ; 09:55CC
    pop  de                         ; 09:55CD
    ld   hl,$C291                   ; 09:55CE
    ld   b,$0C                      ; 09:55D1
Code0955D3:
    ld   a,[de]                     ; 09:55D3
    ldi  [hl],a                     ; 09:55D4
    inc  de                         ; 09:55D5
    dec  b                          ; 09:55D6
    jr   nz,Code0955D3              ; 09:55D7
    ret                             ; 09:55D9

TiUp_0955DA:                        ; 09:55DA
.db $00

NonGBCError_Main:
; Game state 37
    ldh  a,[<H_GameSubstate]        ; 09:55DB
    rst  $00                        ; 09:55DD  Execute from 16-bit pointer table
.dw NonGBCError_LoadGraphics        ; 09:55DE
.dw Return095628                    ; 09:55E0

NonGBCError_LoadGraphics:
; Non-GBC error substate 0
    call Sub00126D                  ; 09:55E2
    xor  a                          ; 09:55E5
    ldh  [<IE],a                    ; 09:55E6
    ldh  [<$FF93],a                 ; 09:55E8
    ldh  [<SCY],a                   ; 09:55EA
    ld   [$C0C1],a                  ; 09:55EC
    ld   a,$E4                      ; 09:55EF
    ldh  [<BGP],a                   ; 09:55F1
    ld   hl,Gr_NonGBCError          ; 09:55F3
    ld   de,$8800                   ; 09:55F6
    ld   bc,$0600                   ; 09:55F9
    ld   a,:Gr_NonGBCError          ; 09:55FC
    ld   [$C415],a                  ; 09:55FE
    ld   a,:NonGBCError_LoadGraphics; 09:5601
    call CopyBytesLong              ; 09:5603
    ld   hl,Ti_NonGBCError          ; 09:5606
    ld   de,$9800                   ; 09:5609
    ld   bc,$0240                   ; 09:560C
    ld   a,:Ti_NonGBCError          ; 09:560F
    ld   [$C415],a                  ; 09:5611
    ld   a,:NonGBCError_LoadGraphics; 09:5614
    call CopyBytesLong              ; 09:5616
    ld   a,$01                      ; 09:5619
    ldh  [<IE],a                    ; 09:561B
    ldh  [<$FF93],a                 ; 09:561D
    ld   a,$81                      ; 09:561F
    ldh  [<LCDC],a                  ; 09:5621
    ld   hl,H_GameSubstate          ; 09:5623
    inc  [hl]                       ; 09:5626  to substate 1: infinite loop
    ret                             ; 09:5627

Return095628:
; Non-GBC error substate 1: infinite loop
    ret                             ; 09:5628

Ti_SPTitle_Tiles:                   ; 09:5629
.incbin "data/Tilemaps/SPTitle_Tiles.bin"
Ti_SPTitle_Attr:                    ; 09:5869
.incbin "data/Tilemaps/SPTitle_Attr.bin"
Pal_SPTitle:                        ; 09:5AA9
.dw $07FF,$01FF,$0014,$0000,$73FF,$01FF,$0000,$0000,\
    $0000,$294A,$56B5,$73FF,$0000,$0000,$0000,$0000,\
    $07FF,$013B,$0014,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$73FF,$01FF,$0000,$0000

SPTitle_Main:
; Game state 38
    ldh  a,[<H_GameSubstate]        ; 09:5AE9
    rst  $00                        ; 09:5AEB  Execute from 16-bit pointer table
.dw Code095AF4                      ; 09:5AEC
.dw Code095B32                      ; 09:5AEE
.dw Code095B4B                      ; 09:5AF0
.dw Code095B58                      ; 09:5AF2

Code095AF4:
; SP title screen substate 0
    call Sub00126D                  ; 09:5AF4
    ld   a,$FF                      ; 09:5AF7
    ld   [$DE68],a                  ; 09:5AF9
    xor  a                          ; 09:5AFC
    ldh  [<IE],a                    ; 09:5AFD
    ldh  [<SCY],a                   ; 09:5AFF
    ld   a,$04                      ; 09:5B01
    ldh  [<SCX],a                   ; 09:5B03
    ld   a,$09                      ; 09:5B05
    rst  $10                        ; 09:5B07  24-bit call
.dl SubL_LoadSaveFile               ; 09:5B08
    call SPTitle_LoadGraphics       ; 09:5B0B
    call Sub095D37                  ; 09:5B0E
    ld   a,$01                      ; 09:5B11
    ldh  [<IE],a                    ; 09:5B13
    ldh  [<$FF97],a                 ; 09:5B15
    xor  a                          ; 09:5B17
    ldh  [<$FF98],a                 ; 09:5B18
    ldh  [<$FF99],a                 ; 09:5B1A
    ld   [$C1B7],a                  ; 09:5B1C
    ld   a,$81                      ; 09:5B1F
    ldh  [<LCDC],a                  ; 09:5B21
    ld   a,$04                      ; 09:5B23
    ld   [$C0C1],a                  ; 09:5B25
    ld   a,$14                      ; 09:5B28
    ld   [$C40F],a                  ; 09:5B2A
    ld   hl,H_GameSubstate          ; 09:5B2D
    inc  [hl]                       ; 09:5B30
    ret                             ; 09:5B31

Code095B32:
; SP title screen substate 1
    ld   a,[$C40F]                  ; 09:5B32
    dec  a                          ; 09:5B35
    ld   [$C40F],a                  ; 09:5B36
    and  a                          ; 09:5B39
    jr   nz,Return095B4A            ; 09:5B3A
    ld   a,$6C                      ; 09:5B3C
    ld   [$DE68],a                  ; 09:5B3E
    ld   a,$1E                      ; 09:5B41
    ld   [$C40F],a                  ; 09:5B43
    ld   hl,H_GameSubstate          ; 09:5B46
    inc  [hl]                       ; 09:5B49
Return095B4A:
    ret                             ; 09:5B4A

Code095B4B:
; SP title screen substate 2
    ldh  a,[<$FF99]                 ; 09:5B4B
    and  a                          ; 09:5B4D
    jr   z,Code095B54               ; 09:5B4E
    call Sub095C00                  ; 09:5B50
    ret                             ; 09:5B53

Code095B54:
    call Sub095B66                  ; 09:5B54
    ret                             ; 09:5B57

Code095B58:
; SP title screen substate 3
    ld   a,[$C40F]                  ; 09:5B58
    dec  a                          ; 09:5B5B
    ld   [$C40F],a                  ; 09:5B5C
    jr   nz,@Return                 ; 09:5B5F
    ld   a,$04                      ; 09:5B61
    ldh  [<H_GameState],a           ; 09:5B63
@Return:
    ret                             ; 09:5B65

Sub095B66:
    ldh  a,[<H_ButtonsPressed]      ; 09:5B66
    ld   b,a                        ; 09:5B68
    bit  2,a                        ; 09:5B69
    jr   z,Code095B70               ; 09:5B6B
    jp   Code095BEF                 ; 09:5B6D
Code095B70:
    and  $09                        ; 09:5B70
    jp   z,Code095BCB               ; 09:5B72
    call Sub0010A9                  ; 09:5B75
    xor  a                          ; 09:5B78
    ld   [$C1EF],a                  ; 09:5B79
    ldh  a,[<$FF97]                 ; 09:5B7C
    and  a                          ; 09:5B7E
    jr   nz,Code095BA7              ; 09:5B7F
    xor  a                          ; 09:5B81
    ld   [W_SublevelID],a           ; 09:5B82
    ld   [W_LevelID],a              ; 09:5B85
    ld   [$C1A9],a                  ; 09:5B88
    ld   [$C1AA],a                  ; 09:5B8B
    ld   [$C1AB],a                  ; 09:5B8E
    ld   [$C1AC],a                  ; 09:5B91
    ld   a,[$C1B2]                  ; 09:5B94
    and  a                          ; 09:5B97
    ld   a,$05                      ; 09:5B98
    jr   z,Code095B9E               ; 09:5B9A
    ld   a,$0A                      ; 09:5B9C  if "Extremely Lucky" fortune, start with 10 lives
Code095B9E:
    ld   [W_PlayerLives],a          ; 09:5B9E  set life count in Super Players mode
    ld   hl,H_GameSubstate          ; 09:5BA1
    inc  [hl]                       ; 09:5BA4
    jr   Return095BEE               ; 09:5BA5
Code095BA7:
    ld   a,$00                      ; 09:5BA7
    and  a                          ; 09:5BA9
    jr   nz,Code095BBE              ; 09:5BAA
    ld   a,[$C169]                  ; 09:5BAC
    and  a                          ; 09:5BAF
    jr   nz,Code095BBE              ; 09:5BB0
    ld   a,[W_LevelID]              ; 09:5BB2
    ld   [W_SublevelID],a           ; 09:5BB5
    ld   hl,H_GameSubstate          ; 09:5BB8
    inc  [hl]                       ; 09:5BBB
    jr   Return095BEE               ; 09:5BBC
Code095BBE:
    ldh  a,[<$FF97]                 ; 09:5BBE
    ldh  [<$FF98],a                 ; 09:5BC0
    ld   a,$02                      ; 09:5BC2
    ldh  [<$FF97],a                 ; 09:5BC4
    dec  a                          ; 09:5BC6
    ldh  [<$FF99],a                 ; 09:5BC7
    jr   Return095BEE               ; 09:5BC9
Code095BCB:
    bit  1,b                        ; 09:5BCB
    jr   z,Code095BD9               ; 09:5BCD
    ld   a,$63                      ; 09:5BCF
    ldh  [<$FFF2],a                 ; 09:5BD1
    ld   a,$18                      ; 09:5BD3
    ldh  [<H_GameState],a           ; 09:5BD5
    jr   Return095BEE               ; 09:5BD7
Code095BD9:
    ldh  a,[<$FFA6]                 ; 09:5BD9
    and  a                          ; 09:5BDB
    jr   z,Return095BEE             ; 09:5BDC
    ld   a,b                        ; 09:5BDE
    ldh  a,[<H_ButtonsHeld]         ; 09:5BDF
    and  $C0                        ; 09:5BE1
    jr   z,Return095BEE             ; 09:5BE3
    ld   a,b                        ; 09:5BE5
    and  $C0                        ; 09:5BE6
    ld   hl,Code095BEF              ; 09:5BE8
    jp   Code095C66                 ; 09:5BEB
Return095BEE:
    ret                             ; 09:5BEE

Code095BEF:
    ld   a,$47                      ; 09:5BEF
    ldh  [<$FFF2],a                 ; 09:5BF1
    ldh  a,[<$FF97]                 ; 09:5BF3
    ldh  [<$FF98],a                 ; 09:5BF5
    xor  $01                        ; 09:5BF7
    ldh  [<$FF97],a                 ; 09:5BF9
    ld   a,$08                      ; 09:5BFB
    ldh  [<$FF9B],a                 ; 09:5BFD
    ret                             ; 09:5BFF

Sub095C00:
    ldh  a,[<H_ButtonsPressed]      ; 09:5C00
    ld   b,a                        ; 09:5C02
    ldh  a,[<H_ButtonsHeld]         ; 09:5C03
    bit  6,a                        ; 09:5C05
    jr   z,Code095C11               ; 09:5C07
    bit  6,b                        ; 09:5C09
    ld   hl,Code095C9B              ; 09:5C0B
    jp   Code095C66                 ; 09:5C0E
Code095C11:
    bit  7,a                        ; 09:5C11
    jr   z,Code095C1D               ; 09:5C13
    bit  7,b                        ; 09:5C15
    ld   hl,Code095CA4              ; 09:5C17
    jp   Code095C66                 ; 09:5C1A
Code095C1D:
    bit  4,a                        ; 09:5C1D
    jr   z,Code095C29               ; 09:5C1F
    bit  4,b                        ; 09:5C21
    ld   hl,Code095C87              ; 09:5C23
    jp   Code095C66                 ; 09:5C26
Code095C29:
    bit  5,a                        ; 09:5C29
    jr   z,Code095C35               ; 09:5C2B
    bit  5,b                        ; 09:5C2D
    ld   hl,Code095C91              ; 09:5C2F
    jp   Code095C66                 ; 09:5C32
Code095C35:
    ld   a,b                        ; 09:5C35
    and  $09                        ; 09:5C36
    jr   z,Code095C50               ; 09:5C38
    call Sub0010A9                  ; 09:5C3A
    xor  a                          ; 09:5C3D
    ld   [$C1EF],a                  ; 09:5C3E
    ld   a,[$C3F1]                  ; 09:5C41
    ld   [W_SublevelID],a           ; 09:5C44
    ld   [W_LevelID],a              ; 09:5C47
    ld   hl,H_GameSubstate          ; 09:5C4A
    inc  [hl]                       ; 09:5C4D
    jr   Return095C65               ; 09:5C4E
Code095C50:
    bit  1,b                        ; 09:5C50
    jr   z,Return095C65             ; 09:5C52
    ld   a,$63                      ; 09:5C54
    ldh  [<$FFF2],a                 ; 09:5C56
    ldh  a,[<$FF97]                 ; 09:5C58
    ldh  [<$FF98],a                 ; 09:5C5A
    ld   a,$01                      ; 09:5C5C
    ldh  [<$FF97],a                 ; 09:5C5E
    dec  a                          ; 09:5C60
    ldh  [<$FF99],a                 ; 09:5C61
    jr   Return095C65               ; 09:5C63
Return095C65:
    ret                             ; 09:5C65

Code095C66:
    jr   z,Code095C71               ; 09:5C66
    ld   a,$10                      ; 09:5C68
    ldh  [<$FF9A],a                 ; 09:5C6A
    xor  a                          ; 09:5C6C
    ldh  [<$FF9B],a                 ; 09:5C6D
    jr   Code095C7B                 ; 09:5C6F
Code095C71:
    ldh  a,[<$FF9A]                 ; 09:5C71
    and  a                          ; 09:5C73
    jr   z,Code095C7B               ; 09:5C74
    dec  a                          ; 09:5C76
    ldh  [<$FF9A],a                 ; 09:5C77
    jr   Return095C86               ; 09:5C79
Code095C7B:
    ldh  a,[<$FF9B]                 ; 09:5C7B
    and  a                          ; 09:5C7D
    jr   z,Code095C85               ; 09:5C7E
    dec  a                          ; 09:5C80
    ldh  [<$FF9B],a                 ; 09:5C81
    jr   Return095C86               ; 09:5C83
Code095C85:
    jp   hl                         ; 09:5C85
Return095C86:
    ret                             ; 09:5C86

Code095C87:
    ld   a,[$C3F1]                  ; 09:5C87
    add  $04                        ; 09:5C8A
    and  $1F                        ; 09:5C8C
    jp   Code095CAD                 ; 09:5C8E
Code095C91:
    ld   a,[$C3F1]                  ; 09:5C91
    sub  $04                        ; 09:5C94
    and  $1F                        ; 09:5C96
    jp   Code095CAD                 ; 09:5C98
Code095C9B:
    ld   a,[$C3F1]                  ; 09:5C9B
    inc  a                          ; 09:5C9E
    and  $1F                        ; 09:5C9F
    jp   Code095CAD                 ; 09:5CA1
Code095CA4:
    ld   a,[$C3F1]                  ; 09:5CA4
    dec  a                          ; 09:5CA7
    and  $1F                        ; 09:5CA8
    jp   Code095CAD                 ; 09:5CAA
Code095CAD:
    ld   [$C3F1],a                  ; 09:5CAD
    ld   a,$08                      ; 09:5CB0
    ldh  [<$FF9B],a                 ; 09:5CB2
    ld   a,$47                      ; 09:5CB4
    ldh  [<$FFF2],a                 ; 09:5CB6
    ret                             ; 09:5CB8

SPTitle_LoadGraphics:
    ld   hl,Gr_SPTitle              ; 09:5CB9
    ld   de,$8800                   ; 09:5CBC
    ld   bc,$1000                   ; 09:5CBF
    ld   a,$0F                      ; 09:5CC2
    ld   [$C415],a                  ; 09:5CC4
    ld   a,$09                      ; 09:5CC7
    call CopyBytesLong              ; 09:5CC9
    ld   a,$01                      ; 09:5CCC
    ldh  [<VBK],a                   ; 09:5CCE
    ld   hl,Ti_SPTitle_Attr         ; 09:5CD0
    ld   de,$9800                   ; 09:5CD3
    ld   bc,$0240                   ; 09:5CD6
    call CopyBytes                  ; 09:5CD9
    xor  a                          ; 09:5CDC
    ldh  [<VBK],a                   ; 09:5CDD
    ld   hl,Ti_SPTitle_Tiles        ; 09:5CDF
    ld   de,$9800                   ; 09:5CE2
    ld   bc,$0240                   ; 09:5CE5
    call CopyBytes                  ; 09:5CE8
    ld   hl,Pal_SPTitle             ; 09:5CEB
    ld   b,$20                      ; 09:5CEE
    ld   a,$80                      ; 09:5CF0
    ldh  [<BGPI],a                  ; 09:5CF2
@Loop:
    ldi  a,[hl]                     ; 09:5CF4
    ldh  [<BGPD],a                  ; 09:5CF5
    ldi  a,[hl]                     ; 09:5CF7
    ldh  [<BGPD],a                  ; 09:5CF8
    dec  b                          ; 09:5CFA
    jr   nz,@Loop                   ; 09:5CFB
    ret                             ; 09:5CFD

Sub095CFE:
    xor  a                          ; 09:5CFE
    ld   hl,$9A30                   ; 09:5CFF
    ld   [hl],a                     ; 09:5D02
    ld   a,[$C16D]                  ; 09:5D03
    ldh  [<$FFA5],a                 ; 09:5D06
    ld   a,[$C16E]                  ; 09:5D08
    ldh  [<$FFA4],a                 ; 09:5D0B
    ld   a,[$C16F]                  ; 09:5D0D
    ldh  [<$FFA3],a                 ; 09:5D10
    ld   hl,$FF97                   ; 09:5D12
    call HexToDec24bit              ; 09:5D15
    ld   de,$9A2F                   ; 09:5D18
    ld   c,$06                      ; 09:5D1B
Code095D1D:
    ldd  a,[hl]                     ; 09:5D1D
    and  $0F                        ; 09:5D1E
    ld   [de],a                     ; 09:5D20
    dec  de                         ; 09:5D21
    dec  c                          ; 09:5D22
    jr   nz,Code095D1D              ; 09:5D23
    ld   hl,$9A2A                   ; 09:5D25
Code095D28:
    ld   a,[hl]                     ; 09:5D28
    cp   $FF                        ; 09:5D29
    jr   z,Code095D30               ; 09:5D2B
    and  a                          ; 09:5D2D
    jr   nz,Return095D36            ; 09:5D2E
Code095D30:
    ld   a,$FF                      ; 09:5D30
    ld   [hl],a                     ; 09:5D32
    inc  hl                         ; 09:5D33
    jr   Code095D28                 ; 09:5D34
Return095D36:
    ret                             ; 09:5D36

Sub095D37:
    xor  a                          ; 09:5D37
    ldh  [<$FFA6],a                 ; 09:5D38
    ld   a,$00                      ; 09:5D3A
    and  a                          ; 09:5D3C
    jr   nz,Code095D51              ; 09:5D3D
    ld   hl,SRAMENABLE              ; 09:5D3F
    ld   [hl],$0A                   ; 09:5D42
    ld   a,[W_SaveFileNum]          ; 09:5D44
    call VerifySaveFileChecksum     ; 09:5D47
    ld   hl,SRAMENABLE              ; 09:5D4A
    ld   [hl],$FF                   ; 09:5D4D
    jr   nc,Code095D70              ; 09:5D4F
Code095D51:
    ld   a,$01                      ; 09:5D51
    ldh  [<$FFA6],a                 ; 09:5D53
    call Sub095CFE                  ; 09:5D55
    ld   de,$99EC                   ; 09:5D58
    ld   a,[W_LevelID]              ; 09:5D5B
    ld   [$C3F1],a                  ; 09:5D5E
    ld   b,a                        ; 09:5D61
    and  $03                        ; 09:5D62
    inc  a                          ; 09:5D64
    ld   [de],a                     ; 09:5D65
    dec  de                         ; 09:5D66
    dec  de                         ; 09:5D67
    srl  b                          ; 09:5D68
    srl  b                          ; 09:5D6A
    inc  b                          ; 09:5D6C
    ld   a,b                        ; 09:5D6D
    ld   [de],a                     ; 09:5D6E
    ret                             ; 09:5D6F

Code095D70:
    ld   hl,$9A2A                   ; 09:5D70
    ld   a,$FF                      ; 09:5D73
    ldi  [hl],a                     ; 09:5D75
    ldi  [hl],a                     ; 09:5D76
    ld   a,$02                      ; 09:5D77
    ldi  [hl],a                     ; 09:5D79
    ld   c,$04                      ; 09:5D7A
    xor  a                          ; 09:5D7C
Code095D7D:
    ldi  [hl],a                     ; 09:5D7D
    dec  c                          ; 09:5D7E
    jr   nz,Code095D7D              ; 09:5D7F
    ld   hl,$9985                   ; 09:5D81
    ld   [hl],$24                   ; 09:5D84
    ld   hl,$99C5                   ; 09:5D86
    ld   de,$99E5                   ; 09:5D89
    ld   c,$0A                      ; 09:5D8C
    ld   a,$FF                      ; 09:5D8E
Code095D90:
    ldi  [hl],a                     ; 09:5D90
    ld   [de],a                     ; 09:5D91
    inc  de                         ; 09:5D92
    dec  c                          ; 09:5D93
    jr   nz,Code095D90              ; 09:5D94
    ret                             ; 09:5D96
