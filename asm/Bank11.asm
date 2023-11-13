.bank $11 slot 1
.orga $4000

Data114000:                         ; 11:4000
.db $9A,$A6,$09,$00,$DC,$00,$E8,$00,\
    $E7,$00,$ED,$00,$E2,$00,$E7,$00,\
    $EE,$00,$DE,$00,$CC,$9A,$E9,$03,\
    $00,$F2,$00,$DE,$00,$EC,$9B,$29,\
    $02,$00,$E7,$00,$E8,$00

Sub114026:
; Game state 1A
    ld   a,[$C362]                  ; 11:4026
    and  a                          ; 11:4029
    jr   z,@Code114032              ; 11:402A
    ld   a,$01                      ; 11:402C
    ld   [$C1B1],a                  ; 11:402E
    ret                             ; 11:4031
@Code114032:
    call Sub00126D                  ; 11:4032
    ld   a,$00                      ; 11:4035
    ldh  [<IE],a                    ; 11:4037
    ld   a,:Gr_NormalGameplay       ; 11:4039
    ld   b,$11                      ; 11:403B
    call LoadGraphicsBank           ; 11:403D
    call Sub00128D                  ; 11:4040
    ld   a,$00                      ; 11:4043
    ldh  [<H_GameSubstate],a        ; 11:4045
    ld   [$C168],a                  ; 11:4047
    ld   [$C35B],a                  ; 11:404A
    ldh  [<H_CameraXLow],a          ; 11:404D
    ldh  [<H_CameraXHigh],a         ; 11:404F
    ldh  [<$FFBB],a                 ; 11:4051
    ld   a,$70                      ; 11:4053
    ldh  [<H_CameraY],a             ; 11:4055
    ld   a,$00                      ; 11:4057
    ld   hl,W_PaletteBuffer         ; 11:4059
    ldi  [hl],a                     ; 11:405C
    ld   [hl],a                     ; 11:405D
    inc  a                          ; 11:405E
    ldh  [<$FFC0],a                 ; 11:405F
    ld   a,$0A                      ; 11:4061
    ld   [$C171],a                  ; 11:4063
    ld   a,$11                      ; 11:4066
    call Sub001480                  ; 11:4068
    ld   a,$01                      ; 11:406B
    ldh  [<IE],a                    ; 11:406D
    ld   a,$87                      ; 11:406F
    ldh  [<LCDC],a                  ; 11:4071
    ld   hl,H_GameState             ; 11:4073
    inc  [hl]                       ; 11:4076
    ret                             ; 11:4077

Data114078:                         ; 11:4078
.db $CA,$F4,$F4,$F4,$F4,$CA

Sub11407E:
; Game state 1B
    ldh  a,[<H_GameSubstate]        ; 11:407E
    rst  $00                        ; 11:4080  Execute from 16-bit pointer table
.dw Code114089                      ; 11:4081
.dw Code1140D4                      ; 11:4083
.dw Code11414E                      ; 11:4085
.dw Code1141B8                      ; 11:4087

Code114089:
    ldh  a,[<H_ButtonsPressed]      ; 11:4089
    and  $C0                        ; 11:408B
    jr   z,Code11409C               ; 11:408D
    ld   a,$47                      ; 11:408F
    ldh  [<$FFF2],a                 ; 11:4091
    ld   a,[$C35B]                  ; 11:4093
    inc  a                          ; 11:4096
    and  $01                        ; 11:4097
    ld   [$C35B],a                  ; 11:4099
Code11409C:
    ld   a,[$C35B]                  ; 11:409C
    ld   c,a                        ; 11:409F
    sla  a                          ; 11:40A0
    add  c                          ; 11:40A2
    ld   c,a                        ; 11:40A3
    ld   b,$00                      ; 11:40A4
    ld   hl,Data114078              ; 11:40A6
    add  hl,bc                      ; 11:40A9
    ld   e,l                        ; 11:40AA
    ld   d,h                        ; 11:40AB
    ld   hl,W_TilemapUploadBuffer   ; 11:40AC
    ld   [hl],$9A                   ; 11:40AF
    inc  hl                         ; 11:40B1
    ld   [hl],$E8                   ; 11:40B2
    inc  hl                         ; 11:40B4
    ld   [hl],$83                   ; 11:40B5
    inc  hl                         ; 11:40B7
    ld   b,$03                      ; 11:40B8
Code1140BA:
    ld   [hl],$00                   ; 11:40BA
    inc  hl                         ; 11:40BC
    ld   a,[de]                     ; 11:40BD
    ldi  [hl],a                     ; 11:40BE
    inc  de                         ; 11:40BF
    dec  b                          ; 11:40C0
    jr   nz,Code1140BA              ; 11:40C1
    ld   [hl],$00                   ; 11:40C3
    ldh  a,[<H_ButtonsPressed]      ; 11:40C5
    and  $09                        ; 11:40C7
    jr   z,Return1140D3             ; 11:40C9
    ld   a,$44                      ; 11:40CB
    ldh  [<$FFF2],a                 ; 11:40CD
    ld   hl,H_GameSubstate          ; 11:40CF
    inc  [hl]                       ; 11:40D2
Return1140D3:
    ret                             ; 11:40D3

Code1140D4:
    ld   a,[$C35B]                  ; 11:40D4
    and  a                          ; 11:40D7
    jr   nz,Code114136              ; 11:40D8
    ld   a,[$C1B2]                  ; 11:40DA
    and  a                          ; 11:40DD
    jr   nz,Code1140E4              ; 11:40DE
    ld   a,$05                      ; 11:40E0
    jr   Code1140E6                 ; 11:40E2
Code1140E4:
    ld   a,$0A                      ; 11:40E4  if "Extremely Lucky" fortune, start with 10 lives
Code1140E6:
    ld   [W_PlayerLives],a          ; 11:40E6  set lives after game over
    ld   hl,$C17A                   ; 11:40E9
    ld   a,$00                      ; 11:40EC
    ldi  [hl],a                     ; 11:40EE
    ldi  [hl],a                     ; 11:40EF
    ld   [hl],a                     ; 11:40F0
    ld   [W_PlayerCoins],a          ; 11:40F1
    ld   [$C1EF],a                  ; 11:40F4
    ld   [$C182],a                  ; 11:40F7
    ld   [$C1B3],a                  ; 11:40FA
    ldh  [<H_GameSubstate],a        ; 11:40FD
    ld   hl,$C164                   ; 11:40FF
    ld   [hl],$FF                   ; 11:4102
    inc  hl                         ; 11:4104
    ld   [hl],$01                   ; 11:4105
    ld   a,$04                      ; 11:4107
    ldh  [<H_GameState],a           ; 11:4109
    ret                             ; 11:410B

Data11410C:                         ; 11:410C
.db $9A,$A6,$09,$00,$EC,$00,$DA,$00,\
    $EF,$00,$DE,$00,$CC,$00,$F4,$00,\
    $F4,$00,$F4,$00,$F4,$9A,$E8,$04,\
    $00,$CA,$00,$F2,$00,$DE,$00,$EC,\
    $9B,$28,$03,$00,$F4,$00,$E7,$00,\
    $E8,$00
Code114136:
    ld   de,Data11410C              ; 11:4136
    ld   hl,W_TilemapUploadBuffer   ; 11:4139
    ld   b,$2A                      ; 11:413C
Code11413E:
    ld   a,[de]                     ; 11:413E
    ldi  [hl],a                     ; 11:413F
    inc  de                         ; 11:4140
    dec  b                          ; 11:4141
    jr   nz,Code11413E              ; 11:4142
    ld   a,$00                      ; 11:4144
    ld   [$C35B],a                  ; 11:4146
    ld   hl,H_GameSubstate          ; 11:4149
    inc  [hl]                       ; 11:414C
    ret                             ; 11:414D

Code11414E:
    ldh  a,[<H_ButtonsPressed]      ; 11:414E
    and  $C0                        ; 11:4150
    jr   z,Code114161               ; 11:4152
    ld   a,$47                      ; 11:4154
    ldh  [<$FFF2],a                 ; 11:4156
    ld   a,[$C35B]                  ; 11:4158
    inc  a                          ; 11:415B
    and  $01                        ; 11:415C
    ld   [$C35B],a                  ; 11:415E
Code114161:
    ld   a,[$C35B]                  ; 11:4161
    ld   c,a                        ; 11:4164
    sla  a                          ; 11:4165
    add  c                          ; 11:4167
    ld   c,a                        ; 11:4168
    ld   b,$00                      ; 11:4169
    ld   hl,Data114078              ; 11:416B
    add  hl,bc                      ; 11:416E
    ld   e,l                        ; 11:416F
    ld   d,h                        ; 11:4170
    ld   hl,W_TilemapUploadBuffer   ; 11:4171
    ld   [hl],$9A                   ; 11:4174
    inc  hl                         ; 11:4176
    ld   [hl],$E8                   ; 11:4177
    inc  hl                         ; 11:4179
    ld   [hl],$83                   ; 11:417A
    inc  hl                         ; 11:417C
    ld   b,$03                      ; 11:417D
Code11417F:
    ld   [hl],$00                   ; 11:417F
    inc  hl                         ; 11:4181
    ld   a,[de]                     ; 11:4182
    ldi  [hl],a                     ; 11:4183
    inc  de                         ; 11:4184
    dec  b                          ; 11:4185
    jr   nz,Code11417F              ; 11:4186
    ld   [hl],$00                   ; 11:4188
    ldh  a,[<H_ButtonsPressed]      ; 11:418A
    and  $02                        ; 11:418C
    jr   z,Code1141A9               ; 11:418E
    ld   a,$63                      ; 11:4190
    ldh  [<$FFF2],a                 ; 11:4192
    ld   a,$01                      ; 11:4194
    ld   [$C35B],a                  ; 11:4196
    ld   a,$00                      ; 11:4199
    ldh  [<H_GameSubstate],a        ; 11:419B
    ld   de,W_TilemapUploadBuffer   ; 11:419D
    ld   hl,Data114000              ; 11:41A0
    ld   bc,$0026                   ; 11:41A3
    call CopyBytes                  ; 11:41A6
Code1141A9:
    ldh  a,[<H_ButtonsPressed]      ; 11:41A9
    and  $09                        ; 11:41AB
    jr   z,Return1141B7             ; 11:41AD
    ld   a,$44                      ; 11:41AF
    ldh  [<$FFF2],a                 ; 11:41B1
    ld   hl,H_GameSubstate          ; 11:41B3
    inc  [hl]                       ; 11:41B6
Return1141B7:
    ret                             ; 11:41B7

Code1141B8:
    ld   a,[$C35B]                  ; 11:41B8
    and  a                          ; 11:41BB
    jr   z,Code1141CD               ; 11:41BC
    ld   a,$00                      ; 11:41BE
    ldh  [<H_GameSubstate],a        ; 11:41C0
    ld   a,[W_SPFlag]               ; 11:41C2
    and  a                          ; 11:41C5
    jr   nz,Code1141FB              ; 11:41C6
    ld   a,$18                      ; 11:41C8
    ldh  [<H_GameState],a           ; 11:41CA
    ret                             ; 11:41CC

Code1141CD:
    ld   hl,$C17A                   ; 11:41CD
    ld   a,$00                      ; 11:41D0
    ldi  [hl],a                     ; 11:41D2
    ldi  [hl],a                     ; 11:41D3
    ld   [hl],a                     ; 11:41D4
    ld   a,$05                      ; 11:41D5
    ld   [W_PlayerLives],a          ; 11:41D7
    ld   a,$00                      ; 11:41DA
    ld   [W_PlayerCoins],a          ; 11:41DC
    ld   [$C1EF],a                  ; 11:41DF
    ld   [$C182],a                  ; 11:41E2
    ld   [$C1B3],a                  ; 11:41E5
    ldh  [<H_GameSubstate],a        ; 11:41E8
    ld   a,$11                      ; 11:41EA
    rst  $10                        ; 11:41EC  24-bit call
.dl SubL_075584                     ; 11:41ED
    ld   a,[W_SPFlag]               ; 11:41F0
    and  a                          ; 11:41F3
    jr   nz,Code1141FB              ; 11:41F4
    ld   a,$18                      ; 11:41F6
    ldh  [<H_GameState],a           ; 11:41F8
    ret                             ; 11:41FA

Code1141FB:
    ld   a,$38                      ; 11:41FB
    ldh  [<H_GameState],a           ; 11:41FD
    ret                             ; 11:41FF

FileSelectInit:
; Game state 16
    call Sub00126D                  ; 11:4200
    ld   a,$00                      ; 11:4203
    ldh  [<IE],a                    ; 11:4205
    ld   a,:Gr_MainMenu_FileSelect  ; 11:4207
    ld   b,$11                      ; 11:4209
    call LoadGraphicsBank           ; 11:420B
    ld   a,:Pal_FileSelect          ; 11:420E
    ld   b,$11                      ; 11:4210
    ld   de,Pal_FileSelect          ; 11:4212
    call LoadFullPaletteLong        ; 11:4215
    call Sub00128D                  ; 11:4218
    ld   a,:Ti_FileSelect           ; 11:421B
    ld   b,$11                      ; 11:421D
    ld   de,$99C0                   ; 11:421F
    ld   hl,Ti_FileSelect           ; 11:4222
    call LoadScreenTilemapVRAM      ; 11:4225
    ld   a,$00                      ; 11:4228
    ld   [$C174],a                  ; 11:422A
    ld   [$C168],a                  ; 11:422D
    ldh  [<H_GameSubstate],a        ; 11:4230
    ld   [$C1C2],a                  ; 11:4232
    ld   [W_PlayerFireFlag],a       ; 11:4235
    ld   [$C1D5],a                  ; 11:4238
    ld   [$C16B],a                  ; 11:423B
    ld   [$C358],a                  ; 11:423E
    ld   [$C359],a                  ; 11:4241
    ld   [W_ChallengeFlag],a        ; 11:4244
    ld   [W_SublevelID],a           ; 11:4247
    ldh  [<H_CameraXLow],a          ; 11:424A
    ldh  [<H_CameraXHigh],a         ; 11:424C
    ldh  [<$FFBB],a                 ; 11:424E
    ld   a,$70                      ; 11:4250
    ldh  [<H_CameraY],a             ; 11:4252
    ld   a,$20                      ; 11:4254
    ld   [$C35E],a                  ; 11:4256
    ld   a,$01                      ; 11:4259
    ld   [$C35F],a                  ; 11:425B
    ld   a,$10                      ; 11:425E
    ld   [$C164],a                  ; 11:4260
    ld   a,$FF                      ; 11:4263
    ld   [$DE68],a                  ; 11:4265
    ld   a,$00                      ; 11:4268
    ldh  [<H_PlayerYHigh],a         ; 11:426A
    ldh  [<H_PlayerXHigh],a         ; 11:426C
    ld   a,$B0                      ; 11:426E
    ldh  [<H_PlayerYLow],a          ; 11:4270
    ld   a,$18                      ; 11:4272
    ldh  [<H_PlayerXLow],a          ; 11:4274
    ld   a,$02                      ; 11:4276
    ld   [$C1C3],a                  ; 11:4278
    ld   a,$01                      ; 11:427B
    ld   [W_PlayerSize],a           ; 11:427D
    ld   a,$11                      ; 11:4280
    rst  $10                        ; 11:4282  24-bit call
.dl SubL_0B421E                     ; 11:4283
    ld   a,$00                      ; 11:4286
    ld   [$C16B],a                  ; 11:4288
Code11428B:
    call Sub11462F                  ; 11:428B
    ld   a,[$C16B]                  ; 11:428E
    inc  a                          ; 11:4291
    ld   [$C16B],a                  ; 11:4292
    cp   $03                        ; 11:4295
    jr   nz,Code11428B              ; 11:4297
    ld   a,$11                      ; 11:4299
    call Sub001480                  ; 11:429B
    xor  a                          ; 11:429E
    ld   [$C16B],a                  ; 11:429F
    ld   a,$04                      ; 11:42A2
    ld   [$C171],a                  ; 11:42A4
    ld   a,$11                      ; 11:42A7
    call Sub001480                  ; 11:42A9
    ld   a,$11                      ; 11:42AC
    rst  $10                        ; 11:42AE  24-bit call
.dl SubL_0756D9                     ; 11:42AF
    ld   a,$01                      ; 11:42B2
    ldh  [<IE],a                    ; 11:42B4
    ld   a,$87                      ; 11:42B6
    ldh  [<LCDC],a                  ; 11:42B8
    ld   hl,H_GameState             ; 11:42BA
    inc  [hl]                       ; 11:42BD
    ret                             ; 11:42BE

FileSelect_PlayerXPos:              ; 11:42BF
.db $18,$48,$78

Sub1142C2:
    ld   a,[$C164]                  ; 11:42C2
    cp   $00                        ; 11:42C5
    jr   z,Code1142DF               ; 11:42C7
    dec  a                          ; 11:42C9
    ld   [$C164],a                  ; 11:42CA
    jr   nz,Code1142DF              ; 11:42CD
    ld   a,[$C168]                  ; 11:42CF
    cp   $02                        ; 11:42D2
    jr   z,Code1142DF               ; 11:42D4
    cp   $03                        ; 11:42D6
    jr   z,Code1142DF               ; 11:42D8
    ld   a,$75                      ; 11:42DA
    ld   [$DE68],a                  ; 11:42DC
Code1142DF:
    ld   a,[$C168]                  ; 11:42DF
    rst  $00                        ; 11:42E2  Execute from 16-bit pointer table
.dw Code1142ED                      ; 11:42E3
.dw Code114399                      ; 11:42E5
.dw Code114531                      ; 11:42E7
.dw Code114559                      ; 11:42E9
.dw Code114770                      ; 11:42EB

Code1142ED:
    ldh  a,[<H_ButtonsPressed]      ; 11:42ED
    and  $08                        ; 11:42EF
    jr   z,Code114304               ; 11:42F1
    ld   a,$31                      ; 11:42F3
    ldh  [<$FFF3],a                 ; 11:42F5
    ld   a,$20                      ; 11:42F7
    ldh  [<H_PlayerYLow],a          ; 11:42F9
    xor  a                          ; 11:42FB
    ldh  [<H_GameSubstate],a        ; 11:42FC
    ld   a,$04                      ; 11:42FE
    ld   [$C168],a                  ; 11:4300
    ret                             ; 11:4303

Code114304:
    ldh  a,[<H_ButtonsPressed]      ; 11:4304
    and  $40                        ; 11:4306
    jr   z,Code114316               ; 11:4308
    ld   a,$00                      ; 11:430A
    and  a                          ; 11:430C
    jr   z,Code114316               ; 11:430D
    ld   a,$01                      ; 11:430F
    ld   [$C358],a                  ; 11:4311
    jr   Code11431C                 ; 11:4314
Code114316:
    ldh  a,[<H_ButtonsPressed]      ; 11:4316
    and  $81                        ; 11:4318
    jr   z,Code114350               ; 11:431A
Code11431C:
    ld   a,$11                      ; 11:431C
    rst  $10                        ; 11:431E  24-bit call
.dl SubL_075485                     ; 11:431F
    ld   a,[$C358]                  ; 11:4322
    and  a                          ; 11:4325
    jr   nz,Code114333              ; 11:4326
    ld   a,[$C169]                  ; 11:4328
    and  a                          ; 11:432B
    jr   z,Code11434E               ; 11:432C
    ld   a,$01                      ; 11:432E
    ld   [$C358],a                  ; 11:4330
Code114333:
    ld   a,[W_SublevelID]           ; 11:4333
    ld   [$C359],a                  ; 11:4336
    ld   a,$44                      ; 11:4339
    ldh  [<$FFF2],a                 ; 11:433B
    ld   a,$A0                      ; 11:433D
    ldh  [<H_PlayerYLow],a          ; 11:433F
    ld   a,$04                      ; 11:4341
    ld   [$C1C2],a                  ; 11:4343
    ld   hl,$C168                   ; 11:4346
    inc  [hl]                       ; 11:4349
    call Sub114507                  ; 11:434A
    ret                             ; 11:434D

Code11434E:
    jr   Code11439F                 ; 11:434E
Code114350:
    ldh  a,[<H_ButtonsPressed]      ; 11:4350
    bit  1,a                        ; 11:4352
    jr   z,Code114364               ; 11:4354
    ld   a,$18                      ; 11:4356  if B button is pressed, return to main menu
    ldh  [<H_GameState],a           ; 11:4358
    ld   a,$00                      ; 11:435A
    ld   [$C168],a                  ; 11:435C
    ld   a,$63                      ; 11:435F
    ldh  [<$FFF2],a                 ; 11:4361
    ret                             ; 11:4363

Code114364:
    ldh  a,[<H_ButtonsPressed]      ; 11:4364
    and  $30                        ; 11:4366  left/right
    jr   z,@Return                  ; 11:4368
                                    ;          if left or right is pressed, change save file
    ld   e,$01                      ; 11:436A  e = +1 if right is pressed
    and  $10                        ; 11:436C
    jr   nz,@Code114372             ; 11:436E
    ld   e,$FF                      ; 11:4370  e = -1 if left is pressed
@Code114372:
    ld   a,[$C16B]                  ; 11:4372
    add  e                          ; 11:4375
    bit  7,a                        ; 11:4376
    jr   z,@Code11437E              ; 11:4378
    ld   a,$02                      ; 11:437A
    jr   @Code114384                ; 11:437C
@Code11437E:
    cp   $03                        ; 11:437E
    jr   c,@Code114384              ; 11:4380
    ld   a,$00                      ; 11:4382
@Code114384:
    ld   [$C16B],a                  ; 11:4384
    ld   a,$47                      ; 11:4387
    ldh  [<$FFF2],a                 ; 11:4389
    ld   a,[$C16B]                  ; 11:438B
    ld   e,a                        ; 11:438E
    ld   d,$00                      ; 11:438F
    ld   hl,FileSelect_PlayerXPos   ; 11:4391
    add  hl,de                      ; 11:4394
    ld   a,[hl]                     ; 11:4395
    ldh  [<H_PlayerXLow],a          ; 11:4396
@Return:
    ret                             ; 11:4398

Code114399:
    ldh  a,[<H_ButtonsPressed]      ; 11:4399
    and  $01                        ; 11:439B
    jr   z,Code1143B6               ; 11:439D
Code11439F:
    ld   a,$B0                      ; 11:439F
    ldh  [<H_PlayerYLow],a          ; 11:43A1
    ld   a,$00                      ; 11:43A3
    ldh  [<$FFAE],a                 ; 11:43A5
    ld   a,$FF                      ; 11:43A7
    ld   [$DE68],a                  ; 11:43A9
    ld   a,$25                      ; 11:43AC
    ldh  [<$FFF3],a                 ; 11:43AE
    ld   hl,$C168                   ; 11:43B0
    ld   [hl],$02                   ; 11:43B3
    ret                             ; 11:43B5

Code1143B6:
    ldh  a,[<H_ButtonsPressed]      ; 11:43B6
    bit  1,a                        ; 11:43B8
    jr   z,Code1143D4               ; 11:43BA
    call Sub11462F                  ; 11:43BC
    ld   hl,$C168                   ; 11:43BF
    ld   [hl],$00                   ; 11:43C2
    ld   a,$00                      ; 11:43C4
    ld   [$C1C2],a                  ; 11:43C6
    ld   [$C358],a                  ; 11:43C9
    ld   a,$B0                      ; 11:43CC
    ldh  [<H_PlayerYLow],a          ; 11:43CE
    call Sub0010A9                  ; 11:43D0
    ret                             ; 11:43D3

Code1143D4:
    xor  a                          ; 11:43D4
    ldh  [<$FF9C],a                 ; 11:43D5
    ld   b,$04                      ; 11:43D7
    ldh  a,[<H_ButtonsHeld]         ; 11:43D9
    ld   c,a                        ; 11:43DB
Code1143DC:
    rlc  c                          ; 11:43DC
    jr   c,Code1143F0               ; 11:43DE
    dec  b                          ; 11:43E0
    jr   nz,Code1143DC              ; 11:43E1
    ld   a,$20                      ; 11:43E3
    ld   [$C35E],a                  ; 11:43E5
    ld   a,$01                      ; 11:43E8
    ld   [$C35F],a                  ; 11:43EA
    jp   Return114530               ; 11:43ED
Code1143F0:
    ld   a,[$C35E]                  ; 11:43F0
    cp   $00                        ; 11:43F3
    jr   z,Code114400               ; 11:43F5
    dec  a                          ; 11:43F7
    ld   [$C35E],a                  ; 11:43F8
    cp   $1F                        ; 11:43FB
    jp   nz,Return114530            ; 11:43FD
Code114400:
    ld   a,[$C35F]                  ; 11:4400
    dec  a                          ; 11:4403
    ld   [$C35F],a                  ; 11:4404
    and  $07                        ; 11:4407
    jp   nz,Return114530            ; 11:4409
    ld   a,b                        ; 11:440C
    cp   $04                        ; 11:440D
    jp   z,Code1144B1               ; 11:440F
    cp   $03                        ; 11:4412
    jp   z,Code1144AD               ; 11:4414
    cp   $02                        ; 11:4417
    jr   z,Code11441F               ; 11:4419
    ld   e,$04                      ; 11:441B
    jr   Code114421                 ; 11:441D
Code11441F:
    ld   e,$FC                      ; 11:441F
Code114421:
    ld   hl,$FF9C                   ; 11:4421
    ld   a,[$C359]                  ; 11:4424
    add  e                          ; 11:4427
    bit  7,a                        ; 11:4428
    jr   z,Code114433               ; 11:442A
    and  $03                        ; 11:442C
    add  $1C                        ; 11:442E
    inc  [hl]                       ; 11:4430
    jr   Code114439                 ; 11:4431
Code114433:
    cp   $20                        ; 11:4433
    jr   c,Code114444               ; 11:4435
    and  $03                        ; 11:4437
Code114439:
    push af                         ; 11:4439
    ld   a,[W_HardFlag]             ; 11:443A
    inc  a                          ; 11:443D
    and  $01                        ; 11:443E
    ld   [W_HardFlag],a             ; 11:4440
    pop  af                         ; 11:4443
Code114444:
    ld   [$C359],a                  ; 11:4444
    ld   a,$47                      ; 11:4447
    ldh  [<$FFF2],a                 ; 11:4449
    ld   a,$00                      ; 11:444B
    and  a                          ; 11:444D
    jp   nz,Sub114507               ; 11:444E
    ld   a,[$C169]                  ; 11:4451
    cp   $03                        ; 11:4454
    jp   z,Sub114507                ; 11:4456
    ld   a,[W_HardFlag]             ; 11:4459
    and  a                          ; 11:445C
    jp   z,Sub114507                ; 11:445D
    ld   a,[$C359]                  ; 11:4460
    ld   b,a                        ; 11:4463
    ld   a,[$C16A]                  ; 11:4464
    cp   b                          ; 11:4467
    jp   nc,Sub114507               ; 11:4468
    ldh  a,[<$FF9C]                 ; 11:446B
    and  a                          ; 11:446D
    jr   z,Code11449F               ; 11:446E
    ld   a,[$C16A]                  ; 11:4470
    and  $1C                        ; 11:4473
    ld   c,a                        ; 11:4475
    ld   a,[$C359]                  ; 11:4476
    and  $03                        ; 11:4479
    ld   b,a                        ; 11:447B
    ld   a,[$C16A]                  ; 11:447C
    and  $03                        ; 11:447F
    cp   b                          ; 11:4481
    jr   nc,Code114498              ; 11:4482
    ld   a,c                        ; 11:4484
    cp   $00                        ; 11:4485
    jr   nz,Code114495              ; 11:4487
    ld   a,$1C                      ; 11:4489
    add  b                          ; 11:448B
    ld   [$C359],a                  ; 11:448C
    xor  a                          ; 11:448F
    ld   [W_HardFlag],a             ; 11:4490
    jr   Sub114507                  ; 11:4493
Code114495:
    sub  $04                        ; 11:4495
    ld   c,a                        ; 11:4497
Code114498:
    ld   a,c                        ; 11:4498
    add  b                          ; 11:4499
    ld   [$C359],a                  ; 11:449A
    jr   Sub114507                  ; 11:449D
Code11449F:
    xor  a                          ; 11:449F
    ld   [W_HardFlag],a             ; 11:44A0
    ld   a,[$C359]                  ; 11:44A3
    and  $03                        ; 11:44A6
    ld   [$C359],a                  ; 11:44A8
    jr   Sub114507                  ; 11:44AB
Code1144AD:
    ld   e,$01                      ; 11:44AD
    jr   Code1144B3                 ; 11:44AF
Code1144B1:
    ld   e,$FF                      ; 11:44B1
Code1144B3:
    ld   a,$47                      ; 11:44B3
    ldh  [<$FFF2],a                 ; 11:44B5
    ld   a,[$C359]                  ; 11:44B7
    add  e                          ; 11:44BA
    push af                         ; 11:44BB
    and  $1F                        ; 11:44BC
    ld   [$C359],a                  ; 11:44BE
    pop  af                         ; 11:44C1
    cp   $20                        ; 11:44C2
    jr   c,Code1144D7               ; 11:44C4
    bit  7,a                        ; 11:44C6
    jr   z,Code1144CE               ; 11:44C8
    ld   a,$01                      ; 11:44CA
    ldh  [<$FF9C],a                 ; 11:44CC
Code1144CE:
    ld   a,[W_HardFlag]             ; 11:44CE
    inc  a                          ; 11:44D1
    and  $01                        ; 11:44D2
    ld   [W_HardFlag],a             ; 11:44D4
Code1144D7:
    ld   a,$00                      ; 11:44D7
    and  a                          ; 11:44D9
    jr   nz,Sub114507               ; 11:44DA
    ld   a,[$C169]                  ; 11:44DC
    cp   $03                        ; 11:44DF
    jr   z,Sub114507                ; 11:44E1
    ld   a,[W_HardFlag]             ; 11:44E3
    and  a                          ; 11:44E6
    jr   z,Sub114507                ; 11:44E7
    ld   a,[$C359]                  ; 11:44E9
    ld   b,a                        ; 11:44EC
    ld   a,[$C16A]                  ; 11:44ED
    cp   b                          ; 11:44F0
    jr   nc,Sub114507               ; 11:44F1
    ldh  a,[<$FF9C]                 ; 11:44F3
    and  a                          ; 11:44F5
    jr   z,Code114500               ; 11:44F6
    ld   a,[$C16A]                  ; 11:44F8
    ld   [$C359],a                  ; 11:44FB
    jr   Sub114507                  ; 11:44FE
Code114500:
    xor  a                          ; 11:4500
    ld   [W_HardFlag],a             ; 11:4501
    ld   [$C359],a                  ; 11:4504

Sub114507:
    ld   a,[$C359]                  ; 11:4507
    push af                         ; 11:450A
    call Sub1145B5                  ; 11:450B
    pop  af                         ; 11:450E
    push af                         ; 11:450F
    srl  a                          ; 11:4510
    srl  a                          ; 11:4512
    inc  a                          ; 11:4514
    or   $D0                        ; 11:4515
    ld   hl,$DF07                   ; 11:4517
    ld   [hl],a                     ; 11:451A
    pop  af                         ; 11:451B
    and  $03                        ; 11:451C
    inc  a                          ; 11:451E
    or   $D0                        ; 11:451F
    ld   hl,$DF0B                   ; 11:4521
    ld   [hl],a                     ; 11:4524
    ld   a,[W_HardFlag]             ; 11:4525
    and  a                          ; 11:4528
    jr   z,Return114530             ; 11:4529
    ld   hl,$DF09                   ; 11:452B
    ld   [hl],$CD                   ; 11:452E
Return114530:
    ret                             ; 11:4530

Code114531:
    ld   a,$0B                      ; 11:4531
    ld   [$C1C2],a                  ; 11:4533
    ld   a,$01                      ; 11:4536
    ld   [$C1E3],a                  ; 11:4538
    ld   a,$18                      ; 11:453B
    ldh  [<$FFAC],a                 ; 11:453D
    ld   a,$11                      ; 11:453F
    rst  $10                        ; 11:4541  24-bit call
.dl SubL_0379CC                     ; 11:4542
    ldh  a,[<H_PlayerYLow]          ; 11:4545
    cp   $D0                        ; 11:4547
    jr   c,Return114558             ; 11:4549
    ld   a,$D0                      ; 11:454B
    ldh  [<H_PlayerYLow],a          ; 11:454D
    ld   a,$40                      ; 11:454F
    ld   [$C284],a                  ; 11:4551
    ld   hl,$C168                   ; 11:4554
    inc  [hl]                       ; 11:4557
Return114558:
    ret                             ; 11:4558

Code114559:
    ld   hl,$C284                   ; 11:4559
    ld   a,[hl]                     ; 11:455C
    dec  [hl]                       ; 11:455D
    and  a                          ; 11:455E
    jr   nz,Return1145A2            ; 11:455F
    ld   [hl],$00                   ; 11:4561
    ld   a,$04                      ; 11:4563
    ldh  [<H_GameState],a           ; 11:4565
    ld   a,[W_HardFlag]             ; 11:4567
    push af                         ; 11:456A
    ld   a,$11                      ; 11:456B
    rst  $10                        ; 11:456D  24-bit call
.dl SubL_075485                     ; 11:456E
    pop  af                         ; 11:4571
    ldh  [<$FF97],a                 ; 11:4572
    ld   a,[$C358]                  ; 11:4574
    and  a                          ; 11:4577
    jr   z,Return1145A2             ; 11:4578
    ld   a,[$C359]                  ; 11:457A
    ld   hl,W_LevelID               ; 11:457D
    cp   [hl]                       ; 11:4580
    jr   z,Code114594               ; 11:4581
    ld   a,$00                      ; 11:4583
    ld   [$C1EF],a                  ; 11:4585
    ld   [$C182],a                  ; 11:4588
    ld   [$C1B3],a                  ; 11:458B
    ld   [W_PlayerSize],a           ; 11:458E
    ld   [W_PlayerFireFlag],a       ; 11:4591
Code114594:
    ldh  a,[<$FF97]                 ; 11:4594
    ld   [W_HardFlag],a             ; 11:4596
    ld   a,[$C359]                  ; 11:4599
    ld   [W_LevelID],a              ; 11:459C
    ld   [W_SublevelID],a           ; 11:459F
Return1145A2:
    ret                             ; 11:45A2

Data1145A3:                         ; 11:45A3
.db $9A,$62,$04,$08,$F0,$08,$D1,$08,\
    $F8,$08,$D1,$00
Data1145AF:                         ; 11:45AF
.db $9A,$62,$9A,$68,$9A,$6E

Sub1145B5:
    ld   de,$0000                   ; 11:45B5
Code1145B8:
    ld   hl,Data1145A3              ; 11:45B8
    add  hl,de                      ; 11:45BB
    ld   a,[hl]                     ; 11:45BC
    ld   hl,W_TilemapUploadBuffer   ; 11:45BD
    add  hl,de                      ; 11:45C0
    ld   [hl],a                     ; 11:45C1
    inc  e                          ; 11:45C2
    ld   a,e                        ; 11:45C3
    cp   $0C                        ; 11:45C4
    jr   nz,Code1145B8              ; 11:45C6
    ld   a,[$C16B]                  ; 11:45C8
    sla  a                          ; 11:45CB
    ld   e,a                        ; 11:45CD
    ld   d,$00                      ; 11:45CE
    ld   hl,Data1145AF              ; 11:45D0
    add  hl,de                      ; 11:45D3
    ld   b,[hl]                     ; 11:45D4
    inc  hl                         ; 11:45D5
    ld   c,[hl]                     ; 11:45D6
    ld   hl,W_TilemapUploadBuffer   ; 11:45D7
    ld   [hl],b                     ; 11:45DA
    inc  hl                         ; 11:45DB
    ld   [hl],c                     ; 11:45DC
    ld   hl,$DF00                   ; 11:45DD
    ld   a,[hl]                     ; 11:45E0
    add  $0B                        ; 11:45E1
    ld   [hl],a                     ; 11:45E3
    ret                             ; 11:45E4

