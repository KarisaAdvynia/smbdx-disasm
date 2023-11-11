.bank $14 slot 1
.orga $4000

Sub144000:
    ldh  a,[<H_GameSubstate]        ; 14:4000
    rst  $00                        ; 14:4002
.dw Code1440B7                      ; 14:4003
.dw Code144110                      ; 14:4005
.dw Code1441D4                      ; 14:4007
.dw Code144373                      ; 14:4009
.dw Code144584                      ; 14:400B
.dw Code1448C7                      ; 14:400D
.dw Code144AE4                      ; 14:400F
.dw Code144B37                      ; 14:4011
.dw Code144B6C                      ; 14:4013
.dw Code145667                      ; 14:4015
.dw Code14593F                      ; 14:4017
.dw Code145A5F                      ; 14:4019
.dw Code145667                      ; 14:401B
.dw Code145C58                      ; 14:401D
.dw Code145A5F                      ; 14:401F
.dw Code14668C                      ; 14:4021
.dw Code146850                      ; 14:4023
.dw Code14691C                      ; 14:4025
.dw Code14668C                      ; 14:4027
.dw Code146A37                      ; 14:4029
.dw Code14691C                      ; 14:402B
.dw Code144FBD                      ; 14:402D
.dw Code1450B5                      ; 14:402F
.dw Sub145110                       ; 14:4031
.dw Code145262                      ; 14:4033
.dw Code1452D4                      ; 14:4035

Data144037:                         ; 14:4037
.dw $63FF,$7FFF,$1097,$016B,$63FF,$323E,$1097,$0000,\
    $7FFF,$50FA,$7D0D,$1C07,$63FF,$001B,$5815,$0000,\
    $7FFF,$02BE,$015D,$300B,$027E,$017C,$00DB,$0013,\
    $03DD,$0372,$0210,$016B,$63FF,$02DF,$4CBA,$1C07,\
    $63FF,$7FFF,$0200,$0000,$63FF,$7FFF,$3DEF,$0000,\
    $7DE0,$7DE0,$7DE0,$7DE0,$7DE0,$7DE0,$7DE0,$7DE0,\
    $7DE0,$7DE0,$7DE0,$7DE0,$7DE0,$7DE0,$7DE0,$7DE0,\
    $63FF,$7FFF,$02BC,$0019,$7FFF,$22FF,$04D3,$0000

Code1440B7:
    call Sub00126D                  ; 14:40B7
    xor  a                          ; 14:40BA
    ldh  [<IE],a                    ; 14:40BB
    ldh  [<$FF93],a                 ; 14:40BD
    ld   hl,$D000                   ; 14:40BF
    ld   bc,$0DFF                   ; 14:40C2
    call ClearBytes                 ; 14:40C5
    ld   a,$14                      ; 14:40C8
    rst  $10                        ; 14:40CA
.dl SubL_0756D9                     ; 14:40CB
    ld   a,[$C191]                  ; 14:40CE
    ld   [$C4F9],a                  ; 14:40D1
    xor  a                          ; 14:40D4
    ld   [W_LevelID],a              ; 14:40D5
Code1440D8:
    ld   a,$14                      ; 14:40D8
    rst  $10                        ; 14:40DA
.dl SubL_075B10                     ; 14:40DB
    ld   a,[$C194]                  ; 14:40DE
    and  a                          ; 14:40E1
    jr   nz,Code1440EF              ; 14:40E2
    ld   a,[W_LevelID]              ; 14:40E4
    inc  a                          ; 14:40E7
    and  $1F                        ; 14:40E8
    ld   [W_LevelID],a              ; 14:40EA
    jr   nz,Code1440D8              ; 14:40ED
Code1440EF:
    ld   [$C4FA],a                  ; 14:40EF
    ld   hl,$D905                   ; 14:40F2
    ld   [hl],$CF                   ; 14:40F5
    inc  hl                         ; 14:40F7
    ld   [hl],$07                   ; 14:40F8
    ld   a,$04                      ; 14:40FA
    ld   [$D907],a                  ; 14:40FC
    ld   [$D909],a                  ; 14:40FF
    ld   a,$04                      ; 14:4102
    ld   [$D90D],a                  ; 14:4104
    xor  a                          ; 14:4107
    ld   [$C41D],a                  ; 14:4108
    call Sub144189                  ; 14:410B
    jr   Code144118                 ; 14:410E
Code144110:
    call Sub001258                  ; 14:4110
    xor  a                          ; 14:4113
    ldh  [<IE],a                    ; 14:4114
    ldh  [<$FF93],a                 ; 14:4116
Code144118:
    ld   a,$75                      ; 14:4118
    ld   [$DE68],a                  ; 14:411A
    ld   a,$22                      ; 14:411D
    ld   [$C415],a                  ; 14:411F
    ld   hl,Data224000              ; 14:4122
    ld   de,$8000                   ; 14:4125
    ld   bc,$1800                   ; 14:4128
    ld   a,$14                      ; 14:412B
    call CopyBytesLong              ; 14:412D
    ld   a,$22                      ; 14:4130
    ld   [$C415],a                  ; 14:4132
    ld   hl,Data225800              ; 14:4135
    ld   a,$14                      ; 14:4138
    call Sub001570                  ; 14:413A
    ld   a,$14                      ; 14:413D
    ld   b,$14                      ; 14:413F
    ld   de,Data144037              ; 14:4141
    call LoadFullPaletteLong        ; 14:4144
    ld   a,$90                      ; 14:4147
    ld   [$C178],a                  ; 14:4149
    xor  a                          ; 14:414C
    ldh  [<$FFB8],a                 ; 14:414D
    ldh  [<$FFB9],a                 ; 14:414F
    ldh  [<$FFBA],a                 ; 14:4151
    ldh  [<$FFBB],a                 ; 14:4153
    ld   [$C177],a                  ; 14:4155
    ld   [$C4EC],a                  ; 14:4158
    ld   a,$01                      ; 14:415B
    ldh  [<VBK],a                   ; 14:415D
    ld   hl,$D240                   ; 14:415F
    ld   de,$9800                   ; 14:4162
    ld   bc,$0240                   ; 14:4165
    call CopyBytes                  ; 14:4168
    xor  a                          ; 14:416B
    ldh  [<VBK],a                   ; 14:416C
    ld   hl,$D000                   ; 14:416E
    ld   de,$9800                   ; 14:4171
    ld   bc,$0240                   ; 14:4174
    call CopyBytes                  ; 14:4177
    ld   a,$02                      ; 14:417A
    ld   [$C0C1],a                  ; 14:417C
    ld   a,$01                      ; 14:417F
    ldh  [<IE],a                    ; 14:4181
    ldh  [<$FF93],a                 ; 14:4183
    ld   a,$E7                      ; 14:4185
    ldh  [<LCDC],a                  ; 14:4187

Sub144189:
    ld   hl,H_GameSubstate          ; 14:4189
    inc  [hl]                       ; 14:418C
    ret                             ; 14:418D

Data14418E:                         ; 14:418E
.db $09,$03,$FF,$15
Data144192:                         ; 14:4192
.db $03,$04,$05,$06,$01,$FF,$03,$FF,\
    $00,$02
Data14419C:                         ; 14:419C
.db $58,$18,$00,$00,$58,$20,$02,$00
Data1441A4:                         ; 14:41A4
.db $78,$2C,$10,$01,$78,$34,$12,$01,\
    $78,$3C,$14,$01,$88,$2C,$16,$01,\
    $88,$34,$18,$01,$88,$3C,$1A,$01
Data1441BC:                         ; 14:41BC
.db $70,$6C,$04,$00,$70,$74,$06,$00,\
    $70,$7C,$08,$00,$80,$6C,$0A,$00,\
    $80,$74,$0C,$00,$80,$7C,$0E,$00
Code1441D4:
    ldh  a,[<$FF8C]                 ; 14:41D4
    bit  1,a                        ; 14:41D6
    jr   z,Code1441EB               ; 14:41D8
    ld   a,$18                      ; 14:41DA
    ldh  [<H_GameState],a           ; 14:41DC
    xor  a                          ; 14:41DE
    ldh  [<H_GameSubstate],a        ; 14:41DF
    ld   [$C0C1],a                  ; 14:41E1
    ld   a,$63                      ; 14:41E4
    ldh  [<$FFF2],a                 ; 14:41E6
    jp   Code144286                 ; 14:41E8
Code1441EB:
    bit  0,a                        ; 14:41EB
    jr   z,Code144219               ; 14:41ED
    ld   a,[$C41D]                  ; 14:41EF
    sla  a                          ; 14:41F2
    ld   c,a                        ; 14:41F4
    ld   a,[$C41E]                  ; 14:41F5
    or   c                          ; 14:41F8
    ld   c,a                        ; 14:41F9
    ld   b,$00                      ; 14:41FA
    ld   hl,Data144192              ; 14:41FC
    add  hl,bc                      ; 14:41FF
    ld   a,[hl]                     ; 14:4200
    ld   [$C432],a                  ; 14:4201
    ld   hl,Data14418E              ; 14:4204
    add  hl,bc                      ; 14:4207
    ld   a,[hl]                     ; 14:4208
    cp   $FF                        ; 14:4209
    jr   nz,Code144212              ; 14:420B
    ld   a,$41                      ; 14:420D
    ldh  [<H_GameState],a           ; 14:420F
    xor  a                          ; 14:4211
Code144212:
    ldh  [<H_GameSubstate],a        ; 14:4212
    call Sub0010A9                  ; 14:4214
    jr   Code144286                 ; 14:4217
Code144219:
    ldh  a,[<$FF8C]                 ; 14:4219
    and  $30                        ; 14:421B
    jr   z,Code14424A               ; 14:421D
    ld   a,[$C41E]                  ; 14:421F
    xor  $01                        ; 14:4222
    ld   [$C41E],a                  ; 14:4224
    ld   c,a                        ; 14:4227
    ld   b,$00                      ; 14:4228
    ld   a,[$C41D]                  ; 14:422A
    and  a                          ; 14:422D
    jr   z,Code144244               ; 14:422E
    ld   hl,$C4F9                   ; 14:4230
    add  hl,bc                      ; 14:4233
    ld   a,[hl]                     ; 14:4234
    and  a                          ; 14:4235
    jr   nz,Code144244              ; 14:4236
    ld   a,c                        ; 14:4238
    xor  $01                        ; 14:4239
    ld   [$C41E],a                  ; 14:423B
    ld   a,$30                      ; 14:423E
    ldh  [<$FFF3],a                 ; 14:4240
    jr   Code144286                 ; 14:4242
Code144244:
    ld   a,$47                      ; 14:4244
    ldh  [<$FFF2],a                 ; 14:4246
    jr   Code144286                 ; 14:4248
Code14424A:
    ldh  a,[<$FF8C]                 ; 14:424A
    and  $C0                        ; 14:424C
    jr   z,Code144286               ; 14:424E
    ld   a,[$C41D]                  ; 14:4250
    xor  $01                        ; 14:4253
    ld   [$C41D],a                  ; 14:4255
    jr   z,Code144282               ; 14:4258
    ld   hl,$C4F9                   ; 14:425A
    ld   a,[$C41E]                  ; 14:425D
    ld   c,a                        ; 14:4260
    ld   b,$00                      ; 14:4261
    add  hl,bc                      ; 14:4263
    ld   a,[hl]                     ; 14:4264
    and  a                          ; 14:4265
    jr   nz,Code14427E              ; 14:4266
    ld   a,c                        ; 14:4268
    xor  $01                        ; 14:4269
    ld   c,a                        ; 14:426B
    ld   hl,$C4F9                   ; 14:426C
    add  hl,bc                      ; 14:426F
    ld   a,[hl]                     ; 14:4270
    and  a                          ; 14:4271
    jr   nz,Code14427E              ; 14:4272
    xor  a                          ; 14:4274
    ld   [$C41D],a                  ; 14:4275
    ld   a,$30                      ; 14:4278
    ldh  [<$FFF3],a                 ; 14:427A
    jr   Code144286                 ; 14:427C
Code14427E:
    ld   a,c                        ; 14:427E
    ld   [$C41E],a                  ; 14:427F
Code144282:
    ld   a,$47                      ; 14:4282
    ldh  [<$FFF2],a                 ; 14:4284
Code144286:
    ld   hl,$C000                   ; 14:4286
    ld   a,[$C41D]                  ; 14:4289
    ld   c,a                        ; 14:428C
    sla  a                          ; 14:428D
    sla  a                          ; 14:428F
    sla  a                          ; 14:4291
    add  c                          ; 14:4293
    sla  a                          ; 14:4294
    sla  a                          ; 14:4296
    ld   c,a                        ; 14:4298
    ld   a,[$C41E]                  ; 14:4299
    sla  a                          ; 14:429C
    sla  a                          ; 14:429E
    swap a                          ; 14:42A0
    ld   b,a                        ; 14:42A2
    ld   de,Data14419C              ; 14:42A3
    ld   a,$02                      ; 14:42A6
    ldh  [<$FF97],a                 ; 14:42A8
Code1442AA:
    ld   a,[de]                     ; 14:42AA
    add  c                          ; 14:42AB
    ldi  [hl],a                     ; 14:42AC
    inc  de                         ; 14:42AD
    ld   a,[de]                     ; 14:42AE
    add  b                          ; 14:42AF
    ldi  [hl],a                     ; 14:42B0
    inc  de                         ; 14:42B1
    ld   a,[de]                     ; 14:42B2
    ldi  [hl],a                     ; 14:42B3
    inc  de                         ; 14:42B4
    ld   a,[de]                     ; 14:42B5
    ldi  [hl],a                     ; 14:42B6
    inc  de                         ; 14:42B7
    ldh  a,[<$FF97]                 ; 14:42B8
    dec  a                          ; 14:42BA
    ldh  [<$FF97],a                 ; 14:42BB
    jr   nz,Code1442AA              ; 14:42BD
    ld   a,[$C4FA]                  ; 14:42BF
    and  a                          ; 14:42C2
    jr   z,Code1442D9               ; 14:42C3
    ld   b,$06                      ; 14:42C5
    ld   de,Data1441BC              ; 14:42C7
Code1442CA:
    ld   a,[de]                     ; 14:42CA
    ldi  [hl],a                     ; 14:42CB
    inc  de                         ; 14:42CC
    ld   a,[de]                     ; 14:42CD
    ldi  [hl],a                     ; 14:42CE
    inc  de                         ; 14:42CF
    ld   a,[de]                     ; 14:42D0
    ldi  [hl],a                     ; 14:42D1
    inc  de                         ; 14:42D2
    ld   a,[de]                     ; 14:42D3
    ldi  [hl],a                     ; 14:42D4
    inc  de                         ; 14:42D5
    dec  b                          ; 14:42D6
    jr   nz,Code1442CA              ; 14:42D7
Code1442D9:
    ld   a,[$C4F9]                  ; 14:42D9
    and  a                          ; 14:42DC
    ret  z                          ; 14:42DD
    ld   b,$06                      ; 14:42DE
    ld   de,Data1441A4              ; 14:42E0
Code1442E3:
    ld   a,[de]                     ; 14:42E3
    ldi  [hl],a                     ; 14:42E4
    inc  de                         ; 14:42E5
    ld   a,[de]                     ; 14:42E6
    ldi  [hl],a                     ; 14:42E7
    inc  de                         ; 14:42E8
    ld   a,[de]                     ; 14:42E9
    ldi  [hl],a                     ; 14:42EA
    inc  de                         ; 14:42EB
    ld   a,[de]                     ; 14:42EC
    ldi  [hl],a                     ; 14:42ED
    inc  de                         ; 14:42EE
    dec  b                          ; 14:42EF
    jr   nz,Code1442E3              ; 14:42F0
    ret                             ; 14:42F2

Data1442F3:                         ; 14:42F3
.dw $4B9F,$1CFF,$02BF,$0000,$0006,$04D3,$22FF,$7FFF,\
    $4B9F,$318C,$2C1D,$300D,$4B9F,$318C,$04DA,$0001,\
    $4B9F,$01C0,$0360,$0801,$4B9F,$04DA,$1D93,$0001,\
    $4B9F,$301F,$301F,$301F,$7FFF,$04D3,$22FF,$0000,\
    $7DE0,$72BF,$3CBF,$04D3,$7DE0,$7FFF,$7D2D,$0000,\
    $7DE0,$025F,$001F,$0000,$7DE0,$7FFF,$02A6,$001D,\
    $7DE0,$7FFF,$02BC,$0019,$7DE0,$7FFF,$02A6,$0120,\
    $7DE0,$7FFF,$02BC,$0019,$7FFF,$22FF,$04D3,$0000
Code144373:
    call Sub00126D                  ; 14:4373
    xor  a                          ; 14:4376
    ldh  [<IE],a                    ; 14:4377
    ldh  [<$FF93],a                 ; 14:4379
    ld   a,$FF                      ; 14:437B
    ld   [$DE68],a                  ; 14:437D
    ld   a,$23                      ; 14:4380
    ld   [$C415],a                  ; 14:4382
    ld   hl,Data234000              ; 14:4385
    ld   de,$8000                   ; 14:4388
    ld   bc,$1800                   ; 14:438B
    ld   a,$14                      ; 14:438E
    call CopyBytesLong              ; 14:4390
    ld   a,$01                      ; 14:4393
    ldh  [<VBK],a                   ; 14:4395
    ld   hl,Data237400              ; 14:4397
    ld   de,$9800                   ; 14:439A
    ld   bc,$0400                   ; 14:439D
    ld   a,$14                      ; 14:43A0
    call CopyBytesLong              ; 14:43A2
    xor  a                          ; 14:43A5
    ldh  [<VBK],a                   ; 14:43A6
    ld   hl,Data237000              ; 14:43A8
    ld   de,$9800                   ; 14:43AB
    ld   bc,$0400                   ; 14:43AE
    ld   a,$14                      ; 14:43B1
    call CopyBytesLong              ; 14:43B3
    ld   a,$14                      ; 14:43B6
    ld   b,$14                      ; 14:43B8
    ld   de,Data1442F3              ; 14:43BA
    call LoadFullPaletteLong        ; 14:43BD
    ld   a,$00                      ; 14:43C0
    ld   [$C4EC],a                  ; 14:43C2
    call Sub144412                  ; 14:43C5
    ld   a,$FC                      ; 14:43C8
    ldh  [<$FFB8],a                 ; 14:43CA
    xor  a                          ; 14:43CC
    ldh  [<$FFB9],a                 ; 14:43CD
    ldh  [<$FFBA],a                 ; 14:43CF
    ldh  [<$FFBB],a                 ; 14:43D1
    ld   [$D90E],a                  ; 14:43D3
    ld   [$D90D],a                  ; 14:43D6
    ld   a,$01                      ; 14:43D9
    ldh  [<IE],a                    ; 14:43DB
    ldh  [<$FF93],a                 ; 14:43DD
    ld   a,$E7                      ; 14:43DF
    ldh  [<LCDC],a                  ; 14:43E1
    jp   Sub144189                  ; 14:43E3

.dw $7A80,$79C0,$79C0
Data1443EC:                         ; 14:43EC
.dw $7A20,$7B40,$7BA0,$7AE0,$7BA0,$7BA0,$7C00
Data1443FA:                         ; 14:43FA
.dw $7C60,$7D80,$7CC0,$7CC0
Data144402:                         ; 14:4402
.dw $7D20,$7E40,$7EA0,$7DE0,$7EA0,$7EA0,$7F00
Data144410:                         ; 14:4410
.dw $7F60

Sub144412:
    ld   a,$01                      ; 14:4412
    ldh  [<VBK],a                   ; 14:4414
    ld   a,$25                      ; 14:4416
    ld   bc,Data255800              ; 14:4418
    ld   de,$8000                   ; 14:441B
    ld   h,$14                      ; 14:441E
    ld   l,$7F                      ; 14:4420
    call DMATransfer                ; 14:4422
    ld   a,$25                      ; 14:4425
    ld   bc,Data256000              ; 14:4427
    ld   de,$8800                   ; 14:442A
    ld   h,$14                      ; 14:442D
    ld   l,$7F                      ; 14:442F
    call DMATransfer                ; 14:4431
    ld   a,$25                      ; 14:4434
    ld   bc,Data256800              ; 14:4436
    ld   de,$9000                   ; 14:4439
    ld   h,$14                      ; 14:443C
    ld   l,$7F                      ; 14:443E
    call DMATransfer                ; 14:4440
    ld   a,$31                      ; 14:4443
    ld   [$C415],a                  ; 14:4445
    ld   a,$01                      ; 14:4448
    ldh  [<VBK],a                   ; 14:444A
    ld   a,[$C4EC]                  ; 14:444C
    and  a                          ; 14:444F
    jr   z,Code144459               ; 14:4450
    dec  a                          ; 14:4452
    sla  a                          ; 14:4453
    add  $0C                        ; 14:4455
    jr   Code14445E                 ; 14:4457
Code144459:
    ld   a,[$C432]                  ; 14:4459
    sla  a                          ; 14:445C
Code14445E:
    ld   c,a                        ; 14:445E
    ld   b,$00                      ; 14:445F
    push bc                         ; 14:4461
    ld   hl,Data3143FC              ; 14:4462
    add  hl,bc                      ; 14:4465
    ldi  a,[hl]                     ; 14:4466
    ld   h,[hl]                     ; 14:4467
    ld   l,a                        ; 14:4468
    ld   de,$9C00                   ; 14:4469
    ld   bc,$0060                   ; 14:446C
    ld   a,$14                      ; 14:446F
    call CopyBytesLong              ; 14:4471
    xor  a                          ; 14:4474
    ldh  [<VBK],a                   ; 14:4475
    pop  bc                         ; 14:4477
    ld   hl,Data3143E6              ; 14:4478
    add  hl,bc                      ; 14:447B
    ldi  a,[hl]                     ; 14:447C
    ld   h,[hl]                     ; 14:447D
    ld   l,a                        ; 14:447E
    ld   de,$9C00                   ; 14:447F
    ld   bc,$0060                   ; 14:4482
    ld   a,$14                      ; 14:4485
    call CopyBytesLong              ; 14:4487
    ld   a,$90                      ; 14:448A
    ld   [$C178],a                  ; 14:448C
    xor  a                          ; 14:448F
    ld   [$C177],a                  ; 14:4490
    ret                             ; 14:4493

Data144494:                         ; 14:4494
.db $FF,$01
Data144496:                         ; 14:4496
.db $00,$02,$04,$00
Data14449A:                         ; 14:449A
.db $08,$3C,$08,$3C,$30,$12,$30,$64,\
    $60,$24,$60,$54
Data1444A6:                         ; 14:44A6
.db $10,$08,$00,$00,$10,$10,$02,$00,\
    $10,$18,$02,$20,$10,$20,$02,$00,\
    $10,$28,$06,$60,$20,$08,$04,$00,\
    $20,$28,$04,$60,$30,$08,$06,$00,\
    $30,$10,$02,$60,$30,$18,$02,$40,\
    $30,$20,$02,$60,$30,$28,$00,$60
Data1444D6:                         ; 14:44D6
.db $10,$08,$10,$00,$10,$10,$0C,$00,\
    $10,$18,$0A,$00,$10,$20,$0C,$00,\
    $10,$28,$10,$20,$20,$08,$12,$00,\
    $20,$28,$12,$20,$30,$08,$10,$40,\
    $30,$10,$0C,$40,$30,$18,$0A,$40,\
    $30,$20,$0C,$40,$30,$28,$10,$60
Data144506:                         ; 14:4506
.db $10,$08,$06,$40,$10,$10,$02,$20,\
    $10,$18,$02,$00,$10,$20,$02,$20,\
    $10,$28,$00,$20,$20,$08,$04,$40,\
    $20,$28,$04,$20,$30,$08,$00,$40,\
    $30,$10,$02,$40,$30,$18,$02,$60,\
    $30,$20,$02,$40,$30,$28,$06,$20
Data144536:                         ; 14:4536
.db $10,$08,$08,$00,$10,$10,$0A,$00,\
    $10,$18,$0C,$00,$10,$20,$0A,$00,\
    $10,$28,$08,$20,$20,$08,$0E,$00,\
    $20,$28,$0E,$20,$30,$08,$08,$40,\
    $30,$10,$0A,$40,$30,$18,$0C,$40,\
    $30,$20,$0A,$40,$30,$28,$08,$60
DataPtrs144566:                     ; 14:4566
.dw Data1444A6, Data1444D6, Data144506, Data144536
.db $BF,$3C,$BC,$02,$D3,$04
Data144574:                         ; 14:4574
.db $00,$01,$02,$02,$01
Data144579:                         ; 14:4579
.db $00,$01,$01,$00,$00
Data14457E:                         ; 14:457E
.db $00,$00,$04,$01,$03,$02
Code144584:
    ldh  a,[<$FF8C]                 ; 14:4584
    bit  1,a                        ; 14:4586
    jr   z,Code144593               ; 14:4588
    ld   a,$63                      ; 14:458A
    ldh  [<$FFF2],a                 ; 14:458C
    ld   a,$01                      ; 14:458E
    ldh  [<H_GameSubstate],a        ; 14:4590
    ret                             ; 14:4592

Code144593:
    bit  0,a                        ; 14:4593
    jr   z,Code1445A7               ; 14:4595
    ld   a,$73                      ; 14:4597
    ld   [$DE68],a                  ; 14:4599
    ld   a,$A0                      ; 14:459C
    ld   [$D901],a                  ; 14:459E
    call Sub0010AD                  ; 14:45A1
    jp   Sub144189                  ; 14:45A4
Code1445A7:
    bit  2,a                        ; 14:45A7
    jr   z,Code1445D0               ; 14:45A9
    ld   a,[$C4FE]                  ; 14:45AB
    inc  a                          ; 14:45AE
    cp   $05                        ; 14:45AF
    jr   nz,Code1445B4              ; 14:45B1
    xor  a                          ; 14:45B3
Code1445B4:
    ld   [$C4FE],a                  ; 14:45B4
    ld   c,a                        ; 14:45B7
    ld   b,$00                      ; 14:45B8
    ld   hl,Data144574              ; 14:45BA
    add  hl,bc                      ; 14:45BD
    ld   a,[hl]                     ; 14:45BE
    ld   [$D90E],a                  ; 14:45BF
    ld   hl,Data144579              ; 14:45C2
    add  hl,bc                      ; 14:45C5
    ld   a,[hl]                     ; 14:45C6
    ld   [$D90D],a                  ; 14:45C7
    ld   a,$47                      ; 14:45CA
    ldh  [<$FFF2],a                 ; 14:45CC
    jr   Code14464E                 ; 14:45CE
Code1445D0:
    ldh  a,[<$FF8C]                 ; 14:45D0
    and  $30                        ; 14:45D2
    jr   z,Code144608               ; 14:45D4
    and  $10                        ; 14:45D6
    swap a                          ; 14:45D8
    ld   c,a                        ; 14:45DA
    ld   b,$00                      ; 14:45DB
    ld   a,[$D90E]                  ; 14:45DD
    and  a                          ; 14:45E0
    jr   nz,Code1445EE              ; 14:45E1
    inc  a                          ; 14:45E3
    ld   [$D90E],a                  ; 14:45E4
    ld   a,c                        ; 14:45E7
    ld   [$D90D],a                  ; 14:45E8
    jp   Code144635                 ; 14:45EB
Code1445EE:
    ld   a,[$D90D]                  ; 14:45EE
    cp   c                          ; 14:45F1
    jr   nz,Code144601              ; 14:45F2
    ld   a,[$D90E]                  ; 14:45F4
    cp   $02                        ; 14:45F7
    jr   nz,Code14464E              ; 14:45F9
    dec  a                          ; 14:45FB
    ld   [$D90E],a                  ; 14:45FC
    jr   Code144635                 ; 14:45FF
Code144601:
    ld   a,c                        ; 14:4601
    ld   [$D90D],a                  ; 14:4602
    jp   Code144635                 ; 14:4605
Code144608:
    ldh  a,[<$FF8C]                 ; 14:4608
    and  $C0                        ; 14:460A
    jr   z,Code14464E               ; 14:460C
    and  $80                        ; 14:460E
    rlc  a                          ; 14:4610
    ld   c,a                        ; 14:4612
    ld   b,$00                      ; 14:4613
    ld   hl,Data144496              ; 14:4615
    add  hl,bc                      ; 14:4618
    ld   a,[$D90E]                  ; 14:4619
    cp   [hl]                       ; 14:461C
    jr   z,Code14464E               ; 14:461D
    cp   $00                        ; 14:461F
    jr   nz,Code14462A              ; 14:4621
    ld   a,$02                      ; 14:4623
    ld   [$D90E],a                  ; 14:4625
    jr   Code144635                 ; 14:4628
Code14462A:
    ld   hl,Data144494              ; 14:462A
    add  hl,bc                      ; 14:462D
    ld   a,[$D90E]                  ; 14:462E
    add  [hl]                       ; 14:4631
    ld   [$D90E],a                  ; 14:4632
Code144635:
    ld   a,[$D90E]                  ; 14:4635
    sla  a                          ; 14:4638
    ld   c,a                        ; 14:463A
    ld   a,[$D90D]                  ; 14:463B
    add  c                          ; 14:463E
    ld   c,a                        ; 14:463F
    ld   b,$00                      ; 14:4640
    ld   hl,Data14457E              ; 14:4642
    add  hl,bc                      ; 14:4645
    ld   a,[hl]                     ; 14:4646
    ld   [$C4FE],a                  ; 14:4647
    ld   a,$47                      ; 14:464A
    ldh  [<$FFF2],a                 ; 14:464C
Code14464E:
    ld   a,[$D90E]                  ; 14:464E
    sla  a                          ; 14:4651
    ld   c,a                        ; 14:4653
    ld   a,[$D90D]                  ; 14:4654
    or   c                          ; 14:4657
    sla  a                          ; 14:4658
    ld   c,a                        ; 14:465A
    ld   b,$00                      ; 14:465B
    ld   hl,Data14449A              ; 14:465D
    add  hl,bc                      ; 14:4660
    ldi  a,[hl]                     ; 14:4661
    ldh  [<$FF97],a                 ; 14:4662
    ld   a,[hl]                     ; 14:4664
    ldh  [<$FF98],a                 ; 14:4665
    ld   hl,DataPtrs144566          ; 14:4667
    ldh  a,[<$FFB7]                 ; 14:466A
    srl  a                          ; 14:466C
    and  $06                        ; 14:466E
    ld   c,a                        ; 14:4670
    ld   b,$00                      ; 14:4671
    add  hl,bc                      ; 14:4673
    ldi  a,[hl]                     ; 14:4674
    ld   h,[hl]                     ; 14:4675
    ld   l,a                        ; 14:4676
    ld   de,$C000                   ; 14:4677
    ld   c,$0C                      ; 14:467A