Data1145E5:                         ; 11:45E5
.db $9A,$62,$44,$08,$F4,$00
Data1145EB:                         ; 11:45EB
.db $9A,$68,$44,$08,$F4,$00
Data1145F1:                         ; 11:45F1
.db $9A,$6E,$44,$08,$F4,$00
DataPtrs1145F7:                     ; 11:45F7
.dw Data1145E5, Data1145EB, Data1145F1

Sub1145FD:
    ld   a,[$C16B]                  ; 11:45FD
    sla  a                          ; 11:4600
    ld   e,a                        ; 11:4602
    ld   d,$00                      ; 11:4603
    ld   hl,DataPtrs1145F7          ; 11:4605
    add  hl,de                      ; 11:4608
    ld   c,[hl]                     ; 11:4609
    inc  hl                         ; 11:460A
    ld   b,[hl]                     ; 11:460B
    ld   l,c                        ; 11:460C
    ld   h,b                        ; 11:460D
    ld   e,$00                      ; 11:460E
    push hl                         ; 11:4610
    ld   hl,$DF00                   ; 11:4611
    ld   c,[hl]                     ; 11:4614
    ld   b,$00                      ; 11:4615
    pop  hl                         ; 11:4617
Code114618:
    ldi  a,[hl]                     ; 11:4618
    push hl                         ; 11:4619
    ld   hl,W_TilemapUploadBuffer   ; 11:461A
    add  hl,bc                      ; 11:461D
    ld   [hl],a                     ; 11:461E
    pop  hl                         ; 11:461F
    inc  e                          ; 11:4620
    inc  c                          ; 11:4621
    ld   a,e                        ; 11:4622
    cp   $06                        ; 11:4623
    jr   nz,Code114618              ; 11:4625
    ld   hl,$DF00                   ; 11:4627
    ld   a,[hl]                     ; 11:462A
    add  $05                        ; 11:462B
    ld   [hl],a                     ; 11:462D
    ret                             ; 11:462E

Sub11462F:
    ld   hl,SRAMENABLE              ; 11:462F
    ld   [hl],$0A                   ; 11:4632
    ld   a,[$C16B]                  ; 11:4634
    call Sub000FF6                  ; 11:4637
    jr   nc,Code114641              ; 11:463A
    call Sub114682                  ; 11:463C
    jr   Code114644                 ; 11:463F
Code114641:
    call Sub11464E                  ; 11:4641
Code114644:
    ld   hl,SRAMENABLE              ; 11:4644
    ld   [hl],$FF                   ; 11:4647
    ret                             ; 11:4649

Data11464A:                         ; 11:464A
.db $E7,$DE,$F0,$F4

Sub11464E:
    ld   a,[$C16B]                  ; 11:464E
    sla  a                          ; 11:4651
    ld   c,a                        ; 11:4653
    sla  a                          ; 11:4654
    add  c                          ; 11:4656
    add  $62                        ; 11:4657
    ld   c,a                        ; 11:4659
    ld   hl,$DF00                   ; 11:465A
    ld   e,[hl]                     ; 11:465D
    inc  e                          ; 11:465E
    ld   d,$00                      ; 11:465F
    add  hl,de                      ; 11:4661
    ld   [hl],$9A                   ; 11:4662
    inc  hl                         ; 11:4664
    ld   [hl],c                     ; 11:4665
    inc  hl                         ; 11:4666
    ld   [hl],$04                   ; 11:4667
    inc  hl                         ; 11:4669
    ld   de,Data11464A              ; 11:466A
    ld   b,$04                      ; 11:466D
Code11466F:
    ld   a,$08                      ; 11:466F
    ldi  [hl],a                     ; 11:4671
    ld   a,[de]                     ; 11:4672
    ldi  [hl],a                     ; 11:4673
    inc  de                         ; 11:4674
    dec  b                          ; 11:4675
    jr   nz,Code11466F              ; 11:4676
    ld   [hl],$00                   ; 11:4678
    ld   hl,$DF00                   ; 11:467A
    ld   a,[hl]                     ; 11:467D
    add  $0B                        ; 11:467E
    ld   [hl],a                     ; 11:4680
    ret                             ; 11:4681

Sub114682:
    ld   a,[$C16B]                  ; 11:4682
    sla  a                          ; 11:4685
    sla  a                          ; 11:4687
    swap a                          ; 11:4689
    ld   e,a                        ; 11:468B
    ld   d,$00                      ; 11:468C
    ld   hl,$A101                   ; 11:468E
    add  hl,de                      ; 11:4691
    ld   a,[hl]                     ; 11:4692
    and  a                          ; 11:4693
    jr   nz,Code11469A              ; 11:4694
    ld   b,$F8                      ; 11:4696
    jr   Code11469C                 ; 11:4698
Code11469A:
    ld   b,$CD                      ; 11:469A
Code11469C:
    ld   hl,$A100                   ; 11:469C
    add  hl,de                      ; 11:469F
    ld   a,[hl]                     ; 11:46A0
    srl  a                          ; 11:46A1
    srl  a                          ; 11:46A3
    add  $D1                        ; 11:46A5
    ld   d,a                        ; 11:46A7
    ld   a,[hl]                     ; 11:46A8
    and  $03                        ; 11:46A9
    add  $D1                        ; 11:46AB
    ld   e,a                        ; 11:46AD
    ld   a,[$C16B]                  ; 11:46AE
    sla  a                          ; 11:46B1
    ld   c,a                        ; 11:46B3
    sla  a                          ; 11:46B4
    add  c                          ; 11:46B6
    add  $62                        ; 11:46B7
    ld   c,a                        ; 11:46B9
    push de                         ; 11:46BA
    ld   hl,$DF00                   ; 11:46BB
    ld   e,[hl]                     ; 11:46BE
    inc  e                          ; 11:46BF
    ld   d,$00                      ; 11:46C0
    add  hl,de                      ; 11:46C2
    pop  de                         ; 11:46C3
    ld   a,$08                      ; 11:46C4
    ld   [hl],$9A                   ; 11:46C6
    inc  hl                         ; 11:46C8
    ld   [hl],c                     ; 11:46C9
    inc  hl                         ; 11:46CA
    ld   [hl],$04                   ; 11:46CB
    inc  hl                         ; 11:46CD
    ldi  [hl],a                     ; 11:46CE
    ld   [hl],$F0                   ; 11:46CF
    inc  hl                         ; 11:46D1
    ldi  [hl],a                     ; 11:46D2
    ld   [hl],d                     ; 11:46D3
    inc  hl                         ; 11:46D4
    ldi  [hl],a                     ; 11:46D5
    ld   [hl],b                     ; 11:46D6
    inc  hl                         ; 11:46D7
    ldi  [hl],a                     ; 11:46D8
    ld   [hl],e                     ; 11:46D9
    inc  hl                         ; 11:46DA
    ld   [hl],$00                   ; 11:46DB
    ld   hl,$DF00                   ; 11:46DD
    ld   a,[hl]                     ; 11:46E0
    add  $0B                        ; 11:46E1
    ld   [hl],a                     ; 11:46E3
    ret                             ; 11:46E4

Data1146E5:                         ; 11:46E5
.db $98,$01,$4F,$08,$F4
Data1146EA:                         ; 11:46EA
.db $98,$27,$04,$08,$DC,$08,$E8,$08,\
    $E9,$08,$F2,$98,$47,$05,$08,$DC,\
    $08,$E5,$08,$DE,$08,$DA,$08,$EB
Data114702:                         ; 11:4702
.db $98,$26,$82,$08,$CA,$08,$F4,$00
Data11470A:                         ; 11:470A
.db $98,$26,$05,$08,$F4,$08,$DC,$08,\
    $E8,$08,$E9,$08,$F2,$98,$46,$46,\
    $08,$F4,$00
Data11471D:                         ; 11:471D
.db $98,$26,$45,$08,$F4,$98,$46,$06,\
    $08,$F4,$08,$DC,$08,$E5,$08,$DE,\
    $08,$DA,$08,$EB,$00
Data114732:                         ; 11:4732
.db $98,$01,$0F,$08,$DE,$08,$EB,$08,\
    $DA,$08,$EC,$08,$DE,$08,$F4,$08,\
    $DA,$08,$E5,$08,$E5,$08,$F4,$08,\
    $DD,$08,$DA,$08,$ED,$08,$DA,$08,\
    $CC
Data114753:                         ; 11:4753
.db $98,$26,$05,$08,$CA,$08,$E7,$08,\
    $E8,$08,$F4,$08,$F4,$98,$46,$06,\
    $08,$F4,$08,$F2,$08,$DE,$08,$EC,\
    $08,$F4,$08,$F4,$00

Code114770:
    ldh  a,[<H_GameSubstate]        ; 11:4770
    rst  $00                        ; 11:4772  Execute from 16-bit pointer table
.dw Code114B2C                      ; 11:4773
.dw Code11478C                      ; 11:4775
.dw Code11485E                      ; 11:4777
.dw Code1148CC                      ; 11:4779
.dw Code1148FC                      ; 11:477B
.dw Code11497A                      ; 11:477D
.dw Code11485E                      ; 11:477F
.dw Code1149D3                      ; 11:4781
.dw Code114A27                      ; 11:4783
.dw Code114B3F                      ; 11:4785
.dw Code114A7F                      ; 11:4787

Data114789:                         ; 11:4789
.db $04,$02,$01

Code11478C:
    ldh  a,[<H_ButtonsHeld]         ; 11:478C
    and  $04                        ; 11:478E
    jr   z,Code1147AA               ; 11:4790
    ldh  a,[<H_ButtonsPressed]      ; 11:4792
    and  $01                        ; 11:4794
    jr   z,Code1147AA               ; 11:4796
    ld   a,$44                      ; 11:4798
    ldh  [<$FFF2],a                 ; 11:479A
    ld   a,$08                      ; 11:479C
    ld   [$C171],a                  ; 11:479E
    xor  a                          ; 11:47A1
    ld   [$C1B6],a                  ; 11:47A2
    ld   a,$08                      ; 11:47A5
    ldh  [<H_GameSubstate],a        ; 11:47A7
    ret                             ; 11:47A9

Code1147AA:
    call Sub114A92                  ; 11:47AA
    ldh  a,[<H_ButtonsPressed]      ; 11:47AD
    and  $01                        ; 11:47AF
    jp   z,Code11484B               ; 11:47B1
    ld   a,[$C16B]                  ; 11:47B4
    push af                         ; 11:47B7
    ld   hl,SRAMENABLE              ; 11:47B8
    ld   [hl],$0A                   ; 11:47BB
    xor  a                          ; 11:47BD
    ld   [$C16B],a                  ; 11:47BE
    ld   [$C35A],a                  ; 11:47C1
Code1147C4:
    ld   a,[$C16B]                  ; 11:47C4
    call Sub000FF6                  ; 11:47C7
    ld   a,[$C35A]                  ; 11:47CA
    rl   a                          ; 11:47CD
    ld   [$C35A],a                  ; 11:47CF
    ld   a,[$C16B]                  ; 11:47D2
    inc  a                          ; 11:47D5
    ld   [$C16B],a                  ; 11:47D6
    cp   $03                        ; 11:47D9
    jr   c,Code1147C4               ; 11:47DB
    ld   hl,SRAMENABLE              ; 11:47DD
    ld   [hl],$FF                   ; 11:47E0
    pop  af                         ; 11:47E2
    ld   [$C16B],a                  ; 11:47E3
    ld   a,[$C35A]                  ; 11:47E6
    and  $07                        ; 11:47E9
    jr   nz,Code1147F2              ; 11:47EB
    ld   a,$30                      ; 11:47ED
    ldh  [<$FFF3],a                 ; 11:47EF
    ret                             ; 11:47F1

Code1147F2:
    ld   a,$44                      ; 11:47F2
    ldh  [<$FFF2],a                 ; 11:47F4
    ld   a,$B0                      ; 11:47F6
    ldh  [<H_PlayerYLow],a          ; 11:47F8
    ld   a,[$C16B]                  ; 11:47FA
    ld   e,a                        ; 11:47FD
    ld   d,$00                      ; 11:47FE
    ld   hl,Data114789              ; 11:4800
    add  hl,de                      ; 11:4803
    ld   c,[hl]                     ; 11:4804
    ld   a,[$C35A]                  ; 11:4805
    and  c                          ; 11:4808
    jr   nz,Code114824              ; 11:4809
    ld   e,$00                      ; 11:480B
    ld   b,$03                      ; 11:480D
Code11480F:
    ld   hl,Data114789              ; 11:480F
    add  hl,de                      ; 11:4812
    ld   c,[hl]                     ; 11:4813
    ld   a,[$C35A]                  ; 11:4814
    and  c                          ; 11:4817
    jr   nz,Code114820              ; 11:4818
    dec  b                          ; 11:481A
    jr   z,Code114820               ; 11:481B
    inc  e                          ; 11:481D
    jr   Code11480F                 ; 11:481E
Code114820:
    ld   a,e                        ; 11:4820
    ld   [$C16B],a                  ; 11:4821
Code114824:
    ld   a,[$C16B]                  ; 11:4824
    ld   e,a                        ; 11:4827
    ld   d,$00                      ; 11:4828
    ld   hl,FileSelect_PlayerXPos   ; 11:482A
    add  hl,de                      ; 11:482D
    ld   a,[hl]                     ; 11:482E
    ldh  [<H_PlayerXLow],a          ; 11:482F
    ld   a,[$C1B5]                  ; 11:4831
    and  a                          ; 11:4834
    jr   nz,Code114841              ; 11:4835
    ld   a,$05                      ; 11:4837
    ld   [$C171],a                  ; 11:4839
    ld   a,$02                      ; 11:483C
    ldh  [<H_GameSubstate],a        ; 11:483E
    ret                             ; 11:4840

Code114841:
    ld   a,$06                      ; 11:4841
    ld   [$C171],a                  ; 11:4843
    ld   a,$06                      ; 11:4846
    ldh  [<H_GameSubstate],a        ; 11:4848
    ret                             ; 11:484A

Code11484B:
    ldh  a,[<H_ButtonsPressed]      ; 11:484B
    and  $0A                        ; 11:484D
    jr   z,Return11485D             ; 11:484F
    ld   a,$31                      ; 11:4851
    ldh  [<$FFF3],a                 ; 11:4853
    ld   a,$B0                      ; 11:4855
    ldh  [<H_PlayerYLow],a          ; 11:4857
    ld   a,$09                      ; 11:4859
    ldh  [<H_GameSubstate],a        ; 11:485B
Return11485D:
    ret                             ; 11:485D

Code11485E:
    call Sub114AE8                  ; 11:485E
    ldh  a,[<H_ButtonsPressed]      ; 11:4861
    and  $01                        ; 11:4863
    jr   z,Code1148A2               ; 11:4865
    ld   a,[$C1B5]                  ; 11:4867
    and  a                          ; 11:486A
    jr   nz,Code114887              ; 11:486B
    ld   a,$11                      ; 11:486D
    rst  $10                        ; 11:486F  24-bit call
.dl SubL_075485                     ; 11:4870
    call Sub11462F                  ; 11:4873
    call Sub1145FD                  ; 11:4876
    ld   hl,$DF02                   ; 11:4879
    ld   a,[hl]                     ; 11:487C
    sub  $20                        ; 11:487D
    ld   [hl],a                     ; 11:487F
    ld   a,$10                      ; 11:4880
    ld   [$C326],a                  ; 11:4882
    jr   Code114890                 ; 11:4885
Code114887:
    ld   a,$07                      ; 11:4887
    ld   [$C171],a                  ; 11:4889
    xor  a                          ; 11:488C
    ld   [$C1B6],a                  ; 11:488D
Code114890:
    ld   a,$44                      ; 11:4890
    ldh  [<$FFF2],a                 ; 11:4892
    ld   a,$A0                      ; 11:4894
    ldh  [<H_PlayerYLow],a          ; 11:4896
    ld   a,$04                      ; 11:4898
    ld   [$C1C2],a                  ; 11:489A
    ld   hl,H_GameSubstate          ; 11:489D
    inc  [hl]                       ; 11:48A0
    ret                             ; 11:48A1

Code1148A2:
    ldh  a,[<H_ButtonsPressed]      ; 11:48A2
    and  $02                        ; 11:48A4
    ret  z                          ; 11:48A6
    ld   a,$63                      ; 11:48A7
    ldh  [<$FFF2],a                 ; 11:48A9
    ld   de,W_TilemapUploadBuffer   ; 11:48AB
    ld   hl,Data1146EA              ; 11:48AE
    ld   bc,$0020                   ; 11:48B1
    call CopyBytes                  ; 11:48B4
    ld   a,[$C1B5]                  ; 11:48B7
    and  a                          ; 11:48BA
    jr   z,Code1148C7               ; 11:48BB
    ld   hl,$DF1D                   ; 11:48BD
    ld   [hl],$F4                   ; 11:48C0
    ld   hl,$DF1F                   ; 11:48C2
    ld   [hl],$CA                   ; 11:48C5
Code1148C7:
    ld   a,$01                      ; 11:48C7
    ldh  [<H_GameSubstate],a        ; 11:48C9
    ret                             ; 11:48CB

Code1148CC:
    ld   a,[$C326]                  ; 11:48CC
    dec  a                          ; 11:48CF
    ld   [$C326],a                  ; 11:48D0
    ret  nz                         ; 11:48D3
    ld   a,[$C16B]                  ; 11:48D4
    ld   [$C359],a                  ; 11:48D7
    inc  a                          ; 11:48DA
    cp   $03                        ; 11:48DB
    jr   c,Code1148E1               ; 11:48DD
    ld   a,$00                      ; 11:48DF
Code1148E1:
    ld   [$C16B],a                  ; 11:48E1
    ld   e,a                        ; 11:48E4
    ld   d,$00                      ; 11:48E5
    ld   hl,FileSelect_PlayerXPos   ; 11:48E7
    add  hl,de                      ; 11:48EA
    ld   a,[hl]                     ; 11:48EB
    ldh  [<H_PlayerXLow],a          ; 11:48EC
    ld   a,$00                      ; 11:48EE
    ld   [$C1C2],a                  ; 11:48F0
    ld   a,$B0                      ; 11:48F3
    ldh  [<H_PlayerYLow],a          ; 11:48F5
    ld   hl,H_GameSubstate          ; 11:48F7
    inc  [hl]                       ; 11:48FA
    ret                             ; 11:48FB

Code1148FC:
    ldh  a,[<H_ButtonsPressed]      ; 11:48FC
    and  $30                        ; 11:48FE
    jr   z,Code11492B               ; 11:4900
    ld   a,$47                      ; 11:4902
    ldh  [<$FFF2],a                 ; 11:4904
    ld   a,[$C359]                  ; 11:4906
    ld   b,a                        ; 11:4909
    ld   a,[$C16B]                  ; 11:490A
    inc  a                          ; 11:490D
    cp   $03                        ; 11:490E
    jr   c,Code114914               ; 11:4910
    ld   a,$00                      ; 11:4912
Code114914:
    cp   b                          ; 11:4914
    jr   nz,Code114918              ; 11:4915
    inc  a                          ; 11:4917
Code114918:
    cp   $03                        ; 11:4918
    jr   c,Code11491E               ; 11:491A
    ld   a,$00                      ; 11:491C
Code11491E:
    ld   [$C16B],a                  ; 11:491E
    ld   e,a                        ; 11:4921
    ld   d,$00                      ; 11:4922
    ld   hl,FileSelect_PlayerXPos   ; 11:4924
    add  hl,de                      ; 11:4927
    ld   a,[hl]                     ; 11:4928
    ldh  [<H_PlayerXLow],a          ; 11:4929
Code11492B:
    ldh  a,[<H_ButtonsPressed]      ; 11:492B
    and  $03                        ; 11:492D
    ret  z                          ; 11:492F
    ldh  a,[<H_ButtonsPressed]      ; 11:4930
    and  $01                        ; 11:4932
    jr   z,Code114951               ; 11:4934
    ld   a,$44                      ; 11:4936
    ldh  [<$FFF2],a                 ; 11:4938
    ld   a,$07                      ; 11:493A
    ld   [$C171],a                  ; 11:493C
    ld   a,$A0                      ; 11:493F
    ldh  [<H_PlayerYLow],a          ; 11:4941
    ld   a,$04                      ; 11:4943
    ld   [$C1C2],a                  ; 11:4945
    xor  a                          ; 11:4948
    ld   [$C1B6],a                  ; 11:4949
    ld   hl,H_GameSubstate          ; 11:494C
    inc  [hl]                       ; 11:494F
    ret                             ; 11:4950

Code114951:
    ld   a,[$C359]                  ; 11:4951
    ld   [$C16B],a                  ; 11:4954
    call Sub11462F                  ; 11:4957
    call Sub1145FD                  ; 11:495A
    ld   hl,$DF0D                   ; 11:495D
    ld   a,[hl]                     ; 11:4960
    sub  $20                        ; 11:4961
    ld   [hl],a                     ; 11:4963
    ld   a,[$C16B]                  ; 11:4964
    ld   e,a                        ; 11:4967
    ld   d,$00                      ; 11:4968
    ld   hl,FileSelect_PlayerXPos   ; 11:496A
    add  hl,de                      ; 11:496D
    ld   a,[hl]                     ; 11:496E
    ldh  [<H_PlayerXLow],a          ; 11:496F
    ld   a,$63                      ; 11:4971
    ldh  [<$FFF2],a                 ; 11:4973
    ld   a,$02                      ; 11:4975
    ldh  [<H_GameSubstate],a        ; 11:4977
    ret                             ; 11:4979

Code11497A:
    call Sub114ABD                  ; 11:497A
    ldh  a,[<H_ButtonsPressed]      ; 11:497D
    and  $03                        ; 11:497F
    ret  z                          ; 11:4981
    ldh  a,[<H_ButtonsPressed]      ; 11:4982
    and  $01                        ; 11:4984
    jr   z,Code1149BC               ; 11:4986
    ld   a,[$C1B6]                  ; 11:4988
    and  a                          ; 11:498B
    jr   z,Code1149BC               ; 11:498C
    ld   a,$11                      ; 11:498E
    rst  $10                        ; 11:4990  24-bit call
.dl SubL_075584                     ; 11:4991
    call Sub11462F                  ; 11:4994
    ld   a,[$C16B]                  ; 11:4997
    push af                         ; 11:499A
    ld   a,[$C359]                  ; 11:499B
    ld   [$C16B],a                  ; 11:499E
    call Sub11462F                  ; 11:49A1
    call Sub1145FD                  ; 11:49A4
    ld   hl,$DF18                   ; 11:49A7
    ld   a,[hl]                     ; 11:49AA
    sub  $20                        ; 11:49AB
    ld   [hl],a                     ; 11:49AD
    pop  af                         ; 11:49AE
    ld   [$C16B],a                  ; 11:49AF
    ld   a,$24                      ; 11:49B2
    ldh  [<$FFF3],a                 ; 11:49B4
    ld   a,$09                      ; 11:49B6
    ldh  [<H_GameSubstate],a        ; 11:49B8
    jr   Code1149C9                 ; 11:49BA
Code1149BC:
    ld   a,$63                      ; 11:49BC
    ldh  [<$FFF2],a                 ; 11:49BE
    ld   a,$04                      ; 11:49C0
    ldh  [<H_GameSubstate],a        ; 11:49C2
    ld   a,$05                      ; 11:49C4
    ld   [$C171],a                  ; 11:49C6
Code1149C9:
    ld   a,$00                      ; 11:49C9
    ld   [$C1C2],a                  ; 11:49CB
    ld   a,$B0                      ; 11:49CE
    ldh  [<H_PlayerYLow],a          ; 11:49D0
    ret                             ; 11:49D2

Code1149D3:
    call Sub114ABD                  ; 11:49D3
    ldh  a,[<H_ButtonsPressed]      ; 11:49D6
    and  $03                        ; 11:49D8
    ret  z                          ; 11:49DA
    ldh  a,[<H_ButtonsPressed]      ; 11:49DB
    and  $01                        ; 11:49DD
    jr   z,Code114A10               ; 11:49DF
    ld   a,[$C1B6]                  ; 11:49E1
    and  a                          ; 11:49E4
    jr   z,Code114A10               ; 11:49E5
    ld   hl,SRAMENABLE              ; 11:49E7
    ld   [hl],$0A                   ; 11:49EA
    ld   a,[$C16B]                  ; 11:49EC
    sla  a                          ; 11:49EF
    sla  a                          ; 11:49F1
    swap a                          ; 11:49F3
    ld   c,a                        ; 11:49F5
    ld   b,$00                      ; 11:49F6
    ld   hl,$A118                   ; 11:49F8
    add  hl,bc                      ; 11:49FB
    ld   [hl],$00                   ; 11:49FC
    ld   hl,SRAMENABLE              ; 11:49FE
    ld   [hl],$FF                   ; 11:4A01
    call Sub11462F                  ; 11:4A03
    ld   a,$24                      ; 11:4A06
    ldh  [<$FFF3],a                 ; 11:4A08
    ld   a,$09                      ; 11:4A0A
    ldh  [<H_GameSubstate],a        ; 11:4A0C
    jr   Code114A1D                 ; 11:4A0E
Code114A10:
    ld   a,$63                      ; 11:4A10
    ldh  [<$FFF2],a                 ; 11:4A12
    ld   a,$06                      ; 11:4A14
    ldh  [<H_GameSubstate],a        ; 11:4A16
    ld   a,$06                      ; 11:4A18
    ld   [$C171],a                  ; 11:4A1A
Code114A1D:
    ld   a,$00                      ; 11:4A1D
    ld   [$C1C2],a                  ; 11:4A1F
    ld   a,$B0                      ; 11:4A22
    ldh  [<H_PlayerYLow],a          ; 11:4A24
    ret                             ; 11:4A26

Code114A27:
    call Sub114ABD                  ; 11:4A27
    ldh  a,[<H_ButtonsPressed]      ; 11:4A2A
    and  $03                        ; 11:4A2C
    ret  z                          ; 11:4A2E
    ldh  a,[<H_ButtonsPressed]      ; 11:4A2F
    and  $01                        ; 11:4A31
    jr   z,Code114A5A               ; 11:4A33
    ld   a,[$C1B6]                  ; 11:4A35
    and  a                          ; 11:4A38
    jr   z,Code114A5A               ; 11:4A39
    ld   a,$11                      ; 11:4A3B
    rst  $10                        ; 11:4A3D  24-bit call
.dl SubL_07539C                     ; 11:4A3E
    ld   a,$11                      ; 11:4A41
    rst  $10                        ; 11:4A43  24-bit call
.dl SubL_0B75A6                     ; 11:4A44
    ld   a,$FF                      ; 11:4A47
    ld   [$DE68],a                  ; 11:4A49
    ld   a,$24                      ; 11:4A4C
    ldh  [<$FFF3],a                 ; 11:4A4E
    ld   a,$20                      ; 11:4A50
    ld   [$C326],a                  ; 11:4A52
    ld   a,$0A                      ; 11:4A55
    ldh  [<H_GameSubstate],a        ; 11:4A57
    ret                             ; 11:4A59

Code114A5A:
    ld   a,$63                      ; 11:4A5A
    ldh  [<$FFF2],a                 ; 11:4A5C
    ld   de,W_TilemapUploadBuffer   ; 11:4A5E
    ld   hl,Data1146E5              ; 11:4A61
    ld   bc,$0025                   ; 11:4A64
    call CopyBytes                  ; 11:4A67
    ld   a,[$C1B5]                  ; 11:4A6A
    and  a                          ; 11:4A6D
    jr   z,Code114A7A               ; 11:4A6E
    ld   hl,$DF22                   ; 11:4A70
    ld   [hl],$F4                   ; 11:4A73
    ld   hl,$DF24                   ; 11:4A75
    ld   [hl],$CA                   ; 11:4A78
Code114A7A:
    ld   a,$01                      ; 11:4A7A
    ldh  [<H_GameSubstate],a        ; 11:4A7C
    ret                             ; 11:4A7E

Code114A7F:
    ld   a,[$C326]                  ; 11:4A7F
    dec  a                          ; 11:4A82
    ld   [$C326],a                  ; 11:4A83
    ret  nz                         ; 11:4A86
    ld   a,$FF                      ; 11:4A87
    ld   [$DE68],a                  ; 11:4A89
    ld   a,$01                      ; 11:4A8C
    ld   [$C1B1],a                  ; 11:4A8E
    ret                             ; 11:4A91

Sub114A92:
    ldh  a,[<H_ButtonsPressed]      ; 11:4A92
    and  $C0                        ; 11:4A94
    jr   z,Return114ABC             ; 11:4A96
    ld   a,$47                      ; 11:4A98
    ldh  [<$FFF2],a                 ; 11:4A9A
    ld   de,W_TilemapUploadBuffer   ; 11:4A9C
    ld   hl,Data114702              ; 11:4A9F
    ld   bc,$0008                   ; 11:4AA2
    call CopyBytes                  ; 11:4AA5
    ld   a,[$C1B5]                  ; 11:4AA8
    xor  $01                        ; 11:4AAB
    ld   [$C1B5],a                  ; 11:4AAD
    jr   z,Return114ABC             ; 11:4AB0
    ld   hl,$DF05                   ; 11:4AB2
    ld   [hl],$F4                   ; 11:4AB5
    ld   hl,$DF07                   ; 11:4AB7
    ld   [hl],$CA                   ; 11:4ABA
Return114ABC:
    ret                             ; 11:4ABC

Sub114ABD:
    ldh  a,[<H_ButtonsPressed]      ; 11:4ABD
    and  $C0                        ; 11:4ABF
    jr   z,Return114AE7             ; 11:4AC1
    ld   a,$47                      ; 11:4AC3
    ldh  [<$FFF2],a                 ; 11:4AC5
    ld   de,W_TilemapUploadBuffer   ; 11:4AC7
    ld   hl,Data114702              ; 11:4ACA
    ld   bc,$0008                   ; 11:4ACD
    call CopyBytes                  ; 11:4AD0
    ld   a,[$C1B6]                  ; 11:4AD3
    xor  $01                        ; 11:4AD6
    ld   [$C1B6],a                  ; 11:4AD8
    jr   z,Return114AE7             ; 11:4ADB
    ld   hl,$DF05                   ; 11:4ADD
    ld   [hl],$F4                   ; 11:4AE0
    ld   hl,$DF07                   ; 11:4AE2
    ld   [hl],$CA                   ; 11:4AE5
Return114AE7:
    ret                             ; 11:4AE7

Sub114AE8:
    ldh  a,[<H_ButtonsPressed]      ; 11:4AE8
    and  $30                        ; 11:4AEA
    ret  z                          ; 11:4AEC
    ld   a,$47                      ; 11:4AED
    ldh  [<$FFF2],a                 ; 11:4AEF
Code114AF1:
    ldh  a,[<H_ButtonsPressed]      ; 11:4AF1
    and  $20                        ; 11:4AF3
    jr   nz,Code114B03              ; 11:4AF5
    ld   a,[$C16B]                  ; 11:4AF7
    inc  a                          ; 11:4AFA
    cp   $03                        ; 11:4AFB
    jr   c,Code114B0D               ; 11:4AFD
    ld   a,$00                      ; 11:4AFF
    jr   Code114B0D                 ; 11:4B01
Code114B03:
    ld   a,[$C16B]                  ; 11:4B03
    dec  a                          ; 11:4B06
    bit  7,a                        ; 11:4B07
    jr   z,Code114B0D               ; 11:4B09
    ld   a,$02                      ; 11:4B0B
Code114B0D:
    ld   [$C16B],a                  ; 11:4B0D
    ld   e,a                        ; 11:4B10
    ld   d,$00                      ; 11:4B11
    ld   hl,Data114789              ; 11:4B13
    add  hl,de                      ; 11:4B16
    ld   c,[hl]                     ; 11:4B17
    ld   a,[$C35A]                  ; 11:4B18
    and  c                          ; 11:4B1B
    jr   z,Code114AF1               ; 11:4B1C
    ld   a,[$C16B]                  ; 11:4B1E
    ld   e,a                        ; 11:4B21
    ld   d,$00                      ; 11:4B22
    ld   hl,FileSelect_PlayerXPos   ; 11:4B24
    add  hl,de                      ; 11:4B27
    ld   a,[hl]                     ; 11:4B28
    ldh  [<H_PlayerXLow],a          ; 11:4B29
    ret                             ; 11:4B2B

Code114B2C:
    ldh  a,[<H_CameraY]             ; 11:4B2C
    add  $02                        ; 11:4B2E
    ldh  [<H_CameraY],a             ; 11:4B30
    cp   $90                        ; 11:4B32
    jr   c,Return114B3E             ; 11:4B34
    xor  a                          ; 11:4B36
    ld   [$C1B5],a                  ; 11:4B37
    ld   hl,H_GameSubstate          ; 11:4B3A
    inc  [hl]                       ; 11:4B3D
Return114B3E:
    ret                             ; 11:4B3E

Code114B3F:
    ldh  a,[<H_CameraY]             ; 11:4B3F
    sub  $02                        ; 11:4B41
    ldh  [<H_CameraY],a             ; 11:4B43
    cp   $71                        ; 11:4B45
    jr   nc,Return114B5F            ; 11:4B47
    ld   de,W_TilemapUploadBuffer   ; 11:4B49
    ld   hl,Data1146EA              ; 11:4B4C
    ld   bc,$0020                   ; 11:4B4F
    call CopyBytes                  ; 11:4B52
    xor  a                          ; 11:4B55
    ld   [$C1B5],a                  ; 11:4B56
    ld   [$C1B6],a                  ; 11:4B59
    ld   [$C168],a                  ; 11:4B5C
Return114B5F:
    ret                             ; 11:4B5F

Sub114B60:
    ld   a,$01                      ; 11:4B60
    ldh  [<SB],a                    ; 11:4B62
    call Sub00126D                  ; 11:4B64
    ld   a,$00                      ; 11:4B67
    ldh  [<IE],a                    ; 11:4B69
    ld   a,:Gr_MainMenu_FileSelect  ; 11:4B6B
    ld   b,$11                      ; 11:4B6D
    call LoadGraphicsBank           ; 11:4B6F
    ld   a,:Pal_MainMenu            ; 11:4B72
    ld   b,$11                      ; 11:4B74
    ld   de,Pal_MainMenu            ; 11:4B76
    call LoadFullPaletteLong        ; 11:4B79
    call Sub00128D                  ; 11:4B7C
    ld   a,:Ti_MainMenu             ; 11:4B7F
    ld   b,$11                      ; 11:4B81
    ld   de,$99C0                   ; 11:4B83
    ld   hl,Ti_MainMenu             ; 11:4B86
    call LoadScreenTilemapVRAM      ; 11:4B89
    ld   a,$00                      ; 11:4B8C
    and  a                          ; 11:4B8E
    jr   z,Code114B96               ; 11:4B8F
    ld   a,$03                      ; 11:4B91
    ld   [$C192],a                  ; 11:4B93
Code114B96:
    ld   a,[$C192]                  ; 11:4B96
    bit  0,a                        ; 11:4B99
    jr   z,Code114BA3               ; 11:4B9B
    ld   hl,Data114C99              ; 11:4B9D
    call Sub114C39                  ; 11:4BA0
Code114BA3:
    ld   a,[$C192]                  ; 11:4BA3
    bit  1,a                        ; 11:4BA6
    jr   z,Code114BB0               ; 11:4BA8
    ld   hl,Data114C9D              ; 11:4BAA
    call Sub114C39                  ; 11:4BAD
Code114BB0:
    ld   a,[$C192]                  ; 11:4BB0
    and  a                          ; 11:4BB3
    jr   z,Code114BBB               ; 11:4BB4
    ld   a,$11                      ; 11:4BB6
    call Sub001480                  ; 11:4BB8
Code114BBB:
    xor  a                          ; 11:4BBB
    ld   [$C410],a                  ; 11:4BBC
    ld   [$C0C4],a                  ; 11:4BBF
    ld   [$C28E],a                  ; 11:4BC2
    ld   [W_SPFlag],a               ; 11:4BC5
    ld   [W_ChallengeFlag],a        ; 11:4BC8
    ld   [$C1B4],a                  ; 11:4BCB
    ld   [W_SublevelID],a           ; 11:4BCE
    ld   [$C174],a                  ; 11:4BD1
    ld   [W_LevelID],a              ; 11:4BD4
    ld   [$C362],a                  ; 11:4BD7
    ld   [$C168],a                  ; 11:4BDA
    ldh  [<H_GameSubstate],a        ; 11:4BDD
    ld   [$C16B],a                  ; 11:4BDF
    ld   [$C1B7],a                  ; 11:4BE2
    ld   [$C1A9],a                  ; 11:4BE5
    ld   [$C1AA],a                  ; 11:4BE8
    ld   [$C1AB],a                  ; 11:4BEB
    ld   [$C1AC],a                  ; 11:4BEE
    ld   [$C197],a                  ; 11:4BF1
    ld   [$C198],a                  ; 11:4BF4
    ld   [$C19C],a                  ; 11:4BF7
    ld   [$C19D],a                  ; 11:4BFA
    ld   [$C1A7],a                  ; 11:4BFD
    ld   [$C35C],a                  ; 11:4C00
    ld   [$C36B],a                  ; 11:4C03
    ld   [$C1B0],a                  ; 11:4C06
    ldh  [<H_CameraXLow],a          ; 11:4C09
    ldh  [<H_CameraXHigh],a         ; 11:4C0B
    ldh  [<$FFBB],a                 ; 11:4C0D
    ld   a,$70                      ; 11:4C0F
    ldh  [<H_CameraY],a             ; 11:4C11
    ld   a,$0A                      ; 11:4C13
    ld   [$C356],a                  ; 11:4C15
    ld   a,$10                      ; 11:4C18
    ld   [$C164],a                  ; 11:4C1A
    ld   a,$FF                      ; 11:4C1D
    ld   [$DE68],a                  ; 11:4C1F
    ld   a,$00                      ; 11:4C22
    ld   [$C0C1],a                  ; 11:4C24
    ld   a,$09                      ; 11:4C27
    ldh  [<IE],a                    ; 11:4C29
    ld   a,$87                      ; 11:4C2B
    ldh  [<LCDC],a                  ; 11:4C2D
    ld   hl,H_GameState             ; 11:4C2F
    inc  [hl]                       ; 11:4C32
    ld   a,$01                      ; 11:4C33
    ld   [$DA6E],a                  ; 11:4C35
    ret                             ; 11:4C38

Sub114C39:
    ldi  a,[hl]                     ; 11:4C39
    ldh  [<$FF98],a                 ; 11:4C3A
    ld   b,[hl]                     ; 11:4C3C
    inc  hl                         ; 11:4C3D
    ld   d,[hl]                     ; 11:4C3E
    inc  hl                         ; 11:4C3F
    ld   e,[hl]                     ; 11:4C40
    push de                         ; 11:4C41
    ld   hl,$DF00                   ; 11:4C42
    ld   e,[hl]                     ; 11:4C45
    inc  e                          ; 11:4C46
    ld   d,$00                      ; 11:4C47
    add  hl,de                      ; 11:4C49
    pop  de                         ; 11:4C4A
    ld   a,$03                      ; 11:4C4B
    ldh  [<$FF99],a                 ; 11:4C4D
Code114C4F:
    ld   [hl],d                     ; 11:4C4F
    inc  hl                         ; 11:4C50
    ld   [hl],e                     ; 11:4C51
    inc  hl                         ; 11:4C52
    ld   [hl],$03                   ; 11:4C53
    inc  hl                         ; 11:4C55
    ld   c,$03                      ; 11:4C56
Code114C58:
    ldh  a,[<$FF98]                 ; 11:4C58
    ldi  [hl],a                     ; 11:4C5A
    ld   [hl],b                     ; 11:4C5B
    inc  hl                         ; 11:4C5C
    ldh  a,[<$FF98]                 ; 11:4C5D
    and  $F0                        ; 11:4C5F
    jr   nz,Code114C66              ; 11:4C61
    inc  b                          ; 11:4C63
    jr   Code114C67                 ; 11:4C64
Code114C66:
    dec  b                          ; 11:4C66
Code114C67:
    dec  c                          ; 11:4C67
    jr   nz,Code114C58              ; 11:4C68
    ld   a,e                        ; 11:4C6A
    add  $20                        ; 11:4C6B
    ld   e,a                        ; 11:4C6D
    ld   a,d                        ; 11:4C6E
    adc  $00                        ; 11:4C6F
    ld   d,a                        ; 11:4C71
    ld   a,b                        ; 11:4C72
    add  $0D                        ; 11:4C73
    ld   b,a                        ; 11:4C75
    ldh  a,[<$FF98]                 ; 11:4C76
    and  $F0                        ; 11:4C78
    swap a                          ; 11:4C7A
    sla  a                          ; 11:4C7C
    add  b                          ; 11:4C7E
    ld   b,a                        ; 11:4C7F
    ldh  a,[<$FF98]                 ; 11:4C80
    and  $F0                        ; 11:4C82
    swap a                          ; 11:4C84
    add  b                          ; 11:4C86
    ld   b,a                        ; 11:4C87
    ldh  a,[<$FF99]                 ; 11:4C88
    dec  a                          ; 11:4C8A
    ldh  [<$FF99],a                 ; 11:4C8B
    jr   nz,Code114C4F              ; 11:4C8D
    ld   [hl],$00                   ; 11:4C8F
    ld   hl,$DF00                   ; 11:4C91
    ld   a,[hl]                     ; 11:4C94
    add  $1B                        ; 11:4C95
    ld   [hl],a                     ; 11:4C97
    ret                             ; 11:4C98

Data114C99:                         ; 11:4C99
.db $21,$CF,$9A,$C3
Data114C9D:                         ; 11:4C9D
.db $02,$CA,$9A,$CE
Data114CA1:                         ; 11:4CA1
.db $9A,$C3,$43,$00,$82,$9A,$E3,$43,\
    $00,$82,$9B,$03,$43,$00,$82,$00
Data114CB1:                         ; 11:4CB1
.db $20,$30,$40
Data114CB4:                         ; 11:4CB4
.db $20,$50,$80
Data114CB7:                         ; 11:4CB7
.db $11,$6A

Sub114CB9:
    ld   a,[$C164]                  ; 11:4CB9
    cp   $00                        ; 11:4CBC
    jr   z,Code114CCB               ; 11:4CBE
    dec  a                          ; 11:4CC0
    ld   [$C164],a                  ; 11:4CC1
    jr   nz,Code114CCB              ; 11:4CC4
    ld   a,$7D                      ; 11:4CC6
    ld   [$DE68],a                  ; 11:4CC8
Code114CCB:
    ld   a,[$C168]                  ; 11:4CCB
    rst  $00                        ; 11:4CCE  Execute from 16-bit pointer table
.dw Code114CD3                      ; 11:4CCF
.dw Code114F32                      ; 11:4CD1
Code114CD3:
    call Sub1150C0                  ; 11:4CD3
    ld   a,[W_GameMode]             ; 11:4CD6
    cp   $07                        ; 11:4CD9
    jr   z,Code114CEF               ; 11:4CDB
    cp   $04                        ; 11:4CDD
    jr   nc,Code114CEA              ; 11:4CDF
    cp   $03                        ; 11:4CE1
    jr   z,Code114CEF               ; 11:4CE3
    call Sub114DCC                  ; 11:4CE5
    jr   Code114CF2                 ; 11:4CE8
Code114CEA:
    call Sub114E3E                  ; 11:4CEA
    jr   Code114CF2                 ; 11:4CED
Code114CEF:
    call Sub114ECF                  ; 11:4CEF
Code114CF2:
    ld   a,[W_GameMode]             ; 11:4CF2
    cp   $02                        ; 11:4CF5
    jp   nz,Code114D07              ; 11:4CF7
    ldh  a,[<H_ButtonsPressed]      ; 11:4CFA
    and  $01                        ; 11:4CFC
    jr   z,Code114D07               ; 11:4CFE
    ld   a,$11                      ; 11:4D00
    rst  $10                        ; 11:4D02  24-bit call
.dl SubL_064CD3                     ; 11:4D03
    ret                             ; 11:4D06

Code114D07:
    ldh  a,[<H_ButtonsPressed]      ; 11:4D07
    and  $03                        ; 11:4D09
    ret  z                          ; 11:4D0B
    ld   a,$01                      ; 11:4D0C
    ldh  [<SB],a                    ; 11:4D0E
    ld   a,$00                      ; 11:4D10
    ldh  [<SC],a                    ; 11:4D12
    ld   a,$00                      ; 11:4D14
    ld   [$DA6E],a                  ; 11:4D16
    ldh  a,[<H_ButtonsPressed]      ; 11:4D19
    and  $01                        ; 11:4D1B
    jr   nz,Code114D28              ; 11:4D1D
    ld   a,$63                      ; 11:4D1F
    ldh  [<$FFF2],a                 ; 11:4D21
    ld   a,$02                      ; 11:4D23
    ldh  [<H_GameState],a           ; 11:4D25
    ret                             ; 11:4D27

Code114D28:
    ld   a,[W_GameMode]             ; 11:4D28
    cp   $07                        ; 11:4D2B
    jr   z,Code114D98               ; 11:4D2D
    cp   $06                        ; 11:4D2F
    jp   z,Code114DBA               ; 11:4D31
    cp   $05                        ; 11:4D34
    jr   z,Code114DAC               ; 11:4D36
    cp   $04                        ; 11:4D38
    jr   z,Code114DA2               ; 11:4D3A
    cp   $03                        ; 11:4D3C
    jr   z,Code114D7B               ; 11:4D3E
    cp   $01                        ; 11:4D40
    jr   z,Code114D4E               ; 11:4D42
    ld   a,$11                      ; 11:4D44
    rst  $10                        ; 11:4D46  24-bit call
.dl SubL_064CEB                     ; 11:4D47
    ld   a,$16                      ; 11:4D4A
    jr   Code114D74                 ; 11:4D4C
Code114D4E:
    ld   a,$11                      ; 11:4D4E
    rst  $10                        ; 11:4D50  24-bit call
.dl SubL_0756D9                     ; 11:4D51
    ld   a,[W_ChalTotalScoreLow]    ; 11:4D54
    ld   [$C1A4],a                  ; 11:4D57
    ld   a,[W_ChalTotalScoreMid]    ; 11:4D5A
    ld   [$C1A5],a                  ; 11:4D5D
    ld   a,[W_ChalTotalScoreHigh]   ; 11:4D60
    ld   [$C1A6],a                  ; 11:4D63
    xor  a                          ; 11:4D66
    ld   [$C35C],a                  ; 11:4D67
    ld   [$C195],a                  ; 11:4D6A
    ld   a,$01                      ; 11:4D6D
    ld   [W_ChallengeFlag],a        ; 11:4D6F
    ld   a,$1D                      ; 11:4D72
Code114D74:
    ldh  [<H_GameState],a           ; 11:4D74
    ld   a,$44                      ; 11:4D76
    ldh  [<$FFF2],a                 ; 11:4D78
    ret                             ; 11:4D7A

Code114D7B:
    ld   a,$25                      ; 11:4D7B
    ldh  [<$FFF3],a                 ; 11:4D7D
    xor  a                          ; 11:4D7F
    ld   [W_HardFlag],a             ; 11:4D80
    ld   [W_ChallengeFlag],a        ; 11:4D83
    ld   [$C168],a                  ; 11:4D86
    inc  a                          ; 11:4D89
    ld   [W_SPFlag],a               ; 11:4D8A
    ld   a,$03                      ; 11:4D8D
    ld   [$C16B],a                  ; 11:4D8F
    ld   a,$38                      ; 11:4D92
    ldh  [<H_GameSubstate],a        ; 11:4D94
    jr   Code114DC2                 ; 11:4D96
Code114D98:
    ld   a,$73                      ; 11:4D98
    ldh  [<$FFF2],a                 ; 11:4D9A
    ld   a,$33                      ; 11:4D9C
    ldh  [<H_GameSubstate],a        ; 11:4D9E
    jr   Code114DC2                 ; 11:4DA0
Code114DA2:
    ld   a,$6E                      ; 11:4DA2
    ldh  [<$FFF2],a                 ; 11:4DA4
    ld   a,$2B                      ; 11:4DA6
    ldh  [<H_GameSubstate],a        ; 11:4DA8
    jr   Code114DC2                 ; 11:4DAA
Code114DAC:
    xor  a                          ; 11:4DAC
    ld   [$C413],a                  ; 11:4DAD
    ld   a,$46                      ; 11:4DB0
    ldh  [<$FFF4],a                 ; 11:4DB2
    ld   a,$2C                      ; 11:4DB4
    ldh  [<H_GameSubstate],a        ; 11:4DB6
    jr   Code114DC2                 ; 11:4DB8
Code114DBA:
    ld   a,$6F                      ; 11:4DBA
    ldh  [<$FFF2],a                 ; 11:4DBC
    ld   a,$2D                      ; 11:4DBE
    ldh  [<H_GameSubstate],a        ; 11:4DC0
Code114DC2:
    ld   a,$3F                      ; 11:4DC2
    ld   [$C326],a                  ; 11:4DC4
    ld   hl,$C168                   ; 11:4DC7
    inc  [hl]                       ; 11:4DCA
    ret                             ; 11:4DCB

Sub114DCC:
    ld   a,[W_GameMode]             ; 11:4DCC
    ld   b,a                        ; 11:4DCF
    ld   a,$0F                      ; 11:4DD0
    add  b                          ; 11:4DD2
    ld   [$C171],a                  ; 11:4DD3
    ld   a,[W_GameMode]             ; 11:4DD6
    ld   c,a                        ; 11:4DD9
    ld   b,$00                      ; 11:4DDA
    ld   hl,Data114CB1              ; 11:4DDC
    add  hl,bc                      ; 11:4DDF
    ld   a,[hl]                     ; 11:4DE0
    ld   hl,$C000                   ; 11:4DE1
    ldi  [hl],a                     ; 11:4DE4
    ld   [hl],$11                   ; 11:4DE5
    inc  hl                         ; 11:4DE7
    ld   [hl],$08                   ; 11:4DE8
    inc  hl                         ; 11:4DEA
    ld   [hl],$03                   ; 11:4DEB
    inc  hl                         ; 11:4DED
    ldi  [hl],a                     ; 11:4DEE
    ld   [hl],$19                   ; 11:4DEF
    inc  hl                         ; 11:4DF1
    ld   [hl],$0A                   ; 11:4DF2
    inc  hl                         ; 11:4DF4
    ld   [hl],$03                   ; 11:4DF5
    ldh  a,[<H_ButtonsPressed]      ; 11:4DF7
    and  $C0                        ; 11:4DF9
    ret  z                          ; 11:4DFB
    ld   a,[W_GameMode]             ; 11:4DFC
    ld   b,a                        ; 11:4DFF
    ld   a,$0C                      ; 11:4E00
    add  b                          ; 11:4E02
    ld   [$C171],a                  ; 11:4E03
    ld   a,$47                      ; 11:4E06
    ldh  [<$FFF2],a                 ; 11:4E08
    ldh  a,[<H_ButtonsPressed]      ; 11:4E0A
    and  $80                        ; 11:4E0C
    jr   nz,Code114E1E              ; 11:4E0E
    ld   a,[W_GameMode]             ; 11:4E10
    dec  a                          ; 11:4E13
    and  $03                        ; 11:4E14
    cp   $03                        ; 11:4E16
    jr   nz,Code114E3A              ; 11:4E18
    ld   a,$04                      ; 11:4E1A
    jr   Code114E3A                 ; 11:4E1C
Code114E1E:
    ld   a,[W_GameMode]             ; 11:4E1E
    inc  a                          ; 11:4E21
    and  $03                        ; 11:4E22
    ld   [W_GameMode],a             ; 11:4E24
    cp   $03                        ; 11:4E27
    ret  nz                         ; 11:4E29
    ld   a,[$C192]                  ; 11:4E2A
    bit  0,a                        ; 11:4E2D
    ret  nz                         ; 11:4E2F
    bit  1,a                        ; 11:4E30
    jr   nz,Code114E38              ; 11:4E32
    ld   a,$04                      ; 11:4E34
    jr   Code114E3A                 ; 11:4E36
Code114E38:
    ld   a,$07                      ; 11:4E38
Code114E3A:
    ld   [W_GameMode],a             ; 11:4E3A
    ret                             ; 11:4E3D

Sub114E3E:
    ld   a,[W_GameMode]             ; 11:4E3E
    and  $03                        ; 11:4E41
    ld   c,a                        ; 11:4E43
    ld   b,$00                      ; 11:4E44
    ld   hl,Data114CB4              ; 11:4E46
    add  hl,bc                      ; 11:4E49
    ld   a,[hl]                     ; 11:4E4A
    ld   hl,$C000                   ; 11:4E4B
    ld   [hl],$6A                   ; 11:4E4E
    inc  hl                         ; 11:4E50
    ldi  [hl],a                     ; 11:4E51
    ld   [hl],$0C                   ; 11:4E52
    inc  hl                         ; 11:4E54
    ld   [hl],$03                   ; 11:4E55
    inc  hl                         ; 11:4E57
    ld   [hl],$6A                   ; 11:4E58
    inc  hl                         ; 11:4E5A
    add  $08                        ; 11:4E5B
    ldi  [hl],a                     ; 11:4E5D
    ld   [hl],$0E                   ; 11:4E5E
    inc  hl                         ; 11:4E60
    ld   [hl],$03                   ; 11:4E61
    ldh  a,[<H_ButtonsPressed]      ; 11:4E63
    ld   c,a                        ; 11:4E65
    ld   b,$04                      ; 11:4E66
Code114E68:
    rlc  c                          ; 11:4E68
    jr   c,Code114E70               ; 11:4E6A
    dec  b                          ; 11:4E6C
    jr   nz,Code114E68              ; 11:4E6D
    ret                             ; 11:4E6F

Code114E70:
    ld   a,$47                      ; 11:4E70
    ldh  [<$FFF2],a                 ; 11:4E72
    ld   a,b                        ; 11:4E74
    cp   $04                        ; 11:4E75
    jr   z,Code114E99               ; 11:4E77
    cp   $03                        ; 11:4E79
    jr   z,Code114E9D               ; 11:4E7B
    cp   $02                        ; 11:4E7D
    jr   z,Code114E8D               ; 11:4E7F
    ld   a,[W_GameMode]             ; 11:4E81
    inc  a                          ; 11:4E84
    cp   $07                        ; 11:4E85
    jr   nz,Code114ECB              ; 11:4E87
    ld   a,$04                      ; 11:4E89
    jr   Code114ECB                 ; 11:4E8B
Code114E8D:
    ld   a,[W_GameMode]             ; 11:4E8D
    dec  a                          ; 11:4E90
    cp   $03                        ; 11:4E91
    jr   nz,Code114ECB              ; 11:4E93
    ld   a,$06                      ; 11:4E95
    jr   Code114ECB                 ; 11:4E97
Code114E99:
    ld   a,$00                      ; 11:4E99
    jr   Code114ECB                 ; 11:4E9B
Code114E9D:
    ld   a,[$C192]                  ; 11:4E9D
    and  a                          ; 11:4EA0
    jr   nz,Code114EA7              ; 11:4EA1
    ld   a,$02                      ; 11:4EA3
    jr   Code114ECB                 ; 11:4EA5
Code114EA7:
    ld   a,[W_GameMode]             ; 11:4EA7
    and  $02                        ; 11:4EAA
    sla  a                          ; 11:4EAC
    or   $03                        ; 11:4EAE
    ld   [W_GameMode],a             ; 11:4EB0
    cp   $03                        ; 11:4EB3
    jr   nz,Code114EC1              ; 11:4EB5
    ld   a,[$C192]                  ; 11:4EB7
    bit  0,a                        ; 11:4EBA
    ret  nz                         ; 11:4EBC
    ld   a,$07                      ; 11:4EBD
    jr   Code114ECB                 ; 11:4EBF
Code114EC1:
    ld   a,[$C192]                  ; 11:4EC1
    bit  1,a                        ; 11:4EC4
    ret  nz                         ; 11:4EC6
    ld   a,$03                      ; 11:4EC7
    jr   Code114ECB                 ; 11:4EC9
Code114ECB:
    ld   [W_GameMode],a             ; 11:4ECB
    ret                             ; 11:4ECE

Sub114ECF:
    ld   a,[W_GameMode]             ; 11:4ECF
    and  $04                        ; 11:4ED2
    srl  a                          ; 11:4ED4
    srl  a                          ; 11:4ED6
    ld   c,a                        ; 11:4ED8
    ld   b,$00                      ; 11:4ED9
    ld   hl,Data114CB7              ; 11:4EDB
    add  hl,bc                      ; 11:4EDE
    ld   a,[hl]                     ; 11:4EDF
    ld   hl,$C000                   ; 11:4EE0
    ld   [hl],$55                   ; 11:4EE3
    inc  hl                         ; 11:4EE5
    ldi  [hl],a                     ; 11:4EE6
    ld   [hl],$08                   ; 11:4EE7
    inc  hl                         ; 11:4EE9
    ld   [hl],$03                   ; 11:4EEA
    inc  hl                         ; 11:4EEC
    ld   [hl],$55                   ; 11:4EED
    inc  hl                         ; 11:4EEF
    add  $08                        ; 11:4EF0
    ldi  [hl],a                     ; 11:4EF2
    ld   [hl],$0A                   ; 11:4EF3
    inc  hl                         ; 11:4EF5
    ld   [hl],$03                   ; 11:4EF6
    ldh  a,[<H_ButtonsPressed]      ; 11:4EF8
    ld   c,a                        ; 11:4EFA
    ld   b,$04                      ; 11:4EFB
Code114EFD:
    rlc  c                          ; 11:4EFD
    jr   c,Code114F05               ; 11:4EFF
    dec  b                          ; 11:4F01
    jr   nz,Code114EFD              ; 11:4F02
    ret                             ; 11:4F04

Code114F05:
    ld   a,b                        ; 11:4F05
    cp   $04                        ; 11:4F06
    jr   z,Code114F1F               ; 11:4F08
    cp   $03                        ; 11:4F0A
    jr   z,Code114F1B               ; 11:4F0C
    ld   a,[$C192]                  ; 11:4F0E
    cp   $03                        ; 11:4F11
    ret  nz                         ; 11:4F13
    ld   a,[W_GameMode]             ; 11:4F14
    xor  $04                        ; 11:4F17
    jr   Code114F2A                 ; 11:4F19
Code114F1B:
    ld   a,$02                      ; 11:4F1B
    jr   Code114F2A                 ; 11:4F1D
Code114F1F:
    ld   a,[W_GameMode]             ; 11:4F1F
    bit  2,a                        ; 11:4F22
    jr   nz,Code114F29              ; 11:4F24
    inc  a                          ; 11:4F26
    jr   Code114F2A                 ; 11:4F27
Code114F29:
    dec  a                          ; 11:4F29
Code114F2A:
    ld   [W_GameMode],a             ; 11:4F2A
    ld   a,$47                      ; 11:4F2D
    ldh  [<$FFF2],a                 ; 11:4F2F
    ret                             ; 11:4F31

Code114F32:
    ld   a,[W_GameMode]             ; 11:4F32
    cp   $06                        ; 11:4F35
    jp   z,Code114FD6               ; 11:4F37
    cp   $05                        ; 11:4F3A
    jp   z,Code114FB9               ; 11:4F3C
    cp   $04                        ; 11:4F3F
    jr   z,Code114F8C               ; 11:4F41
    ld   a,[$C326]                  ; 11:4F43
    and  $03                        ; 11:4F46
    jr   nz,Code114F87              ; 11:4F48
    ld   a,[$C326]                  ; 11:4F4A
    bit  2,a                        ; 11:4F4D
    jr   nz,Code114F65              ; 11:4F4F
    ld   a,[W_GameMode]             ; 11:4F51
    cp   $03                        ; 11:4F54
    jr   nz,Code114F5D              ; 11:4F56
    ld   hl,Data114C99              ; 11:4F58
    jr   Code114F60                 ; 11:4F5B
Code114F5D:
    ld   hl,Data114C9D              ; 11:4F5D
Code114F60:
    call Sub114C39                  ; 11:4F60
    jr   Code114F87                 ; 11:4F63
Code114F65:
    ld   hl,Data114CA1              ; 11:4F65
    ld   de,W_TilemapUploadBuffer   ; 11:4F68
    ld   bc,$0010                   ; 11:4F6B
    call CopyBytes                  ; 11:4F6E
    ld   a,[W_GameMode]             ; 11:4F71
    cp   $03                        ; 11:4F74
    jr   z,Code114F87               ; 11:4F76
    ld   hl,$DF02                   ; 11:4F78
    ld   [hl],$CE                   ; 11:4F7B
    ld   hl,$DF07                   ; 11:4F7D
    ld   [hl],$EE                   ; 11:4F80
    ld   hl,$DF0C                   ; 11:4F82
    ld   [hl],$0E                   ; 11:4F85
Code114F87:
    call Sub1150C0                  ; 11:4F87
    jr   Code114FFF                 ; 11:4F8A
Code114F8C:
    ld   a,[$C326]                  ; 11:4F8C
    and  $18                        ; 11:4F8F
    srl  a                          ; 11:4F91
    srl  a                          ; 11:4F93
    ld   c,a                        ; 11:4F95
    ld   b,$00                      ; 11:4F96
    ld   hl,Data115054              ; 11:4F98
    add  hl,bc                      ; 11:4F9B
    ld   e,[hl]                     ; 11:4F9C
    inc  hl                         ; 11:4F9D
    ld   d,[hl]                     ; 11:4F9E
    ld   hl,$C010                   ; 11:4F9F
    call Sub1150DC                  ; 11:4FA2
    ld   de,Data11505C              ; 11:4FA5
    ld   hl,$C028                   ; 11:4FA8
    call Sub1150DC                  ; 11:4FAB
    ld   de,Data11508E              ; 11:4FAE
    ld   hl,$C040                   ; 11:4FB1
    call Sub1150DC                  ; 11:4FB4
    jr   Code114FFF                 ; 11:4FB7
Code114FB9:
    ld   de,Data115075              ; 11:4FB9
    ld   hl,$C028                   ; 11:4FBC
    call Sub1150DC                  ; 11:4FBF
    ld   de,Data115010              ; 11:4FC2
    ld   hl,$C010                   ; 11:4FC5
    call Sub1150DC                  ; 11:4FC8
    ld   de,Data11508E              ; 11:4FCB
    ld   hl,$C040                   ; 11:4FCE
    call Sub1150DC                  ; 11:4FD1
    jr   Code114FFF                 ; 11:4FD4
Code114FD6:
    ld   a,[$C326]                  ; 11:4FD6
    and  $F0                        ; 11:4FD9
    cp   $20                        ; 11:4FDB
    jr   nz,Code114FE4              ; 11:4FDD
    ld   de,Data11508E              ; 11:4FDF
    jr   Code114FE7                 ; 11:4FE2
Code114FE4:
    ld   de,Data1150A7              ; 11:4FE4
Code114FE7:
    ld   hl,$C040                   ; 11:4FE7
    call Sub1150DC                  ; 11:4FEA
    ld   de,Data115010              ; 11:4FED
    ld   hl,$C010                   ; 11:4FF0
    call Sub1150DC                  ; 11:4FF3
    ld   de,Data11505C              ; 11:4FF6
    ld   hl,$C028                   ; 11:4FF9
    call Sub1150DC                  ; 11:4FFC
Code114FFF:
    ld   a,[$C326]                  ; 11:4FFF
    dec  a                          ; 11:5002
    ld   [$C326],a                  ; 11:5003
    jr   nz,Return11500F            ; 11:5006
    ldh  a,[<H_GameSubstate]        ; 11:5008
    ldh  [<H_GameState],a           ; 11:500A
    xor  a                          ; 11:500C
    ldh  [<H_GameSubstate],a        ; 11:500D
Return11500F:
    ret                             ; 11:500F

Data115010:                         ; 11:5010
.db $79,$1C,$10,$00,$79,$24,$12,$00,\
    $79,$2C,$10,$20,$89,$1C,$14,$00,\
    $89,$24,$16,$00,$89,$2C,$14,$20,\
    $FF,$79,$20,$18,$00,$79,$28,$1A,\
    $00,$89,$20,$1C,$00,$89,$28,$1E,\
    $00,$FF,$79,$24,$20,$00,$89,$24,\
    $22,$00,$FF,$79,$20,$1A,$20,$79,\
    $28,$18,$20,$89,$20,$1E,$20,$89,\
    $28,$1C,$20,$FF
Data115054:                         ; 11:5054
.db $43,$50,$3A,$50,$29,$50,$10,$50
Data11505C:                         ; 11:505C
.db $77,$4D,$40,$01,$77,$55,$42,$01,\
    $77,$5D,$44,$01,$87,$4D,$46,$01,\
    $87,$55,$48,$01,$87,$5D,$4A,$01,\
    $FF
Data115075:                         ; 11:5075
.db $77,$4E,$50,$01,$77,$56,$52,$01,\
    $77,$5E,$54,$01,$87,$4E,$56,$01,\
    $87,$56,$58,$01,$87,$5E,$5A,$01,\
    $FF
Data11508E:                         ; 11:508E
.db $78,$7D,$60,$02,$78,$85,$62,$02,\
    $78,$8D,$60,$22,$88,$7D,$64,$02,\
    $88,$85,$66,$02,$88,$8D,$64,$22,\
    $FF
Data1150A7:                         ; 11:50A7
.db $78,$7D,$70,$02,$78,$85,$72,$02,\
    $78,$8D,$70,$22,$88,$7D,$74,$02,\
    $88,$85,$76,$02,$88,$8D,$74,$22,\
    $FF

Sub1150C0:
    ld   de,Data115010              ; 11:50C0
    ld   hl,$C010                   ; 11:50C3
    call Sub1150DC                  ; 11:50C6
    ld   de,Data11505C              ; 11:50C9
    ld   hl,$C028                   ; 11:50CC
    call Sub1150DC                  ; 11:50CF
    ld   de,Data11508E              ; 11:50D2
    ld   hl,$C040                   ; 11:50D5
    call Sub1150DC                  ; 11:50D8
    ret                             ; 11:50DB

Sub1150DC:
    ld   a,[de]                     ; 11:50DC
    cp   $FF                        ; 11:50DD
    ret  z                          ; 11:50DF
    ldi  [hl],a                     ; 11:50E0
    inc  de                         ; 11:50E1
    jr   Sub1150DC                  ; 11:50E2

Data1150E4:                         ; 11:50E4
.db $9A,$03,$0E,$00,$13,$00,$14,$00,\
    $15,$00,$16,$00,$17,$00,$18,$00,\
    $19,$00,$1A,$00,$1B,$00,$1C,$00,\
    $69,$00,$20,$20,$70,$00,$70,$9A,\
    $23,$0E,$00,$23,$00,$24,$00,$25,\
    $00,$26,$00,$27,$00,$28,$00,$29,\
    $00,$2A,$00,$2B,$00,$2C,$00,$65,\
    $00,$66,$00,$67,$00,$68,$00
Data115123:                         ; 11:5123
.db $9A,$03,$0E,$06,$84,$06,$85,$06,\
    $86,$06,$87,$06,$88,$06,$89,$06,\
    $8A,$06,$8B,$06,$8C,$06,$8D,$00,\
    $59,$00,$20,$20,$70,$00,$70,$9A,\
    $23,$0E,$06,$94,$06,$95,$06,$96,\
    $06,$97,$06,$98,$06,$99,$06,$9A,\
    $06,$9B,$06,$9C,$06,$9D,$06,$55,\
    $06,$56,$06,$57,$06,$58,$00
Data115162:                         ; 11:5162
.db $9A,$43,$0E,$00,$1D,$00,$1E,$00,\
    $1F,$00,$30,$00,$31,$00,$32,$00,\
    $33,$00,$34,$00,$35,$00,$36,$00,\
    $37,$00,$38,$00,$39,$00,$3A,$9A,\
    $63,$0E,$00,$2D,$00,$2E,$00,$2F,\
    $00,$40,$00,$41,$00,$42,$00,$43,\
    $00,$44,$00,$45,$00,$46,$00,$47,\
    $00,$48,$00,$49,$00,$4A,$00
Data1151A1:                         ; 11:51A1
.db $9A,$43,$0E,$06,$A0,$06,$A1,$06,\
    $A2,$06,$A3,$06,$A4,$06,$A5,$06,\
    $A6,$06,$A7,$06,$A8,$06,$A9,$06,\
    $AA,$06,$AB,$06,$AC,$06,$AD,$9A,\
    $63,$0E,$06,$B0,$06,$B1,$06,$B2,\
    $06,$B3,$06,$B4,$06,$B5,$06,$B6,\
    $06,$B7,$06,$B8,$06,$B9,$06,$BA,\
    $06,$BB,$06,$BC,$06,$BD,$00
Data1151E0:                         ; 11:51E0
.db $9A,$85,$0A,$00,$3B,$00,$3C,$00,\
    $3D,$00,$3E,$00,$3F,$00,$50,$00,\
    $51,$00,$52,$00,$53,$00,$54,$9A,\
    $A5,$0A,$00,$4B,$00,$4C,$00,$4D,\
    $00,$4E,$00,$4F,$00,$60,$00,$61,\
    $00,$62,$00,$63,$00,$64,$00
Data11520F:                         ; 11:520F
.db $9A,$85,$0A,$06,$C0,$06,$C1,$06,\
    $C2,$06,$C3,$06,$C4,$06,$C5,$06,\
    $C6,$06,$C7,$06,$C8,$06,$C9,$9A,\
    $A5,$0A,$06,$D0,$06,$D1,$06,$D2,\
    $06,$D3,$06,$D4,$06,$D5,$06,$D6,\
    $06,$D7,$06,$D8,$06,$D9,$00
Data11523E:                         ; 11:523E
.db $6E,$62,$6C,$62,$6A,$62,$68,$62,\
    $66,$62,$64,$62,$62,$62,$60,$62,\
    $76,$22,$74,$22,$72,$22,$70,$22,\
    $76,$62,$74,$62,$72,$62,$70,$62,\
    $66,$23,$64,$23,$62,$23,$60,$23,\
    $6E,$23,$6C,$23,$6A,$23,$68,$23,\
    $0C,$43,$0E,$43,$0E,$63,$0C,$63,\
    $08,$43,$0A,$43,$0A,$63,$08,$63,\
    $60,$06,$62,$06,$64,$06,$66,$06,\
    $68,$06,$6A,$06,$6C,$06,$6E,$06,\
    $70,$06,$72,$06,$74,$06,$76,$06,\
    $70,$46,$72,$46,$74,$46,$76,$46,\
    $68,$45,$6A,$45,$6C,$45,$6E,$45,\
    $60,$45,$62,$45,$64,$45,$66,$45,\
    $08,$07,$0A,$07,$0A,$27,$08,$27,\
    $0C,$07,$0E,$07,$0E,$27,$0C,$27
Data1152BE:                         ; 11:52BE
.db $09,$19,$29,$39,$49,$59,$69,$79
Data1152C6:                         ; 11:52C6
.db $18,$38,$58,$78
BitTable8Asc_1152CA:                ; 11:52CA
.db $01,$02,$04,$08,$10,$20,$40,$80