Code14467C:
    ldh  a,[<$FF97]                 ; 14:467C
    add  [hl]                       ; 14:467E
    ld   [de],a                     ; 14:467F
    inc  hl                         ; 14:4680
    inc  de                         ; 14:4681
    ldh  a,[<$FF98]                 ; 14:4682
    add  [hl]                       ; 14:4684
    ld   [de],a                     ; 14:4685
    inc  hl                         ; 14:4686
    inc  de                         ; 14:4687
    ldi  a,[hl]                     ; 14:4688
    ld   [de],a                     ; 14:4689
    inc  de                         ; 14:468A
    ldi  a,[hl]                     ; 14:468B
    ld   [de],a                     ; 14:468C
    inc  de                         ; 14:468D
    dec  c                          ; 14:468E
    jr   nz,Code14467C              ; 14:468F
    jp   Code00161D                 ; 14:4691

Data144694:                         ; 14:4694
.dw $7FFF,$03FF,$0B1F,$0000,$7BFF,$7DCC,$0B1F,$0000,\
    $7DCC,$03FF,$0B1F,$0000,$7FFF,$0013,$02BF,$0000,\
    $7BFF,$1CFF,$03FF,$0000,$7BFF,$7C00,$03FF,$0000,\
    $7BFF,$1CFF,$0B1F,$0000
Data1446CC:                         ; 14:46CC
.dw $7FFF,$1CFF,$02BF,$0000,$7FFF,$1220,$019F,$0000,\
    $1220,$7FFF,$019F,$0000,$7FFF,$0013,$019F,$0000,\
    $7FFF,$1220,$019F,$0000,$7FFF,$03FF,$019F,$0000,\
    $7FFF,$1220,$02BF,$0000
Data144704:                         ; 14:4704
.dw $7FFF,$1CFF,$02BF,$0000,$7FFF,$000E,$02BF,$0000,\
    $7FFF,$7CA1,$02BF,$0000,$7FFF,$0013,$02BF,$0000,\
    $7FFF,$1220,$02BF,$0000,$7FFF,$000E,$4416,$0000,\
    $7FFF,$0000,$0000,$0000
DataPtrs14473C:                     ; 14:473C
.dw Data144694, Data144704, Data144704, Data144704,\
    Data1446CC
Data144746:                         ; 14:4746
.db $04,$04,$04,$04,$04,$04,$04,$04,\
    $04,$00,$00,$00,$00,$00,$01,$01,\
    $00,$00,$05,$04,$04,$05,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$01,$01,$00,$00,$00,\
    $00,$00,$02,$06,$06,$02,$00,$00,\
    $00,$00,$01,$06,$06,$01,$01,$00,\
    $04,$04,$04,$04,$04,$04,$04,$04,\
    $00,$03,$03,$03,$03,$03,$03,$03,\
    $03,$03,$03,$03,$03,$03,$03,$03,\
    $03,$03,$03,$03,$03,$03,$03,$01,\
    $02,$01,$01,$02,$02,$01,$01,$02,\
    $01,$01,$01,$01,$01,$01,$01,$01,\
    $00,$03,$03,$03,$03,$03,$03,$04,\
    $03,$03,$03,$03,$03,$03,$03,$03,\
    $03,$03,$03,$03,$03,$03,$03,$03,\
    $03,$03,$03,$03,$03,$03,$03,$03,\
    $00,$04,$04,$04,$04,$04,$04,$00,\
    $00,$04,$04,$04,$04,$04,$04,$00,\
    $00,$04,$04,$02,$02,$04,$04,$00,\
    $00,$04,$01,$02,$02,$01,$04,$00,\
    $00,$04,$04,$03,$01,$00,$04,$00,\
    $04,$04,$04,$03,$03,$04,$04,$00,\
    $00,$04,$04,$04,$04,$00,$00,$00,\
    $05,$05,$05,$05,$05,$05,$05,$05,\
    $05,$05,$05,$05,$05,$05,$05,$05,\
    $04,$04,$04,$04,$04,$04,$04,$04,\
    $04,$04,$04,$04,$04,$04,$04,$04,\
    $04,$04,$04,$04,$04,$04,$04,$04,\
    $00,$04,$04,$04,$04,$04,$04,$00,\
    $04,$04,$04,$04,$04,$04,$04,$00,\
    $00,$00,$00,$04,$04,$04,$04,$04,\
    $00,$00,$00,$00,$04,$04,$04,$04,\
    $00,$03,$00,$00,$00,$00,$00,$00,\
    $00,$00,$03,$03,$03,$03,$03,$00,\
    $04,$04,$04,$04,$04,$04,$04,$04,\
    $05,$05,$01,$01,$05,$07,$06,$06,\
    $05,$05,$01,$05,$05,$05,$06,$06,\
    $05,$05,$01,$01,$05,$05,$06,$06,\
    $07,$01,$01,$01,$01,$07,$06,$06,\
    $07,$07,$07,$07,$07,$07,$06,$06,\
    $07,$07,$07,$07,$07,$07,$06,$06,\
    $00,$07,$07,$07,$07,$07,$06,$06,\
    $00,$07,$07,$07,$07,$00,$06,$06
DataPtrs1448AE:                     ; 14:48AE
.dw Data315800, Data315EC0, Data316580, Data316C40,\
    Data317300
DataPtrs1448B8:                     ; 14:48B8
.dw Data315B60, Data316220, Data3168E0, Data316FA0,\
    Data317660
.db $00,$20,$60,$A0
Data1448C6:                         ; 14:48C6
.db $E0

Code1448C7:
    ld   a,[$D901]                  ; 14:48C7
    and  a                          ; 14:48CA
    jr   z,Code144905               ; 14:48CB
    dec  a                          ; 14:48CD
    ld   [$D901],a                  ; 14:48CE
    and  $07                        ; 14:48D1
    jp   nz,Code14464E              ; 14:48D3
    ld   a,[$DF92]                  ; 14:48D6
    ld   b,a                        ; 14:48D9
    ld   a,[$DF93]                  ; 14:48DA
    ld   c,a                        ; 14:48DD
    ld   a,[$DF96]                  ; 14:48DE
    ld   [$DF92],a                  ; 14:48E1
    ld   a,[$DF97]                  ; 14:48E4
    ld   [$DF93],a                  ; 14:48E7
    ld   a,[$DF94]                  ; 14:48EA
    ld   [$DF96],a                  ; 14:48ED
    ld   a,[$DF95]                  ; 14:48F0
    ld   [$DF97],a                  ; 14:48F3
    ld   a,b                        ; 14:48F6
    ld   [$DF94],a                  ; 14:48F7
    ld   a,c                        ; 14:48FA
    ld   [$DF95],a                  ; 14:48FB
    ld   a,$01                      ; 14:48FE
    ldh  [<$FFC0],a                 ; 14:4900
    jp   Code14464E                 ; 14:4902
Code144905:
    call Sub00126D                  ; 14:4905
    xor  a                          ; 14:4908
    ldh  [<IE],a                    ; 14:4909
    ldh  [<$FF93],a                 ; 14:490B
    ld   a,$23                      ; 14:490D
    ld   [$C415],a                  ; 14:490F
    call Sub0010E4                  ; 14:4912
    ld   b,$04                      ; 14:4915
    ld   hl,Data1448C6              ; 14:4917
Code14491A:
    cp   [hl]                       ; 14:491A
    jr   nc,Code144921              ; 14:491B
    dec  hl                         ; 14:491D
    dec  b                          ; 14:491E
    jr   nz,Code14491A              ; 14:491F
Code144921:
    ld   a,b                        ; 14:4921
    ldh  [<$FF97],a                 ; 14:4922
    ld   b,a                        ; 14:4924
    ld   c,$00                      ; 14:4925
    sla  a                          ; 14:4927
    sla  a                          ; 14:4929
    sla  a                          ; 14:492B
    add  b                          ; 14:492D
    srl  a                          ; 14:492E
    rr   c                          ; 14:4930
    ld   b,a                        ; 14:4932
    push bc                         ; 14:4933
    ld   hl,Data235800              ; 14:4934
    add  hl,bc                      ; 14:4937
    ld   de,$9300                   ; 14:4938
    ld   bc,$0480                   ; 14:493B
    ld   a,$14                      ; 14:493E
    call CopyBytesLong              ; 14:4940
    ld   a,$02                      ; 14:4943
    ldh  [<SVBK],a                  ; 14:4945
    ld   hl,$8800                   ; 14:4947
    ld   de,$D800                   ; 14:494A
    ld   bc,$0800                   ; 14:494D
    call CopyBytes                  ; 14:4950
    ld   de,$D000                   ; 14:4953
    ld   bc,$0800                   ; 14:4956
    call CopyBytes                  ; 14:4959
    pop  bc                         ; 14:495C
    ld   a,$28                      ; 14:495D
    ld   [$C415],a                  ; 14:495F
    ld   hl,Data2861C0              ; 14:4962
    add  hl,bc                      ; 14:4965
    ld   de,$D300                   ; 14:4966
    ld   bc,$0480                   ; 14:4969
    ld   a,$14                      ; 14:496C
    call CopyBytesLong              ; 14:496E
    ld   a,$00                      ; 14:4971
    ldh  [<SVBK],a                  ; 14:4973
    ld   a,$23                      ; 14:4975
    ld   [$C415],a                  ; 14:4977
    ld   hl,Data237800              ; 14:497A
    ld   de,$D000                   ; 14:497D
    ld   bc,$0240                   ; 14:4980
    ld   a,$14                      ; 14:4983
    call CopyBytesLong              ; 14:4985
    ld   hl,Data237C00              ; 14:4988
    ld   de,$D240                   ; 14:498B
    ld   bc,$0240                   ; 14:498E
    ld   a,$14                      ; 14:4991
    call CopyBytesLong              ; 14:4993
    ldh  a,[<$FF97]                 ; 14:4996
    sla  a                          ; 14:4998
    ld   c,a                        ; 14:499A
    ld   b,$00                      ; 14:499B
    ld   hl,DataPtrs14473C          ; 14:499D
    add  hl,bc                      ; 14:49A0
    ldi  a,[hl]                     ; 14:49A1
    ld   h,[hl]                     ; 14:49A2
    ld   l,a                        ; 14:49A3
    ld   de,$DF80                   ; 14:49A4
    ld   bc,$0038                   ; 14:49A7
    call CopyBytes                  ; 14:49AA
    ld   a,$01                      ; 14:49AD
    ldh  [<$FFC0],a                 ; 14:49AF
    call Sub000E29                  ; 14:49B1
    ldh  a,[<$FF97]                 ; 14:49B4
    ld   c,a                        ; 14:49B6
    sla  a                          ; 14:49B7
    sla  a                          ; 14:49B9
    sla  a                          ; 14:49BB
    add  c                          ; 14:49BD
    ld   b,$00                      ; 14:49BE
    sla  a                          ; 14:49C0
    rl   b                          ; 14:49C2
    sla  a                          ; 14:49C4
    rl   b                          ; 14:49C6
    sla  a                          ; 14:49C8
    rl   b                          ; 14:49CA
    ld   c,a                        ; 14:49CC
    ld   hl,Data144746              ; 14:49CD
    add  hl,bc                      ; 14:49D0
    ld   de,$D286                   ; 14:49D1
    call Sub144ACE                  ; 14:49D4
    call Sub0010E4                  ; 14:49D7
    ld   c,a                        ; 14:49DA
    ld   b,$00                      ; 14:49DB
    sla  a                          ; 14:49DD
    rl   b                          ; 14:49DF
    add  c                          ; 14:49E1
    ld   c,a                        ; 14:49E2
    ld   a,b                        ; 14:49E3
    adc  $00                        ; 14:49E4
    ld   b,a                        ; 14:49E6
    sla  c                          ; 14:49E7
    rl   b                          ; 14:49E9
    sla  c                          ; 14:49EB
    rl   b                          ; 14:49ED
    ld   a,b                        ; 14:49EF
    ld   c,a                        ; 14:49F0
    ld   b,$00                      ; 14:49F1
    sla  a                          ; 14:49F3
    sla  a                          ; 14:49F5
    sla  a                          ; 14:49F7
    add  c                          ; 14:49F9
    sla  a                          ; 14:49FA
    rl   b                          ; 14:49FC
    sla  a                          ; 14:49FE
    rl   b                          ; 14:4A00
    sla  a                          ; 14:4A02
    rl   b                          ; 14:4A04
    ld   c,a                        ; 14:4A06
    ld   a,$31                      ; 14:4A07
    ld   [$C415],a                  ; 14:4A09
    ldh  a,[<$FF97]                 ; 14:4A0C
    sla  a                          ; 14:4A0E
    ld   e,a                        ; 14:4A10
    ld   d,$00                      ; 14:4A11
    push bc                         ; 14:4A13
    push de                         ; 14:4A14
    ld   hl,DataPtrs1448AE          ; 14:4A15
    add  hl,de                      ; 14:4A18
    ldi  a,[hl]                     ; 14:4A19
    add  c                          ; 14:4A1A
    ld   e,a                        ; 14:4A1B
    ld   a,[hl]                     ; 14:4A1C
    adc  b                          ; 14:4A1D
    ld   d,a                        ; 14:4A1E
    ld   hl,$D1A1                   ; 14:4A1F
    ld   a,$14                      ; 14:4A22
    call Sub001596                  ; 14:4A24
    pop  de                         ; 14:4A27
    pop  bc                         ; 14:4A28
    ld   hl,DataPtrs1448B8          ; 14:4A29
    add  hl,de                      ; 14:4A2C
    ldi  a,[hl]                     ; 14:4A2D
    add  c                          ; 14:4A2E
    ld   e,a                        ; 14:4A2F
    ld   a,[hl]                     ; 14:4A30
    adc  b                          ; 14:4A31
    ld   d,a                        ; 14:4A32
    ld   hl,$D3E1                   ; 14:4A33
    ld   a,$14                      ; 14:4A36
    call Sub001596                  ; 14:4A38
    ld   a,$01                      ; 14:4A3B
    ldh  [<VBK],a                   ; 14:4A3D
    ld   hl,$D240                   ; 14:4A3F
    ld   de,$9800                   ; 14:4A42
    ld   bc,$0240                   ; 14:4A45
    call CopyBytes                  ; 14:4A48
    xor  a                          ; 14:4A4B
    ldh  [<VBK],a                   ; 14:4A4C
    ld   hl,$D000                   ; 14:4A4E
    ld   de,$9800                   ; 14:4A51
    ld   bc,$0240                   ; 14:4A54
    call CopyBytes                  ; 14:4A57
    call Sub144A8E                  ; 14:4A5A
    ld   a,$01                      ; 14:4A5D
    ld   [$CDF3],a                  ; 14:4A5F
    ld   a,$00                      ; 14:4A62
    ld   [$D913],a                  ; 14:4A64
    ld   a,$D0                      ; 14:4A67
    ld   [$D914],a                  ; 14:4A69
    ld   a,$02                      ; 14:4A6C
    ld   [$D915],a                  ; 14:4A6E
    ld   a,$09                      ; 14:4A71
    ld   [$CDF4],a                  ; 14:4A73
    xor  a                          ; 14:4A76
    ldh  [<$FFB8],a                 ; 14:4A77
    ldh  [<$FFB9],a                 ; 14:4A79
    ldh  [<$FFBA],a                 ; 14:4A7B
    ldh  [<$FFBB],a                 ; 14:4A7D
    ld   a,$09                      ; 14:4A7F
    ldh  [<IE],a                    ; 14:4A81
    ldh  [<$FF93],a                 ; 14:4A83
    ldh  a,[<LCDC]                  ; 14:4A85
    set  7,a                        ; 14:4A87
    ldh  [<LCDC],a                  ; 14:4A89
    jp   Sub144189                  ; 14:4A8B

Sub144A8E:
    ldh  a,[<$FF97]                 ; 14:4A8E
    rst  $00                        ; 14:4A90
.dw Code144A9B                      ; 14:4A91
.dw Code144AB6                      ; 14:4A93
.dw Code144ABB                      ; 14:4A95
.dw Code144AC0                      ; 14:4A97
.dw Code144AC8                      ; 14:4A99
Code144A9B:
    ld   a,$7B                      ; 14:4A9B
    ld   [$DE68],a                  ; 14:4A9D
    ld   a,[$C1B2]                  ; 14:4AA0
    and  a                          ; 14:4AA3
    ret  nz                         ; 14:4AA4
    ld   a,$01                      ; 14:4AA5
    ld   [$C1B2],a                  ; 14:4AA7
    ld   a,$90                      ; 14:4AAA
    ld   [$C4E6],a                  ; 14:4AAC
    xor  a                          ; 14:4AAF
    ld   [$C4E7],a                  ; 14:4AB0
    jp   Sub144189                  ; 14:4AB3
Code144AB6:
    ld   a,$24                      ; 14:4AB6
    ldh  [<$FFF3],a                 ; 14:4AB8
    ret                             ; 14:4ABA

Code144ABB:
    ld   a,$24                      ; 14:4ABB
    ldh  [<$FFF3],a                 ; 14:4ABD
    ret                             ; 14:4ABF

Code144AC0:
    xor  a                          ; 14:4AC0
    ldh  [<$FFF2],a                 ; 14:4AC1
    ld   a,$30                      ; 14:4AC3
    ldh  [<$FFF3],a                 ; 14:4AC5
    ret                             ; 14:4AC7

Code144AC8:
    ld   a,$79                      ; 14:4AC8
    ld   [$DE68],a                  ; 14:4ACA
    ret                             ; 14:4ACD

Sub144ACE:
    ld   b,$09                      ; 14:4ACE
Code144AD0:
    ld   c,$08                      ; 14:4AD0
Code144AD2:
    ldi  a,[hl]                     ; 14:4AD2
    ld   [de],a                     ; 14:4AD3
    inc  de                         ; 14:4AD4
    dec  c                          ; 14:4AD5
    jr   nz,Code144AD2              ; 14:4AD6
    ld   a,e                        ; 14:4AD8
    add  $18                        ; 14:4AD9
    ld   e,a                        ; 14:4ADB
    ld   a,d                        ; 14:4ADC
    adc  $00                        ; 14:4ADD
    ld   d,a                        ; 14:4ADF
    dec  b                          ; 14:4AE0
    jr   nz,Code144AD0              ; 14:4AE1
    ret                             ; 14:4AE3

Code144AE4:
    ldh  a,[<$FF8C]                 ; 14:4AE4
    bit  1,a                        ; 14:4AE6
    jr   z,Code144AF3               ; 14:4AE8
    ld   a,$63                      ; 14:4AEA
    ldh  [<$FFF2],a                 ; 14:4AEC
    ld   a,$01                      ; 14:4AEE
    ldh  [<H_GameSubstate],a        ; 14:4AF0
    ret                             ; 14:4AF2

Code144AF3:
    bit  0,a                        ; 14:4AF3
    jr   z,Return144B12             ; 14:4AF5
    ld   a,$31                      ; 14:4AF7
    ldh  [<$FFF3],a                 ; 14:4AF9
    ldh  a,[<H_GameState]           ; 14:4AFB
    ld   [$C416],a                  ; 14:4AFD
    ldh  a,[<H_GameSubstate]        ; 14:4B00
    ld   [$C417],a                  ; 14:4B02
    ld   a,$2E                      ; 14:4B05
    ldh  [<H_GameState],a           ; 14:4B07
    xor  a                          ; 14:4B09
    ldh  [<H_GameSubstate],a        ; 14:4B0A
    ld   [$C418],a                  ; 14:4B0C
    jp   Sub0010AD                  ; 14:4B0F
Return144B12:
    ret                             ; 14:4B12

Data144B13:                         ; 14:4B13
.db $18,$68,$20,$02,$10,$70,$22,$02,\
    $20,$70,$24,$02,$18,$78,$26,$02,\
    $28,$78,$28,$02,$18,$80,$2A,$02,\
    $28,$80,$2C,$02,$18,$88,$2E,$02,\
    $28,$88,$30,$02
Code144B37:
    ld   a,[$C4E6]                  ; 14:4B37
    sub  $02                        ; 14:4B3A
    ld   [$C4E6],a                  ; 14:4B3C
    cp   $3C                        ; 14:4B3F
    jr   nz,Code144B4F              ; 14:4B41
    ld   a,$29                      ; 14:4B43
    ldh  [<$FFF3],a                 ; 14:4B45
    ld   a,$F0                      ; 14:4B47
    ld   [$C4E8],a                  ; 14:4B49
    call Sub144189                  ; 14:4B4C
Code144B4F:
    ld   hl,$C000                   ; 14:4B4F
    ld   de,Data144B13              ; 14:4B52
    ld   c,$09                      ; 14:4B55
    ld   a,[$C4E6]                  ; 14:4B57
    ld   b,a                        ; 14:4B5A
Code144B5B:
    ld   a,[de]                     ; 14:4B5B
    add  b                          ; 14:4B5C
    ldi  [hl],a                     ; 14:4B5D
    inc  de                         ; 14:4B5E
    ld   a,[de]                     ; 14:4B5F
    ldi  [hl],a                     ; 14:4B60
    inc  de                         ; 14:4B61
    ld   a,[de]                     ; 14:4B62
    ldi  [hl],a                     ; 14:4B63
    inc  de                         ; 14:4B64
    ld   a,[de]                     ; 14:4B65
    ldi  [hl],a                     ; 14:4B66
    inc  de                         ; 14:4B67
    dec  c                          ; 14:4B68
    jr   nz,Code144B5B              ; 14:4B69
    ret                             ; 14:4B6B

Code144B6C:
    ld   a,[$C4E8]                  ; 14:4B6C
    dec  a                          ; 14:4B6F
    ld   [$C4E8],a                  ; 14:4B70
    jr   nz,Code144B7A              ; 14:4B73
    ld   a,$06                      ; 14:4B75
    ldh  [<H_GameSubstate],a        ; 14:4B77
    ret                             ; 14:4B79

Code144B7A:
    jp   Code144B4F                 ; 14:4B7A

Data144B7D:                         ; 14:4B7D
.dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$294A,$56B5,$7FFF,$0000,$02E7,$0000,$7FFF,\
    $0000,$294A,$56B5,$7FFF,$0000,$294A,$56B5,$7FFF,\
    $0000,$294A,$56B5,$7FFF,$0000,$294A,$56B5,$7FFF,\
    $0000,$294A,$56B5,$7FFF,$50A6,$3F9F,$25DA,$0000,\
    $7FFF,$00F0,$7FFF,$7FFF,$7FFF,$00F0,$7FFF,$7FFF,\
    $7FFF,$00F0,$7FFF,$7FFF,$7FFF,$00F0,$7FFF,$7FFF,\
    $7FFF,$00F0,$7FFF,$7FFF,$7FFF,$00F0,$7FFF,$7FFF,\
    $7FFF,$00F0,$7FFF,$7FFF,$7FFF,$00F0,$7FFF,$7FFF,\
    $7FFF,$00F0,$7FFF,$7FFF,$7FFF,$00F0,$7FFF,$7FFF,\
    $0000,$0000,$7FFF,$7FFF,$0000,$0000,$7FFF,$7FFF,\
    $0000,$0000,$7FFF,$7FFF,$0000,$0000,$7FFF,$7FFF,\
    $0000,$0000,$7FFF,$7FFF,$0000,$0000,$7FFF,$7FFF,\
    $0000,$0000,$7FFF,$7FFF,$0000,$0000,$7FFF,$7FFF,\
    $0000,$0000,$7FFF,$7FFF,$0000,$0000,$7FFF,$7FFF,\
    $0000,$0000,$7FFF,$7FFF,$0000,$0000,$7FFF,$7FFF,\
    $0000,$0000,$7FFF,$7FFF,$0000,$0000,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $414E,$314B,$3839,$2039,$2D53,$4743,$432D,$4441,\
    $6556,$3172,$322E,$2033,$3039,$3231,$3632,$2020,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,\
    $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

Code144FBD:
    call Sub001258                  ; 14:4FBD
    xor  a                          ; 14:4FC0
    ldh  [<IE],a                    ; 14:4FC1
    ldh  [<$FF93],a                 ; 14:4FC3
    xor  a                          ; 14:4FC5
    ldh  [<VBK],a                   ; 14:4FC6
    ld   a,$25                      ; 14:4FC8
    ld   [$C415],a                  ; 14:4FCA
    ld   hl,Data257000              ; 14:4FCD
    ld   de,$8000                   ; 14:4FD0
    ld   bc,$0800                   ; 14:4FD3
    ld   a,$14                      ; 14:4FD6
    call CopyBytesLong              ; 14:4FD8
    ld   a,$17                      ; 14:4FDB
    ld   [$C415],a                  ; 14:4FDD
    ld   hl,Data176000              ; 14:4FE0
    ld   de,$8800                   ; 14:4FE3
    ld   bc,$1000                   ; 14:4FE6
    ld   a,$14                      ; 14:4FE9
    call CopyBytesLong              ; 14:4FEB
    ld   a,$14                      ; 14:4FEE
    ld   b,$14                      ; 14:4FF0
    ld   de,Data144B7D              ; 14:4FF2
    call LoadFullPaletteLong        ; 14:4FF5
    xor  a                          ; 14:4FF8
    ld   [$D912],a                  ; 14:4FF9
    ld   a,[Data145014]             ; 14:4FFC
    ld   [$D90C],a                  ; 14:4FFF
    ld   a,$7F                      ; 14:5002
    ld   [$DE68],a                  ; 14:5004
    ld   a,$01                      ; 14:5007
    ldh  [<IE],a                    ; 14:5009
    ldh  [<$FF93],a                 ; 14:500B
    ld   a,$E3                      ; 14:500D
    ldh  [<LCDC],a                  ; 14:500F
    jp   Sub144189                  ; 14:5011

Data145014:                         ; 14:5014
.db $01,$02,$04,$08,$10,$20,$40,$80,\
    $3C
Data14501D:                         ; 14:501D
.db $18,$28,$10,$00,$18,$30,$11,$00,\
    $18,$38,$12,$00,$18,$40,$13,$00,\
    $18,$50,$15,$00,$18,$58,$16,$00,\
    $18,$68,$19,$00,$18,$70,$1A,$00,\
    $18,$78,$1B,$00,$18,$80,$1C,$00,\
    $28,$48,$34,$00,$28,$58,$36,$00
Data14504D:                         ; 14:504D
.db $80,$08,$20,$01,$80,$10,$21,$01,\
    $88,$08,$30,$01,$88,$10,$31,$01,\
    $88,$18,$32,$01,$90,$08,$40,$01,\
    $90,$10,$41,$01,$90,$18,$42,$01,\
    $90,$20,$43,$01,$98,$08,$50,$01,\
    $98,$10,$51,$01,$98,$18,$52,$01,\
    $98,$20,$53,$01,$80,$98,$2E,$01,\
    $80,$A0,$2F,$01,$88,$90,$3D,$01,\
    $88,$98,$3E,$01,$88,$A0,$3F,$01,\
    $90,$88,$4C,$01,$90,$90,$4D,$01,\
    $90,$98,$4E,$01,$90,$A0,$4F,$01,\
    $98,$88,$5C,$01,$98,$90,$5D,$01,\
    $98,$98,$5E,$01,$98,$A0,$5F,$01

Code1450B5:
    call Sub145110                  ; 14:50B5
    ldh  a,[<$FF8C]                 ; 14:50B8
    bit  1,a                        ; 14:50BA
    jr   z,Code1450C7               ; 14:50BC
    ld   a,$01                      ; 14:50BE
    ldh  [<H_GameSubstate],a        ; 14:50C0
    ld   a,$63                      ; 14:50C2
    ldh  [<$FFF2],a                 ; 14:50C4
    ret                             ; 14:50C6

Code1450C7:
    bit  0,a                        ; 14:50C7
    jr   z,Code1450D8               ; 14:50C9
    ld   a,[$D912]                  ; 14:50CB
    inc  a                          ; 14:50CE
    ld   [$D912],a                  ; 14:50CF
    call Sub0010A9                  ; 14:50D2
    call Sub144189                  ; 14:50D5
Code1450D8:
    ld   de,$C000                   ; 14:50D8
    ld   a,$28                      ; 14:50DB
    ld   [de],a                     ; 14:50DD
    inc  de                         ; 14:50DE
    ld   a,$50                      ; 14:50DF
    ld   [de],a                     ; 14:50E1
    inc  de                         ; 14:50E2
    ld   a,[$D910]                  ; 14:50E3
    ld   [de],a                     ; 14:50E6
    inc  de                         ; 14:50E7
    xor  a                          ; 14:50E8
    ld   [de],a                     ; 14:50E9
    inc  de                         ; 14:50EA
    ld   a,$28                      ; 14:50EB
    ld   [de],a                     ; 14:50ED
    inc  de                         ; 14:50EE
    ld   a,$60                      ; 14:50EF
    ld   [de],a                     ; 14:50F1
    inc  de                         ; 14:50F2
    ld   a,[$D911]                  ; 14:50F3
    ld   [de],a                     ; 14:50F6
    inc  de                         ; 14:50F7
    xor  a                          ; 14:50F8
    ld   [de],a                     ; 14:50F9
    inc  de                         ; 14:50FA
    ld   hl,Data14501D              ; 14:50FB
    ld   b,$26                      ; 14:50FE
Code145100:
    ldi  a,[hl]                     ; 14:5100
    ld   [de],a                     ; 14:5101
    inc  de                         ; 14:5102
    ldi  a,[hl]                     ; 14:5103
    ld   [de],a                     ; 14:5104
    inc  de                         ; 14:5105
    ldi  a,[hl]                     ; 14:5106
    ld   [de],a                     ; 14:5107
    inc  de                         ; 14:5108
    ldi  a,[hl]                     ; 14:5109
    ld   [de],a                     ; 14:510A
    inc  de                         ; 14:510B
    dec  b                          ; 14:510C
    jr   nz,Code145100              ; 14:510D
    ret                             ; 14:510F

Sub145110:
    ld   a,[$D90C]                  ; 14:5110
    dec  a                          ; 14:5113
    ld   [$D90C],a                  ; 14:5114
    jp   nz,Code14519F              ; 14:5117
    ld   a,$47                      ; 14:511A
    ldh  [<$FFF2],a                 ; 14:511C
Code14511E:
    call Sub0010E4                  ; 14:511E
    and  $07                        ; 14:5121
    ld   c,a                        ; 14:5123
    call Sub0010E4                  ; 14:5124
    and  $03                        ; 14:5127
    ld   b,a                        ; 14:5129
    ld   a,[$D911]                  ; 14:512A
    cp   b                          ; 14:512D
    jr   nz,Code145136              ; 14:512E
    ld   a,[$D910]                  ; 14:5130
    cp   c                          ; 14:5133
    jr   z,Code14511E               ; 14:5134