Sub1152D2:
    call Sub00128D                  ; 11:52D2
    ld   a,:Gr_OW_ChalMenu          ; 11:52D5
    ld   b,$11                      ; 11:52D7
    call LoadGraphicsBank           ; 11:52D9
    ld   a,$00                      ; 11:52DC
    ld   [$C0C4],a                  ; 11:52DE
    ld   [W_SublevelID],a           ; 11:52E1
    ld   [W_LevelID],a              ; 11:52E4
    ld   [W_PlayerFireFlag],a       ; 11:52E7
    ld   [W_PlayerSize],a           ; 11:52EA
    ld   [$C28E],a                  ; 11:52ED
    ldh  [<H_GameSubstate],a        ; 11:52F0
    ld   [$C168],a                  ; 11:52F2
    ldh  [<H_CameraXHigh],a         ; 11:52F5
    ldh  [<$FFBB],a                 ; 11:52F7
    ld   a,$FC                      ; 11:52F9
    ldh  [<H_CameraXLow],a          ; 11:52FB
    ld   a,$6E                      ; 11:52FD
    ldh  [<H_CameraY],a             ; 11:52FF
    ld   a,$50                      ; 11:5301
    ld   [$C326],a                  ; 11:5303
    ld   a,$20                      ; 11:5306
    ld   [$C35E],a                  ; 11:5308
    ld   a,$01                      ; 11:530B
    ld   [$C35F],a                  ; 11:530D
    ld   a,$10                      ; 11:5310
    ld   [$C164],a                  ; 11:5312
    ld   a,$FF                      ; 11:5315
    ld   [$DE68],a                  ; 11:5317
    ld   a,[$C197]                  ; 11:531A
    and  $E0                        ; 11:531D
    jr   nz,Code11532B              ; 11:531F
    ld   a,[$C1A7]                  ; 11:5321
    and  a                          ; 11:5324
    jr   nz,Code11532B              ; 11:5325
    ld   a,$01                      ; 11:5327
    ldh  [<H_GameSubstate],a        ; 11:5329
Code11532B:
    ld   a,:Pal_ChalMenu            ; 11:532B
    ld   b,$11                      ; 11:532D
    ld   de,Pal_ChalMenu            ; 11:532F
    call LoadFullPaletteLong        ; 11:5332
    call Sub1158F2                  ; 11:5335
    ld   hl,$D30C                   ; 11:5338
    ld   b,$20                      ; 11:533B
Code11533D:
    ld   a,$00                      ; 11:533D
    ldi  [hl],a                     ; 11:533F
    dec  b                          ; 11:5340
    jr   nz,Code11533D              ; 11:5341
    ld   a,[$C35C]                  ; 11:5343
    ld   [W_SublevelID],a           ; 11:5346
    ld   [W_LevelID],a              ; 11:5349
    call CalcScoreBarPixels         ; 11:534C  b = score bar pixels to display
    ld   a,b                        ; 11:534F
    ld   [$C35D],a                  ; 11:5350
    cp   $00                        ; 11:5353
    jr   z,Code11535F               ; 11:5355
    call Sub11549A                  ; 11:5357
    ld   a,$11                      ; 11:535A
    call Sub001480                  ; 11:535C
Code11535F:
    call Sub11543C                  ; 11:535F
    ld   a,$11                      ; 11:5362
    call Sub001480                  ; 11:5364
    ld   a,[$C35D]                  ; 11:5367
    cp   $88                        ; 11:536A  88 pixels (1,160,000): full bar (blue threshold)
    jr   nc,@Blue                   ; 11:536C
    cp   $5B                        ; 11:536E  5B pixels (777,500): red threshold
    jr   nc,@Red                    ; 11:5370
    cp   $2E                        ; 11:5372  2E pixels (395,000): orange threshold
    ret  c                          ; 11:5374
    ld   de,Pal_ChalMenuOrangeBG    ; 11:5375
    call Sub1154E0                  ; 11:5378
    ret                             ; 11:537B
@Red:
    ld   de,Pal_ChalMenuRedBG       ; 11:537C
    call Sub1154E0                  ; 11:537F
    ret                             ; 11:5382
@Blue:
    ld   de,Pal_ChalMenuBlueBG      ; 11:5383
    call Sub1154E0                  ; 11:5386
    ld   hl,W_TilemapUploadBuffer   ; 11:5389
    ld   [hl],$9B                   ; 11:538C \ set VRAM upload: 9B F2 01 06 AF 00
    inc  hl                         ; 11:538E
    ld   [hl],$F2                   ; 11:538F
    inc  hl                         ; 11:5391
    ld   [hl],$01                   ; 11:5392
    inc  hl                         ; 11:5394
    ld   [hl],$06                   ; 11:5395
    inc  hl                         ; 11:5397
    ld   [hl],$AF                   ; 11:5398
    inc  hl                         ; 11:539A
    ld   [hl],$00                   ; 11:539B /
    ret                             ; 11:539D

Sub11539E:
    ld   a,[W_LevelID]              ; 11:539E
    ldh  [<$FFA5],a                 ; 11:53A1
    xor  a                          ; 11:53A3
    ld   [W_ChalTotalScoreLow],a    ; 11:53A4
    ld   [W_ChalTotalScoreMid],a    ; 11:53A7
    ld   [W_ChalTotalScoreHigh],a   ; 11:53AA
    ld   [$C198],a                  ; 11:53AD
    ld   [$C19C],a                  ; 11:53B0
    ld   [$C19D],a                  ; 11:53B3
    ldh  [<$FFA6],a                 ; 11:53B6
Code1153B8:
    ldh  a,[<$FFA6]                 ; 11:53B8
    ld   [W_LevelID],a              ; 11:53BA
    ld   a,$11                      ; 11:53BD
    rst  $10                        ; 11:53BF  24-bit call
.dl SubL_LoadChalLevelSaveData      ; 11:53C0
    ld   a,[$C18A]                  ; 11:53C3
    ld   b,a                        ; 11:53C6
    ld   a,[W_ChalTotalScoreLow]    ; 11:53C7
    add  b                          ; 11:53CA
    ld   [W_ChalTotalScoreLow],a    ; 11:53CB
    ld   a,[$C18B]                  ; 11:53CE
    ld   b,a                        ; 11:53D1
    ld   a,[W_ChalTotalScoreMid]    ; 11:53D2
    adc  b                          ; 11:53D5
    ld   [W_ChalTotalScoreMid],a    ; 11:53D6
    ld   a,[$C18C]                  ; 11:53D9
    ld   b,a                        ; 11:53DC
    ld   a,[W_ChalTotalScoreHigh]   ; 11:53DD
    adc  b                          ; 11:53E0
    ld   [W_ChalTotalScoreHigh],a   ; 11:53E1
    ld   a,[$C18D]                  ; 11:53E4
    ld   b,a                        ; 11:53E7
    ld   a,[$C19C]                  ; 11:53E8
    add  b                          ; 11:53EB
    ld   [$C19C],a                  ; 11:53EC
    ld   a,[$C194]                  ; 11:53EF
    ld   b,a                        ; 11:53F2
    ld   a,[$C19D]                  ; 11:53F3
    add  b                          ; 11:53F6
    ld   [$C19D],a                  ; 11:53F7
    ld   a,[$C189]                  ; 11:53FA
    cp   $05                        ; 11:53FD
    jr   c,Code115405               ; 11:53FF
    ld   hl,$C198                   ; 11:5401
    inc  [hl]                       ; 11:5404
Code115405:
    ldh  a,[<$FFA6]                 ; 11:5405
    inc  a                          ; 11:5407
    ldh  [<$FFA6],a                 ; 11:5408
    cp   $20                        ; 11:540A
    jr   c,Code1153B8               ; 11:540C
    ldh  a,[<$FFA5]                 ; 11:540E
    ld   [W_LevelID],a              ; 11:5410
    ld   a,[W_ChalTotalScoreHigh]   ; 11:5413
    cp   $0F                        ; 11:5416
    jr   c,Return11543B             ; 11:5418
    jr   nz,Code11542C              ; 11:541A
    ld   a,[W_ChalTotalScoreMid]    ; 11:541C
    cp   $42                        ; 11:541F
    jr   c,Return11543B             ; 11:5421
    jr   nz,Code11542C              ; 11:5423
    ld   a,[W_ChalTotalScoreLow]    ; 11:5425
    cp   $3F                        ; 11:5428
    jr   c,Return11543B             ; 11:542A
Code11542C:
    ld   a,$3F                      ; 11:542C
    ld   [W_ChalTotalScoreLow],a    ; 11:542E
    ld   a,$42                      ; 11:5431
    ld   [W_ChalTotalScoreMid],a    ; 11:5433
    ld   a,$0F                      ; 11:5436
    ld   [W_ChalTotalScoreHigh],a   ; 11:5438
Return11543B:
    ret                             ; 11:543B

Sub11543C:
    ld   de,$C1A4                   ; 11:543C
    call Sub003DFB                  ; 11:543F
    ld   hl,W_TilemapUploadBuffer   ; 11:5442
    ld   [hl],$9B                   ; 11:5445
    inc  hl                         ; 11:5447
    ld   [hl],$CC                   ; 11:5448
    inc  hl                         ; 11:544A
    ld   [hl],$07                   ; 11:544B
    inc  hl                         ; 11:544D
    ld   de,$C34F                   ; 11:544E
    ld   b,$06                      ; 11:5451
Code115453:
    xor  a                          ; 11:5453
    ldi  [hl],a                     ; 11:5454
    ld   a,[de]                     ; 11:5455
    ldi  [hl],a                     ; 11:5456
    inc  de                         ; 11:5457
    dec  b                          ; 11:5458
    jr   nz,Code115453              ; 11:5459
    ld   [hl],$00                   ; 11:545B
    inc  hl                         ; 11:545D
    ld   [hl],$D0                   ; 11:545E
    inc  hl                         ; 11:5460
    ld   [hl],$00                   ; 11:5461
    ret                             ; 11:5463

CalcScoreBarPixels:
; subroutine: Calculate pixels of score bar to display (capped at 0x88 pixels -> 0x11 tiles, but can 8-bit overflow). Return value in register B.
; The first 8 pixels are worth 9000 points each (0x384 internally)
; Each remaining pixel is worth 8500 points (0x352 internally)
    ld   hl,$C1A4                   ; 11:5464 \
    ld   e,[hl]                     ; 11:5467 |
    inc  hl                         ; 11:5468 |
    ld   d,[hl]                     ; 11:5469 |
    inc  hl                         ; 11:546A |
    ld   c,[hl]                     ; 11:546B / cde = challenge mode total score, displayed
    ld   b,$00                      ; 11:546C
@LoopSub9000:                       ;         \ subtract 0x384 (9000 displayed) from total score, up to 8 times
    ld   a,e                        ; 11:546E
    sub  $84                        ; 11:546F
    ld   e,a                        ; 11:5471
    ld   a,d                        ; 11:5472
    sbc  $03                        ; 11:5473
    ld   d,a                        ; 11:5475
    ld   a,c                        ; 11:5476
    sbc  $00                        ; 11:5477
    ld   c,a                        ; 11:5479
    jr   c,@Break                   ; 11:547A
    inc  b                          ; 11:547C
    ld   a,b                        ; 11:547D
    cp   $08                        ; 11:547E
    jr   c,@LoopSub9000             ; 11:5480 /
@LoopSub8500:                       ;         \ subtract 0x352 (8500 displayed) from total score
    ld   a,e                        ; 11:5482
    sub  $52                        ; 11:5483
    ld   e,a                        ; 11:5485
    ld   a,d                        ; 11:5486
    sbc  $03                        ; 11:5487
    ld   d,a                        ; 11:5489
    ld   a,c                        ; 11:548A
    sbc  $00                        ; 11:548B
    ld   c,a                        ; 11:548D
    jr   c,@Break                   ; 11:548E
    inc  b                          ; 11:5490
    jr   @LoopSub8500               ; 11:5491 /
@Break:
    ld   a,b                        ; 11:5493
    cp   $88                        ; 11:5494  if pixels > 88, cap to 88
    ret  c                          ; 11:5496  (no overflow checking, so if pixels > FF, loops back to an empty bar)
    ld   b,$88                      ; 11:5497
    ret                             ; 11:5499

Sub11549A:
    and  $07                        ; 11:549A
    ldh  [<$FF97],a                 ; 11:549C
    add  b                          ; 11:549E
    srl  b                          ; 11:549F
    srl  b                          ; 11:54A1
    srl  b                          ; 11:54A3
    ld   a,b                        ; 11:54A5
    cp   $11                        ; 11:54A6
    jr   c,Code1154AF               ; 11:54A8
    ld   b,$11                      ; 11:54AA
    xor  a                          ; 11:54AC
    ldh  [<$FF97],a                 ; 11:54AD
Code1154AF:
    ld   hl,W_TilemapUploadBuffer   ; 11:54AF
    ld   [hl],$9B                   ; 11:54B2
    inc  hl                         ; 11:54B4
    ld   [hl],$E1                   ; 11:54B5
    inc  hl                         ; 11:54B7
    ldh  a,[<$FF97]                 ; 11:54B8
    and  a                          ; 11:54BA
    jr   z,Code1154C1               ; 11:54BB
    ld   a,$01                      ; 11:54BD
    jr   Code1154C2                 ; 11:54BF
Code1154C1:
    xor  a                          ; 11:54C1
Code1154C2:
    add  b                          ; 11:54C2
    ldi  [hl],a                     ; 11:54C3
Code1154C4:
    ld   a,b                        ; 11:54C4
    and  a                          ; 11:54C5
    jr   z,Code1154D1               ; 11:54C6
    ld   [hl],$01                   ; 11:54C8
    inc  hl                         ; 11:54CA
    ld   [hl],$AB                   ; 11:54CB
    inc  hl                         ; 11:54CD
    dec  b                          ; 11:54CE
    jr   Code1154C4                 ; 11:54CF
Code1154D1:
    ldh  a,[<$FF97]                 ; 11:54D1
    cp   $00                        ; 11:54D3
    jr   z,Code1154DD               ; 11:54D5
    add  $A3                        ; 11:54D7
    ld   [hl],$01                   ; 11:54D9
    inc  hl                         ; 11:54DB
    ldi  [hl],a                     ; 11:54DC
Code1154DD:
    ld   [hl],$00                   ; 11:54DD
    ret                             ; 11:54DF

Sub1154E0:
    ld   hl,$DF8A                   ; 11:54E0
    ld   b,$04                      ; 11:54E3
Code1154E5:
    ld   a,[de]                     ; 11:54E5
    ldi  [hl],a                     ; 11:54E6
    inc  de                         ; 11:54E7
    dec  b                          ; 11:54E8
    jr   nz,Code1154E5              ; 11:54E9
    ld   a,$01                      ; 11:54EB
    ldh  [<$FFC0],a                 ; 11:54ED
    ret                             ; 11:54EF

ChalMenu_Main:
; Game state 1E
    ldh  a,[<H_GameSubstate]        ; 11:54F0
    rst  $00                        ; 11:54F2  Execute from 16-bit pointer table
.dw Code1154F7                      ; 11:54F3
.dw Code11583B                      ; 11:54F5

Code1154F7:
; Challenge menu substate 0
    ld   a,[$C168]                  ; 11:54F7
    rst  $00                        ; 11:54FA  Execute from 16-bit pointer table
.dw Code116D48                      ; 11:54FB
.dw Code115523                      ; 11:54FD
.dw Code116D48                      ; 11:54FF
.dw Code11566E                      ; 11:5501
.dw Code116D48                      ; 11:5503
.dw Code1156C9                      ; 11:5505
.dw Code116D48                      ; 11:5507
.dw Code115576                      ; 11:5509
.dw Code116D48                      ; 11:550B
.dw Code11566E                      ; 11:550D
.dw Code116D48                      ; 11:550F
.dw Code1155C9                      ; 11:5511
.dw Code116D48                      ; 11:5513
.dw Code11566E                      ; 11:5515
.dw Code116D48                      ; 11:5517
.dw Code115616                      ; 11:5519
.dw Code1156DB                      ; 11:551B
.dw Code116D48                      ; 11:551D
.dw Code11576F                      ; 11:551F
.dw Code115813                      ; 11:5521

Code115523:
    ld   a,[$C197]                  ; 11:5523
    bit  7,a                        ; 11:5526
    jr   z,Code115570               ; 11:5528
    ld   a,[$C197]                  ; 11:552A
    res  7,a                        ; 11:552D
    ld   [$C197],a                  ; 11:552F
    ld   b,$06                      ; 11:5532
    ld   c,$72                      ; 11:5534
    call Sub115627                  ; 11:5536
    ld   a,[$C198]                  ; 11:5539
    cp   $20                        ; 11:553C
    jr   nc,Code115549              ; 11:553E
    ld   a,[$C168]                  ; 11:5540
    add  $03                        ; 11:5543
    ld   [$C168],a                  ; 11:5545
    ret                             ; 11:5548

Code115549:
    ld   a,[$C42A]                  ; 11:5549
    or   $10                        ; 11:554C
    ld   [$C42A],a                  ; 11:554E
    ld   a,$40                      ; 11:5551
    ld   [$C1AD],a                  ; 11:5553
    ld   a,$34                      ; 11:5556
    ld   [$C1AE],a                  ; 11:5558
    ld   hl,$DFB4                   ; 11:555B
    ld   c,[hl]                     ; 11:555E
    inc  hl                         ; 11:555F
    ld   b,[hl]                     ; 11:5560
    ld   a,$07                      ; 11:5561
    ldh  [<SVBK],a                  ; 11:5563
    ld   [hl],b                     ; 11:5565
    dec  hl                         ; 11:5566
    ld   [hl],c                     ; 11:5567
    xor  a                          ; 11:5568
    ldh  [<SVBK],a                  ; 11:5569
    ld   hl,$C168                   ; 11:556B
    inc  [hl]                       ; 11:556E
    ret                             ; 11:556F

Code115570:
    ld   a,$05                      ; 11:5570
    ld   [$C168],a                  ; 11:5572
    ret                             ; 11:5575

Code115576:
    ld   a,[$C197]                  ; 11:5576
    bit  6,a                        ; 11:5579
    jr   z,Code1155C3               ; 11:557B
    ld   a,[$C197]                  ; 11:557D
    res  6,a                        ; 11:5580
    ld   [$C197],a                  ; 11:5582
    ld   b,$05                      ; 11:5585
    ld   c,$62                      ; 11:5587
    call Sub115627                  ; 11:5589
    ld   a,[$C19C]                  ; 11:558C
    cp   $20                        ; 11:558F
    jr   nc,Code11559C              ; 11:5591
    ld   a,[$C168]                  ; 11:5593
    add  $03                        ; 11:5596
    ld   [$C168],a                  ; 11:5598
    ret                             ; 11:559B

Code11559C:
    ld   a,[$C42A]                  ; 11:559C
    or   $08                        ; 11:559F
    ld   [$C42A],a                  ; 11:55A1
    ld   a,$40                      ; 11:55A4
    ld   [$C1AD],a                  ; 11:55A6
    ld   a,$2C                      ; 11:55A9
    ld   [$C1AE],a                  ; 11:55AB
    ld   hl,$DFAC                   ; 11:55AE
    ld   c,[hl]                     ; 11:55B1
    inc  hl                         ; 11:55B2
    ld   b,[hl]                     ; 11:55B3
    ld   a,$07                      ; 11:55B4
    ldh  [<SVBK],a                  ; 11:55B6
    ld   [hl],b                     ; 11:55B8
    dec  hl                         ; 11:55B9
    ld   [hl],c                     ; 11:55BA
    xor  a                          ; 11:55BB
    ldh  [<SVBK],a                  ; 11:55BC
    ld   hl,$C168                   ; 11:55BE
    inc  [hl]                       ; 11:55C1
    ret                             ; 11:55C2

Code1155C3:
    ld   a,$0B                      ; 11:55C3
    ld   [$C168],a                  ; 11:55C5
    ret                             ; 11:55C8

Code1155C9:
    ld   a,[$C197]                  ; 11:55C9
    bit  5,a                        ; 11:55CC
    jr   z,Code115616               ; 11:55CE
    ld   a,[$C197]                  ; 11:55D0
    res  5,a                        ; 11:55D3
    ld   [$C197],a                  ; 11:55D5
    ld   b,$04                      ; 11:55D8
    ld   c,$61                      ; 11:55DA
    call Sub115627                  ; 11:55DC
    ld   a,[$C19D]                  ; 11:55DF
    cp   $20                        ; 11:55E2
    jr   nc,Code1155EF              ; 11:55E4
    ld   a,[$C168]                  ; 11:55E6
    add  $03                        ; 11:55E9
    ld   [$C168],a                  ; 11:55EB
    ret                             ; 11:55EE

Code1155EF:
    ld   a,[$C42A]                  ; 11:55EF
    or   $04                        ; 11:55F2
    ld   [$C42A],a                  ; 11:55F4
    ld   a,$40                      ; 11:55F7
    ld   [$C1AD],a                  ; 11:55F9
    ld   a,$24                      ; 11:55FC
    ld   [$C1AE],a                  ; 11:55FE
    ld   hl,$DFA4                   ; 11:5601
    ld   c,[hl]                     ; 11:5604
    inc  hl                         ; 11:5605
    ld   b,[hl]                     ; 11:5606
    ld   a,$07                      ; 11:5607
    ldh  [<SVBK],a                  ; 11:5609
    ld   [hl],b                     ; 11:560B
    dec  hl                         ; 11:560C
    ld   [hl],c                     ; 11:560D
    xor  a                          ; 11:560E
    ldh  [<SVBK],a                  ; 11:560F
    ld   hl,$C168                   ; 11:5611
    inc  [hl]                       ; 11:5614
    ret                             ; 11:5615

Code115616:
    ld   a,$01                      ; 11:5616
    ld   [$C164],a                  ; 11:5618
    xor  a                          ; 11:561B
    ld   [$C197],a                  ; 11:561C
    ld   [$C168],a                  ; 11:561F
    ld   hl,H_GameSubstate          ; 11:5622
    inc  [hl]                       ; 11:5625
    ret                             ; 11:5626

Sub115627:
    ld   a,[$C197]                  ; 11:5627
    and  $1C                        ; 11:562A
    ld   e,a                        ; 11:562C
    and  $F0                        ; 11:562D
    swap a                          ; 11:562F
    ld   d,a                        ; 11:5631
    ld   a,e                        ; 11:5632
    and  $0F                        ; 11:5633
    swap a                          ; 11:5635
    ld   e,a                        ; 11:5637
    ld   hl,$99E2                   ; 11:5638
    add  hl,de                      ; 11:563B
    ld   a,[$C197]                  ; 11:563C
    and  $03                        ; 11:563F
    sla  a                          ; 11:5641
    sla  a                          ; 11:5643
    ld   e,a                        ; 11:5645
    ld   a,[$C168]                  ; 11:5646
    srl  a                          ; 11:5649
    srl  a                          ; 11:564B
    add  e                          ; 11:564D
    ld   e,a                        ; 11:564E
    ld   d,$00                      ; 11:564F
    add  hl,de                      ; 11:5651
    ld   e,l                        ; 11:5652
    ld   d,h                        ; 11:5653
    ld   hl,W_TilemapUploadBuffer   ; 11:5654
    ld   [hl],d                     ; 11:5657
    inc  hl                         ; 11:5658
    ld   [hl],e                     ; 11:5659
    inc  hl                         ; 11:565A
    ld   [hl],$01                   ; 11:565B
    inc  hl                         ; 11:565D
    ld   [hl],b                     ; 11:565E
    inc  hl                         ; 11:565F
    ld   [hl],c                     ; 11:5660
    inc  hl                         ; 11:5661
    ld   [hl],$00                   ; 11:5662
    ld   a,$36                      ; 11:5664
    ldh  [<$FFF3],a                 ; 11:5666
    ld   a,$40                      ; 11:5668
    ld   [$C326],a                  ; 11:566A
    ret                             ; 11:566D

Code11566E:
    ld   a,[$C1AD]                  ; 11:566E
    dec  a                          ; 11:5671
    ld   [$C1AD],a                  ; 11:5672
    cp   $20                        ; 11:5675
    jr   c,Code115680               ; 11:5677
    ld   a,$11                      ; 11:5679
    rst  $10                        ; 11:567B  24-bit call
.dl SubL_0451A8                     ; 11:567C
    ret                             ; 11:567F

Code115680:
    ld   a,$11                      ; 11:5680
    rst  $10                        ; 11:5682  24-bit call
.dl SubL_045225                     ; 11:5683
    ld   a,[$C1AD]                  ; 11:5686
    and  a                          ; 11:5689
    ret  nz                         ; 11:568A
    ld   a,[$C198]                  ; 11:568B
    cp   $20                        ; 11:568E
    jr   c,Code1156BF               ; 11:5690
    ld   a,[$C19C]                  ; 11:5692
    cp   $20                        ; 11:5695
    jr   c,Code1156BF               ; 11:5697
    ld   a,[$C19D]                  ; 11:5699
    cp   $20                        ; 11:569C
    jr   c,Code1156BF               ; 11:569E
    ld   a,[$C197]                  ; 11:56A0
    and  $E0                        ; 11:56A3
    jr   nz,Code1156BF              ; 11:56A5
    ld   a,[$C429]                  ; 11:56A7
    or   $20                        ; 11:56AA
    ld   [$C429],a                  ; 11:56AC
    ld   a,$03                      ; 11:56AF
    ld   [$C1B0],a                  ; 11:56B1
    ld   a,$60                      ; 11:56B4
    ld   [$C326],a                  ; 11:56B6
    ld   a,$13                      ; 11:56B9
    ld   [$C168],a                  ; 11:56BB
    ret                             ; 11:56BE

Code1156BF:
    ld   a,$40                      ; 11:56BF
    ld   [$C326],a                  ; 11:56C1
    ld   hl,$C168                   ; 11:56C4
    inc  [hl]                       ; 11:56C7
    ret                             ; 11:56C8

Code1156C9:
    ld   a,[$C1A7]                  ; 11:56C9
    and  a                          ; 11:56CC
    jr   nz,Code1156D5              ; 11:56CD
    ld   hl,$C168                   ; 11:56CF
    inc  [hl]                       ; 11:56D2
    inc  [hl]                       ; 11:56D3
    ret                             ; 11:56D4

Code1156D5:
    ld   a,$10                      ; 11:56D5
    ld   [$C168],a                  ; 11:56D7
    ret                             ; 11:56DA

Code1156DB:
    ldh  a,[<H_ButtonsPressed]      ; 11:56DB
    and  $01                        ; 11:56DD
    jr   nz,Code115703              ; 11:56DF
    ld   hl,$C1A4                   ; 11:56E1
    ld   a,[hl]                     ; 11:56E4
    add  $10                        ; 11:56E5
    ldi  [hl],a                     ; 11:56E7
    ld   a,[hl]                     ; 11:56E8
    adc  $00                        ; 11:56E9
    ldi  [hl],a                     ; 11:56EB
    ld   a,[hl]                     ; 11:56EC
    adc  $00                        ; 11:56ED
    ld   [hl],a                     ; 11:56EF
    ld   hl,W_ChalTotalScoreHigh    ; 11:56F0
    ld   de,$C1A6                   ; 11:56F3
    ld   c,$03                      ; 11:56F6
Code1156F8:
    ld   a,[de]                     ; 11:56F8
    cp   [hl]                       ; 11:56F9
    jr   c,Code115715               ; 11:56FA
    jr   nz,Code115703              ; 11:56FC
    dec  de                         ; 11:56FE
    dec  hl                         ; 11:56FF
    dec  c                          ; 11:5700
    jr   nz,Code1156F8              ; 11:5701
Code115703:
    ld   a,[W_ChalTotalScoreLow]    ; 11:5703
    ld   [$C1A4],a                  ; 11:5706
    ld   a,[W_ChalTotalScoreMid]    ; 11:5709
    ld   [$C1A5],a                  ; 11:570C
    ld   a,[W_ChalTotalScoreHigh]   ; 11:570F
    ld   [$C1A6],a                  ; 11:5712
Code115715:
    ld   a,$47                      ; 11:5715
    ldh  [<$FFF2],a                 ; 11:5717
    call Sub11543C                  ; 11:5719
    ld   hl,W_ChalTotalScoreHigh    ; 11:571C
    ld   a,[$C1A6]                  ; 11:571F
    cp   [hl]                       ; 11:5722
    ret  nz                         ; 11:5723
    dec  hl                         ; 11:5724
    ld   a,[$C1A5]                  ; 11:5725
    cp   [hl]                       ; 11:5728
    ret  nz                         ; 11:5729
    dec  hl                         ; 11:572A
    ld   a,[$C1A4]                  ; 11:572B
    cp   [hl]                       ; 11:572E
    ret  nz                         ; 11:572F
    ld   a,[W_ChalTotalScoreLow]    ; 11:5730
    ld   [$C1A4],a                  ; 11:5733
    ld   a,[W_ChalTotalScoreMid]    ; 11:5736
    ld   [$C1A5],a                  ; 11:5739
    ld   a,[W_ChalTotalScoreHigh]   ; 11:573C
    ld   [$C1A6],a                  ; 11:573F
    xor  a                          ; 11:5742
    ld   [$C1A7],a                  ; 11:5743
    ld   a,$40                      ; 11:5746
    ld   [$C326],a                  ; 11:5748
    ld   a,[$C35D]                  ; 11:574B
    cp   $88                        ; 11:574E
    jr   nc,Code115769              ; 11:5750
    call CalcScoreBarPixels         ; 11:5752
    ld   a,b                        ; 11:5755
    cp   $00                        ; 11:5756
    jr   z,Code115769               ; 11:5758
    ld   a,[$C35D]                  ; 11:575A
    cp   b                          ; 11:575D
    jr   nc,Code115769              ; 11:575E
    ld   a,b                        ; 11:5760
    ld   [$C164],a                  ; 11:5761
    ld   hl,$C168                   ; 11:5764
    inc  [hl]                       ; 11:5767
    ret                             ; 11:5768

Code115769:
    ld   a,$06                      ; 11:5769
    ld   [$C168],a                  ; 11:576B
    ret                             ; 11:576E

Code11576F:
    ld   a,[$C326]                  ; 11:576F
    dec  a                          ; 11:5772
    ld   [$C326],a                  ; 11:5773
    and  $03                        ; 11:5776
    ret  nz                         ; 11:5778
    ld   a,$72                      ; 11:5779
    ldh  [<$FFF2],a                 ; 11:577B
    ld   a,[$C35D]                  ; 11:577D
    inc  a                          ; 11:5780
    ld   [$C35D],a                  ; 11:5781
    ld   b,a                        ; 11:5784
    call Sub11549A                  ; 11:5785
    ld   a,[$C35D]                  ; 11:5788
    ld   b,a                        ; 11:578B
    cp   $2E                        ; 11:578C
    jr   z,Code11579A               ; 11:578E
    cp   $5B                        ; 11:5790
    jr   z,Code11579F               ; 11:5792
    cp   $88                        ; 11:5794
    jr   z,Code1157A4               ; 11:5796
    jr   Code1157AE                 ; 11:5798
Code11579A:
    ld   de,Pal_ChalMenuOrangeBG    ; 11:579A
    jr   Code1157A7                 ; 11:579D
Code11579F:
    ld   de,Pal_ChalMenuRedBG       ; 11:579F
    jr   Code1157A7                 ; 11:57A2
Code1157A4:
    ld   de,Pal_ChalMenuBlueBG      ; 11:57A4
Code1157A7:
    call Sub1154E0                  ; 11:57A7
    ld   a,$67                      ; 11:57AA
    ldh  [<$FFF2],a                 ; 11:57AC
Code1157AE:
    ld   a,[$C35D]                  ; 11:57AE
    ld   b,a                        ; 11:57B1
    ld   a,[$C164]                  ; 11:57B2
    cp   b                          ; 11:57B5
    jr   z,Code1157B9               ; 11:57B6
    ret                             ; 11:57B8

Code1157B9:
    ld   a,$40                      ; 11:57B9
    ld   [$C326],a                  ; 11:57BB
    ld   a,[$C35D]                  ; 11:57BE
    cp   $88                        ; 11:57C1
    jr   c,Code1157DD               ; 11:57C3
    ld   a,[$C429]                  ; 11:57C5
    or   $80                        ; 11:57C8
    ld   [$C429],a                  ; 11:57CA
    ld   a,$01                      ; 11:57CD  01: Toad award
    ld   [$C1B0],a                  ; 11:57CF
    ld   a,$80                      ; 11:57D2
    ld   [$C326],a                  ; 11:57D4
    ld   a,$13                      ; 11:57D7
    ld   [$C168],a                  ; 11:57D9
    ret                             ; 11:57DC

Code1157DD:
    ld   a,$06                      ; 11:57DD
    ld   [$C168],a                  ; 11:57DF
    ret                             ; 11:57E2

Unused1157E3:
    ld   hl,W_TilemapUploadBuffer   ; 11:57E3
    ld   [hl],$9B                   ; 11:57E6
    inc  hl                         ; 11:57E8
    ld   [hl],$F2                   ; 11:57E9
    inc  hl                         ; 11:57EB
    ld   [hl],$01                   ; 11:57EC
    inc  hl                         ; 11:57EE
    ld   [hl],$06                   ; 11:57EF
    inc  hl                         ; 11:57F1
    ld   [hl],$AF                   ; 11:57F2
    inc  hl                         ; 11:57F4
    ld   [hl],$00                   ; 11:57F5
    ld   a,$36                      ; 11:57F7
    ldh  [<$FFF3],a                 ; 11:57F9
    ld   a,[$C429]                  ; 11:57FB
    or   $80                        ; 11:57FE
    ld   [$C429],a                  ; 11:5800
    ld   a,$01                      ; 11:5803
    ld   [$C1B0],a                  ; 11:5805
    ld   a,$80                      ; 11:5808
    ld   [$C326],a                  ; 11:580A
    ld   a,$13                      ; 11:580D
    ld   [$C168],a                  ; 11:580F
    ret                             ; 11:5812

Code115813:
    ld   a,[$C326]                  ; 11:5813
    dec  a                          ; 11:5816
    ld   [$C326],a                  ; 11:5817
    ret  nz                         ; 11:581A
    ld   a,$11                      ; 11:581B
    rst  $10                        ; 11:581D  24-bit call
.dl SubL_0757EF                     ; 11:581E
    xor  a                          ; 11:5821
    ld   [$C168],a                  ; 11:5822
    ld   a,$20                      ; 11:5825
    ld   [$C1AD],a                  ; 11:5827
    ld   a,$1C                      ; 11:582A
    ldh  [<H_GameState],a           ; 11:582C
    ret                             ; 11:582E

Pal_ChalMenuOrangeBG:               ; 11:582F
.dw $07FF,$061F
Pal_ChalMenuRedBG:                  ; 11:5833
.dw $621F,$185F
Pal_ChalMenuBlueBG:                 ; 11:5837
.dw $7F0F,$7D2D

Code11583B:
; Challenge menu substate 1
    ld   a,[$C164]                  ; 11:583B
    cp   $00                        ; 11:583E
    jr   z,Code11584D               ; 11:5840
    dec  a                          ; 11:5842
    ld   [$C164],a                  ; 11:5843
    jr   nz,Code11584D              ; 11:5846
    ld   a,$75                      ; 11:5848
    ld   [$DE68],a                  ; 11:584A
Code11584D:
    ld   a,$00                      ; 11:584D
    and  a                          ; 11:584F
    jr   z,Code11586C               ; 11:5850
    ld   a,[$C195]                  ; 11:5852
    and  a                          ; 11:5855
    jr   nz,Code115863              ; 11:5856
    ldh  a,[<H_ButtonsPressed]      ; 11:5858
    and  $04                        ; 11:585A
    jr   z,Code11586C               ; 11:585C
    ld   a,$01                      ; 11:585E
    ld   [$C195],a                  ; 11:5860