Code145136:
    ld   a,c                        ; 14:5136
    ld   [$D910],a                  ; 14:5137
    ld   a,b                        ; 14:513A
    ld   [$D911],a                  ; 14:513B
    ldh  a,[<H_GameSubstate]        ; 14:513E
    cp   $16                        ; 14:5140
    jr   z,Code145191               ; 14:5142
    ld   a,[$D912]                  ; 14:5144
    inc  a                          ; 14:5147
    ld   [$D912],a                  ; 14:5148
    cp   $08                        ; 14:514B
    jp   nz,Code145191              ; 14:514D
    ld   a,[$D910]                  ; 14:5150
    sla  a                          ; 14:5153
    sla  a                          ; 14:5155
    ld   c,a                        ; 14:5157
    ld   a,[$D911]                  ; 14:5158
    add  c                          ; 14:515B
    ld   [W_LevelID],a              ; 14:515C
Code14515F:
    ld   a,$14                      ; 14:515F
    rst  $10                        ; 14:5161
.dl SubL_075B10                     ; 14:5162
    ld   a,[$C194]                  ; 14:5165
    and  a                          ; 14:5168
    jr   z,Code14517D               ; 14:5169
    call Sub0010E4                  ; 14:516B
    and  $03                        ; 14:516E
    jr   z,Code14517D               ; 14:5170
    ld   a,[W_LevelID]              ; 14:5172
    inc  a                          ; 14:5175
    and  $1F                        ; 14:5176
    ld   [W_LevelID],a              ; 14:5178
    jr   Code14515F                 ; 14:517B
Code14517D:
    ld   a,[W_LevelID]              ; 14:517D
    ld   c,a                        ; 14:5180
    and  $03                        ; 14:5181
    ld   [$D911],a                  ; 14:5183
    ld   a,c                        ; 14:5186
    srl  a                          ; 14:5187
    srl  a                          ; 14:5189
    ld   [$D910],a                  ; 14:518B
    call Sub144189                  ; 14:518E
Code145191:
    ld   a,[$D912]                  ; 14:5191
    ld   c,a                        ; 14:5194
    ld   b,$00                      ; 14:5195
    ld   hl,Data145014              ; 14:5197
    add  hl,bc                      ; 14:519A
    ld   a,[hl]                     ; 14:519B
    ld   [$D90C],a                  ; 14:519C
Code14519F:
    jp   Code1450D8                 ; 14:519F

DataPtrs1451A2:                     ; 14:51A2
.dl Data264000, Data2642D0, Data2645A0, Data264870,\
    Data264B40, Data264E10, Data2650E0, Data2653B0,\
    Data265680, Data265950, Data265C20, Data265EF0,\
    Data2661C0, Data266490, Data266760, Data266A30,\
    Data266D00, Data266FD0, Data2672A0, Data267570,\
    Data267840, Data267B10, Data274000, Data2742D0,\
    Data2745A0, Data274870, Data274B40, Data274E10,\
    Data2750E0, Data2753B0, Data275680, Data275950
DataPtrs145202:                     ; 14:5202
.dl Data044000, Data044040, Data044000, Data0440C0,\
    Data044000, Data044080, Data044000, Data0440C0,\
    Data044100, Data044100, Data044180, Data0440C0,\
    Data044000, Data044040, Data044340, Data0440C0,\
    Data044140, Data044140, Data044000, Data0440C0,\
    Data044180, Data044180, Data0441C0, Data0440C0,\
    Data044140, Data044080, Data044000, Data0440C0,\
    Data044000, Data044000, Data044000, Data044380

Code145262:
    ld   a,[$D90C]                  ; 14:5262
    dec  a                          ; 14:5265
    ld   [$D90C],a                  ; 14:5266
    jp   nz,Code1450D8              ; 14:5269
    ld   a,[$D911]                  ; 14:526C
    ld   c,a                        ; 14:526F
    ld   a,[$D910]                  ; 14:5270
    sla  a                          ; 14:5273
    sla  a                          ; 14:5275
    add  c                          ; 14:5277
    ld   c,a                        ; 14:5278
    sla  a                          ; 14:5279
    add  c                          ; 14:527B
    ld   c,a                        ; 14:527C
    ld   b,$00                      ; 14:527D
    push bc                         ; 14:527F
    ld   hl,DataPtrs1451A2          ; 14:5280
    add  hl,bc                      ; 14:5283
    ld   c,[hl]                     ; 14:5284
    inc  hl                         ; 14:5285
    ld   b,[hl]                     ; 14:5286
    inc  hl                         ; 14:5287
    ld   a,[hl]                     ; 14:5288
    ld   [$C415],a                  ; 14:5289
    ld   l,c                        ; 14:528C
    ld   h,b                        ; 14:528D
    ld   a,$14                      ; 14:528E
    call Sub001570                  ; 14:5290
    ld   a,$01                      ; 14:5293
    ld   [$C423],a                  ; 14:5295
    ld   a,$00                      ; 14:5298
    ld   [$C425],a                  ; 14:529A
    ld   a,$D0                      ; 14:529D
    ld   [$C426],a                  ; 14:529F
    ld   a,$40                      ; 14:52A2
    ld   [$C427],a                  ; 14:52A4
    ld   a,$D2                      ; 14:52A7
    ld   [$C428],a                  ; 14:52A9
    pop  bc                         ; 14:52AC
    ld   hl,DataPtrs145202          ; 14:52AD
    add  hl,bc                      ; 14:52B0
    ld   c,[hl]                     ; 14:52B1
    inc  hl                         ; 14:52B2
    ld   b,[hl]                     ; 14:52B3
    inc  hl                         ; 14:52B4
    ld   a,[hl]                     ; 14:52B5
    ld   [$C415],a                  ; 14:52B6
    ld   l,c                        ; 14:52B9
    ld   h,b                        ; 14:52BA
    ld   de,$DF80                   ; 14:52BB
    ld   bc,$0040                   ; 14:52BE
    ld   a,$14                      ; 14:52C1
    call CopyBytesLong              ; 14:52C3
    ld   a,$01                      ; 14:52C6
    ldh  [<$FFC0],a                 ; 14:52C8
    ld   a,$70                      ; 14:52CA
    ldh  [<$FFF2],a                 ; 14:52CC
    call Sub145306                  ; 14:52CE
    jp   Sub144189                  ; 14:52D1
Code1452D4:
    ldh  a,[<$FF8C]                 ; 14:52D4
    bit  1,a                        ; 14:52D6
    jr   z,Code1452E3               ; 14:52D8
    ld   a,$01                      ; 14:52DA
    ldh  [<H_GameSubstate],a        ; 14:52DC
    ld   a,$63                      ; 14:52DE
    ldh  [<$FFF2],a                 ; 14:52E0
    ret                             ; 14:52E2

Code1452E3:
    bit  0,a                        ; 14:52E3
    jr   z,Sub145306                ; 14:52E5
    ld   b,$40                      ; 14:52E7
    ld   hl,$DF80                   ; 14:52E9
    xor  a                          ; 14:52EC
Code1452ED:
    ldi  [hl],a                     ; 14:52ED
    dec  b                          ; 14:52EE
    jr   nz,Code1452ED              ; 14:52EF
    ld   a,$01                      ; 14:52F1
    ldh  [<$FFC0],a                 ; 14:52F3
    xor  a                          ; 14:52F5
    ld   [$D912],a                  ; 14:52F6
    ld   a,[Data145014]             ; 14:52F9
    ld   [$D90C],a                  ; 14:52FC
    call Sub0010A9                  ; 14:52FF
    ld   a,$16                      ; 14:5302
    ldh  [<H_GameSubstate],a        ; 14:5304

Sub145306:
    ld   hl,Data14504D              ; 14:5306
    ld   de,$C000                   ; 14:5309
    ld   b,$1A                      ; 14:530C
    jp   Code145100                 ; 14:530E

Unused145311:
    ld   a,$14                      ; 14:5311
    call Unused000F0A               ; 14:5313
    ret                             ; 14:5316

Data145317:                         ; 14:5317
.dw $7FFF,$03FF,$001F,$0000,$7FFF,$4E7F,$00AD,$0017,\
    $7FFF,$03FF,$7CC6,$0000,$36BF,$02C0,$00AD,$0000,\
    $36BF,$0015,$00AD,$0000,$7FFF,$7ED4,$0340,$7400,\
    $7FFF,$4EB3,$00AD,$0000,$7FFF,$04D3,$22FF,$0000,\
    $7FFF,$6801,$6B4A,$0000,$7FFF,$4210,$294A,$0000,\
    $7FFF,$4210,$294A,$0000,$7FFF,$4210,$294A,$0000,\
    $7FFF,$4210,$294A,$0000,$7FFF,$4210,$294A,$0000,\
    $7DE0,$7FFF,$02BC,$0019,$7FFF,$22FF,$04D3,$0000
Data145397:                         ; 14:5397
.incbin "data/Tilemaps/Data145397.bin"

Code145667:
    call Sub00126D                  ; 14:5667
    xor  a                          ; 14:566A
    ldh  [<IE],a                    ; 14:566B
    ldh  [<$FF93],a                 ; 14:566D
    xor  a                          ; 14:566F
    ldh  [<VBK],a                   ; 14:5670
    ld   a,$24                      ; 14:5672
    ld   bc,Data244000              ; 14:5674
    ld   de,$8000                   ; 14:5677
    ld   h,$14                      ; 14:567A
    ld   l,$7F                      ; 14:567C
    call DMATransfer                ; 14:567E
    ld   a,$24                      ; 14:5681
    ld   bc,Data244800              ; 14:5683
    ld   de,$8800                   ; 14:5686
    ld   h,$14                      ; 14:5689
    ld   l,$7F                      ; 14:568B
    call DMATransfer                ; 14:568D
    ld   a,$24                      ; 14:5690
    ld   bc,Data245000              ; 14:5692
    ld   de,$9000                   ; 14:5695
    ld   h,$14                      ; 14:5698
    ld   l,$7F                      ; 14:569A
    call DMATransfer                ; 14:569C
    ld   a,$24                      ; 14:569F
    ld   [$C415],a                  ; 14:56A1
    ld   a,$02                      ; 14:56A4
    ldh  [<SVBK],a                  ; 14:56A6
    ld   hl,Data245000              ; 14:56A8
    ld   de,$D000                   ; 14:56AB
    ld   bc,$0800                   ; 14:56AE
    ld   a,$14                      ; 14:56B1
    call CopyBytesLong              ; 14:56B3
    ld   hl,Data244800              ; 14:56B6
    ld   bc,$0800                   ; 14:56B9
    ld   a,$14                      ; 14:56BC
    call CopyBytesLong              ; 14:56BE
    xor  a                          ; 14:56C1
    ldh  [<SVBK],a                  ; 14:56C2
    ld   a,$14                      ; 14:56C4
    ld   b,$14                      ; 14:56C6
    ld   de,Data145317              ; 14:56C8
    call LoadFullPaletteLong        ; 14:56CB
    call Sub000E29                  ; 14:56CE
    ld   hl,Data145397              ; 14:56D1
    ld   a,$14                      ; 14:56D4
    ld   [$C415],a                  ; 14:56D6
    ld   a,$14                      ; 14:56D9
    call Sub001570                  ; 14:56DB
    ld   a,$01                      ; 14:56DE
    ldh  [<VBK],a                   ; 14:56E0
    ld   de,$9800                   ; 14:56E2
    ld   hl,$D240                   ; 14:56E5
    ld   bc,$0240                   ; 14:56E8
    call CopyBytes                  ; 14:56EB
    xor  a                          ; 14:56EE
    ldh  [<VBK],a                   ; 14:56EF
    ld   de,$9800                   ; 14:56F1
    ld   hl,$D000                   ; 14:56F4
    ld   bc,$0240                   ; 14:56F7
    call CopyBytes                  ; 14:56FA
    ld   a,$14                      ; 14:56FD
    rst  $10                        ; 14:56FF
.dl SubL_0756D9                     ; 14:5700
    xor  a                          ; 14:5703
    ld   [$C4EC],a                  ; 14:5704
    ld   a,$03                      ; 14:5707
    ld   [$C432],a                  ; 14:5709
    call Sub144412                  ; 14:570C
    xor  a                          ; 14:570F
    ldh  [<$FFB8],a                 ; 14:5710
    ldh  [<$FFB9],a                 ; 14:5712
    ldh  [<$FFBA],a                 ; 14:5714
    ldh  [<$FFBB],a                 ; 14:5716
    ld   [$D929],a                  ; 14:5718
    ld   [$D975],a                  ; 14:571B
    ld   [$D976],a                  ; 14:571E
    dec  a                          ; 14:5721
    ld   [$D928],a                  ; 14:5722
    call Sub1457D3                  ; 14:5725
    call Sub145D0C                  ; 14:5728
    call Sub145F36                  ; 14:572B
    call Sub145EF1                  ; 14:572E
    ldh  a,[<H_GameSubstate]        ; 14:5731
    cp   $0C                        ; 14:5733
    jr   z,Code14573C               ; 14:5735
    ld   a,$01                      ; 14:5737
    ld   [$D908],a                  ; 14:5739
Code14573C:
    ld   a,$14                      ; 14:573C
    ld   [$D92B],a                  ; 14:573E
    ld   a,$01                      ; 14:5741
    ld   [$CDF3],a                  ; 14:5743
    ld   a,$00                      ; 14:5746
    ld   [$D913],a                  ; 14:5748
    ld   a,$D0                      ; 14:574B
    ld   [$D914],a                  ; 14:574D
    ld   a,$02                      ; 14:5750
    ld   [$D915],a                  ; 14:5752
    ld   a,$09                      ; 14:5755
    ld   [$CDF4],a                  ; 14:5757
    ld   a,$04                      ; 14:575A
    ld   [$D90D],a                  ; 14:575C
    ld   a,$7D                      ; 14:575F
    ld   [$DE68],a                  ; 14:5761
    ld   a,$09                      ; 14:5764
    ldh  [<IE],a                    ; 14:5766
    ldh  [<$FF93],a                 ; 14:5768
    ld   a,$E7                      ; 14:576A
    ldh  [<LCDC],a                  ; 14:576C

Sub14576E:
    ld   hl,H_GameSubstate          ; 14:576E
    inc  [hl]                       ; 14:5771
    ret                             ; 14:5772

Code145773:
    ld   a,$47                      ; 14:5773
    ldh  [<$FFF2],a                 ; 14:5775
    ld   a,[$D928]                  ; 14:5777
    ldh  [<$FF97],a                 ; 14:577A
    xor  a                          ; 14:577C
    ld   b,a                        ; 14:577D
    ld   e,a                        ; 14:577E
Code14577F:
    inc  e                          ; 14:577F
    ldh  a,[<$FF97]                 ; 14:5780
    inc  a                          ; 14:5782
    cp   $0E                        ; 14:5783
    jr   nz,Code1457A5              ; 14:5785
    ld   [$D928],a                  ; 14:5787
    ld   a,e                        ; 14:578A
    cp   $0F                        ; 14:578B
    jp   nz,Code145797              ; 14:578D
    xor  a                          ; 14:5790
    ldh  [<$FFF2],a                 ; 14:5791
    ld   a,$30                      ; 14:5793
    ldh  [<$FFF3],a                 ; 14:5795
Code145797:
    ld   hl,$D92D                   ; 14:5797
    ldi  a,[hl]                     ; 14:579A
    ld   [$D906],a                  ; 14:579B
    ldi  a,[hl]                     ; 14:579E
    ld   [$D905],a                  ; 14:579F
    ld   a,[hl]                     ; 14:57A2
    jr   Code1457CA                 ; 14:57A3
Code1457A5:
    cp   $0F                        ; 14:57A5
    jr   nz,Code1457AA              ; 14:57A7
    xor  a                          ; 14:57A9
Code1457AA:
    ldh  [<$FF97],a                 ; 14:57AA
    sla  a                          ; 14:57AC
    sla  a                          ; 14:57AE
    ld   c,a                        ; 14:57B0
    ld   hl,$C43B                   ; 14:57B1
    add  hl,bc                      ; 14:57B4
    ld   a,[hl]                     ; 14:57B5
    and  a                          ; 14:57B6
    jr   z,Code14577F               ; 14:57B7
    dec  hl                         ; 14:57B9
    dec  hl                         ; 14:57BA
    ldh  a,[<$FF97]                 ; 14:57BB
    ld   [$D928],a                  ; 14:57BD
    ldi  a,[hl]                     ; 14:57C0
    ld   [$D906],a                  ; 14:57C1
    ldi  a,[hl]                     ; 14:57C4
    ld   [$D905],a                  ; 14:57C5
    ld   a,[hl]                     ; 14:57C8
    dec  a                          ; 14:57C9
Code1457CA:
    ld   [$D907],a                  ; 14:57CA
    call Sub14576E                  ; 14:57CD
    jp   Code145842                 ; 14:57D0

Sub1457D3:
    ld   a,[$D906]                  ; 14:57D3
    ld   [$D92D],a                  ; 14:57D6
    ld   a,[$D905]                  ; 14:57D9
    ld   [$D92E],a                  ; 14:57DC
    ld   a,[$D907]                  ; 14:57DF
    ld   [$D92F],a                  ; 14:57E2
    ld   a,[$D908]                  ; 14:57E5
    ld   [$D930],a                  ; 14:57E8
    ret                             ; 14:57EB

Data1457EC:                         ; 14:57EC
.db $10,$28,$00,$10,$30,$02,$20,$28,\
    $04,$20,$30,$06,$FF
Data1457F9:                         ; 14:57F9
.db $10,$38,$00,$10,$40,$02,$20,$38,\
    $04,$20,$40,$06,$FF
Data145806:                         ; 14:5806
.db $10,$48,$00,$10,$50,$02,$20,$48,\
    $04,$20,$50,$06,$FF
Data145813:                         ; 14:5813
.db $10,$58,$00,$10,$60,$02,$20,$58,\
    $04,$20,$60,$06,$FF
Data145820:                         ; 14:5820
.db $10,$70,$08,$10,$78,$0A,$10,$80,\
    $0C,$20,$70,$0E,$20,$78,$10,$20,\
    $80,$12,$FF
DataPtrs145833:                     ; 14:5833
.dw Data1457EC, Data1457F9, Data145806, Data145813,\
    Data145820
Data14583D:                         ; 14:583D
.db $2C,$3C,$4C,$5C,$78
Code145842:
    ld   hl,$D975                   ; 14:5842
    inc  [hl]                       ; 14:5845
    ld   a,[hl]                     ; 14:5846
    cp   $0A                        ; 14:5847
    jr   c,Code145855               ; 14:5849
    xor  a                          ; 14:584B
    ld   [hl],a                     ; 14:584C
    ld   a,[$D976]                  ; 14:584D
    xor  $01                        ; 14:5850
    ld   [$D976],a                  ; 14:5852
Code145855:
    ld   a,[$D976]                  ; 14:5855
    and  a                          ; 14:5858
    jr   nz,Code14587E              ; 14:5859
    ld   a,[$D90D]                  ; 14:585B
    sla  a                          ; 14:585E
    ld   c,a                        ; 14:5860
    ld   b,$00                      ; 14:5861
    ld   hl,DataPtrs145833          ; 14:5863
    add  hl,bc                      ; 14:5866
    ldi  a,[hl]                     ; 14:5867
    ld   h,[hl]                     ; 14:5868
    ld   l,a                        ; 14:5869
    ld   de,$C010                   ; 14:586A
Code14586D:
    ldi  a,[hl]                     ; 14:586D
    bit  7,a                        ; 14:586E
    ret  nz                         ; 14:5870
    ld   [de],a                     ; 14:5871
    inc  de                         ; 14:5872
    ldi  a,[hl]                     ; 14:5873
    ld   [de],a                     ; 14:5874
    inc  de                         ; 14:5875
    ldi  a,[hl]                     ; 14:5876
    ld   [de],a                     ; 14:5877
    inc  de                         ; 14:5878
    xor  a                          ; 14:5879
    ld   [de],a                     ; 14:587A
    inc  de                         ; 14:587B
    jr   Code14586D                 ; 14:587C
Code14587E:
    ld   a,[$D90D]                  ; 14:587E
    ld   c,a                        ; 14:5881
    ld   b,$00                      ; 14:5882
    ld   hl,Data14583D              ; 14:5884
    add  hl,bc                      ; 14:5887
    ld   a,$10                      ; 14:5888
    ld   [$C010],a                  ; 14:588A
    ld   a,$20                      ; 14:588D
    ld   [$C014],a                  ; 14:588F
    ld   a,[hl]                     ; 14:5892
    ld   [$C011],a                  ; 14:5893
    ld   [$C015],a                  ; 14:5896
    ld   a,$18                      ; 14:5899
    ld   [$C012],a                  ; 14:589B
    ld   a,$1A                      ; 14:589E
    ld   [$C016],a                  ; 14:58A0
    xor  a                          ; 14:58A3
    ld   [$C013],a                  ; 14:58A4
    ld   [$C017],a                  ; 14:58A7
    ret                             ; 14:58AA

Sub1458AB:
    ld   hl,$D907                   ; 14:58AB
    inc  [hl]                       ; 14:58AE
    ld   a,c                        ; 14:58AF
    and  a                          ; 14:58B0
    jr   z,Code1458B5               ; 14:58B1
    dec  [hl]                       ; 14:58B3
    dec  [hl]                       ; 14:58B4
Code1458B5:
    ld   a,[hl]                     ; 14:58B5
    bit  7,a                        ; 14:58B6
    jr   z,Code1458C7               ; 14:58B8
    ld   [hl],$00                   ; 14:58BA
    ld   a,[$D905]                  ; 14:58BC
    cp   $01                        ; 14:58BF
    ret  z                          ; 14:58C1
    ld   a,$0B                      ; 14:58C2
    ld   [hl],a                     ; 14:58C4
    jr   Code1458DD                 ; 14:58C5
Code1458C7:
    cp   $0C                        ; 14:58C7
    ret  nz                         ; 14:58C9
    xor  a                          ; 14:58CA
    ld   [hl],a                     ; 14:58CB
    ld   a,[$D906]                  ; 14:58CC
    cp   $0B                        ; 14:58CF
    jr   c,Code1458DD               ; 14:58D1
    ld   a,[$D905]                  ; 14:58D3
    cp   $B8                        ; 14:58D6
    jr   c,Code1458DD               ; 14:58D8
    ld   [hl],$0B                   ; 14:58DA
    ret                             ; 14:58DC

Code1458DD:
    ld   de,$0001                   ; 14:58DD
    ld   a,c                        ; 14:58E0
    and  a                          ; 14:58E1
    jr   z,Code14590B               ; 14:58E2
    ld   de,IE                      ; 14:58E4
    jr   Code14590B                 ; 14:58E7
Code1458E9:
    ld   de,$000A                   ; 14:58E9
    ld   a,c                        ; 14:58EC
    and  a                          ; 14:58ED
    jr   z,Code14590B               ; 14:58EE
    ld   de,$FFF6                   ; 14:58F0
    jr   Code14590B                 ; 14:58F3
Code1458F5:
    ld   de,$0064                   ; 14:58F5
    ld   a,c                        ; 14:58F8
    and  a                          ; 14:58F9
    jr   z,Code14590B               ; 14:58FA
    ld   de,$FF9C                   ; 14:58FC
    jr   Code14590B                 ; 14:58FF
Code145901:
    ld   de,$03E8                   ; 14:5901
    ld   a,c                        ; 14:5904
    and  a                          ; 14:5905
    jr   z,Code14590B               ; 14:5906
    ld   de,$FC18                   ; 14:5908
Code14590B:
    ld   a,[$D905]                  ; 14:590B
    ld   l,a                        ; 14:590E
    ld   a,[$D906]                  ; 14:590F
    ld   h,a                        ; 14:5912
    add  hl,de                      ; 14:5913
    ld   a,h                        ; 14:5914
    or   l                          ; 14:5915
    ret  z                          ; 14:5916
    ld   de,$0BB8                   ; 14:5917
    ld   a,d                        ; 14:591A
    cp   h                          ; 14:591B
    ret  c                          ; 14:591C
    jr   nz,Code145922              ; 14:591D
    ld   a,e                        ; 14:591F
    cp   l                          ; 14:5920
    ret  c                          ; 14:5921
Code145922:
    ld   a,l                        ; 14:5922
    ld   [$D905],a                  ; 14:5923
    ld   a,h                        ; 14:5926
    ld   [$D906],a                  ; 14:5927
    ret                             ; 14:592A

Sub14592B:
    ld   a,[$D90D]                  ; 14:592B
    rst  $00                        ; 14:592E
.dw Code145901                      ; 14:592F
.dw Code1458F5                      ; 14:5931
.dw Code1458E9                      ; 14:5933
.dw Code1458DD                      ; 14:5935
.dw Sub1458AB                       ; 14:5937

Data145939:                         ; 14:5939
.db $FF,$01
Data14593B:                         ; 14:593B
.db $FF,$05
Data14593D:                         ; 14:593D
.db $04,$00

Code14593F:
    ld   a,[$D92A]                  ; 14:593F
    ld   c,a                        ; 14:5942
    ld   hl,$D92B                   ; 14:5943
    dec  [hl]                       ; 14:5946
    ld   a,[hl]                     ; 14:5947
    and  a                          ; 14:5948
    jr   nz,Code145972              ; 14:5949
    xor  a                          ; 14:594B
    ld   [$D95F],a                  ; 14:594C
    ld   a,[$D928]                  ; 14:594F
    bit  7,a                        ; 14:5952
    jr   nz,Code14595F              ; 14:5954
    cp   $0E                        ; 14:5956
    jr   nc,Code14595F              ; 14:5958
    ld   a,$01                      ; 14:595A
    ld   [$D95F],a                  ; 14:595C
Code14595F:
    ld   a,$1E                      ; 14:595F
    ld   [hl],a                     ; 14:5961
    ld   a,[$D92A]                  ; 14:5962
    xor  $01                        ; 14:5965
    ld   [$D92A],a                  ; 14:5967
    call Sub145EBD                  ; 14:596A
    ld   a,$01                      ; 14:596D
    ld   [$C423],a                  ; 14:596F
Code145972:
    ldh  a,[<$FF8C]                 ; 14:5972
    bit  2,a                        ; 14:5974
    jp   nz,Code145773              ; 14:5976
    ldh  a,[<$FF8C]                 ; 14:5979
    bit  1,a                        ; 14:597B
    jr   z,Code14598A               ; 14:597D
    ld   a,$63                      ; 14:597F
    ldh  [<$FFF2],a                 ; 14:5981
    ld   a,$01                      ; 14:5983
    ldh  [<H_GameSubstate],a        ; 14:5985
    jp   Code145842                 ; 14:5987
Code14598A:
    bit  0,a                        ; 14:598A
    jr   z,Code1459D0               ; 14:598C
    xor  a                          ; 14:598E
    ld   [$D92A],a                  ; 14:598F
    call Sub145EBD                  ; 14:5992
    ld   a,$01                      ; 14:5995
    ld   [$C423],a                  ; 14:5997
    xor  a                          ; 14:599A
    ld   [$D95E],a                  ; 14:599B
    ld   a,[$D92C]                  ; 14:599E
    ld   [$D95D],a                  ; 14:59A1
    ld   a,$01                      ; 14:59A4
    ld   [$D908],a                  ; 14:59A6
    ld   a,$31                      ; 14:59A9
    ldh  [<$FFF3],a                 ; 14:59AB
    ldh  a,[<H_GameState]           ; 14:59AD
    ld   [$C416],a                  ; 14:59AF
    ldh  a,[<H_GameSubstate]        ; 14:59B2
    ld   [$C417],a                  ; 14:59B4
    ld   hl,$C43B                   ; 14:59B7
    ld   c,$00                      ; 14:59BA
    ld   a,c                        ; 14:59BC
    ld   [$D928],a                  ; 14:59BD
    ld   a,$2E                      ; 14:59C0
    ldh  [<H_GameState],a           ; 14:59C2
    xor  a                          ; 14:59C4
    ldh  [<H_GameSubstate],a        ; 14:59C5
    ld   [$C418],a                  ; 14:59C7
    call Sub0010AD                  ; 14:59CA
    jp   Code145842                 ; 14:59CD
Code1459D0:
    ldh  a,[<$FF8C]                 ; 14:59D0
    ld   c,a                        ; 14:59D2
    and  $C0                        ; 14:59D3
    jr   nz,Code1459EC              ; 14:59D5
    ldh  a,[<H_ButtonFlags]         ; 14:59D7
    ld   c,a                        ; 14:59D9
    and  $C0                        ; 14:59DA
    jp   z,Code145A01               ; 14:59DC
    ld   a,[$D90C]                  ; 14:59DF
    and  a                          ; 14:59E2
    jr   z,Code1459EC               ; 14:59E3
    dec  a                          ; 14:59E5
    ld   [$D90C],a                  ; 14:59E6
    jp   Code145842                 ; 14:59E9
Code1459EC:
    ld   a,c                        ; 14:59EC
    and  $80                        ; 14:59ED
    rlca                            ; 14:59EF
    ld   c,a                        ; 14:59F0
    call Sub14592B                  ; 14:59F1
    ld   a,$47                      ; 14:59F4
    ldh  [<$FFF2],a                 ; 14:59F6
    call Sub1457D3                  ; 14:59F8
    call Sub14576E                  ; 14:59FB
    jp   Code145842                 ; 14:59FE
Code145A01:
    ldh  a,[<$FF8C]                 ; 14:5A01
    and  $30                        ; 14:5A03
    jr   z,Code145A29               ; 14:5A05
    and  $10                        ; 14:5A07
    swap a                          ; 14:5A09
    ld   c,a                        ; 14:5A0B
    ld   b,$00                      ; 14:5A0C
    ld   hl,Data145939              ; 14:5A0E
    add  hl,bc                      ; 14:5A11
    ld   a,[$D90D]                  ; 14:5A12
    add  [hl]                       ; 14:5A15
    ld   hl,Data14593B              ; 14:5A16
    add  hl,bc                      ; 14:5A19
    cp   [hl]                       ; 14:5A1A
    jr   nz,Code145A22              ; 14:5A1B
    ld   hl,Data14593D              ; 14:5A1D
    add  hl,bc                      ; 14:5A20
    ld   a,[hl]                     ; 14:5A21
Code145A22:
    ld   [$D90D],a                  ; 14:5A22
    ld   a,$47                      ; 14:5A25
    ldh  [<$FFF2],a                 ; 14:5A27