Code115863:
    ld   a,$FF                      ; 11:5863
    ld   hl,W_ChalUnlockFlags       ; 11:5865
    ldi  [hl],a                     ; 11:5868
    ldi  [hl],a                     ; 11:5869
    ldi  [hl],a                     ; 11:586A
    ld   [hl],a                     ; 11:586B
Code11586C:
    ld   a,[W_ChalUnlockFlags]      ; 11:586C
    and  $01                        ; 11:586F
    jr   z,Code115876               ; 11:5871
    call Sub115A77                  ; 11:5873
Code115876:
    ldh  a,[<H_ButtonsPressed]      ; 11:5876
    and  $03                        ; 11:5878
    jp   z,Return1158F1             ; 11:587A
    ldh  a,[<H_ButtonsPressed]      ; 11:587D
    and  $01                        ; 11:587F
    jr   nz,Code115890              ; 11:5881
    ld   a,$00                      ; 11:5883
    ldh  [<H_GameSubstate],a        ; 11:5885
    ld   a,$63                      ; 11:5887
    ldh  [<$FFF2],a                 ; 11:5889
    ld   a,$18                      ; 11:588B
    ldh  [<H_GameState],a           ; 11:588D
    ret                             ; 11:588F

Code115890:
    ld   a,[W_ChalUnlockFlags]      ; 11:5890
    and  $01                        ; 11:5893
    jr   nz,Code11589C              ; 11:5895
    ld   a,$30                      ; 11:5897
    ldh  [<$FFF3],a                 ; 11:5899
    ret                             ; 11:589B

Code11589C:
    ld   a,[W_SublevelID]           ; 11:589C
    ld   [W_LevelID],a              ; 11:589F
    ld   [$C35C],a                  ; 11:58A2
    ld   a,$00                      ; 11:58A5
    ldh  [<H_GameSubstate],a        ; 11:58A7
    ld   [$C1EF],a                  ; 11:58A9
    ld   [$C182],a                  ; 11:58AC
    ld   [$C1B3],a                  ; 11:58AF
    ld   [W_HardFlag],a             ; 11:58B2
    ld   [$C17A],a                  ; 11:58B5
    ld   [$C17B],a                  ; 11:58B8
    ld   [$C17C],a                  ; 11:58BB
    ld   [W_PlayerCoins],a          ; 11:58BE
    ld   [$C188],a                  ; 11:58C1
    ld   [$D30A],a                  ; 11:58C4
    ld   [$D30B],a                  ; 11:58C7
    ld   [$D32C],a                  ; 11:58CA
    ld   [$C196],a                  ; 11:58CD
    ld   [$C197],a                  ; 11:58D0
    ld   [$C19C],a                  ; 11:58D3
    ld   [$C19D],a                  ; 11:58D6
    ld   a,$01                      ; 11:58D9
    ld   [W_PlayerLives],a          ; 11:58DB
    ld   [$C287],a                  ; 11:58DE
    ld   [$C288],a                  ; 11:58E1
    ld   [$C289],a                  ; 11:58E4
    ld   [$C28A],a                  ; 11:58E7
    call Sub0010A9                  ; 11:58EA
    ld   a,$04                      ; 11:58ED
    ldh  [<H_GameState],a           ; 11:58EF
Return1158F1:
    ret                             ; 11:58F1

Sub1158F2:
    ld   a,$07                      ; 11:58F2
    ldh  [<SVBK],a                  ; 11:58F4
    ld   a,$0E                      ; 11:58F6
    ld   [$C415],a                  ; 11:58F8
    ld   hl,Ti_ChalMenu             ; 11:58FB
    ld   de,$DC00                   ; 11:58FE
    ld   bc,$02D0                   ; 11:5901
    ld   a,$11                      ; 11:5904
    call CopyBytesLong              ; 11:5906
    ld   de,W_ChalUnlockFlags       ; 11:5909
    ld   a,$00                      ; 11:590C
    ldh  [<$FFA6],a                 ; 11:590E
@ByteLoop:
    ld   a,[de]                     ; 11:5910
    ld   c,a                        ; 11:5911
    ld   a,$00                      ; 11:5912
    ldh  [<$FFA5],a                 ; 11:5914
@BitLoop:
    rrc  c                          ; 11:5916
    jr   nc,@Code115963             ; 11:5918
    push de                         ; 11:591A
    ldh  a,[<$FFA5]                 ; 11:591B
    and  $07                        ; 11:591D
    swap a                          ; 11:591F
    ld   e,a                        ; 11:5921
    srl  e                          ; 11:5922
    sla  a                          ; 11:5924
    add  e                          ; 11:5926
    ld   e,a                        ; 11:5927
    ld   a,$00                      ; 11:5928
    adc  $00                        ; 11:592A
    ld   d,a                        ; 11:592C
    ldh  a,[<$FFA6]                 ; 11:592D
    sla  a                          ; 11:592F
    sla  a                          ; 11:5931
    add  e                          ; 11:5933
    ld   e,a                        ; 11:5934
    ld   a,d                        ; 11:5935
    adc  $00                        ; 11:5936
    ld   d,a                        ; 11:5938
    ld   hl,$DD6A                   ; 11:5939
    add  hl,de                      ; 11:593C
    ld   a,$04                      ; 11:593D
    ldi  [hl],a                     ; 11:593F
    ldi  [hl],a                     ; 11:5940
    ld   [hl],a                     ; 11:5941
    ld   de,$0012                   ; 11:5942
    add  hl,de                      ; 11:5945
    ldi  [hl],a                     ; 11:5946
    ldi  [hl],a                     ; 11:5947
    ld   [hl],a                     ; 11:5948
    ld   de,$FE82                   ; 11:5949
    add  hl,de                      ; 11:594C
    ld   a,[hl]                     ; 11:594D
    sub  $10                        ; 11:594E
    ldi  [hl],a                     ; 11:5950
    ld   a,[hl]                     ; 11:5951
    sub  $10                        ; 11:5952
    ldi  [hl],a                     ; 11:5954
    ld   a,[hl]                     ; 11:5955
    sub  $10                        ; 11:5956
    ld   [hl],a                     ; 11:5958
    ld   de,$0012                   ; 11:5959
    add  hl,de                      ; 11:595C
    ld   a,$71                      ; 11:595D
    ldi  [hl],a                     ; 11:595F
    ldi  [hl],a                     ; 11:5960
    ld   [hl],a                     ; 11:5961
    pop  de                         ; 11:5962
@Code115963:
    ldh  a,[<$FFA5]                 ; 11:5963
    inc  a                          ; 11:5965
    ldh  [<$FFA5],a                 ; 11:5966
    cp   $08                        ; 11:5968
    jr   c,@BitLoop                 ; 11:596A
    inc  de                         ; 11:596C
    ldh  a,[<$FFA6]                 ; 11:596D
    inc  a                          ; 11:596F
    ldh  [<$FFA6],a                 ; 11:5970
    cp   $04                        ; 11:5972
    jr   c,@ByteLoop                ; 11:5974
    xor  a                          ; 11:5976
    ld   [$C19C],a                  ; 11:5977
    ld   [$C19D],a                  ; 11:597A
    ld   [$C198],a                  ; 11:597D
    ld   a,$00                      ; 11:5980
    ldh  [<$FFA6],a                 ; 11:5982
@Loop115984:
    ldh  a,[<$FFA6]                 ; 11:5984
    ld   [W_LevelID],a              ; 11:5986
    ld   a,$11                      ; 11:5989
    rst  $10                        ; 11:598B  24-bit call
.dl SubL_LoadChalLevelSaveData      ; 11:598C  Load current level's challenge mode save data
    ld   a,[$C18D]                  ; 11:598F
    ld   b,a                        ; 11:5992
    ld   a,[$C19C]                  ; 11:5993
    add  b                          ; 11:5996
    ld   [$C19C],a                  ; 11:5997
    ld   a,[$C194]                  ; 11:599A
    ld   b,a                        ; 11:599D
    ld   a,[$C19D]                  ; 11:599E
    add  b                          ; 11:59A1
    ld   [$C19D],a                  ; 11:59A2
    ld   a,[$C189]                  ; 11:59A5
    cp   $05                        ; 11:59A8
    jr   c,@Code1159CD              ; 11:59AA
    ld   hl,$C198                   ; 11:59AC
    inc  [hl]                       ; 11:59AF
    ld   a,[$C197]                  ; 11:59B0
    and  $1F                        ; 11:59B3
    ld   b,a                        ; 11:59B5
    ldh  a,[<$FFA6]                 ; 11:59B6
    cp   b                          ; 11:59B8
    jr   nz,@Code1159C2             ; 11:59B9
    ld   a,[$C197]                  ; 11:59BB
    and  $80                        ; 11:59BE
    jr   nz,@Code1159CD             ; 11:59C0
@Code1159C2:
    call Sub115A27                  ; 11:59C2
    ld   [hl],$72                   ; 11:59C5
    ld   de,$0168                   ; 11:59C7
    add  hl,de                      ; 11:59CA
    ld   [hl],$06                   ; 11:59CB
@Code1159CD:
    ld   a,[$C18D]                  ; 11:59CD
    and  a                          ; 11:59D0
    jr   z,@Code1159F1              ; 11:59D1
    ld   a,[$C197]                  ; 11:59D3
    and  $1F                        ; 11:59D6
    ld   b,a                        ; 11:59D8
    ldh  a,[<$FFA6]                 ; 11:59D9
    cp   b                          ; 11:59DB
    jr   nz,@Code1159E5             ; 11:59DC
    ld   a,[$C197]                  ; 11:59DE
    and  $40                        ; 11:59E1
    jr   nz,@Code1159F1             ; 11:59E3
@Code1159E5:
    call Sub115A27                  ; 11:59E5
    inc  hl                         ; 11:59E8
    ld   [hl],$62                   ; 11:59E9
    ld   de,$0168                   ; 11:59EB
    add  hl,de                      ; 11:59EE
    ld   [hl],$05                   ; 11:59EF
@Code1159F1:
    ld   a,[$C194]                  ; 11:59F1
    and  a                          ; 11:59F4
    jr   z,@Code115A16              ; 11:59F5
    ld   a,[$C197]                  ; 11:59F7
    and  $1F                        ; 11:59FA
    ld   b,a                        ; 11:59FC
    ldh  a,[<$FFA6]                 ; 11:59FD
    cp   b                          ; 11:59FF
    jr   nz,@Code115A09             ; 11:5A00
    ld   a,[$C197]                  ; 11:5A02
    and  $20                        ; 11:5A05
    jr   nz,@Code115A16             ; 11:5A07
@Code115A09:
    call Sub115A27                  ; 11:5A09
    inc  hl                         ; 11:5A0C
    inc  hl                         ; 11:5A0D
    ld   [hl],$61                   ; 11:5A0E
    ld   de,$0168                   ; 11:5A10
    add  hl,de                      ; 11:5A13
    ld   [hl],$04                   ; 11:5A14
@Code115A16:
    ldh  a,[<$FFA6]                 ; 11:5A16
    inc  a                          ; 11:5A18
    ldh  [<$FFA6],a                 ; 11:5A19
    cp   $20                        ; 11:5A1B
    jp   c,@Loop115984              ; 11:5A1D
    call Sub115A4C                  ; 11:5A20
    xor  a                          ; 11:5A23
    ldh  [<SVBK],a                  ; 11:5A24
    ret                             ; 11:5A26

Sub115A27:
    ldh  a,[<$FFA6]                 ; 11:5A27
    and  $1C                        ; 11:5A29
    sla  a                          ; 11:5A2B
    ld   e,a                        ; 11:5A2D
    sla  a                          ; 11:5A2E
    sla  a                          ; 11:5A30
    add  e                          ; 11:5A32
    ld   e,a                        ; 11:5A33
    ld   a,$00                      ; 11:5A34
    adc  $00                        ; 11:5A36
    ld   d,a                        ; 11:5A38
    ldh  a,[<$FFA6]                 ; 11:5A39
    and  $03                        ; 11:5A3B
    sla  a                          ; 11:5A3D
    sla  a                          ; 11:5A3F
    add  e                          ; 11:5A41
    ld   e,a                        ; 11:5A42
    ld   a,d                        ; 11:5A43
    add  $00                        ; 11:5A44
    ld   d,a                        ; 11:5A46
    ld   hl,$DC16                   ; 11:5A47
    add  hl,de                      ; 11:5A4A
    ret                             ; 11:5A4B

Sub115A4C:
    ld   de,$DC00                   ; 11:5A4C
    xor  a                          ; 11:5A4F
    ldh  [<VBK],a                   ; 11:5A50
    call Sub115A60                  ; 11:5A52
    ld   a,$01                      ; 11:5A55
    ldh  [<VBK],a                   ; 11:5A57
    call Sub115A60                  ; 11:5A59
    xor  a                          ; 11:5A5C
    ldh  [<VBK],a                   ; 11:5A5D
    ret                             ; 11:5A5F

Sub115A60:
    ld   hl,$99C0                   ; 11:5A60
    ld   b,$12                      ; 11:5A63
Code115A65:
    ld   c,$14                      ; 11:5A65
Code115A67:
    ld   a,[de]                     ; 11:5A67
    ldi  [hl],a                     ; 11:5A68
    inc  de                         ; 11:5A69
    dec  c                          ; 11:5A6A
    jr   nz,Code115A67              ; 11:5A6B
    push de                         ; 11:5A6D
    ld   de,$000C                   ; 11:5A6E
    add  hl,de                      ; 11:5A71
    pop  de                         ; 11:5A72
    dec  b                          ; 11:5A73
    jr   nz,Code115A65              ; 11:5A74
    ret                             ; 11:5A76

Sub115A77:
    ldh  a,[<H_ButtonsHeld]         ; 11:5A77
    ld   c,a                        ; 11:5A79
    ld   b,$04                      ; 11:5A7A
Code115A7C:
    rlc  c                          ; 11:5A7C
    jr   c,Code115A90               ; 11:5A7E
    dec  b                          ; 11:5A80
    jr   nz,Code115A7C              ; 11:5A81
    ld   a,$20                      ; 11:5A83
    ld   [$C35E],a                  ; 11:5A85
    ld   a,$01                      ; 11:5A88
    ld   [$C35F],a                  ; 11:5A8A
    jp   Code115B19                 ; 11:5A8D
Code115A90:
    ld   a,[$C35E]                  ; 11:5A90
    cp   $00                        ; 11:5A93
    jr   z,Code115A9F               ; 11:5A95
    dec  a                          ; 11:5A97
    ld   [$C35E],a                  ; 11:5A98
    cp   $1F                        ; 11:5A9B
    jr   nz,Code115B19              ; 11:5A9D
Code115A9F:
    ld   a,[$C35F]                  ; 11:5A9F
    dec  a                          ; 11:5AA2
    ld   [$C35F],a                  ; 11:5AA3
    and  $07                        ; 11:5AA6
    jr   nz,Code115B19              ; 11:5AA8
    ld   a,$47                      ; 11:5AAA
    ldh  [<$FFF2],a                 ; 11:5AAC
Code115AAE:
    ld   a,b                        ; 11:5AAE
    cp   $04                        ; 11:5AAF
    jr   z,Code115ADF               ; 11:5AB1
    cp   $03                        ; 11:5AB3
    jr   z,Code115AEB               ; 11:5AB5
    cp   $02                        ; 11:5AB7
    jr   z,Code115ACD               ; 11:5AB9
    ld   a,[W_SublevelID]           ; 11:5ABB
    inc  a                          ; 11:5ABE
    and  $03                        ; 11:5ABF
    ld   c,a                        ; 11:5AC1
    ld   a,[W_SublevelID]           ; 11:5AC2
    and  $FC                        ; 11:5AC5
    or   c                          ; 11:5AC7
    ld   [W_SublevelID],a           ; 11:5AC8
    jr   Code115AF5                 ; 11:5ACB
Code115ACD:
    ld   a,[W_SublevelID]           ; 11:5ACD
    dec  a                          ; 11:5AD0
    and  $03                        ; 11:5AD1
    ld   c,a                        ; 11:5AD3
    ld   a,[W_SublevelID]           ; 11:5AD4
    and  $FC                        ; 11:5AD7
    or   c                          ; 11:5AD9
    ld   [W_SublevelID],a           ; 11:5ADA
    jr   Code115AF5                 ; 11:5ADD
Code115ADF:
    ld   a,[W_SublevelID]           ; 11:5ADF
    add  $04                        ; 11:5AE2
    and  $1F                        ; 11:5AE4
    ld   [W_SublevelID],a           ; 11:5AE6
    jr   Code115AF5                 ; 11:5AE9
Code115AEB:
    ld   a,[W_SublevelID]           ; 11:5AEB
    sub  $04                        ; 11:5AEE
    and  $1F                        ; 11:5AF0
    ld   [W_SublevelID],a           ; 11:5AF2
Code115AF5:
    ld   a,[W_ChallengeFlag]        ; 11:5AF5
    cp   $01                        ; 11:5AF8
    jr   nz,Code115B19              ; 11:5AFA
    ld   a,[W_SublevelID]           ; 11:5AFC
    srl  a                          ; 11:5AFF
    srl  a                          ; 11:5B01
    ld   e,a                        ; 11:5B03
    ld   d,$00                      ; 11:5B04
    ld   hl,BitTable8Asc_1152CA     ; 11:5B06
    add  hl,de                      ; 11:5B09
    ld   c,[hl]                     ; 11:5B0A
    ld   a,[W_SublevelID]           ; 11:5B0B
    and  $03                        ; 11:5B0E
    ld   e,a                        ; 11:5B10
    ld   hl,W_ChalUnlockFlags       ; 11:5B11
    add  hl,de                      ; 11:5B14
    ld   a,[hl]                     ; 11:5B15
    and  c                          ; 11:5B16
    jr   z,Code115AAE               ; 11:5B17
Code115B19:
    ld   a,[W_SublevelID]           ; 11:5B19
    srl  a                          ; 11:5B1C
    srl  a                          ; 11:5B1E
    ld   c,a                        ; 11:5B20
    ld   b,$00                      ; 11:5B21
    ld   hl,Data1152BE              ; 11:5B23
    add  hl,bc                      ; 11:5B26
    ld   d,[hl]                     ; 11:5B27
    ld   a,[W_SublevelID]           ; 11:5B28
    and  $03                        ; 11:5B2B
    ld   c,a                        ; 11:5B2D
    ld   hl,Data1152C6              ; 11:5B2E
    add  hl,bc                      ; 11:5B31
    ld   e,[hl]                     ; 11:5B32
    ldh  a,[<H_GlobalTimer]         ; 11:5B33
    and  $0E                        ; 11:5B35
    sla  a                          ; 11:5B37
    sla  a                          ; 11:5B39
    sla  a                          ; 11:5B3B
    ld   c,a                        ; 11:5B3D
    ld   hl,Data11523E              ; 11:5B3E
    add  hl,bc                      ; 11:5B41
    ld   c,l                        ; 11:5B42
    ld   b,h                        ; 11:5B43
    ld   hl,$C000                   ; 11:5B44
    ld   a,$02                      ; 11:5B47
    ldh  [<$FF98],a                 ; 11:5B49
Code115B4B:
    ld   a,$04                      ; 11:5B4B
    ldh  [<$FF99],a                 ; 11:5B4D
    push de                         ; 11:5B4F
Code115B50:
    ld   [hl],d                     ; 11:5B50
    inc  hl                         ; 11:5B51
    ld   [hl],e                     ; 11:5B52
    inc  hl                         ; 11:5B53
    ld   a,[bc]                     ; 11:5B54
    ldi  [hl],a                     ; 11:5B55
    inc  bc                         ; 11:5B56
    ld   a,[bc]                     ; 11:5B57
    ldi  [hl],a                     ; 11:5B58
    inc  bc                         ; 11:5B59
    ld   a,e                        ; 11:5B5A
    add  $08                        ; 11:5B5B
    ld   e,a                        ; 11:5B5D
    ldh  a,[<$FF99]                 ; 11:5B5E
    dec  a                          ; 11:5B60
    ldh  [<$FF99],a                 ; 11:5B61
    jr   nz,Code115B50              ; 11:5B63
    pop  de                         ; 11:5B65
    ld   a,d                        ; 11:5B66
    add  $10                        ; 11:5B67
    ld   d,a                        ; 11:5B69
    ldh  a,[<$FF98]                 ; 11:5B6A
    dec  a                          ; 11:5B6C
    ldh  [<$FF98],a                 ; 11:5B6D
    jr   nz,Code115B4B              ; 11:5B6F
    ret                             ; 11:5B71

Data115B72:                         ; 11:5B72
.db $9B,$69,$05,$06,$F4,$06,$F4,$06,\
    $F4,$06,$F4,$06,$F4,$9B,$A7,$0D,\
    $00,$F4,$00,$F4,$00,$F4,$00,$F4,\
    $00,$F4,$00,$F4,$00,$D0,$02,$FC,\
    $02,$F4,$02,$F4,$02,$F4,$02,$F4,\
    $02,$D0,$00
Data115B9D:                         ; 11:5B9D
.db $99,$CB,$48,$00,$F4,$99,$EB,$48,\
    $00,$F4,$9A,$0B,$48,$00,$F4,$9A,\
    $2B,$48,$00,$F4,$9B,$61,$12,$00,\
    $F4,$00,$F4,$00,$F4,$00,$F4,$00,\
    $F4,$00,$F4,$00,$F4,$00,$F4,$00,\
    $F4,$00,$F4,$00,$F4,$00,$F4,$00,\
    $F4,$00,$50,$00,$51,$00,$52,$00,\
    $53,$00,$54,$9B,$A1,$52,$00,$F4,\
    $00
Data115BDE:                         ; 11:5BDE
.db $99,$EC,$06,$06,$80,$06,$81,$00,\
    $82,$00,$83,$07,$84,$07,$85,$9A,\
    $0C,$06,$06,$90,$06,$91,$00,$92,\
    $00,$93,$07,$94,$07,$95,$00
Data115BFD:                         ; 11:5BFD
.db $9B,$8F,$04,$06,$4D,$06,$4D,$06,\
    $4D,$06,$5D,$9B,$AF,$04,$06,$4D,\
    $06,$4D,$06,$4D,$06,$5D,$9B,$CF,\
    $04,$06,$4D,$06,$4D,$06,$4D,$06,\
    $5D,$9B,$EF,$04,$06,$4D,$06,$4D,\
    $06,$4D,$06,$5D,$00
Data115C2A:                         ; 11:5C2A
.db $9B,$6E,$45,$00,$F4,$99,$E2,$45,\
    $00,$F4,$9A,$03,$43,$00,$F4,$00
Data115C3A:                         ; 11:5C3A
.db $9A,$C1,$9A,$A6,$9A,$EB,$9A,$83,\
    $9A,$8C,$9B,$0B,$9A,$C2,$9A,$E6,\
    $9B,$0C,$9B,$03,$9B,$27,$9A,$CB,\
    $9A,$E4,$9A,$65,$9A,$6C,$9A,$C1,\
    $9A,$A6,$9A,$AB,$9A,$C2,$9A,$87,\
    $9B,$0B,$9B,$0C,$9A,$C9,$9A,$86
Data115C6A:                         ; 11:5C6A
.dw $7FFF,$7E6F,$7D2D,$0000,$3F9F,$034B,$0D16,$0000,\
    $7E6F,$034B,$7D2D,$0000,$7FFF,$7D2D,$0D16,$0000,\
    $7FFF,$22FF,$0200,$0000,$7FFF,$22FF,$7D2D,$0000,\
    $7FFF,$22FF,$001F,$0000,$7FFF,$034B,$0200,$0000,\
    $0000,$7FFF,$3A94,$0000,$0000,$7FFF,$001F,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
Data115CEA:                         ; 11:5CEA
.db $9B,$0A,$01,$05,$3E,$9B,$0E,$01,\
    $05,$3E,$00
Data115CF5:                         ; 11:5CF5
.db $9B,$09,$01,$00,$1F,$9B,$0D,$01,\
    $00,$1F,$00

OverworldInit_CallSubstate:
    ldh  a,[<H_GameSubstate]        ; 11:5D00
    rst  $00                        ; 11:5D02  Execute from 16-bit pointer table
.dw Code115D0D                      ; 11:5D03
.dw Code115E47                      ; 11:5D05
.dw Code115EFA                      ; 11:5D07
.dw Code115F58                      ; 11:5D09
.dw Code116009                      ; 11:5D0B

Code115D0D:
; Overworld init substate 0: Load overworld
    ld   a,[$C1B7]                  ; 11:5D0D
    cp   $01                        ; 11:5D10
    jr   nz,@Code115D41             ; 11:5D12
    xor  a                          ; 11:5D14
    ld   [$C1B8],a                  ; 11:5D15
    ld   hl,W_LevelID               ; 11:5D18
    dec  [hl]                       ; 11:5D1B
@Code115D1C:
    call CalcSPAdjustedLevelID      ; 11:5D1C  de = adjusted level ID
    ld   hl,OWLevelYCoords          ; 11:5D1F
    add  hl,de                      ; 11:5D22  index with adjusted level ID
    ld   a,[hl]                     ; 11:5D23
    ld   [$C1B9],a                  ; 11:5D24  set player Y
    ld   hl,OWLevelXCoords          ; 11:5D27
    add  hl,de                      ; 11:5D2A  index with adjusted level ID
    ld   a,[hl]                     ; 11:5D2B
    ld   [$C1BA],a                  ; 11:5D2C  set player X
    xor  a                          ; 11:5D2F
    ld   [$C1C0],a                  ; 11:5D30
    ld   a,[W_LevelID]              ; 11:5D33
    cp   $1D                        ; 11:5D36  1D: 8-1
    jr   nz,Code115D8F              ; 11:5D38
    ld   a,$01                      ; 11:5D3A
    ld   [$C1C0],a                  ; 11:5D3C
    jr   Code115D8F                 ; 11:5D3F

@Code115D41:
    ld   a,[W_ChallengeFlag]        ; 11:5D41
    and  a                          ; 11:5D44
    jr   nz,@Code115D1C             ; 11:5D45
    ld   a,[$C1B7]                  ; 11:5D47
    and  a                          ; 11:5D4A
    jr   nz,@Code115D1C             ; 11:5D4B
    xor  a                          ; 11:5D4D
    ld   [$C1B3],a                  ; 11:5D4E
    ld   [$C1B8],a                  ; 11:5D51
    call CalcSPAdjustedLevelID      ; 11:5D54  de = adjusted level ID
    sla  e                          ; 11:5D57
    ld   c,e                        ; 11:5D59
    ld   b,d                        ; 11:5D5A
    ld   hl,OWPlayerPathYPtrs       ; 11:5D5B
    add  hl,bc                      ; 11:5D5E
    ld   e,[hl]                     ; 11:5D5F
    inc  hl                         ; 11:5D60
    ld   d,[hl]                     ; 11:5D61
    ld   a,[de]                     ; 11:5D62
    ld   [$C1B9],a                  ; 11:5D63
    inc  de                         ; 11:5D66
    ld   a,[de]                     ; 11:5D67
    ld   [$C1BD],a                  ; 11:5D68
    ld   hl,OWPlayerPathXPtrs       ; 11:5D6B
    add  hl,bc                      ; 11:5D6E
    ld   e,[hl]                     ; 11:5D6F
    inc  hl                         ; 11:5D70
    ld   d,[hl]                     ; 11:5D71
    ld   a,[de]                     ; 11:5D72
    ld   [$C1BA],a                  ; 11:5D73
    ld   b,a                        ; 11:5D76
    inc  de                         ; 11:5D77
    ld   a,[de]                     ; 11:5D78
    ld   [$C1BE],a                  ; 11:5D79
    cp   b                          ; 11:5D7C
    jr   c,Code115D85               ; 11:5D7D
    xor  a                          ; 11:5D7F
    ld   [$C1C0],a                  ; 11:5D80
    jr   Code115D8A                 ; 11:5D83
Code115D85:
    ld   a,$01                      ; 11:5D85
    ld   [$C1C0],a                  ; 11:5D87
Code115D8A:
    ld   a,$01                      ; 11:5D8A
    ld   [$C1BF],a                  ; 11:5D8C
Code115D8F:
    ld   a,:Gr_OW_ChalMenu          ; 11:5D8F
    ld   b,$11                      ; 11:5D91
    call LoadGraphicsBank           ; 11:5D93
    ld   a,$11                      ; 11:5D96
    ld   b,a                        ; 11:5D98
    ld   de,Data115C6A              ; 11:5D99
    call LoadFullPaletteLong        ; 11:5D9C
    call Sub00128D                  ; 11:5D9F
    ld   a,[W_LevelID]              ; 11:5DA2
    srl  a                          ; 11:5DA5
    srl  a                          ; 11:5DA7  world number (0-indexed)
    and  $07                        ; 11:5DA9  cap to 0-7 range
    ld   b,a                        ; 11:5DAB
    ld   a,[W_SPFlag]               ; 11:5DAC
    and  a                          ; 11:5DAF
    jr   z,Code115DC3               ; 11:5DB0  if not Super Players, skip
    ld   a,b                        ; 11:5DB2 
    cp   $07                        ; 11:5DB3
    jr   z,Code115DC3               ; 11:5DB5  if world 8, don't change index
    cp   $00                        ; 11:5DB7
    jr   z,Code115DC3               ; 11:5DB9  if world 1, don't change index
    bit  0,b                        ; 11:5DBB
    jr   nz,Code115DC2              ; 11:5DBD
    dec  b                          ; 11:5DBF  decrement if even internal (worlds 3/5/7)
    jr   Code115DC3                 ; 11:5DC0
Code115DC2:
    inc  b                          ; 11:5DC2  increment if odd internal (worlds 2/4/6)
Code115DC3:
    ld   hl,Ti_Overworlds           ; 11:5DC3
    ld   de,$02D0                   ; 11:5DC6
Code115DC9:
    ld   a,b                        ; 11:5DC9 \
    cp   $00                        ; 11:5DCA |
    jr   z,Code115DD2               ; 11:5DCC |
    add  hl,de                      ; 11:5DCE | loop: add 02D0 * world index
    dec  b                          ; 11:5DCF |
    jr   Code115DC9                 ; 11:5DD0 /
Code115DD2:
    ld   a,:Ti_Overworlds           ; 11:5DD2
    ld   b,$11                      ; 11:5DD4
    ld   de,$99C0                   ; 11:5DD6
    call LoadScreenTilemapVRAM      ; 11:5DD9
    ld   a,[W_SPFlag]               ; 11:5DDC
    and  a                          ; 11:5DDF
    jr   z,Code115E02               ; 11:5DE0  if not Super Players, skip
    ld   a,[W_LevelID]              ; 11:5DE2
    and  $1C                        ; 11:5DE5  filter world bits
    cp   $04                        ; 11:5DE7
    jr   z,Code115DF1               ; 11:5DE9
    cp   $08                        ; 11:5DEB
    jr   z,Code115DF6               ; 11:5DED
    jr   Code115E02                 ; 11:5DEF
Code115DF1:
    ld   hl,Data115CEA              ; 11:5DF1  used if world 2?
    jr   Code115DF9                 ; 11:5DF4
Code115DF6:
    ld   hl,Data115CF5              ; 11:5DF6  used if world 3?
Code115DF9:
    ld   de,W_TilemapUploadBuffer   ; 11:5DF9 \ runs if Super Players world 2 or 3
    ld   bc,$000B                   ; 11:5DFC
    call CopyBytes                  ; 11:5DFF /
Code115E02:
    ld   a,$00                      ; 11:5E02
    ld   [$C0C4],a                  ; 11:5E04
    ld   [$C0C1],a                  ; 11:5E07
    ld   [$C168],a                  ; 11:5E0A
    ldh  [<H_CameraXLow],a          ; 11:5E0D
    ldh  [<H_CameraXHigh],a         ; 11:5E0F
    ldh  [<$FFBB],a                 ; 11:5E11
    ld   a,$70                      ; 11:5E13
    ldh  [<H_CameraY],a             ; 11:5E15
    ld   a,[W_LevelID]              ; 11:5E17
    ld   [W_SublevelID],a           ; 11:5E1A
    ld   a,$FC                      ; 11:5E1D
    ld   [$C1BB],a                  ; 11:5E1F
    ld   a,$48                      ; 11:5E22
    ld   [$C326],a                  ; 11:5E24
    ld   a,$1F                      ; 11:5E27
    ld   [$C164],a                  ; 11:5E29
    ld   a,$11                      ; 11:5E2C
    rst  $10                        ; 11:5E2E  24-bit call
.dl SubL_LoadChalLevelSaveData      ; 11:5E2F
    ld   a,[W_PlayerFireFlag]       ; 11:5E32
    ld   [$C1AF],a                  ; 11:5E35
    xor  a                          ; 11:5E38
    ld   [W_PlayerFireFlag],a       ; 11:5E39
    ld   a,$11                      ; 11:5E3C
    rst  $10                        ; 11:5E3E  24-bit call
.dl SubL_0B421E                     ; 11:5E3F
    ld   hl,H_GameSubstate          ; 11:5E42
    inc  [hl]                       ; 11:5E45
    ret                             ; 11:5E46

Code115E47:
; Overworld init / Challenge results substate 1
    ld   a,[W_LevelID]              ; 11:5E47
    and  $03                        ; 11:5E4A
    add  $D1                        ; 11:5E4C
    ld   c,a                        ; 11:5E4E
    ld   a,[W_LevelID]              ; 11:5E4F
    srl  a                          ; 11:5E52
    srl  a                          ; 11:5E54
    and  $07                        ; 11:5E56
    add  $D1                        ; 11:5E58
    ld   b,a                        ; 11:5E5A
    ld   d,$F8                      ; 11:5E5B
    ld   a,[W_HardFlag]             ; 11:5E5D
    and  a                          ; 11:5E60
    jr   z,Code115E65               ; 11:5E61
    ld   d,$FD                      ; 11:5E63
Code115E65:
    ld   hl,W_TilemapUploadBuffer   ; 11:5E65
    ld   [hl],$9A                   ; 11:5E68
    inc  hl                         ; 11:5E6A
    ld   [hl],$03                   ; 11:5E6B
    inc  hl                         ; 11:5E6D
    ld   [hl],$03                   ; 11:5E6E
    inc  hl                         ; 11:5E70
    xor  a                          ; 11:5E71
    ldi  [hl],a                     ; 11:5E72
    ld   [hl],b                     ; 11:5E73
    inc  hl                         ; 11:5E74
    ldi  [hl],a                     ; 11:5E75
    ld   [hl],d                     ; 11:5E76
    inc  hl                         ; 11:5E77
    ldi  [hl],a                     ; 11:5E78
    ld   [hl],c                     ; 11:5E79
    ld   a,[W_ChallengeFlag]        ; 11:5E7A
    cp   $01                        ; 11:5E7D
    jr   z,Code115E93               ; 11:5E7F
    ld   de,$DF0A                   ; 11:5E81
    ld   hl,Data115B9D              ; 11:5E84
    ld   bc,$0041                   ; 11:5E87
    call CopyBytes                  ; 11:5E8A
    ld   hl,H_GameSubstate          ; 11:5E8D
    inc  [hl]                       ; 11:5E90
    inc  [hl]                       ; 11:5E91
    ret                             ; 11:5E92

Code115E93:
    ld   de,$DF0A                   ; 11:5E93
    ld   hl,Data115B72              ; 11:5E96
    ld   bc,$002B                   ; 11:5E99
    call CopyBytes                  ; 11:5E9C
    ld   a,[$C189]                  ; 11:5E9F
    cp   $00                        ; 11:5EA2
    jr   z,Code115EB1               ; 11:5EA4
    ld   b,a                        ; 11:5EA6
    ld   hl,$DF16                   ; 11:5EA7
Code115EAA:
    ld   [hl],$2E                   ; 11:5EAA
    dec  hl                         ; 11:5EAC
    dec  hl                         ; 11:5EAD
    dec  b                          ; 11:5EAE
    jr   nz,Code115EAA              ; 11:5EAF