Code145A29:
    jp   Code145842                 ; 14:5A29
.db $00,$03,$03,$06,$01,$04,$06,$02,\
    $05,$00,$03,$05,$00,$03,$04,$00,\
    $02,$05,$00,$03,$06,$01,$04,$06
Data145A44:                         ; 14:5A44
.db $00,$01,$02,$03,$04,$05,$06,$06,\
    $00,$01,$02,$03,$04,$05
Data145A52:                         ; 14:5A52
.db $31,$28,$31,$30,$31,$30,$31,$31,\
    $30,$31,$30,$31,$29
Code145A5F:
    call Sub145D0C                  ; 14:5A5F
    call Sub145F36                  ; 14:5A62
    ld   a,$01                      ; 14:5A65
    ld   [$C423],a                  ; 14:5A67
    ldh  a,[<H_GameSubstate]        ; 14:5A6A
    cp   $0B                        ; 14:5A6C
    jr   nz,Code145A77              ; 14:5A6E
    ld   a,$0A                      ; 14:5A70
    ldh  [<H_GameSubstate],a        ; 14:5A72
    jp   Code145842                 ; 14:5A74
Code145A77:
    ld   a,[$D95E]                  ; 14:5A77
    and  a                          ; 14:5A7A
    jr   nz,Code145AAA              ; 14:5A7B
    ld   a,[$D92C]                  ; 14:5A7D
    ld   c,a                        ; 14:5A80
    ld   b,$00                      ; 14:5A81
Code145A83:
    ld   hl,$D933                   ; 14:5A83
    add  hl,bc                      ; 14:5A86
    ld   a,[hl]                     ; 14:5A87
    and  a                          ; 14:5A88
    jr   z,Code145A8E               ; 14:5A89
    inc  bc                         ; 14:5A8B
    jr   Code145A83                 ; 14:5A8C
Code145A8E:
    dec  c                          ; 14:5A8E
    ld   a,c                        ; 14:5A8F
Code145A90:
    sub  $07                        ; 14:5A90
    jr   c,Code145A97               ; 14:5A92
    inc  b                          ; 14:5A94
    jr   Code145A90                 ; 14:5A95
Code145A97:
    add  $07                        ; 14:5A97
    ld   [$D95D],a                  ; 14:5A99
    ld   a,b                        ; 14:5A9C
    ld   [$D95E],a                  ; 14:5A9D
    ld   a,c                        ; 14:5AA0
    ld   b,$00                      ; 14:5AA1
    ld   hl,$D933                   ; 14:5AA3
    add  hl,bc                      ; 14:5AA6
    ld   a,[hl]                     ; 14:5AA7
    jr   Code145AB6                 ; 14:5AA8
Code145AAA:
    xor  a                          ; 14:5AAA
    ld   [$D95E],a                  ; 14:5AAB
    ld   a,[$D92C]                  ; 14:5AAE
    ld   [$D95D],a                  ; 14:5AB1
    ld   a,$01                      ; 14:5AB4
Code145AB6:
    ld   [$D908],a                  ; 14:5AB6
    ld   a,$0D                      ; 14:5AB9
    ldh  [<H_GameSubstate],a        ; 14:5ABB
    ret                             ; 14:5ABD

Data145ABE:                         ; 14:5ABE
.db $00,$18,$30,$48,$60,$78,$90
Data145AC5:                         ; 14:5AC5
.db $00,$00,$01,$02,$01

Sub145ACA:
    ld   hl,$D975                   ; 14:5ACA
    inc  [hl]                       ; 14:5ACD
    ld   a,[hl]                     ; 14:5ACE
    cp   $04                        ; 14:5ACF
    jr   c,Code145AE1               ; 14:5AD1
    xor  a                          ; 14:5AD3
    ld   [hl],a                     ; 14:5AD4
    ld   a,[$D976]                  ; 14:5AD5
    inc  a                          ; 14:5AD8
    cp   $05                        ; 14:5AD9
    jr   c,Code145ADE               ; 14:5ADB
    xor  a                          ; 14:5ADD
Code145ADE:
    ld   [$D976],a                  ; 14:5ADE
Code145AE1:
    ld   a,[$D976]                  ; 14:5AE1
    ld   c,a                        ; 14:5AE4
    ld   b,$00                      ; 14:5AE5
    ld   hl,Data145AC5              ; 14:5AE7
    add  hl,bc                      ; 14:5AEA
    ld   e,[hl]                     ; 14:5AEB
    ld   a,[$D95E]                  ; 14:5AEC
    and  $0F                        ; 14:5AEF
    swap a                          ; 14:5AF1
    add  $3A                        ; 14:5AF3
    sub  e                          ; 14:5AF5
    ld   [$C000],a                  ; 14:5AF6
    ld   [$C004],a                  ; 14:5AF9
    ld   [$C008],a                  ; 14:5AFC
    ld   [$C00C],a                  ; 14:5AFF
    add  $0D                        ; 14:5B02
    add  e                          ; 14:5B04
    add  e                          ; 14:5B05
    ld   [$C010],a                  ; 14:5B06
    ld   [$C014],a                  ; 14:5B09
    ld   [$C018],a                  ; 14:5B0C
    ld   [$C01C],a                  ; 14:5B0F
    ld   hl,Data145ABE              ; 14:5B12
    ld   a,[$D95D]                  ; 14:5B15
    ld   c,a                        ; 14:5B18
    add  hl,bc                      ; 14:5B19
    ld   a,[hl]                     ; 14:5B1A
    sub  e                          ; 14:5B1B
    ld   [$C001],a                  ; 14:5B1C
    ld   [$C011],a                  ; 14:5B1F
    add  $08                        ; 14:5B22
    ld   [$C005],a                  ; 14:5B24
    ld   [$C015],a                  ; 14:5B27
    add  $08                        ; 14:5B2A
    add  e                          ; 14:5B2C
    add  e                          ; 14:5B2D
    ld   [$C009],a                  ; 14:5B2E
    ld   [$C019],a                  ; 14:5B31
    add  $08                        ; 14:5B34
    ld   [$C00D],a                  ; 14:5B36
    ld   [$C01D],a                  ; 14:5B39
    ld   a,$14                      ; 14:5B3C
    ld   [$C002],a                  ; 14:5B3E
    ld   [$C012],a                  ; 14:5B41
    ld   [$C00E],a                  ; 14:5B44
    ld   [$C01E],a                  ; 14:5B47
    ld   a,$16                      ; 14:5B4A
    ld   [$C006],a                  ; 14:5B4C
    ld   [$C016],a                  ; 14:5B4F
    ld   [$C00A],a                  ; 14:5B52
    ld   [$C01A],a                  ; 14:5B55
    xor  a                          ; 14:5B58
    ld   [$C003],a                  ; 14:5B59
    ld   [$C007],a                  ; 14:5B5C
    or   $20                        ; 14:5B5F
    ld   [$C00B],a                  ; 14:5B61
    ld   [$C00F],a                  ; 14:5B64
    ld   a,$40                      ; 14:5B67
    ld   [$C013],a                  ; 14:5B69
    ld   [$C017],a                  ; 14:5B6C
    or   $20                        ; 14:5B6F
    ld   [$C01B],a                  ; 14:5B71
    ld   [$C01F],a                  ; 14:5B74
    ret                             ; 14:5B77

Sub145B78:
    ld   a,[$D95E]                  ; 14:5B78
    ld   bc,$0007                   ; 14:5B7B
    ld   hl,$0000                   ; 14:5B7E
Code145B81:
    and  a                          ; 14:5B81
    jr   z,Code145B88               ; 14:5B82
    add  hl,bc                      ; 14:5B84
    dec  a                          ; 14:5B85
    jr   Code145B81                 ; 14:5B86
Code145B88:
    ld   a,[$D95D]                  ; 14:5B88
    ld   c,a                        ; 14:5B8B
    add  hl,bc                      ; 14:5B8C
    ld   bc,$D933                   ; 14:5B8D
    add  hl,bc                      ; 14:5B90
    ld   a,[hl]                     ; 14:5B91
    ld   [$D908],a                  ; 14:5B92
    ret                             ; 14:5B95

Sub145B96:
    ld   a,$47                      ; 14:5B96
    ldh  [<$FFF2],a                 ; 14:5B98
    ldh  a,[<$FF97]                 ; 14:5B9A
    ld   de,$D95D                   ; 14:5B9C
    bit  4,a                        ; 14:5B9F
    jr   z,Code145BCC               ; 14:5BA1
    ld   a,[de]                     ; 14:5BA3
    inc  a                          ; 14:5BA4
    cp   $07                        ; 14:5BA5
    jr   nz,Code145BB6              ; 14:5BA7
    ld   a,[$D95E]                  ; 14:5BA9
    inc  a                          ; 14:5BAC
    cp   $06                        ; 14:5BAD
    jr   nz,Code145BB2              ; 14:5BAF
    xor  a                          ; 14:5BB1
Code145BB2:
    ld   [$D95E],a                  ; 14:5BB2
    xor  a                          ; 14:5BB5
Code145BB6:
    ld   [de],a                     ; 14:5BB6
    call Sub145B78                  ; 14:5BB7
    and  a                          ; 14:5BBA
    ret  nz                         ; 14:5BBB
    ld   c,$00                      ; 14:5BBC
    call Sub1458AB                  ; 14:5BBE
    ld   a,$47                      ; 14:5BC1
    ldh  [<$FFF2],a                 ; 14:5BC3
    call Sub1457D3                  ; 14:5BC5
    call Sub14576E                  ; 14:5BC8
    ret                             ; 14:5BCB

Code145BCC:
    bit  5,a                        ; 14:5BCC
    jr   z,Code145BFB               ; 14:5BCE
    ld   a,[de]                     ; 14:5BD0
    dec  a                          ; 14:5BD1
    bit  7,a                        ; 14:5BD2
    jr   z,Code145BE5               ; 14:5BD4
    ld   a,[$D95E]                  ; 14:5BD6
    dec  a                          ; 14:5BD9
    bit  7,a                        ; 14:5BDA
    jr   z,Code145BE0               ; 14:5BDC
    ld   a,$05                      ; 14:5BDE
Code145BE0:
    ld   [$D95E],a                  ; 14:5BE0
    ld   a,$06                      ; 14:5BE3
Code145BE5:
    ld   [de],a                     ; 14:5BE5
    call Sub145B78                  ; 14:5BE6
    and  a                          ; 14:5BE9
    ret  nz                         ; 14:5BEA
    ld   c,$01                      ; 14:5BEB
    call Sub1458AB                  ; 14:5BED
    ld   a,$47                      ; 14:5BF0
    ldh  [<$FFF2],a                 ; 14:5BF2
    call Sub1457D3                  ; 14:5BF4
    call Sub14576E                  ; 14:5BF7
    ret                             ; 14:5BFA

Code145BFB:
    ld   de,$D95E                   ; 14:5BFB
    bit  6,a                        ; 14:5BFE
    jr   z,Code145C12               ; 14:5C00
Code145C02:
    ld   a,[de]                     ; 14:5C02
    dec  a                          ; 14:5C03
    bit  7,a                        ; 14:5C04
    jr   z,Code145C0A               ; 14:5C06
    ld   a,$05                      ; 14:5C08
Code145C0A:
    ld   [de],a                     ; 14:5C0A
    call Sub145B78                  ; 14:5C0B
    and  a                          ; 14:5C0E
    jr   z,Code145C02               ; 14:5C0F
    ret                             ; 14:5C11

Code145C12:
    bit  7,a                        ; 14:5C12
    ret  z                          ; 14:5C14
Code145C15:
    ld   a,[de]                     ; 14:5C15
    inc  a                          ; 14:5C16
    cp   $06                        ; 14:5C17
    jr   nz,Code145C1C              ; 14:5C19
    xor  a                          ; 14:5C1B
Code145C1C:
    ld   [de],a                     ; 14:5C1C
    call Sub145B78                  ; 14:5C1D
    and  a                          ; 14:5C20
    jr   z,Code145C15               ; 14:5C21
    ret                             ; 14:5C23

Sub145C24:
    ld   hl,$C439                   ; 14:5C24
    ld   c,$0E                      ; 14:5C27
Code145C29:
    ld   a,[$D906]                  ; 14:5C29
    cp   [hl]                       ; 14:5C2C
    jr   nz,Code145C4E              ; 14:5C2D
    inc  hl                         ; 14:5C2F
    ld   a,[$D905]                  ; 14:5C30
    cp   [hl]                       ; 14:5C33
    jr   nz,Code145C4F              ; 14:5C34
    inc  hl                         ; 14:5C36
    ld   a,[$D907]                  ; 14:5C37
    inc  a                          ; 14:5C3A
    cp   [hl]                       ; 14:5C3B
    jr   nz,Code145C50              ; 14:5C3C
    inc  hl                         ; 14:5C3E
    ld   a,[$D908]                  ; 14:5C3F
    cp   [hl]                       ; 14:5C42
    jr   nz,Code145C51              ; 14:5C43
    ld   a,$0E                      ; 14:5C45
    sub  c                          ; 14:5C47
    ld   [$D928],a                  ; 14:5C48
    ld   c,$00                      ; 14:5C4B
    ret                             ; 14:5C4D

Code145C4E:
    inc  hl                         ; 14:5C4E
Code145C4F:
    inc  hl                         ; 14:5C4F
Code145C50:
    inc  hl                         ; 14:5C50
Code145C51:
    inc  hl                         ; 14:5C51
    dec  c                          ; 14:5C52
    jr   nz,Code145C29              ; 14:5C53
    ld   c,$FF                      ; 14:5C55
    ret                             ; 14:5C57

Code145C58:
    call Sub145ACA                  ; 14:5C58
    ldh  a,[<$FF8C]                 ; 14:5C5B
    bit  1,a                        ; 14:5C5D
    jr   z,Code145C8F               ; 14:5C5F
    ld   a,$63                      ; 14:5C61
    ldh  [<$FFF2],a                 ; 14:5C63
    ld   a,$0A                      ; 14:5C65
    ldh  [<H_GameSubstate],a        ; 14:5C67
    ld   hl,Data144402              ; 14:5C69
    ldi  a,[hl]                     ; 14:5C6C
    ld   [$D973],a                  ; 14:5C6D
    ld   a,[hl]                     ; 14:5C70
    ld   [$D974],a                  ; 14:5C71
    ld   hl,Data1443EC              ; 14:5C74
    ldi  a,[hl]                     ; 14:5C77
    ld   [$D971],a                  ; 14:5C78
    ld   a,[hl]                     ; 14:5C7B
    ld   [$D972],a                  ; 14:5C7C
    xor  a                          ; 14:5C7F
    ld   [$D90C],a                  ; 14:5C80
    ld   [$D976],a                  ; 14:5C83
    ld   [$C4EC],a                  ; 14:5C86
    ld   a,$03                      ; 14:5C89
    ld   [$C432],a                  ; 14:5C8B
    ret                             ; 14:5C8E

Code145C8F:
    bit  0,a                        ; 14:5C8F
    jr   z,Code145CE2               ; 14:5C91
    call Sub1457D3                  ; 14:5C93
    ldh  a,[<H_GameState]           ; 14:5C96
    ld   [$C416],a                  ; 14:5C98
    ldh  a,[<H_GameSubstate]        ; 14:5C9B
    ld   [$C417],a                  ; 14:5C9D
    call Sub145C24                  ; 14:5CA0
    ld   a,c                        ; 14:5CA3
    and  a                          ; 14:5CA4
    jr   nz,Code145CD9              ; 14:5CA5
    ld   a,$31                      ; 14:5CA7
    ldh  [<$FFF3],a                 ; 14:5CA9
    ld   a,$2E                      ; 14:5CAB
    ldh  [<H_GameState],a           ; 14:5CAD
    xor  a                          ; 14:5CAF
    ldh  [<H_GameSubstate],a        ; 14:5CB0
    ld   [$C418],a                  ; 14:5CB2
    ld   a,$05                      ; 14:5CB5
    ld   [$C4EC],a                  ; 14:5CB7
    ld   a,$08                      ; 14:5CBA
    ld   [$C432],a                  ; 14:5CBC
    ld   hl,Data144410              ; 14:5CBF
    ldi  a,[hl]                     ; 14:5CC2
    ld   [$D973],a                  ; 14:5CC3
    ld   a,[hl]                     ; 14:5CC6
    ld   [$D974],a                  ; 14:5CC7
    ld   hl,Data1443FA              ; 14:5CCA
    ldi  a,[hl]                     ; 14:5CCD
    ld   [$D971],a                  ; 14:5CCE
    ld   a,[hl]                     ; 14:5CD1
    ld   [$D972],a                  ; 14:5CD2
    call Sub0010AD                  ; 14:5CD5
    ret                             ; 14:5CD8

Code145CD9:
    ld   a,$44                      ; 14:5CD9
    ldh  [<$FFF2],a                 ; 14:5CDB
    ld   a,$0F                      ; 14:5CDD
    ldh  [<H_GameSubstate],a        ; 14:5CDF
    ret                             ; 14:5CE1

Code145CE2:
    ldh  a,[<H_ButtonFlags]         ; 14:5CE2
    ldh  [<$FF97],a                 ; 14:5CE4
    ld   hl,$D90C                   ; 14:5CE6
    ldh  a,[<$FF8C]                 ; 14:5CE9
    and  $F0                        ; 14:5CEB
    jr   nz,Code145CFE              ; 14:5CED
    ldh  a,[<H_ButtonFlags]         ; 14:5CEF
    and  $F0                        ; 14:5CF1
    jr   z,Return145D05             ; 14:5CF3
    dec  [hl]                       ; 14:5CF5
    ld   a,[hl]                     ; 14:5CF6
    and  a                          ; 14:5CF7
    jr   nz,Return145D05            ; 14:5CF8
    ld   a,$07                      ; 14:5CFA
    jr   Code145D00                 ; 14:5CFC
Code145CFE:
    ld   a,$0C                      ; 14:5CFE
Code145D00:
    ld   [hl],a                     ; 14:5D00
    call Sub145B96                  ; 14:5D01
    ret                             ; 14:5D04

Return145D05:
    ret                             ; 14:5D05

Data145D06:                         ; 14:5D06
.db $E8,$03,$64,$00,$0A,$00

Sub145D0C:
    ld   hl,Data145D06              ; 14:5D0C
    ld   de,$FF9A                   ; 14:5D0F
    ld   a,[$D905]                  ; 14:5D12
    ldh  [<$FF97],a                 ; 14:5D15
    ld   a,[$D906]                  ; 14:5D17
    ldh  [<$FF98],a                 ; 14:5D1A
Code145D1C:
    ld   c,[hl]                     ; 14:5D1C
    inc  hl                         ; 14:5D1D
    ld   b,[hl]                     ; 14:5D1E
    inc  hl                         ; 14:5D1F
    xor  a                          ; 14:5D20
    ldh  [<$FF99],a                 ; 14:5D21
Code145D23:
    ldh  a,[<$FF98]                 ; 14:5D23
    cp   b                          ; 14:5D25
    jr   c,Code145D3E               ; 14:5D26
    ldh  a,[<$FF97]                 ; 14:5D28
    jr   nz,Code145D2F              ; 14:5D2A
    cp   c                          ; 14:5D2C
    jr   c,Code145D3E               ; 14:5D2D
Code145D2F:
    sub  c                          ; 14:5D2F
    ldh  [<$FF97],a                 ; 14:5D30
    ldh  a,[<$FF98]                 ; 14:5D32
    sbc  b                          ; 14:5D34
    ldh  [<$FF98],a                 ; 14:5D35
    ldh  a,[<$FF99]                 ; 14:5D37
    inc  a                          ; 14:5D39
    ldh  [<$FF99],a                 ; 14:5D3A
    jr   Code145D23                 ; 14:5D3C
Code145D3E:
    ldh  a,[<$FF99]                 ; 14:5D3E
    ld   [de],a                     ; 14:5D40
    inc  de                         ; 14:5D41
    ld   a,l                        ; 14:5D42
    cp   $0C                        ; 14:5D43
    jr   nz,Code145D1C              ; 14:5D45
    ldh  a,[<$FF97]                 ; 14:5D47
    ld   [de],a                     ; 14:5D49
    ld   hl,$D024                   ; 14:5D4A
    ld   de,$D044                   ; 14:5D4D
    ld   bc,$FF9A                   ; 14:5D50
    xor  a                          ; 14:5D53
    ldh  [<$FF97],a                 ; 14:5D54
Code145D56:
    ld   a,[bc]                     ; 14:5D56
    and  a                          ; 14:5D57
    jr   nz,Code145D69              ; 14:5D58
    ldh  a,[<$FF97]                 ; 14:5D5A
    and  a                          ; 14:5D5C
    jr   nz,Code145D69              ; 14:5D5D
    ld   a,$DF                      ; 14:5D5F
    ldi  [hl],a                     ; 14:5D61
    ldi  [hl],a                     ; 14:5D62
    ld   [de],a                     ; 14:5D63
    inc  de                         ; 14:5D64
    ld   [de],a                     ; 14:5D65
    inc  de                         ; 14:5D66
    jr   Code145D7B                 ; 14:5D67
Code145D69:
    ld   a,$01                      ; 14:5D69
    ldh  [<$FF97],a                 ; 14:5D6B
    ld   a,[bc]                     ; 14:5D6D
    sla  a                          ; 14:5D6E
    sla  a                          ; 14:5D70
    ldi  [hl],a                     ; 14:5D72
    inc  a                          ; 14:5D73
    ldi  [hl],a                     ; 14:5D74
    inc  a                          ; 14:5D75
    ld   [de],a                     ; 14:5D76
    inc  de                         ; 14:5D77
    inc  a                          ; 14:5D78
    ld   [de],a                     ; 14:5D79
    inc  de                         ; 14:5D7A
Code145D7B:
    inc  bc                         ; 14:5D7B
    ld   a,c                        ; 14:5D7C
    cp   $9E                        ; 14:5D7D
    jr   nz,Code145D56              ; 14:5D7F
    ld   hl,$D02D                   ; 14:5D81
    ld   b,$03                      ; 14:5D84
    ld   a,[$D907]                  ; 14:5D86
    ld   b,a                        ; 14:5D89
    sla  a                          ; 14:5D8A
    add  b                          ; 14:5D8C
    sla  a                          ; 14:5D8D
    add  $40                        ; 14:5D8F
    ldi  [hl],a                     ; 14:5D91
    inc  a                          ; 14:5D92
    ldi  [hl],a                     ; 14:5D93
    inc  a                          ; 14:5D94
    ld   [hl],a                     ; 14:5D95
    inc  a                          ; 14:5D96
    ld   hl,$D04D                   ; 14:5D97
    ldi  [hl],a                     ; 14:5D9A
    inc  a                          ; 14:5D9B
    ldi  [hl],a                     ; 14:5D9C
    inc  a                          ; 14:5D9D
    ld   [hl],a                     ; 14:5D9E
    ret                             ; 14:5D9F

Sub145DA0:
    ld   bc,$0020                   ; 14:5DA0
    bit  7,a                        ; 14:5DA3
    jr   z,Code145DB0               ; 14:5DA5
    ld   a,$A1                      ; 14:5DA7
    ld   [hl],a                     ; 14:5DA9
    ld   a,$DE                      ; 14:5DAA
    add  hl,bc                      ; 14:5DAC
    ld   [hl],a                     ; 14:5DAD
    jr   Code145DB8                 ; 14:5DAE
Code145DB0:
    sla  a                          ; 14:5DB0
    add  $2C                        ; 14:5DB2
    ld   [hl],a                     ; 14:5DB4
    inc  a                          ; 14:5DB5
    add  hl,bc                      ; 14:5DB6
    ld   [hl],a                     ; 14:5DB7
Code145DB8:
    ld   e,$01                      ; 14:5DB8
    ld   bc,$0220                   ; 14:5DBA
    add  hl,bc                      ; 14:5DBD
    ld   a,l                        ; 14:5DBE
    and  $1F                        ; 14:5DBF
    and  a                          ; 14:5DC1
    jr   z,Code145DD4               ; 14:5DC2
    cp   $01                        ; 14:5DC4
    jr   z,Code145DD4               ; 14:5DC6
    ld   e,$05                      ; 14:5DC8
    cp   $12                        ; 14:5DCA
    jr   z,Code145DD4               ; 14:5DCC
    cp   $13                        ; 14:5DCE
    jr   z,Code145DD4               ; 14:5DD0
    ld   e,$06                      ; 14:5DD2
Code145DD4:
    ld   [hl],e                     ; 14:5DD4
    ld   bc,$0020                   ; 14:5DD5
    add  hl,bc                      ; 14:5DD8
    ld   [hl],e                     ; 14:5DD9
    ret                             ; 14:5DDA

Data145DDB:                         ; 14:5DDB
.db $BC,$BD,$CC,$CD
Data145DDF:                         ; 14:5DDF
.db $B0,$B1,$C0,$C1
Data145DE3:                         ; 14:5DE3
.db $B4,$B5,$C4,$C5
Data145DE7:                         ; 14:5DE7
.db $B6,$B7,$C6,$C7
Data145DEB:                         ; 14:5DEB
.db $B8,$B9,$C8,$C9
Data145DEF:                         ; 14:5DEF
.db $BA,$BB,$CA,$CB
Data145DF3:                         ; 14:5DF3
.db $88,$89,$98,$99
Data145DF7:                         ; 14:5DF7
.db $8A,$8B,$9A,$9B
Data145DFB:                         ; 14:5DFB
.db $B2,$B3,$C2,$C3
Data145DFF:                         ; 14:5DFF
.db $9E,$9F,$AE,$AF
Data145E03:                         ; 14:5E03
.db $00,$00,$00,$00,$00,$02,$02,$02,\
    $00,$00
DataPtrs145E0D:                     ; 14:5E0D
.dw Data145DDB, Data145DDF, Data145DE3, Data145DE7,\
    Data145DEB, Data145DEF, Data145DF3, Data145DF7,\
    Data145DFB, Data145DFF

Sub145E21:
    push af                         ; 14:5E21
    ld   c,$FF                      ; 14:5E22
    ld   a,[hl]                     ; 14:5E24
Code145E25:
    inc  c                          ; 14:5E25
    sub  $0A                        ; 14:5E26
    jr   nc,Code145E25              ; 14:5E28
    add  $0A                        ; 14:5E2A
    ldh  [<$FF9C],a                 ; 14:5E2C
    ld   a,c                        ; 14:5E2E
    ldh  [<$FF9D],a                 ; 14:5E2F
    pop  af                         ; 14:5E31
    ld   bc,IE                      ; 14:5E32
Code145E35:
    inc  bc                         ; 14:5E35
    sub  $07                        ; 14:5E36
    jr   nc,Code145E35              ; 14:5E38
    add  $07                        ; 14:5E3A
    sla  c                          ; 14:5E3C
    rl   b                          ; 14:5E3E
    sla  c                          ; 14:5E40
    rl   b                          ; 14:5E42
    sla  c                          ; 14:5E44
    rl   b                          ; 14:5E46
    sla  c                          ; 14:5E48
    rl   b                          ; 14:5E4A
    sla  c                          ; 14:5E4C
    rl   b                          ; 14:5E4E
    sla  c                          ; 14:5E50
    rl   b                          ; 14:5E52
    ld   hl,$D0C0                   ; 14:5E54
    add  hl,bc                      ; 14:5E57
    ld   c,a                        ; 14:5E58
    sla  a                          ; 14:5E59
    add  c                          ; 14:5E5B
    ld   c,a                        ; 14:5E5C
    ld   b,$00                      ; 14:5E5D
    add  hl,bc                      ; 14:5E5F
    ld   a,[$D928]                  ; 14:5E60
    sla  a                          ; 14:5E63
    sla  a                          ; 14:5E65
    cp   e                          ; 14:5E67
    jr   nz,Code145E84              ; 14:5E68
    ld   a,[$D92A]                  ; 14:5E6A
    and  a                          ; 14:5E6D
    jr   z,Code145E84               ; 14:5E6E
    ldh  a,[<$FF9D]                 ; 14:5E70
    and  a                          ; 14:5E72
    jr   nz,Code145E77              ; 14:5E73
    or   $80                        ; 14:5E75
Code145E77:
    push hl                         ; 14:5E77
    call Sub145DA0                  ; 14:5E78
    pop  hl                         ; 14:5E7B
    inc  hl                         ; 14:5E7C
    ldh  a,[<$FF9C]                 ; 14:5E7D
    call Sub145DA0                  ; 14:5E7F
    jr   Return145EBC               ; 14:5E82
Code145E84:
    push hl                         ; 14:5E84
    srl  e                          ; 14:5E85
    srl  e                          ; 14:5E87
    ld   hl,$D960                   ; 14:5E89
    add  hl,de                      ; 14:5E8C
    ld   e,[hl]                     ; 14:5E8D
    ld   hl,Data145E03              ; 14:5E8E
    add  hl,de                      ; 14:5E91
    ld   a,[hl]                     ; 14:5E92
    ldh  [<$FF9C],a                 ; 14:5E93
    sla  e                          ; 14:5E95
    ld   hl,DataPtrs145E0D          ; 14:5E97
    add  hl,de                      ; 14:5E9A
    ldi  a,[hl]                     ; 14:5E9B
    ld   e,a                        ; 14:5E9C
    ld   d,[hl]                     ; 14:5E9D
    pop  hl                         ; 14:5E9E
    ld   a,[de]                     ; 14:5E9F
    ldi  [hl],a                     ; 14:5EA0
    inc  de                         ; 14:5EA1
    ld   a,[de]                     ; 14:5EA2
    ldi  [hl],a                     ; 14:5EA3
    inc  de                         ; 14:5EA4
    ld   bc,$001E                   ; 14:5EA5
    add  hl,bc                      ; 14:5EA8
    ld   a,[de]                     ; 14:5EA9
    ldi  [hl],a                     ; 14:5EAA
    inc  de                         ; 14:5EAB
    ld   a,[de]                     ; 14:5EAC
    ld   [hl],a                     ; 14:5EAD
    ld   bc,$021F                   ; 14:5EAE
    add  hl,bc                      ; 14:5EB1
    ldh  a,[<$FF9C]                 ; 14:5EB2
    ldi  [hl],a                     ; 14:5EB4
    ld   [hl],a                     ; 14:5EB5
    ld   bc,$001F                   ; 14:5EB6
    add  hl,bc                      ; 14:5EB9
    ldi  [hl],a                     ; 14:5EBA
    ld   [hl],a                     ; 14:5EBB
Return145EBC:
    ret                             ; 14:5EBC

Sub145EBD:
    xor  a                          ; 14:5EBD
    ld   e,a                        ; 14:5EBE
    ld   d,a                        ; 14:5EBF
Code145EC0:
    ld   hl,$C439                   ; 14:5EC0
    add  hl,de                      ; 14:5EC3
    ld   a,[$D906]                  ; 14:5EC4
    cp   [hl]                       ; 14:5EC7
    jr   nz,Code145EE6              ; 14:5EC8
    inc  hl                         ; 14:5ECA
    ld   a,[$D905]                  ; 14:5ECB
    cp   [hl]                       ; 14:5ECE
    jr   nz,Code145EE6              ; 14:5ECF
    inc  hl                         ; 14:5ED1
    ld   a,[$D907]                  ; 14:5ED2
    inc  a                          ; 14:5ED5
    cp   [hl]                       ; 14:5ED6
    jr   nz,Code145EE6              ; 14:5ED7
    inc  hl                         ; 14:5ED9
    push bc                         ; 14:5EDA
    push de                         ; 14:5EDB
    ld   a,[$D92C]                  ; 14:5EDC
    add  [hl]                       ; 14:5EDF
    dec  a                          ; 14:5EE0
    call Sub145E21                  ; 14:5EE1
    pop  de                         ; 14:5EE4
    pop  bc                         ; 14:5EE5
Code145EE6:
    inc  de                         ; 14:5EE6
    inc  de                         ; 14:5EE7
    inc  de                         ; 14:5EE8
    inc  de                         ; 14:5EE9
    ld   a,[$0038]                  ; 14:5EEA
    cp   e                          ; 14:5EED
    jr   c,Code145EC0               ; 14:5EEE
    ret                             ; 14:5EF0

Sub145EF1:
    ld   a,$01                      ; 14:5EF1
    ld   [$C423],a                  ; 14:5EF3
    ld   a,$00                      ; 14:5EF6
    ld   [$C425],a                  ; 14:5EF8
    ld   a,$D0                      ; 14:5EFB
    ld   [$C426],a                  ; 14:5EFD
    ld   a,$40                      ; 14:5F00
    ld   [$C427],a                  ; 14:5F02
    ld   a,$D2                      ; 14:5F05
    ld   [$C428],a                  ; 14:5F07
    ret                             ; 14:5F0A

Sub145F0B:
    ld   hl,$D933                   ; 14:5F0B
    xor  a                          ; 14:5F0E
    ld   b,$2A                      ; 14:5F0F
Code145F11:
    ldi  [hl],a                     ; 14:5F11
    dec  b                          ; 14:5F12
    jr   nz,Code145F11              ; 14:5F13
    ld   hl,$D933                   ; 14:5F15
    ld   a,[$D92C]                  ; 14:5F18
    ld   c,a                        ; 14:5F1B
    ld   b,$00                      ; 14:5F1C
    add  hl,bc                      ; 14:5F1E
    ld   a,[$D932]                  ; 14:5F1F
    ld   b,a                        ; 14:5F22
    ld   c,$00                      ; 14:5F23
    ld   d,$01                      ; 14:5F25
Code145F27:
    inc  c                          ; 14:5F27
    ld   [hl],d                     ; 14:5F28
    ld   a,c                        ; 14:5F29
    and  $0F                        ; 14:5F2A
    cp   $0A                        ; 14:5F2C
    jr   nc,Code145F32              ; 14:5F2E
    inc  hl                         ; 14:5F30
    inc  d                          ; 14:5F31
Code145F32:
    dec  b                          ; 14:5F32
    jr   nz,Code145F27              ; 14:5F33
    ret                             ; 14:5F35

Sub145F36:
    xor  a                          ; 14:5F36
    ld   [$D909],a                  ; 14:5F37
    ld   [$D92A],a                  ; 14:5F3A
    ld   a,[$D905]                  ; 14:5F3D
    ld   e,a                        ; 14:5F40
    ld   a,[$D906]                  ; 14:5F41
    ld   d,a                        ; 14:5F44
    ld   b,$00                      ; 14:5F45
Code145F47:
    ld   a,d                        ; 14:5F47
    and  a                          ; 14:5F48
    ld   a,e                        ; 14:5F49
    jr   nz,Code145F50              ; 14:5F4A
    cp   $64                        ; 14:5F4C
    jr   c,Code145F5B               ; 14:5F4E
Code145F50:
    sub  $64                        ; 14:5F50
    ld   e,a                        ; 14:5F52
    ld   a,d                        ; 14:5F53
    sbc  $00                        ; 14:5F54
    ld   d,a                        ; 14:5F56
    inc  b                          ; 14:5F57
    jp   Code145F47                 ; 14:5F58
Code145F5B:
    ld   a,e                        ; 14:5F5B
    and  a                          ; 14:5F5C
    jr   nz,Code145F66              ; 14:5F5D
    ld   a,b                        ; 14:5F5F
    and  $03                        ; 14:5F60
    jr   z,Code145F6A               ; 14:5F62
    jr   Code145F6F                 ; 14:5F64
Code145F66:
    and  $03                        ; 14:5F66
    jr   nz,Code145F6F              ; 14:5F68
Code145F6A:
    ld   a,$01                      ; 14:5F6A
    ld   [$D909],a                  ; 14:5F6C
Code145F6F:
    ld   a,e                        ; 14:5F6F
    srl  a                          ; 14:5F70
    srl  a                          ; 14:5F72
    add  e                          ; 14:5F74
    ld   e,a                        ; 14:5F75
    ld   a,b                        ; 14:5F76
    srl  a                          ; 14:5F77
    srl  a                          ; 14:5F79
    ld   c,a                        ; 14:5F7B
    xor  a                          ; 14:5F7C
    inc  b                          ; 14:5F7D
Code145F7E:
    dec  b                          ; 14:5F7E
    jr   z,Code145F8B               ; 14:5F7F
    add  $05                        ; 14:5F81
    cp   $07                        ; 14:5F83
    jr   c,Code145F7E               ; 14:5F85
    sub  $07                        ; 14:5F87
    jr   Code145F7E                 ; 14:5F89
Code145F8B:
    add  e                          ; 14:5F8B
    add  c                          ; 14:5F8C
    ld   e,a                        ; 14:5F8D
    ld   d,$00                      ; 14:5F8E
    ld   a,[$D909]                  ; 14:5F90
    and  a                          ; 14:5F93
    ld   a,[$D907]                  ; 14:5F94
    jr   z,Code145F9B               ; 14:5F97
    add  $0C                        ; 14:5F99
Code145F9B:
    add  $2C                        ; 14:5F9B
    ld   l,a                        ; 14:5F9D
    ld   a,$5A                      ; 14:5F9E
    adc  $00                        ; 14:5FA0
    ld   h,a                        ; 14:5FA2
    ld   a,[hl]                     ; 14:5FA3
    add  e                          ; 14:5FA4
Code145FA5:
    cp   $07                        ; 14:5FA5
    jr   c,Code145FAD               ; 14:5FA7
    sub  $07                        ; 14:5FA9
    jr   Code145FA5                 ; 14:5FAB
Code145FAD:
    ld   c,a                        ; 14:5FAD
    ld   b,$00                      ; 14:5FAE
    ld   a,[$D909]                  ; 14:5FB0
    and  a                          ; 14:5FB3
    jr   z,Code145FBA               ; 14:5FB4
    ld   a,c                        ; 14:5FB6
    add  $07                        ; 14:5FB7
    ld   c,a                        ; 14:5FB9
Code145FBA:
    ld   hl,Data145A44              ; 14:5FBA
    add  hl,bc                      ; 14:5FBD
    ld   e,[hl]                     ; 14:5FBE
    ld   a,e                        ; 14:5FBF
    ld   [$D92C],a                  ; 14:5FC0
    ld   a,[$D907]                  ; 14:5FC3
    ld   c,a                        ; 14:5FC6
    ld   b,$00                      ; 14:5FC7
    cp   $01                        ; 14:5FC9
    jr   nz,Code145FD7              ; 14:5FCB
    ld   a,[$D909]                  ; 14:5FCD
    and  a                          ; 14:5FD0
    jr   z,Code145FD7               ; 14:5FD1
    ld   a,c                        ; 14:5FD3
    add  $0B                        ; 14:5FD4
    ld   c,a                        ; 14:5FD6
Code145FD7:
    ld   hl,Data145A52              ; 14:5FD7
    add  hl,bc                      ; 14:5FDA
    ld   a,[hl]                     ; 14:5FDB
    ldh  [<$FF98],a                 ; 14:5FDC
    ld   [$D932],a                  ; 14:5FDE
    xor  a                          ; 14:5FE1
    ldh  [<$FF97],a                 ; 14:5FE2
    ld   hl,$D0C0                   ; 14:5FE4
    ld   bc,$D0E0                   ; 14:5FE7
    ld   d,$01                      ; 14:5FEA
Code145FEC:
    ldh  a,[<$FF97]                 ; 14:5FEC
    cp   e                          ; 14:5FEE
    jr   z,Code146009               ; 14:5FEF
    ld   a,$A1                      ; 14:5FF1
    ldi  [hl],a                     ; 14:5FF3
    ldi  [hl],a                     ; 14:5FF4
    ld   a,$90                      ; 14:5FF5
    ldi  [hl],a                     ; 14:5FF7
    ld   a,$DE                      ; 14:5FF8
    ld   [bc],a                     ; 14:5FFA
    inc  bc                         ; 14:5FFB
    ld   [bc],a                     ; 14:5FFC
    inc  bc                         ; 14:5FFD
    ld   a,$A0                      ; 14:5FFE
    ld   [bc],a                     ; 14:6000
    inc  bc                         ; 14:6001
    ldh  a,[<$FF97]                 ; 14:6002
    inc  a                          ; 14:6004
    ldh  [<$FF97],a                 ; 14:6005
    jr   Code145FEC                 ; 14:6007
Code146009:
    ld   a,d                        ; 14:6009
    swap a                          ; 14:600A
    and  $0F                        ; 14:600C
    sla  a                          ; 14:600E
    add  $2C                        ; 14:6010
    ld   [hl],a                     ; 14:6012
    inc  a                          ; 14:6013
    ld   [bc],a                     ; 14:6014
    cp   $2D                        ; 14:6015
    jr   nz,Code14601F              ; 14:6017
    ld   a,$A1                      ; 14:6019
    ld   [hl],a                     ; 14:601B
    ld   a,$DE                      ; 14:601C
    ld   [bc],a                     ; 14:601E
Code14601F:
    inc  hl                         ; 14:601F
    inc  bc                         ; 14:6020
    ld   a,d                        ; 14:6021
    and  $0F                        ; 14:6022
    sla  a                          ; 14:6024
    add  $2C                        ; 14:6026
    ldi  [hl],a                     ; 14:6028
    inc  hl                         ; 14:6029
    inc  a                          ; 14:602A
    ld   [bc],a                     ; 14:602B
    inc  bc                         ; 14:602C
    inc  bc                         ; 14:602D
    ld   a,d                        ; 14:602E
    inc  a                          ; 14:602F
    daa                             ; 14:6030
    ld   d,a                        ; 14:6031
    ldh  a,[<$FF98]                 ; 14:6032
    cp   d                          ; 14:6034
    jr   c,Code146075               ; 14:6035
    ld   a,e                        ; 14:6037
    inc  a                          ; 14:6038
    ld   e,a                        ; 14:6039
    cp   $07                        ; 14:603A
    jp   nz,Code146009              ; 14:603C
Code14603F:
    xor  a                          ; 14:603F
    ld   e,a                        ; 14:6040
    ld   a,c                        ; 14:6041
    and  $E0                        ; 14:6042
    add  $40                        ; 14:6044
    ld   c,a                        ; 14:6046
    ld   a,b                        ; 14:6047
    adc  $00                        ; 14:6048
    ld   b,a                        ; 14:604A
    ld   a,l                        ; 14:604B
    and  $E0                        ; 14:604C
    add  $40                        ; 14:604E
    ld   l,a                        ; 14:6050
    ld   a,h                        ; 14:6051
    adc  $00                        ; 14:6052
    ld   h,a                        ; 14:6054
    cp   $D2                        ; 14:6055
    jr   nz,Code14605E              ; 14:6057
    ld   a,l                        ; 14:6059
    cp   $40                        ; 14:605A
    jr   z,Code14607D               ; 14:605C
Code14605E:
    ldh  a,[<$FF98]                 ; 14:605E
    cp   d                          ; 14:6060
    jp   nc,Code146009              ; 14:6061
Code146064:
    ld   a,$A1                      ; 14:6064
    ldi  [hl],a                     ; 14:6066
    ldi  [hl],a                     ; 14:6067
    ld   a,$90                      ; 14:6068
    ldi  [hl],a                     ; 14:606A
    ld   a,$DE                      ; 14:606B
    ld   [bc],a                     ; 14:606D
    inc  bc                         ; 14:606E
    ld   [bc],a                     ; 14:606F
    inc  bc                         ; 14:6070
    ld   a,$A0                      ; 14:6071
    ld   [bc],a                     ; 14:6073
    inc  bc                         ; 14:6074
Code146075:
    inc  e                          ; 14:6075
    ld   a,e                        ; 14:6076
    cp   $07                        ; 14:6077
    jr   nz,Code146064              ; 14:6079
    jr   Code14603F                 ; 14:607B
Code14607D:
    ld   a,$07                      ; 14:607D
    ld   [$D90C],a                  ; 14:607F
    ld   hl,$D2C0                   ; 14:6082
    ld   bc,$D3A0                   ; 14:6085
    ld   de,$0000                   ; 14:6088
Code14608B:
    ld   a,e                        ; 14:608B
    and  $1F                        ; 14:608C
    jr   z,Code1460A0               ; 14:608E
    cp   $01                        ; 14:6090
    jr   z,Code1460A0               ; 14:6092
    cp   $12                        ; 14:6094
    jr   z,Code1460A4               ; 14:6096
    cp   $13                        ; 14:6098
    jr   z,Code1460A4               ; 14:609A
    ld   a,$06                      ; 14:609C
    jr   Code1460A8                 ; 14:609E
Code1460A0:
    ld   a,$01                      ; 14:60A0
    jr   Code1460A8                 ; 14:60A2
Code1460A4:
    ld   a,$05                      ; 14:60A4
    jr   Code1460A8                 ; 14:60A6
Code1460A8:
    ldi  [hl],a                     ; 14:60A8
    ld   [bc],a                     ; 14:60A9
    inc  bc                         ; 14:60AA
    inc  de                         ; 14:60AB
    ld   a,$E0                      ; 14:60AC
    cp   e                          ; 14:60AE
    jr   nz,Code14608B              ; 14:60AF
    call Sub145EBD                  ; 14:60B1
    call Sub145F0B                  ; 14:60B4
    ret                             ; 14:60B7

Sub1460B8:
    ld   hl,$D000                   ; 14:60B8
    ld   de,$D240                   ; 14:60BB
    ld   bc,$0240                   ; 14:60BE
Code1460C1:
    ld   a,$64                      ; 14:60C1
    ldi  [hl],a                     ; 14:60C3
    xor  a                          ; 14:60C4
    ld   [de],a                     ; 14:60C5
    inc  de                         ; 14:60C6
    dec  bc                         ; 14:60C7
    ld   a,c                        ; 14:60C8
    or   b                          ; 14:60C9
    jr   nz,Code1460C1              ; 14:60CA
    ld   hl,$D000                   ; 14:60CC
    ld   de,Data1463BC              ; 14:60CF
    ld   bc,$0000                   ; 14:60D2
Code1460D5:
    ld   a,[de]                     ; 14:60D5
    ldi  [hl],a                     ; 14:60D6
    inc  de                         ; 14:60D7
    inc  c                          ; 14:60D8
    ld   a,c                        ; 14:60D9
    cp   $14                        ; 14:60DA
    jr   nz,Code1460D5              ; 14:60DC
    push de                         ; 14:60DE
    ld   de,$000C                   ; 14:60DF
    add  hl,de                      ; 14:60E2
    pop  de                         ; 14:60E3
    ld   c,$00                      ; 14:60E4
    inc  b                          ; 14:60E6
    ld   a,b                        ; 14:60E7
    cp   $12                        ; 14:60E8
    jr   nz,Code1460D5              ; 14:60EA
    ld   hl,$D240                   ; 14:60EC
    ld   de,Data146524              ; 14:60EF
    ld   bc,$0000                   ; 14:60F2
Code1460F5:
    ld   a,[de]                     ; 14:60F5
    ldi  [hl],a                     ; 14:60F6
    inc  de                         ; 14:60F7
    inc  c                          ; 14:60F8
    ld   a,c                        ; 14:60F9
    cp   $14                        ; 14:60FA
    jr   nz,Code1460F5              ; 14:60FC
    push de                         ; 14:60FE
    ld   de,$000C                   ; 14:60FF
    add  hl,de                      ; 14:6102
    pop  de                         ; 14:6103
    ld   c,$00                      ; 14:6104
    inc  b                          ; 14:6106
    ld   a,b                        ; 14:6107
    cp   $12                        ; 14:6108
    jr   nz,Code1460F5              ; 14:610A
    ldh  a,[<H_GameSubstate]        ; 14:610C
    cp   $12                        ; 14:610E
    jr   z,Code146118               ; 14:6110
    ld   a,[$D928]                  ; 14:6112
    cp   $0E                        ; 14:6115
    ret  c                          ; 14:6117
Code146118:
    ld   hl,$D021                   ; 14:6118
    ld   de,$D041                   ; 14:611B
    ld   c,$12                      ; 14:611E
    ld   a,$40                      ; 14:6120
Code146122:
    ldi  [hl],a                     ; 14:6122
    ld   [de],a                     ; 14:6123
    inc  de                         ; 14:6124
    dec  c                          ; 14:6125
    jr   nz,Code146122              ; 14:6126
    ret                             ; 14:6128

Sub146129:
    ld   hl,Data3A5EA0              ; 14:6129
    bit  0,c                        ; 14:612C
    jr   nz,Code14613B              ; 14:612E
    push de                         ; 14:6130
    swap a                          ; 14:6131
    ld   e,a                        ; 14:6133
    ld   d,$00                      ; 14:6134
    ld   hl,Data3A5B70              ; 14:6136
    add  hl,de                      ; 14:6139
    pop  de                         ; 14:613A
Code14613B:
    ld   a,$02                      ; 14:613B
    ldh  [<SVBK],a                  ; 14:613D
    push bc                         ; 14:613F
    ld   bc,$0010                   ; 14:6140
    ld   a,$14                      ; 14:6143
    call CopyBytesLong              ; 14:6145
    pop  bc                         ; 14:6148
    xor  a                          ; 14:6149
    ldh  [<SVBK],a                  ; 14:614A
    ret                             ; 14:614C

Sub14614D:
    ld   a,$3A                      ; 14:614D
    ld   [$C415],a                  ; 14:614F
    xor  a                          ; 14:6152
    ldh  [<$FFA3],a                 ; 14:6153
    ld   a,[$D906]                  ; 14:6155
    ldh  [<$FFA4],a                 ; 14:6158
    ld   a,[$D905]                  ; 14:615A
    ldh  [<$FFA5],a                 ; 14:615D
    ld   hl,$FF97                   ; 14:615F
    call Sub003D54                  ; 14:6162
    ld   c,$00                      ; 14:6165
    ldh  a,[<$FF99]                 ; 14:6167
    and  $0F                        ; 14:6169
    jr   nz,Code14616E              ; 14:616B
    inc  c                          ; 14:616D
Code14616E:
    ld   de,$DF00                   ; 14:616E
    call Sub146129                  ; 14:6171
    ldh  a,[<$FF9A]                 ; 14:6174
    and  $0F                        ; 14:6176
    jr   z,Code14617C               ; 14:6178
    ld   c,$00                      ; 14:617A
Code14617C:
    ld   de,$DF10                   ; 14:617C
    call Sub146129                  ; 14:617F
    ldh  a,[<$FF9B]                 ; 14:6182
    and  $0F                        ; 14:6184
    jr   z,Code14618A               ; 14:6186
    ld   c,$00                      ; 14:6188
Code14618A:
    ld   de,$DF20                   ; 14:618A
    call Sub146129                  ; 14:618D
    ld   c,$00                      ; 14:6190
    ldh  a,[<$FF9C]                 ; 14:6192
    and  $0F                        ; 14:6194
    ld   de,$DF30                   ; 14:6196
    call Sub146129                  ; 14:6199
    xor  a                          ; 14:619C
    ldh  [<$FFA4],a                 ; 14:619D
    ldh  [<$FFA3],a                 ; 14:619F
    ld   a,[$D907]                  ; 14:61A1
    inc  a                          ; 14:61A4
    ldh  [<$FFA5],a                 ; 14:61A5
    ld   hl,$FF97                   ; 14:61A7
    call Sub003D54                  ; 14:61AA
    ld   c,$00                      ; 14:61AD
    ldh  a,[<$FF9B]                 ; 14:61AF
    and  $0F                        ; 14:61B1
    jr   nz,Code1461B6              ; 14:61B3
    inc  c                          ; 14:61B5
Code1461B6:
    ld   de,$DF40                   ; 14:61B6
    call Sub146129                  ; 14:61B9
    ld   c,$00                      ; 14:61BC
    ldh  a,[<$FF9C]                 ; 14:61BE
    and  $0F                        ; 14:61C0
    ld   de,$DF50                   ; 14:61C2
    call Sub146129                  ; 14:61C5
    xor  a                          ; 14:61C8
    ldh  [<$FFA4],a                 ; 14:61C9
    ldh  [<$FFA3],a                 ; 14:61CB
    ld   a,[$D908]                  ; 14:61CD
    ldh  [<$FFA5],a                 ; 14:61D0
    ld   hl,$FF97                   ; 14:61D2
    call Sub003D54                  ; 14:61D5
    ld   c,$00                      ; 14:61D8
    ldh  a,[<$FF9B]                 ; 14:61DA
    and  $0F                        ; 14:61DC
    jr   nz,Code1461E1              ; 14:61DE
    inc  c                          ; 14:61E0
Code1461E1:
    ld   de,$DF60                   ; 14:61E1
    call Sub146129                  ; 14:61E4
    ld   c,$00                      ; 14:61E7
    ldh  a,[<$FF9C]                 ; 14:61E9
    and  $0F                        ; 14:61EB
    ld   de,$DF70                   ; 14:61ED
    call Sub146129                  ; 14:61F0
    ret                             ; 14:61F3

Data1461F4:                         ; 14:61F4
.db $0C,$01,$00,$01,$08,$01,$14,$01,\
    $18,$01,$1C,$02,$20,$02,$24,$02,\
    $04,$01,$10,$01

Sub146208:
    ld   d,$00                      ; 14:6208
    ld   a,[$D96E]                  ; 14:620A
    bit  7,a                        ; 14:620D
    jr   z,Code146212               ; 14:620F
    xor  a                          ; 14:6211
Code146212:
    cp   $0A                        ; 14:6212
    jr   c,Code146217               ; 14:6214
    xor  a                          ; 14:6216
Code146217:
    ld   [$D96E],a                  ; 14:6217
    sla  a                          ; 14:621A
    ld   e,a                        ; 14:621C
    ld   hl,Data1461F4              ; 14:621D
    add  hl,de                      ; 14:6220
    ldi  a,[hl]                     ; 14:6221
    ldh  [<$FF97],a                 ; 14:6222
    ld   a,[hl]                     ; 14:6224
    ldh  [<$FF98],a                 ; 14:6225
    ld   de,$D083                   ; 14:6227
    ld   hl,$0240                   ; 14:622A
    add  hl,de                      ; 14:622D
    ld   c,l                        ; 14:622E
    ld   b,h                        ; 14:622F
    ldh  a,[<$FF97]                 ; 14:6230
    ld   [de],a                     ; 14:6232
    inc  de                         ; 14:6233
    inc  a                          ; 14:6234
    ld   [de],a                     ; 14:6235
    inc  a                          ; 14:6236
    ld   hl,$001F                   ; 14:6237
    add  hl,de                      ; 14:623A
    ldi  [hl],a                     ; 14:623B
    inc  a                          ; 14:623C
    ld   [hl],a                     ; 14:623D
    ldh  a,[<$FF98]                 ; 14:623E
    ld   [bc],a                     ; 14:6240
    inc  bc                         ; 14:6241
    ld   [bc],a                     ; 14:6242
    ld   hl,$001F                   ; 14:6243
    add  hl,bc                      ; 14:6246
    ldi  [hl],a                     ; 14:6247
    ld   [hl],a                     ; 14:6248
    ret                             ; 14:6249

Sub14624A:
    ld   a,[$D928]                  ; 14:624A
    push af                         ; 14:624D
    cp   $0E                        ; 14:624E
    jr   c,Code146256               ; 14:6250
    xor  a                          ; 14:6252
    ld   [$D928],a                  ; 14:6253
Code146256:
    ld   a,$14                      ; 14:6256
    rst  $10                        ; 14:6258
.dl SubL_075E6D                     ; 14:6259
    pop  af                         ; 14:625C
    ld   [$D928],a                  ; 14:625D
    ld   a,$25                      ; 14:6260
    ld   [$C415],a                  ; 14:6262
    ld   bc,$C471                   ; 14:6265
    ld   de,$D800                   ; 14:6268
    ld   a,e                        ; 14:626B
    ldh  [<$FF97],a                 ; 14:626C
    ld   a,d                        ; 14:626E
    ldh  [<$FF98],a                 ; 14:626F
    ld   l,$6C                      ; 14:6271
Code146273:
    push bc                         ; 14:6273
    push hl                         ; 14:6274
    ldh  a,[<$FF97]                 ; 14:6275
    ld   e,a                        ; 14:6277
    ldh  a,[<$FF98]                 ; 14:6278
    ld   d,a                        ; 14:627A
    ld   hl,$0010                   ; 14:627B
    add  hl,de                      ; 14:627E
    ld   a,l                        ; 14:627F
    ldh  [<$FF97],a                 ; 14:6280
    ld   a,h                        ; 14:6282
    ldh  [<$FF98],a                 ; 14:6283
    ld   a,[bc]                     ; 14:6285
    xor  $80                        ; 14:6286
    ld   b,$00                      ; 14:6288
    sla  a                          ; 14:628A
    rl   b                          ; 14:628C
    sla  a                          ; 14:628E
    rl   b                          ; 14:6290
    sla  a                          ; 14:6292
    rl   b                          ; 14:6294
    sla  a                          ; 14:6296
    rl   b                          ; 14:6298
    ld   c,a                        ; 14:629A
    ld   hl,Data3A4800              ; 14:629B
    add  hl,bc                      ; 14:629E
    ld   bc,$0010                   ; 14:629F
    ld   a,$02                      ; 14:62A2
    ldh  [<SVBK],a                  ; 14:62A4
    ld   a,$14                      ; 14:62A6
    call CopyBytesLong              ; 14:62A8
    xor  a                          ; 14:62AB
    ldh  [<SVBK],a                  ; 14:62AC
    pop  hl                         ; 14:62AE
    pop  bc                         ; 14:62AF
    inc  bc                         ; 14:62B0
    dec  l                          ; 14:62B1
    jr   nz,Code146273              ; 14:62B2
    ld   a,$01                      ; 14:62B4
    ld   [$C424],a                  ; 14:62B6
    ld   hl,$C4ED                   ; 14:62B9
    ld   a,$00                      ; 14:62BC
    ldi  [hl],a                     ; 14:62BE
    ld   a,$D8                      ; 14:62BF
    ldi  [hl],a                     ; 14:62C1
    xor  a                          ; 14:62C2
    ld   [hl],a                     ; 14:62C3
    ld   hl,$C4F0                   ; 14:62C4
    ld   a,$00                      ; 14:62C7
    ldi  [hl],a                     ; 14:62C9
    ld   a,$88                      ; 14:62CA
    ld   [hl],a                     ; 14:62CC
    ld   a,$77                      ; 14:62CD
    ld   [$C4F2],a                  ; 14:62CF
    ld   a,$02                      ; 14:62D2
    ld   [$C4F4],a                  ; 14:62D4
    ret                             ; 14:62D7

Sub1462D8:
    xor  a                          ; 14:62D8
    ld   [$D928],a                  ; 14:62D9
    ld   b,a                        ; 14:62DC
    dec  a                          ; 14:62DD
    ld   c,a                        ; 14:62DE
    ld   hl,$C439                   ; 14:62DF
Code1462E2:
    inc  c                          ; 14:62E2
    ld   a,c                        ; 14:62E3
    cp   $0E                        ; 14:62E4
    jr   z,Code146318               ; 14:62E6
    ld   a,[$D906]                  ; 14:62E8
    cp   [hl]                       ; 14:62EB
    jr   nz,Code146312              ; 14:62EC
    inc  hl                         ; 14:62EE
    ld   a,[$D905]                  ; 14:62EF
    cp   [hl]                       ; 14:62F2
    jr   nz,Code146313              ; 14:62F3
    inc  hl                         ; 14:62F5
    ld   a,[$D907]                  ; 14:62F6
    inc  a                          ; 14:62F9
    cp   [hl]                       ; 14:62FA
    jr   nz,Code146314              ; 14:62FB
    inc  hl                         ; 14:62FD
    ld   a,[$D908]                  ; 14:62FE
    cp   [hl]                       ; 14:6301
    inc  hl                         ; 14:6302
    jr   nz,Code1462E2              ; 14:6303
    ld   hl,$D960                   ; 14:6305
    add  hl,bc                      ; 14:6308
    ld   a,[hl]                     ; 14:6309
    ld   [$D96E],a                  ; 14:630A
    ld   a,c                        ; 14:630D
    ld   [$D928],a                  ; 14:630E
    ret                             ; 14:6311

Code146312:
    inc  hl                         ; 14:6312
Code146313:
    inc  hl                         ; 14:6313
Code146314:
    inc  hl                         ; 14:6314
    inc  hl                         ; 14:6315
    jr   Code1462E2                 ; 14:6316
Code146318:
    xor  a                          ; 14:6318
    ld   [$D96E],a                  ; 14:6319
    ld   b,a                        ; 14:631C
    dec  a                          ; 14:631D
    ld   c,a                        ; 14:631E
    ld   hl,$C43B                   ; 14:631F
Code146322:
    inc  c                          ; 14:6322
    ld   a,c                        ; 14:6323
    cp   $0E                        ; 14:6324
    jr   z,Code146332               ; 14:6326
    ld   a,[hl]                     ; 14:6328
    and  a                          ; 14:6329
    jr   z,Code146337               ; 14:632A
    inc  hl                         ; 14:632C
    inc  hl                         ; 14:632D
    inc  hl                         ; 14:632E
    inc  hl                         ; 14:632F
    jr   Code146322                 ; 14:6330