Code115EB1:
    ld   a,[W_LevelID]              ; 11:5EB1
    ld   e,a                        ; 11:5EB4
    sla  a                          ; 11:5EB5
    add  e                          ; 11:5EB7
    ld   e,a                        ; 11:5EB8
    ld   d,$00                      ; 11:5EB9
    ld   hl,HighScoreTargets        ; 11:5EBB
    add  hl,de                      ; 11:5EBE
    ldi  a,[hl]                     ; 11:5EBF
    ld   [$C19E],a                  ; 11:5EC0
    ldi  a,[hl]                     ; 11:5EC3
    ld   [$C19F],a                  ; 11:5EC4
    ld   a,[hl]                     ; 11:5EC7
    ld   [$C1A0],a                  ; 11:5EC8
    ld   de,$C18A                   ; 11:5ECB
    call Sub003DFB                  ; 11:5ECE
    ld   hl,$DF1B                   ; 11:5ED1
    ld   de,$C34F                   ; 11:5ED4
    ld   b,$06                      ; 11:5ED7
Code115ED9:
    ld   a,[de]                     ; 11:5ED9
    ldi  [hl],a                     ; 11:5EDA
    inc  hl                         ; 11:5EDB
    inc  de                         ; 11:5EDC
    dec  b                          ; 11:5EDD
    jr   nz,Code115ED9              ; 11:5EDE
    ld   de,$C19E                   ; 11:5EE0
    call Sub003DFB                  ; 11:5EE3
    ld   hl,$DF2B                   ; 11:5EE6
    ld   de,$C351                   ; 11:5EE9
    ld   b,$04                      ; 11:5EEC
Code115EEE:
    ld   a,[de]                     ; 11:5EEE
    ldi  [hl],a                     ; 11:5EEF
    inc  hl                         ; 11:5EF0
    inc  de                         ; 11:5EF1
    dec  b                          ; 11:5EF2
    jr   nz,Code115EEE              ; 11:5EF3
    ld   hl,H_GameSubstate          ; 11:5EF5
    inc  [hl]                       ; 11:5EF8
    ret                             ; 11:5EF9

Code115EFA:
; Overworld init / Challenge results substate 2
    ld   hl,W_TilemapUploadBuffer   ; 11:5EFA
    ld   de,Data115BDE              ; 11:5EFD
    ld   b,$1F                      ; 11:5F00
Code115F02:
    ld   a,[de]                     ; 11:5F02
    ldi  [hl],a                     ; 11:5F03
    inc  de                         ; 11:5F04
    dec  b                          ; 11:5F05
    jr   nz,Code115F02              ; 11:5F06
    ld   a,[$C189]                  ; 11:5F08
    cp   $05                        ; 11:5F0B
    jr   c,Code115F21               ; 11:5F0D
    ld   hl,$DF05                   ; 11:5F0F
    ld   [hl],$46                   ; 11:5F12
    inc  hl                         ; 11:5F14
    inc  hl                         ; 11:5F15
    ld   [hl],$47                   ; 11:5F16
    ld   hl,$DF14                   ; 11:5F18
    ld   [hl],$56                   ; 11:5F1B
    inc  hl                         ; 11:5F1D
    inc  hl                         ; 11:5F1E
    ld   [hl],$57                   ; 11:5F1F
Code115F21:
    ld   a,[$C18D]                  ; 11:5F21
    and  a                          ; 11:5F24
    jr   z,Code115F39               ; 11:5F25
    ld   hl,$DF09                   ; 11:5F27
    ld   [hl],$48                   ; 11:5F2A
    inc  hl                         ; 11:5F2C
    inc  hl                         ; 11:5F2D
    ld   [hl],$49                   ; 11:5F2E
    ld   hl,$DF18                   ; 11:5F30
    ld   [hl],$58                   ; 11:5F33
    inc  hl                         ; 11:5F35
    inc  hl                         ; 11:5F36
    ld   [hl],$59                   ; 11:5F37
Code115F39:
    ld   a,[$C194]                  ; 11:5F39
    and  a                          ; 11:5F3C
    jr   z,Code115F51               ; 11:5F3D
    ld   hl,$DF0D                   ; 11:5F3F
    ld   [hl],$4A                   ; 11:5F42
    inc  hl                         ; 11:5F44
    inc  hl                         ; 11:5F45
    ld   [hl],$4B                   ; 11:5F46
    ld   hl,$DF1C                   ; 11:5F48
    ld   [hl],$5A                   ; 11:5F4B
    inc  hl                         ; 11:5F4D
    inc  hl                         ; 11:5F4E
    ld   [hl],$5B                   ; 11:5F4F
Code115F51:
    ld   hl,H_GameSubstate          ; 11:5F51
    inc  [hl]                       ; 11:5F54
    inc  [hl]                       ; 11:5F55
    inc  [hl]                       ; 11:5F56
    ret                             ; 11:5F57

Code115F58:
; Overworld init substate 3
    ld   a,[$C1B7]                  ; 11:5F58
    cp   $01                        ; 11:5F5B
    jp   nz,Code115F6F              ; 11:5F5D
    ld   de,W_TilemapUploadBuffer   ; 11:5F60
    ld   hl,Data115C2A              ; 11:5F63
    ld   bc,$0010                   ; 11:5F66
    call CopyBytes                  ; 11:5F69
    jp   Code116004                 ; 11:5F6C
Code115F6F:
    ld   hl,Data115BFD              ; 11:5F6F
    ld   de,W_TilemapUploadBuffer   ; 11:5F72
    ld   bc,$002D                   ; 11:5F75
    call CopyBytes                  ; 11:5F78
    ld   de,$C1A9                   ; 11:5F7B
    ld   a,$05                      ; 11:5F7E
    ldh  [<$FFA2],a                 ; 11:5F80
    ld   a,$04                      ; 11:5F82
    ldh  [<$FFA3],a                 ; 11:5F84
Code115F86:
    ldh  a,[<$FFA2]                 ; 11:5F86
    ld   c,a                        ; 11:5F88
    ld   b,$00                      ; 11:5F89
    ld   hl,$DF00                   ; 11:5F8B
    add  hl,bc                      ; 11:5F8E
    ld   a,[de]                     ; 11:5F8F
    ld   c,a                        ; 11:5F90
    push de                         ; 11:5F91
    ldh  a,[<$FFA5]                 ; 11:5F92
    ld   e,a                        ; 11:5F94
    ldh  a,[<$FFA4]                 ; 11:5F95
    ld   d,a                        ; 11:5F97
    ld   a,[de]                     ; 11:5F98
    ld   b,a                        ; 11:5F99
    pop  de                         ; 11:5F9A
    ld   a,$04                      ; 11:5F9B
    ldh  [<$FFA6],a                 ; 11:5F9D
Code115F9F:
    xor  a                          ; 11:5F9F
    ldh  [<$FFA1],a                 ; 11:5FA0
    rrc  c                          ; 11:5FA2
    jr   nc,Code115FAA              ; 11:5FA4
    ld   a,$10                      ; 11:5FA6
    ldh  [<$FFA1],a                 ; 11:5FA8
Code115FAA:
    rrc  c                          ; 11:5FAA
    jr   nc,Code115FB3              ; 11:5FAC
    ldh  a,[<$FFA1]                 ; 11:5FAE
    inc  a                          ; 11:5FB0
    ldh  [<$FFA1],a                 ; 11:5FB1
Code115FB3:
    ldh  a,[<$FFA1]                 ; 11:5FB3
    cp   $11                        ; 11:5FB5
    jr   z,Code115FC3               ; 11:5FB7
    cp   $01                        ; 11:5FB9
    jr   z,Code115FC7               ; 11:5FBB
    cp   $10                        ; 11:5FBD
    jr   z,Code115FCB               ; 11:5FBF
    jr   Code115FD8                 ; 11:5FC1
Code115FC3:
    ld   a,$8F                      ; 11:5FC3
    jr   Code115FCD                 ; 11:5FC5
Code115FC7:
    ld   a,$8E                      ; 11:5FC7
    jr   Code115FCD                 ; 11:5FC9
Code115FCB:
    ld   a,$8C                      ; 11:5FCB
Code115FCD:
    ld   [hl],a                     ; 11:5FCD
    ldh  a,[<$FFA3]                 ; 11:5FCE
    cp   $01                        ; 11:5FD0
    jr   nz,Code115FD8              ; 11:5FD2
    ld   a,$10                      ; 11:5FD4
    add  [hl]                       ; 11:5FD6
    ld   [hl],a                     ; 11:5FD7
Code115FD8:
    push de                         ; 11:5FD8
    ld   de,$000B                   ; 11:5FD9
    add  hl,de                      ; 11:5FDC
    pop  de                         ; 11:5FDD
    ldh  a,[<$FFA6]                 ; 11:5FDE
    dec  a                          ; 11:5FE0
    ldh  [<$FFA6],a                 ; 11:5FE1
    jp   nz,Code115F9F              ; 11:5FE3
    inc  de                         ; 11:5FE6
    push de                         ; 11:5FE7
    ldh  a,[<$FFA5]                 ; 11:5FE8
    ld   e,a                        ; 11:5FEA
    ldh  a,[<$FFA4]                 ; 11:5FEB
    ld   d,a                        ; 11:5FED
    inc  de                         ; 11:5FEE
    ld   a,d                        ; 11:5FEF
    ldh  [<$FFA4],a                 ; 11:5FF0
    ld   a,e                        ; 11:5FF2
    ldh  [<$FFA5],a                 ; 11:5FF3
    pop  de                         ; 11:5FF5
    ldh  a,[<$FFA2]                 ; 11:5FF6
    add  $02                        ; 11:5FF8
    ldh  [<$FFA2],a                 ; 11:5FFA
    ldh  a,[<$FFA3]                 ; 11:5FFC
    dec  a                          ; 11:5FFE
    ldh  [<$FFA3],a                 ; 11:5FFF
    jp   nz,Code115F86              ; 11:6001
Code116004:
    ld   hl,H_GameSubstate          ; 11:6004
    inc  [hl]                       ; 11:6007
    ret                             ; 11:6008

Code116009:
; Overworld init substate 4
    call CalcSPAdjustedLevelID      ; 11:6009  de = adjusted level ID
    ld   a,e                        ; 11:600C
    and  $1C                        ; 11:600D
    ld   e,a                        ; 11:600F
    srl  a                          ; 11:6010
    add  e                          ; 11:6012
    ld   e,a                        ; 11:6013
    ld   d,$00                      ; 11:6014
    ld   hl,Data115C3A              ; 11:6016
    add  hl,de                      ; 11:6019
    ld   e,l                        ; 11:601A
    ld   d,h                        ; 11:601B
    ld   a,[W_LevelID]              ; 11:601C
    and  $03                        ; 11:601F
    ld   b,a                        ; 11:6021
    ld   hl,W_TilemapUploadBuffer   ; 11:6022
Code116025:
    ld   a,b                        ; 11:6025
    and  a                          ; 11:6026
    jr   z,Code11603B               ; 11:6027
    ld   a,[de]                     ; 11:6029
    ldi  [hl],a                     ; 11:602A
    inc  de                         ; 11:602B
    ld   a,[de]                     ; 11:602C
    ldi  [hl],a                     ; 11:602D
    inc  de                         ; 11:602E
    ld   [hl],$01                   ; 11:602F
    inc  hl                         ; 11:6031
    ld   [hl],$06                   ; 11:6032
    inc  hl                         ; 11:6034
    ld   [hl],$1E                   ; 11:6035
    inc  hl                         ; 11:6037
    dec  b                          ; 11:6038
    jr   Code116025                 ; 11:6039
Code11603B:
    ld   [hl],$00                   ; 11:603B
    ld   hl,H_GameSubstate          ; 11:603D
    inc  [hl]                       ; 11:6040
    ret                             ; 11:6041

OWLevelYCoords:                     ; 11:6042
.db $48,$40,$50,$48,$38,$38,$58,$58,\
    $48,$50,$58,$58,$58,$60,$48,$50,\
    $50,$30,$30,$58,$48,$40,$40,$40,\
    $48,$38,$58,$50,$58,$48,$38,$38
OWLevelXCoords:                     ; 11:6062
.db $0C,$34,$5C,$88,$1C,$64,$5C,$80,\
    $14,$34,$64,$88,$1C,$3C,$5C,$88,\
    $24,$2C,$64,$78,$0C,$34,$5C,$88,\
    $14,$3C,$5C,$88,$64,$4C,$34,$68
OWPlayerPathY_1_1:                  ; 11:6082
.db $48,$48
OWPlayerPathY_1_2:                  ; 11:6084
.db $48,$48,$40,$40
OWPlayerPathY_1_3:                  ; 11:6088
.db $50,$50
OWPlayerPathY_1_4:                  ; 11:608A
.db $50,$50,$48,$48
OWPlayerPathY_2_1:                  ; 11:608E
.db $40,$40,$38,$38
OWPlayerPathY_2_2:                  ; 11:6092
.db $38,$38
OWPlayerPathY_2_3:                  ; 11:6094
.db $58,$58
OWPlayerPathY_2_4:                  ; 11:6096
.db $58,$58
OWPlayerPathY_3_1:                  ; 11:6098
.db $48,$48
OWPlayerPathY_3_2:                  ; 11:609A
.db $48,$48,$50,$50
OWPlayerPathY_3_3:                  ; 11:609E
.db $50,$50,$58,$58
OWPlayerPathY_3_4:                  ; 11:60A2
.db $58,$58
OWPlayerPathY_4_1:                  ; 11:60A4
.db $48,$48,$58
OWPlayerPathY_4_2:                  ; 11:60A7
.db $58,$58,$60,$60
OWPlayerPathY_4_3:                  ; 11:60AB
.db $38,$48,$48
OWPlayerPathY_4_4:                  ; 11:60AE
.db $48,$48,$50,$50
OWPlayerPathY_5_1:                  ; 11:60B2
.db $48,$48,$50,$50
OWPlayerPathY_5_2:                  ; 11:60B6
.db $50,$50,$48,$40,$40,$30,$30
OWPlayerPathY_5_3:                  ; 11:60BD
.db $30,$30
OWPlayerPathY_5_4:                  ; 11:60BF
.db $30,$30,$48,$48,$50,$58,$58
OWPlayerPathY_6_1:                  ; 11:60C6
.db $48,$48
OWPlayerPathY_6_2:                  ; 11:60C8
.db $48,$48,$40,$40
OWPlayerPathY_6_3:                  ; 11:60CC
.db $40,$40
OWPlayerPathY_6_4:                  ; 11:60CE
.db $40,$40
OWPlayerPathY_7_1:                  ; 11:60D0
.db $48,$48
OWPlayerPathY_7_2:                  ; 11:60D2
.db $48,$38,$38
OWPlayerPathY_7_3:                  ; 11:60D5
.db $58,$58
OWPlayerPathY_7_4:                  ; 11:60D7
.db $58,$58,$50,$50
OWPlayerPathY_8_1:                  ; 11:60DB
.db $48,$48,$58,$58
OWPlayerPathY_8_2:                  ; 11:60DF
.db $58,$58,$50,$48,$48
OWPlayerPathY_8_3:                  ; 11:60E4
.db $48,$48,$40,$38,$38
OWPlayerPathY_8_4:                  ; 11:60E9
.db $38,$38
OWPlayerPathX_1_1:                  ; 11:60EB
.db $04,$0C
OWPlayerPathX_1_2:                  ; 11:60ED
.db $0C,$1C,$24,$34
OWPlayerPathX_1_3:                  ; 11:60F1
.db $2C,$5C
OWPlayerPathX_1_4:                  ; 11:60F3
.db $5C,$74,$7C,$88
OWPlayerPathX_2_1:                  ; 11:60F7
.db $04,$0C,$14,$1C
OWPlayerPathX_2_2:                  ; 11:60FB
.db $1C,$64
OWPlayerPathX_2_3:                  ; 11:60FD
.db $44,$5C
OWPlayerPathX_2_4:                  ; 11:60FF
.db $5C,$80
OWPlayerPathX_3_1:                  ; 11:6101
.db $04,$14
OWPlayerPathX_3_2:                  ; 11:6103
.db $14,$1C,$24,$34
OWPlayerPathX_3_3:                  ; 11:6107
.db $34,$3C,$44,$64
OWPlayerPathX_3_4:                  ; 11:610B
.db $64,$88
OWPlayerPathX_4_1:                  ; 11:610D
.db $04,$0C,$1C
OWPlayerPathX_4_2:                  ; 11:6110
.db $1C,$2C,$34,$3C
OWPlayerPathX_4_3:                  ; 11:6114
.db $34,$44,$5C
OWPlayerPathX_4_4:                  ; 11:6117
.db $5C,$7C,$84,$88
OWPlayerPathX_5_1:                  ; 11:611B
.db $04,$0C,$14,$24
OWPlayerPathX_5_2:                  ; 11:611F
.db $24,$2C,$34,$2C,$24,$14,$2C
OWPlayerPathX_5_3:                  ; 11:6126
.db $2C,$64
OWPlayerPathX_5_4:                  ; 11:6128
.db $64,$8C,$74,$6C,$64,$6C,$78
OWPlayerPathX_6_1:                  ; 11:612F
.db $04,$0C
OWPlayerPathX_6_2:                  ; 11:6131
.db $0C,$1C,$24,$34
OWPlayerPathX_6_3:                  ; 11:6135
.db $34,$5C
OWPlayerPathX_6_4:                  ; 11:6137
.db $5C,$88
OWPlayerPathX_7_1:                  ; 11:6139
.db $04,$14
OWPlayerPathX_7_2:                  ; 11:613B
.db $14,$24,$3C
OWPlayerPathX_7_3:                  ; 11:613E
.db $44,$5C
OWPlayerPathX_7_4:                  ; 11:6140
.db $5C,$74,$7C,$88
OWPlayerPathX_8_1:                  ; 11:6144
.db $04,$14,$24,$64
OWPlayerPathX_8_2:                  ; 11:6148
.db $64,$6C,$74,$6C,$4C
OWPlayerPathX_8_3:                  ; 11:614D
.db $4C,$2C,$24,$2C,$34
OWPlayerPathX_8_4:                  ; 11:6152
.db $34,$68
OWPlayerPathYPtrs:                  ; 11:6154
.dw OWPlayerPathY_1_1, OWPlayerPathY_1_2, OWPlayerPathY_1_3, OWPlayerPathY_1_4,\
    OWPlayerPathY_2_1, OWPlayerPathY_2_2, OWPlayerPathY_2_3, OWPlayerPathY_2_4,\
    OWPlayerPathY_3_1, OWPlayerPathY_3_2, OWPlayerPathY_3_3, OWPlayerPathY_3_4,\
    OWPlayerPathY_4_1, OWPlayerPathY_4_2, OWPlayerPathY_4_3, OWPlayerPathY_4_4,\
    OWPlayerPathY_5_1, OWPlayerPathY_5_2, OWPlayerPathY_5_3, OWPlayerPathY_5_4,\
    OWPlayerPathY_6_1, OWPlayerPathY_6_2, OWPlayerPathY_6_3, OWPlayerPathY_6_4,\
    OWPlayerPathY_7_1, OWPlayerPathY_7_2, OWPlayerPathY_7_3, OWPlayerPathY_7_4,\
    OWPlayerPathY_8_1, OWPlayerPathY_8_2, OWPlayerPathY_8_3, OWPlayerPathY_8_4
OWPlayerPathXPtrs:                  ; 11:6194
.dw OWPlayerPathX_1_1, OWPlayerPathX_1_2, OWPlayerPathX_1_3, OWPlayerPathX_1_4,\
    OWPlayerPathX_2_1, OWPlayerPathX_2_2, OWPlayerPathX_2_3, OWPlayerPathX_2_4,\
    OWPlayerPathX_3_1, OWPlayerPathX_3_2, OWPlayerPathX_3_3, OWPlayerPathX_3_4,\
    OWPlayerPathX_4_1, OWPlayerPathX_4_2, OWPlayerPathX_4_3, OWPlayerPathX_4_4,\
    OWPlayerPathX_5_1, OWPlayerPathX_5_2, OWPlayerPathX_5_3, OWPlayerPathX_5_4,\
    OWPlayerPathX_6_1, OWPlayerPathX_6_2, OWPlayerPathX_6_3, OWPlayerPathX_6_4,\
    OWPlayerPathX_7_1, OWPlayerPathX_7_2, OWPlayerPathX_7_3, OWPlayerPathX_7_4,\
    OWPlayerPathX_8_1, OWPlayerPathX_8_2, OWPlayerPathX_8_3, OWPlayerPathX_8_4
Data1161D4:                         ; 11:61D4
.db $44,$40,$48

Sub1161D7:
; subroutine, called by overworld game state (05/08)
    ld   a,[$C1B7]                  ; 11:61D7
    and  $01                        ; 11:61DA
    rst  $00                        ; 11:61DC  Execute from 16-bit pointer table
.dw Code1161E1                      ; 11:61DD
.dw Code1163F5                      ; 11:61DF
Code1161E1:
    ldh  a,[<H_ButtonsPressed]      ; 11:61E1
    and  $04                        ; 11:61E3
    jr   z,Code1161F9               ; 11:61E5
    ld   a,$45                      ; 11:61E7
    ldh  [<$FFF2],a                 ; 11:61E9
    ld   a,[W_CurrentPlayer]        ; 11:61EB
    xor  $01                        ; 11:61EE
    ld   [W_CurrentPlayer],a        ; 11:61F0
    ld   a,$11                      ; 11:61F3
    rst  $10                        ; 11:61F5  24-bit call
.dl SubL_0B421E                     ; 11:61F6
Code1161F9:
    call Sub116231                  ; 11:61F9
    ld   a,[$C1C0]                  ; 11:61FC
    and  a                          ; 11:61FF
    jr   z,Code11621A               ; 11:6200
    ld   hl,$C061                   ; 11:6202
    ld   a,[hl]                     ; 11:6205
    add  $08                        ; 11:6206
    ld   [hl],a                     ; 11:6208
    ld   hl,$C063                   ; 11:6209
    ld   [hl],$24                   ; 11:620C
    ld   hl,$C065                   ; 11:620E
    ld   a,[hl]                     ; 11:6211
    sub  $08                        ; 11:6212
    ld   [hl],a                     ; 11:6214
    ld   hl,$C067                   ; 11:6215
    ld   [hl],$24                   ; 11:6218
Code11621A:
    ld   a,[W_ChallengeFlag]        ; 11:621A
    cp   $01                        ; 11:621D
    ret  z                          ; 11:621F
    call Sub116319                  ; 11:6220
    ld   a,[$C1B7]                  ; 11:6223
    and  a                          ; 11:6226
    ret  nz                         ; 11:6227
    ldh  a,[<H_GlobalTimer]         ; 11:6228
    and  $01                        ; 11:622A
    ret  nz                         ; 11:622C
    call Sub11627C                  ; 11:622D
    ret                             ; 11:6230

Sub116231:
    ld   a,[$C1B9]                  ; 11:6231
    ld   d,a                        ; 11:6234
    ld   a,[$C1BA]                  ; 11:6235
    ld   e,a                        ; 11:6238
    ld   a,[$C164]                  ; 11:6239
    dec  a                          ; 11:623C
    ld   [$C164],a                  ; 11:623D
    cp   $06                        ; 11:6240
    jr   nc,Code116249              ; 11:6242
    ld   a,$1F                      ; 11:6244
    ld   [$C164],a                  ; 11:6246
Code116249:
    and  $1F                        ; 11:6249
    cp   $14                        ; 11:624B
    jr   nc,Code11625B              ; 11:624D
    cp   $0E                        ; 11:624F
    jr   nc,Code116257              ; 11:6251
    ld   c,$02                      ; 11:6253
    jr   Code11625D                 ; 11:6255
Code116257:
    ld   c,$01                      ; 11:6257
    jr   Code11625D                 ; 11:6259
Code11625B:
    ld   c,$00                      ; 11:625B
Code11625D:
    ld   b,$00                      ; 11:625D
    ld   hl,Data1161D4              ; 11:625F
    add  hl,bc                      ; 11:6262
    ld   b,[hl]                     ; 11:6263
    ld   hl,$C060                   ; 11:6264
    ld   c,$02                      ; 11:6267
Code116269:
    ld   [hl],d                     ; 11:6269
    inc  hl                         ; 11:626A
    ld   [hl],e                     ; 11:626B
    inc  hl                         ; 11:626C
    ld   [hl],b                     ; 11:626D
    inc  hl                         ; 11:626E
    ld   [hl],$04                   ; 11:626F
    inc  hl                         ; 11:6271
    ld   a,e                        ; 11:6272
    add  $08                        ; 11:6273
    ld   e,a                        ; 11:6275
    inc  b                          ; 11:6276
    inc  b                          ; 11:6277
    dec  c                          ; 11:6278
    jr   nz,Code116269              ; 11:6279
    ret                             ; 11:627B

Sub11627C:
    ld   a,[$C1B9]                  ; 11:627C
    ld   b,a                        ; 11:627F
    ld   a,[$C1BD]                  ; 11:6280
    cp   b                          ; 11:6283
    jr   nz,Code1162EC              ; 11:6284
    ld   a,[$C1BA]                  ; 11:6286
    ld   b,a                        ; 11:6289
    ld   a,[$C1BE]                  ; 11:628A
    cp   b                          ; 11:628D
    jr   nz,Code1162EC              ; 11:628E
    call CalcSPAdjustedLevelID      ; 11:6290  de = adjusted level ID
    ld   hl,OWLevelYCoords          ; 11:6293
    add  hl,de                      ; 11:6296
    ld   a,[$C1B9]                  ; 11:6297
    cp   [hl]                       ; 11:629A
    jr   nz,Code1162AD              ; 11:629B
    ld   hl,OWLevelXCoords          ; 11:629D
    add  hl,de                      ; 11:62A0
    ld   a,[$C1BA]                  ; 11:62A1
    cp   [hl]                       ; 11:62A4
    jr   nz,Code1162AD              ; 11:62A5
    ld   a,$01                      ; 11:62A7
    ld   [$C1B8],a                  ; 11:62A9
    ret                             ; 11:62AC

Code1162AD:
    call CalcSPAdjustedLevelID      ; 11:62AD  de = adjusted level ID
    sla  e                          ; 11:62B0
    ld   c,e                        ; 11:62B2
    ld   b,d                        ; 11:62B3
    ld   hl,OWPlayerPathYPtrs       ; 11:62B4
    add  hl,bc                      ; 11:62B7
    ld   e,[hl]                     ; 11:62B8
    inc  hl                         ; 11:62B9
    ld   d,[hl]                     ; 11:62BA
    ld   hl,$C1BF                   ; 11:62BB
    inc  [hl]                       ; 11:62BE
    ld   a,[hl]                     ; 11:62BF
    ld   l,a                        ; 11:62C0
    ld   h,$00                      ; 11:62C1
    add  hl,de                      ; 11:62C3
    ld   a,[hl]                     ; 11:62C4
    ld   [$C1BD],a                  ; 11:62C5
    ld   hl,OWPlayerPathXPtrs       ; 11:62C8
    add  hl,bc                      ; 11:62CB
    ld   e,[hl]                     ; 11:62CC
    inc  hl                         ; 11:62CD
    ld   d,[hl]                     ; 11:62CE
    ld   a,[$C1BF]                  ; 11:62CF
    ld   l,a                        ; 11:62D2
    ld   h,$00                      ; 11:62D3
    add  hl,de                      ; 11:62D5
    ld   a,[$C1BE]                  ; 11:62D6
    ld   b,a                        ; 11:62D9
    ld   a,[hl]                     ; 11:62DA
    ld   [$C1BE],a                  ; 11:62DB
    cp   b                          ; 11:62DE
    jr   c,Code1162E7               ; 11:62DF
    xor  a                          ; 11:62E1
    ld   [$C1C0],a                  ; 11:62E2
    jr   Code1162EC                 ; 11:62E5
Code1162E7:
    ld   a,$01                      ; 11:62E7
    ld   [$C1C0],a                  ; 11:62E9
Code1162EC:
    ld   a,[$C1B9]                  ; 11:62EC
    ld   b,a                        ; 11:62EF
    ld   a,[$C1BD]                  ; 11:62F0
    cp   b                          ; 11:62F3
    jr   z,Code116302               ; 11:62F4
    jr   nc,Code1162FE              ; 11:62F6
    ld   hl,$C1B9                   ; 11:62F8
    dec  [hl]                       ; 11:62FB
    jr   Code116302                 ; 11:62FC
Code1162FE:
    ld   hl,$C1B9                   ; 11:62FE
    inc  [hl]                       ; 11:6301
Code116302:
    ld   a,[$C1BA]                  ; 11:6302
    ld   b,a                        ; 11:6305
    ld   a,[$C1BE]                  ; 11:6306
    cp   b                          ; 11:6309
    jr   z,Return116318             ; 11:630A
    jr   nc,Code116314              ; 11:630C
    ld   hl,$C1BA                   ; 11:630E
    dec  [hl]                       ; 11:6311
    jr   Return116318               ; 11:6312
Code116314:
    ld   hl,$C1BA                   ; 11:6314
    inc  [hl]                       ; 11:6317
Return116318:
    ret                             ; 11:6318

Sub116319:
    ldh  a,[<$FFA0]                 ; 11:6319
    dec  a                          ; 11:631B
    ldh  [<$FFA0],a                 ; 11:631C
    bit  5,a                        ; 11:631E
    jp   nz,Code11634D              ; 11:6320
    ld   hl,$C1A9                   ; 11:6323
    ld   a,[W_LevelID]              ; 11:6326
    and  $03                        ; 11:6329
    ld   c,a                        ; 11:632B
    ld   b,$00                      ; 11:632C
    add  hl,bc                      ; 11:632E
    ld   e,[hl]                     ; 11:632F
    ld   a,[W_LevelID]              ; 11:6330
    srl  a                          ; 11:6333
    srl  a                          ; 11:6335
    ld   c,a                        ; 11:6337
    ld   hl,BitTable8Asc_1152CA     ; 11:6338
    add  hl,bc                      ; 11:633B
    ld   a,[hl]                     ; 11:633C
    and  e                          ; 11:633D
    jr   z,Return11634C             ; 11:633E
    ldh  a,[<$FFA0]                 ; 11:6340
    and  $1F                        ; 11:6342
    cp   $1F                        ; 11:6344
    jr   nz,Return11634C            ; 11:6346
    ld   a,$6D                      ; 11:6348
    ldh  [<$FFF2],a                 ; 11:634A
Return11634C:
    ret                             ; 11:634C

Code11634D:
    ld   hl,$C1A9                   ; 11:634D
    ld   a,[W_LevelID]              ; 11:6350
    and  $03                        ; 11:6353
    ld   c,a                        ; 11:6355
    ld   b,$00                      ; 11:6356
    add  hl,bc                      ; 11:6358
    ld   a,[hl]                     ; 11:6359
    ldh  [<$FFA1],a                 ; 11:635A
    ld   a,[W_LevelID]              ; 11:635C
    srl  a                          ; 11:635F
    srl  a                          ; 11:6361
    ld   c,a                        ; 11:6363
    and  $01                        ; 11:6364
    ldh  [<$FFA6],a                 ; 11:6366
    ld   hl,BitTable8Asc_1152CA     ; 11:6368
    add  hl,bc                      ; 11:636B
    ld   d,[hl]                     ; 11:636C
    ldh  a,[<$FFA1]                 ; 11:636D
    and  d                          ; 11:636F
    jr   nz,Code11637E              ; 11:6370
    ldh  a,[<$FFA0]                 ; 11:6372
    and  $1F                        ; 11:6374
    cp   $1F                        ; 11:6376
    jr   nz,Code11637E              ; 11:6378
    ld   a,$6D                      ; 11:637A
    ldh  [<$FFF2],a                 ; 11:637C
Code11637E:
    res  0,c                        ; 11:637E
    ld   b,$00                      ; 11:6380
    ld   hl,BitTable8Asc_1152CA     ; 11:6382
    add  hl,bc                      ; 11:6385
    ld   d,[hl]                     ; 11:6386
    ld   e,$00                      ; 11:6387
    ldh  a,[<$FFA1]                 ; 11:6389
    and  d                          ; 11:638B
    jr   z,Code116390               ; 11:638C
    ld   e,$10                      ; 11:638E
Code116390:
    inc  hl                         ; 11:6390
    ld   d,[hl]                     ; 11:6391
    ldh  a,[<$FFA1]                 ; 11:6392
    and  d                          ; 11:6394
    jr   z,Code116398               ; 11:6395
    inc  e                          ; 11:6397
Code116398:
    ldh  a,[<$FFA6]                 ; 11:6398
    and  a                          ; 11:639A
    jr   nz,Code1163AC              ; 11:639B
    ld   a,e                        ; 11:639D
    cp   $10                        ; 11:639E
    jr   nc,Code1163A7              ; 11:63A0
    or   $10                        ; 11:63A2
    ld   e,a                        ; 11:63A4
    jr   Code1163B8                 ; 11:63A5
Code1163A7:
    and  $0F                        ; 11:63A7
    ld   e,a                        ; 11:63A9
    jr   Code1163B8                 ; 11:63AA
Code1163AC:
    ld   a,e                        ; 11:63AC
    and  $0F                        ; 11:63AD
    jr   nz,Code1163B4              ; 11:63AF
    inc  e                          ; 11:63B1
    jr   Code1163B8                 ; 11:63B2
Code1163B4:
    ld   a,e                        ; 11:63B4
    and  $F0                        ; 11:63B5
    ld   e,a                        ; 11:63B7
Code1163B8:
    ld   a,[W_LevelID]              ; 11:63B8
    and  $18                        ; 11:63BB
    add  $80                        ; 11:63BD
    ld   b,a                        ; 11:63BF
    ld   a,[W_LevelID]              ; 11:63C0
    and  $03                        ; 11:63C3
    sla  a                          ; 11:63C5
    sla  a                          ; 11:63C7
    sla  a                          ; 11:63C9
    add  $80                        ; 11:63CB
    ld   c,a                        ; 11:63CD
    ld   a,e                        ; 11:63CE
    cp   $11                        ; 11:63CF
    jr   z,Code1163DF               ; 11:63D1
    cp   $01                        ; 11:63D3
    jr   z,Code1163E3               ; 11:63D5
    cp   $10                        ; 11:63D7
    jr   z,Code1163E7               ; 11:63D9
    ld   d,$20                      ; 11:63DB
    jr   Code1163E9                 ; 11:63DD
Code1163DF:
    ld   d,$2C                      ; 11:63DF
    jr   Code1163E9                 ; 11:63E1
Code1163E3:
    ld   d,$2A                      ; 11:63E3
    jr   Code1163E9                 ; 11:63E5
Code1163E7:
    ld   d,$28                      ; 11:63E7
Code1163E9:
    ld   hl,$C068                   ; 11:63E9
    ld   [hl],b                     ; 11:63EC
    inc  hl                         ; 11:63ED
    ld   [hl],c                     ; 11:63EE
    inc  hl                         ; 11:63EF
    ld   [hl],d                     ; 11:63F0
    inc  hl                         ; 11:63F1
    ld   [hl],$01                   ; 11:63F2
    ret                             ; 11:63F4

Code1163F5:
    ld   a,[$C168]                  ; 11:63F5
    rst  $00                        ; 11:63F8  Execute from 16-bit pointer table
.dw Code116401                      ; 11:63F9
.dw Code11645A                      ; 11:63FB
.dw Code1164C8                      ; 11:63FD
.dw Code116561                      ; 11:63FF
Code116401:
    ld   a,[$C326]                  ; 11:6401
    dec  a                          ; 11:6404
    ld   [$C326],a                  ; 11:6405
    cp   $18                        ; 11:6408
    jr   nc,Code116425              ; 11:640A
    and  $03                        ; 11:640C
    cp   $03                        ; 11:640E
    jr   nz,Code116416              ; 11:6410
    ld   hl,$C1BB                   ; 11:6412
    inc  [hl]                       ; 11:6415