Code146332:
    ld   a,$FF                      ; 14:6332
    ld   [$D96E],a                  ; 14:6334
Code146337:
    ld   a,c                        ; 14:6337
    ld   [$D928],a                  ; 14:6338
    ret                             ; 14:633B

Data14633C:                         ; 14:633C
.dw $1142,$4F02,$1142,$7FFF,$7FFF,$03FF,$001F,$0000,\
    $7FFF,$03FF,$7CC6,$0000,$63BE,$337F,$15D4,$1142,\
    $63BE,$7DEE,$7CE3,$0000,$63BE,$22FF,$04D3,$0000,\
    $0000,$0000,$0000,$0000,$7FFF,$04D3,$22FF,$0000,\
    $7FFF,$03FF,$001F,$0000,$7FFF,$56B5,$2D6B,$0000,\
    $7FFF,$56B5,$2D6B,$0000,$7FFF,$56B5,$2D6B,$0000,\
    $7FFF,$56B5,$2D6B,$0000,$7FFF,$56B5,$2D6B,$0000,\
    $7DE0,$7FFF,$02BC,$0019,$7FFF,$22FF,$04D3,$0000
Data1463BC:                         ; 14:63BC
.db $42,$41,$41,$41,$41,$41,$41,$41,\
    $41,$41,$41,$41,$41,$41,$41,$41,\
    $41,$41,$41,$42,$43
Data1463D1:                         ; 14:63D1
.db $3D,$3C,$3C,$3C,$3D,$44,$45,$46,\
    $47,$48,$49,$4A,$4B,$3D,$3C,$3C,\
    $3C,$3D,$43,$43
Data1463E5:                         ; 14:63E5
.db $3D,$3C,$3C,$3C,$3D,$54,$55,$56,\
    $57,$58,$59,$5A,$5B,$3D,$3C,$3C,\
    $3C,$3D,$43,$43,$40,$28,$29,$29,\
    $2A,$40,$40,$40,$40,$40,$40,$40,\
    $40,$40,$40,$40,$40,$40,$43,$43,\
    $40,$2B,$00,$01,$2C,$40,$40,$40,\
    $40,$40,$40,$40,$40,$40,$40,$40,\
    $40,$40,$43,$43,$40,$2B,$02,$03,\
    $2C,$40,$40,$F0,$F1,$F2,$F3,$53,\
    $F4,$F5,$53,$F6,$F7,$40,$43,$43,\
    $40,$2D,$2E,$2E,$2F,$3B,$3A,$3A,\
    $3A,$3A,$3A,$3A,$3A,$3A,$3A,$3A,\
    $3A,$3B,$43,$43,$40,$40,$40,$40,\
    $40,$40,$40,$40,$40,$40,$40,$40,\
    $40,$40,$40,$40,$40,$40,$43,$51,\
    $50,$50,$50,$50,$50,$50,$50,$50,\
    $50,$50,$50,$50,$50,$50,$50,$50,\
    $50,$50,$51,$52,$81,$83,$85,$87,\
    $89,$8B,$8D,$8F,$91,$93,$95,$97,\
    $99,$9B,$9D,$9F,$A1,$A3,$52,$52,\
    $80,$82,$84,$86,$88,$8A,$8C,$8E,\
    $90,$92,$94,$96,$98,$9A,$9C,$9E,\
    $A0,$A2,$52,$52,$A5,$A7,$A9,$AB,\
    $AD,$AF,$B1,$B3,$B5,$B7,$B9,$BB,\
    $BD,$BF,$C1,$C3,$C5,$C7,$52,$52,\
    $A4,$A6,$A8,$AA,$AC,$AE,$B0,$B2,\
    $B4,$B6,$B8,$BA,$BC,$BE,$C0,$C2,\
    $C4,$C6,$52,$52,$C9,$CB,$CD,$CF,\
    $D1,$D3,$D5,$D7,$D9,$DB,$DD,$DF,\
    $E1,$E3,$E5,$E7,$E9,$EB,$52,$52,\
    $C8,$CA,$CC,$CE,$D0,$D2,$D4,$D6,\
    $D8,$DA,$DC,$DE,$E0,$E2,$E4,$E6,\
    $E8,$EA,$52,$52,$63,$63,$63,$63,\
    $63,$63,$63,$63,$63,$63,$63,$63,\
    $63,$63,$63,$63,$63,$63,$52,$51,\
    $50,$50,$50,$50,$50,$50,$50,$50,\
    $50,$50,$50,$50,$50,$50,$50,$50,\
    $50,$50,$51,$42,$41,$41,$41,$41,\
    $41,$41,$41,$41,$41,$41,$41,$41,\
    $41,$41,$41,$41,$41,$41,$42
Data146524:                         ; 14:6524
.db $23,$03,$03,$03,$03,$03,$03,$03,\
    $03,$03,$03,$03,$03,$03,$03,$03,\
    $03,$03,$03,$03,$23,$24,$04,$04,\
    $04,$04,$04,$04,$04,$04,$04,$04,\
    $04,$04,$24,$04,$04,$04,$04,$03,\
    $23,$64,$44,$44,$44,$44,$04,$04,\
    $04,$04,$04,$04,$04,$04,$64,$44,\
    $44,$44,$44,$03,$23,$04,$05,$05,\
    $05,$05,$04,$04,$04,$04,$04,$04,\
    $04,$04,$04,$04,$04,$04,$04,$03,\
    $23,$04,$05,$01,$01,$05,$04,$04,\
    $04,$04,$04,$04,$04,$04,$04,$04,\
    $04,$04,$04,$03,$23,$04,$05,$01,\
    $01,$05,$04,$04,$04,$04,$04,$04,\
    $04,$04,$04,$04,$04,$04,$04,$03,\
    $23,$04,$05,$05,$05,$05,$24,$04,\
    $04,$04,$04,$04,$04,$04,$04,$04,\
    $04,$04,$04,$03,$23,$04,$04,$04,\
    $04,$04,$04,$04,$04,$04,$04,$04,\
    $04,$04,$04,$04,$04,$04,$04,$03,\
    $23,$03,$03,$03,$03,$03,$03,$03,\
    $03,$03,$03,$03,$03,$03,$03,$03,\
    $03,$03,$03,$03,$23,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$03,\
    $23,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$03,$23,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$03,\
    $23,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$03,$23,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$03,\
    $23,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$03,$23,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$03,\
    $63,$43,$43,$43,$43,$43,$43,$43,\
    $43,$43,$43,$43,$43,$43,$43,$43,\
    $43,$43,$43,$43,$63,$43,$43,$43,\
    $43,$43,$43,$43,$43,$43,$43,$43,\
    $43,$43,$43,$43,$43,$43,$43,$43
Code14668C:
    call Sub00126D                  ; 14:668C
    xor  a                          ; 14:668F
    ldh  [<IE],a                    ; 14:6690
    ldh  [<$FF93],a                 ; 14:6692
    ld   a,$14                      ; 14:6694
    rst  $10                        ; 14:6696
.dl SubL_0756D9                     ; 14:6697
    call Sub1462D8                  ; 14:669A
    ld   a,[$D96E]                  ; 14:669D
    cp   $FF                        ; 14:66A0
    jr   nz,Code1466BD              ; 14:66A2
    ld   a,[$C43A]                  ; 14:66A4
    ld   [$D905],a                  ; 14:66A7
    ld   a,[$C439]                  ; 14:66AA
    ld   [$D906],a                  ; 14:66AD
    ld   a,[$C43B]                  ; 14:66B0
    dec  a                          ; 14:66B3
    ld   [$D907],a                  ; 14:66B4
    ld   a,[$C43C]                  ; 14:66B7
    ld   [$D908],a                  ; 14:66BA
Code1466BD:
    ld   hl,$D960                   ; 14:66BD
    ld   a,[$D928]                  ; 14:66C0
    ld   c,a                        ; 14:66C3
    ld   b,$00                      ; 14:66C4
    add  hl,bc                      ; 14:66C6
    ld   a,[hl]                     ; 14:66C7
    ld   [$D96E],a                  ; 14:66C8
    call Sub1460B8                  ; 14:66CB
    call Sub14614D                  ; 14:66CE
    call Sub146208                  ; 14:66D1
    ld   a,$01                      ; 14:66D4
    ldh  [<VBK],a                   ; 14:66D6
    ld   a,$00                      ; 14:66D8
    ld   bc,$D240                   ; 14:66DA
    ld   de,$9800                   ; 14:66DD
    ld   h,$14                      ; 14:66E0
    ld   l,$23                      ; 14:66E2
    call DMATransfer                ; 14:66E4
    xor  a                          ; 14:66E7
    ldh  [<VBK],a                   ; 14:66E8
    ld   a,$00                      ; 14:66EA
    ld   bc,$D000                   ; 14:66EC
    ld   de,$9800                   ; 14:66EF
    ld   h,$14                      ; 14:66F2
    ld   l,$23                      ; 14:66F4
    call DMATransfer                ; 14:66F6
    ld   a,$3A                      ; 14:66F9
    ld   bc,Data3A4870              ; 14:66FB
    ld   de,$8000                   ; 14:66FE
    ld   h,$14                      ; 14:6701
    ld   l,$7F                      ; 14:6703
    call DMATransfer                ; 14:6705
    ld   a,$3A                      ; 14:6708
    ld   bc,Data3A5870              ; 14:670A
    ld   de,$9000                   ; 14:670D
    ld   h,$14                      ; 14:6710
    ld   l,$7F                      ; 14:6712
    call DMATransfer                ; 14:6714
    ld   a,$3A                      ; 14:6717
    ld   [$C415],a                  ; 14:6719
    ld   a,$02                      ; 14:671C
    ldh  [<SVBK],a                  ; 14:671E
    ld   hl,Data3A5870              ; 14:6720
    ld   de,$D000                   ; 14:6723
    ld   bc,$0800                   ; 14:6726
    ld   a,$14                      ; 14:6729
    call CopyBytesLong              ; 14:672B
    xor  a                          ; 14:672E
    ldh  [<SVBK],a                  ; 14:672F
    call Sub14624A                  ; 14:6731
    xor  a                          ; 14:6734
    ld   [$C424],a                  ; 14:6735
    ld   a,$02                      ; 14:6738
    ldh  [<SVBK],a                  ; 14:673A
    xor  a                          ; 14:673C
    ld   bc,$D800                   ; 14:673D
    ld   de,$8800                   ; 14:6740
    ld   h,$14                      ; 14:6743
    ld   l,$7F                      ; 14:6745
    call DMATransfer                ; 14:6747
    xor  a                          ; 14:674A
    ldh  [<SVBK],a                  ; 14:674B
    ld   hl,Data14633C              ; 14:674D
    ld   de,$DF80                   ; 14:6750
    ld   bc,$0080                   ; 14:6753
    call CopyBytes                  ; 14:6756
    ld   a,$01                      ; 14:6759
    ldh  [<$FFC0],a                 ; 14:675B
    call Sub000E29                  ; 14:675D
    ld   a,$02                      ; 14:6760
    ld   [$C4EC],a                  ; 14:6762
    ld   a,[$D928]                  ; 14:6765
    cp   $0E                        ; 14:6768
    jr   nz,Code146771              ; 14:676A
    ld   a,$04                      ; 14:676C
    ld   [$C4EC],a                  ; 14:676E
Code146771:
    call Sub144412                  ; 14:6771
    ld   a,$01                      ; 14:6774
    ld   [$CDF3],a                  ; 14:6776
    ld   a,$00                      ; 14:6779
    ld   [$D913],a                  ; 14:677B
    ld   a,$D0                      ; 14:677E
    ld   [$D914],a                  ; 14:6780
    ld   a,$02                      ; 14:6783
    ld   [$D915],a                  ; 14:6785
    ld   a,$09                      ; 14:6788
    ld   [$CDF4],a                  ; 14:678A
    xor  a                          ; 14:678D
    ldh  [<$FFB8],a                 ; 14:678E
    ldh  [<$FFB9],a                 ; 14:6790
    ldh  [<$FFBA],a                 ; 14:6792
    ldh  [<$FFBB],a                 ; 14:6794
    ld   [$D92A],a                  ; 14:6796
    ld   [$D929],a                  ; 14:6799
    ld   [$D970],a                  ; 14:679C
    ld   [$D96F],a                  ; 14:679F
    ld   a,$14                      ; 14:67A2
    ld   [$D92B],a                  ; 14:67A4
    ld   a,$02                      ; 14:67A7
    ld   [$C0C1],a                  ; 14:67A9
    ld   a,$09                      ; 14:67AC
    ldh  [<IE],a                    ; 14:67AE
    ldh  [<$FF93],a                 ; 14:67B0
    ld   a,$E7                      ; 14:67B2
    ldh  [<LCDC],a                  ; 14:67B4
    ldh  a,[<H_GameSubstate]        ; 14:67B6
    cp   $12                        ; 14:67B8
    jr   z,Code1467C3               ; 14:67BA
    ld   a,[$D928]                  ; 14:67BC
    cp   $0E                        ; 14:67BF
    jr   c,Code1467CF               ; 14:67C1
Code1467C3:
    ld   a,$30                      ; 14:67C3
    ldh  [<$FFF3],a                 ; 14:67C5
    xor  a                          ; 14:67C7
    ld   [$D928],a                  ; 14:67C8
    ld   a,$13                      ; 14:67CB
    jr   Code1467D1                 ; 14:67CD
Code1467CF:
    ld   a,$10                      ; 14:67CF
Code1467D1:
    ldh  [<H_GameSubstate],a        ; 14:67D1
    ret                             ; 14:67D3

Sub1467D4:
    ld   a,[$D92A]                  ; 14:67D4
    ld   c,a                        ; 14:67D7
    ld   hl,$D92B                   ; 14:67D8
    dec  [hl]                       ; 14:67DB
    ld   a,[hl]                     ; 14:67DC
    and  a                          ; 14:67DD
    jr   nz,Code1467EB              ; 14:67DE
    ld   a,$1E                      ; 14:67E0
    ld   [hl],a                     ; 14:67E2
    ld   a,[$D92A]                  ; 14:67E3
    xor  $01                        ; 14:67E6
    ld   [$D92A],a                  ; 14:67E8
Code1467EB:
    ld   a,c                        ; 14:67EB
    and  a                          ; 14:67EC
    ret  z                          ; 14:67ED
    ldh  a,[<H_GameSubstate]        ; 14:67EE
    cp   $13                        ; 14:67F0
    jr   c,Code146818               ; 14:67F2
    ld   a,$34                      ; 14:67F4
    ld   [$C000],a                  ; 14:67F6
    ld   [$C004],a                  ; 14:67F9
    ld   a,$3E                      ; 14:67FC
    ld   [$C001],a                  ; 14:67FE
    ld   a,$9A                      ; 14:6801
    ld   [$C005],a                  ; 14:6803
    xor  a                          ; 14:6806
    ld   [$C002],a                  ; 14:6807
    ld   [$C006],a                  ; 14:680A
    ld   a,$20                      ; 14:680D
    ld   [$C003],a                  ; 14:680F
    ld   a,$00                      ; 14:6812
    ld   [$C007],a                  ; 14:6814
    ret                             ; 14:6817

Code146818:
    ld   a,$30                      ; 14:6818
    ld   [$C000],a                  ; 14:681A
    ld   [$C004],a                  ; 14:681D
    ld   a,$10                      ; 14:6820
    ld   [$C001],a                  ; 14:6822
    ld   a,$38                      ; 14:6825
    ld   [$C005],a                  ; 14:6827
    xor  a                          ; 14:682A
    ld   [$C002],a                  ; 14:682B
    ld   [$C006],a                  ; 14:682E
    ld   a,$25                      ; 14:6831
    ld   [$C003],a                  ; 14:6833
    ld   a,$05                      ; 14:6836
    ld   [$C007],a                  ; 14:6838
    ret                             ; 14:683B

Sub14683C:
    ld   a,$63                      ; 14:683C
    ldh  [<$FFF2],a                 ; 14:683E
    ld   a,$09                      ; 14:6840
    ldh  [<H_GameSubstate],a        ; 14:6842
    ld   a,$03                      ; 14:6844
    ld   [$C432],a                  ; 14:6846
    ld   a,$14                      ; 14:6849
    rst  $10                        ; 14:684B
.dl SubL_0757EF                     ; 14:684C
    ret                             ; 14:684F

Code146850:
    ld   a,$90                      ; 14:6850
    ld   [$C178],a                  ; 14:6852
    ld   hl,$D960                   ; 14:6855
    ld   a,[$D928]                  ; 14:6858
    ld   c,a                        ; 14:685B
    ld   b,$00                      ; 14:685C
    add  hl,bc                      ; 14:685E
    ld   a,[$D96E]                  ; 14:685F
    ld   [hl],a                     ; 14:6862
    ld   hl,$C439                   ; 14:6863
    sla  c                          ; 14:6866
    sla  c                          ; 14:6868
    add  hl,bc                      ; 14:686A
    ld   a,[$D906]                  ; 14:686B
    ldi  [hl],a                     ; 14:686E
    ld   a,[$D905]                  ; 14:686F
    ldi  [hl],a                     ; 14:6872
    ld   a,[$D907]                  ; 14:6873
    inc  a                          ; 14:6876
    ldi  [hl],a                     ; 14:6877
    ld   a,[$D908]                  ; 14:6878
    ldi  [hl],a                     ; 14:687B
    call Sub1467D4                  ; 14:687C
    ldh  a,[<$FF8C]                 ; 14:687F
    and  $34                        ; 14:6881
    jr   z,Code1468CF               ; 14:6883
    ld   b,$01                      ; 14:6885
    and  $14                        ; 14:6887
    jr   nz,Code14688D              ; 14:6889
    dec  b                          ; 14:688B
    dec  b                          ; 14:688C
Code14688D:
    ld   a,$47                      ; 14:688D
    ldh  [<$FFF2],a                 ; 14:688F
    ld   a,$01                      ; 14:6891
    ld   [$D92A],a                  ; 14:6893
    ld   a,$20                      ; 14:6896
    ld   [$D92B],a                  ; 14:6898
    ld   a,[$D96E]                  ; 14:689B
    add  b                          ; 14:689E
    bit  7,a                        ; 14:689F
    jr   z,Code1468A5               ; 14:68A1
    ld   a,$09                      ; 14:68A3
Code1468A5:
    cp   $0A                        ; 14:68A5
    jr   c,Code1468AA               ; 14:68A7
    xor  a                          ; 14:68A9
Code1468AA:
    ld   [$D96E],a                  ; 14:68AA
    cp   $09                        ; 14:68AD
    jr   nz,Code1468BC              ; 14:68AF
    ld   a,[$C429]                  ; 14:68B1
    and  $F8                        ; 14:68B4
    cp   $F8                        ; 14:68B6
    jr   z,Code1468C7               ; 14:68B8
    jr   Code14688D                 ; 14:68BA
Code1468BC:
    cp   $08                        ; 14:68BC
    jr   c,Code1468C7               ; 14:68BE
    ld   a,[$C429]                  ; 14:68C0
    and  $F8                        ; 14:68C3
    jr   z,Code14688D               ; 14:68C5
Code1468C7:
    call Sub146208                  ; 14:68C7
    ld   hl,H_GameSubstate          ; 14:68CA
    inc  [hl]                       ; 14:68CD
    ret                             ; 14:68CE

Code1468CF:
    ldh  a,[<$FF8C]                 ; 14:68CF
    bit  1,a                        ; 14:68D1
    jr   z,Code1468E4               ; 14:68D3
    call Sub14683C                  ; 14:68D5
    ld   a,$0C                      ; 14:68D8
    ldh  [<H_GameSubstate],a        ; 14:68DA
    xor  a                          ; 14:68DC
    ldh  [<$FFF2],a                 ; 14:68DD
    ld   a,$3D                      ; 14:68DF
    ldh  [<$FFF3],a                 ; 14:68E1
    ret                             ; 14:68E3

Code1468E4:
    and  $01                        ; 14:68E4
    ret  z                          ; 14:68E6
    call Sub1468EB                  ; 14:68E7
    ret                             ; 14:68EA

Sub1468EB:
    ld   a,$31                      ; 14:68EB
    ldh  [<$FFF3],a                 ; 14:68ED
    ldh  a,[<H_GameState]           ; 14:68EF
    ld   [$C416],a                  ; 14:68F1
    ldh  a,[<H_GameSubstate]        ; 14:68F4
    ld   [$C417],a                  ; 14:68F6
    ld   a,$2E                      ; 14:68F9
    ldh  [<H_GameState],a           ; 14:68FB
    xor  a                          ; 14:68FD
    ldh  [<H_GameSubstate],a        ; 14:68FE
    ld   [$C418],a                  ; 14:6900
    ld   a,$06                      ; 14:6903
    ld   [$C432],a                  ; 14:6905
    ld   a,$E7                      ; 14:6908
    ldh  [<LCDC],a                  ; 14:690A
    call Sub0010AD                  ; 14:690C
    ld   a,$14                      ; 14:690F
    rst  $10                        ; 14:6911
.dl SubL_0757EF                     ; 14:6912
    ld   a,$14                      ; 14:6915
    rst  $10                        ; 14:6917
.dl SubL_075E6D                     ; 14:6918
    ret                             ; 14:691B

Code14691C:
    call Sub145EF1                  ; 14:691C
    ldh  a,[<H_GameSubstate]        ; 14:691F
    cp   $13                        ; 14:6921
    jr   c,Code146928               ; 14:6923
    call Sub146930                  ; 14:6925
Code146928:
    call Sub1467D4                  ; 14:6928
    ld   hl,H_GameSubstate          ; 14:692B
    dec  [hl]                       ; 14:692E
    ret                             ; 14:692F

Sub146930:
    ld   a,[$D970]                  ; 14:6930
    ld   e,a                        ; 14:6933
    ld   hl,$D96F                   ; 14:6934
    inc  [hl]                       ; 14:6937
    ld   a,[hl]                     ; 14:6938
    bit  5,a                        ; 14:6939
    jr   z,Code146940               ; 14:693B
    dec  e                          ; 14:693D
    jr   Code146941                 ; 14:693E
Code146940:
    inc  e                          ; 14:6940
Code146941:
    and  $02                        ; 14:6941
    jr   z,Code146949               ; 14:6943
    ld   a,e                        ; 14:6945
    ld   [$D970],a                  ; 14:6946
Code146949:
    ld   a,[$D970]                  ; 14:6949
    add  $18                        ; 14:694C
    ld   [$C008],a                  ; 14:694E
    ld   [$C00C],a                  ; 14:6951
    ld   [$C010],a                  ; 14:6954
    ld   [$C014],a                  ; 14:6957
    ld   [$C018],a                  ; 14:695A
    ld   [$C01C],a                  ; 14:695D
    ld   [$C020],a                  ; 14:6960
    ld   [$C024],a                  ; 14:6963
    ld   [$C028],a                  ; 14:6966
    ld   a,$30                      ; 14:6969
    ld   [$C009],a                  ; 14:696B
    add  $08                        ; 14:696E
    ld   [$C00D],a                  ; 14:6970
    add  $08                        ; 14:6973
    ld   [$C011],a                  ; 14:6975
    add  $08                        ; 14:6978
    ld   [$C015],a                  ; 14:697A
    add  $08                        ; 14:697D
    ld   [$C019],a                  ; 14:697F
    add  $10                        ; 14:6982
    ld   [$C01D],a                  ; 14:6984
    add  $08                        ; 14:6987
    ld   [$C021],a                  ; 14:6989
    add  $08                        ; 14:698C
    ld   [$C025],a                  ; 14:698E
    add  $08                        ; 14:6991
    ld   [$C029],a                  ; 14:6993
    ld   a,$04                      ; 14:6996
    ld   [$C00A],a                  ; 14:6998
    inc  a                          ; 14:699B
    inc  a                          ; 14:699C
    ld   [$C00E],a                  ; 14:699D
    inc  a                          ; 14:69A0
    inc  a                          ; 14:69A1
    ld   [$C012],a                  ; 14:69A2
    inc  a                          ; 14:69A5
    inc  a                          ; 14:69A6
    ld   [$C016],a                  ; 14:69A7
    inc  a                          ; 14:69AA
    inc  a                          ; 14:69AB
    ld   [$C01A],a                  ; 14:69AC
    inc  a                          ; 14:69AF
    inc  a                          ; 14:69B0
    ld   [$C01E],a                  ; 14:69B1
    inc  a                          ; 14:69B4
    inc  a                          ; 14:69B5
    ld   [$C022],a                  ; 14:69B6
    inc  a                          ; 14:69B9
    inc  a                          ; 14:69BA
    ld   [$C026],a                  ; 14:69BB
    inc  a                          ; 14:69BE
    inc  a                          ; 14:69BF
    ld   [$C02A],a                  ; 14:69C0
    ld   a,$06                      ; 14:69C3
    ld   [$C00B],a                  ; 14:69C5
    ld   [$C00F],a                  ; 14:69C8
    ld   [$C013],a                  ; 14:69CB
    ld   [$C017],a                  ; 14:69CE
    ld   [$C01B],a                  ; 14:69D1
    ld   [$C01F],a                  ; 14:69D4
    ld   [$C023],a                  ; 14:69D7
    ld   [$C027],a                  ; 14:69DA
    ld   [$C02B],a                  ; 14:69DD
    ret                             ; 14:69E0

Sub1469E1:
    push af                         ; 14:69E1
    ld   b,$00                      ; 14:69E2
    ld   hl,$D960                   ; 14:69E4
    ld   c,a                        ; 14:69E7
    add  hl,bc                      ; 14:69E8
    ld   a,[hl]                     ; 14:69E9
    ld   [$D96E],a                  ; 14:69EA
    pop  af                         ; 14:69ED
    sla  a                          ; 14:69EE
    sla  a                          ; 14:69F0
    ld   c,a                        ; 14:69F2
    ld   hl,$C439                   ; 14:69F3
    add  hl,bc                      ; 14:69F6
    ldi  a,[hl]                     ; 14:69F7
    ld   [$D906],a                  ; 14:69F8
    ldi  a,[hl]                     ; 14:69FB
    ld   [$D905],a                  ; 14:69FC
    ldi  a,[hl]                     ; 14:69FF
    dec  a                          ; 14:6A00
    ld   [$D907],a                  ; 14:6A01
    ldi  a,[hl]                     ; 14:6A04
    ld   [$D908],a                  ; 14:6A05
    ret                             ; 14:6A08

Sub146A09:
    ld   hl,$D021                   ; 14:6A09
    ld   de,$D041                   ; 14:6A0C
    ld   c,$12                      ; 14:6A0F
    ld   a,$40                      ; 14:6A11
Code146A13:
    ldi  [hl],a                     ; 14:6A13
    ld   [de],a                     ; 14:6A14
    inc  de                         ; 14:6A15
    dec  c                          ; 14:6A16
    jr   nz,Code146A13              ; 14:6A17
    ret                             ; 14:6A19

Sub146A1A:
    ld   hl,$D021                   ; 14:6A1A
    ld   de,Data1463D1              ; 14:6A1D
    ld   c,$12                      ; 14:6A20
Code146A22:
    ld   a,[de]                     ; 14:6A22
    ldi  [hl],a                     ; 14:6A23
    inc  de                         ; 14:6A24
    dec  c                          ; 14:6A25
    jr   nz,Code146A22              ; 14:6A26
    ld   hl,$D041                   ; 14:6A28
    ld   de,Data1463E5              ; 14:6A2B
    ld   c,$12                      ; 14:6A2E
Code146A30:
    ld   a,[de]                     ; 14:6A30
    ldi  [hl],a                     ; 14:6A31
    inc  de                         ; 14:6A32
    dec  c                          ; 14:6A33
    jr   nz,Code146A30              ; 14:6A34
    ret                             ; 14:6A36

Code146A37:
    ld   a,$90                      ; 14:6A37
    ld   [$C178],a                  ; 14:6A39
    call Sub146930                  ; 14:6A3C
    call Sub1467D4                  ; 14:6A3F
    ldh  a,[<$FF8C]                 ; 14:6A42
    and  $30                        ; 14:6A44
    jr   z,Code146A8D               ; 14:6A46
    ld   b,$01                      ; 14:6A48
    bit  4,a                        ; 14:6A4A
    jr   nz,Code146A50              ; 14:6A4C
    dec  b                          ; 14:6A4E
    dec  b                          ; 14:6A4F
Code146A50:
    ld   de,$0000                   ; 14:6A50
    ld   a,$47                      ; 14:6A53
    ldh  [<$FFF2],a                 ; 14:6A55
Code146A57:
    ld   a,[$D928]                  ; 14:6A57
    add  b                          ; 14:6A5A
    bit  7,a                        ; 14:6A5B
    jr   z,Code146A61               ; 14:6A5D
    ld   a,$0D                      ; 14:6A5F
Code146A61:
    cp   $0E                        ; 14:6A61
    jr   c,Code146A66               ; 14:6A63
    xor  a                          ; 14:6A65
Code146A66:
    ld   [$D928],a                  ; 14:6A66
    ld   e,a                        ; 14:6A69
    sla  e                          ; 14:6A6A
    sla  e                          ; 14:6A6C
    ld   hl,$C43B                   ; 14:6A6E
    add  hl,de                      ; 14:6A71
    ld   a,[hl]                     ; 14:6A72
    and  a                          ; 14:6A73
    jr   z,Code146A57               ; 14:6A74
    ld   a,[$D928]                  ; 14:6A76
    call Sub1469E1                  ; 14:6A79
    call Sub14614D                  ; 14:6A7C
    call Sub14624A                  ; 14:6A7F
    call Sub146208                  ; 14:6A82
    call Sub146A09                  ; 14:6A85
    ld   hl,H_GameSubstate          ; 14:6A88
    inc  [hl]                       ; 14:6A8B
    ret                             ; 14:6A8C

Code146A8D:
    ldh  a,[<$FF8C]                 ; 14:6A8D
    bit  1,a                        ; 14:6A8F
    jr   z,Code146A98               ; 14:6A91
    call Sub14683C                  ; 14:6A93
    jr   Code146AA7                 ; 14:6A96
Code146A98:
    bit  0,a                        ; 14:6A98
    jr   z,Return146ABE             ; 14:6A9A
    call Sub146A1A                  ; 14:6A9C
    call Sub1468EB                  ; 14:6A9F
    ld   a,$07                      ; 14:6AA2
    ld   [$C432],a                  ; 14:6AA4
Code146AA7:
    ld   a,[$D92D]                  ; 14:6AA7
    ld   [$D906],a                  ; 14:6AAA
    ld   a,[$D92E]                  ; 14:6AAD
    ld   [$D905],a                  ; 14:6AB0
    ld   a,[$D92F]                  ; 14:6AB3
    ld   [$D907],a                  ; 14:6AB6
    ld   a,$00                      ; 14:6AB9
    ld   a,[$D908]                  ; 14:6ABB
Return146ABE:
    ret                             ; 14:6ABE

Sub146ABF:
    ldh  a,[<H_GameSubstate]        ; 14:6ABF
    rst  $00                        ; 14:6AC1
.dw Code146B76                      ; 14:6AC2
.dw Code146BA1                      ; 14:6AC4
.dw Code147123                      ; 14:6AC6
.dw Code14724F                      ; 14:6AC8
.dw Code147123                      ; 14:6ACA
.dw Code146BA1                      ; 14:6ACC
.dw Code147213                      ; 14:6ACE

Sub146AD0:
    ld   a,$01                      ; 14:6AD0
    ldh  [<VBK],a                   ; 14:6AD2
    ld   a,$00                      ; 14:6AD4
    ld   bc,$D240                   ; 14:6AD6
    ld   de,$9800                   ; 14:6AD9
    ld   h,$14                      ; 14:6ADC
    ld   l,$23                      ; 14:6ADE
    call DMATransfer                ; 14:6AE0
    xor  a                          ; 14:6AE3
    ldh  [<VBK],a                   ; 14:6AE4
    ld   a,$00                      ; 14:6AE6
    ld   bc,$D000                   ; 14:6AE8
    ld   de,$9800                   ; 14:6AEB
    ld   h,$14                      ; 14:6AEE
    ld   l,$23                      ; 14:6AF0
    call DMATransfer                ; 14:6AF2
    ret                             ; 14:6AF5

Data146AF6:                         ; 14:6AF6
.dw $0000,$0000,$0000,$7FFF,$0000,$0000,$0000,$001F,\
    $0000,$0000,$0000,$03E0,$0000,$0000,$0000,$7C00,\
    $639F,$3A98,$25D2,$0000,$0000,$0000,$0000,$7FFF,\
    $0000,$3A98,$25D2,$639F,$7FFF,$04D3,$22FF,$0000,\
    $0000,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7FFF,$7FFF,$7FFF,$7FFF,$639F,$629F,$10FF,$08B5,\
    $2B3F,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,\
    $7DE0,$7FFF,$02BC,$0019,$7FFF,$22FF,$04D3,$0000
Code146B76:
    ld   a,$FF                      ; 14:6B76
    ld   [$DE68],a                  ; 14:6B78
    call Sub001258                  ; 14:6B7B
    xor  a                          ; 14:6B7E
    ldh  [<IE],a                    ; 14:6B7F
    ldh  [<$FF93],a                 ; 14:6B81
    call Sub00128D                  ; 14:6B83
    ld   hl,$D000                   ; 14:6B86
    ld   bc,$0DFF                   ; 14:6B89
    call ClearBytes                 ; 14:6B8C
    ld   a,$14                      ; 14:6B8F
    rst  $10                        ; 14:6B91
.dl SubL_0756D9                     ; 14:6B92
    xor  a                          ; 14:6B95
    ld   [$C432],a                  ; 14:6B96
    ld   [$C4EC],a                  ; 14:6B99
    call Sub146C52                  ; 14:6B9C
    jr   Code146BA9                 ; 14:6B9F
Code146BA1:
    call Sub001258                  ; 14:6BA1
    xor  a                          ; 14:6BA4
    ldh  [<IE],a                    ; 14:6BA5
    ldh  [<$FF93],a                 ; 14:6BA7
Code146BA9:
    xor  a                          ; 14:6BA9
    ld   [$C418],a                  ; 14:6BAA
    ld   [$C4EC],a                  ; 14:6BAD
    call Sub144412                  ; 14:6BB0
    ld   a,$31                      ; 14:6BB3
    ld   bc,Data314000              ; 14:6BB5
    ld   de,$8000                   ; 14:6BB8
    ld   h,$14                      ; 14:6BBB
    ld   l,$7F                      ; 14:6BBD
    call DMATransfer                ; 14:6BBF
    ld   a,$31                      ; 14:6BC2
    ld   bc,Data314800              ; 14:6BC4
    ld   de,$8800                   ; 14:6BC7
    ld   h,$14                      ; 14:6BCA
    ld   l,$7F                      ; 14:6BCC
    call DMATransfer                ; 14:6BCE
    ld   a,$31                      ; 14:6BD1
    ld   bc,Data315000              ; 14:6BD3
    ld   de,$9000                   ; 14:6BD6
    ld   h,$14                      ; 14:6BD9
    ld   l,$7F                      ; 14:6BDB
    call DMATransfer                ; 14:6BDD
    ld   a,$02                      ; 14:6BE0
    ldh  [<SVBK],a                  ; 14:6BE2
    ld   hl,$9000                   ; 14:6BE4
    ld   de,$D000                   ; 14:6BE7
    ld   bc,$0800                   ; 14:6BEA
    call CopyBytes                  ; 14:6BED
    ld   hl,$8800                   ; 14:6BF0
    ld   bc,$0800                   ; 14:6BF3
    call CopyBytes                  ; 14:6BF6
    xor  a                          ; 14:6BF9
    ldh  [<SVBK],a                  ; 14:6BFA
    call Sub146EF2                  ; 14:6BFC
    call Sub146AD0                  ; 14:6BFF
    ld   hl,Data146AF6              ; 14:6C02
    ld   de,$DF80                   ; 14:6C05
    ld   bc,$0080                   ; 14:6C08
    call CopyBytes                  ; 14:6C0B
    ld   a,$01                      ; 14:6C0E
    ldh  [<$FFC0],a                 ; 14:6C10
    call Sub000E29                  ; 14:6C12
    xor  a                          ; 14:6C15
    ldh  [<$FFB8],a                 ; 14:6C16
    ldh  [<$FFB9],a                 ; 14:6C18
    ldh  [<$FFBA],a                 ; 14:6C1A
    ldh  [<$FFBB],a                 ; 14:6C1C
    ld   [$D90C],a                  ; 14:6C1E
    ld   a,$02                      ; 14:6C21
    ld   [$C0C1],a                  ; 14:6C23
    ld   a,$01                      ; 14:6C26
    ld   [$CDF3],a                  ; 14:6C28
    ld   a,$00                      ; 14:6C2B
    ld   [$D913],a                  ; 14:6C2D
    ld   a,$D0                      ; 14:6C30
    ld   [$D914],a                  ; 14:6C32
    ld   a,$02                      ; 14:6C35
    ld   [$D915],a                  ; 14:6C37
    ld   a,$09                      ; 14:6C3A
    ld   [$CDF4],a                  ; 14:6C3C
    ld   a,$09                      ; 14:6C3F
    ldh  [<IE],a                    ; 14:6C41
    ldh  [<$FF93],a                 ; 14:6C43
    ld   a,$E7                      ; 14:6C45
    ldh  [<LCDC],a                  ; 14:6C47
    ld   a,$14                      ; 14:6C49
    ld   [$D92B],a                  ; 14:6C4B
    xor  a                          ; 14:6C4E
    ld   [$D92A],a                  ; 14:6C4F

Sub146C52:
    ld   hl,H_GameSubstate          ; 14:6C52
    inc  [hl]                       ; 14:6C55
    ret                             ; 14:6C56

Data146C57:                         ; 14:6C57
.db $F4,$F4,$F4,$F4,$F4,$00,$01,$02,\
    $03,$04,$05,$06,$07,$08,$09,$F4,\
    $F4,$F4,$F4,$F4
Data146C6B:                         ; 14:6C6B
.db $F4,$F4,$F4,$F4,$F4,$10,$11,$12,\
    $13,$14,$15,$16,$17,$18,$19,$F4,\
    $F4,$F4,$F4,$F4
Data146C7F:                         ; 14:6C7F
.db $00,$00,$00,$00,$00,$05,$05,$05,\
    $05,$05,$05,$05,$05,$05,$05,$00,\
    $00,$00,$00,$00
Data146C93:                         ; 14:6C93
.db $33,$1D,$1D,$1D,$1D,$1D,$1D,$33,\
    $F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,\
    $F4,$F4,$F4,$F4
Data146CA7:                         ; 14:6CA7
.db $F5,$32,$22,$32,$45,$45,$F5,$20,\
    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$0F,$0F,$0F
Data146CBB:                         ; 14:6CBB
.db $22,$32,$45,$32,$32,$55,$24,$25,\
    $21,$1F,$1F,$1F,$1F,$1F,$1F,$1F,\
    $1F,$1F,$0E,$23
Data146CCF:                         ; 14:6CCF
.db $F5,$45,$1E,$45,$32,$22,$34,$35,\
    $20,$1F,$1F,$1F,$1F,$1F,$1F,$1F,\
    $1F,$21,$F5,$F5
Data146CE3:                         ; 14:6CE3
.db $26,$06,$06,$06,$06,$06,$06,$06,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00
Data146CF7:                         ; 14:6CF7
.db $04,$24,$04,$04,$04,$04,$04,$04,\
    $04,$04,$04,$04,$04,$04,$04,$04,\
    $04,$04,$04,$04
Data146D0B:                         ; 14:6D0B
.db $04,$44,$04,$64,$04,$04,$04,$04,\
    $24,$04,$04,$04,$04,$04,$04,$04,\
    $04,$04,$04,$04
Data146D1F:                         ; 14:6D1F
.db $04,$04,$04,$04,$64,$04,$04,$04,\
    $04,$04,$04,$04,$04,$04,$04,$04,\
    $04,$04,$04,$04

Sub146D33:
    ld   c,$14                      ; 14:6D33
Code146D35:
    ld   a,[de]                     ; 14:6D35
    ldi  [hl],a                     ; 14:6D36
    inc  de                         ; 14:6D37
    dec  c                          ; 14:6D38
    jr   nz,Code146D35              ; 14:6D39
    ret                             ; 14:6D3B

Data146D3C:                         ; 14:6D3C
.db $00,$80,$00,$40,$00,$20,$00,$10,\
    $00,$08,$00,$04,$00,$02,$00,$01,\
    $80,$00,$40,$00

Sub146D50:
    push bc                         ; 14:6D50
    push de                         ; 14:6D51
    push hl                         ; 14:6D52
    ld   de,$FF9F                   ; 14:6D53
    ld   hl,$D962                   ; 14:6D56
    ld   a,b                        ; 14:6D59
    and  a                          ; 14:6D5A
    jr   z,Code146D81               ; 14:6D5B
    xor  a                          ; 14:6D5D
    ldh  [<SVBK],a                  ; 14:6D5E
    sla  c                          ; 14:6D60
    ld   b,$00                      ; 14:6D62
    ld   hl,Data146D3C              ; 14:6D64
    add  hl,bc                      ; 14:6D67
    ld   a,[$D931]                  ; 14:6D68
    or   [hl]                       ; 14:6D6B
    ld   [$D931],a                  ; 14:6D6C
    inc  hl                         ; 14:6D6F
    ld   a,[$D932]                  ; 14:6D70
    or   [hl]                       ; 14:6D73
    ld   [$D932],a                  ; 14:6D74
    ld   a,$07                      ; 14:6D77
    ldh  [<SVBK],a                  ; 14:6D79
    ld   de,$FFA0                   ; 14:6D7B
    ld   hl,$D8B8                   ; 14:6D7E
Code146D81:
    ld   a,[de]                     ; 14:6D81
    ld   c,a                        ; 14:6D82
    push bc                         ; 14:6D83
    push hl                         ; 14:6D84
    ld   de,$000C                   ; 14:6D85
Code146D88:
    ld   a,c                        ; 14:6D88
    and  a                          ; 14:6D89
    jr   z,Code146D90               ; 14:6D8A
    add  hl,de                      ; 14:6D8C
    dec  c                          ; 14:6D8D
    jr   Code146D88                 ; 14:6D8E
Code146D90:
    ldh  a,[<$FF97]                 ; 14:6D90
    ld   e,a                        ; 14:6D92
    ldh  a,[<$FF98]                 ; 14:6D93
    ld   d,a                        ; 14:6D95
    ld   c,$0C                      ; 14:6D96
Code146D98:
    ldi  a,[hl]                     ; 14:6D98
    ld   [de],a                     ; 14:6D99
    inc  de                         ; 14:6D9A
    dec  c                          ; 14:6D9B
    jr   nz,Code146D98              ; 14:6D9C
    ld   a,e                        ; 14:6D9E
    ldh  [<$FF97],a                 ; 14:6D9F
    ld   a,d                        ; 14:6DA1
    ldh  [<$FF98],a                 ; 14:6DA2
    pop  hl                         ; 14:6DA4
    pop  bc                         ; 14:6DA5
    push bc                         ; 14:6DA6
    push hl                         ; 14:6DA7
    ld   de,$0078                   ; 14:6DA8
    add  hl,de                      ; 14:6DAB
    ld   de,$0003                   ; 14:6DAC
Code146DAF:
    ld   a,c                        ; 14:6DAF
    and  a                          ; 14:6DB0
    jr   z,Code146DB7               ; 14:6DB1
    add  hl,de                      ; 14:6DB3
    dec  c                          ; 14:6DB4
    jr   Code146DAF                 ; 14:6DB5
Code146DB7:
    ldh  a,[<$FF99]                 ; 14:6DB7
    ld   e,a                        ; 14:6DB9
    ldh  a,[<$FF9A]                 ; 14:6DBA
    ld   d,a                        ; 14:6DBC
    ldi  a,[hl]                     ; 14:6DBD
    ld   [de],a                     ; 14:6DBE
    inc  de                         ; 14:6DBF
    ldi  a,[hl]                     ; 14:6DC0
    ld   [de],a                     ; 14:6DC1
    inc  de                         ; 14:6DC2
    ldi  a,[hl]                     ; 14:6DC3
    ld   [de],a                     ; 14:6DC4
    inc  de                         ; 14:6DC5
    ld   a,e                        ; 14:6DC6
    ldh  [<$FF99],a                 ; 14:6DC7
    ld   a,d                        ; 14:6DC9
    ldh  [<$FF9A],a                 ; 14:6DCA
    pop  hl                         ; 14:6DCC
    pop  bc                         ; 14:6DCD
    push bc                         ; 14:6DCE
    push hl                         ; 14:6DCF
    ld   de,$0096                   ; 14:6DD0
    add  hl,de                      ; 14:6DD3
Code146DD4:
    ld   a,c                        ; 14:6DD4
    and  a                          ; 14:6DD5
    jr   z,Code146DDC               ; 14:6DD6
    inc  hl                         ; 14:6DD8
    dec  c                          ; 14:6DD9
    jr   Code146DD4                 ; 14:6DDA
Code146DDC:
    ldh  a,[<$FF9B]                 ; 14:6DDC
    ld   e,a                        ; 14:6DDE
    ldh  a,[<$FF9C]                 ; 14:6DDF
    ld   d,a                        ; 14:6DE1
    ldi  a,[hl]                     ; 14:6DE2
    ld   [de],a                     ; 14:6DE3
    inc  de                         ; 14:6DE4
    ld   a,e                        ; 14:6DE5
    ldh  [<$FF9B],a                 ; 14:6DE6
    ld   a,d                        ; 14:6DE8
    ldh  [<$FF9C],a                 ; 14:6DE9
    pop  hl                         ; 14:6DEB
    pop  bc                         ; 14:6DEC
    ld   de,$00A0                   ; 14:6DED
    add  hl,de                      ; 14:6DF0
Code146DF1:
    ld   a,c                        ; 14:6DF1
    and  a                          ; 14:6DF2
    jr   z,Code146DF9               ; 14:6DF3
    inc  hl                         ; 14:6DF5
    dec  c                          ; 14:6DF6
    jr   Code146DF1                 ; 14:6DF7
Code146DF9:
    ldh  a,[<$FF9D]                 ; 14:6DF9
    ld   e,a                        ; 14:6DFB
    ldh  a,[<$FF9E]                 ; 14:6DFC
    ld   d,a                        ; 14:6DFE
    ldi  a,[hl]                     ; 14:6DFF
    ld   [de],a                     ; 14:6E00
    inc  de                         ; 14:6E01
    ld   a,e                        ; 14:6E02
    ldh  [<$FF9D],a                 ; 14:6E03
    ld   a,d                        ; 14:6E05
    ldh  [<$FF9E],a                 ; 14:6E06
    pop  hl                         ; 14:6E08
    pop  de                         ; 14:6E09
    pop  bc                         ; 14:6E0A
    ret                             ; 14:6E0B

Data146E0C:                         ; 14:6E0C
.db $EC,$DA,$EF,$DE,$F4,$ED,$E1,$DE,\
    $EC,$DE,$F4,$EC,$DC,$E8,$EB,$DE,\
    $EC,$FE

Sub146E1E:
    ld   hl,$9C00                   ; 14:6E1E
    ld   a,$01                      ; 14:6E21
    ldh  [<VBK],a                   ; 14:6E23
Code146E25:
    xor  a                          ; 14:6E25
    ldi  [hl],a                     ; 14:6E26
    ld   a,l                        ; 14:6E27
    and  a                          ; 14:6E28
    jr   nz,Code146E25              ; 14:6E29
    xor  a                          ; 14:6E2B
    ldh  [<VBK],a                   ; 14:6E2C
    ld   hl,$9C00                   ; 14:6E2E
Code146E31:
    ld   a,$F4                      ; 14:6E31
    ldi  [hl],a                     ; 14:6E33
    ld   a,l                        ; 14:6E34
    and  $7F                        ; 14:6E35
    jr   nz,Code146E31              ; 14:6E37
    ld   c,$12                      ; 14:6E39
    ld   de,Data146E0C              ; 14:6E3B
    ld   hl,$9C02                   ; 14:6E3E
Code146E41:
    ld   a,[de]                     ; 14:6E41
    ldi  [hl],a                     ; 14:6E42
    inc  de                         ; 14:6E43
    dec  c                          ; 14:6E44
    jr   nz,Code146E41              ; 14:6E45
    ld   hl,$9C29                   ; 14:6E47
    ld   a,$E7                      ; 14:6E4A
    ldi  [hl],a                     ; 14:6E4C
    ld   a,$E8                      ; 14:6E4D
    ld   [hl],a                     ; 14:6E4F
    ld   hl,$9C49                   ; 14:6E50
    ld   a,$F2                      ; 14:6E53
    ldi  [hl],a                     ; 14:6E55
    ld   a,$DE                      ; 14:6E56
    ldi  [hl],a                     ; 14:6E58
    ld   a,$EC                      ; 14:6E59
    ld   [hl],a                     ; 14:6E5B
    ld   a,$74                      ; 14:6E5C
    ld   [$C178],a                  ; 14:6E5E
    ret                             ; 14:6E61

Sub146E62:
    call Sub146E1E                  ; 14:6E62
    ld   hl,$FF97                   ; 14:6E65
    ld   bc,$D800                   ; 14:6E68
    ld   [hl],c                     ; 14:6E6B
    inc  hl                         ; 14:6E6C
    ld   [hl],b                     ; 14:6E6D
    inc  hl                         ; 14:6E6E
    ld   bc,$D878                   ; 14:6E6F
    ld   [hl],c                     ; 14:6E72
    inc  hl                         ; 14:6E73
    ld   [hl],b                     ; 14:6E74
    inc  hl                         ; 14:6E75
    ld   bc,$D896                   ; 14:6E76
    ld   [hl],c                     ; 14:6E79
    inc  hl                         ; 14:6E7A
    ld   [hl],b                     ; 14:6E7B
    inc  hl                         ; 14:6E7C
    ld   bc,$D8A0                   ; 14:6E7D
    ld   [hl],c                     ; 14:6E80
    inc  hl                         ; 14:6E81
    ld   [hl],b                     ; 14:6E82
    inc  hl                         ; 14:6E83
    xor  a                          ; 14:6E84
    ld   [$D928],a                  ; 14:6E85
    dec  a                          ; 14:6E88
    ldi  [hl],a                     ; 14:6E89
    ld   [hl],a                     ; 14:6E8A
    ld   hl,$D9DC                   ; 14:6E8B
    ld   de,$D932                   ; 14:6E8E
    ld   c,$00                      ; 14:6E91
    ld   a,$07                      ; 14:6E93
    ldh  [<SVBK],a                  ; 14:6E95
Code146E97:
    ld   b,$00                      ; 14:6E97
    ld   a,[de]                     ; 14:6E99
    cp   [hl]                       ; 14:6E9A
    jr   nz,Code146EB7              ; 14:6E9B
    dec  de                         ; 14:6E9D
    dec  hl                         ; 14:6E9E
    ld   a,[de]                     ; 14:6E9F
    cp   [hl]                       ; 14:6EA0
    jr   nz,Code146EBB              ; 14:6EA1
    dec  de                         ; 14:6EA3
    dec  hl                         ; 14:6EA4
    ld   a,[de]                     ; 14:6EA5
    cp   [hl]                       ; 14:6EA6
    jr   nz,Code146EC1              ; 14:6EA7
    ldh  a,[<$FF9F]                 ; 14:6EA9
    inc  a                          ; 14:6EAB
    ldh  [<$FF9F],a                 ; 14:6EAC
    inc  de                         ; 14:6EAE
    inc  de                         ; 14:6EAF
    inc  hl                         ; 14:6EB0
    inc  hl                         ; 14:6EB1
    inc  hl                         ; 14:6EB2
    inc  hl                         ; 14:6EB3
    inc  hl                         ; 14:6EB4
    jr   Code146EDB                 ; 14:6EB5
Code146EB7:
    jr   nc,Code146ED1              ; 14:6EB7
    jr   Code146EC7                 ; 14:6EB9
Code146EBB:
    inc  de                         ; 14:6EBB
    inc  hl                         ; 14:6EBC
    jr   nc,Code146ED1              ; 14:6EBD
    jr   Code146EC7                 ; 14:6EBF
Code146EC1:
    inc  de                         ; 14:6EC1
    inc  de                         ; 14:6EC2
    inc  hl                         ; 14:6EC3
    inc  hl                         ; 14:6EC4
    jr   nc,Code146ED1              ; 14:6EC5
Code146EC7:
    ldh  a,[<$FF9F]                 ; 14:6EC7
    inc  a                          ; 14:6EC9
    ldh  [<$FF9F],a                 ; 14:6ECA
    inc  hl                         ; 14:6ECC
    inc  hl                         ; 14:6ECD
    inc  hl                         ; 14:6ECE
    jr   Code146EDB                 ; 14:6ECF
Code146ED1:
    ldh  a,[<$FFA0]                 ; 14:6ED1
    inc  a                          ; 14:6ED3
    ldh  [<$FFA0],a                 ; 14:6ED4
    inc  de                         ; 14:6ED6
    inc  de                         ; 14:6ED7
    inc  de                         ; 14:6ED8
    ld   b,$01                      ; 14:6ED9
Code146EDB:
    call Sub146D50                  ; 14:6EDB
    inc  c                          ; 14:6EDE
    ld   a,c                        ; 14:6EDF
    cp   $0A                        ; 14:6EE0
    jr   nz,Code146E97              ; 14:6EE2
    xor  a                          ; 14:6EE4
    ldh  [<SVBK],a                  ; 14:6EE5
    ret                             ; 14:6EE7

.db $C4,$C6,$70,$72,$74,$76,$78,$7A,\
    $7C,$C2

Sub146EF2:
    ld   bc,$0240                   ; 14:6EF2
    ld   hl,$D000                   ; 14:6EF5
    ld   de,$D240                   ; 14:6EF8
Code146EFB:
    ld   a,$F4                      ; 14:6EFB
    ldi  [hl],a                     ; 14:6EFD
    xor  a                          ; 14:6EFE
    ld   [de],a                     ; 14:6EFF
    inc  de                         ; 14:6F00
    dec  bc                         ; 14:6F01
    ld   a,b                        ; 14:6F02
    or   c                          ; 14:6F03
    jr   nz,Code146EFB              ; 14:6F04
    ld   de,Data146C57              ; 14:6F06
    ld   hl,$D020                   ; 14:6F09
    call Sub146D33                  ; 14:6F0C
    ld   de,Data146C6B              ; 14:6F0F
    ld   hl,$D040                   ; 14:6F12
    call Sub146D33                  ; 14:6F15
    ld   de,Data146C7F              ; 14:6F18
    ld   hl,$D260                   ; 14:6F1B
    call Sub146D33                  ; 14:6F1E
    ld   de,Data146C7F              ; 14:6F21
    ld   hl,$D280                   ; 14:6F24
    call Sub146D33                  ; 14:6F27
    ld   de,Data146C93              ; 14:6F2A
    ld   hl,$D1C0                   ; 14:6F2D
    call Sub146D33                  ; 14:6F30
    ld   de,Data146CA7              ; 14:6F33
    ld   hl,$D1E0                   ; 14:6F36
    call Sub146D33                  ; 14:6F39
    ld   de,Data146CBB              ; 14:6F3C
    ld   hl,$D200                   ; 14:6F3F
    call Sub146D33                  ; 14:6F42
    ld   de,Data146CCF              ; 14:6F45
    ld   hl,$D220                   ; 14:6F48
    call Sub146D33                  ; 14:6F4B
    ld   de,Data146CE3              ; 14:6F4E
    ld   hl,$D400                   ; 14:6F51
    call Sub146D33                  ; 14:6F54
    ld   de,Data146CF7              ; 14:6F57
    ld   hl,$D420                   ; 14:6F5A
    call Sub146D33                  ; 14:6F5D
    ld   de,Data146D0B              ; 14:6F60
    ld   hl,$D440                   ; 14:6F63
    call Sub146D33                  ; 14:6F66
    ld   de,Data146D1F              ; 14:6F69
    ld   hl,$D460                   ; 14:6F6C
    call Sub146D33                  ; 14:6F6F
    call Sub001558                  ; 14:6F72
    ld   a,$14                      ; 14:6F75
    rst  $10                        ; 14:6F77
.dl SubL_07588C                     ; 14:6F78
    xor  a                          ; 14:6F7B
    ld   [$D931],a                  ; 14:6F7C
    ld   [$D932],a                  ; 14:6F7F
    ldh  a,[<H_GameSubstate]        ; 14:6F82
    cp   $05                        ; 14:6F84
    call z,Sub146E62                ; 14:6F86

Sub146F89:
    ld   hl,$D080                   ; 14:6F89
    ld   de,$D2C0                   ; 14:6F8C
    xor  a                          ; 14:6F8F
    ldh  [<$FF9B],a                 ; 14:6F90
Code146F92:
    ldh  a,[<$FF9B]                 ; 14:6F92
    add  $E8                        ; 14:6F94
    ld   c,a                        ; 14:6F96
    ld   a,$6E                      ; 14:6F97
    adc  $00                        ; 14:6F99
    ld   b,a                        ; 14:6F9B
    ld   a,[bc]                     ; 14:6F9C
    ldi  [hl],a                     ; 14:6F9D
    inc  a                          ; 14:6F9E
    ldi  [hl],a                     ; 14:6F9F
    ldh  a,[<$FF9B]                 ; 14:6FA0
    cp   $03                        ; 14:6FA2
    ld   a,$00                      ; 14:6FA4
    jr   nc,Code146FA9              ; 14:6FA6
    inc  a                          ; 14:6FA8
Code146FA9:
    ld   [de],a                     ; 14:6FA9
    inc  de                         ; 14:6FAA
    ld   [de],a                     ; 14:6FAB
    inc  de                         ; 14:6FAC
    push hl                         ; 14:6FAD
    push de                         ; 14:6FAE
    call Sub147053                  ; 14:6FAF
    ld   de,$D922                   ; 14:6FB2
    call Sub003DFB                  ; 14:6FB5
    pop  de                         ; 14:6FB8
    pop  hl                         ; 14:6FB9
    call Sub1470D3                  ; 14:6FBA
    ld   bc,$D916                   ; 14:6FBD
    ld   a,$06                      ; 14:6FC0
    ldh  [<$FF9C],a                 ; 14:6FC2
Code146FC4:
    ld   a,[bc]                     ; 14:6FC4
    and  $03                        ; 14:6FC5
    ld   [de],a                     ; 14:6FC7
    inc  bc                         ; 14:6FC8
    inc  de                         ; 14:6FC9
    ld   a,[bc]                     ; 14:6FCA
    ldi  [hl],a                     ; 14:6FCB
    inc  bc                         ; 14:6FCC
    ldh  a,[<$FF9C]                 ; 14:6FCD
    dec  a                          ; 14:6FCF
    ldh  [<$FF9C],a                 ; 14:6FD0
    jr   nz,Code146FC4              ; 14:6FD2
    inc  hl                         ; 14:6FD4
    inc  de                         ; 14:6FD5
    ld   a,[$D925]                  ; 14:6FD6
    swap a                          ; 14:6FD9
    and  $0F                        ; 14:6FDB
    add  $D1                        ; 14:6FDD
    ldi  [hl],a                     ; 14:6FDF
    inc  de                         ; 14:6FE0
    ld   a,$F8                      ; 14:6FE1
    ldi  [hl],a                     ; 14:6FE3
    inc  de                         ; 14:6FE4
    ld   a,[$D925]                  ; 14:6FE5
    and  $0F                        ; 14:6FE8
    add  $D1                        ; 14:6FEA
    ldi  [hl],a                     ; 14:6FEC
    inc  de                         ; 14:6FED
    ld   a,[$D926]                  ; 14:6FEE
    and  a                          ; 14:6FF1
    jr   z,Code146FFB               ; 14:6FF2
    push hl                         ; 14:6FF4
    dec  hl                         ; 14:6FF5
    dec  hl                         ; 14:6FF6
    ld   a,$CD                      ; 14:6FF7
    ld   [hl],a                     ; 14:6FF9
    pop  hl                         ; 14:6FFA
Code146FFB:
    ld   bc,$000C                   ; 14:6FFB
    add  hl,bc                      ; 14:6FFE
    ld   a,e                        ; 14:6FFF
    add  c                          ; 14:7000
    ld   e,a                        ; 14:7001
    ld   a,d                        ; 14:7002
    adc  b                          ; 14:7003
    ld   d,a                        ; 14:7004
    ldh  a,[<$FF9B]                 ; 14:7005
    inc  a                          ; 14:7007
    ldh  [<$FF9B],a                 ; 14:7008
    cp   $0A                        ; 14:700A
    jp   nz,Code146F92              ; 14:700C
    ret                             ; 14:700F

Sub147010:
    ld   hl,SVBK                    ; 14:7010