Code116416:
    ld   hl,$C1B9                   ; 11:6416
    ld   a,[$C1BB]                  ; 11:6419
    add  [hl]                       ; 11:641C
    ld   [hl],a                     ; 11:641D
    ld   b,$4C                      ; 11:641E
    call Sub1165C2                  ; 11:6420
    jr   Code116442                 ; 11:6423
Code116425:
    ld   b,$10                      ; 11:6425
    call Sub1165C2                  ; 11:6427
    ld   hl,$C061                   ; 11:642A
    ld   a,[hl]                     ; 11:642D
    add  $08                        ; 11:642E
    ld   [hl],a                     ; 11:6430
    ld   hl,$C063                   ; 11:6431
    ld   [hl],$24                   ; 11:6434
    ld   hl,$C065                   ; 11:6436
    ld   a,[hl]                     ; 11:6439
    sub  $08                        ; 11:643A
    ld   [hl],a                     ; 11:643C
    ld   hl,$C067                   ; 11:643D
    ld   [hl],$24                   ; 11:6440
Code116442:
    ld   a,[$C326]                  ; 11:6442
    and  a                          ; 11:6445
    ret  nz                         ; 11:6446
    ld   a,$43                      ; 11:6447
    ldh  [<$FFF2],a                 ; 11:6449
    ld   a,$FE                      ; 11:644B
    ld   [$C1BB],a                  ; 11:644D
    ld   a,$28                      ; 11:6450
    ld   [$C326],a                  ; 11:6452
    ld   hl,$C168                   ; 11:6455
    inc  [hl]                       ; 11:6458
    ret                             ; 11:6459

Code11645A:
    ld   a,[$C326]                  ; 11:645A
    dec  a                          ; 11:645D
    ld   [$C326],a                  ; 11:645E
    cp   $13                        ; 11:6461
    jr   z,Code11646D               ; 11:6463
    cp   $12                        ; 11:6465
    jr   z,Code11646D               ; 11:6467
    cp   $00                        ; 11:6469
    jr   nz,Code116471              ; 11:646B
Code11646D:
    ld   a,$43                      ; 11:646D
    ldh  [<$FFF2],a                 ; 11:646F
Code116471:
    ld   a,[$C326]                  ; 11:6471
    ld   b,a                        ; 11:6474
    cp   $20                        ; 11:6475
    jr   nc,Code116487              ; 11:6477
    cp   $14                        ; 11:6479
    jr   nc,Code11648F              ; 11:647B
    cp   $0C                        ; 11:647D
    jr   nc,Code116483              ; 11:647F
    jr   Code11648F                 ; 11:6481
Code116483:
    ld   a,$13                      ; 11:6483
    jr   Code116489                 ; 11:6485
Code116487:
    ld   a,$27                      ; 11:6487
Code116489:
    sub  b                          ; 11:6489
    inc  a                          ; 11:648A
    ld   b,a                        ; 11:648B
    call Sub1165E0                  ; 11:648C
Code11648F:
    ld   hl,$C1B9                   ; 11:648F
    ld   a,[$C1BB]                  ; 11:6492
    add  [hl]                       ; 11:6495
    ld   [hl],a                     ; 11:6496
    ld   b,$4C                      ; 11:6497
    call Sub1165C2                  ; 11:6499
    ld   a,[$C326]                  ; 11:649C
    and  a                          ; 11:649F
    jr   z,Code1164B7               ; 11:64A0
    and  $03                        ; 11:64A2
    ret  nz                         ; 11:64A4
    ld   a,[$C1BB]                  ; 11:64A5
    cp   $02                        ; 11:64A8
    jr   nz,Code1164B2              ; 11:64AA
    ld   a,$FE                      ; 11:64AC
    ld   [$C1BB],a                  ; 11:64AE
    ret                             ; 11:64B1

Code1164B2:
    inc  a                          ; 11:64B2
    ld   [$C1BB],a                  ; 11:64B3
    ret                             ; 11:64B6

Code1164B7:
    ld   a,$50                      ; 11:64B7
    ld   [$C326],a                  ; 11:64B9
    ld   a,$FD                      ; 11:64BC
    ld   [$C1BB],a                  ; 11:64BE
    ld   a,$20                      ; 11:64C1
    ld   hl,$C168                   ; 11:64C3
    inc  [hl]                       ; 11:64C6
    ret                             ; 11:64C7

Code1164C8:
    ld   a,[$C326]                  ; 11:64C8
    dec  a                          ; 11:64CB
    ld   [$C326],a                  ; 11:64CC
    cp   $4F                        ; 11:64CF
    jr   nz,Code1164D7              ; 11:64D1
    ld   a,$43                      ; 11:64D3
    ldh  [<$FFF2],a                 ; 11:64D5
Code1164D7:
    ld   a,[$C326]                  ; 11:64D7
    cp   $38                        ; 11:64DA
    jr   c,Code11652B               ; 11:64DC
    and  $03                        ; 11:64DE
    cp   $03                        ; 11:64E0
    jr   nz,Code1164E8              ; 11:64E2
    ld   hl,$C1BB                   ; 11:64E4
    inc  [hl]                       ; 11:64E7
Code1164E8:
    ld   a,[$C326]                  ; 11:64E8
    cp   $48                        ; 11:64EB
    jr   c,Code1164F9               ; 11:64ED
    and  $07                        ; 11:64EF
    ld   b,a                        ; 11:64F1
    ld   a,$08                      ; 11:64F2
    sub  b                          ; 11:64F4
    ld   b,a                        ; 11:64F5
    call Sub1165E0                  ; 11:64F6
Code1164F9:
    call CalcSPAdjustedLevelID      ; 11:64F9  de = adjusted level ID
    ld   hl,OWLevelXCoords          ; 11:64FC
    add  hl,de                      ; 11:64FF
    ld   a,[hl]                     ; 11:6500
    add  $10                        ; 11:6501
    ld   e,a                        ; 11:6503
    ld   a,[$C326]                  ; 11:6504
    and  $01                        ; 11:6507
    jr   nz,Code11651F              ; 11:6509
    ld   hl,$C1BA                   ; 11:650B
    inc  [hl]                       ; 11:650E
    ld   a,[$C326]                  ; 11:650F
    bit  1,a                        ; 11:6512
    jr   z,Code116517               ; 11:6514
    inc  [hl]                       ; 11:6516
Code116517:
    ld   a,[hl]                     ; 11:6517
    cp   e                          ; 11:6518
    jr   c,Code11651C               ; 11:6519
    ld   a,e                        ; 11:651B
Code11651C:
    ld   [$C1BA],a                  ; 11:651C
Code11651F:
    ld   hl,$C1B9                   ; 11:651F
    ld   a,[$C1BB]                  ; 11:6522
    add  [hl]                       ; 11:6525
    ld   [hl],a                     ; 11:6526
    ld   b,$4C                      ; 11:6527
    jr   Code11654C                 ; 11:6529
Code11652B:
    ld   bc,Data116643              ; 11:652B
    ld   a,[$C326]                  ; 11:652E
    cp   $20                        ; 11:6531
    jr   nc,Code11654A              ; 11:6533
    cp   $18                        ; 11:6535
    jr   nc,Code11653C              ; 11:6537
    ld   bc,Data11664B              ; 11:6539
Code11653C:
    call Sub116663                  ; 11:653C
    ld   a,[$C326]                  ; 11:653F
    and  $0F                        ; 11:6542
    jr   nz,Code11654A              ; 11:6544
    ld   a,$41                      ; 11:6546
    ldh  [<$FFF4],a                 ; 11:6548
Code11654A:
    ld   b,$10                      ; 11:654A
Code11654C:
    call Sub1165C2                  ; 11:654C
    ld   a,[$C326]                  ; 11:654F
    and  a                          ; 11:6552
    ret  nz                         ; 11:6553
    call Sub11669D                  ; 11:6554
    ld   a,$90                      ; 11:6557
    ld   [$C326],a                  ; 11:6559
    ld   hl,$C168                   ; 11:655C
    inc  [hl]                       ; 11:655F
    ret                             ; 11:6560

Code116561:
    ld   a,[$C326]                  ; 11:6561
    dec  a                          ; 11:6564
    ld   [$C326],a                  ; 11:6565
    cp   $78                        ; 11:6568
    jr   nc,Code116575              ; 11:656A
    cp   $60                        ; 11:656C
    jr   c,Code116586               ; 11:656E
    ld   bc,Data11665B              ; 11:6570
    jr   Code116583                 ; 11:6573
Code116575:
    ld   bc,Data116653              ; 11:6575
    ld   a,[$C326]                  ; 11:6578
    and  $0F                        ; 11:657B
    jr   nz,Code116583              ; 11:657D
    ld   a,$41                      ; 11:657F
    ldh  [<$FFF4],a                 ; 11:6581
Code116583:
    call Sub116663                  ; 11:6583
Code116586:
    ld   b,$10                      ; 11:6586
    call Sub1165C2                  ; 11:6588
    ld   a,[$C326]                  ; 11:658B
    cp   $28                        ; 11:658E
    jr   nc,Code1165AA              ; 11:6590
    ld   hl,$C061                   ; 11:6592
    ld   a,[hl]                     ; 11:6595
    add  $08                        ; 11:6596
    ld   [hl],a                     ; 11:6598
    ld   hl,$C063                   ; 11:6599
    ld   [hl],$24                   ; 11:659C
    ld   hl,$C065                   ; 11:659E
    ld   a,[hl]                     ; 11:65A1
    sub  $08                        ; 11:65A2
    ld   [hl],a                     ; 11:65A4
    ld   hl,$C067                   ; 11:65A5
    ld   [hl],$24                   ; 11:65A8
Code1165AA:
    ld   a,[$C326]                  ; 11:65AA
    and  a                          ; 11:65AD
    ret  nz                         ; 11:65AE
    ld   a,[$C1AF]                  ; 11:65AF
    ld   [W_PlayerFireFlag],a       ; 11:65B2
    ld   hl,W_LevelID               ; 11:65B5
    inc  [hl]                       ; 11:65B8
    xor  a                          ; 11:65B9
    ld   [$C1B7],a                  ; 11:65BA
    ld   a,$04                      ; 11:65BD
    ldh  [<H_GameState],a           ; 11:65BF
    ret                             ; 11:65C1

Sub1165C2:
    ld   a,[$C1BA]                  ; 11:65C2
    ld   e,a                        ; 11:65C5
    ld   hl,$C060                   ; 11:65C6
    ld   c,$02                      ; 11:65C9
Code1165CB:
    ld   a,[$C1B9]                  ; 11:65CB
    ldi  [hl],a                     ; 11:65CE
    ld   [hl],e                     ; 11:65CF
    inc  hl                         ; 11:65D0
    ld   [hl],b                     ; 11:65D1
    inc  hl                         ; 11:65D2
    ld   [hl],$04                   ; 11:65D3
    inc  hl                         ; 11:65D5
    inc  b                          ; 11:65D6
    inc  b                          ; 11:65D7
    ld   a,e                        ; 11:65D8
    add  $08                        ; 11:65D9
    ld   e,a                        ; 11:65DB
    dec  c                          ; 11:65DC
    jr   nz,Code1165CB              ; 11:65DD
    ret                             ; 11:65DF

Sub1165E0:
    call CalcSPAdjustedLevelID      ; 11:65E0  de = adjusted level ID
    ld   hl,OWLevelYCoords          ; 11:65E3
    add  hl,de                      ; 11:65E6
    ld   a,[hl]                     ; 11:65E7
    sub  $04                        ; 11:65E8
    ld   c,a                        ; 11:65EA
    ld   hl,OWLevelXCoords          ; 11:65EB
    add  hl,de                      ; 11:65EE
    ld   a,[hl]                     ; 11:65EF
    add  $04                        ; 11:65F0
    ld   e,a                        ; 11:65F2
    ld   d,$7E                      ; 11:65F3
    ld   a,b                        ; 11:65F5
    cp   $05                        ; 11:65F6
    jr   c,Code1165FC               ; 11:65F8
    ld   d,$34                      ; 11:65FA
Code1165FC:
    ld   hl,$C06C                   ; 11:65FC
    ld   a,c                        ; 11:65FF
    sub  b                          ; 11:6600
    ldi  [hl],a                     ; 11:6601
    ld   a,e                        ; 11:6602
    sub  b                          ; 11:6603
    ldi  [hl],a                     ; 11:6604
    ld   [hl],d                     ; 11:6605
    inc  hl                         ; 11:6606
    ld   [hl],$00                   ; 11:6607
    inc  hl                         ; 11:6609
    ld   a,c                        ; 11:660A
    sub  b                          ; 11:660B
    ldi  [hl],a                     ; 11:660C
    ld   a,e                        ; 11:660D
    add  b                          ; 11:660E
    ldi  [hl],a                     ; 11:660F
    ld   [hl],d                     ; 11:6610
    inc  hl                         ; 11:6611
    ld   [hl],$00                   ; 11:6612
    inc  hl                         ; 11:6614
    ld   [hl],c                     ; 11:6615
    inc  hl                         ; 11:6616
    sla  b                          ; 11:6617
    ld   a,e                        ; 11:6619
    sub  b                          ; 11:661A
    ldi  [hl],a                     ; 11:661B
    ld   [hl],d                     ; 11:661C
    inc  hl                         ; 11:661D
    ld   [hl],$00                   ; 11:661E
    inc  hl                         ; 11:6620
    ld   [hl],c                     ; 11:6621
    inc  hl                         ; 11:6622
    ld   a,e                        ; 11:6623
    add  b                          ; 11:6624
    ldi  [hl],a                     ; 11:6625
    srl  b                          ; 11:6626
    ld   [hl],d                     ; 11:6628
    inc  hl                         ; 11:6629
    ld   [hl],$00                   ; 11:662A
    inc  hl                         ; 11:662C
    ld   a,c                        ; 11:662D
    add  b                          ; 11:662E
    ldi  [hl],a                     ; 11:662F
    ld   a,e                        ; 11:6630
    sub  b                          ; 11:6631
    ldi  [hl],a                     ; 11:6632
    ld   [hl],d                     ; 11:6633
    inc  hl                         ; 11:6634
    ld   [hl],$00                   ; 11:6635
    inc  hl                         ; 11:6637
    ld   a,c                        ; 11:6638
    add  b                          ; 11:6639
    ldi  [hl],a                     ; 11:663A
    ld   a,e                        ; 11:663B
    add  b                          ; 11:663C
    ldi  [hl],a                     ; 11:663D
    ld   [hl],d                     ; 11:663E
    inc  hl                         ; 11:663F
    ld   [hl],$00                   ; 11:6640
    ret                             ; 11:6642

Data116643:                         ; 11:6643
.db $14,$00,$16,$00,$18,$00,$1A,$00
Data11664B:                         ; 11:664B
.db $1C,$00,$1E,$00,$30,$00,$32,$00
Data116653:                         ; 11:6653
.db $1A,$20,$18,$20,$16,$20,$14,$20
Data11665B:                         ; 11:665B
.db $32,$20,$30,$20,$1E,$20,$1C,$20

Sub116663:
    call CalcSPAdjustedLevelID      ; 11:6663  de = adjusted level ID
    ld   hl,OWLevelYCoords          ; 11:6666
    add  hl,de                      ; 11:6669
    ld   a,[hl]                     ; 11:666A
    ldh  [<$FFA0],a                 ; 11:666B
    ld   hl,OWLevelXCoords          ; 11:666D
    add  hl,de                      ; 11:6670
    ld   a,[hl]                     ; 11:6671
    sub  $08                        ; 11:6672
    ld   e,a                        ; 11:6674
    ld   hl,$C070                   ; 11:6675
    ld   d,$04                      ; 11:6678
Code11667A:
    ldh  a,[<$FFA0]                 ; 11:667A
    ldi  [hl],a                     ; 11:667C
    ld   [hl],e                     ; 11:667D
    inc  hl                         ; 11:667E
    ld   a,[bc]                     ; 11:667F
    ldi  [hl],a                     ; 11:6680
    inc  bc                         ; 11:6681
    ld   a,[bc]                     ; 11:6682
    ldi  [hl],a                     ; 11:6683
    inc  bc                         ; 11:6684
    ld   a,e                        ; 11:6685
    add  $08                        ; 11:6686
    ld   e,a                        ; 11:6688
    dec  d                          ; 11:6689
    jr   nz,Code11667A              ; 11:668A
    ret                             ; 11:668C

Data11668D:                         ; 11:668D
.db $9A,$B0,$9A,$EF,$9A,$F0,$9A,$D0,\
    $9A,$EE,$9A,$90,$9A,$D0,$9A,$6C

Sub11669D:
    call CalcSPAdjustedLevelID      ; 11:669D  de = adjusted level ID
    ld   a,e                        ; 11:66A0
    and  $1C                        ; 11:66A1
    srl  a                          ; 11:66A3
    ld   e,a                        ; 11:66A5
    ld   hl,Data11668D              ; 11:66A6
    add  hl,de                      ; 11:66A9
    ldi  a,[hl]                     ; 11:66AA
    ld   d,a                        ; 11:66AB
    ld   a,[hl]                     ; 11:66AC
    ld   e,a                        ; 11:66AD
    ld   c,$28                      ; 11:66AE
    ld   hl,W_TilemapUploadBuffer   ; 11:66B0
    ld   b,$02                      ; 11:66B3
Code1166B5:
    ld   [hl],d                     ; 11:66B5
    inc  hl                         ; 11:66B6
    ld   [hl],e                     ; 11:66B7
    inc  hl                         ; 11:66B8
    ld   [hl],$02                   ; 11:66B9
    inc  hl                         ; 11:66BB
    ld   [hl],$01                   ; 11:66BC
    inc  hl                         ; 11:66BE
    ld   [hl],c                     ; 11:66BF
    inc  c                          ; 11:66C0
    inc  hl                         ; 11:66C1
    ld   [hl],$01                   ; 11:66C2
    inc  hl                         ; 11:66C4
    ld   [hl],c                     ; 11:66C5
    inc  hl                         ; 11:66C6
    ld   a,c                        ; 11:66C7
    add  $0F                        ; 11:66C8
    ld   c,a                        ; 11:66CA
    ld   a,e                        ; 11:66CB
    add  $20                        ; 11:66CC
    ld   e,a                        ; 11:66CE
    ld   a,d                        ; 11:66CF
    adc  $00                        ; 11:66D0
    ld   d,a                        ; 11:66D2
    dec  b                          ; 11:66D3
    jr   nz,Code1166B5              ; 11:66D4
    ld   [hl],$00                   ; 11:66D6
    ret                             ; 11:66D8

CalcSPAdjustedLevelID:
; subroutine: calculate adjusted level ID for Super Players overworld. Returned in DE.
    ld   a,[W_LevelID]              ; 11:66D9
    ld   e,a                        ; 11:66DC  e = levelID
    ld   a,[W_SPFlag]               ; 11:66DD
    and  a                          ; 11:66E0
    jr   z,@ReturnDE                ; 11:66E1  if not Super Players, return
    ld   a,e                        ; 11:66E3
    and  $1C                        ; 11:66E4  filter world number bits
    cp   $1C                        ; 11:66E6
    jr   z,@ReturnDE                ; 11:66E8  return if world 8 (level 1C-1F)
    cp   $00                        ; 11:66EA
    jr   z,@ReturnDE                ; 11:66EC  return if world 1 (level 00-03)
    bit  2,e                        ; 11:66EE \
    jr   nz,@Code1166F8             ; 11:66F0 | if world 3/5/7, return level ID - 4
    ld   a,e                        ; 11:66F2 /
    sub  $04                        ; 11:66F3
    ld   e,a                        ; 11:66F5
    jr   @ReturnDE                  ; 11:66F6
@Code1166F8:
    ld   a,e                        ; 11:66F8 \
    add  $04                        ; 11:66F9 | if world 2/4/6, return level ID + 4
    ld   e,a                        ; 11:66FB /
@ReturnDE:
    ld   d,$00                      ; 11:66FC
    ret                             ; 11:66FE

Data1166FF:                         ; 11:66FF
.db $99,$EC,$02,$06,$46,$06,$47,$9A,\
    $0C,$02,$06,$56,$06,$57,$00
Data11670E:                         ; 11:670E
.db $99,$EE,$02,$00,$48,$00,$49,$9A,\
    $0E,$02,$00,$58,$00,$59,$00
Data11671D:                         ; 11:671D
.db $99,$F0,$02,$07,$4A,$07,$4B,$9A,\
    $10,$02,$07,$5A,$07,$5B,$00
Data11672C:                         ; 11:672C
.db $9A,$67,$0C,$01,$2C,$01,$F2,$01,\
    $E8,$01,$EE,$01,$EB,$00,$F5,$00,\
    $F5,$00,$F5,$00,$F5,$00,$F5,$00,\
    $F5,$21,$2C,$9A,$87,$0C,$01,$3C,\
    $00,$F5,$00,$F5,$00,$F5,$01,$EB,\
    $01,$DE,$01,$EC,$01,$EE,$01,$E5,\
    $01,$ED,$01,$EC,$21,$3C,$9A,$AF,\
    $01,$01,$2B,$00
Data116768:                         ; 11:6768
.db $9A,$67,$0C,$01,$2C,$01,$DC,$01,\
    $E8,$01,$E2,$01,$E7,$01,$EC,$00,\
    $F5,$00,$F5,$00,$F5,$00,$F5,$00,\
    $F5,$21,$2C,$9A,$87,$0C,$01,$3C,\
    $00,$F5,$00,$F5,$00,$F5,$00,$F5,\
    $00,$F5,$00,$F5,$00,$F5,$00,$F5,\
    $00,$F5,$00,$F5,$21,$3C,$9A,$AF,\
    $01,$01,$2B,$00
Data1167A4:                         ; 11:67A4
.db $9A,$8D,$05,$00,$F5,$01,$E7,$01,\
    $E8,$01,$E7,$01,$DE,$00
Data1167B2:                         ; 11:67B2
.db $9A,$67,$0C,$01,$2C,$01,$EC,$01,\
    $DC,$01,$E8,$01,$EB,$01,$DE,$00,\
    $F5,$00,$F5,$00,$F5,$00,$F5,$00,\
    $F5,$21,$2C,$9A,$87,$0C,$01,$3C,\
    $00,$F5,$00,$F5,$00,$F5,$00,$F5,\
    $00,$F5,$00,$F5,$00,$F5,$00,$F5,\
    $00,$F5,$00,$F5,$21,$3C,$9A,$AF,\
    $01,$01,$2B,$00
Data1167EE:                         ; 11:67EE
.db $9A,$8B,$07,$00,$F5,$00,$F5,$00,\
    $F5,$00,$F5,$00,$F5,$00,$F5,$01,\
    $D0,$00
Data116800:                         ; 11:6800
.db $9A,$67,$0C,$01,$09,$01,$08,$01,\
    $09,$01,$08,$01,$05,$01,$06,$01,\
    $07,$01,$08,$01,$09,$01,$08,$01,\
    $09,$01,$08,$9A,$87,$0C,$01,$F7,\
    $01,$F7,$01,$F7,$01,$F7,$01,$15,\
    $01,$16,$01,$17,$01,$F7,$01,$F7,\
    $01,$F7,$01,$F7,$01,$F7,$9A,$AF,\
    $01,$01,$0D,$00
Data11683C:                         ; 11:683C
.db $9A,$67,$0C,$0B,$C1,$0B,$C2,$0B,\
    $C3,$0B,$C4,$0B,$C5,$00,$F4,$00,\
    $F4,$0B,$C0,$0B,$C1,$0B,$C2,$0B,\
    $C3,$0B,$B0,$9A,$87,$0C,$0B,$B8,\
    $0B,$B9,$0B,$BA,$0B,$BB,$0B,$BC,\
    $0B,$BD,$09,$BE,$2B,$B7,$0B,$B8,\
    $0B,$B9,$0B,$BA,$0B,$C9,$9A,$AF,\
    $01,$0B,$04,$00

ChalResultsInit_CallSubstate:
    ldh  a,[<H_GameSubstate]        ; 11:6878
    rst  $00                        ; 11:687A  Execute from 16-bit pointer table
.dw Code116881                      ; 11:687B
.dw Code115E47                      ; 11:687D
.dw Code115EFA                      ; 11:687F

Code116881:
; Challenge results init substate 0
    ld   a,:Gr_Bank1A               ; 11:6881
    ld   b,$11                      ; 11:6883
    call LoadGraphicsBank           ; 11:6885
    ld   a,[W_LevelID]              ; 11:6888
    and  $03                        ; 11:688B
    cp   $03                        ; 11:688D  test if level ID is x-4
    jr   nz,Code116896              ; 11:688F
    ld   de,Pal_ChalResultsCastle   ; 11:6891
    jr   Code116899                 ; 11:6894
Code116896:
    ld   de,Pal_ChalResultsNormal   ; 11:6896
Code116899:
    ld   a,:Pal_ChalResultsNormal   ; 11:6899
    ld   b,$11                      ; 11:689B
    call LoadFullPaletteLong        ; 11:689D
    ld   a,$11                      ; 11:68A0
    rst  $10                        ; 11:68A2  24-bit call
.dl SubL_0B421E                     ; 11:68A3
    call Sub00128D                  ; 11:68A6
    ld   a,[W_LevelID]              ; 11:68A9
    and  $03                        ; 11:68AC
    cp   $03                        ; 11:68AE  test if level ID is x-4
    jr   nz,Code1168B7              ; 11:68B0
    ld   hl,Ti_ChalResultsCastle    ; 11:68B2
    jr   Code1168BA                 ; 11:68B5
Code1168B7:
    ld   hl,Ti_ChalResultsNormal    ; 11:68B7
Code1168BA:
    ld   a,$1A                      ; 11:68BA
    ld   b,$11                      ; 11:68BC
    ld   de,$99C0                   ; 11:68BE
    call LoadScreenTilemapVRAM      ; 11:68C1
    ld   a,[W_LevelID]              ; 11:68C4
    ld   [W_SublevelID],a           ; 11:68C7
    ld   a,$60                      ; 11:68CA
    ld   [$C326],a                  ; 11:68CC
    ld   a,[$C196]                  ; 11:68CF
    ld   [$C168],a                  ; 11:68D2
    xor  a                          ; 11:68D5
    ld   [$C0C4],a                  ; 11:68D6
    ld   [$C290],a                  ; 11:68D9
    ld   [$C325],a                  ; 11:68DC
    ldh  [<H_CameraXLow],a          ; 11:68DF
    ldh  [<H_CameraXHigh],a         ; 11:68E1
    ldh  [<$FFBB],a                 ; 11:68E3
    ld   a,$70                      ; 11:68E5
    ldh  [<H_CameraY],a             ; 11:68E7
    ld   a,$4E                      ; 11:68E9
    ld   [$C1B9],a                  ; 11:68EB
    ld   a,$FD                      ; 11:68EE
    ld   [$C1BB],a                  ; 11:68F0
    ld   a,[$D30A]                  ; 11:68F3
    and  $1F                        ; 11:68F6
    ld   c,a                        ; 11:68F8
    ld   b,$00                      ; 11:68F9
    ld   d,$05                      ; 11:68FB
Code1168FD:
    rrc  c                          ; 11:68FD
    jr   nc,Code116902              ; 11:68FF
    inc  b                          ; 11:6901
Code116902:
    dec  d                          ; 11:6902
    jr   nz,Code1168FD              ; 11:6903
    ld   a,b                        ; 11:6905
    ld   [$C188],a                  ; 11:6906
    ld   a,$11                      ; 11:6909
    rst  $10                        ; 11:690B  24-bit call
.dl SubL_034148                     ; 11:690C
    ld   a,$11                      ; 11:690F
    rst  $10                        ; 11:6911  24-bit call
.dl SubL_034157                     ; 11:6912
    ld   a,$78                      ; 11:6915
    ld   [$DE68],a                  ; 11:6917
    ld   hl,H_GameSubstate          ; 11:691A
    inc  [hl]                       ; 11:691D
    ret                             ; 11:691E

ChallengeResultsMain:
; Game state 21
    ld   a,$11                      ; 11:691F
    rst  $10                        ; 11:6921  24-bit call
.dl SubL_034157                     ; 11:6922
    call Sub116DB7                  ; 11:6925
    ld   a,[$C168]                  ; 11:6928
    cp   $1A                        ; 11:692B
    jr   c,Code116938               ; 11:692D
    ld   a,[$C193]                  ; 11:692F
    and  a                          ; 11:6932
    jr   z,Code116938               ; 11:6933
    call Sub116D6C                  ; 11:6935
Code116938:
    call Sub116E4E                  ; 11:6938
    ld   a,[$C168]                  ; 11:693B
    rst  $00                        ; 11:693E  Execute from 16-bit pointer table
.dw Code116D5F                      ; 11:693F
.dw Code11697B                      ; 11:6941
.dw Code116D48                      ; 11:6943
.dw Code116D07                      ; 11:6945
.dw Code116D48                      ; 11:6947
.dw Code1169A1                      ; 11:6949
.dw Code116D48                      ; 11:694B
.dw Code1169C7                      ; 11:694D
.dw Code116D48                      ; 11:694F
.dw Code116A0C                      ; 11:6951
.dw Code116D48                      ; 11:6953
.dw Code116A5E                      ; 11:6955
.dw Code116D48                      ; 11:6957
.dw Code116D07                      ; 11:6959
.dw Code116D48                      ; 11:695B
.dw Code116A8D                      ; 11:695D
.dw Code116D48                      ; 11:695F
.dw Code116AB3                      ; 11:6961
.dw Code116D48                      ; 11:6963
.dw Code116AE4                      ; 11:6965
.dw Code116D48                      ; 11:6967
.dw Code116B8D                      ; 11:6969
.dw Code116D48                      ; 11:696B
.dw Code116D07                      ; 11:696D
.dw Code116D48                      ; 11:696F
.dw Code116BAF                      ; 11:6971
.dw Code116D48                      ; 11:6973
.dw Code116C71                      ; 11:6975
.dw Code116CAA                      ; 11:6977
.dw Code116CBE                      ; 11:6979
Code11697B:
    ld   hl,Data11672C              ; 11:697B
    ld   de,W_TilemapUploadBuffer   ; 11:697E
    ld   bc,$003C                   ; 11:6981
    call CopyBytes                  ; 11:6984
    ld   a,[W_LevelID]              ; 11:6987
    and  $03                        ; 11:698A
    cp   $03                        ; 11:698C
    jr   nz,Code116993              ; 11:698E
    call Sub116D2B                  ; 11:6990
Code116993:
    ld   a,$5F                      ; 11:6993
    ldh  [<$FFF2],a                 ; 11:6995
    ld   a,$80                      ; 11:6997
    ld   [$C326],a                  ; 11:6999
    ld   hl,$C168                   ; 11:699C
    inc  [hl]                       ; 11:699F
    ret                             ; 11:69A0

Code1169A1:
    ld   hl,Data116768              ; 11:69A1
    ld   de,W_TilemapUploadBuffer   ; 11:69A4
    ld   bc,$003C                   ; 11:69A7
    call CopyBytes                  ; 11:69AA
    ld   a,[W_LevelID]              ; 11:69AD
    and  $03                        ; 11:69B0
    cp   $03                        ; 11:69B2
    jr   nz,Code1169B9              ; 11:69B4
    call Sub116D2B                  ; 11:69B6
Code1169B9:
    ld   a,$5F                      ; 11:69B9
    ldh  [<$FFF2],a                 ; 11:69BB
    ld   a,$30                      ; 11:69BD
    ld   [$C326],a                  ; 11:69BF
    ld   hl,$C168                   ; 11:69C2
    inc  [hl]                       ; 11:69C5
    ret                             ; 11:69C6

Code1169C7:
    ld   hl,Data1167A4              ; 11:69C7
    ld   de,W_TilemapUploadBuffer   ; 11:69CA
    ld   bc,$000E                   ; 11:69CD
    call CopyBytes                  ; 11:69D0
    ld   a,[$C188]                  ; 11:69D3
    cp   $00                        ; 11:69D6
    jr   z,Code1169FE               ; 11:69D8
    cp   $05                        ; 11:69DA
    jr   c,Code1169E3               ; 11:69DC
    ld   a,$05                      ; 11:69DE
    ld   [$C188],a                  ; 11:69E0
Code1169E3:
    ld   b,a                        ; 11:69E3
    ld   d,$3B                      ; 11:69E4
    ld   e,$06                      ; 11:69E6
    ld   hl,$DF0D                   ; 11:69E8
    ld   c,$05                      ; 11:69EB
Code1169ED:
    ld   a,b                        ; 11:69ED
    cp   $00                        ; 11:69EE
    jr   nz,Code1169F6              ; 11:69F0
    ld   d,$F5                      ; 11:69F2
    ld   e,$00                      ; 11:69F4
Code1169F6:
    ld   [hl],d                     ; 11:69F6
    dec  hl                         ; 11:69F7
    ld   [hl],e                     ; 11:69F8
    dec  hl                         ; 11:69F9
    dec  b                          ; 11:69FA
    dec  c                          ; 11:69FB
    jr   nz,Code1169ED              ; 11:69FC
Code1169FE:
    ld   a,$5F                      ; 11:69FE
    ldh  [<$FFF2],a                 ; 11:6A00
    ld   a,$40                      ; 11:6A02
    ld   [$C326],a                  ; 11:6A04
    ld   hl,$C168                   ; 11:6A07
    inc  [hl]                       ; 11:6A0A
    ret                             ; 11:6A0B

Code116A0C:
    ld   a,[$C188]                  ; 11:6A0C
    ld   b,a                        ; 11:6A0F
    ld   a,[$C189]                  ; 11:6A10
    cp   b                          ; 11:6A13
    jr   nc,Code116A54              ; 11:6A14
    ld   a,[$C188]                  ; 11:6A16
    ld   [$C189],a                  ; 11:6A19
    cp   $05                        ; 11:6A1C
    jr   c,Code116A2A               ; 11:6A1E
    ld   a,[W_LevelID]              ; 11:6A20
    and  $1F                        ; 11:6A23
    or   $80                        ; 11:6A25
    ld   [$C197],a                  ; 11:6A27
Code116A2A:
    ld   hl,W_TilemapUploadBuffer   ; 11:6A2A
    ld   [hl],$9B                   ; 11:6A2D
    inc  hl                         ; 11:6A2F
    ld   [hl],$69                   ; 11:6A30
    inc  hl                         ; 11:6A32
    ld   [hl],$05                   ; 11:6A33
    inc  hl                         ; 11:6A35
    ld   d,$F4                      ; 11:6A36
    ld   c,$05                      ; 11:6A38
    ld   a,[$C189]                  ; 11:6A3A
    ld   b,a                        ; 11:6A3D
Code116A3E:
    ld   a,b                        ; 11:6A3E
    cp   $05                        ; 11:6A3F
    jr   nz,Code116A45              ; 11:6A41
    ld   d,$2E                      ; 11:6A43
Code116A45:
    ld   [hl],$06                   ; 11:6A45
    inc  hl                         ; 11:6A47
    ld   [hl],d                     ; 11:6A48
    inc  hl                         ; 11:6A49
    inc  b                          ; 11:6A4A
    dec  c                          ; 11:6A4B
    jr   nz,Code116A3E              ; 11:6A4C
    ld   [hl],$00                   ; 11:6A4E
    ld   a,$67                      ; 11:6A50
    ldh  [<$FFF2],a                 ; 11:6A52
Code116A54:
    ld   a,$40                      ; 11:6A54
    ld   [$C326],a                  ; 11:6A56
    ld   hl,$C168                   ; 11:6A59
    inc  [hl]                       ; 11:6A5C
    ret                             ; 11:6A5D