Code147013:
    ld   [hl],$07                   ; 14:7013
    ld   a,[bc]                     ; 14:7015
    inc  bc                         ; 14:7016
    ld   [hl],$00                   ; 14:7017
    ld   [de],a                     ; 14:7019
    inc  de                         ; 14:701A
    ldh  a,[<$FF9C]                 ; 14:701B
    dec  a                          ; 14:701D
    ldh  [<$FF9C],a                 ; 14:701E
    jr   nz,Code147013              ; 14:7020
    ret                             ; 14:7022

Data147023:                         ; 14:7023
.db $00,$01,$02,$03,$10,$11,$12,$13,\
    $20,$21,$22,$23,$30,$31,$32,$33,\
    $40,$41,$42,$43,$50,$51,$52,$53,\
    $60,$61,$62,$63,$70,$71,$72,$73,\
    $80,$81,$82,$83,$90,$91,$92,$93,\
    $A0,$A1,$A2,$A3,$B0,$B1,$B2,$B3

Sub147053:
    ldh  a,[<$FF9B]                 ; 14:7053
    sla  a                          ; 14:7055
    sla  a                          ; 14:7057
    ld   c,a                        ; 14:7059
    sla  a                          ; 14:705A
    add  c                          ; 14:705C
    ld   c,a                        ; 14:705D
    ld   b,$00                      ; 14:705E
    ld   hl,$D800                   ; 14:7060
    add  hl,bc                      ; 14:7063
    ld   c,l                        ; 14:7064
    ld   b,h                        ; 14:7065
    ld   de,$D916                   ; 14:7066
    ld   a,$0C                      ; 14:7069
    ldh  [<$FF9C],a                 ; 14:706B
    call Sub147010                  ; 14:706D
    ldh  a,[<$FF9B]                 ; 14:7070
    ld   c,a                        ; 14:7072
    sla  a                          ; 14:7073
    add  c                          ; 14:7075
    ld   c,a                        ; 14:7076
    ld   b,$00                      ; 14:7077
    ld   hl,$D878                   ; 14:7079
    add  hl,bc                      ; 14:707C
    ld   c,l                        ; 14:707D
    ld   b,h                        ; 14:707E
    ld   de,$D922                   ; 14:707F
    ld   a,$03                      ; 14:7082
    ldh  [<$FF9C],a                 ; 14:7084
    call Sub147010                  ; 14:7086
    ldh  a,[<$FF9B]                 ; 14:7089
    ld   c,a                        ; 14:708B
    sla  a                          ; 14:708C
    add  c                          ; 14:708E
    ld   c,a                        ; 14:708F
    ld   b,$00                      ; 14:7090
    ld   hl,$D878                   ; 14:7092
    add  hl,bc                      ; 14:7095
    ld   c,l                        ; 14:7096
    ld   b,h                        ; 14:7097
    ld   de,$D925                   ; 14:7098
    ld   a,$03                      ; 14:709B
    ldh  [<$FF9C],a                 ; 14:709D
    call Sub147010                  ; 14:709F
    ldh  a,[<$FF9B]                 ; 14:70A2
    ld   c,a                        ; 14:70A4
    ld   b,$00                      ; 14:70A5
    ld   hl,$D896                   ; 14:70A7
    add  hl,bc                      ; 14:70AA
    ld   e,l                        ; 14:70AB
    ld   d,h                        ; 14:70AC
    ld   hl,SVBK                    ; 14:70AD
    ld   [hl],$07                   ; 14:70B0
    ld   a,[de]                     ; 14:70B2
    ld   [hl],$00                   ; 14:70B3
    ld   c,a                        ; 14:70B5
    ld   hl,Data147023              ; 14:70B6
    add  hl,bc                      ; 14:70B9
    ld   a,[hl]                     ; 14:70BA
    ld   [$D925],a                  ; 14:70BB
    ldh  a,[<$FF9B]                 ; 14:70BE
    ld   c,a                        ; 14:70C0
    ld   hl,$D8A0                   ; 14:70C1
    add  hl,bc                      ; 14:70C4
    ld   e,l                        ; 14:70C5
    ld   d,h                        ; 14:70C6
    ld   hl,SVBK                    ; 14:70C7
    ld   [hl],$07                   ; 14:70CA
    ld   a,[de]                     ; 14:70CC
    ld   [hl],$00                   ; 14:70CD
    ld   [$D926],a                  ; 14:70CF
    ret                             ; 14:70D2

Sub1470D3:
    ld   a,$06                      ; 14:70D3
    ldh  [<$FF9F],a                 ; 14:70D5
    ld   bc,$C34F                   ; 14:70D7
Code1470DA:
    ld   a,[bc]                     ; 14:70DA
    ldi  [hl],a                     ; 14:70DB
    xor  a                          ; 14:70DC
    ld   [de],a                     ; 14:70DD
    inc  de                         ; 14:70DE
    inc  bc                         ; 14:70DF
    ldh  a,[<$FF9F]                 ; 14:70E0
    dec  a                          ; 14:70E2
    ldh  [<$FF9F],a                 ; 14:70E3
    jr   nz,Code1470DA              ; 14:70E5
    ld   a,$D0                      ; 14:70E7
    ldi  [hl],a                     ; 14:70E9
    xor  a                          ; 14:70EA
    ld   [de],a                     ; 14:70EB
    inc  hl                         ; 14:70EC
    inc  de                         ; 14:70ED
    inc  de                         ; 14:70EE
    ret                             ; 14:70EF

Sub1470F0:
    ld   hl,$D92B                   ; 14:70F0
    dec  [hl]                       ; 14:70F3
    ld   a,[hl]                     ; 14:70F4
    and  a                          ; 14:70F5
    jr   nz,Code147103              ; 14:70F6
    ld   a,$1E                      ; 14:70F8
    ld   [hl],a                     ; 14:70FA
    ld   a,[$D92A]                  ; 14:70FB
    xor  $01                        ; 14:70FE
    ld   [$D92A],a                  ; 14:7100
Code147103:
    ld   a,[$D92A]                  ; 14:7103
    and  a                          ; 14:7106
    ret  nz                         ; 14:7107
    ld   hl,$C000                   ; 14:7108
    ld   a,$18                      ; 14:710B
    ldi  [hl],a                     ; 14:710D
    ld   b,$23                      ; 14:710E
    ld   c,$08                      ; 14:7110
    ldh  a,[<H_GameSubstate]        ; 14:7112
    cp   $02                        ; 14:7114
    jr   nz,Code14711C              ; 14:7116
    ld   b,$03                      ; 14:7118
    ld   c,$98                      ; 14:711A
Code14711C:
    ld   a,c                        ; 14:711C
    ldi  [hl],a                     ; 14:711D
    ld   a,$00                      ; 14:711E
    ldi  [hl],a                     ; 14:7120
    ld   [hl],b                     ; 14:7121
    ret                             ; 14:7122

Code147123:
    call Sub1470F0                  ; 14:7123
    ldh  a,[<$FF8C]                 ; 14:7126
    bit  1,a                        ; 14:7128
    jr   z,Code14713B               ; 14:712A
    ld   a,$18                      ; 14:712C
    ldh  [<H_GameState],a           ; 14:712E
    xor  a                          ; 14:7130
    ldh  [<H_GameSubstate],a        ; 14:7131
    ld   [$C0C1],a                  ; 14:7133
    ld   a,$63                      ; 14:7136
    ldh  [<$FFF2],a                 ; 14:7138
    ret                             ; 14:713A

Code14713B:
    ldh  a,[<H_GameSubstate]        ; 14:713B
    cp   $02                        ; 14:713D
    jr   nz,Code14716D              ; 14:713F
    ldh  a,[<$FF8C]                 ; 14:7141
    bit  0,a                        ; 14:7143
    jr   z,Code147163               ; 14:7145
    xor  a                          ; 14:7147
    ld   [$C418],a                  ; 14:7148
Code14714B:
    ld   a,$31                      ; 14:714B
    ldh  [<$FFF3],a                 ; 14:714D
    ldh  a,[<H_GameState]           ; 14:714F
    ld   [$C416],a                  ; 14:7151
    ldh  a,[<H_GameSubstate]        ; 14:7154
    ld   [$C417],a                  ; 14:7156
    ld   a,$2E                      ; 14:7159
    ldh  [<H_GameState],a           ; 14:715B
    xor  a                          ; 14:715D
    ldh  [<H_GameSubstate],a        ; 14:715E
    jp   Sub0010AD                  ; 14:7160
Code147163:
    ldh  a,[<$FF8C]                 ; 14:7163
    and  $10                        ; 14:7165
    jr   z,Return147190             ; 14:7167
    ld   a,$03                      ; 14:7169
    jr   Code147175                 ; 14:716B
Code14716D:
    ldh  a,[<$FF8C]                 ; 14:716D
    and  $20                        ; 14:716F
    jr   z,Code147183               ; 14:7171
    ld   a,$01                      ; 14:7173
Code147175:
    ldh  [<H_GameSubstate],a        ; 14:7175
    ld   a,[$C432]                  ; 14:7177
    xor  $01                        ; 14:717A
    ld   [$C432],a                  ; 14:717C
    ld   a,$47                      ; 14:717F
    ldh  [<$FFF2],a                 ; 14:7181
Code147183:
    ldh  a,[<$FF8C]                 ; 14:7183
    bit  0,a                        ; 14:7185
    jr   z,Return147190             ; 14:7187
    ld   a,$01                      ; 14:7189
    ld   [$C418],a                  ; 14:718B
    jr   Code14714B                 ; 14:718E
Return147190:
    ret                             ; 14:7190

Sub147191:
    xor  a                          ; 14:7191
    ld   c,a                        ; 14:7192
    ld   b,a                        ; 14:7193
Code147194:
    ld   hl,Data146D3C              ; 14:7194
    add  hl,bc                      ; 14:7197
    add  hl,bc                      ; 14:7198
    ld   a,[$D931]                  ; 14:7199
    and  [hl]                       ; 14:719C
    jr   nz,Code1471A6              ; 14:719D
    inc  hl                         ; 14:719F
    ld   a,[$D932]                  ; 14:71A0
    and  [hl]                       ; 14:71A3
    jr   z,Code1471BC               ; 14:71A4
Code1471A6:
    ld   d,$00                      ; 14:71A6
    ld   a,c                        ; 14:71A8
    swap a                          ; 14:71A9
    sla  a                          ; 14:71AB
    ld   e,a                        ; 14:71AD
    rl   d                          ; 14:71AE
    ld   hl,$D080                   ; 14:71B0
    add  hl,de                      ; 14:71B3
    ld   a,$F4                      ; 14:71B4
    ld   e,$20                      ; 14:71B6
Code1471B8:
    ldi  [hl],a                     ; 14:71B8
    dec  e                          ; 14:71B9
    jr   nz,Code1471B8              ; 14:71BA
Code1471BC:
    inc  c                          ; 14:71BC
    ld   a,c                        ; 14:71BD
    cp   $0A                        ; 14:71BE
    jr   nz,Code147194              ; 14:71C0
    ret                             ; 14:71C2

Sub1471C3:
    ld   hl,$D92B                   ; 14:71C3
    dec  [hl]                       ; 14:71C6
    ld   a,[hl]                     ; 14:71C7
    and  a                          ; 14:71C8
    ret  nz                         ; 14:71C9
    ld   a,$1E                      ; 14:71CA
    ld   [hl],a                     ; 14:71CC
    ld   a,[$D92A]                  ; 14:71CD
    xor  $01                        ; 14:71D0
    ld   [$D92A],a                  ; 14:71D2
    and  a                          ; 14:71D5
    jr   nz,Code1471DD              ; 14:71D6
    call Sub146F89                  ; 14:71D8
    jr   Code1471E0                 ; 14:71DB
Code1471DD:
    call Sub147191                  ; 14:71DD
Code1471E0:
    ld   a,$01                      ; 14:71E0
    ld   [$C423],a                  ; 14:71E2
    ld   a,$00                      ; 14:71E5
    ld   [$C425],a                  ; 14:71E7
    ld   a,$D0                      ; 14:71EA
    ld   [$C426],a                  ; 14:71EC
    ld   a,$40                      ; 14:71EF
    ld   [$C427],a                  ; 14:71F1
    ld   a,$D2                      ; 14:71F4
    ld   [$C428],a                  ; 14:71F6
    ret                             ; 14:71F9

Sub1471FA:
    ld   hl,$C000                   ; 14:71FA
    ld   a,[$D928]                  ; 14:71FD
    sla  a                          ; 14:7200
    sla  a                          ; 14:7202
    sla  a                          ; 14:7204
    add  $8C                        ; 14:7206
    ldi  [hl],a                     ; 14:7208
    ld   a,$40                      ; 14:7209
    ldi  [hl],a                     ; 14:720B
    ld   a,$B4                      ; 14:720C
    ldi  [hl],a                     ; 14:720E
    ld   a,$04                      ; 14:720F
    ld   [hl],a                     ; 14:7211
    ret                             ; 14:7212

Code147213:
    call Sub1471C3                  ; 14:7213
    call Sub1471FA                  ; 14:7216
    ldh  a,[<$FF8C]                 ; 14:7219
    bit  1,a                        ; 14:721B
    jr   z,Code147225               ; 14:721D
    ld   a,$63                      ; 14:721F
    ldh  [<$FFF2],a                 ; 14:7221
    jr   Code14724B                 ; 14:7223
Code147225:
    and  $C4                        ; 14:7225
    jr   z,Code147236               ; 14:7227
    ld   a,$47                      ; 14:7229
    ldh  [<$FFF2],a                 ; 14:722B
    ld   a,[$D928]                  ; 14:722D
    xor  $01                        ; 14:7230
    ld   [$D928],a                  ; 14:7232
    ret                             ; 14:7235

Code147236:
    ldh  a,[<$FF8C]                 ; 14:7236
    and  $01                        ; 14:7238
    ret  z                          ; 14:723A
    ld   a,[$D928]                  ; 14:723B
    and  a                          ; 14:723E
    jr   z,Code14724B               ; 14:723F
    ld   a,$44                      ; 14:7241
    ldh  [<$FFF2],a                 ; 14:7243
    ld   a,$14                      ; 14:7245
    rst  $10                        ; 14:7247
.dl SubL_0759EA                     ; 14:7248
Code14724B:
    xor  a                          ; 14:724B
    ldh  [<H_GameSubstate],a        ; 14:724C
    ret                             ; 14:724E

Code14724F:
    call Sub001258                  ; 14:724F
    xor  a                          ; 14:7252
    ldh  [<IE],a                    ; 14:7253
    ldh  [<$FF93],a                 ; 14:7255
    ld   a,$01                      ; 14:7257
    ld   [$C418],a                  ; 14:7259
    ld   [$C4EC],a                  ; 14:725C
    call Sub144412                  ; 14:725F
    ld   a,$31                      ; 14:7262
    ld   bc,Data314000              ; 14:7264
    ld   de,$8000                   ; 14:7267
    ld   h,$14                      ; 14:726A
    ld   l,$7F                      ; 14:726C
    call DMATransfer                ; 14:726E
    ld   a,$0E                      ; 14:7271
    ld   bc,Data0E4800              ; 14:7273
    ld   de,$8800                   ; 14:7276
    ld   h,$14                      ; 14:7279
    ld   l,$7F                      ; 14:727B
    call DMATransfer                ; 14:727D
    ld   a,$0E                      ; 14:7280
    ld   bc,Data0E5000              ; 14:7282
    ld   de,$9000                   ; 14:7285
    ld   h,$14                      ; 14:7288
    ld   l,$7F                      ; 14:728A
    call DMATransfer                ; 14:728C
    ld   a,$02                      ; 14:728F
    ldh  [<SVBK],a                  ; 14:7291
    ld   hl,$9000                   ; 14:7293
    ld   de,$D000                   ; 14:7296
    ld   bc,$0800                   ; 14:7299
    call CopyBytes                  ; 14:729C
    ld   hl,$8800                   ; 14:729F
    ld   bc,$0800                   ; 14:72A2
    call CopyBytes                  ; 14:72A5
    xor  a                          ; 14:72A8
    ldh  [<SVBK],a                  ; 14:72A9
    ld   a,$0E                      ; 14:72AB
    ld   [$C415],a                  ; 14:72AD
    ld   hl,Data0E5800              ; 14:72B0
    ld   a,$14                      ; 14:72B3
    call Sub001570                  ; 14:72B5
    ld   hl,$D014                   ; 14:72B8
    ld   b,$12                      ; 14:72BB
    ld   a,$F4                      ; 14:72BD
Code1472BF:
    ld   c,$0C                      ; 14:72BF
Code1472C1:
    ldi  [hl],a                     ; 14:72C1
    dec  c                          ; 14:72C2
    jr   nz,Code1472C1              ; 14:72C3
    ld   de,$0014                   ; 14:72C5
    add  hl,de                      ; 14:72C8
    dec  b                          ; 14:72C9
    jr   nz,Code1472BF              ; 14:72CA
    call Sub147358                  ; 14:72CC
    call Sub146AD0                  ; 14:72CF
    ld   a,$0E                      ; 14:72D2
    ld   [$C415],a                  ; 14:72D4
    ld   hl,Data0E5AD0              ; 14:72D7
    ld   de,$DF80                   ; 14:72DA
    ld   bc,$0038                   ; 14:72DD
    ld   a,$14                      ; 14:72E0
    call CopyBytesLong              ; 14:72E2
    ld   a,$01                      ; 14:72E5
    ldh  [<$FFC0],a                 ; 14:72E7
    call Sub000E29                  ; 14:72E9
    xor  a                          ; 14:72EC
    ldh  [<$FFB9],a                 ; 14:72ED
    ldh  [<$FFBB],a                 ; 14:72EF
    ld   a,$01                      ; 14:72F1
    ld   [$C177],a                  ; 14:72F3
    ld   a,$FC                      ; 14:72F6
    ldh  [<$FFB8],a                 ; 14:72F8
    ld   a,$FE                      ; 14:72FA
    ldh  [<$FFBA],a                 ; 14:72FC
    call Sub14741A                  ; 14:72FE
    ld   a,$09                      ; 14:7301
    ldh  [<IE],a                    ; 14:7303
    ldh  [<$FF93],a                 ; 14:7305
    ldh  a,[<LCDC]                  ; 14:7307
    or   $A0                        ; 14:7309
    ldh  [<LCDC],a                  ; 14:730B
    jp   Sub146C52                  ; 14:730D

Data147310:                         ; 14:7310
.db $02,$00,$06,$00,$0A,$00,$0E,$00,\
    $42,$00,$46,$00,$4A,$00,$4E,$00,\
    $82,$00,$86,$00,$8A,$00,$8E,$00,\
    $C2,$00,$C6,$00,$CA,$00,$CE,$00,\
    $02,$01,$06,$01,$0A,$01,$0E,$01,\
    $42,$01,$46,$01,$4A,$01,$4E,$01,\
    $82,$01,$86,$01,$8A,$01,$8E,$01,\
    $C2,$01,$C6,$01,$CA,$01,$CE,$01,\
    $01,$02,$04,$08,$10,$20,$40,$80

Sub147358:
    xor  a                          ; 14:7358
    ld   [W_LevelID],a              ; 14:7359
Code14735C:
    ld   a,$14                      ; 14:735C
    rst  $10                        ; 14:735E
.dl SubL_075B10                     ; 14:735F
    ld   a,[W_LevelID]              ; 14:7362
    and  $03                        ; 14:7365
    ld   c,a                        ; 14:7367
    ld   b,$00                      ; 14:7368
    ld   hl,$C18E                   ; 14:736A
    add  hl,bc                      ; 14:736D
    ld   a,[W_LevelID]              ; 14:736E
    srl  a                          ; 14:7371
    srl  a                          ; 14:7373
    add  $50                        ; 14:7375
    ld   e,a                        ; 14:7377
    ld   a,$73                      ; 14:7378
    adc  $00                        ; 14:737A
    ld   d,a                        ; 14:737C
    ld   a,[de]                     ; 14:737D
    and  [hl]                       ; 14:737E
    jr   z,Code1473FF               ; 14:737F
    ld   a,[W_LevelID]              ; 14:7381
    sla  a                          ; 14:7384
    ld   c,a                        ; 14:7386
    ld   b,$00                      ; 14:7387
    ld   hl,Data147310              ; 14:7389
    add  hl,bc                      ; 14:738C
    ldi  a,[hl]                     ; 14:738D
    add  $40                        ; 14:738E
    ld   e,a                        ; 14:7390
    ldd  a,[hl]                     ; 14:7391
    adc  $D2                        ; 14:7392
    ld   d,a                        ; 14:7394
    ldi  a,[hl]                     ; 14:7395
    add  $00                        ; 14:7396
    ld   c,a                        ; 14:7398
    ld   a,[hl]                     ; 14:7399
    adc  $D0                        ; 14:739A
    ld   b,a                        ; 14:739C
    ld   hl,$0020                   ; 14:739D
    add  hl,bc                      ; 14:73A0
    ld   a,[bc]                     ; 14:73A1
    sub  $10                        ; 14:73A2
    ld   [bc],a                     ; 14:73A4
    inc  bc                         ; 14:73A5
    ld   a,[bc]                     ; 14:73A6
    sub  $10                        ; 14:73A7
    ld   [bc],a                     ; 14:73A9
    inc  bc                         ; 14:73AA
    ld   a,[bc]                     ; 14:73AB
    sub  $10                        ; 14:73AC
    ld   [bc],a                     ; 14:73AE
    ld   a,$04                      ; 14:73AF
    ld   [de],a                     ; 14:73B1
    inc  de                         ; 14:73B2
    ld   [de],a                     ; 14:73B3
    inc  de                         ; 14:73B4
    ld   [de],a                     ; 14:73B5
    ld   a,e                        ; 14:73B6
    add  $1E                        ; 14:73B7
    ld   e,a                        ; 14:73B9
    ld   a,d                        ; 14:73BA
    adc  $00                        ; 14:73BB
    ld   d,a                        ; 14:73BD
    ld   a,[$C189]                  ; 14:73BE
    cp   $05                        ; 14:73C1
    jr   nc,Code1473CE              ; 14:73C3
    ld   a,$71                      ; 14:73C5
    ldi  [hl],a                     ; 14:73C7
    ld   a,$04                      ; 14:73C8
    ld   [de],a                     ; 14:73CA
    inc  de                         ; 14:73CB
    jr   Code1473D5                 ; 14:73CC
Code1473CE:
    ld   a,$72                      ; 14:73CE
    ldi  [hl],a                     ; 14:73D0
    ld   a,$06                      ; 14:73D1
    ld   [de],a                     ; 14:73D3
    inc  de                         ; 14:73D4
Code1473D5:
    ld   a,[$C18D]                  ; 14:73D5
    and  a                          ; 14:73D8
    jr   nz,Code1473E4              ; 14:73D9
    ld   a,$71                      ; 14:73DB
    ldi  [hl],a                     ; 14:73DD
    ld   a,$04                      ; 14:73DE
    ld   [de],a                     ; 14:73E0
    inc  de                         ; 14:73E1
    jr   Code1473EB                 ; 14:73E2
Code1473E4:
    ld   a,$62                      ; 14:73E4
    ldi  [hl],a                     ; 14:73E6
    ld   a,$05                      ; 14:73E7
    ld   [de],a                     ; 14:73E9
    inc  de                         ; 14:73EA
Code1473EB:
    ld   a,[$C194]                  ; 14:73EB
    and  a                          ; 14:73EE
    jr   nz,Code1473F9              ; 14:73EF
    ld   a,$71                      ; 14:73F1
    ld   [hl],a                     ; 14:73F3
    ld   a,$04                      ; 14:73F4
    ld   [de],a                     ; 14:73F6
    jr   Code1473FF                 ; 14:73F7
Code1473F9:
    ld   a,$61                      ; 14:73F9
    ldi  [hl],a                     ; 14:73FB
    ld   a,$04                      ; 14:73FC
    ld   [de],a                     ; 14:73FE
Code1473FF:
    ld   a,[W_LevelID]              ; 14:73FF
    inc  a                          ; 14:7402
    and  $1F                        ; 14:7403
    ld   [W_LevelID],a              ; 14:7405
    jp   nz,Code14735C              ; 14:7408
    ld   hl,$D20F                   ; 14:740B
    ld   a,$D0                      ; 14:740E
    ldi  [hl],a                     ; 14:7410
    ldi  [hl],a                     ; 14:7411
    ld   [hl],a                     ; 14:7412
    ld   a,$14                      ; 14:7413
    rst  $10                        ; 14:7415
.dl SubL_075B10                     ; 14:7416
    ret                             ; 14:7419

Sub14741A:
    call Sub147457                  ; 14:741A
    ld   de,$C1A1                   ; 14:741D
    call Sub003DFB                  ; 14:7420
    ld   hl,$D20C                   ; 14:7423
    ld   de,$C34F                   ; 14:7426
    ld   b,$06                      ; 14:7429
Code14742B:
    ld   a,[de]                     ; 14:742B
    ldi  [hl],a                     ; 14:742C
    inc  de                         ; 14:742D
    dec  b                          ; 14:742E
    jr   nz,Code14742B              ; 14:742F
    ld   hl,$C425                   ; 14:7431
    ld   a,$00                      ; 14:7434
    ldi  [hl],a                     ; 14:7436
    ld   a,$D0                      ; 14:7437
    ldi  [hl],a                     ; 14:7439
    ld   bc,$D240                   ; 14:743A
    ld   a,c                        ; 14:743D
    ldi  [hl],a                     ; 14:743E
    ld   a,b                        ; 14:743F
    ldi  [hl],a                     ; 14:7440
    ld   a,$01                      ; 14:7441
    ld   [$C423],a                  ; 14:7443
    ret                             ; 14:7446

Data147447:                         ; 14:7447
.db $8B,$3F,$82,$26
Data14744B:                         ; 14:744B
.db $FF,$07,$1F,$06
Data14744F:                         ; 14:744F
.db $1F,$62,$5F,$18
Data147453:                         ; 14:7453
.db $0F,$7F,$2D,$7D

Sub147457:
    ld   hl,$C1A1                   ; 14:7457
    ldi  a,[hl]                     ; 14:745A
    cp   [hl]                       ; 14:745B
    ret  z                          ; 14:745C
    ld   hl,$C1A1                   ; 14:745D
    xor  a                          ; 14:7460
    ldi  a,[hl]                     ; 14:7461
    ld   e,a                        ; 14:7462
    ldi  a,[hl]                     ; 14:7463
    ld   d,a                        ; 14:7464
    ld   a,[hl]                     ; 14:7465
    ld   l,a                        ; 14:7466
    xor  a                          ; 14:7467
    ld   c,a                        ; 14:7468
    ld   b,a                        ; 14:7469
Code14746A:
    inc  bc                         ; 14:746A
    ld   a,c                        ; 14:746B
    cp   $09                        ; 14:746C
    jr   nc,Code147479              ; 14:746E
    ld   a,e                        ; 14:7470
    sub  $84                        ; 14:7471
    ld   e,a                        ; 14:7473
    ld   a,d                        ; 14:7474
    sbc  $03                        ; 14:7475
    jr   Code147480                 ; 14:7477
Code147479:
    ld   a,e                        ; 14:7479
    sub  $52                        ; 14:747A
    ld   e,a                        ; 14:747C
    ld   a,d                        ; 14:747D
    sbc  $03                        ; 14:747E
Code147480:
    ld   d,a                        ; 14:7480
    jr   nc,Code14746A              ; 14:7481
    ld   a,l                        ; 14:7483
    and  a                          ; 14:7484
    jr   z,Code14748A               ; 14:7485
    dec  l                          ; 14:7487
    jr   Code14746A                 ; 14:7488
Code14748A:
    push bc                         ; 14:748A
    ld   hl,$D221                   ; 14:748B
    srl  c                          ; 14:748E
    srl  c                          ; 14:7490
    srl  c                          ; 14:7492
    ld   a,c                        ; 14:7494
    and  a                          ; 14:7495
    jr   z,Code14749E               ; 14:7496
    ld   a,$AB                      ; 14:7498
Code14749A:
    ldi  [hl],a                     ; 14:749A
    dec  c                          ; 14:749B
    jr   nz,Code14749A              ; 14:749C
Code14749E:
    pop  bc                         ; 14:749E
    ld   e,c                        ; 14:749F
    ld   a,c                        ; 14:74A0
    and  $07                        ; 14:74A1
    add  $A3                        ; 14:74A3
    ld   [hl],a                     ; 14:74A5
    ld   hl,Data147447              ; 14:74A6
    ld   a,e                        ; 14:74A9
    cp   $2D                        ; 14:74AA
    jr   c,Code1474BF               ; 14:74AC
    ld   hl,Data14744B              ; 14:74AE
    cp   $5A                        ; 14:74B1
    jr   c,Code1474BF               ; 14:74B3
    ld   hl,Data14744F              ; 14:74B5
    cp   $87                        ; 14:74B8
    jr   c,Code1474BF               ; 14:74BA
    ld   hl,Data147453              ; 14:74BC
Code1474BF:
    ld   c,$04                      ; 14:74BF
    ld   de,$DF8A                   ; 14:74C1
Code1474C4:
    ldi  a,[hl]                     ; 14:74C4
    ld   [de],a                     ; 14:74C5
    inc  de                         ; 14:74C6
    dec  c                          ; 14:74C7
    jr   nz,Code1474C4              ; 14:74C8
    ld   hl,$C1A3                   ; 14:74CA
    ld   a,$01                      ; 14:74CD
    cp   [hl]                       ; 14:74CF
    jr   z,Code1474D6               ; 14:74D0
    jr   c,Code1474E8               ; 14:74D2
    jr   Code1474F5                 ; 14:74D4
Code1474D6:
    dec  hl                         ; 14:74D6
    ld   a,$C5                      ; 14:74D7
    cp   [hl]                       ; 14:74D9
    jr   z,Code1474E0               ; 14:74DA
    jr   c,Code1474E8               ; 14:74DC
    jr   Code1474F5                 ; 14:74DE
Code1474E0:
    dec  hl                         ; 14:74E0
    ld   a,$20                      ; 14:74E1
    cp   [hl]                       ; 14:74E3
    jr   z,Code1474E8               ; 14:74E4
    jr   nc,Code1474F5              ; 14:74E6
Code1474E8:
    ld   hl,$D232                   ; 14:74E8
    ld   a,$AF                      ; 14:74EB
    ld   [hl],a                     ; 14:74ED
    ld   de,$0240                   ; 14:74EE
    add  hl,de                      ; 14:74F1
    ld   a,$06                      ; 14:74F2
    ld   [hl],a                     ; 14:74F4
Code1474F5:
    ld   a,$01                      ; 14:74F5
    ldh  [<$FFC0],a                 ; 14:74F7
    ret                             ; 14:74F9