Code116A5E:
    ld   a,[$C188]                  ; 11:6A5E
    cp   $05                        ; 11:6A61
    jr   c,Code116A87               ; 11:6A63
    ld   de,W_TilemapUploadBuffer   ; 11:6A65
    ld   hl,Data1166FF              ; 11:6A68
    ld   bc,$000F                   ; 11:6A6B
    call CopyBytes                  ; 11:6A6E
    ld   a,$66                      ; 11:6A71
    ldh  [<$FFF2],a                 ; 11:6A73
    ld   a,$00                      ; 11:6A75
    ld   [$C325],a                  ; 11:6A77
    ld   a,$70                      ; 11:6A7A
    ld   [$C290],a                  ; 11:6A7C
    ld   [$C326],a                  ; 11:6A7F
    ld   hl,$C168                   ; 11:6A82
    inc  [hl]                       ; 11:6A85
    ret                             ; 11:6A86

Code116A87:
    ld   a,$0D                      ; 11:6A87
    ld   [$C168],a                  ; 11:6A89
    ret                             ; 11:6A8C

Code116A8D:
    ld   hl,Data1167B2              ; 11:6A8D
    ld   de,W_TilemapUploadBuffer   ; 11:6A90
    ld   bc,$003C                   ; 11:6A93
    call CopyBytes                  ; 11:6A96
    ld   a,[W_LevelID]              ; 11:6A99
    and  $03                        ; 11:6A9C
    cp   $03                        ; 11:6A9E
    jr   nz,Code116AA5              ; 11:6AA0
    call Sub116D2B                  ; 11:6AA2
Code116AA5:
    ld   a,$5F                      ; 11:6AA5
    ldh  [<$FFF2],a                 ; 11:6AA7
    ld   a,$30                      ; 11:6AA9
    ld   [$C326],a                  ; 11:6AAB
    ld   hl,$C168                   ; 11:6AAE
    inc  [hl]                       ; 11:6AB1
    ret                             ; 11:6AB2

Code116AB3:
    ld   hl,Data1167EE              ; 11:6AB3
    ld   de,W_TilemapUploadBuffer   ; 11:6AB6
    ld   bc,$0012                   ; 11:6AB9
    call CopyBytes                  ; 11:6ABC
    ld   de,$C17A                   ; 11:6ABF
    call Sub003DFB                  ; 11:6AC2
    ld   hl,$DF04                   ; 11:6AC5
    ld   de,$C34F                   ; 11:6AC8
    ld   b,$06                      ; 11:6ACB
Code116ACD:
    ld   [hl],$01                   ; 11:6ACD
    inc  hl                         ; 11:6ACF
    ld   a,[de]                     ; 11:6AD0
    ldi  [hl],a                     ; 11:6AD1
    inc  de                         ; 11:6AD2
    dec  b                          ; 11:6AD3
    jr   nz,Code116ACD              ; 11:6AD4
    ld   a,$5F                      ; 11:6AD6
    ldh  [<$FFF2],a                 ; 11:6AD8
    ld   a,$60                      ; 11:6ADA
    ld   [$C326],a                  ; 11:6ADC
    ld   hl,$C168                   ; 11:6ADF
    inc  [hl]                       ; 11:6AE2
    ret                             ; 11:6AE3

Code116AE4:
    ld   de,$C18C                   ; 11:6AE4
    ld   hl,$C17C                   ; 11:6AE7
    ld   c,$03                      ; 11:6AEA
Code116AEC:
    ld   a,[de]                     ; 11:6AEC
    ld   b,a                        ; 11:6AED
    ld   a,[hl]                     ; 11:6AEE
    cp   b                          ; 11:6AEF
    jp   c,Code116B82               ; 11:6AF0
    jr   nz,Code116AFA              ; 11:6AF3
    dec  de                         ; 11:6AF5
    dec  hl                         ; 11:6AF6
    dec  c                          ; 11:6AF7
    jr   nz,Code116AEC              ; 11:6AF8
Code116AFA:
    ld   a,[$C17A]                  ; 11:6AFA
    ld   [$C18A],a                  ; 11:6AFD
    ld   a,[$C17B]                  ; 11:6B00
    ld   [$C18B],a                  ; 11:6B03
    ld   a,[$C17C]                  ; 11:6B06
    ld   [$C18C],a                  ; 11:6B09
    ld   hl,W_TilemapUploadBuffer   ; 11:6B0C
    ld   [hl],$9B                   ; 11:6B0F
    inc  hl                         ; 11:6B11
    ld   [hl],$A7                   ; 11:6B12
    inc  hl                         ; 11:6B14
    ld   [hl],$06                   ; 11:6B15
    inc  hl                         ; 11:6B17
    ld   de,$C34F                   ; 11:6B18
    ld   b,$06                      ; 11:6B1B
Code116B1D:
    ld   [hl],$00                   ; 11:6B1D
    inc  hl                         ; 11:6B1F
    ld   a,[de]                     ; 11:6B20
    ldi  [hl],a                     ; 11:6B21
    inc  de                         ; 11:6B22
    dec  b                          ; 11:6B23
    jr   nz,Code116B1D              ; 11:6B24
    ld   [hl],$00                   ; 11:6B26
    ld   a,$67                      ; 11:6B28
    ldh  [<$FFF2],a                 ; 11:6B2A
    ld   a,[$C1A4]                  ; 11:6B2C
    cp   $3F                        ; 11:6B2F
    jr   nz,Code116B43              ; 11:6B31
    ld   a,[$C1A5]                  ; 11:6B33
    cp   $42                        ; 11:6B36
    jr   nz,Code116B43              ; 11:6B38
    ld   a,[$C1A6]                  ; 11:6B3A
    cp   $0F                        ; 11:6B3D
    jr   nz,Code116B43              ; 11:6B3F
    jr   Code116B48                 ; 11:6B41
Code116B43:
    ld   a,$01                      ; 11:6B43
    ld   [$C1A7],a                  ; 11:6B45
Code116B48:
    ld   a,[$C18D]                  ; 11:6B48
    and  a                          ; 11:6B4B
    jr   nz,Code116B78              ; 11:6B4C
    ld   de,$C1A0                   ; 11:6B4E
    ld   hl,$C18C                   ; 11:6B51
    ld   c,$03                      ; 11:6B54
Code116B56:
    ld   a,[de]                     ; 11:6B56
    ld   b,a                        ; 11:6B57
    ld   a,[hl]                     ; 11:6B58
    cp   b                          ; 11:6B59
    jp   c,Code116B82               ; 11:6B5A
    jr   nz,Code116B64              ; 11:6B5D
    dec  de                         ; 11:6B5F
    dec  hl                         ; 11:6B60
    dec  c                          ; 11:6B61
    jr   nz,Code116B56              ; 11:6B62
Code116B64:
    ld   a,$01                      ; 11:6B64
    ld   [$C18D],a                  ; 11:6B66
    ld   a,[W_LevelID]              ; 11:6B69
    and  $1F                        ; 11:6B6C
    or   $40                        ; 11:6B6E
    ld   b,a                        ; 11:6B70
    ld   a,[$C197]                  ; 11:6B71
    or   b                          ; 11:6B74
    ld   [$C197],a                  ; 11:6B75
Code116B78:
    ld   a,$40                      ; 11:6B78
    ld   [$C326],a                  ; 11:6B7A
    ld   hl,$C168                   ; 11:6B7D
    inc  [hl]                       ; 11:6B80
    ret                             ; 11:6B81

Code116B82:
    ld   a,$20                      ; 11:6B82
    ld   [$C326],a                  ; 11:6B84
    ld   a,$16                      ; 11:6B87
    ld   [$C168],a                  ; 11:6B89
    ret                             ; 11:6B8C

Code116B8D:
    ld   de,W_TilemapUploadBuffer   ; 11:6B8D
    ld   hl,Data11670E              ; 11:6B90
    ld   bc,$000F                   ; 11:6B93
    call CopyBytes                  ; 11:6B96
    ld   a,$66                      ; 11:6B99
    ldh  [<$FFF2],a                 ; 11:6B9B
    ld   a,$01                      ; 11:6B9D
    ld   [$C325],a                  ; 11:6B9F
    ld   a,$70                      ; 11:6BA2
    ld   [$C290],a                  ; 11:6BA4
    ld   [$C326],a                  ; 11:6BA7
    ld   hl,$C168                   ; 11:6BAA
    inc  [hl]                       ; 11:6BAD
    ret                             ; 11:6BAE

Code116BAF:
    ld   a,[$C193]                  ; 11:6BAF
    and  a                          ; 11:6BB2
    jr   nz,Code116BC0              ; 11:6BB3
    ld   a,$01                      ; 11:6BB5
    ld   [$C326],a                  ; 11:6BB7
    ld   a,$1C                      ; 11:6BBA
    ld   [$C168],a                  ; 11:6BBC
    ret                             ; 11:6BBF

Code116BC0:
    ldh  a,[<H_ButtonsPressed]      ; 11:6BC0
    and  $01                        ; 11:6BC2
    jr   z,Code116BD5               ; 11:6BC4
    xor  a                          ; 11:6BC6
    ld   [$C326],a                  ; 11:6BC7
    ld   a,$5C                      ; 11:6BCA
    ld   [$C1B9],a                  ; 11:6BCC
    ld   e,$54                      ; 11:6BCF
    ld   b,$58                      ; 11:6BD1
    jr   Code116C44                 ; 11:6BD3
Code116BD5:
    ld   e,$54                      ; 11:6BD5
    ld   b,$4C                      ; 11:6BD7
    ld   a,[$C326]                  ; 11:6BD9
    dec  a                          ; 11:6BDC
    ld   [$C326],a                  ; 11:6BDD
    cp   $F2                        ; 11:6BE0
    jr   nc,Code116C1D              ; 11:6BE2
    cp   $B8                        ; 11:6BE4
    jr   nc,Code116C44              ; 11:6BE6
    cp   $40                        ; 11:6BE8
    jr   nc,Code116C09              ; 11:6BEA
    cp   $28                        ; 11:6BEC
    jr   nc,Code116BF4              ; 11:6BEE
    ld   b,$58                      ; 11:6BF0
    jr   Code116C44                 ; 11:6BF2
Code116BF4:
    and  $03                        ; 11:6BF4
    cp   $03                        ; 11:6BF6
    jr   nz,Code116BFE              ; 11:6BF8
    ld   a,$47                      ; 11:6BFA
    ldh  [<$FFF4],a                 ; 11:6BFC
Code116BFE:
    ld   a,[$C326]                  ; 11:6BFE
    bit  2,a                        ; 11:6C01
    jr   nz,Code116C44              ; 11:6C03
    inc  e                          ; 11:6C05
    inc  e                          ; 11:6C06
    jr   Code116C44                 ; 11:6C07
Code116C09:
    and  $0F                        ; 11:6C09
    cp   $0F                        ; 11:6C0B
    jr   nz,Code116C13              ; 11:6C0D
    ld   a,$47                      ; 11:6C0F
    ldh  [<$FFF4],a                 ; 11:6C11
Code116C13:
    ld   a,[$C326]                  ; 11:6C13
    bit  4,a                        ; 11:6C16
    jr   nz,Code116C44              ; 11:6C18
    inc  e                          ; 11:6C1A
    jr   Code116C44                 ; 11:6C1B
Code116C1D:
    ld   a,[$C326]                  ; 11:6C1D
    cp   $FF                        ; 11:6C20
    jr   nz,Code116C28              ; 11:6C22
    ld   a,$4F                      ; 11:6C24
    ldh  [<$FFF2],a                 ; 11:6C26
Code116C28:
    ld   a,[$C326]                  ; 11:6C28
    and  $0E                        ; 11:6C2B
    ld   c,a                        ; 11:6C2D
    ld   a,e                        ; 11:6C2E
    sub  c                          ; 11:6C2F
    ld   e,a                        ; 11:6C30
    ld   a,[$C326]                  ; 11:6C31
    bit  0,a                        ; 11:6C34
    jr   z,Code116C3C               ; 11:6C36
    ld   hl,$C1BB                   ; 11:6C38
    inc  [hl]                       ; 11:6C3B
Code116C3C:
    ld   hl,$C1B9                   ; 11:6C3C
    ld   a,[$C1BB]                  ; 11:6C3F
    add  [hl]                       ; 11:6C42
    ld   [hl],a                     ; 11:6C43
Code116C44:
    ld   hl,$C048                   ; 11:6C44
    ld   c,$02                      ; 11:6C47
Code116C49:
    ld   a,[$C1B9]                  ; 11:6C49
    ldi  [hl],a                     ; 11:6C4C
    ld   [hl],e                     ; 11:6C4D
    inc  hl                         ; 11:6C4E
    ld   [hl],b                     ; 11:6C4F
    inc  hl                         ; 11:6C50
    ld   [hl],$07                   ; 11:6C51
    inc  hl                         ; 11:6C53
    ld   a,e                        ; 11:6C54
    add  $08                        ; 11:6C55
    ld   e,a                        ; 11:6C57
    inc  b                          ; 11:6C58
    inc  b                          ; 11:6C59
    dec  c                          ; 11:6C5A
    jr   nz,Code116C49              ; 11:6C5B
    ld   a,[$C326]                  ; 11:6C5D
    and  a                          ; 11:6C60
    jr   z,Code116C64               ; 11:6C61
    ret                             ; 11:6C63

Code116C64:
    ld   a,$FF                      ; 11:6C64
    ld   [$C326],a                  ; 11:6C66
    xor  a                          ; 11:6C69
    ldh  [<H_GameSubstate],a        ; 11:6C6A
    ld   a,$1F                      ; 11:6C6C
    ldh  [<H_GameState],a           ; 11:6C6E
    ret                             ; 11:6C70

Code116C71:
    ld   de,W_TilemapUploadBuffer   ; 11:6C71
    ld   hl,Data11671D              ; 11:6C74
    ld   bc,$000F                   ; 11:6C77
    call CopyBytes                  ; 11:6C7A
    ld   a,$66                      ; 11:6C7D
    ldh  [<$FFF2],a                 ; 11:6C7F
    ld   a,[$C194]                  ; 11:6C81
    and  a                          ; 11:6C84
    jr   nz,Code116C96              ; 11:6C85
    ld   a,[W_LevelID]              ; 11:6C87
    and  $1F                        ; 11:6C8A
    or   $20                        ; 11:6C8C
    ld   b,a                        ; 11:6C8E
    ld   a,[$C197]                  ; 11:6C8F
    or   b                          ; 11:6C92
    ld   [$C197],a                  ; 11:6C93
Code116C96:
    ld   a,$02                      ; 11:6C96
    ld   [$C325],a                  ; 11:6C98
    ld   a,$70                      ; 11:6C9B
    ld   [$C290],a                  ; 11:6C9D
    ld   a,$80                      ; 11:6CA0
    ld   [$C326],a                  ; 11:6CA2
    ld   hl,$C168                   ; 11:6CA5
    inc  [hl]                       ; 11:6CA8
    ret                             ; 11:6CA9

Code116CAA:
    ldh  a,[<H_ButtonsPressed]      ; 11:6CAA
    and  $01                        ; 11:6CAC
    ret  z                          ; 11:6CAE
    ld   a,$74                      ; 11:6CAF
    ld   [$DE68],a                  ; 11:6CB1
    ld   a,$C0                      ; 11:6CB4
    ld   [$C326],a                  ; 11:6CB6
    ld   hl,$C168                   ; 11:6CB9
    inc  [hl]                       ; 11:6CBC
    ret                             ; 11:6CBD

Code116CBE:
    ld   a,[$C326]                  ; 11:6CBE
    dec  a                          ; 11:6CC1
    ld   [$C326],a                  ; 11:6CC2
    ret  nz                         ; 11:6CC5
    ld   a,$11                      ; 11:6CC6
    rst  $10                        ; 11:6CC8  24-bit call
.dl SubL_075BB7                     ; 11:6CC9
    call Sub11539E                  ; 11:6CCC
    ld   a,[$C198]                  ; 11:6CCF
    cp   $20                        ; 11:6CD2
    jr   c,Code116CDE               ; 11:6CD4
    ld   a,[$C42A]                  ; 11:6CD6
    or   $10                        ; 11:6CD9
    ld   [$C42A],a                  ; 11:6CDB
Code116CDE:
    ld   a,[$C19C]                  ; 11:6CDE
    cp   $20                        ; 11:6CE1
    jr   c,Code116CED               ; 11:6CE3
    ld   a,[$C42A]                  ; 11:6CE5
    or   $08                        ; 11:6CE8
    ld   [$C42A],a                  ; 11:6CEA
Code116CED:
    ld   a,[$C19D]                  ; 11:6CED
    cp   $20                        ; 11:6CF0
    jr   c,Code116CFC               ; 11:6CF2
    ld   a,[$C42A]                  ; 11:6CF4
    or   $04                        ; 11:6CF7
    ld   [$C42A],a                  ; 11:6CF9
Code116CFC:
    ld   a,$11                      ; 11:6CFC
    rst  $10                        ; 11:6CFE  24-bit call
.dl SubL_0757EF                     ; 11:6CFF
    ld   a,$1D                      ; 11:6D02
    ldh  [<H_GameState],a           ; 11:6D04
    ret                             ; 11:6D06

Code116D07:
    ld   a,[W_LevelID]              ; 11:6D07
    and  $03                        ; 11:6D0A
    cp   $03                        ; 11:6D0C
    jr   nz,Code116D15              ; 11:6D0E
    ld   hl,Data11683C              ; 11:6D10
    jr   Code116D18                 ; 11:6D13
Code116D15:
    ld   hl,Data116800              ; 11:6D15
Code116D18:
    ld   de,W_TilemapUploadBuffer   ; 11:6D18
    ld   bc,$003C                   ; 11:6D1B
    call CopyBytes                  ; 11:6D1E
    ld   a,$30                      ; 11:6D21
    ld   [$C326],a                  ; 11:6D23
    ld   hl,$C168                   ; 11:6D26
    inc  [hl]                       ; 11:6D29
    ret                             ; 11:6D2A

Sub116D2B:
    ld   a,$0B                      ; 11:6D2B
    ld   hl,$DF04                   ; 11:6D2D
    ld   [hl],a                     ; 11:6D30
    ld   hl,$DF1A                   ; 11:6D31
    ldi  [hl],a                     ; 11:6D34
    ld   [hl],$2D                   ; 11:6D35
    ld   hl,$DF1F                   ; 11:6D37
    ld   [hl],a                     ; 11:6D3A
    ld   hl,$DF35                   ; 11:6D3B
    ldi  [hl],a                     ; 11:6D3E
    ld   [hl],$3D                   ; 11:6D3F
    ld   hl,$DF3A                   ; 11:6D41
    ldi  [hl],a                     ; 11:6D44
    ld   [hl],$2B                   ; 11:6D45
    ret                             ; 11:6D47

Code116D48:
    ld   a,[$C326]                  ; 11:6D48
    dec  a                          ; 11:6D4B
    ld   [$C326],a                  ; 11:6D4C
    jr   z,Code116D5A               ; 11:6D4F
    ldh  a,[<H_ButtonsPressed]      ; 11:6D51
    and  $01                        ; 11:6D53
    ret  z                          ; 11:6D55
    xor  a                          ; 11:6D56
    ld   [$C326],a                  ; 11:6D57
Code116D5A:
    ld   hl,$C168                   ; 11:6D5A
    inc  [hl]                       ; 11:6D5D
    ret                             ; 11:6D5E

Code116D5F:
    ld   a,[$C326]                  ; 11:6D5F
    dec  a                          ; 11:6D62
    ld   [$C326],a                  ; 11:6D63
    ret  nz                         ; 11:6D66
    ld   hl,$C168                   ; 11:6D67
    inc  [hl]                       ; 11:6D6A
    ret                             ; 11:6D6B

Sub116D6C:
    ld   d,$54                      ; 11:6D6C
    ld   e,$53                      ; 11:6D6E
    ld   b,$50                      ; 11:6D70
    ld   c,$05                      ; 11:6D72
    ld   a,[$C164]                  ; 11:6D74
    dec  a                          ; 11:6D77
    ld   [$C164],a                  ; 11:6D78
    bit  4,a                        ; 11:6D7B
    jr   nz,Code116D87              ; 11:6D7D
    ld   d,$4C                      ; 11:6D7F
    ld   e,$50                      ; 11:6D81
    ld   b,$38                      ; 11:6D83
    ld   c,$04                      ; 11:6D85
Code116D87:
    ld   hl,$C048                   ; 11:6D87
    ld   a,$02                      ; 11:6D8A
    ldh  [<$FF97],a                 ; 11:6D8C
Code116D8E:
    ld   [hl],d                     ; 11:6D8E
    inc  hl                         ; 11:6D8F
    ld   [hl],e                     ; 11:6D90
    inc  hl                         ; 11:6D91
    ld   [hl],b                     ; 11:6D92
    inc  hl                         ; 11:6D93
    ld   [hl],$07                   ; 11:6D94
    inc  hl                         ; 11:6D96
    ld   a,e                        ; 11:6D97
    add  $08                        ; 11:6D98
    ld   e,a                        ; 11:6D9A
    inc  b                          ; 11:6D9B
    inc  b                          ; 11:6D9C
    ld   [hl],d                     ; 11:6D9D
    inc  hl                         ; 11:6D9E
    ld   [hl],e                     ; 11:6D9F
    inc  hl                         ; 11:6DA0
    ld   [hl],b                     ; 11:6DA1
    inc  hl                         ; 11:6DA2
    ld   [hl],$05                   ; 11:6DA3
    inc  hl                         ; 11:6DA5
    ld   a,d                        ; 11:6DA6
    add  $10                        ; 11:6DA7
    ld   d,a                        ; 11:6DA9
    ld   a,e                        ; 11:6DAA
    sub  c                          ; 11:6DAB
    ld   e,a                        ; 11:6DAC
    inc  b                          ; 11:6DAD
    inc  b                          ; 11:6DAE
    ldh  a,[<$FF97]                 ; 11:6DAF
    dec  a                          ; 11:6DB1
    ldh  [<$FF97],a                 ; 11:6DB2
    jr   nz,Code116D8E              ; 11:6DB4
    ret                             ; 11:6DB6

Sub116DB7:
    ld   a,[$C168]                  ; 11:6DB7
    cp   $02                        ; 11:6DBA
    jr   z,Code116DD0               ; 11:6DBC
    cp   $06                        ; 11:6DBE
    jr   z,Code116DD0               ; 11:6DC0
    cp   $08                        ; 11:6DC2
    jr   z,Code116DD0               ; 11:6DC4
    cp   $10                        ; 11:6DC6
    jr   z,Code116DD0               ; 11:6DC8
    cp   $12                        ; 11:6DCA
    jr   z,Code116DD0               ; 11:6DCC
    jr   Code116DDB                 ; 11:6DCE
Code116DD0:
    ld   a,[$C326]                  ; 11:6DD0
    bit  3,a                        ; 11:6DD3
    jr   z,Code116DDB               ; 11:6DD5
    ld   b,$10                      ; 11:6DD7
    jr   Code116DDD                 ; 11:6DD9
Code116DDB:
    ld   b,$5C                      ; 11:6DDB
Code116DDD:
    ld   d,$48                      ; 11:6DDD
    ld   e,$88                      ; 11:6DDF
    ld   hl,$C030                   ; 11:6DE1
    ld   c,$02                      ; 11:6DE4
Code116DE6:
    ld   [hl],d                     ; 11:6DE6
    inc  hl                         ; 11:6DE7
    ld   [hl],e                     ; 11:6DE8
    inc  hl                         ; 11:6DE9
    ld   [hl],b                     ; 11:6DEA
    inc  hl                         ; 11:6DEB
    ld   [hl],$06                   ; 11:6DEC
    inc  hl                         ; 11:6DEE
    ld   a,e                        ; 11:6DEF
    add  $08                        ; 11:6DF0
    ld   e,a                        ; 11:6DF2
    ld   [hl],d                     ; 11:6DF3
    inc  hl                         ; 11:6DF4
    ld   [hl],e                     ; 11:6DF5
    inc  hl                         ; 11:6DF6
    ld   [hl],b                     ; 11:6DF7
    inc  hl                         ; 11:6DF8
    ld   [hl],$26                   ; 11:6DF9
    inc  hl                         ; 11:6DFB
    ld   a,d                        ; 11:6DFC
    add  $10                        ; 11:6DFD
    ld   d,a                        ; 11:6DFF
    ld   a,e                        ; 11:6E00
    sub  $08                        ; 11:6E01
    ld   e,a                        ; 11:6E03
    inc  b                          ; 11:6E04
    inc  b                          ; 11:6E05
    dec  c                          ; 11:6E06
    jr   nz,Code116DE6              ; 11:6E07
    ld   [hl],$55                   ; 11:6E09
    inc  hl                         ; 11:6E0B
    ld   [hl],$8C                   ; 11:6E0C
    inc  hl                         ; 11:6E0E
    ld   [hl],$7C                   ; 11:6E0F
    inc  hl                         ; 11:6E11
    ld   [hl],$00                   ; 11:6E12
    ret                             ; 11:6E14

Data116E15:                         ; 11:6E15
.db $99,$EC,$02,$06,$80,$06,$81,$9A,\
    $0C,$02,$06,$90,$06,$91,$00
Data116E24:                         ; 11:6E24
.db $99,$EE,$02,$00,$82,$00,$83,$9A,\
    $0E,$02,$00,$92,$00,$93,$00
Data116E33:                         ; 11:6E33
.db $99,$F0,$02,$07,$84,$07,$85,$9A,\
    $10,$02,$07,$94,$07,$95,$00
DataPtrs116E42:                     ; 11:6E42
.dw Data1166FF, Data11670E, Data11671D
DataPtrs116E48:                     ; 11:6E48
.dw Data116E15, Data116E24, Data116E33

Sub116E4E:
    ld   a,[$C290]                  ; 11:6E4E
    cp   $00                        ; 11:6E51
    jr   z,Return116E85             ; 11:6E53
    and  $0F                        ; 11:6E55
    jr   nz,Code116E7E              ; 11:6E57
    ld   a,[$C290]                  ; 11:6E59
    bit  4,a                        ; 11:6E5C
    jr   nz,Code116E65              ; 11:6E5E
    ld   hl,DataPtrs116E48          ; 11:6E60
    jr   Code116E68                 ; 11:6E63
Code116E65:
    ld   hl,DataPtrs116E42          ; 11:6E65
Code116E68:
    ld   a,[$C325]                  ; 11:6E68
    sla  a                          ; 11:6E6B
    ld   c,a                        ; 11:6E6D
    ld   b,$00                      ; 11:6E6E
    add  hl,bc                      ; 11:6E70
    ld   c,[hl]                     ; 11:6E71
    inc  hl                         ; 11:6E72
    ld   h,[hl]                     ; 11:6E73
    ld   l,c                        ; 11:6E74
    ld   de,W_TilemapUploadBuffer   ; 11:6E75
    ld   bc,$000F                   ; 11:6E78
    call CopyBytes                  ; 11:6E7B
Code116E7E:
    ld   a,[$C290]                  ; 11:6E7E
    dec  a                          ; 11:6E81
    ld   [$C290],a                  ; 11:6E82
Return116E85:
    ret                             ; 11:6E85

ChalYoshiHatch_Main:
; Game state 1F: Challenge Yoshi hatch screen
    ldh  a,[<H_GameSubstate]        ; 11:6E86
    rst  $00                        ; 11:6E88  Execute from 16-bit pointer table
.dw Code116E8D                      ; 11:6E89
.dw Code116ED4                      ; 11:6E8B

Code116E8D:
; Challenge Yoshi hatch substate 0
    call Sub00126D                  ; 11:6E8D
    ld   a,$00                      ; 11:6E90
    ldh  [<IE],a                    ; 11:6E92
    ld   a,:Gr_ChalMissYoshiHatch   ; 11:6E94
    ld   b,$11                      ; 11:6E96
    call LoadGraphicsBank           ; 11:6E98
    ld   a,:Pal_ChalYoshiHatch      ; 11:6E9B
    ld   b,$11                      ; 11:6E9D
    ld   de,Pal_ChalYoshiHatch      ; 11:6E9F
    call LoadFullPaletteLong        ; 11:6EA2
    ld   a,:Ti_ChalYoshiHatch       ; 11:6EA5
    ld   b,$11                      ; 11:6EA7
    ld   de,$99C0                   ; 11:6EA9
    ld   hl,Ti_ChalYoshiHatch       ; 11:6EAC
    call LoadScreenTilemapVRAM      ; 11:6EAF
    ld   a,$00                      ; 11:6EB2
    ldh  [<H_CameraXLow],a          ; 11:6EB4
    ldh  [<H_CameraXHigh],a         ; 11:6EB6
    ldh  [<$FFBB],a                 ; 11:6EB8
    ld   a,$70                      ; 11:6EBA
    ldh  [<H_CameraY],a             ; 11:6EBC
    ld   a,$80                      ; 11:6EBE
    ld   [$C326],a                  ; 11:6EC0
    ld   a,$61                      ; 11:6EC3
    ldh  [<$FFF2],a                 ; 11:6EC5
    ld   a,$01                      ; 11:6EC7
    ldh  [<IE],a                    ; 11:6EC9
    ld   a,$87                      ; 11:6ECB
    ldh  [<LCDC],a                  ; 11:6ECD
    ld   hl,H_GameSubstate          ; 11:6ECF
    inc  [hl]                       ; 11:6ED2
    ret                             ; 11:6ED3

Code116ED4:
; Challenge Yoshi hatch substate 1
    ldh  a,[<H_ButtonsPressed]      ; 11:6ED4
    and  $09                        ; 11:6ED6
    jr   nz,Code116EE4              ; 11:6ED8
    ld   a,[$C326]                  ; 11:6EDA
    dec  a                          ; 11:6EDD
    ld   [$C326],a                  ; 11:6EDE
    jr   z,Code116EE4               ; 11:6EE1
    ret                             ; 11:6EE3

Code116EE4:
    ld   a,$01                      ; 11:6EE4
    ld   [$C326],a                  ; 11:6EE6
    xor  a                          ; 11:6EE9
    ld   [$C164],a                  ; 11:6EEA
    ld   a,$1A                      ; 11:6EED
    ld   [$C196],a                  ; 11:6EEF
    ld   a,$20                      ; 11:6EF2
    ldh  [<H_GameState],a           ; 11:6EF4
    ret                             ; 11:6EF6

Data116EF7:                         ; 11:6EF7
.db $9A,$66,$07,$00,$E6,$00,$DA,$00,\
    $EB,$00,$E2,$00,$E8,$00,$F4,$00,\
    $D2
Data116F08:                         ; 11:6F08
.db $9A,$E8,$03,$00,$D1,$00,$F8,$00,\
    $D1,$00

Sub116F12:
; Game state 31
    ldh  a,[<H_CameraXLow]          ; 11:6F12
    ld   [$C175],a                  ; 11:6F14
    ldh  a,[<H_CameraY]             ; 11:6F17
    ld   [$C176],a                  ; 11:6F19
    call Sub00126D                  ; 11:6F1C
    ld   a,$00                      ; 11:6F1F
    ldh  [<IE],a                    ; 11:6F21
    ld   a,:Gr_OW_ChalMenu          ; 11:6F23
    ld   b,$11                      ; 11:6F25
    call LoadGraphicsBank           ; 11:6F27
    ld   a,:Data115C6A              ; 11:6F2A
    ld   b,a                        ; 11:6F2C
    ld   de,Data115C6A              ; 11:6F2D
    call LoadFullPaletteLong        ; 11:6F30
    ld   a,$11                      ; 11:6F33
    rst  $10                        ; 11:6F35  24-bit call
.dl SubL_0B421E                     ; 11:6F36
    call Sub00128D                  ; 11:6F39
    ld   a,$00                      ; 11:6F3C
    ldh  [<H_CameraXLow],a          ; 11:6F3E
    ldh  [<H_CameraXHigh],a         ; 11:6F40
    ldh  [<$FFBB],a                 ; 11:6F42
    ld   [W_SublevelID],a           ; 11:6F44
    ld   [$C1EF],a                  ; 11:6F47
    ld   [$C182],a                  ; 11:6F4A
    ld   [$C1B3],a                  ; 11:6F4D
    ld   a,$01                      ; 11:6F50
    ldh  [<$FFA6],a                 ; 11:6F52
    ld   a,$70                      ; 11:6F54
    ldh  [<H_CameraY],a             ; 11:6F56
    ld   de,W_TilemapUploadBuffer   ; 11:6F58
    ld   hl,Data116EF7              ; 11:6F5B
    ld   bc,$001B                   ; 11:6F5E
    call CopyBytes                  ; 11:6F61
    ld   a,$11                      ; 11:6F64
    call Sub001480                  ; 11:6F66
    ld   a,$03                      ; 11:6F69
    ldh  [<IE],a                    ; 11:6F6B
    ld   a,$87                      ; 11:6F6D
    ldh  [<LCDC],a                  ; 11:6F6F
    ld   a,$FF                      ; 11:6F71
    ld   [$DE68],a                  ; 11:6F73
    ld   hl,H_GameState             ; 11:6F76
    inc  [hl]                       ; 11:6F79
    ret                             ; 11:6F7A

Sub116F7B:
    ldh  a,[<H_ButtonsHeld]         ; 11:6F7B
    and  $C0                        ; 11:6F7D
    jr   nz,Code116F86              ; 11:6F7F
    ld   a,$01                      ; 11:6F81
    ldh  [<$FFA6],a                 ; 11:6F83
    ret                             ; 11:6F85

Code116F86:
    ldh  a,[<$FFA6]                 ; 11:6F86
    dec  a                          ; 11:6F88
    ldh  [<$FFA6],a                 ; 11:6F89
    and  $07                        ; 11:6F8B
    jr   nz,Return116FDA            ; 11:6F8D
    ldh  a,[<H_ButtonsHeld]         ; 11:6F8F
    and  $80                        ; 11:6F91
    jr   nz,Code116FA6              ; 11:6F93
    ld   a,[W_SublevelID]           ; 11:6F95
    inc  a                          ; 11:6F98
    ld   [W_SublevelID],a           ; 11:6F99
    cp   $34                        ; 11:6F9C
    jr   c,Code116FB6               ; 11:6F9E
    xor  a                          ; 11:6FA0
    ld   [W_SublevelID],a           ; 11:6FA1
    jr   Code116FB6                 ; 11:6FA4
Code116FA6:
    ld   a,[W_SublevelID]           ; 11:6FA6
    dec  a                          ; 11:6FA9
    ld   [W_SublevelID],a           ; 11:6FAA
    cp   $FF                        ; 11:6FAD
    jr   nz,Code116FB6              ; 11:6FAF
    ld   a,$33                      ; 11:6FB1
    ld   [W_SublevelID],a           ; 11:6FB3
Code116FB6:
    ld   de,W_TilemapUploadBuffer   ; 11:6FB6
    ld   hl,Data116F08              ; 11:6FB9
    ld   bc,$000A                   ; 11:6FBC
    call CopyBytes                  ; 11:6FBF
    ld   a,[W_SublevelID]           ; 11:6FC2
    srl  a                          ; 11:6FC5
    srl  a                          ; 11:6FC7
    add  $D1                        ; 11:6FC9
    ld   hl,$DF05                   ; 11:6FCB
    ld   [hl],a                     ; 11:6FCE
    ld   a,[W_SublevelID]           ; 11:6FCF
    and  $03                        ; 11:6FD2
    add  $D1                        ; 11:6FD4
    ld   hl,$DF09                   ; 11:6FD6
    ld   [hl],a                     ; 11:6FD9
Return116FDA:
    ret                             ; 11:6FDA

HighScoreTargets:                   ; 11:6FDB
.dl 3200, 3800, 2400, 1300,\
    4000, 2500, 2300, 1400,\
    4500, 8500, 2300, 1300,\
    3200, 3300, 2400, 1700,\
    8000, 3600, 2300, 1300,\
    3200, 3000, 2100, 1200,\
    3200, 2400, 2800, 1600,\
    4000, 2800, 2800, 1800

Unused11703B:
    ret                             ; 11:703B
