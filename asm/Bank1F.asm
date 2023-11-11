.bank $1F slot 1
.orga $4000

Sub1F4000:
    jp   Code1F4009                 ; 1F:4000
    jp   Sub1F68FB                  ; 1F:4003
Sub1F4006:
    jp   Code1F4060                 ; 1F:4006
Code1F4009:
    ld   hl,$DE00                   ; 1F:4009
Code1F400C:
    ld   [hl],$00                   ; 1F:400C
    inc  l                          ; 1F:400E
    jr   nz,Code1F400C              ; 1F:400F
    ld   a,$80                      ; 1F:4011
    ldh  [<NR52],a                  ; 1F:4013
    xor  a                          ; 1F:4015
    ldh  [<NR51],a                  ; 1F:4016
    ld   a,$77                      ; 1F:4018
    ldh  [<NR50],a                  ; 1F:401A
    ld   hl,Data1F4033              ; 1F:401C
Code1F401F:
    ldi  a,[hl]                     ; 1F:401F
    and  a                          ; 1F:4020
    jr   z,Code1F402E               ; 1F:4021
    ld   b,a                        ; 1F:4023
    ldi  a,[hl]                     ; 1F:4024
    ld   c,a                        ; 1F:4025
Code1F4026:
    ldi  a,[hl]                     ; 1F:4026
    ldh  [c],a                      ; 1F:4027
    inc  c                          ; 1F:4028
    dec  b                          ; 1F:4029
    jr   nz,Code1F4026              ; 1F:402A
    jr   Code1F401F                 ; 1F:402C
Code1F402E:
    ld   a,$FF                      ; 1F:402E
    ldh  [<NR51],a                  ; 1F:4030
    ret                             ; 1F:4032

Data1F4033:                         ; 1F:4033
.db $10,$30,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$05,$10,$08,$C0,$00,$00,\
    $80,$04,$16,$C0,$00,$00,$80,$05,\
    $1A,$00,$00,$00,$00,$00,$04,$20,\
    $00,$00,$00,$80,$00
Code1F4060:
    call Sub1F43A2                  ; 1F:4060
    call Sub1F448C                  ; 1F:4063
    call Sub1F4737                  ; 1F:4066
    xor  a                          ; 1F:4069
    ld   [$DE60],a                  ; 1F:406A
    ld   [$DE68],a                  ; 1F:406D
    ld   [$DE70],a                  ; 1F:4070
    ld   [$DE78],a                  ; 1F:4073
    ret                             ; 1F:4076

.db $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$0F,$2C,$00,$9C,$00,$06,\
    $01,$6B,$01,$C9,$01,$23,$02,$77,\
    $02,$C6,$02,$12,$03,$56,$03,$9B,\
    $03,$DA,$03,$16,$04,$4E,$04,$83,\
    $04,$B5,$04,$E5,$04,$11,$05,$3B,\
    $05,$63,$05,$89,$05,$AC,$05,$CE,\
    $05,$ED,$05
Data1F4132:                         ; 1F:4132
.db $0A,$06,$27,$06,$42,$06,$5B,$06,\
    $72,$06,$89,$06,$9E,$06,$B2,$06,\
    $C4,$06,$D6,$06,$E7,$06,$F7,$06,\
    $06,$07,$14,$07,$21,$07,$2D,$07,\
    $39,$07,$44,$07,$4F,$07,$59,$07,\
    $62,$07,$6B,$07,$74,$07,$7B,$07,\
    $83,$07,$8A,$07,$90,$07,$97,$07,\
    $9D,$07,$A2,$07,$A7,$07,$AC,$07,\
    $B1,$07,$B6,$07,$BA,$07,$BE,$07,\
    $C1,$07,$C5,$07,$C8,$07,$CB,$07,\
    $CE,$07,$D1,$07,$D4,$07,$D6,$07,\
    $D9,$07,$DB,$07,$DD,$07,$DF,$07
Code1F4192:
    ld   b,$05                      ; 1F:4192
    ld   c,$10                      ; 1F:4194
    ld   de,$DE90                   ; 1F:4196
    jr   Code1F41B6                 ; 1F:4199
Code1F419B:
    ld   b,$04                      ; 1F:419B
    ld   c,$16                      ; 1F:419D
    ld   de,$DE92                   ; 1F:419F
    jr   Code1F41B6                 ; 1F:41A2
Unused1F41A4:
    ld   b,$05                      ; 1F:41A4
    ld   c,$1A                      ; 1F:41A6
    ld   de,$DE93                   ; 1F:41A8
    jr   Code1F41B6                 ; 1F:41AB
Unused1F41AD:
    ld   b,$04                      ; 1F:41AD
    ld   c,$20                      ; 1F:41AF
    ld   de,$DE93                   ; 1F:41B1
    jr   Code1F41B6                 ; 1F:41B4
Code1F41B6:
    ldi  a,[hl]                     ; 1F:41B6
    and  a                          ; 1F:41B7
    jr   z,Code1F41BB               ; 1F:41B8
    ldh  [c],a                      ; 1F:41BA
Code1F41BB:
    inc  c                          ; 1F:41BB
    dec  b                          ; 1F:41BC
    jr   nz,Code1F41B6              ; 1F:41BD
    ld   a,[hl]                     ; 1F:41BF
    ld   [de],a                     ; 1F:41C0
    ret                             ; 1F:41C1

CodePtrs1F41C2:
.dw Code1F4939                      ; 1F:41C2
.dw Code1F4939                      ; 1F:41C4
.dw Code1F4939                      ; 1F:41C6
.dw Code1F4939                      ; 1F:41C8
.dw Code1F4939                      ; 1F:41CA
.dw Code1F4939                      ; 1F:41CC
.dw Code1F4939                      ; 1F:41CE
.dw Code1F4939                      ; 1F:41D0
.dw Code1F4939                      ; 1F:41D2
.dw Code1F4939                      ; 1F:41D4
.dw Code1F4939                      ; 1F:41D6
.dw Code1F4939                      ; 1F:41D8
.dw Code1F4939                      ; 1F:41DA
.dw Code1F4939                      ; 1F:41DC
.dw Code1F4939                      ; 1F:41DE
.dw Code1F4939                      ; 1F:41E0
.dw Code1F4939                      ; 1F:41E2
.dw Code1F4939                      ; 1F:41E4
.dw Code1F4939                      ; 1F:41E6
.dw Code1F4939                      ; 1F:41E8
.dw Code1F4939                      ; 1F:41EA
.dw Code1F4939                      ; 1F:41EC
.dw Code1F4939                      ; 1F:41EE
.dw Code1F4939                      ; 1F:41F0
.dw Code1F4939                      ; 1F:41F2
.dw Code1F4939                      ; 1F:41F4
.dw Code1F4939                      ; 1F:41F6
.dw Code1F4939                      ; 1F:41F8
.dw Code1F4939                      ; 1F:41FA
.dw Code1F4939                      ; 1F:41FC
.dw Code1F4939                      ; 1F:41FE
.dw Code1F4939                      ; 1F:4200
.dw Code1F4939                      ; 1F:4202
.dw Code1F4939                      ; 1F:4204
.dw Code1F4939                      ; 1F:4206
.dw Code1F4939                      ; 1F:4208
.dw Code1F4939                      ; 1F:420A
.dw Code1F4939                      ; 1F:420C
.dw Code1F4939                      ; 1F:420E
.dw Code1F4939                      ; 1F:4210
.dw Code1F4939                      ; 1F:4212
.dw Code1F4939                      ; 1F:4214
.dw Code1F4939                      ; 1F:4216
.dw Code1F4939                      ; 1F:4218
.dw Code1F4939                      ; 1F:421A
.dw Code1F4939                      ; 1F:421C
.dw Code1F4939                      ; 1F:421E
.dw Code1F4939                      ; 1F:4220
.dw Code1F4939                      ; 1F:4222
.dw Code1F4939                      ; 1F:4224
.dw Code1F4939                      ; 1F:4226
.dw Code1F4939                      ; 1F:4228
.dw Code1F4939                      ; 1F:422A
.dw Code1F4939                      ; 1F:422C
.dw Code1F4939                      ; 1F:422E
.dw Code1F4939                      ; 1F:4230
.dw Code1F4939                      ; 1F:4232
.dw Code1F4939                      ; 1F:4234
.dw Code1F4939                      ; 1F:4236
.dw Code1F4939                      ; 1F:4238
.dw Code1F4939                      ; 1F:423A
.dw Code1F4939                      ; 1F:423C
.dw Code1F4939                      ; 1F:423E
.dw Code1F4939                      ; 1F:4240
.dw Code1F4939                      ; 1F:4242
.dw Code1F4939                      ; 1F:4244
.dw Code1F495D                      ; 1F:4246
.dw Code1F4991                      ; 1F:4248
.dw Code1F49C2                      ; 1F:424A
.dw Code1F49E6                      ; 1F:424C
.dw Code1F49FC                      ; 1F:424E
.dw Code1F4A0F                      ; 1F:4250
.dw Code1F4A48                      ; 1F:4252
.dw Code1F4A84                      ; 1F:4254
.dw Code1F4A97                      ; 1F:4256
.dw Code1F4AE0                      ; 1F:4258
.dw Code1F4B04                      ; 1F:425A
.dw Code1F4B22                      ; 1F:425C
.dw Code1F5B18                      ; 1F:425E
.dw Code1F5B2B                      ; 1F:4260
.dw Code1F5B94                      ; 1F:4262
.dw Code1F5C0D                      ; 1F:4264
.dw Code1F5C26                      ; 1F:4266
.dw Code1F5C8F                      ; 1F:4268
.dw Code1F5CFB                      ; 1F:426A
.dw Code1F5D64                      ; 1F:426C
.dw Code1F5E65                      ; 1F:426E
.dw Code1F5E89                      ; 1F:4270
.dw Code1F5F23                      ; 1F:4272
.dw Code1F5FA4                      ; 1F:4274
.dw Code1F5FB7                      ; 1F:4276
.dw Code1F5FE4                      ; 1F:4278
.dw Code1F5FF0                      ; 1F:427A
.dw Code1F6053                      ; 1F:427C
.dw Code1F4908                      ; 1F:427E
.dw Code1F4B2E                      ; 1F:4280
.dw Code1F4B87                      ; 1F:4282
.dw Code1F4CC8                      ; 1F:4284
.dw Code1F4D5E                      ; 1F:4286
.dw Code1F4D8F                      ; 1F:4288
.dw Code1F4DB3                      ; 1F:428A
.dw Code1F4DD7                      ; 1F:428C
.dw Code1F4E78                      ; 1F:428E
.dw Code1F4EE1                      ; 1F:4290
.dw Code1F4F42                      ; 1F:4292
.dw Code1F4F8B                      ; 1F:4294
.dw Code1F4FEC                      ; 1F:4296
.dw Code1F5035                      ; 1F:4298
.dw Code1F5076                      ; 1F:429A
.dw Code1F50A0                      ; 1F:429C
.dw Code1F516D                      ; 1F:429E
.dw Code1F520D                      ; 1F:42A0
.dw Code1F524F                      ; 1F:42A2
.dw Code1F530B                      ; 1F:42A4
.dw Code1F5344                      ; 1F:42A6
.dw Code1F53C7                      ; 1F:42A8
.dw Code1F5408                      ; 1F:42AA
.dw Code1F5449                      ; 1F:42AC
.dw Code1F5636                      ; 1F:42AE
.dw Code1F567F                      ; 1F:42B0
CodePtrs1F42B2:
.dw Code1F493F                      ; 1F:42B2
.dw Code1F493F                      ; 1F:42B4
.dw Code1F493F                      ; 1F:42B6
.dw Code1F493F                      ; 1F:42B8
.dw Code1F493F                      ; 1F:42BA
.dw Code1F493F                      ; 1F:42BC
.dw Code1F493F                      ; 1F:42BE
.dw Code1F493F                      ; 1F:42C0
.dw Code1F493F                      ; 1F:42C2
.dw Code1F493F                      ; 1F:42C4
.dw Code1F493F                      ; 1F:42C6
.dw Code1F493F                      ; 1F:42C8
.dw Code1F493F                      ; 1F:42CA
.dw Code1F493F                      ; 1F:42CC
.dw Code1F493F                      ; 1F:42CE
.dw Code1F493F                      ; 1F:42D0
.dw Code1F493F                      ; 1F:42D2
.dw Code1F493F                      ; 1F:42D4
.dw Code1F493F                      ; 1F:42D6
.dw Code1F493F                      ; 1F:42D8
.dw Code1F493F                      ; 1F:42DA
.dw Code1F493F                      ; 1F:42DC
.dw Code1F493F                      ; 1F:42DE
.dw Code1F493F                      ; 1F:42E0
.dw Code1F493F                      ; 1F:42E2
.dw Code1F493F                      ; 1F:42E4
.dw Code1F493F                      ; 1F:42E6
.dw Code1F493F                      ; 1F:42E8
.dw Code1F493F                      ; 1F:42EA
.dw Code1F493F                      ; 1F:42EC
.dw Code1F493F                      ; 1F:42EE
.dw Code1F493F                      ; 1F:42F0
.dw Code1F493F                      ; 1F:42F2
.dw Code1F493F                      ; 1F:42F4
.dw Code1F493F                      ; 1F:42F6
.dw Code1F493F                      ; 1F:42F8
.dw Code1F493F                      ; 1F:42FA
.dw Code1F493F                      ; 1F:42FC
.dw Code1F493F                      ; 1F:42FE
.dw Code1F493F                      ; 1F:4300
.dw Code1F493F                      ; 1F:4302
.dw Code1F493F                      ; 1F:4304
.dw Code1F493F                      ; 1F:4306
.dw Code1F493F                      ; 1F:4308
.dw Code1F493F                      ; 1F:430A
.dw Code1F493F                      ; 1F:430C
.dw Code1F493F                      ; 1F:430E
.dw Code1F493F                      ; 1F:4310
.dw Code1F493F                      ; 1F:4312
.dw Code1F493F                      ; 1F:4314
.dw Code1F493F                      ; 1F:4316
.dw Code1F493F                      ; 1F:4318
.dw Code1F493F                      ; 1F:431A
.dw Code1F493F                      ; 1F:431C
.dw Code1F493F                      ; 1F:431E
.dw Code1F493F                      ; 1F:4320
.dw Code1F493F                      ; 1F:4322
.dw Code1F493F                      ; 1F:4324
.dw Code1F493F                      ; 1F:4326
.dw Code1F493F                      ; 1F:4328
.dw Code1F493F                      ; 1F:432A
.dw Code1F493F                      ; 1F:432C
.dw Code1F493F                      ; 1F:432E
.dw Code1F493F                      ; 1F:4330
.dw Code1F493F                      ; 1F:4332
.dw Code1F493F                      ; 1F:4334
.dw Code1F4963                      ; 1F:4336
.dw Code1F4997                      ; 1F:4338
.dw Code1F49C8                      ; 1F:433A
.dw Code1F49EF                      ; 1F:433C
.dw Code1F4A02                      ; 1F:433E
.dw Code1F4A15                      ; 1F:4340
.dw Code1F4A51                      ; 1F:4342
.dw Code1F4A8A                      ; 1F:4344
.dw Code1F4AA0                      ; 1F:4346
.dw Code1F4AE6                      ; 1F:4348
.dw Code1F4B1F                      ; 1F:434A
.dw Code1F4B2B                      ; 1F:434C
.dw Code1F5B1E                      ; 1F:434E
.dw Code1F5B31                      ; 1F:4350
.dw Code1F5B9A                      ; 1F:4352
.dw Code1F5C13                      ; 1F:4354
.dw Code1F5C2C                      ; 1F:4356
.dw Code1F5C95                      ; 1F:4358
.dw Code1F5D01                      ; 1F:435A
.dw Code1F5D6A                      ; 1F:435C
.dw Code1F5E6B                      ; 1F:435E
.dw Code1F5E8F                      ; 1F:4360
.dw Code1F5F29                      ; 1F:4362
.dw Code1F5FAA                      ; 1F:4364
.dw Code1F5FCF                      ; 1F:4366
.dw Code1F5FED                      ; 1F:4368
.dw Code1F5FF6                      ; 1F:436A
.dw Code1F6059                      ; 1F:436C
.dw Code1F490E                      ; 1F:436E
.dw Code1F4B34                      ; 1F:4370
.dw Code1F4BCC                      ; 1F:4372
.dw Code1F4CD3                      ; 1F:4374
.dw Code1F4D64                      ; 1F:4376
.dw Code1F4D95                      ; 1F:4378
.dw Code1F4DB9                      ; 1F:437A
.dw Code1F4DE2                      ; 1F:437C
.dw Code1F4E7E                      ; 1F:437E
.dw Code1F4EE7                      ; 1F:4380
.dw Code1F4F48                      ; 1F:4382
.dw Code1F4F91                      ; 1F:4384
.dw Code1F4FF2                      ; 1F:4386
.dw Code1F503B                      ; 1F:4388
.dw Code1F5082                      ; 1F:438A
.dw Code1F50AB                      ; 1F:438C
.dw Code1F5178                      ; 1F:438E
.dw Code1F5218                      ; 1F:4390
.dw Code1F5258                      ; 1F:4392
.dw Code1F5311                      ; 1F:4394
.dw Code1F534A                      ; 1F:4396
.dw Code1F53CD                      ; 1F:4398
.dw Code1F540E                      ; 1F:439A
.dw Code1F5457                      ; 1F:439C
.dw Code1F5647                      ; 1F:439E
.dw Code1F5685                      ; 1F:43A0

Sub1F43A2:
    ld   hl,$DE60                   ; 1F:43A2
    ld   a,[hl]                     ; 1F:43A5
    and  a                          ; 1F:43A6
    jr   z,Code1F43F9               ; 1F:43A7
    cp   $80                        ; 1F:43A9
    jp   nc,Code1F67F1              ; 1F:43AB
    cp   $42                        ; 1F:43AE
    jp   c,Code1F4485               ; 1F:43B0
    cp   $79                        ; 1F:43B3
    jp   nc,Code1F4485              ; 1F:43B5
    ld   a,[$DEC6]                  ; 1F:43B8
    and  a                          ; 1F:43BB
    jr   z,Code1F43F3               ; 1F:43BC
    cp   $01                        ; 1F:43BE
    jr   z,Code1F43DB               ; 1F:43C0
    ld   a,[hl]                     ; 1F:43C2
    cp   $4D                        ; 1F:43C3
    jr   z,Code1F43F3               ; 1F:43C5
    cp   $4E                        ; 1F:43C7
    jr   z,Code1F43F3               ; 1F:43C9
    cp   $56                        ; 1F:43CB
    jr   z,Code1F43F3               ; 1F:43CD
    cp   $5B                        ; 1F:43CF
    jp   c,Code1F4485               ; 1F:43D1
    cp   $5F                        ; 1F:43D4
    jp   nc,Code1F4485              ; 1F:43D6
    jr   Code1F43F3                 ; 1F:43D9
Code1F43DB:
    ld   a,[hl]                     ; 1F:43DB
    cp   $4D                        ; 1F:43DC
    jr   z,Code1F43F3               ; 1F:43DE
    cp   $4E                        ; 1F:43E0
    jr   z,Code1F43F3               ; 1F:43E2
    cp   $53                        ; 1F:43E4
    jp   c,Code1F4485               ; 1F:43E6
    cp   $5F                        ; 1F:43E9
    jp   nc,Code1F4485              ; 1F:43EB
    cp   $57                        ; 1F:43EE
    jp   z,Code1F4485               ; 1F:43F0
Code1F43F3:
    ld   a,[hl]                     ; 1F:43F3
    ld   hl,CodePtrs1F41C2          ; 1F:43F4
    jr   Code1F4400                 ; 1F:43F7
Code1F43F9:
    inc  hl                         ; 1F:43F9
    ld   a,[hl]                     ; 1F:43FA
    and  a                          ; 1F:43FB
    ret  z                          ; 1F:43FC
    ld   hl,CodePtrs1F42B2          ; 1F:43FD
Code1F4400:
    call Sub1F6838                  ; 1F:4400
    ld   de,$DE90                   ; 1F:4403
    ld   bc,$DE94                   ; 1F:4406
    jp   hl                         ; 1F:4409
Code1F440A:
    ld   a,$02                      ; 1F:440A
    jr   Code1F4415                 ; 1F:440C
Unused1F440E:
    ld   a,$01                      ; 1F:440E
    ld   [$DEA0],a                  ; 1F:4410

Sub1F4413:
    ld   a,$01                      ; 1F:4413
Code1F4415:
    ld   [$DEC6],a                  ; 1F:4415
Code1F4418:
    ld   a,[$DE60]                  ; 1F:4418
    ld   [$DE61],a                  ; 1F:441B
    xor  a                          ; 1F:441E
    ld   [$DE90],a                  ; 1F:441F
    ld   [$DE94],a                  ; 1F:4422
    ld   [$DEE2],a                  ; 1F:4425
    ld   a,[$DE1F]                  ; 1F:4428
    set  7,a                        ; 1F:442B
    ld   [$DE1F],a                  ; 1F:442D
    ld   a,[$DED2]                  ; 1F:4430
    res  0,a                        ; 1F:4433
    ld   [$DED2],a                  ; 1F:4435
    jp   Sub1F684D                  ; 1F:4438

Sub1F443B:
    ld   a,$11                      ; 1F:443B
    ldh  [<NR12],a                  ; 1F:443D
    ld   a,$80                      ; 1F:443F
    ldh  [<NR14],a                  ; 1F:4441
    jr   Code1F444B                 ; 1F:4443

Sub1F4445:
    ld   hl,Data1F446B              ; 1F:4445
    call Sub1F684D                  ; 1F:4448
Code1F444B:
    xor  a                          ; 1F:444B
    ld   [$DE61],a                  ; 1F:444C
    ld   [$DE90],a                  ; 1F:444F
    ld   [$DE94],a                  ; 1F:4452
    ld   [$DEBC],a                  ; 1F:4455
    ld   [$DEA0],a                  ; 1F:4458
    ld   [$DEC6],a                  ; 1F:445B
    ld   a,$08                      ; 1F:445E
    ldh  [<NR10],a                  ; 1F:4460
    ld   a,[$DE1F]                  ; 1F:4462
    res  7,a                        ; 1F:4465
    ld   [$DE1F],a                  ; 1F:4467
    ret                             ; 1F:446A

Data1F446B:                         ; 1F:446B
.db $08,$3F,$08,$00,$C1,$01
Code1F4471:
    ld   b,$02                      ; 1F:4471
    ld   c,$13                      ; 1F:4473
    ld   de,$DE90                   ; 1F:4475
    jp   Code1F6871                 ; 1F:4478
Code1F447B:
    ld   b,$02                      ; 1F:447B
    ld   c,$18                      ; 1F:447D
    ld   de,$DE92                   ; 1F:447F
    jp   Code1F6871                 ; 1F:4482
Code1F4485:
    xor  a                          ; 1F:4485
    ld   [$DE60],a                  ; 1F:4486
    jp   Sub1F43A2                  ; 1F:4489

Sub1F448C:
    ld   hl,$DE70                   ; 1F:448C
    ld   a,[hl]                     ; 1F:448F
    and  a                          ; 1F:4490
    jr   z,Code1F44F3               ; 1F:4491
    cp   $05                        ; 1F:4493
    jr   c,Code1F44A1               ; 1F:4495
    cp   $24                        ; 1F:4497
    jp   c,Code1F4610               ; 1F:4499
    cp   $3E                        ; 1F:449C
    jp   nc,Code1F4610              ; 1F:449E
Code1F44A1:
    ld   a,[$DEC8]                  ; 1F:44A1
    and  a                          ; 1F:44A4
    jp   z,Code1F44DA               ; 1F:44A5
    cp   $01                        ; 1F:44A8
    jr   z,Code1F44CA               ; 1F:44AA
    cp   $02                        ; 1F:44AC
    jr   z,Code1F44BD               ; 1F:44AE
    ld   a,[hl]                     ; 1F:44B0
    cp   $2D                        ; 1F:44B1
    jp   c,Code1F4610               ; 1F:44B3
    cp   $2F                        ; 1F:44B6
    jp   nc,Code1F4610              ; 1F:44B8
    jr   Code1F44ED                 ; 1F:44BB
Code1F44BD:
    ld   a,[hl]                     ; 1F:44BD
    cp   $2C                        ; 1F:44BE
    jp   c,Code1F4610               ; 1F:44C0
    cp   $2F                        ; 1F:44C3
    jp   nc,Code1F4610              ; 1F:44C5
    jr   Code1F44ED                 ; 1F:44C8
Code1F44CA:
    ld   a,[hl]                     ; 1F:44CA
    cp   $25                        ; 1F:44CB
    jp   z,Code1F44ED               ; 1F:44CD
    cp   $2B                        ; 1F:44D0
    jp   c,Code1F4610               ; 1F:44D2
    cp   $2F                        ; 1F:44D5
    jp   nc,Code1F4610              ; 1F:44D7
Code1F44DA:
    ld   a,[hl]                     ; 1F:44DA
    cp   $24                        ; 1F:44DB
    jr   nz,Code1F44ED              ; 1F:44DD
    ld   a,[$DE71]                  ; 1F:44DF
    cp   $38                        ; 1F:44E2
    jr   c,Code1F44ED               ; 1F:44E4
    cp   $3D                        ; 1F:44E6
    jr   nc,Code1F44ED              ; 1F:44E8
    jp   Code1F4610                 ; 1F:44EA
Code1F44ED:
    ld   a,[hl]                     ; 1F:44ED
    ld   hl,CodePtrs1F4509          ; 1F:44EE
    jr   Code1F44FA                 ; 1F:44F1
Code1F44F3:
    inc  hl                         ; 1F:44F3
    ld   a,[hl]                     ; 1F:44F4
    and  a                          ; 1F:44F5
    ret  z                          ; 1F:44F6
    ld   hl,CodePtrs1F4583          ; 1F:44F7
Code1F44FA:
    call Sub1F6838                  ; 1F:44FA
    ld   de,$DE92                   ; 1F:44FD
    ld   bc,$DE96                   ; 1F:4500
    ld   a,[$DECD]                  ; 1F:4503
    and  a                          ; 1F:4506
    ret  nz                         ; 1F:4507
    jp   hl                         ; 1F:4508
CodePtrs1F4509:
.dw Code1F4D18                      ; 1F:4509
.dw Code1F4E2D                      ; 1F:450B
.dw Code1F510E                      ; 1F:450D
.dw Code1F5552                      ; 1F:450F
.dw Code1F5762                      ; 1F:4511
.dw Code1F5762                      ; 1F:4513
.dw Code1F5762                      ; 1F:4515
.dw Code1F5762                      ; 1F:4517
.dw Code1F5762                      ; 1F:4519
.dw Code1F5762                      ; 1F:451B
.dw Code1F5762                      ; 1F:451D
.dw Code1F5762                      ; 1F:451F
.dw Code1F5762                      ; 1F:4521
.dw Code1F5762                      ; 1F:4523
.dw Code1F5762                      ; 1F:4525
.dw Code1F5762                      ; 1F:4527
.dw Code1F5762                      ; 1F:4529
.dw Code1F5762                      ; 1F:452B
.dw Code1F5762                      ; 1F:452D
.dw Code1F5762                      ; 1F:452F
.dw Code1F5762                      ; 1F:4531
.dw Code1F5762                      ; 1F:4533
.dw Code1F5762                      ; 1F:4535
.dw Code1F5762                      ; 1F:4537
.dw Code1F5762                      ; 1F:4539
.dw Code1F5762                      ; 1F:453B
.dw Code1F5762                      ; 1F:453D
.dw Code1F5762                      ; 1F:453F
.dw Code1F5762                      ; 1F:4541
.dw Code1F5762                      ; 1F:4543
.dw Code1F5762                      ; 1F:4545
.dw Code1F5762                      ; 1F:4547
.dw Code1F5762                      ; 1F:4549
.dw Code1F5762                      ; 1F:454B
.dw Code1F5762                      ; 1F:454D
.dw Code1F5762                      ; 1F:454F
.dw Code1F5782                      ; 1F:4551
.dw Code1F581C                      ; 1F:4553
.dw Code1F58AF                      ; 1F:4555
.dw Code1F5908                      ; 1F:4557
.dw Code1F5964                      ; 1F:4559
.dw Code1F60DC                      ; 1F:455B
.dw Code1F611B                      ; 1F:455D
.dw Code1F6144                      ; 1F:455F
.dw Code1F61A4                      ; 1F:4561
.dw Code1F6224                      ; 1F:4563
.dw Code1F59A7                      ; 1F:4565
.dw Code1F59EA                      ; 1F:4567
.dw Code1F5A27                      ; 1F:4569
.dw Code1F485A                      ; 1F:456B
.dw Code1F48B5                      ; 1F:456D
.dw Code1F624D                      ; 1F:456F
.dw Code1F6253                      ; 1F:4571
.dw Code1F625A                      ; 1F:4573
.dw Code1F62A4                      ; 1F:4575
.dw Code1F62FC                      ; 1F:4577
.dw Code1F634C                      ; 1F:4579
.dw Code1F639C                      ; 1F:457B
.dw Code1F63EC                      ; 1F:457D
.dw Code1F6467                      ; 1F:457F
.dw Code1F6506                      ; 1F:4581
CodePtrs1F4583:
.dw Code1F4D1E                      ; 1F:4583
.dw Code1F4E33                      ; 1F:4585
.dw Code1F5114                      ; 1F:4587
.dw Code1F5558                      ; 1F:4589
.dw Code1F5768                      ; 1F:458B
.dw Code1F5768                      ; 1F:458D
.dw Code1F5768                      ; 1F:458F
.dw Code1F5768                      ; 1F:4591
.dw Code1F5768                      ; 1F:4593
.dw Code1F5768                      ; 1F:4595
.dw Code1F5768                      ; 1F:4597
.dw Code1F5768                      ; 1F:4599
.dw Code1F5768                      ; 1F:459B
.dw Code1F5768                      ; 1F:459D
.dw Code1F5768                      ; 1F:459F
.dw Code1F5768                      ; 1F:45A1
.dw Code1F5768                      ; 1F:45A3
.dw Code1F5768                      ; 1F:45A5
.dw Code1F5768                      ; 1F:45A7
.dw Code1F5768                      ; 1F:45A9
.dw Code1F5768                      ; 1F:45AB
.dw Code1F5768                      ; 1F:45AD
.dw Code1F5768                      ; 1F:45AF
.dw Code1F5768                      ; 1F:45B1
.dw Code1F5768                      ; 1F:45B3
.dw Code1F5768                      ; 1F:45B5
.dw Code1F5768                      ; 1F:45B7
.dw Code1F5768                      ; 1F:45B9
.dw Code1F5768                      ; 1F:45BB
.dw Code1F5768                      ; 1F:45BD
.dw Code1F5768                      ; 1F:45BF
.dw Code1F5768                      ; 1F:45C1
.dw Code1F5768                      ; 1F:45C3
.dw Code1F5768                      ; 1F:45C5
.dw Code1F5768                      ; 1F:45C7
.dw Code1F5768                      ; 1F:45C9
.dw Code1F5790                      ; 1F:45CB
.dw Code1F5822                      ; 1F:45CD
.dw Code1F58B5                      ; 1F:45CF
.dw Code1F590E                      ; 1F:45D1
.dw Code1F596A                      ; 1F:45D3
.dw Code1F6105                      ; 1F:45D5
.dw Code1F6121                      ; 1F:45D7
.dw Code1F614A                      ; 1F:45D9
.dw Code1F61AA                      ; 1F:45DB
.dw Code1F622A                      ; 1F:45DD
.dw Code1F59AD                      ; 1F:45DF
.dw Code1F59F0                      ; 1F:45E1
.dw Code1F5A2D                      ; 1F:45E3
.dw Code1F4860                      ; 1F:45E5
.dw Code1F48BB                      ; 1F:45E7
.dw Code1F6250                      ; 1F:45E9
.dw Code1F6256                      ; 1F:45EB
.dw Code1F6260                      ; 1F:45ED
.dw Code1F62AD                      ; 1F:45EF
.dw Code1F6307                      ; 1F:45F1
.dw Code1F6357                      ; 1F:45F3
.dw Code1F63A7                      ; 1F:45F5
.dw Code1F63F7                      ; 1F:45F7
.dw Code1F6472                      ; 1F:45F9
.dw Code1F6511                      ; 1F:45FB
Code1F45FD:
    push bc                         ; 1F:45FD
    ld   c,$30                      ; 1F:45FE
Code1F4600:
    ldi  a,[hl]                     ; 1F:4600
    ldh  [c],a                      ; 1F:4601
    inc  c                          ; 1F:4602
    ld   a,c                        ; 1F:4603
    cp   $40                        ; 1F:4604
    jr   nz,Code1F4600              ; 1F:4606
    pop  bc                         ; 1F:4608
    ret                             ; 1F:4609

Sub1F460A:
    xor  a                          ; 1F:460A
    ldh  [<NR30],a                  ; 1F:460B
    jp   Code1F45FD                 ; 1F:460D
Code1F4610:
    xor  a                          ; 1F:4610
    ld   [$DE70],a                  ; 1F:4611
    jp   Sub1F448C                  ; 1F:4614
CodePtrs1F4617:
.dw Code1F475E                      ; 1F:4617
.dw Code1F475E                      ; 1F:4619
.dw Code1F475E                      ; 1F:461B
.dw Code1F475E                      ; 1F:461D
.dw Code1F475E                      ; 1F:461F
.dw Code1F475E                      ; 1F:4621
.dw Code1F475E                      ; 1F:4623
.dw Code1F475E                      ; 1F:4625
.dw Code1F475E                      ; 1F:4627
.dw Code1F475E                      ; 1F:4629
.dw Code1F475E                      ; 1F:462B
.dw Code1F475E                      ; 1F:462D
.dw Code1F475E                      ; 1F:462F
.dw Code1F475E                      ; 1F:4631
.dw Code1F475E                      ; 1F:4633
.dw Code1F475E                      ; 1F:4635
.dw Code1F475E                      ; 1F:4637
.dw Code1F475E                      ; 1F:4639
.dw Code1F475E                      ; 1F:463B
.dw Code1F475E                      ; 1F:463D
.dw Code1F475E                      ; 1F:463F
.dw Code1F475E                      ; 1F:4641
.dw Code1F475E                      ; 1F:4643
.dw Code1F475E                      ; 1F:4645
.dw Code1F475E                      ; 1F:4647
.dw Code1F475E                      ; 1F:4649
.dw Code1F475E                      ; 1F:464B
.dw Code1F475E                      ; 1F:464D
.dw Code1F475E                      ; 1F:464F
.dw Code1F475E                      ; 1F:4651
.dw Code1F475E                      ; 1F:4653
.dw Code1F475E                      ; 1F:4655
.dw Code1F475E                      ; 1F:4657
.dw Code1F475E                      ; 1F:4659
.dw Code1F475E                      ; 1F:465B
.dw Code1F475E                      ; 1F:465D
.dw Code1F475E                      ; 1F:465F
.dw Code1F475E                      ; 1F:4661
.dw Code1F475E                      ; 1F:4663
.dw Code1F475E                      ; 1F:4665
.dw Code1F475E                      ; 1F:4667
.dw Code1F475E                      ; 1F:4669
.dw Code1F475E                      ; 1F:466B
.dw Code1F475E                      ; 1F:466D
.dw Code1F475E                      ; 1F:466F
.dw Code1F475E                      ; 1F:4671
.dw Code1F475E                      ; 1F:4673
.dw Code1F475E                      ; 1F:4675
.dw Code1F475E                      ; 1F:4677
.dw Code1F475E                      ; 1F:4679
.dw Code1F475E                      ; 1F:467B
.dw Code1F475E                      ; 1F:467D
.dw Code1F475E                      ; 1F:467F
.dw Code1F475E                      ; 1F:4681
.dw Code1F475E                      ; 1F:4683
.dw Code1F475E                      ; 1F:4685
.dw Code1F475E                      ; 1F:4687
.dw Code1F475E                      ; 1F:4689
.dw Code1F475E                      ; 1F:468B
.dw Code1F475E                      ; 1F:468D
.dw Code1F475E                      ; 1F:468F
.dw Code1F522D                      ; 1F:4691
.dw Code1F6570                      ; 1F:4693
.dw Code1F51FB                      ; 1F:4695
.dw Code1F5A5C                      ; 1F:4697
.dw Code1F5AEA                      ; 1F:4699
.dw Code1F658D                      ; 1F:469B
.dw Code1F6613                      ; 1F:469D
.dw Code1F663C                      ; 1F:469F
.dw Code1F6700                      ; 1F:46A1
.dw Code1F674C                      ; 1F:46A3
.dw Code1F67C3                      ; 1F:46A5
CodePtrs1F46A7:
.dw Code1F475B                      ; 1F:46A7
.dw Code1F475B                      ; 1F:46A9
.dw Code1F475B                      ; 1F:46AB
.dw Code1F475B                      ; 1F:46AD
.dw Code1F475B                      ; 1F:46AF
.dw Code1F475B                      ; 1F:46B1
.dw Code1F475B                      ; 1F:46B3
.dw Code1F475B                      ; 1F:46B5
.dw Code1F475B                      ; 1F:46B7
.dw Code1F475B                      ; 1F:46B9
.dw Code1F475B                      ; 1F:46BB
.dw Code1F475B                      ; 1F:46BD
.dw Code1F475B                      ; 1F:46BF
.dw Code1F475B                      ; 1F:46C1
.dw Code1F475B                      ; 1F:46C3
.dw Code1F475B                      ; 1F:46C5
.dw Code1F475B                      ; 1F:46C7
.dw Code1F475B                      ; 1F:46C9
.dw Code1F475B                      ; 1F:46CB
.dw Code1F475B                      ; 1F:46CD
.dw Code1F475B                      ; 1F:46CF
.dw Code1F475B                      ; 1F:46D1
.dw Code1F475B                      ; 1F:46D3
.dw Code1F475B                      ; 1F:46D5
.dw Code1F475B                      ; 1F:46D7
.dw Code1F475B                      ; 1F:46D9
.dw Code1F475B                      ; 1F:46DB
.dw Code1F475B                      ; 1F:46DD
.dw Code1F475B                      ; 1F:46DF
.dw Code1F475B                      ; 1F:46E1
.dw Code1F475B                      ; 1F:46E3
.dw Code1F475B                      ; 1F:46E5
.dw Code1F475B                      ; 1F:46E7
.dw Code1F475B                      ; 1F:46E9
.dw Code1F475B                      ; 1F:46EB
.dw Code1F475B                      ; 1F:46ED
.dw Code1F475B                      ; 1F:46EF
.dw Code1F475B                      ; 1F:46F1
.dw Code1F475B                      ; 1F:46F3
.dw Code1F475B                      ; 1F:46F5
.dw Code1F475B                      ; 1F:46F7
.dw Code1F475B                      ; 1F:46F9
.dw Code1F475B                      ; 1F:46FB
.dw Code1F475B                      ; 1F:46FD
.dw Code1F475B                      ; 1F:46FF
.dw Code1F475B                      ; 1F:4701
.dw Code1F475B                      ; 1F:4703
.dw Code1F475B                      ; 1F:4705
.dw Code1F475B                      ; 1F:4707
.dw Code1F475B                      ; 1F:4709
.dw Code1F475B                      ; 1F:470B
.dw Code1F475B                      ; 1F:470D
.dw Code1F475B                      ; 1F:470F
.dw Code1F475B                      ; 1F:4711
.dw Code1F475B                      ; 1F:4713
.dw Code1F475B                      ; 1F:4715
.dw Code1F475B                      ; 1F:4717
.dw Code1F475B                      ; 1F:4719
.dw Code1F475B                      ; 1F:471B
.dw Code1F475B                      ; 1F:471D
.dw Code1F475B                      ; 1F:471F
.dw Code1F5233                      ; 1F:4721
.dw Code1F6576                      ; 1F:4723
.dw Code1F5201                      ; 1F:4725
.dw Code1F5A62                      ; 1F:4727
.dw Code1F5AF0                      ; 1F:4729
.dw Code1F65B0                      ; 1F:472B
.dw Code1F661F                      ; 1F:472D
.dw Code1F6648                      ; 1F:472F
.dw Code1F6706                      ; 1F:4731
.dw Code1F67BC                      ; 1F:4733
.dw Code1F67C9                      ; 1F:4735

Sub1F4737:
    ld   hl,$DE78                   ; 1F:4737
    ld   a,[hl]                     ; 1F:473A
    and  a                          ; 1F:473B
    jr   z,Code1F4761               ; 1F:473C
    cp   $3E                        ; 1F:473E
    jp   c,Code1F47BD               ; 1F:4740
    cp   $49                        ; 1F:4743
    jp   nc,Code1F47BD              ; 1F:4745
    ld   a,[$DEC9]                  ; 1F:4748
    and  a                          ; 1F:474B
    jp   z,Code1F4755               ; 1F:474C
    ld   a,[hl]                     ; 1F:474F
    cp   $45                        ; 1F:4750
    jp   nz,Code1F47BD              ; 1F:4752
Code1F4755:
    ld   a,[hl]                     ; 1F:4755
    ld   hl,CodePtrs1F4617          ; 1F:4756
    jr   Code1F4768                 ; 1F:4759
Code1F475B:
    jp   Code1F4795                 ; 1F:475B
Code1F475E:
    ld   hl,$DE78                   ; 1F:475E
Code1F4761:
    inc  hl                         ; 1F:4761
    ld   a,[hl]                     ; 1F:4762
    and  a                          ; 1F:4763
    ret  z                          ; 1F:4764
    ld   hl,CodePtrs1F46A7          ; 1F:4765
Code1F4768:
    call Sub1F6838                  ; 1F:4768
    ld   de,$DE93                   ; 1F:476B
    ld   bc,$DE98                   ; 1F:476E
    jp   hl                         ; 1F:4771
Unused1F4772:
    ld   a,$01                      ; 1F:4772
    ld   [$DEC9],a                  ; 1F:4774
Code1F4777:
    ld   a,[$DE78]                  ; 1F:4777
    ld   [$DE79],a                  ; 1F:477A
    xor  a                          ; 1F:477D
    ld   [$DE93],a                  ; 1F:477E
    ld   [$DE98],a                  ; 1F:4781
    ld   a,[$DE4F]                  ; 1F:4784
    set  7,a                        ; 1F:4787
    ld   [$DE4F],a                  ; 1F:4789
    jp   Sub1F6868                  ; 1F:478C

Sub1F478F:
    ld   hl,Data1F47AE              ; 1F:478F
    call Sub1F6868                  ; 1F:4792
Code1F4795:
    xor  a                          ; 1F:4795
    ld   [$DE79],a                  ; 1F:4796
    ld   [$DE93],a                  ; 1F:4799
    ld   [$DE98],a                  ; 1F:479C
    ld   [$DEBF],a                  ; 1F:479F
    ld   [$DEC9],a                  ; 1F:47A2
    ld   a,[$DE4F]                  ; 1F:47A5
    res  7,a                        ; 1F:47A8
    ld   [$DE4F],a                  ; 1F:47AA
    ret                             ; 1F:47AD

Data1F47AE:                         ; 1F:47AE
.db $00,$08,$00,$80,$01,$06,$02,$0E,\
    $22,$11,$93,$DE,$C3,$71,$68
Code1F47BD:
    xor  a                          ; 1F:47BD
    ld   [$DE78],a                  ; 1F:47BE
    jp   Sub1F4737                  ; 1F:47C1
Code1F47C4:
    ld   a,$02                      ; 1F:47C4
    jr   Code1F47D2                 ; 1F:47C6
Code1F47C8:
    ld   a,$03                      ; 1F:47C8
    jr   Code1F47D2                 ; 1F:47CA
Code1F47CC:
    ld   a,$04                      ; 1F:47CC
    jr   Code1F47D2                 ; 1F:47CE
Code1F47D0:
    ld   a,$01                      ; 1F:47D0
Code1F47D2:
    ld   [$DEC8],a                  ; 1F:47D2
Code1F47D5:
    ld   a,[$DE70]                  ; 1F:47D5
    ld   [$DE71],a                  ; 1F:47D8
    ld   a,[$DE2F]                  ; 1F:47DB
    set  7,a                        ; 1F:47DE
    ld   [$DE2F],a                  ; 1F:47E0
    xor  a                          ; 1F:47E3
    ld   [$DE92],a                  ; 1F:47E4
    ld   [$DE96],a                  ; 1F:47E7
    ld   a,[$DED2]                  ; 1F:47EA
    res  1,a                        ; 1F:47ED
    ld   [$DED2],a                  ; 1F:47EF
    jp   Sub1F6856                  ; 1F:47F2

Sub1F47F5:
    ld   hl,Data1F480E              ; 1F:47F5
    call Sub1F6856                  ; 1F:47F8
Code1F47FB:
    xor  a                          ; 1F:47FB
    ld   [$DE92],a                  ; 1F:47FC
    ld   [$DE96],a                  ; 1F:47FF
    ld   [$DE71],a                  ; 1F:4802
    ld   [$DEC8],a                  ; 1F:4805
    ld   hl,$DE2F                   ; 1F:4808
    res  7,[hl]                     ; 1F:480B
    ret                             ; 1F:480D

Data1F480E:                         ; 1F:480E
.db $3F,$08,$00,$C1,$01
Code1F4813:
    ld   a,$01                      ; 1F:4813
    ld   [$DEC9],a                  ; 1F:4815
Code1F4818:
    call Sub1F481E                  ; 1F:4818
    jp   Sub1F685F                  ; 1F:481B

Sub1F481E:
    ld   a,[$DE78]                  ; 1F:481E
    ld   [$DE79],a                  ; 1F:4821
    xor  a                          ; 1F:4824
    ld   [$DE93],a                  ; 1F:4825
    ld   [$DE98],a                  ; 1F:4828
    push hl                         ; 1F:482B
    ld   hl,$DE3F                   ; 1F:482C
    set  7,[hl]                     ; 1F:482F
    pop  hl                         ; 1F:4831
    ret                             ; 1F:4832

Data1F4833:                         ; 1F:4833
.db $00,$00,$00,$00,$00,$01
Code1F4839:
    ld   hl,Data1F4833              ; 1F:4839
    call Sub1F685F                  ; 1F:483C
    xor  a                          ; 1F:483F
    ld   [$DE79],a                  ; 1F:4840
    ld   [$DE93],a                  ; 1F:4843
    ld   [$DE98],a                  ; 1F:4846
    ld   [$DEBF],a                  ; 1F:4849
    ld   [$DEC9],a                  ; 1F:484C
    ld   hl,$DE3F                   ; 1F:484F
    res  7,[hl]                     ; 1F:4852
    ld   a,$01                      ; 1F:4854
    ld   [$DEE7],a                  ; 1F:4856
    ret                             ; 1F:4859

Code1F485A:
    ld   hl,Data1F48B0              ; 1F:485A
    jp   Code1F47D5                 ; 1F:485D
Code1F4860:
    call Sub1F6845                  ; 1F:4860
    jp   z,Sub1F47F5                ; 1F:4863
    cpl                             ; 1F:4866
    add  $27                        ; 1F:4867
    ld   d,$00                      ; 1F:4869
    srl  a                          ; 1F:486B
    ret  c                          ; 1F:486D
    cp   $07                        ; 1F:486E
    jr   nz,Code1F487A              ; 1F:4870
    ld   a,$73                      ; 1F:4872
    ldh  [<NR22],a                  ; 1F:4874
    ld   a,$07                      ; 1F:4876
    ld   d,$80                      ; 1F:4878
Code1F487A:
    ld   hl,Data1F488C              ; 1F:487A
    call Sub1F6838                  ; 1F:487D
    ld   a,l                        ; 1F:4880
    ldh  [<NR23],a                  ; 1F:4881
    ld   a,h                        ; 1F:4883
    or   d                          ; 1F:4884
    ldh  [<NR24],a                  ; 1F:4885
    ld   a,$80                      ; 1F:4887
    ldh  [<NR21],a                  ; 1F:4889
    ret                             ; 1F:488B

Data1F488C:                         ; 1F:488C
.db $42,$06,$06,$07,$9E,$06,$39,$07,\
    $D6,$06,$59,$07,$B2,$06,$F7,$06,\
    $59,$07,$B2,$06,$F7,$06,$59,$07,\
    $B2,$06,$F7,$06,$59,$07,$B2,$06,\
    $F7,$06,$59,$07
Data1F48B0:                         ; 1F:48B0
.db $80,$98,$39,$87,$26
Code1F48B5:
    ld   hl,Data1F4903              ; 1F:48B5
    jp   Code1F47D5                 ; 1F:48B8
Code1F48BB:
    call Sub1F6845                  ; 1F:48BB
    jp   z,Code1F47FB               ; 1F:48BE
    cpl                             ; 1F:48C1
    add  $1F                        ; 1F:48C2
    ld   d,$00                      ; 1F:48C4
    srl  a                          ; 1F:48C6
    ret  c                          ; 1F:48C8
    cp   $09                        ; 1F:48C9
    jr   nz,Code1F48D5              ; 1F:48CB
    ld   a,$E1                      ; 1F:48CD
    ldh  [<NR22],a                  ; 1F:48CF
    ld   a,$09                      ; 1F:48D1
    ld   d,$80                      ; 1F:48D3
Code1F48D5:
    ld   hl,Data1F48E7              ; 1F:48D5
    call Sub1F6838                  ; 1F:48D8
    ld   a,l                        ; 1F:48DB
    ldh  [<NR23],a                  ; 1F:48DC
    ld   a,h                        ; 1F:48DE
    or   d                          ; 1F:48DF
    ldh  [<NR24],a                  ; 1F:48E0
    ld   a,$80                      ; 1F:48E2
    ldh  [<NR21],a                  ; 1F:48E4
    ret                             ; 1F:48E6

Data1F48E7:                         ; 1F:48E7
.db $42,$06,$0A,$06,$ED,$05,$AC,$05,\
    $63,$05,$89,$05,$AC,$05,$CE,$05,\
    $AC,$05,$89,$05,$63,$05,$89,$05,\
    $AC,$05,$CE,$05
Data1F4903:                         ; 1F:4903
.db $80,$A9,$72,$86,$1E
Code1F4908:
    ld   hl,Data1F492D              ; 1F:4908
    jp   Code1F4418                 ; 1F:490B
Code1F490E:
    call Sub1F6845                  ; 1F:490E
    ret  nz                         ; 1F:4911
    call Sub1F6849                  ; 1F:4912
    cp   $06                        ; 1F:4915
    jp   z,Code1F444B               ; 1F:4917
    ld   hl,DataPtrs1F4923          ; 1F:491A
    call Sub1F6838                  ; 1F:491D
    jp   Sub1F684D                  ; 1F:4920

DataPtrs1F4923:                     ; 1F:4923
.dw Data1F4933, Data1F492D, Data1F4933, Data1F492D,\
    Data1F4933
Data1F492D:                         ; 1F:492D
.db $17,$B8,$81,$39,$C7,$04
Data1F4933:                         ; 1F:4933
.db $17,$B8,$81,$06,$C7,$04

Code1F4939:
    ld   hl,Data1F4951              ; 1F:4939
    jp   Code1F4418                 ; 1F:493C
Code1F493F:
    call Sub1F6845                  ; 1F:493F
    ret  nz                         ; 1F:4942
    call Sub1F6849                  ; 1F:4943
    cp   $02                        ; 1F:4946
    jp   z,Code1F444B               ; 1F:4948
    ld   hl,Data1F4957              ; 1F:494B
    jp   Sub1F684D                  ; 1F:494E

Data1F4951:                         ; 1F:4951
.db $37,$80,$E1,$D6,$86,$03
Data1F4957:                         ; 1F:4957
.db $67,$40,$E2,$E7,$86,$23

Code1F495D:
    ld   hl,Data1F498B              ; 1F:495D
    jp   Code1F4418                 ; 1F:4960
Code1F4963:
    call Sub1F6845                  ; 1F:4963
    jp   z,Sub1F443B                ; 1F:4966
    cpl                             ; 1F:4969
    add  $0B                        ; 1F:496A
    ld   hl,Data1F4979              ; 1F:496C
    call Sub1F6838                  ; 1F:496F
    ld   a,l                        ; 1F:4972
    ldh  [<NR13],a                  ; 1F:4973
    ld   a,h                        ; 1F:4975
    ldh  [<NR14],a                  ; 1F:4976
    ret                             ; 1F:4978

Data1F4979:                         ; 1F:4979
.db $11,$05,$B5,$04,$4E,$04,$DA,$03,\
    $56,$03,$9B,$03,$DA,$03,$16,$04,\
    $4E,$04
Data1F498B:                         ; 1F:498B
.db $08,$80,$D8,$63,$85,$0A
Code1F4991:
    ld   hl,Data1F49B0              ; 1F:4991
    jp   Code1F4418                 ; 1F:4994
Code1F4997:
    call Sub1F6845                  ; 1F:4997
    ret  nz                         ; 1F:499A
    call Sub1F6849                  ; 1F:499B
    cp   $03                        ; 1F:499E
    jp   z,Sub1F443B                ; 1F:49A0
    ld   hl,Data1F49AC              ; 1F:49A3
    call Sub1F6838                  ; 1F:49A6
    jp   Sub1F684D                  ; 1F:49A9

Data1F49AC:                         ; 1F:49AC
.db $B6,$49,$BC,$49
Data1F49B0:                         ; 1F:49B0
.db $27,$A8,$49,$D6,$C6,$05,$27,$A8,\
    $11,$D6,$C6,$02,$27,$A8,$49,$21,\
    $C7,$06

Code1F49C2:
    ld   hl,Data1F49DA              ; 1F:49C2
    jp   Code1F4418                 ; 1F:49C5
Code1F49C8:
    call Sub1F6845                  ; 1F:49C8
    ret  nz                         ; 1F:49CB
    call Sub1F6849                  ; 1F:49CC
    cp   $02                        ; 1F:49CF
    jp   z,Code1F444B               ; 1F:49D1
    ld   hl,Data1F49E0              ; 1F:49D4
    jp   Sub1F684D                  ; 1F:49D7

Data1F49DA:                         ; 1F:49DA
.db $44,$BB,$E8,$E7,$C6,$06
Data1F49E0:                         ; 1F:49E0
.db $44,$BB,$E8,$44,$C7,$04

Code1F49E6:
    call Sub1F68FB                  ; 1F:49E6
    ld   hl,Data1F49F6              ; 1F:49E9
    jp   Code1F4418                 ; 1F:49EC
Code1F49EF:
    call Sub1F6845                  ; 1F:49EF
    ret  nz                         ; 1F:49F2
    jp   Sub1F4445                  ; 1F:49F3

Data1F49F6:                         ; 1F:49F6
.db $37,$80,$98,$89,$85,$3D

Code1F49FC:
    ld   hl,Data1F4A09              ; 1F:49FC
    jp   Code1F4418                 ; 1F:49FF
Code1F4A02:
    call Sub1F6845                  ; 1F:4A02
    ret  nz                         ; 1F:4A05
    jp   z,Code1F444B               ; 1F:4A06

Data1F4A09:
.db $08,$80,$91,$7B,$87,$10

Code1F4A0F:
    ld   hl,Data1F4A30              ; 1F:4A0F
    jp   Code1F4418                 ; 1F:4A12
Code1F4A15:
    call Sub1F6845                  ; 1F:4A15
    ret  nz                         ; 1F:4A18
    call Sub1F6849                  ; 1F:4A19
    cp   $04                        ; 1F:4A1C
    jp   z,Sub1F443B                ; 1F:4A1E
    ld   hl,DataPtrs1F4A2A          ; 1F:4A21
    call Sub1F6838                  ; 1F:4A24
    jp   Sub1F684D                  ; 1F:4A27

DataPtrs1F4A2A:                     ; 1F:4A2A
.dw Data1F4A36, Data1F4A3C, Data1F4A42
Data1F4A30:                         ; 1F:4A30
.db $08,$BA,$D8,$63,$C5,$01
Data1F4A36:                         ; 1F:4A36
.db $08,$BA,$D8,$B2,$C6,$01
Data1F4A3C:                         ; 1F:4A3C
.db $08,$BA,$D8,$59,$C7,$01
Data1F4A42:                         ; 1F:4A42
.db $08,$BA,$D8,$AC,$C7,$01

Code1F4A48:
    call Sub1F68FB                  ; 1F:4A48
    ld   hl,Data1F4A6C              ; 1F:4A4B
    jp   Code1F4418                 ; 1F:4A4E
Code1F4A51:
    call Sub1F6845                  ; 1F:4A51
    ret  nz                         ; 1F:4A54
    call Sub1F6849                  ; 1F:4A55
    cp   $04                        ; 1F:4A58
    jp   z,Sub1F4445                ; 1F:4A5A
    ld   hl,DataPtrs1F4A66          ; 1F:4A5D
    call Sub1F6838                  ; 1F:4A60
    jp   Sub1F684D                  ; 1F:4A63

DataPtrs1F4A66:                     ; 1F:4A66
.dw Data1F4A72, Data1F4A78, Data1F4A7E
Data1F4A6C:                         ; 1F:4A6C
.db $1F,$B0,$F1,$D6,$C6,$03
Data1F4A72:                         ; 1F:4A72
.db $1F,$B0,$F1,$E7,$C6,$03
Data1F4A78:                         ; 1F:4A78
.db $1F,$B0,$F1,$F7,$C6,$03
Data1F4A7E:                         ; 1F:4A7E
.db $1F,$B0,$F1,$C4,$C6,$03

Code1F4A84:
    ld   hl,Data1F4A91              ; 1F:4A84
    jp   Code1F4418                 ; 1F:4A87
Code1F4A8A:
    call Sub1F6845                  ; 1F:4A8A
    ret  nz                         ; 1F:4A8D
    jp   Sub1F4445                  ; 1F:4A8E

Data1F4A91:                         ; 1F:4A91
.db $1F,$80,$F8,$27,$86,$3A

Code1F4A97:
    ld   hl,Data1F4AD4              ; 1F:4A97
    call Sub1F6897                  ; 1F:4A9A
    jp   Code1F4418                 ; 1F:4A9D
Code1F4AA0:
    call Sub1F6845                  ; 1F:4AA0
    jr   nz,Code1F4AB6              ; 1F:4AA3
    call Sub1F6849                  ; 1F:4AA5
    cp   $02                        ; 1F:4AA8
    jp   z,Sub1F4445                ; 1F:4AAA
    ld   hl,Data1F4ADA              ; 1F:4AAD
    call Sub1F6897                  ; 1F:4AB0
    jp   Sub1F684D                  ; 1F:4AB3
Code1F4AB6:
    ld   hl,$FF9C                   ; 1F:4AB6
    jp   Code1F4ABC                 ; 1F:4AB9
Code1F4ABC:
    ld   a,[$DEC0]                  ; 1F:4ABC
    ld   e,a                        ; 1F:4ABF
    ld   a,[$DEC1]                  ; 1F:4AC0
    ld   d,a                        ; 1F:4AC3
    add  hl,de                      ; 1F:4AC4
    ld   a,l                        ; 1F:4AC5
    ld   [$DEC0],a                  ; 1F:4AC6
    ldh  [<NR13],a                  ; 1F:4AC9
    ld   a,h                        ; 1F:4ACB
    and  $07                        ; 1F:4ACC
    ldh  [<NR14],a                  ; 1F:4ACE
    ld   [$DEC1],a                  ; 1F:4AD0
    ret                             ; 1F:4AD3

Data1F4AD4:                         ; 1F:4AD4
.db $08,$80,$F8,$83,$84,$08
Data1F4ADA:                         ; 1F:4ADA
.db $08,$80,$F8,$42,$86,$0E
Code1F4AE0:
    ld   hl,Data1F4AF8              ; 1F:4AE0
    jp   Code1F4418                 ; 1F:4AE3
Code1F4AE6:
    call Sub1F6845                  ; 1F:4AE6
    ret  nz                         ; 1F:4AE9
    call Sub1F6849                  ; 1F:4AEA
    cp   $02                        ; 1F:4AED
    jp   z,Code1F444B               ; 1F:4AEF
    ld   hl,Data1F4AFE              ; 1F:4AF2
    jp   Sub1F684D                  ; 1F:4AF5

Data1F4AF8:                         ; 1F:4AF8
.db $37,$80,$E1,$42,$86,$03
Data1F4AFE:                         ; 1F:4AFE
.db $47,$40,$E2,$4B,$86,$23

Code1F4B04:
    call Sub1F47F5                  ; 1F:4B04
    call Sub1F478F                  ; 1F:4B07
    ld   a,[$DE69]                  ; 1F:4B0A
    and  a                          ; 1F:4B0D
    jr   z,Code1F4B13               ; 1F:4B0E
    ld   [$DED1],a                  ; 1F:4B10
Code1F4B13:
    xor  a                          ; 1F:4B13
    ld   [$DE69],a                  ; 1F:4B14
    ld   [$DED2],a                  ; 1F:4B17
    ldh  [<NR32],a                  ; 1F:4B1A
    jp   Sub1F443B                  ; 1F:4B1C
Code1F4B1F:
    jp   Code1F444B                 ; 1F:4B1F
Code1F4B22:
    ld   a,[$DED1]                  ; 1F:4B22
    and  a                          ; 1F:4B25
    jr   z,Code1F4B2B               ; 1F:4B26
    ld   [$DE69],a                  ; 1F:4B28
Code1F4B2B:
    jp   Code1F444B                 ; 1F:4B2B
Code1F4B2E:
    ld   hl,Data1F4B57              ; 1F:4B2E
    jp   Code1F4418                 ; 1F:4B31
Code1F4B34:
    call Sub1F6845                  ; 1F:4B34
    ret  nz                         ; 1F:4B37
    call Sub1F6849                  ; 1F:4B38
    cp   $08                        ; 1F:4B3B
    jp   z,Code1F444B               ; 1F:4B3D
    ld   hl,DataPtrs1F4B49          ; 1F:4B40
    call Sub1F6838                  ; 1F:4B43
    jp   Sub1F684D                  ; 1F:4B46

DataPtrs1F4B49:                     ; 1F:4B49
.dw Data1F4B5D, Data1F4B63, Data1F4B69, Data1F4B6F,\
    Data1F4B75, Data1F4B7B, Data1F4B81
Data1F4B57:                         ; 1F:4B57
.db $1C,$80,$F7,$AC,$85,$04
Data1F4B5D:                         ; 1F:4B5D
.db $1C,$80,$11,$D6,$86,$01
Data1F4B63:                         ; 1F:4B63
.db $1C,$80,$F7,$AC,$85,$05
Data1F4B69:                         ; 1F:4B69
.db $17,$80,$C2,$06,$87,$03
Data1F4B6F:                         ; 1F:4B6F
.db $17,$80,$A2,$06,$87,$03
Data1F4B75:                         ; 1F:4B75
.db $17,$80,$72,$06,$87,$03
Data1F4B7B:                         ; 1F:4B7B
.db $17,$80,$42,$06,$87,$03
Data1F4B81:                         ; 1F:4B81
.db $17,$80,$22,$06,$87,$03

Code1F4B87:
    call Sub1F68FB                  ; 1F:4B87
    xor  a                          ; 1F:4B8A
    ld   [$DE95],a                  ; 1F:4B8B
    ld   [$DE96],a                  ; 1F:4B8E
    ld   [$DE98],a                  ; 1F:4B91
    ld   hl,Data1F4BA6              ; 1F:4B94
    call Sub1F4413                  ; 1F:4B97
    ld   hl,Data1F4BAC              ; 1F:4B9A
    call Sub1F6856                  ; 1F:4B9D
    ld   hl,Data1F4BB7              ; 1F:4BA0
    jp   Sub1F6868                  ; 1F:4BA3

Data1F4BA6:                         ; 1F:4BA6
.db $08,$40,$C2,$59,$87,$06
Data1F4BAC:                         ; 1F:4BAC
.db $40,$C2,$2D,$87,$06,$00,$00,$20,\
    $F8,$06,$3A
Data1F4BB7:                         ; 1F:4BB7
.db $00,$08,$00,$00,$3A,$00,$11,$22,\
    $33,$44,$55,$66,$77,$88,$99,$AA,\
    $BB,$CC,$DD,$EE,$FF

Code1F4BCC:
    call Sub1F6845                  ; 1F:4BCC
    jr   nz,Code1F4BE2              ; 1F:4BCF
    call Sub1F6849                  ; 1F:4BD1
    cp   $13                        ; 1F:4BD4
    jp   z,Code1F444B               ; 1F:4BD6
    ld   hl,DataPtrs1F4C44          ; 1F:4BD9
    call Sub1F6838                  ; 1F:4BDC
    call Sub1F684D                  ; 1F:4BDF
Code1F4BE2:
    ld   de,$DE92                   ; 1F:4BE2
    call Sub1F6845                  ; 1F:4BE5
    jr   nz,Code1F4BF9              ; 1F:4BE8
    ld   bc,$DE95                   ; 1F:4BEA
    call Sub1F6849                  ; 1F:4BED
    ld   hl,DataPtrs1F4C0F          ; 1F:4BF0
    call Sub1F6838                  ; 1F:4BF3
    call Sub1F6856                  ; 1F:4BF6
Code1F4BF9:
    ld   de,$DE93                   ; 1F:4BF9
    call Sub1F6845                  ; 1F:4BFC
    ret  nz                         ; 1F:4BFF
    ld   bc,$DE98                   ; 1F:4C00
    call Sub1F6849                  ; 1F:4C03
    ld   hl,DataPtrs1F4C36          ; 1F:4C06
    call Sub1F6838                  ; 1F:4C09
    jp   Sub1F6868                  ; 1F:4C0C

DataPtrs1F4C0F:                     ; 1F:4C0F
.dw Data1F4C22, Data1F4C1D, Data1F4C27, Data1F4C1D,\
    Data1F4C2C, Data1F4C1D, Data1F4C31
Data1F4C1D:                         ; 1F:4C1D
.db $40,$11,$2D,$87,$06
Data1F4C22:                         ; 1F:4C22
.db $40,$C2,$39,$87,$06
Data1F4C27:                         ; 1F:4C27
.db $40,$C2,$44,$87,$06
Data1F4C2C:                         ; 1F:4C2C
.db $40,$C2,$4F,$87,$06
Data1F4C31:                         ; 1F:4C31
.db $40,$C2,$59,$87,$FF
DataPtrs1F4C36:                     ; 1F:4C36
.dw Data1F4C3A, Data1F4C3F
Data1F4C3A:                         ; 1F:4C3A
.db $00,$71,$51,$80,$10
Data1F4C3F:                         ; 1F:4C3F
.db $00,$71,$51,$80,$FF
DataPtrs1F4C44:                     ; 1F:4C44
.dw Data1F4C6E, Data1F4C68, Data1F4C74, Data1F4C68,\
    Data1F4C7A, Data1F4C68, Data1F4C80, Data1F4C86
DataPtrs1F4C54:                     ; 1F:4C54
.dw Data1F4C8C, Data1F4C92, Data1F4C98, Data1F4C9E,\
    Data1F4CA4, Data1F4CAA, Data1F4CB0, Data1F4CB6,\
    Data1F4CBC, Data1F4CC2
Data1F4C68:                         ; 1F:4C68
.db $08,$40,$11,$59,$87,$06
Data1F4C6E:                         ; 1F:4C6E
.db $08,$40,$C2,$62,$87,$06
Data1F4C74:                         ; 1F:4C74
.db $08,$40,$C2,$6B,$87,$06
Data1F4C7A:                         ; 1F:4C7A
.db $08,$40,$C2,$74,$87,$06
Data1F4C80:                         ; 1F:4C80
.db $08,$40,$C2,$7B,$87,$10
Data1F4C86:                         ; 1F:4C86
.db $17,$00,$F8,$44,$87,$07
Data1F4C8C:                         ; 1F:4C8C
.db $08,$00,$08,$00,$8F,$09
Data1F4C92:                         ; 1F:4C92
.db $08,$00,$F8,$62,$87,$01
Data1F4C98:                         ; 1F:4C98
.db $08,$00,$E8,$5F,$87,$01
Data1F4C9E:                         ; 1F:4C9E
.db $08,$00,$D8,$5C,$87,$01
Data1F4CA4:                         ; 1F:4CA4
.db $08,$00,$C8,$59,$87,$01
Data1F4CAA:                         ; 1F:4CAA
.db $08,$00,$B8,$56,$87,$01
Data1F4CB0:                         ; 1F:4CB0
.db $08,$00,$A8,$53,$87,$01
Data1F4CB6:                         ; 1F:4CB6
.db $08,$00,$98,$50,$87,$01
Data1F4CBC:                         ; 1F:4CBC
.db $08,$00,$88,$4D,$87,$01
Data1F4CC2:                         ; 1F:4CC2
.db $08,$00,$11,$4D,$87,$03

Code1F4CC8:
    ld   a,$01                      ; 1F:4CC8
    ld   [$DE70],a                  ; 1F:4CCA
    ld   hl,Data1F4CFA              ; 1F:4CCD
    jp   Sub1F4413                  ; 1F:4CD0
Code1F4CD3:
    call Sub1F6845                  ; 1F:4CD3
    ret  nz                         ; 1F:4CD6
    call Sub1F6849                  ; 1F:4CD7
    cp   $0A                        ; 1F:4CDA
    jp   z,Code1F444B               ; 1F:4CDC
    ld   hl,DataPtrs1F4CE8          ; 1F:4CDF
    call Sub1F6838                  ; 1F:4CE2
    jp   Sub1F684D                  ; 1F:4CE5

DataPtrs1F4CE8:                     ; 1F:4CE8
.dw Data1F4D00, Data1F4D06, Data1F4D0C, Data1F4CFA,\
    Data1F4D00, Data1F4D06, Data1F4D0C, Data1F4CFA,\
    Data1F4D12
Data1F4CFA:                         ; 1F:4CFA
.db $08,$80,$D1,$AC,$87,$01
Data1F4D00:                         ; 1F:4D00
.db $08,$80,$72,$AC,$87,$05
Data1F4D06:                         ; 1F:4D06
.db $08,$80,$C1,$A7,$87,$01
Data1F4D0C:                         ; 1F:4D0C
.db $08,$80,$72,$A7,$87,$05
Data1F4D12:                         ; 1F:4D12
.db $08,$80,$72,$AC,$87,$0E

Code1F4D18:
    ld   hl,Data1F4D45              ; 1F:4D18
    jp   Code1F47D5                 ; 1F:4D1B
Code1F4D1E:
    call Sub1F6845                  ; 1F:4D1E
    ret  nz                         ; 1F:4D21
    call Sub1F6849                  ; 1F:4D22
    cp   $0A                        ; 1F:4D25
    jp   z,Code1F47FB               ; 1F:4D27
    ld   hl,DataPtrs1F4D33          ; 1F:4D2A
    call Sub1F6838                  ; 1F:4D2D
    jp   Sub1F6856                  ; 1F:4D30

DataPtrs1F4D33:                     ; 1F:4D33
.dw Data1F4D4A, Data1F4D4F, Data1F4D54, Data1F4D45,\
    Data1F4D4A, Data1F4D4F, Data1F4D54, Data1F4D45,\
    Data1F4D59
Data1F4D45:                         ; 1F:4D45
.db $80,$D1,$9D,$87,$01
Data1F4D4A:                         ; 1F:4D4A
.db $80,$72,$9D,$87,$05
Data1F4D4F:                         ; 1F:4D4F
.db $80,$F1,$97,$87,$01
Data1F4D54:                         ; 1F:4D54
.db $80,$72,$97,$87,$05
Data1F4D59:                         ; 1F:4D59
.db $80,$72,$9D,$87,$0E

Code1F4D5E:
    ld   hl,Data1F4D7D              ; 1F:4D5E
    jp   Code1F4418                 ; 1F:4D61
Code1F4D64:
    call Sub1F6845                  ; 1F:4D64
    ret  nz                         ; 1F:4D67
    call Sub1F6849                  ; 1F:4D68
    cp   $03                        ; 1F:4D6B
    jp   z,Sub1F443B                ; 1F:4D6D
    ld   hl,DataPtrs1F4D79          ; 1F:4D70
    call Sub1F6838                  ; 1F:4D73
    jp   Sub1F684D                  ; 1F:4D76

DataPtrs1F4D79:                     ; 1F:4D79
.dw Data1F4D83, Data1F4D89
Data1F4D7D:                         ; 1F:4D7D
.db $2F,$A8,$49,$74,$C7,$05
Data1F4D83:                         ; 1F:4D83
.db $2F,$A8,$11,$74,$C7,$02
Data1F4D89:                         ; 1F:4D89
.db $2F,$A8,$49,$14,$C7,$06

Code1F4D8F:
    ld   hl,Data1F4DA7              ; 1F:4D8F
    jp   Code1F4418                 ; 1F:4D92
Code1F4D95:
    call Sub1F6845                  ; 1F:4D95
    ret  nz                         ; 1F:4D98
    call Sub1F6849                  ; 1F:4D99
    cp   $02                        ; 1F:4D9C
    jp   z,Code1F444B               ; 1F:4D9E
    ld   hl,Data1F4DAD              ; 1F:4DA1
    jp   Sub1F684D                  ; 1F:4DA4

Data1F4DA7:                         ; 1F:4DA7
.db $08,$40,$C7,$D6,$86,$05
Data1F4DAD:                         ; 1F:4DAD
.db $08,$40,$62,$D6,$86,$0E

Code1F4DB3:
    ld   hl,Data1F4DCB              ; 1F:4DB3
    jp   Code1F4418                 ; 1F:4DB6
Code1F4DB9:
    call Sub1F6845                  ; 1F:4DB9
    ret  nz                         ; 1F:4DBC
    call Sub1F6849                  ; 1F:4DBD
    cp   $02                        ; 1F:4DC0
    jp   z,Code1F444B               ; 1F:4DC2
    ld   hl,Data1F4DD1              ; 1F:4DC5
    jp   Sub1F684D                  ; 1F:4DC8

Data1F4DCB:                         ; 1F:4DCB
.db $08,$40,$E7,$6B,$87,$05
Data1F4DD1:                         ; 1F:4DD1
.db $08,$40,$87,$6B,$87,$38

Code1F4DD7:
    ld   a,$02                      ; 1F:4DD7
    ld   [$DE70],a                  ; 1F:4DD9
    ld   hl,Data1F4E09              ; 1F:4DDC
    jp   Code1F4418                 ; 1F:4DDF
Code1F4DE2:
    call Sub1F6845                  ; 1F:4DE2
    ret  nz                         ; 1F:4DE5
    call Sub1F6849                  ; 1F:4DE6
    cp   $0A                        ; 1F:4DE9
    jp   z,Code1F444B               ; 1F:4DEB
    ld   hl,DataPtrs1F4DF7          ; 1F:4DEE
    call Sub1F6838                  ; 1F:4DF1
    jp   Sub1F684D                  ; 1F:4DF4

DataPtrs1F4DF7:                     ; 1F:4DF7
.dw Data1F4E0F, Data1F4E15, Data1F4E1B, Data1F4E09,\
    Data1F4E0F, Data1F4E15, Data1F4E1B, Data1F4E21,\
    Data1F4E27
Data1F4E09:                         ; 1F:4E09
.db $08,$80,$B1,$A2,$87,$01
Data1F4E0F:                         ; 1F:4E0F
.db $08,$80,$72,$A2,$87,$05
Data1F4E15:                         ; 1F:4E15
.db $08,$80,$B1,$AC,$87,$01
Data1F4E1B:                         ; 1F:4E1B
.db $08,$80,$72,$AC,$87,$05
Data1F4E21:                         ; 1F:4E21
.db $08,$80,$B1,$C1,$87,$01
Data1F4E27:                         ; 1F:4E27
.db $08,$80,$72,$C1,$87,$0E

Code1F4E2D:
    ld   hl,Data1F4E5A              ; 1F:4E2D
    jp   Code1F47D5                 ; 1F:4E30
Code1F4E33:
    call Sub1F6845                  ; 1F:4E33
    ret  nz                         ; 1F:4E36
    call Sub1F6849                  ; 1F:4E37
    cp   $0A                        ; 1F:4E3A
    jp   z,Code1F47FB               ; 1F:4E3C
    ld   hl,DataPtrs1F4E48          ; 1F:4E3F
    call Sub1F6838                  ; 1F:4E42
    jp   Sub1F6856                  ; 1F:4E45

DataPtrs1F4E48:                     ; 1F:4E48
.dw Data1F4E5F, Data1F4E64, Data1F4E69, Data1F4E5A,\
    Data1F4E5F, Data1F4E64, Data1F4E69, Data1F4E6E,\
    Data1F4E73
Data1F4E5A:                         ; 1F:4E5A
.db $80,$B1,$90,$87,$01
Data1F4E5F:                         ; 1F:4E5F
.db $80,$72,$90,$87,$05
Data1F4E64:                         ; 1F:4E64
.db $80,$B1,$9D,$87,$01
Data1F4E69:                         ; 1F:4E69
.db $80,$72,$9D,$87,$05
Data1F4E6E:                         ; 1F:4E6E
.db $80,$B1,$AC,$87,$01
Data1F4E73:                         ; 1F:4E73
.db $80,$72,$AC,$87,$0E

Code1F4E78:
    ld   hl,Data1F4EB1              ; 1F:4E78
    jp   Code1F4418                 ; 1F:4E7B
Code1F4E7E:
    call Sub1F6845                  ; 1F:4E7E
    ret  nz                         ; 1F:4E81
    call Sub1F6849                  ; 1F:4E82
    cp   $10                        ; 1F:4E85
    jp   z,Code1F444B               ; 1F:4E87
    ld   hl,DataPtrs1F4E93          ; 1F:4E8A
    call Sub1F6838                  ; 1F:4E8D
    jp   Sub1F684D                  ; 1F:4E90

DataPtrs1F4E93:                     ; 1F:4E93
.dw Data1F4EB7, Data1F4EBD, Data1F4EC3, Data1F4EC9,\
    Data1F4EB7, Data1F4EBD, Data1F4EC3, Data1F4EC9,\
    Data1F4ECF, Data1F4EBD, Data1F4EC3, Data1F4EC9,\
    Data1F4ECF, Data1F4ED5, Data1F4EDB
Data1F4EB1:                         ; 1F:4EB1
.db $08,$BC,$C8,$59,$C7,$02
Data1F4EB7:                         ; 1F:4EB7
.db $08,$BC,$C8,$6B,$C7,$02
Data1F4EBD:                         ; 1F:4EBD
.db $08,$BC,$C8,$7B,$C7,$02
Data1F4EC3:                         ; 1F:4EC3
.db $08,$BC,$C8,$83,$C7,$02
Data1F4EC9:                         ; 1F:4EC9
.db $08,$BC,$C8,$90,$C7,$02
Data1F4ECF:                         ; 1F:4ECF
.db $08,$BC,$C8,$9D,$C7,$02
Data1F4ED5:                         ; 1F:4ED5
.db $08,$BC,$C8,$A2,$C7,$02
Data1F4EDB:                         ; 1F:4EDB
.db $08,$80,$C1,$AC,$87,$0F

Code1F4EE1:
    ld   hl,Data1F4F0C              ; 1F:4EE1
    jp   Code1F4418                 ; 1F:4EE4
Code1F4EE7:
    call Sub1F6845                  ; 1F:4EE7
    ret  nz                         ; 1F:4EEA
    call Sub1F6849                  ; 1F:4EEB
    cp   $09                        ; 1F:4EEE
    jp   z,Code1F444B               ; 1F:4EF0
    ld   hl,DataPtrs1F4EFC          ; 1F:4EF3
    call Sub1F6838                  ; 1F:4EF6
    jp   Sub1F684D                  ; 1F:4EF9

DataPtrs1F4EFC:                     ; 1F:4EFC
.dw Data1F4F12, Data1F4F18, Data1F4F1E, Data1F4F24,\
    Data1F4F2A, Data1F4F30, Data1F4F36, Data1F4F3C
Data1F4F0C:                         ; 1F:4F0C
.db $37,$A8,$D8,$D6,$C6,$02
Data1F4F12:                         ; 1F:4F12
.db $37,$70,$D8,$D6,$C6,$06
Data1F4F18:                         ; 1F:4F18
.db $2F,$74,$C2,$44,$C7,$06
Data1F4F1E:                         ; 1F:4F1E
.db $2F,$74,$A2,$44,$C7,$06
Data1F4F24:                         ; 1F:4F24
.db $2F,$74,$82,$44,$C7,$06
Data1F4F2A:                         ; 1F:4F2A
.db $2F,$74,$62,$44,$C7,$06
Data1F4F30:                         ; 1F:4F30
.db $2F,$74,$52,$44,$C7,$06
Data1F4F36:                         ; 1F:4F36
.db $2F,$74,$42,$44,$C7,$06
Data1F4F3C:                         ; 1F:4F3C
.db $2F,$74,$22,$44,$C7,$06

Code1F4F42:
    ld   hl,Data1F4F67              ; 1F:4F42
    jp   Code1F4418                 ; 1F:4F45
Code1F4F48:
    call Sub1F6845                  ; 1F:4F48
    ret  nz                         ; 1F:4F4B
    call Sub1F6849                  ; 1F:4F4C
    cp   $06                        ; 1F:4F4F
    jp   z,Code1F444B               ; 1F:4F51
    ld   hl,DataPtrs1F4F5D          ; 1F:4F54
    call Sub1F6838                  ; 1F:4F57
    jp   Sub1F684D                  ; 1F:4F5A

DataPtrs1F4F5D:                     ; 1F:4F5D
.dw Data1F4F6D, Data1F4F73, Data1F4F79, Data1F4F7F,\
    Data1F4F85
Data1F4F67:                         ; 1F:4F67
.db $37,$A8,$98,$D6,$C6,$02
Data1F4F6D:                         ; 1F:4F6D
.db $37,$74,$98,$D6,$C6,$05
Data1F4F73:                         ; 1F:4F73
.db $2F,$74,$82,$39,$C7,$06
Data1F4F79:                         ; 1F:4F79
.db $2F,$74,$62,$39,$C7,$06
Data1F4F7F:                         ; 1F:4F7F
.db $2F,$74,$42,$39,$C7,$06
Data1F4F85:                         ; 1F:4F85
.db $2F,$74,$22,$39,$C7,$06

Code1F4F8B:
    ld   hl,Data1F4FB6              ; 1F:4F8B
    jp   Code1F4418                 ; 1F:4F8E
Code1F4F91:
    call Sub1F6845                  ; 1F:4F91
    ret  nz                         ; 1F:4F94
    call Sub1F6849                  ; 1F:4F95
    cp   $09                        ; 1F:4F98
    jp   z,Code1F444B               ; 1F:4F9A
    ld   hl,DataPtrs1F4FA6          ; 1F:4F9D
    call Sub1F6838                  ; 1F:4FA0
    jp   Sub1F684D                  ; 1F:4FA3

DataPtrs1F4FA6:                     ; 1F:4FA6
.dw Data1F4FBC, Data1F4FC2, Data1F4FC8, Data1F4FCE,\
    Data1F4FD4, Data1F4FDA, Data1F4FE0, Data1F4FE6
Data1F4FB6:                         ; 1F:4FB6
.db $36,$A8,$F8,$42,$C6,$02
Data1F4FBC:                         ; 1F:4FBC
.db $36,$70,$F8,$42,$C6,$06
Data1F4FC2:                         ; 1F:4FC2
.db $2E,$74,$E2,$E7,$C6,$06
Data1F4FC8:                         ; 1F:4FC8
.db $2E,$74,$C2,$E7,$C6,$06
Data1F4FCE:                         ; 1F:4FCE
.db $2E,$74,$A2,$E7,$C6,$06
Data1F4FD4:                         ; 1F:4FD4
.db $2E,$74,$82,$E7,$C6,$06
Data1F4FDA:                         ; 1F:4FDA
.db $2E,$74,$62,$E7,$C6,$06
Data1F4FE0:                         ; 1F:4FE0
.db $2E,$74,$52,$E7,$C6,$06
Data1F4FE6:                         ; 1F:4FE6
.db $2E,$74,$22,$E7,$C6,$06

Code1F4FEC:
    ld   hl,Data1F5011              ; 1F:4FEC
    jp   Code1F4418                 ; 1F:4FEF
Code1F4FF2:
    call Sub1F6845                  ; 1F:4FF2
    ret  nz                         ; 1F:4FF5
    call Sub1F6849                  ; 1F:4FF6
    cp   $06                        ; 1F:4FF9
    jp   z,Code1F444B               ; 1F:4FFB
    ld   hl,DataPtrs1F5007          ; 1F:4FFE
    call Sub1F6838                  ; 1F:5001
    jp   Sub1F684D                  ; 1F:5004

DataPtrs1F5007:                     ; 1F:5007
.dw Data1F5017, Data1F501D, Data1F5023, Data1F5029,\
    Data1F502F
Data1F5011:                         ; 1F:5011
.db $36,$A8,$B8,$42,$C6,$02
Data1F5017:                         ; 1F:5017
.db $36,$74,$B8,$42,$C6,$05
Data1F501D:                         ; 1F:501D
.db $2E,$74,$A2,$D6,$C6,$06
Data1F5023:                         ; 1F:5023
.db $2E,$74,$82,$D6,$C6,$06
Data1F5029:                         ; 1F:5029
.db $2E,$74,$62,$D6,$C6,$06
Data1F502F:                         ; 1F:502F
.db $2E,$74,$42,$D6,$C6,$06

Code1F5035:
    ld   hl,Data1F5058              ; 1F:5035
    jp   Code1F4418                 ; 1F:5038
Code1F503B:
    call Sub1F6845                  ; 1F:503B
    ret  nz                         ; 1F:503E
    call Sub1F6849                  ; 1F:503F
    cp   $05                        ; 1F:5042
    jp   z,Code1F444B               ; 1F:5044
    ld   hl,DataPtrs1F5050          ; 1F:5047
    call Sub1F6838                  ; 1F:504A
    jp   Sub1F684D                  ; 1F:504D

DataPtrs1F5050:                     ; 1F:5050
.dw Data1F505E, Data1F5064, Data1F506A, Data1F5070
Data1F5058:                         ; 1F:5058
.db $36,$A8,$F8,$63,$C4,$02
Data1F505E:                         ; 1F:505E
.db $36,$74,$C8,$42,$C6,$04
Data1F5064:                         ; 1F:5064
.db $2E,$74,$B2,$D6,$C6,$05
Data1F506A:                         ; 1F:506A
.db $2E,$74,$92,$D6,$C6,$05
Data1F5070:                         ; 1F:5070
.db $2E,$74,$72,$D6,$C6,$05

Code1F5076:
    ld   a,[$DE69]                  ; 1F:5076
    cp   $22                        ; 1F:5079
    ret  z                          ; 1F:507B
    ld   hl,Data1F5094              ; 1F:507C
    jp   Code1F4418                 ; 1F:507F
Code1F5082:
    call Sub1F6845                  ; 1F:5082
    ret  nz                         ; 1F:5085
    call Sub1F6849                  ; 1F:5086
    cp   $02                        ; 1F:5089
    jp   z,Code1F444B               ; 1F:508B
    ld   hl,Data1F509A              ; 1F:508E
    jp   Sub1F684D                  ; 1F:5091

Data1F5094:                         ; 1F:5094
.db $08,$B4,$78,$59,$C7,$02
Data1F509A:                         ; 1F:509A
.db $08,$80,$27,$59,$87,$0E

Code1F50A0:
    ld   a,$03                      ; 1F:50A0
    ld   [$DE70],a                  ; 1F:50A2
    ld   hl,Data1F50D2              ; 1F:50A5
    jp   Sub1F4413                  ; 1F:50A8
Code1F50AB:
    call Sub1F6845                  ; 1F:50AB
    ret  nz                         ; 1F:50AE
    call Sub1F6849                  ; 1F:50AF
    cp   $0A                        ; 1F:50B2
    jp   z,Code1F444B               ; 1F:50B4
    ld   hl,DataPtrs1F50C0          ; 1F:50B7
    call Sub1F6838                  ; 1F:50BA
    jp   Sub1F684D                  ; 1F:50BD

DataPtrs1F50C0:                     ; 1F:50C0
.dw Data1F50D8, Data1F50DE, Data1F50E4, Data1F50EA,\
    Data1F50F0, Data1F50F6, Data1F50FC, Data1F5102,\
    Data1F5108
Data1F50D2:                         ; 1F:50D2
.db $08,$B8,$A1,$83,$C7,$03
Data1F50D8:                         ; 1F:50D8
.db $08,$B8,$91,$AC,$C7,$03
Data1F50DE:                         ; 1F:50DE
.db $08,$B8,$A1,$9D,$C7,$03
Data1F50E4:                         ; 1F:50E4
.db $08,$B8,$B1,$BE,$C7,$03
Data1F50EA:                         ; 1F:50EA
.db $08,$B8,$C1,$AC,$C7,$03
Data1F50F0:                         ; 1F:50F0
.db $08,$B8,$A1,$C8,$C7,$03
Data1F50F6:                         ; 1F:50F6
.db $08,$B8,$91,$BE,$C7,$03
Data1F50FC:                         ; 1F:50FC
.db $08,$B8,$81,$D4,$C7,$03
Data1F5102:                         ; 1F:5102
.db $08,$B8,$61,$CB,$C7,$03
Data1F5108:                         ; 1F:5108
.db $08,$B8,$41,$DB,$C7,$03

Code1F510E:
    ld   hl,Data1F513B              ; 1F:510E
    jp   Code1F47D5                 ; 1F:5111
Code1F5114:
    call Sub1F6845                  ; 1F:5114
    ret  nz                         ; 1F:5117
    call Sub1F6849                  ; 1F:5118
    cp   $0A                        ; 1F:511B
    jp   z,Code1F47FB               ; 1F:511D
    ld   hl,DataPtrs1F5129          ; 1F:5120
    call Sub1F6838                  ; 1F:5123
    jp   Sub1F6856                  ; 1F:5126

DataPtrs1F5129:                     ; 1F:5129
.dw Data1F5140, Data1F5145, Data1F514A, Data1F514F,\
    Data1F5154, Data1F5159, Data1F515E, Data1F5163,\
    Data1F5168
Data1F513B:                         ; 1F:513B
.db $90,$47,$83,$C7,$08
Data1F5140:                         ; 1F:5140
.db $A0,$38,$AC,$C7,$03
Data1F5145:                         ; 1F:5145
.db $A0,$48,$9D,$C7,$03
Data1F514A:                         ; 1F:514A
.db $A0,$58,$BE,$C7,$03
Data1F514F:                         ; 1F:514F
.db $A0,$68,$AC,$C7,$03
Data1F5154:                         ; 1F:5154
.db $A0,$58,$C8,$C7,$03
Data1F5159:                         ; 1F:5159
.db $A0,$48,$BE,$C7,$03
Data1F515E:                         ; 1F:515E
.db $A0,$38,$D4,$C7,$03
Data1F5163:                         ; 1F:5163
.db $A0,$28,$C8,$C7,$03
Data1F5168:                         ; 1F:5168
.db $A0,$18,$DB,$C7,$03

Code1F516D:
    ld   a,$40                      ; 1F:516D
    ld   [$DE78],a                  ; 1F:516F
    ld   hl,Data1F51A7              ; 1F:5172
    jp   Code1F4418                 ; 1F:5175
Code1F5178:
    call Sub1F6845                  ; 1F:5178
    ret  nz                         ; 1F:517B
    call Sub1F6849                  ; 1F:517C
    cp   $0E                        ; 1F:517F
    jp   z,Code1F444B               ; 1F:5181
    ld   hl,DataPtrs1F518D          ; 1F:5184
    call Sub1F6838                  ; 1F:5187
    jp   Code1F4192                 ; 1F:518A

DataPtrs1F518D:                     ; 1F:518D
.dw Data1F51AD, Data1F51B3, Data1F51B9, Data1F51BF,\
    Data1F51C5, Data1F51CB, Data1F51D1, Data1F51D7,\
    Data1F51DD, Data1F51E3, Data1F51E9, Data1F51EF,\
    Data1F51F5
Data1F51A7:                         ; 1F:51A7
.db $08,$80,$08,$2C,$80,$04
Data1F51AD:                         ; 1F:51AD
.db $1F,$A8,$A9,$59,$C7,$03
Data1F51B3:                         ; 1F:51B3
.db $08,$80,$77,$06,$87,$02
Data1F51B9:                         ; 1F:51B9
.db $00,$00,$00,$39,$07,$02
Data1F51BF:                         ; 1F:51BF
.db $00,$00,$00,$7B,$07,$02
Data1F51C5:                         ; 1F:51C5
.db $00,$00,$00,$59,$07,$02
Data1F51CB:                         ; 1F:51CB
.db $00,$00,$00,$39,$07,$02
Data1F51D1:                         ; 1F:51D1
.db $00,$00,$00,$59,$07,$02
Data1F51D7:                         ; 1F:51D7
.db $00,$00,$00,$90,$07,$02
Data1F51DD:                         ; 1F:51DD
.db $00,$00,$00,$7B,$07,$02
Data1F51E3:                         ; 1F:51E3
.db $00,$00,$00,$59,$07,$02
Data1F51E9:                         ; 1F:51E9
.db $00,$00,$00,$7B,$07,$02
Data1F51EF:                         ; 1F:51EF
.db $00,$00,$00,$90,$07,$02
Data1F51F5:                         ; 1F:51F5
.db $00,$00,$11,$90,$87,$01

Code1F51FB:
    ld   hl,Data1F5208              ; 1F:51FB
    jp   Code1F4777                 ; 1F:51FE
Code1F5201:
    call Sub1F6845                  ; 1F:5201
    ret  nz                         ; 1F:5204
    jp   Code1F4795                 ; 1F:5205

Data1F5208:                         ; 1F:5208
.db $38,$99,$27,$C0,$05

Code1F520D:
    ld   a,$3E                      ; 1F:520D
    ld   [$DE78],a                  ; 1F:520F
    ld   hl,Data1F4C86              ; 1F:5212
    jp   Code1F4418                 ; 1F:5215
Code1F5218:
    call Sub1F6845                  ; 1F:5218
    ret  nz                         ; 1F:521B
    call Sub1F6849                  ; 1F:521C
    cp   $0B                        ; 1F:521F
    jp   z,Code1F444B               ; 1F:5221
    ld   hl,DataPtrs1F4C54          ; 1F:5224
    call Sub1F6838                  ; 1F:5227
    jp   Sub1F684D                  ; 1F:522A
Code1F522D:
    ld   hl,Data1F5245              ; 1F:522D
    jp   Code1F4777                 ; 1F:5230
Code1F5233:
    call Sub1F6845                  ; 1F:5233
    ret  nz                         ; 1F:5236
    call Sub1F6849                  ; 1F:5237
    cp   $02                        ; 1F:523A
    jp   z,Code1F4795               ; 1F:523C
    ld   hl,Data1F524A              ; 1F:523F
    jp   Sub1F6868                  ; 1F:5242

Data1F5245:                         ; 1F:5245
.db $00,$71,$51,$80,$10
Data1F524A:                         ; 1F:524A
.db $00,$71,$51,$80,$09

Code1F524F:
    call Sub1F68FB                  ; 1F:524F
    ld   hl,Data1F5293              ; 1F:5252
    jp   Code1F4418                 ; 1F:5255
Code1F5258:
    call Sub1F6845                  ; 1F:5258
    ret  nz                         ; 1F:525B
    call Sub1F6849                  ; 1F:525C
    cp   $14                        ; 1F:525F
    jp   z,Code1F444B               ; 1F:5261
    ld   hl,DataPtrs1F526D          ; 1F:5264
    call Sub1F6838                  ; 1F:5267
    jp   Code1F4192                 ; 1F:526A

DataPtrs1F526D:                     ; 1F:526D
.dw Data1F5299, Data1F529F, Data1F52A5, Data1F52AB,\
    Data1F52B1, Data1F52B7, Data1F52BD, Data1F52C3,\
    Data1F52C9, Data1F52CF, Data1F52D5, Data1F52DB,\
    Data1F52E1, Data1F52E7, Data1F52ED, Data1F52F3,\
    Data1F52F9, Data1F52FF, Data1F5305
Data1F5293:                         ; 1F:5293
.db $17,$A0,$D2,$ED,$C5,$0C
Data1F5299:                         ; 1F:5299
.db $17,$A0,$D2,$CE,$C5,$0D
Data1F529F:                         ; 1F:529F
.db $17,$A0,$D2,$AC,$C5,$0E
Data1F52A5:                         ; 1F:52A5
.db $17,$A0,$D2,$89,$C5,$0F
Data1F52AB:                         ; 1F:52AB
.db $57,$80,$D6,$63,$C5,$0E
Data1F52B1:                         ; 1F:52B1
.db $1F,$A4,$A6,$AC,$C5,$06
Data1F52B7:                         ; 1F:52B7
.db $16,$A4,$A6,$63,$C5,$06
Data1F52BD:                         ; 1F:52BD
.db $1E,$A4,$96,$0A,$C6,$06
Data1F52C3:                         ; 1F:52C3
.db $16,$A4,$96,$63,$C5,$06
Data1F52C9:                         ; 1F:52C9
.db $1E,$A4,$86,$0A,$C6,$06
Data1F52CF:                         ; 1F:52CF
.db $16,$A4,$86,$63,$C5,$06
Data1F52D5:                         ; 1F:52D5
.db $1E,$A4,$76,$0A,$C6,$06
Data1F52DB:                         ; 1F:52DB
.db $16,$A4,$76,$63,$C5,$06
Data1F52E1:                         ; 1F:52E1
.db $1E,$A4,$66,$0A,$C6,$06
Data1F52E7:                         ; 1F:52E7
.db $16,$A4,$66,$63,$C5,$06
Data1F52ED:                         ; 1F:52ED
.db $1E,$A4,$56,$0A,$C6,$06
Data1F52F3:                         ; 1F:52F3
.db $16,$A4,$46,$63,$C5,$06
Data1F52F9:                         ; 1F:52F9
.db $1E,$A4,$36,$0A,$C6,$06
Data1F52FF:                         ; 1F:52FF
.db $16,$A4,$26,$63,$C5,$06
Data1F5305:                         ; 1F:5305
.db $1E,$A4,$16,$0A,$C6,$06

Code1F530B:
    ld   hl,Data1F532C              ; 1F:530B
    jp   Code1F4418                 ; 1F:530E
Code1F5311:
    call Sub1F6845                  ; 1F:5311
    ret  nz                         ; 1F:5314
    call Sub1F6849                  ; 1F:5315
    cp   $04                        ; 1F:5318
    jp   z,Code1F444B               ; 1F:531A
    ld   hl,DataPtrs1F5326          ; 1F:531D
    call Sub1F6838                  ; 1F:5320
    jp   Code1F4192                 ; 1F:5323

DataPtrs1F5326:                     ; 1F:5326
.dw Data1F5332, Data1F5338, Data1F533E
Data1F532C:                         ; 1F:532C
.db $08,$BD,$A1,$83,$C7,$02
Data1F5332:                         ; 1F:5332
.db $08,$80,$55,$83,$87,$01
Data1F5338:                         ; 1F:5338
.db $00,$80,$00,$9D,$07,$01
Data1F533E:                         ; 1F:533E
.db $00,$80,$00,$AC,$07,$1E

Code1F5344:
    ld   hl,Data1F537F              ; 1F:5344
    jp   Code1F4418                 ; 1F:5347
Code1F534A:
    call Sub1F6845                  ; 1F:534A
    ret  nz                         ; 1F:534D
    call Sub1F6849                  ; 1F:534E
    cp   $11                        ; 1F:5351
    jp   z,Code1F444B               ; 1F:5353
    ld   hl,DataPtrs1F535F          ; 1F:5356
    call Sub1F6838                  ; 1F:5359
    jp   Code1F4192                 ; 1F:535C

DataPtrs1F535F:                     ; 1F:535F
.dw Data1F5385, Data1F538B, Data1F5391, Data1F5397,\
    Data1F537F, Data1F5385, Data1F538B, Data1F5391,\
    Data1F5397, Data1F539D, Data1F53A3, Data1F53A9,\
    Data1F53AF, Data1F53B5, Data1F53BB, Data1F53C1
Data1F537F:                         ; 1F:537F
.db $1E,$38,$99,$A2,$C7,$04
Data1F5385:                         ; 1F:5385
.db $1E,$38,$F9,$A4,$C7,$04
Data1F538B:                         ; 1F:538B
.db $1E,$38,$D9,$A2,$C7,$04
Data1F5391:                         ; 1F:5391
.db $1E,$38,$F9,$9D,$C7,$04
Data1F5397:                         ; 1F:5397
.db $1E,$38,$99,$97,$C7,$04
Data1F539D:                         ; 1F:539D
.db $1E,$38,$89,$90,$C7,$04
Data1F53A3:                         ; 1F:53A3
.db $1E,$38,$79,$59,$C7,$04
Data1F53A9:                         ; 1F:53A9
.db $1E,$38,$49,$59,$C7,$04
Data1F53AF:                         ; 1F:53AF
.db $1E,$38,$39,$59,$C7,$04
Data1F53B5:                         ; 1F:53B5
.db $1E,$38,$29,$59,$C7,$04
Data1F53BB:                         ; 1F:53BB
.db $1E,$38,$19,$59,$C7,$04
Data1F53C1:                         ; 1F:53C1
.db $1E,$3C,$19,$59,$C7,$04

Code1F53C7:
    ld   hl,Data1F53EA              ; 1F:53C7
    jp   Code1F4418                 ; 1F:53CA
Code1F53CD:
    call Sub1F6845                  ; 1F:53CD
    ret  nz                         ; 1F:53D0
    call Sub1F6849                  ; 1F:53D1
    cp   $05                        ; 1F:53D4
    jp   z,Sub1F4445                ; 1F:53D6
    ld   hl,DataPtrs1F53E2          ; 1F:53D9
    call Sub1F6838                  ; 1F:53DC
    jp   Code1F4192                 ; 1F:53DF

DataPtrs1F53E2:                     ; 1F:53E2
.dw Data1F53F0, Data1F53F6, Data1F53FC, Data1F5402
Data1F53EA:                         ; 1F:53EA
.db $08,$80,$44,$83,$87,$01
Data1F53F0:                         ; 1F:53F0
.db $00,$00,$00,$74,$07,$01
Data1F53F6:                         ; 1F:53F6
.db $00,$00,$00,$6B,$07,$01
Data1F53FC:                         ; 1F:53FC
.db $00,$00,$00,$BE,$07,$01
Data1F5402:                         ; 1F:5402
.db $00,$00,$00,$8A,$07,$01

Code1F5408:
    ld   hl,Data1F542B              ; 1F:5408
    jp   Code1F4418                 ; 1F:540B
Code1F540E:
    call Sub1F6845                  ; 1F:540E
    ret  nz                         ; 1F:5411
    call Sub1F6849                  ; 1F:5412
    cp   $05                        ; 1F:5415
    jp   z,Sub1F4445                ; 1F:5417
    ld   hl,DataPtrs1F5423          ; 1F:541A
    call Sub1F6838                  ; 1F:541D
    jp   Code1F4192                 ; 1F:5420

DataPtrs1F5423:                     ; 1F:5423
.dw Data1F5431, Data1F5437, Data1F543D, Data1F5443
Data1F542B:                         ; 1F:542B
.db $08,$80,$44,$44,$87,$01
Data1F5431:                         ; 1F:5431
.db $00,$00,$00,$2D,$07,$01
Data1F5437:                         ; 1F:5437
.db $00,$00,$00,$21,$07,$01
Data1F543D:                         ; 1F:543D
.db $00,$00,$00,$39,$07,$01
Data1F5443:                         ; 1F:5443
.db $00,$00,$00,$4F,$07,$01

Code1F5449:
    call Sub1F68FB                  ; 1F:5449
    ld   a,$04                      ; 1F:544C
    ld   [$DE70],a                  ; 1F:544E
    ld   hl,Data1F54A4              ; 1F:5451
    jp   Sub1F4413                  ; 1F:5454
Code1F5457:
    call Sub1F6845                  ; 1F:5457
    ret  nz                         ; 1F:545A
    call Sub1F6849                  ; 1F:545B
    cp   $1D                        ; 1F:545E
    jp   z,Code1F444B               ; 1F:5460
    ld   hl,DataPtrs1F546C          ; 1F:5463
    call Sub1F6838                  ; 1F:5466
    jp   Sub1F684D                  ; 1F:5469

DataPtrs1F546C:                     ; 1F:546C
.dw Data1F54AA, Data1F54B0, Data1F54B6, Data1F54BC,\
    Data1F54C2, Data1F54C8, Data1F54CE, Data1F54D4,\
    Data1F54DA, Data1F54E0, Data1F54E6, Data1F54EC,\
    Data1F54F2, Data1F54F8, Data1F54FE, Data1F5504,\
    Data1F550A, Data1F5510, Data1F5516, Data1F551C,\
    Data1F5522, Data1F5528, Data1F552E, Data1F5534,\
    Data1F553A, Data1F5540, Data1F5546, Data1F554C
Data1F54A4:                         ; 1F:54A4
.db $08,$B4,$B1,$59,$C7,$02
Data1F54AA:                         ; 1F:54AA
.db $08,$B4,$B1,$7B,$C7,$02
Data1F54B0:                         ; 1F:54B0
.db $08,$B4,$B1,$90,$C7,$02
Data1F54B6:                         ; 1F:54B6
.db $08,$B4,$B1,$A2,$C7,$02
Data1F54BC:                         ; 1F:54BC
.db $08,$B4,$B1,$7B,$C7,$02
Data1F54C2:                         ; 1F:54C2
.db $08,$B4,$B1,$90,$C7,$02
Data1F54C8:                         ; 1F:54C8
.db $08,$B4,$B1,$A2,$C7,$02
Data1F54CE:                         ; 1F:54CE
.db $08,$B4,$B1,$B6,$C7,$02
Data1F54D4:                         ; 1F:54D4
.db $08,$B4,$B1,$90,$C7,$02
Data1F54DA:                         ; 1F:54DA
.db $08,$B4,$B1,$A2,$C7,$02
Data1F54E0:                         ; 1F:54E0
.db $08,$B4,$B1,$B6,$C7,$02
Data1F54E6:                         ; 1F:54E6
.db $08,$B4,$B1,$C1,$C7,$02
Data1F54EC:                         ; 1F:54EC
.db $08,$B4,$B1,$CE,$C7,$02
Data1F54F2:                         ; 1F:54F2
.db $08,$B4,$81,$A2,$C7,$02
Data1F54F8:                         ; 1F:54F8
.db $08,$B4,$81,$B6,$C7,$02
Data1F54FE:                         ; 1F:54FE
.db $08,$B4,$81,$C1,$C7,$02
Data1F5504:                         ; 1F:5504
.db $08,$B4,$81,$CE,$C7,$02
Data1F550A:                         ; 1F:550A
.db $08,$B4,$61,$A2,$C7,$02
Data1F5510:                         ; 1F:5510
.db $08,$B4,$61,$B6,$C7,$02
Data1F5516:                         ; 1F:5516
.db $08,$B4,$61,$C1,$C7,$02
Data1F551C:                         ; 1F:551C
.db $08,$B4,$61,$CE,$C7,$02
Data1F5522:                         ; 1F:5522
.db $08,$B4,$41,$A2,$C7,$02
Data1F5528:                         ; 1F:5528
.db $08,$B4,$41,$B6,$C7,$02
Data1F552E:                         ; 1F:552E
.db $08,$B4,$41,$C1,$C7,$02
Data1F5534:                         ; 1F:5534
.db $08,$B4,$41,$CE,$C7,$02
Data1F553A:                         ; 1F:553A
.db $08,$B4,$21,$A2,$C7,$02
Data1F5540:                         ; 1F:5540
.db $08,$B4,$21,$B6,$C7,$02
Data1F5546:                         ; 1F:5546
.db $08,$B4,$21,$C1,$C7,$02
Data1F554C:                         ; 1F:554C
.db $08,$B4,$21,$CE,$C7,$02

Code1F5552:
    ld   hl,Data1F55A5              ; 1F:5552
    jp   Code1F47D5                 ; 1F:5555
Code1F5558:
    call Sub1F6845                  ; 1F:5558
    ret  nz                         ; 1F:555B
    call Sub1F6849                  ; 1F:555C
    cp   $1D                        ; 1F:555F
    jp   z,Code1F47FB               ; 1F:5561
    ld   hl,DataPtrs1F556D          ; 1F:5564
    call Sub1F6838                  ; 1F:5567
    jp   Sub1F6856                  ; 1F:556A

DataPtrs1F556D:                     ; 1F:556D
.dw Data1F55AA, Data1F55AF, Data1F55B4, Data1F55B9,\
    Data1F55BE, Data1F55C3, Data1F55C8, Data1F55CD,\
    Data1F55D2, Data1F55D7, Data1F55DC, Data1F55E1,\
    Data1F55E6, Data1F55EB, Data1F55F0, Data1F55F5,\
    Data1F55FA, Data1F55FF, Data1F5604, Data1F5609,\
    Data1F560E, Data1F5613, Data1F5618, Data1F561D,\
    Data1F5622, Data1F5627, Data1F562C, Data1F5631
Data1F55A5:                         ; 1F:55A5
.db $B4,$59,$59,$C7,$03
Data1F55AA:                         ; 1F:55AA
.db $B4,$59,$7B,$C7,$02
Data1F55AF:                         ; 1F:55AF
.db $B4,$59,$90,$C7,$02
Data1F55B4:                         ; 1F:55B4
.db $B4,$59,$A2,$C7,$02
Data1F55B9:                         ; 1F:55B9
.db $B4,$59,$7B,$C7,$02
Data1F55BE:                         ; 1F:55BE
.db $B4,$59,$90,$C7,$02
Data1F55C3:                         ; 1F:55C3
.db $B4,$59,$A2,$C7,$02
Data1F55C8:                         ; 1F:55C8
.db $B4,$59,$B6,$C7,$02
Data1F55CD:                         ; 1F:55CD
.db $B4,$59,$90,$C7,$02
Data1F55D2:                         ; 1F:55D2
.db $B4,$59,$A2,$C7,$02
Data1F55D7:                         ; 1F:55D7
.db $B4,$59,$B6,$C7,$02
Data1F55DC:                         ; 1F:55DC
.db $B4,$59,$C1,$C7,$02
Data1F55E1:                         ; 1F:55E1
.db $B4,$59,$CE,$C7,$02
Data1F55E6:                         ; 1F:55E6
.db $B4,$39,$A2,$C7,$02
Data1F55EB:                         ; 1F:55EB
.db $B4,$39,$B6,$C7,$02
Data1F55F0:                         ; 1F:55F0
.db $B4,$39,$C1,$C7,$02
Data1F55F5:                         ; 1F:55F5
.db $B4,$39,$CE,$C7,$02
Data1F55FA:                         ; 1F:55FA
.db $B4,$29,$A2,$C7,$02
Data1F55FF:                         ; 1F:55FF
.db $B4,$29,$B6,$C7,$02
Data1F5604:                         ; 1F:5604
.db $B4,$29,$C1,$C7,$02
Data1F5609:                         ; 1F:5609
.db $B4,$29,$CE,$C7,$02
Data1F560E:                         ; 1F:560E
.db $B4,$19,$A2,$C7,$02
Data1F5613:                         ; 1F:5613
.db $B4,$19,$B6,$C7,$02
Data1F5618:                         ; 1F:5618
.db $B4,$19,$C1,$C7,$02
Data1F561D:                         ; 1F:561D
.db $B4,$19,$CE,$C7,$02
Data1F5622:                         ; 1F:5622
.db $B4,$09,$A2,$C7,$02
Data1F5627:                         ; 1F:5627
.db $B4,$09,$B6,$C7,$02
Data1F562C:                         ; 1F:562C
.db $B4,$09,$C1,$C7,$02
Data1F5631:                         ; 1F:5631
.db $B4,$09,$CE,$C7,$02

Code1F5636:
    ld   a,[$DE70]                  ; 1F:5636
    cp   $25                        ; 1F:5639
    jp   z,Code1F444B               ; 1F:563B
    ld   hl,Data1F566D              ; 1F:563E
    call Sub1F6897                  ; 1F:5641
    jp   Code1F4418                 ; 1F:5644
Code1F5647:
    call Sub1F6845                  ; 1F:5647
    jr   nz,Code1F5664              ; 1F:564A
    call Sub1F6849                  ; 1F:564C
    cp   $02                        ; 1F:564F
    jp   z,Sub1F443B                ; 1F:5651
    ld   hl,DataPtrs1F5660          ; 1F:5654
    call Sub1F6838                  ; 1F:5657
    call Sub1F6897                  ; 1F:565A
    jp   Sub1F684D                  ; 1F:565D

DataPtrs1F5660:                     ; 1F:5660
.dw Data1F5673, Data1F5679

Code1F5664:
    ld   a,[bc]                     ; 1F:5664
    and  a                          ; 1F:5665
    ret  z                          ; 1F:5666
    ld   hl,$0007                   ; 1F:5667
    jp   Code1F4ABC                 ; 1F:566A

Data1F566D:                         ; 1F:566D
.db $08,$A4,$59,$06,$C7,$05
Data1F5673:                         ; 1F:5673
.db $08,$80,$92,$06,$87,$0C
Data1F5679:                         ; 1F:5679
.db $08,$80,$27,$83,$87,$04

Code1F567F:
    ld   hl,Data1F56D2              ; 1F:567F
    jp   Code1F4418                 ; 1F:5682
Code1F5685:
    call Sub1F6845                  ; 1F:5685
    ret  nz                         ; 1F:5688
    call Sub1F6849                  ; 1F:5689
    cp   $1D                        ; 1F:568C
    jp   z,Code1F444B               ; 1F:568E
    ld   hl,DataPtrs1F569A          ; 1F:5691
    call Sub1F6838                  ; 1F:5694
    jp   Code1F4192                 ; 1F:5697

DataPtrs1F569A:                     ; 1F:569A
.dw Data1F56D8, Data1F56DE, Data1F56E4, Data1F56EA,\
    Data1F56D2, Data1F56D8, Data1F56DE, Data1F56E4,\
    Data1F56EA, Data1F56F0, Data1F56F6, Data1F56FC,\
    Data1F5702, Data1F5708, Data1F570E, Data1F5714,\
    Data1F571A, Data1F5720, Data1F5726, Data1F572C,\
    Data1F5732, Data1F5738, Data1F573E, Data1F5744,\
    Data1F574A, Data1F5750, Data1F5756, Data1F575C
Data1F56D2:                         ; 1F:56D2
.db $08,$00,$1A,$9D,$87,$02
Data1F56D8:                         ; 1F:56D8
.db $00,$00,$00,$90,$07,$02
Data1F56DE:                         ; 1F:56DE
.db $00,$00,$00,$83,$07,$02
Data1F56E4:                         ; 1F:56E4
.db $00,$00,$00,$8A,$07,$02
Data1F56EA:                         ; 1F:56EA
.db $00,$00,$00,$90,$07,$02
Data1F56F0:                         ; 1F:56F0
.db $00,$00,$00,$83,$07,$02
Data1F56F6:                         ; 1F:56F6
.db $00,$00,$00,$74,$07,$02
Data1F56FC:                         ; 1F:56FC
.db $00,$00,$00,$7B,$07,$02
Data1F5702:                         ; 1F:5702
.db $00,$00,$82,$83,$87,$02
Data1F5708:                         ; 1F:5708
.db $00,$00,$00,$74,$07,$02
Data1F570E:                         ; 1F:570E
.db $00,$00,$00,$62,$07,$02
Data1F5714:                         ; 1F:5714
.db $00,$00,$00,$39,$07,$02
Data1F571A:                         ; 1F:571A
.db $00,$00,$00,$74,$07,$02
Data1F5720:                         ; 1F:5720
.db $00,$00,$00,$59,$07,$02
Data1F5726:                         ; 1F:5726
.db $00,$00,$00,$39,$07,$02
Data1F572C:                         ; 1F:572C
.db $00,$00,$00,$14,$07,$02
Data1F5732:                         ; 1F:5732
.db $00,$00,$42,$74,$87,$02
Data1F5738:                         ; 1F:5738
.db $00,$00,$00,$59,$07,$02
Data1F573E:                         ; 1F:573E
.db $00,$00,$00,$39,$07,$02
Data1F5744:                         ; 1F:5744
.db $00,$00,$00,$14,$07,$02
Data1F574A:                         ; 1F:574A
.db $00,$00,$22,$74,$87,$02
Data1F5750:                         ; 1F:5750
.db $00,$00,$00,$59,$07,$02
Data1F5756:                         ; 1F:5756
.db $00,$00,$00,$39,$07,$02
Data1F575C:                         ; 1F:575C
.db $00,$00,$00,$14,$07,$02

Code1F5762:
    ld   hl,Data1F577A              ; 1F:5762
    jp   Code1F47D5                 ; 1F:5765
Code1F5768:
    call Sub1F6845                  ; 1F:5768
    ret  nz                         ; 1F:576B
    call Sub1F6849                  ; 1F:576C
    cp   $02                        ; 1F:576F
    jp   z,Code1F47FB               ; 1F:5771
    ld   hl,Data1F577F              ; 1F:5774
    jp   Code1F447B                 ; 1F:5777

Data1F577A:                         ; 1F:577A
.db $80,$B4,$7B,$87,$05
Data1F577F:                         ; 1F:577F
.db $9D,$07,$30

Code1F5782:
    ld   a,[$DE61]                  ; 1F:5782
    cp   $77                        ; 1F:5785
    call z,Sub1F443B                ; 1F:5787
    ld   hl,Data1F57EF              ; 1F:578A
    jp   Code1F47D5                 ; 1F:578D
Code1F5790:
    call Sub1F6845                  ; 1F:5790
    ret  nz                         ; 1F:5793
    call Sub1F6849                  ; 1F:5794
    cp   $26                        ; 1F:5797
    jp   z,Sub1F47F5                ; 1F:5799
    ld   hl,DataPtrs1F57A5          ; 1F:579C
    call Sub1F6838                  ; 1F:579F
    jp   Sub1F6856                  ; 1F:57A2

DataPtrs1F57A5:                     ; 1F:57A5
.dw Data1F57F4, Data1F57F9, Data1F57FE, Data1F57EF,\
    Data1F57F4, Data1F57F9, Data1F57FE, Data1F5803,\
    Data1F5808, Data1F580D, Data1F5812, Data1F5817,\
    Data1F57EF, Data1F57F4, Data1F57F9, Data1F57FE,\
    Data1F57EF, Data1F57F4, Data1F57F9, Data1F57FE,\
    Data1F5803, Data1F5808, Data1F580D, Data1F5812,\
    Data1F5817, Data1F57EF, Data1F57F4, Data1F57F9,\
    Data1F57FE, Data1F57EF, Data1F57F4, Data1F57F9,\
    Data1F57FE, Data1F5803, Data1F5808, Data1F580D,\
    Data1F5812
Data1F57EF:                         ; 1F:57EF
.db $80,$B8,$9D,$87,$01
Data1F57F4:                         ; 1F:57F4
.db $80,$B8,$6B,$87,$01
Data1F57F9:                         ; 1F:57F9
.db $80,$B8,$21,$87,$01
Data1F57FE:                         ; 1F:57FE
.db $80,$B8,$B2,$86,$01
Data1F5803:                         ; 1F:5803
.db $80,$B8,$0A,$86,$01
Data1F5808:                         ; 1F:5808
.db $80,$B8,$AC,$85,$01
Data1F580D:                         ; 1F:580D
.db $80,$B8,$E5,$84,$01
Data1F5812:                         ; 1F:5812
.db $80,$B8,$9B,$83,$01
Data1F5817:                         ; 1F:5817
.db $80,$11,$9B,$83,$04

Code1F581C:
    ld   hl,Data1F585A              ; 1F:581C
    jp   Code1F47D5                 ; 1F:581F
Code1F5822:
    call Sub1F6845                  ; 1F:5822
    ret  nz                         ; 1F:5825
    call Sub1F6849                  ; 1F:5826
    cp   $10                        ; 1F:5829
    jp   z,Sub1F47F5                ; 1F:582B
    ld   hl,DataPtrs1F5837          ; 1F:582E
    call Sub1F6838                  ; 1F:5831
    jp   Sub1F6856                  ; 1F:5834

DataPtrs1F5837:                     ; 1F:5837
.dw Data1F585A, Data1F586E, Data1F5873, Data1F585F,\
    Data1F585F, Data1F5873, Data1F5878, Data1F5864,\
    Data1F5864, Data1F5878, Data1F587D, Data1F5869,\
    Data1F5869, Data1F587D, Data1F5882

.db $80,$08,$00,$86,$02
Data1F585A:                         ; 1F:585A
.db $80,$C8,$0A,$86,$02
Data1F585F:                         ; 1F:585F
.db $80,$C8,$27,$86,$02
Data1F5864:                         ; 1F:5864
.db $80,$C8,$42,$86,$02
Data1F5869:                         ; 1F:5869
.db $80,$C8,$5B,$86,$02
Data1F586E:                         ; 1F:586E
.db $80,$C8,$B2,$86,$02
Data1F5873:                         ; 1F:5873
.db $80,$C8,$C4,$86,$02
Data1F5878:                         ; 1F:5878
.db $80,$C8,$D6,$86,$02
Data1F587D:                         ; 1F:587D
.db $80,$C8,$E7,$86,$02
Data1F5882:                         ; 1F:5882
.db $80,$C8,$F7,$86,$02
Data1F5887:                         ; 1F:5887
.db $80,$C8,$72,$86,$02
Data1F588C:                         ; 1F:588C
.db $80,$C8,$89,$86,$02
Data1F5891:                         ; 1F:5891
.db $80,$C8,$9E,$86,$02
Data1F5896:                         ; 1F:5896
.db $80,$C8,$B2,$86,$02
Data1F589B:                         ; 1F:589B
.db $80,$C8,$06,$87,$02
Data1F58A0:                         ; 1F:58A0
.db $80,$C8,$14,$87,$02
Data1F58A5:                         ; 1F:58A5
.db $80,$C8,$21,$87,$02
Data1F58AA:                         ; 1F:58AA
.db $80,$C8,$2D,$87,$02

Code1F58AF:
    ld   hl,Data1F585A              ; 1F:58AF
    jp   Code1F47D5                 ; 1F:58B2
Code1F58B5:
    call Sub1F6845                  ; 1F:58B5
    ret  nz                         ; 1F:58B8
    call Sub1F6849                  ; 1F:58B9
    cp   $20                        ; 1F:58BC
    jp   z,Sub1F47F5                ; 1F:58BE
    ld   hl,DataPtrs1F58CA          ; 1F:58C1
    call Sub1F6838                  ; 1F:58C4
    jp   Sub1F6856                  ; 1F:58C7

DataPtrs1F58CA:                     ; 1F:58CA
.dw Data1F585A, Data1F586E, Data1F5873, Data1F585F,\
    Data1F585F, Data1F5873, Data1F5878, Data1F5864,\
    Data1F5864, Data1F5878, Data1F587D, Data1F5869,\
    Data1F5869, Data1F587D, Data1F5882, Data1F5887,\
    Data1F5887, Data1F5882, Data1F589B, Data1F588C,\
    Data1F588C, Data1F589B, Data1F58A0, Data1F5891,\
    Data1F5891, Data1F58A0, Data1F58A5, Data1F5896,\
    Data1F5896, Data1F58A5, Data1F58AA

Code1F5908:
    ld   hl,Data1F595F              ; 1F:5908
    jp   Code1F47D5                 ; 1F:590B
Code1F590E:
    call Sub1F6845                  ; 1F:590E
    jp   z,Sub1F47F5                ; 1F:5911
    cpl                             ; 1F:5914
    add  $37                        ; 1F:5915
    srl  a                          ; 1F:5917
    ret  c                          ; 1F:5919
    ld   hl,Data1F592B              ; 1F:591A
    call Sub1F6838                  ; 1F:591D
    ld   a,l                        ; 1F:5920
    ldh  [<NR23],a                  ; 1F:5921
    ld   a,h                        ; 1F:5923
    ldh  [<NR24],a                  ; 1F:5924
    ld   a,$40                      ; 1F:5926
    ldh  [<NR21],a                  ; 1F:5928
    ret                             ; 1F:592A

Data1F592B:                         ; 1F:592B
.db $B2,$06,$06,$07,$39,$07,$59,$07,\
    $83,$07,$59,$07,$C4,$06,$06,$07,\
    $2D,$07,$62,$07,$2D,$07,$62,$07,\
    $83,$07,$97,$07,$B1,$07,$97,$07,\
    $E7,$06,$21,$07,$44,$07,$74,$07,\
    $44,$07,$74,$07,$90,$07,$A2,$07,\
    $BA,$07,$A2,$07
Data1F595F:                         ; 1F:595F
.db $40,$E8,$06,$87,$36

Code1F5964:
    ld   hl,Data1F5989              ; 1F:5964
    jp   Code1F47D0                 ; 1F:5967
Code1F596A:
    call Sub1F6845                  ; 1F:596A
    ret  nz                         ; 1F:596D
    call Sub1F6849                  ; 1F:596E
    cp   $06                        ; 1F:5971
    jp   z,Code1F47FB               ; 1F:5973
    ld   hl,DataPtrs1F597F          ; 1F:5976
    call Sub1F6838                  ; 1F:5979
    jp   Sub1F6856                  ; 1F:597C

DataPtrs1F597F:                     ; 1F:597F
.dw Data1F598E, Data1F5993, Data1F5998, Data1F599D,\
    Data1F59A2
Data1F5989:                         ; 1F:5989
.db $98,$F1,$9D,$C7,$08
Data1F598E:                         ; 1F:598E
.db $98,$F1,$AC,$C7,$08
Data1F5993:                         ; 1F:5993
.db $98,$F1,$CE,$C7,$08
Data1F5998:                         ; 1F:5998
.db $98,$F1,$C1,$C7,$08
Data1F599D:                         ; 1F:599D
.db $98,$F1,$C8,$C7,$08
Data1F59A2:                         ; 1F:59A2
.db $98,$F1,$D6,$C7,$08

Code1F59A7:
    ld   hl,Data1F59CC              ; 1F:59A7
    jp   Code1F47D5                 ; 1F:59AA
Code1F59AD:
    call Sub1F6845                  ; 1F:59AD
    ret  nz                         ; 1F:59B0
    call Sub1F6849                  ; 1F:59B1
    cp   $06                        ; 1F:59B4
    jp   z,Code1F47FB               ; 1F:59B6
    ld   hl,DataPtrs1F59C2          ; 1F:59B9
    call Sub1F6838                  ; 1F:59BC
    jp   Sub1F6856                  ; 1F:59BF

DataPtrs1F59C2:                     ; 1F:59C2
.dw Data1F59D1, Data1F59D6, Data1F59DB, Data1F59E0,\
    Data1F59E5
Data1F59CC:                         ; 1F:59CC
.db $80,$A3,$9D,$87,$05
Data1F59D1:                         ; 1F:59D1
.db $80,$A3,$83,$87,$0C
Data1F59D6:                         ; 1F:59D6
.db $80,$63,$9D,$87,$05
Data1F59DB:                         ; 1F:59DB
.db $80,$63,$83,$87,$0C
Data1F59E0:                         ; 1F:59E0
.db $80,$43,$9D,$87,$05
Data1F59E5:                         ; 1F:59E5
.db $80,$43,$83,$87,$0C

Code1F59EA:
    ld   hl,Data1F5A18              ; 1F:59EA
    jp   Code1F47D5                 ; 1F:59ED
Code1F59F0:
    call Sub1F6845                  ; 1F:59F0
    jr   nz,Code1F5A06              ; 1F:59F3
    call Sub1F6849                  ; 1F:59F5
    cp   $03                        ; 1F:59F8
    jp   z,Sub1F47F5                ; 1F:59FA
    ld   hl,DataPtrs1F5A14          ; 1F:59FD
    call Sub1F6838                  ; 1F:5A00
    jp   Sub1F6856                  ; 1F:5A03
Code1F5A06:
    and  $01                        ; 1F:5A06
    jr   nz,Code1F5A0F              ; 1F:5A08
    ld   a,$12                      ; 1F:5A0A
    ldh  [<NR23],a                  ; 1F:5A0C
    ret                             ; 1F:5A0E
Code1F5A0F:
    ld   a,$9B                      ; 1F:5A0F
    ldh  [<NR23],a                  ; 1F:5A11
    ret                             ; 1F:5A13

DataPtrs1F5A14:                     ; 1F:5A14
.dw Data1F5A1D, Data1F5A22
Data1F5A18:                         ; 1F:5A18
.db $00,$FF,$12,$83,$06
Data1F5A1D:                         ; 1F:5A1D
.db $00,$11,$12,$83,$03
Data1F5A22:                         ; 1F:5A22
.db $00,$FF,$12,$83,$14

Code1F5A27:
    ld   hl,Data1F5A48              ; 1F:5A27
    jp   Code1F47D5                 ; 1F:5A2A
Code1F5A2D:
    call Sub1F6845                  ; 1F:5A2D
    ret  nz                         ; 1F:5A30
    call Sub1F6849                  ; 1F:5A31
    cp   $04                        ; 1F:5A34
    jp   z,Code1F47FB               ; 1F:5A36
    ld   hl,DataPtrs1F5A42          ; 1F:5A39
    call Sub1F6838                  ; 1F:5A3C
    jp   Sub1F6856                  ; 1F:5A3F

DataPtrs1F5A42:                     ; 1F:5A42
.dw Data1F5A4D, Data1F5A52, Data1F5A57
Data1F5A48:                         ; 1F:5A48
.db $80,$F1,$9D,$87,$06
Data1F5A4D:                         ; 1F:5A4D
.db $80,$F1,$83,$87,$06
Data1F5A52:                         ; 1F:5A52
.db $80,$F1,$9D,$87,$06
Data1F5A57:                         ; 1F:5A57
.db $80,$F1,$83,$87,$18

Code1F5A5C:
    ld   hl,Data1F5A9A              ; 1F:5A5C
    jp   Code1F4777                 ; 1F:5A5F
Code1F5A62:
    call Sub1F6845                  ; 1F:5A62
    ret  nz                         ; 1F:5A65
    call Sub1F6849                  ; 1F:5A66
    cp   $10                        ; 1F:5A69
    jp   z,Sub1F478F                ; 1F:5A6B
    ld   hl,DataPtrs1F5A77          ; 1F:5A6E
    call Sub1F6838                  ; 1F:5A71
    jp   Sub1F6868                  ; 1F:5A74

DataPtrs1F5A77:                     ; 1F:5A77
.dw Data1F5A9F, Data1F5AA4, Data1F5AA9, Data1F5AAE,\
    Data1F5AB3, Data1F5AB8, Data1F5ABD, Data1F5AC2,\
    Data1F5AC7, Data1F5ACC, Data1F5AD1, Data1F5AD6,\
    Data1F5ADB, Data1F5AE0, Data1F5AE5

.db $3B,$08,$00,$C0,$02
Data1F5A9A:                         ; 1F:5A9A
.db $3B,$F8,$37,$C0,$02
Data1F5A9F:                         ; 1F:5A9F
.db $3B,$F8,$15,$C0,$02
Data1F5AA4:                         ; 1F:5AA4
.db $3B,$F8,$45,$C0,$02
Data1F5AA9:                         ; 1F:5AA9
.db $3B,$F8,$24,$C0,$02
Data1F5AAE:                         ; 1F:5AAE
.db $3B,$F8,$45,$C0,$02
Data1F5AB3:                         ; 1F:5AB3
.db $3B,$E8,$01,$C0,$02
Data1F5AB8:                         ; 1F:5AB8
.db $3B,$C8,$26,$C0,$02
Data1F5ABD:                         ; 1F:5ABD
.db $3B,$C8,$27,$C0,$02
Data1F5AC2:                         ; 1F:5AC2
.db $3B,$B8,$55,$C0,$02
Data1F5AC7:                         ; 1F:5AC7
.db $3B,$B8,$37,$C0,$02
Data1F5ACC:                         ; 1F:5ACC
.db $3B,$A8,$15,$C0,$02
Data1F5AD1:                         ; 1F:5AD1
.db $3B,$98,$34,$C0,$02
Data1F5AD6:                         ; 1F:5AD6
.db $3B,$98,$45,$C0,$02
Data1F5ADB:                         ; 1F:5ADB
.db $3B,$88,$47,$C0,$02
Data1F5AE0:                         ; 1F:5AE0
.db $3B,$78,$47,$C0,$02
Data1F5AE5:                         ; 1F:5AE5
.db $3B,$78,$01,$C0,$02

Code1F5AEA:
    ld   hl,Data1F5B09              ; 1F:5AEA
    jp   Code1F4777                 ; 1F:5AED
Code1F5AF0:
    call Sub1F6845                  ; 1F:5AF0
    ret  nz                         ; 1F:5AF3
    call Sub1F6849                  ; 1F:5AF4
    cp   $03                        ; 1F:5AF7
    jp   z,Sub1F478F                ; 1F:5AF9
    ld   hl,DataPtrs1F5B05          ; 1F:5AFC
    call Sub1F6838                  ; 1F:5AFF
    jp   Sub1F6868                  ; 1F:5B02

DataPtrs1F5B05:                     ; 1F:5B05
.dw Data1F5B0E, Data1F5B13
Data1F5B09:                         ; 1F:5B09
.db $00,$AB,$65,$80,$12
Data1F5B0E:                         ; 1F:5B0E
.db $00,$F8,$65,$80,$12
Data1F5B13:                         ; 1F:5B13
.db $00,$E4,$75,$80,$26

Code1F5B18:
    ld   hl,Data1F5B25              ; 1F:5B18
    jp   Code1F4418                 ; 1F:5B1B
Code1F5B1E:
    call Sub1F6845                  ; 1F:5B1E
    ret  nz                         ; 1F:5B21
    jp   Code1F444B                 ; 1F:5B22

Data1F5B25:                         ; 1F:5B25
.db $3F,$40,$B2,$D6,$86,$14

Code1F5B2B:
    ld   hl,Data1F5B58              ; 1F:5B2B
    jp   Code1F4418                 ; 1F:5B2E
Code1F5B31:
    call Sub1F6845                  ; 1F:5B31
    ret  nz                         ; 1F:5B34
    call Sub1F6849                  ; 1F:5B35
    cp   $0A                        ; 1F:5B38
    jp   z,Code1F444B               ; 1F:5B3A
    ld   hl,DataPtrs1F5B46          ; 1F:5B3D
    call Sub1F6838                  ; 1F:5B40
    jp   Sub1F684D                  ; 1F:5B43

DataPtrs1F5B46:                     ; 1F:5B46
.dw Data1F5B76, Data1F5B5E, Data1F5B7C, Data1F5B64,\
    Data1F5B82, Data1F5B6A, Data1F5B88, Data1F5B70,\
    Data1F5B8E
Data1F5B58:                         ; 1F:5B58
.db $08,$80,$91,$E5,$84,$02
Data1F5B5E:                         ; 1F:5B5E
.db $08,$80,$91,$3B,$85,$02
Data1F5B64:                         ; 1F:5B64
.db $08,$80,$91,$89,$85,$02
Data1F5B6A:                         ; 1F:5B6A
.db $08,$80,$91,$CE,$85,$02
Data1F5B70:                         ; 1F:5B70
.db $08,$80,$91,$0A,$86,$02
Data1F5B76:                         ; 1F:5B76
.db $08,$80,$21,$E5,$84,$02
Data1F5B7C:                         ; 1F:5B7C
.db $08,$80,$21,$3B,$85,$02
Data1F5B82:                         ; 1F:5B82
.db $08,$80,$21,$89,$85,$02
Data1F5B88:                         ; 1F:5B88
.db $08,$80,$21,$CE,$85,$02
Data1F5B8E:                         ; 1F:5B8E
.db $08,$80,$21,$0A,$86,$02

Code1F5B94:
    ld   hl,Data1F5BF5              ; 1F:5B94
    jp   Code1F4418                 ; 1F:5B97
Code1F5B9A:
    call Sub1F6845                  ; 1F:5B9A
    ret  nz                         ; 1F:5B9D
    call Sub1F6849                  ; 1F:5B9E
    cp   $24                        ; 1F:5BA1
    jp   z,Sub1F4445                ; 1F:5BA3
    ld   hl,DataPtrs1F5BAF          ; 1F:5BA6
    call Sub1F6838                  ; 1F:5BA9
    jp   Code1F4471                 ; 1F:5BAC

DataPtrs1F5BAF:                     ; 1F:5BAF
.dw Data1F5BFE, Data1F5C01, Data1F5C04, Data1F5C07,\
    Data1F5C0A, Data1F5BFB, Data1F5BFE, Data1F5C01,\
    Data1F5C04, Data1F5C07, Data1F5C0A, Data1F5BFB,\
    Data1F5BFE, Data1F5C01, Data1F5C04, Data1F5C07,\
    Data1F5C0A, Data1F5BFB, Data1F5BFE, Data1F5C01,\
    Data1F5C04, Data1F5C07, Data1F5C0A, Data1F5BFB,\
    Data1F5BFE, Data1F5C01, Data1F5C04, Data1F5C07,\
    Data1F5C0A, Data1F5BFB, Data1F5BFE, Data1F5C01,\
    Data1F5C04, Data1F5C07, Data1F5C0A
Data1F5BF5:                         ; 1F:5BF5
.db $08,$80,$88,$83,$87,$01
Data1F5BFB:                         ; 1F:5BFB
.db $83,$07,$01
Data1F5BFE:                         ; 1F:5BFE
.db $8A,$07,$01
Data1F5C01:                         ; 1F:5C01
.db $90,$07,$01
Data1F5C04:                         ; 1F:5C04
.db $97,$07,$01
Data1F5C07:                         ; 1F:5C07
.db $90,$07,$01
Data1F5C0A:                         ; 1F:5C0A
.db $8A,$07,$01

Code1F5C0D:
    ld   hl,Data1F5C20              ; 1F:5C0D
    jp   Code1F4418                 ; 1F:5C10
Code1F5C13:
    call Sub1F6845                  ; 1F:5C13
    jp   z,Code1F444B               ; 1F:5C16
    cpl                             ; 1F:5C19
    inc  a                          ; 1F:5C1A
    add  $64                        ; 1F:5C1B
    ldh  [<NR13],a                  ; 1F:5C1D
    ret                             ; 1F:5C1F

Data1F5C20:                         ; 1F:5C20
.db $08,$40,$C2,$44,$87,$20

Code1F5C26:
    ld   hl,Data1F5C80              ; 1F:5C26
    jp   Sub1F4413                  ; 1F:5C29
Code1F5C2C:
    call Sub1F6845                  ; 1F:5C2C
    ret  nz                         ; 1F:5C2F
    call Sub1F6849                  ; 1F:5C30
    cp   $0E                        ; 1F:5C33
    jp   z,Code1F444B               ; 1F:5C35
    push af                         ; 1F:5C38
    ld   hl,Data1F5C66              ; 1F:5C39
    call Sub1F6838                  ; 1F:5C3C
    ld   a,l                        ; 1F:5C3F
    ldh  [<NR11],a                  ; 1F:5C40
    pop  af                         ; 1F:5C42
    ld   hl,DataPtrs1F5C4C          ; 1F:5C43
    call Sub1F6838                  ; 1F:5C46
    jp   Code1F4471                 ; 1F:5C49

DataPtrs1F5C4C:                     ; 1F:5C4C
.dw Data1F5C86, Data1F5C89, Data1F5C8C, Data1F5C89,\
    Data1F5C8C, Data1F5C89, Data1F5C8C, Data1F5C89,\
    Data1F5C8C, Data1F5C89, Data1F5C8C, Data1F5C89,\
    Data1F5C8C
Data1F5C66:                         ; 1F:5C66
.db $80,$00,$40,$00,$80,$00,$40,$00,\
    $80,$00,$40,$00,$80,$00,$40,$00,\
    $80,$00,$40,$00,$80,$00,$40,$00,\
    $80,$00
Data1F5C80:                         ; 1F:5C80
.db $08,$80,$A3,$7B,$87,$03
Data1F5C86:                         ; 1F:5C86
.db $9D,$07,$04
Data1F5C89:                         ; 1F:5C89
.db $9D,$07,$01
Data1F5C8C:                         ; 1F:5C8C
.db $9D,$07,$03

Code1F5C8F:
    ld   hl,Data1F5CC8              ; 1F:5C8F
    jp   Sub1F4413                  ; 1F:5C92
Code1F5C95:
    call Sub1F6845                  ; 1F:5C95
    ret  nz                         ; 1F:5C98
    call Sub1F6849                  ; 1F:5C99
    cp   $10                        ; 1F:5C9C
    jp   z,Sub1F443B                ; 1F:5C9E
    ld   hl,DataPtrs1F5CAA          ; 1F:5CA1
    call Sub1F6838                  ; 1F:5CA4
    jp   Code1F4471                 ; 1F:5CA7

DataPtrs1F5CAA:                     ; 1F:5CAA
.dw Data1F5CCE, Data1F5CD1, Data1F5CD4, Data1F5CD7,\
    Data1F5CDA, Data1F5CDD, Data1F5CE0, Data1F5CE3,\
    Data1F5CE6, Data1F5CE9, Data1F5CEC, Data1F5CEF,\
    Data1F5CF2, Data1F5CF5, Data1F5CF8
Data1F5CC8:                         ; 1F:5CC8
.db $08,$80,$A2,$72,$86,$01
Data1F5CCE:                         ; 1F:5CCE
.db $B2,$06,$01
Data1F5CD1:                         ; 1F:5CD1
.db $F7,$06,$01
Data1F5CD4:                         ; 1F:5CD4
.db $D6,$06,$01
Data1F5CD7:                         ; 1F:5CD7
.db $E7,$06,$01
Data1F5CDA:                         ; 1F:5CDA
.db $F7,$06,$01
Data1F5CDD:                         ; 1F:5CDD
.db $2D,$07,$01
Data1F5CE0:                         ; 1F:5CE0
.db $14,$07,$01
Data1F5CE3:                         ; 1F:5CE3
.db $21,$07,$01
Data1F5CE6:                         ; 1F:5CE6
.db $2D,$07,$01
Data1F5CE9:                         ; 1F:5CE9
.db $59,$07,$01
Data1F5CEC:                         ; 1F:5CEC
.db $44,$07,$01
Data1F5CEF:                         ; 1F:5CEF
.db $4F,$07,$01
Data1F5CF2:                         ; 1F:5CF2
.db $59,$07,$01
Data1F5CF5:                         ; 1F:5CF5
.db $7B,$07,$01
Data1F5CF8:                         ; 1F:5CF8
.db $6B,$07,$01

Code1F5CFB:
    ld   hl,Data1F5D5E              ; 1F:5CFB
    jp   Sub1F4413                  ; 1F:5CFE
Code1F5D01:
    call Sub1F6845                  ; 1F:5D01
    jp   z,Sub1F443B                ; 1F:5D04
    cpl                             ; 1F:5D07
    add  $1E                        ; 1F:5D08
    ld   d,$00                      ; 1F:5D0A
    cp   $0F                        ; 1F:5D0C
    jr   nz,Code1F5D18              ; 1F:5D0E
    ld   a,$82                      ; 1F:5D10
    ldh  [<NR12],a                  ; 1F:5D12
    ld   a,$15                      ; 1F:5D14
    ld   d,$80                      ; 1F:5D16
Code1F5D18:
    ld   hl,Data1F5D26              ; 1F:5D18
    call Sub1F6838                  ; 1F:5D1B
    ld   a,l                        ; 1F:5D1E
    ldh  [<NR13],a                  ; 1F:5D1F
    ld   a,h                        ; 1F:5D21
    or   d                          ; 1F:5D22
    ldh  [<NR14],a                  ; 1F:5D23
    ret                             ; 1F:5D25

Data1F5D26:                         ; 1F:5D26
.db $F7,$06,$C4,$06,$D6,$06,$F7,$06,\
    $D6,$06,$9E,$06,$B2,$06,$D6,$06,\
    $B2,$06,$72,$06,$89,$06,$B2,$06,\
    $89,$06,$42,$06,$5B,$06,$89,$06,\
    $5B,$06,$0A,$06,$27,$06,$5B,$06,\
    $27,$06,$CE,$05,$ED,$05,$27,$06,\
    $CE,$05,$63,$05,$AC,$05,$CE,$05
Data1F5D5E:                         ; 1F:5D5E
.db $08,$80,$A8,$06,$87,$1D

Code1F5D64:
    ld   hl,Data1F5E5F              ; 1F:5D64
    jp   Code1F440A                 ; 1F:5D67
Code1F5D6A:
    call Sub1F6845                  ; 1F:5D6A
    jp   z,Sub1F443B                ; 1F:5D6D
    cpl                             ; 1F:5D70
    add  $6A                        ; 1F:5D71
    ld   d,$00                      ; 1F:5D73
    cp   $61                        ; 1F:5D75
    jr   nz,Code1F5D81              ; 1F:5D77
    ld   a,$82                      ; 1F:5D79
    ldh  [<NR12],a                  ; 1F:5D7B
    ld   a,$61                      ; 1F:5D7D
    ld   d,$80                      ; 1F:5D7F
Code1F5D81:
    ld   hl,Data1F5D8F              ; 1F:5D81
    call Sub1F6838                  ; 1F:5D84
    ld   a,l                        ; 1F:5D87
    ldh  [<NR13],a                  ; 1F:5D88
    ld   a,h                        ; 1F:5D8A
    or   d                          ; 1F:5D8B
    ldh  [<NR14],a                  ; 1F:5D8C
    ret                             ; 1F:5D8E

Data1F5D8F:                         ; 1F:5D8F
.db $4F,$07,$2D,$07,$39,$07,$44,$07,\
    $2D,$07,$06,$07,$14,$07,$21,$07,\
    $06,$07,$D6,$06,$E7,$06,$F7,$06,\
    $D6,$06,$9E,$06,$B2,$06,$C4,$06,\
    $9E,$06,$5B,$06,$72,$06,$89,$06,\
    $5B,$06,$0A,$06,$27,$06,$42,$06,\
    $0A,$06,$AC,$05,$CE,$05,$ED,$05,\
    $AC,$05,$3B,$05,$63,$05,$AC,$05,\
    $89,$05,$ED,$05,$0A,$06,$42,$06,\
    $0A,$06,$CE,$05,$ED,$05,$0A,$06,\
    $CE,$05,$89,$05,$AC,$05,$CE,$05,\
    $89,$05,$3B,$05,$63,$05,$89,$05,\
    $3B,$05,$E5,$04,$11,$05,$3B,$05,\
    $E5,$04,$83,$04,$B5,$04,$E5,$04,\
    $83,$04,$16,$04,$4E,$04,$83,$04,\
    $16,$04,$9B,$03,$DA,$03,$83,$04,\
    $4E,$04,$E5,$04,$11,$05,$63,$05,\
    $3B,$05,$AC,$05,$CE,$05,$0A,$06,\
    $ED,$05,$42,$06,$5B,$06,$89,$06,\
    $72,$06,$B2,$06,$C4,$06,$E7,$06,\
    $D6,$06,$06,$07,$14,$07,$2D,$07,\
    $21,$07,$44,$07,$4F,$07,$62,$07,\
    $59,$07,$74,$07,$7B,$07,$8A,$07,\
    $83,$07,$97,$07,$9D,$07,$A7,$07,\
    $A2,$07,$B1,$07,$B6,$07,$BE,$07,\
    $BA,$07,$C5,$07,$C8,$07,$CE,$07
Data1F5E5F:                         ; 1F:5E5F
.db $08,$80,$A8,$59,$87,$69

Code1F5E65:
    ld   hl,Data1F5E7D              ; 1F:5E65
    jp   Code1F4418                 ; 1F:5E68
Code1F5E6B:
    call Sub1F6845                  ; 1F:5E6B
    ret  nz                         ; 1F:5E6E
    call Sub1F6849                  ; 1F:5E6F
    cp   $02                        ; 1F:5E72
    jp   z,Code1F444B               ; 1F:5E74
    ld   hl,Data1F5E83              ; 1F:5E77
    jp   Sub1F684D                  ; 1F:5E7A

Data1F5E7D:                         ; 1F:5E7D
.db $3F,$80,$58,$0A,$86,$05
Data1F5E83:                         ; 1F:5E83
.db $3F,$80,$83,$B2,$86,$17

Code1F5E89:
    ld   hl,Data1F5EC6              ; 1F:5E89
    jp   Sub1F4413                  ; 1F:5E8C
Code1F5E8F:
    call Sub1F6845                  ; 1F:5E8F
    ret  nz                         ; 1F:5E92
    call Sub1F6849                  ; 1F:5E93
    cp   $12                        ; 1F:5E96
    jp   z,Sub1F443B                ; 1F:5E98
    ld   hl,DataPtrs1F5EA4          ; 1F:5E9B
    call Sub1F6838                  ; 1F:5E9E
    jp   Sub1F684D                  ; 1F:5EA1

DataPtrs1F5EA4:                     ; 1F:5EA4
.dw Data1F5ECC, Data1F5ED2, Data1F5ED8, Data1F5EDE,\
    Data1F5EE4, Data1F5F0B, Data1F5EEA, Data1F5F11,\
    Data1F5EF0, Data1F5F17, Data1F5EF6, Data1F5F17,\
    Data1F5EFC, Data1F5F1D, Data1F5F02, Data1F5F1D,\
    Data1F5F08
Data1F5EC6:                         ; 1F:5EC6
.db $2C,$80,$A8,$06,$87,$08
Data1F5ECC:                         ; 1F:5ECC
.db $2C,$80,$A8,$E7,$86,$08
Data1F5ED2:                         ; 1F:5ED2
.db $2C,$80,$A8,$9E,$86,$08
Data1F5ED8:                         ; 1F:5ED8
.db $2C,$80,$A8,$5B,$86,$08
Data1F5EDE:                         ; 1F:5EDE
.db $2B,$80,$A8,$5B,$86,$08
Data1F5EE4:                         ; 1F:5EE4
.db $2B,$80,$A8,$0A,$86,$07
Data1F5EEA:                         ; 1F:5EEA
.db $2B,$80,$A8,$89,$85,$06
Data1F5EF0:                         ; 1F:5EF0
.db $2B,$80,$A8,$E5,$84,$05
Data1F5EF6:                         ; 1F:5EF6
.db $2B,$80,$A8,$E5,$84,$05
Data1F5EFC:                         ; 1F:5EFC
.db $2B,$80,$A4,$9B,$83,$04
Data1F5F02:                         ; 1F:5F02
.db $2B,$80,$82,$9B,$83,$04
Data1F5F08:                         ; 1F:5F08
.db $2B,$80,$42
Data1F5F0B:                         ; 1F:5F0B
.db $2B,$80,$11,$0A,$85,$01
Data1F5F11:                         ; 1F:5F11
.db $2B,$80,$11,$0A,$85,$02
Data1F5F17:                         ; 1F:5F17
.db $2B,$80,$11,$0A,$85,$03
Data1F5F1D:                         ; 1F:5F1D
.db $2B,$80,$11,$0A,$85,$04

Code1F5F23:
    ld   hl,Data1F5F9E              ; 1F:5F23
    jp   Sub1F4413                  ; 1F:5F26
Code1F5F29:
    call Sub1F6845                  ; 1F:5F29
    jp   z,Sub1F443B                ; 1F:5F2C
    cpl                             ; 1F:5F2F
    add  $29                        ; 1F:5F30
    ld   d,$00                      ; 1F:5F32
    cp   $16                        ; 1F:5F34
    call z,Sub1F5F47                ; 1F:5F36
    ld   hl,Data1F5F50              ; 1F:5F39
    call Sub1F6838                  ; 1F:5F3C
    ld   a,l                        ; 1F:5F3F
    ldh  [<NR13],a                  ; 1F:5F40
    ld   a,h                        ; 1F:5F42
    or   d                          ; 1F:5F43
    ldh  [<NR14],a                  ; 1F:5F44
    ret                             ; 1F:5F46

Sub1F5F47:
    ld   a,$92                      ; 1F:5F47
    ldh  [<NR12],a                  ; 1F:5F49
    ld   d,$80                      ; 1F:5F4B
    ld   a,$16                      ; 1F:5F4D
    ret                             ; 1F:5F4F

Data1F5F50:                         ; 1F:5F50
.db $83,$04,$42,$06,$42,$06,$83,$04,\
    $63,$05,$B2,$06,$B2,$06,$63,$05,\
    $0A,$06,$06,$07,$06,$07,$0A,$06,\
    $89,$06,$44,$07,$44,$07,$89,$06,\
    $E7,$06,$74,$07,$74,$07,$E7,$06,\
    $2D,$07,$97,$07,$97,$07,$2D,$07,\
    $62,$07,$B1,$07,$B1,$07,$62,$07,\
    $8A,$07,$C5,$07,$C5,$07,$8A,$07,\
    $A7,$07,$D4,$07,$D4,$07,$A7,$07,\
    $BE,$07,$DF,$07,$DF,$07
Data1F5F9E:                         ; 1F:5F9E
.db $08,$80,$A8,$56,$82,$28

Code1F5FA4:
    ld   hl,Data1F5FB1              ; 1F:5FA4
    jp   Sub1F4413                  ; 1F:5FA7
Code1F5FAA:
    call Sub1F6845                  ; 1F:5FAA
    ret  nz                         ; 1F:5FAD
    jp   Code1F444B                 ; 1F:5FAE

Data1F5FB1:                         ; 1F:5FB1
.db $08,$80,$A3,$B2,$86,$1C

Code1F5FB7:
    call Sub1F47F5                  ; 1F:5FB7
    call Sub1F478F                  ; 1F:5FBA
    ld   a,[$DE69]                  ; 1F:5FBD
    ld   [$DED1],a                  ; 1F:5FC0
    xor  a                          ; 1F:5FC3
    ld   [$DE69],a                  ; 1F:5FC4
    ld   [$DED2],a                  ; 1F:5FC7
    ldh  [<NR32],a                  ; 1F:5FCA
    jp   Sub1F443B                  ; 1F:5FCC
Code1F5FCF:
    jp   Code1F444B                 ; 1F:5FCF

.db $08
Data1F5FD3:                         ; 1F:5FD3
.db $80,$B3,$83,$87,$05,$08
Data1F5FD9:                         ; 1F:5FD9
.db $80,$B3,$59,$87,$05,$08
Data1F5FDF:                         ; 1F:5FDF
.db $80,$B3,$59,$87,$0A

Code1F5FE4:
    ld   a,[$DED1]                  ; 1F:5FE4
    ld   [$DE69],a                  ; 1F:5FE7
    jp   Code1F444B                 ; 1F:5FEA
Code1F5FED:
    jp   Code1F444B                 ; 1F:5FED
Code1F5FF0:
    ld   hl,Data1F604D              ; 1F:5FF0
    jp   Code1F440A                 ; 1F:5FF3
Code1F5FF6:
    call Sub1F6845                  ; 1F:5FF6
    jp   z,Sub1F4445                ; 1F:5FF9
    cpl                             ; 1F:5FFC
    add  $0E                        ; 1F:5FFD
    ld   d,a                        ; 1F:5FFF
    ld   hl,Data1F6035              ; 1F:6000
    call Sub1F6838                  ; 1F:6003
    ld   a,l                        ; 1F:6006
    ldh  [<NR12],a                  ; 1F:6007
    ld   a,$27                      ; 1F:6009
    ldh  [<NR10],a                  ; 1F:600B
    ld   a,d                        ; 1F:600D
    ld   hl,Data1F601D              ; 1F:600E
    call Sub1F6838                  ; 1F:6011
    ld   a,l                        ; 1F:6014
    ldh  [<NR13],a                  ; 1F:6015
    ld   a,h                        ; 1F:6017
    or   $80                        ; 1F:6018
    ldh  [<NR14],a                  ; 1F:601A
    ret                             ; 1F:601C

Data1F601D:                         ; 1F:601D
.db $59,$07,$59,$07,$A2,$07,$83,$07,\
    $BA,$07,$A2,$07,$CB,$07,$B6,$07,\
    $D9,$07,$C8,$07,$E0,$07,$D6,$07
Data1F6035:                         ; 1F:6035
.db $C8,$00,$B8,$00,$A8,$00,$98,$00,\
    $88,$00,$78,$00,$68,$00,$58,$00,\
    $48,$00,$38,$00,$28,$00,$18,$00
Data1F604D:                         ; 1F:604D
.db $27,$80,$D8,$21,$87,$0D

Code1F6053:
    ld   hl,Data1F6088              ; 1F:6053
    jp   Code1F440A                 ; 1F:6056
Code1F6059:
    call Sub1F6845                  ; 1F:6059
    ret  nz                         ; 1F:605C
    call Sub1F6849                  ; 1F:605D
    cp   $0E                        ; 1F:6060
    jp   z,Code1F444B               ; 1F:6062
    ld   hl,DataPtrs1F606E          ; 1F:6065
    call Sub1F6838                  ; 1F:6068
    jp   Sub1F684D                  ; 1F:606B

DataPtrs1F606E:                     ; 1F:606E
.dw Data1F608E, Data1F6094, Data1F609A, Data1F60A0,\
    Data1F60A6, Data1F60AC, Data1F60B2, Data1F60B8,\
    Data1F60BE, Data1F60C4, Data1F60CA, Data1F60D0,\
    Data1F60D6
Data1F6088:                         ; 1F:6088
.db $16,$80,$B3,$F7,$86,$04
Data1F608E:                         ; 1F:608E
.db $16,$80,$B3,$E7,$86,$04
Data1F6094:                         ; 1F:6094
.db $16,$80,$B3,$D6,$86,$04
Data1F609A:                         ; 1F:609A
.db $16,$80,$B3,$B2,$86,$04
Data1F60A0:                         ; 1F:60A0
.db $16,$80,$B3,$9E,$86,$04
Data1F60A6:                         ; 1F:60A6
.db $16,$80,$B3,$89,$86,$04
Data1F60AC:                         ; 1F:60AC
.db $16,$80,$B3,$72,$86,$04
Data1F60B2:                         ; 1F:60B2
.db $16,$80,$B2,$5B,$86,$04
Data1F60B8:                         ; 1F:60B8
.db $16,$80,$A2,$27,$86,$04
Data1F60BE:                         ; 1F:60BE
.db $16,$80,$82,$0A,$86,$04
Data1F60C4:                         ; 1F:60C4
.db $16,$80,$62,$ED,$85,$04
Data1F60CA:                         ; 1F:60CA
.db $16,$80,$42,$CE,$85,$04
Data1F60D0:                         ; 1F:60D0
.db $16,$80,$22,$AC,$85,$04
Data1F60D6:                         ; 1F:60D6
.db $16,$80,$12,$63,$85,$04

Code1F60DC:
    ld   a,[$DE71]                  ; 1F:60DC
    cp   $2A                        ; 1F:60DF
    ret  z                          ; 1F:60E1
    ld   a,[$DED3]                  ; 1F:60E2
    inc  a                          ; 1F:60E5
    and  $07                        ; 1F:60E6
    ld   [$DED3],a                  ; 1F:60E8
    inc  a                          ; 1F:60EB
    ld   hl,DataPtrs1F60F5          ; 1F:60EC
    call Sub1F6838                  ; 1F:60EF
    jp   Code1F47D5                 ; 1F:60F2

DataPtrs1F60F5:                     ; 1F:60F5
.dw Data1F610C, Data1F6111, Data1F610C, Data1F6111,\
    Data1F610C, Data1F6111, Data1F6116, Data1F6111

Code1F6105:
    call Sub1F6845                  ; 1F:6105
    ret  nz                         ; 1F:6108
    jp   Code1F47FB                 ; 1F:6109

Data1F610C:                         ; 1F:610C
.db $B8,$52,$B2,$C6,$03
Data1F6111:                         ; 1F:6111
.db $B8,$52,$72,$C6,$03
Data1F6116:                         ; 1F:6116
.db $B8,$52,$0A,$C6,$03

Code1F611B:
    ld   hl,Data1F613F              ; 1F:611B
    jp   Code1F47D0                 ; 1F:611E
Code1F6121:
    call Sub1F6845                  ; 1F:6121
    jp   z,Sub1F47F5                ; 1F:6124
    cpl                             ; 1F:6127
    add  $06                        ; 1F:6128
    ld   hl,Data1F6137              ; 1F:612A
    call Sub1F6838                  ; 1F:612D
    ld   a,l                        ; 1F:6130
    ldh  [<NR23],a                  ; 1F:6131
    ld   a,h                        ; 1F:6133
    ldh  [<NR24],a                  ; 1F:6134
    ret                             ; 1F:6136

Data1F6137:                         ; 1F:6137
.db $74,$07,$6B,$07,$7B,$07,$8A,$07
Data1F613F:                         ; 1F:613F
.db $80,$91,$83,$87,$05

Code1F6144:
    ld   hl,Data1F619F              ; 1F:6144
    jp   Code1F47C4                 ; 1F:6147
Code1F614A:
    call Sub1F6845                  ; 1F:614A
    jp   z,Sub1F47F5                ; 1F:614D
    cpl                             ; 1F:6150
    add  $11                        ; 1F:6151
    ld   d,$00                      ; 1F:6153
    cp   $0A                        ; 1F:6155
    jr   z,Code1F6167               ; 1F:6157
    cp   $02                        ; 1F:6159
    jr   nz,Code1F6173              ; 1F:615B
    ld   a,$88                      ; 1F:615D
    ldh  [<NR22],a                  ; 1F:615F
    ld   a,$02                      ; 1F:6161
    ld   d,$80                      ; 1F:6163
    jr   Code1F6173                 ; 1F:6165
Code1F6167:
    ld   a,$80                      ; 1F:6167
    ldh  [<NR21],a                  ; 1F:6169
    ld   a,$71                      ; 1F:616B
    ldh  [<NR22],a                  ; 1F:616D
    ld   a,$0A                      ; 1F:616F
    ld   d,$80                      ; 1F:6171
Code1F6173:
    ld   hl,Data1F6181              ; 1F:6173
    call Sub1F6838                  ; 1F:6176
    ld   a,l                        ; 1F:6179
    ldh  [<NR23],a                  ; 1F:617A
    ld   a,h                        ; 1F:617C
    or   d                          ; 1F:617D
    ldh  [<NR24],a                  ; 1F:617E
    ret                             ; 1F:6180

Data1F6181:                         ; 1F:6181
.db $3B,$05,$89,$05,$CE,$05,$0A,$06,\
    $42,$06,$72,$06,$B2,$06,$E7,$06,\
    $06,$07,$21,$07,$39,$07,$59,$07,\
    $6B,$07,$83,$07,$90,$07
Data1F619F:                         ; 1F:619F
.db $80,$88,$E5,$84,$10

Code1F61A4:
    ld   hl,Data1F61E3              ; 1F:61A4
    jp   Code1F47C8                 ; 1F:61A7
Code1F61AA:
    call Sub1F6845                  ; 1F:61AA
    ret  nz                         ; 1F:61AD
    call Sub1F6849                  ; 1F:61AE
    cp   $13                        ; 1F:61B1
    jp   z,Sub1F47F5                ; 1F:61B3
    ld   hl,DataPtrs1F61BF          ; 1F:61B6
    call Sub1F6838                  ; 1F:61B9
    jp   Sub1F6856                  ; 1F:61BC

DataPtrs1F61BF:                     ; 1F:61BF
.dw Data1F61E8, Data1F61ED, Data1F61F2, Data1F61F7,\
    Data1F61FC, Data1F621F, Data1F61E3, Data1F61E8,\
    Data1F61ED, Data1F61F2, Data1F61F7, Data1F61FC,\
    Data1F6201, Data1F6206, Data1F620B, Data1F6210,\
    Data1F6215, Data1F621A
Data1F61E3:                         ; 1F:61E3
.db $80,$F8,$16,$84,$01
Data1F61E8:                         ; 1F:61E8
.db $80,$F8,$DA,$83,$01
Data1F61ED:                         ; 1F:61ED
.db $80,$E8,$9B,$83,$01
Data1F61F2:                         ; 1F:61F2
.db $80,$E8,$12,$83,$01
Data1F61F7:                         ; 1F:61F7
.db $80,$D8,$C6,$82,$01
Data1F61FC:                         ; 1F:61FC
.db $80,$D8,$92,$82,$01
Data1F6201:                         ; 1F:6201
.db $80,$C8,$77,$82,$01
Data1F6206:                         ; 1F:6206
.db $80,$B8,$C9,$81,$01
Data1F620B:                         ; 1F:620B
.db $80,$A8,$6B,$81,$01
Data1F6210:                         ; 1F:6210
.db $80,$98,$06,$81,$01
Data1F6215:                         ; 1F:6215
.db $80,$88,$BF,$80,$01
Data1F621A:                         ; 1F:621A
.db $80,$78,$9C,$80,$01
Data1F621F:                         ; 1F:621F
.db $80,$18,$77,$82,$01

Code1F6224:
    ld   hl,Data1F5FD3              ; 1F:6224
    jp   Code1F47CC                 ; 1F:6227
Code1F622A:
    call Sub1F6845                  ; 1F:622A
    ret  nz                         ; 1F:622D
    call Sub1F6849                  ; 1F:622E
    cp   $08                        ; 1F:6231
    jp   z,Code1F47FB               ; 1F:6233
    ld   hl,DataPtrs1F623F          ; 1F:6236
    call Sub1F6838                  ; 1F:6239
    jp   Sub1F6856                  ; 1F:623C

DataPtrs1F623F:                     ; 1F:623F
.dw Data1F5FD9, Data1F5FD3, Data1F5FD9, Data1F5FD3,\
    Data1F5FD9, Data1F5FD3, Data1F5FDF

Code1F624D:
    jp   Code1F63EC                 ; 1F:624D
Code1F6250:
    jp   Code1F63F7                 ; 1F:6250
Code1F6253:
    jp   Code1F6467                 ; 1F:6253
Code1F6256:
    jp   Code1F6472                 ; 1F:6256
    ret                             ; 1F:6259
Code1F625A:
    ld   hl,Data1F6281              ; 1F:625A
    jp   Code1F47D5                 ; 1F:625D
Code1F6260:
    call Sub1F6845                  ; 1F:6260
    ret  nz                         ; 1F:6263
    call Sub1F6849                  ; 1F:6264
    cp   $07                        ; 1F:6267
    jp   z,Code1F47FB               ; 1F:6269
    ld   hl,DataPtrs1F6275          ; 1F:626C
    call Sub1F6838                  ; 1F:626F
    jp   Sub1F6856                  ; 1F:6272

DataPtrs1F6275:                     ; 1F:6275
.dw Data1F6286, Data1F628B, Data1F6290, Data1F6295,\
    Data1F629A, Data1F629F
Data1F6281:                         ; 1F:6281
.db $B4,$D1,$06,$C7,$04
Data1F6286:                         ; 1F:6286
.db $B4,$B1,$39,$C7,$04
Data1F628B:                         ; 1F:628B
.db $B4,$91,$59,$C7,$04
Data1F6290:                         ; 1F:6290
.db $B4,$71,$7B,$C7,$05
Data1F6295:                         ; 1F:6295
.db $B4,$61,$90,$C7,$05
Data1F629A:                         ; 1F:629A
.db $B4,$51,$A7,$C7,$06
Data1F629F:                         ; 1F:629F
.db $B4,$41,$B6,$C7,$05

Code1F62A4:
    call Sub1F68FB                  ; 1F:62A4
    ld   hl,Data1F62F7              ; 1F:62A7
    jp   Code1F47D5                 ; 1F:62AA
Code1F62AD:
    call Sub1F6845                  ; 1F:62AD
    jp   z,Code1F47FB               ; 1F:62B0
    ld   d,$00                      ; 1F:62B3
    cpl                             ; 1F:62B5
    add  $2D                        ; 1F:62B6
    cp   $04                        ; 1F:62B8
    jr   z,Code1F62DF               ; 1F:62BA
    cp   $07                        ; 1F:62BC
    jr   z,Code1F62D5               ; 1F:62BE
    cp   $24                        ; 1F:62C0
    jr   z,Code1F62E9               ; 1F:62C2
Code1F62C4:
    and  $01                        ; 1F:62C4
    inc  a                          ; 1F:62C6
    ld   hl,Data1F62F3              ; 1F:62C7
    call Sub1F6838                  ; 1F:62CA
    ld   a,l                        ; 1F:62CD
    ldh  [<NR23],a                  ; 1F:62CE
    ld   a,h                        ; 1F:62D0
    or   d                          ; 1F:62D1
    ldh  [<NR24],a                  ; 1F:62D2
    ret                             ; 1F:62D4

Code1F62D5:
    ld   d,a                        ; 1F:62D5
    ld   a,$C8                      ; 1F:62D6
    ldh  [<NR22],a                  ; 1F:62D8
    ld   a,d                        ; 1F:62DA
    ld   d,$80                      ; 1F:62DB
    jr   Code1F62C4                 ; 1F:62DD
Code1F62DF:
    ld   d,a                        ; 1F:62DF
    ld   a,$11                      ; 1F:62E0
    ldh  [<NR22],a                  ; 1F:62E2
    ld   a,d                        ; 1F:62E4
    ld   d,$80                      ; 1F:62E5
    jr   Code1F62C4                 ; 1F:62E7
Code1F62E9:
    ld   d,a                        ; 1F:62E9
    ld   a,$17                      ; 1F:62EA
    ldh  [<NR22],a                  ; 1F:62EC
    ld   a,d                        ; 1F:62EE
    ld   d,$80                      ; 1F:62EF
    jr   Code1F62C4                 ; 1F:62F1

Data1F62F3:                         ; 1F:62F3
.db $B6,$07,$BE,$07
Data1F62F7:                         ; 1F:62F7
.db $40,$C8,$B6,$87,$2C

Code1F62FC:
    ld   hl,Data1F6302              ; 1F:62FC
    jp   Code1F643C                 ; 1F:62FF

Data1F6302:                         ; 1F:6302
.db $80,$F1,$F7,$86,$03

Code1F6307:
    ld   hl,DataPtrs1F630D          ; 1F:6307
    jp   Code1F643F                 ; 1F:630A

DataPtrs1F630D:                     ; 1F:630D
.dw Data1F631F, Data1F6324, Data1F6329, Data1F632E,\
    Data1F6333, Data1F6338, Data1F633D, Data1F6342,\
    Data1F6347
Data1F631F:                         ; 1F:631F
.db $80,$51,$F7,$86,$02
Data1F6324:                         ; 1F:6324
.db $80,$F1,$39,$87,$03
Data1F6329:                         ; 1F:6329
.db $80,$51,$39,$87,$02
Data1F632E:                         ; 1F:632E
.db $80,$F1,$62,$87,$03
Data1F6333:                         ; 1F:6333
.db $80,$51,$62,$87,$02
Data1F6338:                         ; 1F:6338
.db $80,$F1,$39,$87,$03
Data1F633D:                         ; 1F:633D
.db $80,$51,$39,$87,$02
Data1F6342:                         ; 1F:6342
.db $80,$F1,$4F,$87,$04
Data1F6347:                         ; 1F:6347
.db $80,$84,$4F,$87,$20

Code1F634C:
    ld   hl,Data1F6352              ; 1F:634C
    jp   Code1F643C                 ; 1F:634F

Data1F6352:                         ; 1F:6352
.db $80,$F1,$14,$87,$03

Code1F6357:
    ld   hl,DataPtrs1F635D          ; 1F:6357
    jp   Code1F643F                 ; 1F:635A

DataPtrs1F635D:                     ; 1F:635D
.dw Data1F636F, Data1F6374, Data1F6379, Data1F637E,\
    Data1F6383, Data1F6388, Data1F638D, Data1F6392,\
    Data1F6397
Data1F636F:                         ; 1F:636F
.db $80,$51,$14,$87,$02
Data1F6374:                         ; 1F:6374
.db $80,$F1,$4F,$87,$03
Data1F6379:                         ; 1F:6379
.db $80,$51,$4F,$87,$02
Data1F637E:                         ; 1F:637E
.db $80,$F1,$74,$87,$03
Data1F6383:                         ; 1F:6383
.db $80,$51,$74,$87,$02
Data1F6388:                         ; 1F:6388
.db $80,$F1,$4F,$87,$03
Data1F638D:                         ; 1F:638D
.db $80,$51,$4F,$87,$02
Data1F6392:                         ; 1F:6392
.db $80,$F1,$62,$87,$04
Data1F6397:                         ; 1F:6397
.db $80,$84,$62,$87,$20

Code1F639C:
    ld   hl,Data1F63A2              ; 1F:639C
    jp   Code1F643C                 ; 1F:639F

Data1F63A2:                         ; 1F:63A2
.db $80,$F1,$2D,$87,$03

Code1F63A7:
    ld   hl,DataPtrs1F63AD          ; 1F:63A7
    jp   Code1F643F                 ; 1F:63AA

DataPtrs1F63AD:                     ; 1F:63AD
.dw Data1F63BF, Data1F63C4, Data1F63C9, Data1F63CE,\
    Data1F63D3, Data1F63D8, Data1F63DD, Data1F63E2,\
    Data1F63E7
Data1F63BF:                         ; 1F:63BF
.db $80,$51,$2D,$87,$02
Data1F63C4:                         ; 1F:63C4
.db $80,$F1,$62,$87,$03
Data1F63C9:                         ; 1F:63C9
.db $80,$51,$62,$87,$02
Data1F63CE:                         ; 1F:63CE
.db $80,$F1,$83,$87,$03
Data1F63D3:                         ; 1F:63D3
.db $80,$51,$83,$87,$02
Data1F63D8:                         ; 1F:63D8
.db $80,$F1,$62,$87,$03
Data1F63DD:                         ; 1F:63DD
.db $80,$51,$62,$87,$02
Data1F63E2:                         ; 1F:63E2
.db $80,$F1,$74,$87,$04
Data1F63E7:                         ; 1F:63E7
.db $80,$84,$74,$87,$20

Code1F63EC:
    ld   hl,Data1F63F2              ; 1F:63EC
    jp   Code1F643C                 ; 1F:63EF

Data1F63F2:                         ; 1F:63F2
.db $80,$F1,$44,$87,$03

Code1F63F7:
    ld   hl,DataPtrs1F63FD          ; 1F:63F7
    jp   Code1F643F                 ; 1F:63FA

DataPtrs1F63FD:                     ; 1F:63FD
.dw Data1F640F, Data1F6414, Data1F6419, Data1F641E,\
    Data1F6423, Data1F6428, Data1F642D, Data1F6432,\
    Data1F6437
Data1F640F:                         ; 1F:640F
.db $80,$51,$44,$87,$02
Data1F6414:                         ; 1F:6414
.db $80,$F1,$74,$87,$03
Data1F6419:                         ; 1F:6419
.db $80,$51,$74,$87,$02
Data1F641E:                         ; 1F:641E
.db $80,$F1,$90,$87,$03
Data1F6423:                         ; 1F:6423
.db $80,$51,$90,$87,$02
Data1F6428:                         ; 1F:6428
.db $80,$F1,$74,$87,$03
Data1F642D:                         ; 1F:642D
.db $80,$51,$74,$87,$02
Data1F6432:                         ; 1F:6432
.db $80,$F1,$83,$87,$04
Data1F6437:                         ; 1F:6437
.db $80,$84,$83,$87,$20

Code1F643C:
    jp   Code1F47D5                 ; 1F:643C
Code1F643F:
    call Sub1F6845                  ; 1F:643F
    jr   nz,Code1F6452              ; 1F:6442
    call Sub1F6849                  ; 1F:6444
    cp   $0A                        ; 1F:6447
    jp   z,Code1F47FB               ; 1F:6449
    call Sub1F6838                  ; 1F:644C
    jp   Sub1F6856                  ; 1F:644F
Code1F6452:
    ld   a,[bc]                     ; 1F:6452
    cp   $09                        ; 1F:6453
    ret  nz                         ; 1F:6455
    ld   a,[de]                     ; 1F:6456
    and  $03                        ; 1F:6457
    cp   $03                        ; 1F:6459
    jr   z,Code1F6462               ; 1F:645B
    ld   a,$80                      ; 1F:645D
    ldh  [<NR21],a                  ; 1F:645F
    ret                             ; 1F:6461
Code1F6462:
    ld   a,$40                      ; 1F:6462
    ldh  [<NR21],a                  ; 1F:6464
    ret                             ; 1F:6466

Code1F6467:
    ld   hl,Data1F646D              ; 1F:6467
    jp   Code1F47D5                 ; 1F:646A

Data1F646D:                         ; 1F:646D
.db $80,$F1,$59,$87,$03

Code1F6472:
    call Sub1F6845                  ; 1F:6472
    jr   nz,Code1F6488              ; 1F:6475
    call Sub1F6849                  ; 1F:6477
    cp   $10                        ; 1F:647A
    jp   z,Code1F47FB               ; 1F:647C
    ld   hl,DataPtrs1F649D          ; 1F:647F
    call Sub1F6838                  ; 1F:6482
    jp   Sub1F6856                  ; 1F:6485
Code1F6488:
    ld   a,[bc]                     ; 1F:6488
    cp   $0F                        ; 1F:6489
    ret  nz                         ; 1F:648B
    ld   a,[de]                     ; 1F:648C
    and  $03                        ; 1F:648D
    cp   $03                        ; 1F:648F
    jr   z,Code1F6498               ; 1F:6491
    ld   a,$80                      ; 1F:6493
    ldh  [<NR21],a                  ; 1F:6495
    ret                             ; 1F:6497
Code1F6498:
    ld   a,$40                      ; 1F:6498
    ldh  [<NR21],a                  ; 1F:649A
    ret                             ; 1F:649C

DataPtrs1F649D:                     ; 1F:649D
.dw Data1F64BB, Data1F64C0, Data1F64C5, Data1F64CA,\
    Data1F64CF, Data1F64D4, Data1F64D9, Data1F64DE,\
    Data1F64E3, Data1F64E8, Data1F64ED, Data1F64F2,\
    Data1F64F7, Data1F64FC, Data1F6501
Data1F64BB:                         ; 1F:64BB
.db $80,$51,$59,$87,$02
Data1F64C0:                         ; 1F:64C0
.db $80,$F1,$83,$87,$03
Data1F64C5:                         ; 1F:64C5
.db $80,$51,$83,$87,$02
Data1F64CA:                         ; 1F:64CA
.db $80,$F1,$9D,$87,$03
Data1F64CF:                         ; 1F:64CF
.db $80,$51,$9D,$87,$02
Data1F64D4:                         ; 1F:64D4
.db $80,$F1,$83,$87,$03
Data1F64D9:                         ; 1F:64D9
.db $80,$51,$83,$87,$02
Data1F64DE:                         ; 1F:64DE
.db $80,$F1,$90,$87,$04
Data1F64E3:                         ; 1F:64E3
.db $80,$51,$90,$87,$03
Data1F64E8:                         ; 1F:64E8
.db $80,$F1,$A7,$87,$04
Data1F64ED:                         ; 1F:64ED
.db $80,$51,$A7,$87,$03
Data1F64F2:                         ; 1F:64F2
.db $80,$F1,$B6,$87,$05
Data1F64F7:                         ; 1F:64F7
.db $80,$51,$B6,$87,$04
Data1F64FC:                         ; 1F:64FC
.db $80,$F2,$B1,$87,$04
Data1F6501:                         ; 1F:6501
.db $80,$A5,$B1,$87,$20

Code1F6506:
    ld   a,$3F                      ; 1F:6506
    ld   [$DE78],a                  ; 1F:6508
    ld   hl,Data1F6552              ; 1F:650B
    jp   Code1F47D5                 ; 1F:650E
Code1F6511:
    call Sub1F6845                  ; 1F:6511
    ret  nz                         ; 1F:6514
    call Sub1F6849                  ; 1F:6515
    cp   $25                        ; 1F:6518
    jp   z,Code1F47FB               ; 1F:651A
    cp   $10                        ; 1F:651D
    call nc,Sub1F652B               ; 1F:651F
    ld   hl,DataPtrs1F6530          ; 1F:6522
    call Sub1F6838                  ; 1F:6525
    jp   Code1F419B                 ; 1F:6528

Sub1F652B:
    and  $01                        ; 1F:652B
    add  $10                        ; 1F:652D
    ret                             ; 1F:652F

DataPtrs1F6530:                     ; 1F:6530
.dw Data1F6557, Data1F6561, Data1F655C, Data1F6561,\
    Data1F6566, Data1F6561, Data1F6566, Data1F6561,\
    Data1F6566, Data1F6561, Data1F6566, Data1F6561,\
    Data1F6566, Data1F6561, Data1F656B, Data1F6566,\
    Data1F6561
Data1F6552:                         ; 1F:6552
.db $40,$08,$CB,$87,$05
Data1F6557:                         ; 1F:6557
.db $40,$D1,$CB,$87,$01
Data1F655C:                         ; 1F:655C
.db $40,$A2,$CB,$87,$01
Data1F6561:                         ; 1F:6561
.db $40,$00,$CC,$07,$01
Data1F6566:                         ; 1F:6566
.db $40,$00,$CB,$07,$01
Data1F656B:                         ; 1F:656B
.db $40,$37,$CB,$87,$01

Code1F6570:
    ld   hl,Data1F6588              ; 1F:6570
    jp   Code1F4777                 ; 1F:6573
Code1F6576:
    call Sub1F6845                  ; 1F:6576
    ret  nz                         ; 1F:6579
    call Sub1F6849                  ; 1F:657A
    cp   $02                        ; 1F:657D
    jp   z,Code1F4795               ; 1F:657F
    ld   hl,Data1F6588              ; 1F:6582
    jp   Sub1F6868                  ; 1F:6585

Data1F6588:                         ; 1F:6588
.db $34,$DA,$37,$C0,$04

Code1F658D:
    ld   a,[$DE79]                  ; 1F:658D
    cp   $43                        ; 1F:6590
    jr   z,Code1F65A0               ; 1F:6592
    ld   hl,Data1F66D0              ; 1F:6594
    call Sub1F460A                  ; 1F:6597
    ld   hl,Data1F660D              ; 1F:659A
    jp   Code1F4818                 ; 1F:659D
Code1F65A0:
    ld   hl,Data1F660D              ; 1F:65A0
    ldh  a,[<NR30]                  ; 1F:65A3
    and  a                          ; 1F:65A5
    jp   z,Code1F4818               ; 1F:65A6
    call Sub1F481E                  ; 1F:65A9
    ld   a,$11                      ; 1F:65AC
    ld   [de],a                     ; 1F:65AE
    ret                             ; 1F:65AF

Code1F65B0:
    xor  a                          ; 1F:65B0
    ldh  [<NR31],a                  ; 1F:65B1
    call Sub1F6845                  ; 1F:65B3
    jp   z,Code1F4839               ; 1F:65B6
    cpl                             ; 1F:65B9
    add  $12                        ; 1F:65BA
    ld   d,a                        ; 1F:65BC
    cp   $01                        ; 1F:65BD
    jr   z,Code1F65E7               ; 1F:65BF
    cp   $02                        ; 1F:65C1
    jr   z,Code1F65E3               ; 1F:65C3
    cp   $03                        ; 1F:65C5
    jr   z,Code1F65DF               ; 1F:65C7
    cp   $0F                        ; 1F:65C9
    jr   z,Code1F65E3               ; 1F:65CB
    cp   $10                        ; 1F:65CD
    jr   z,Code1F65E7               ; 1F:65CF
Code1F65D1:
    ld   a,d                        ; 1F:65D1
    ld   hl,Data1F65ED              ; 1F:65D2
    call Sub1F6838                  ; 1F:65D5
    ld   a,l                        ; 1F:65D8
    ldh  [<NR33],a                  ; 1F:65D9
    ld   a,h                        ; 1F:65DB
    ldh  [<NR34],a                  ; 1F:65DC
    ret                             ; 1F:65DE

Code1F65DF:
    ld   a,$20                      ; 1F:65DF
    jr   Code1F65E9                 ; 1F:65E1
Code1F65E3:
    ld   a,$40                      ; 1F:65E3
    jr   Code1F65E9                 ; 1F:65E5
Code1F65E7:
    ld   a,$60                      ; 1F:65E7
Code1F65E9:
    ldh  [<NR32],a                  ; 1F:65E9
    jr   Code1F65D1                 ; 1F:65EB

Data1F65ED:                         ; 1F:65ED
.db $4E,$04,$9C,$00,$4E,$04,$9C,$00,\
    $4E,$04,$4E,$04,$4E,$04,$2C,$00,\
    $83,$04,$83,$04,$06,$01,$B5,$04,\
    $B5,$04,$E5,$04,$11,$05,$3B,$05
Data1F660D:                         ; 1F:660D
.db $80,$00,$00,$4E,$84,$0F

Code1F6613:
    ld   hl,Data1F66E0              ; 1F:6613
    call Sub1F460A                  ; 1F:6616
    ld   hl,Data1F6626              ; 1F:6619
    jp   Code1F4818                 ; 1F:661C
Code1F661F:
    call Sub1F6845                  ; 1F:661F
    ret  nz                         ; 1F:6622
    jp   Code1F4839                 ; 1F:6623

Data1F6626:                         ; 1F:6626
.db $80,$00,$20,$C2,$C7,$02,$00,$00,\
    $00,$00,$00,$03,$69,$CF,$FF,$FF,\
    $FF,$FF,$FF,$FC,$96,$30

Code1F663C:
    ld   hl,Data1F66F0              ; 1F:663C
    call Sub1F460A                  ; 1F:663F
    ld   hl,Data1F66CA              ; 1F:6642
    jp   Code1F4813                 ; 1F:6645
Code1F6648:
    xor  a                          ; 1F:6648
    ldh  [<NR31],a                  ; 1F:6649
    call Sub1F6845                  ; 1F:664B
    ret  nz                         ; 1F:664E
    call Sub1F6849                  ; 1F:664F
    cp   $16                        ; 1F:6652
    jp   z,Code1F4839               ; 1F:6654
    dec  a                          ; 1F:6657
    sla  a                          ; 1F:6658
    inc  a                          ; 1F:665A
    push af                         ; 1F:665B
    ld   hl,Data1F6676              ; 1F:665C
    call Sub1F6838                  ; 1F:665F
    ld   a,l                        ; 1F:6662
    ldh  [<NR33],a                  ; 1F:6663
    ld   a,h                        ; 1F:6665
    ldh  [<NR34],a                  ; 1F:6666
    pop  af                         ; 1F:6668
    inc  a                          ; 1F:6669
    ld   hl,Data1F6676              ; 1F:666A
    call Sub1F6838                  ; 1F:666D
    ld   a,h                        ; 1F:6670
    ldh  [<NR32],a                  ; 1F:6671
    ld   a,l                        ; 1F:6673
    ld   [de],a                     ; 1F:6674
    ret                             ; 1F:6675

Data1F6676:                         ; 1F:6676
.db $06,$07,$02,$60,$06,$07,$06,$20,\
    $06,$07,$02,$60,$39,$07,$06,$20,\
    $39,$07,$02,$60,$59,$07,$06,$20,\
    $59,$07,$0A,$60,$39,$07,$06,$20,\
    $39,$07,$02,$60,$59,$07,$02,$20,\
    $59,$07,$02,$60,$62,$07,$02,$20,\
    $62,$07,$02,$60,$6B,$07,$02,$20,\
    $6B,$07,$02,$60,$74,$07,$02,$20,\
    $74,$07,$02,$60,$7B,$07,$02,$20,\
    $7B,$07,$02,$60,$83,$07,$0E,$20,\
    $83,$07,$01,$60
Data1F66CA:                         ; 1F:66CA
.db $80,$00,$20,$06,$87,$06
Data1F66D0:                         ; 1F:66D0
.db $7E,$EE,$EE,$EE,$EE,$EE,$EE,$EE,\
    $70,$00,$00,$00,$00,$00,$00,$00
Data1F66E0:                         ; 1F:66E0
.db $27,$99,$99,$99,$99,$99,$99,$99,\
    $72,$00,$00,$00,$00,$00,$00,$00
Data1F66F0:                         ; 1F:66F0
.db $48,$CC,$CC,$CC,$CC,$CC,$CC,$CC,\
    $84,$00,$00,$00,$00,$00,$00,$00

Code1F6700:
    ld   hl,Data1F6747              ; 1F:6700
    jp   Code1F4777                 ; 1F:6703
Code1F6706:
    call Sub1F6845                  ; 1F:6706
    jp   z,Sub1F478F                ; 1F:6709
    ld   d,$00                      ; 1F:670C
    cpl                             ; 1F:670E
    add  $19                        ; 1F:670F
    cp   $05                        ; 1F:6711
    call z,Sub1F6728                ; 1F:6713
    bit  0,a                        ; 1F:6716
    ret  nz                         ; 1F:6718
    srl  a                          ; 1F:6719
    ld   hl,Data1F6731              ; 1F:671B
    call Sub1F6838                  ; 1F:671E
    ld   a,l                        ; 1F:6721
    ldh  [<NR43],a                  ; 1F:6722
    ld   a,d                        ; 1F:6724
    ldh  [<NR44],a                  ; 1F:6725
    ret                             ; 1F:6727

Sub1F6728:
    ld   d,a                        ; 1F:6728
    ld   a,$87                      ; 1F:6729
    ldh  [<NR42],a                  ; 1F:672B
    ld   a,d                        ; 1F:672D
    ld   d,$80                      ; 1F:672E
    ret                             ; 1F:6730

Data1F6731:                         ; 1F:6731
.db $34,$00,$24,$00,$27,$00,$55,$00,\
    $45,$00,$34,$00,$45,$00,$37,$00,\
    $47,$00,$45,$00,$55,$00
Data1F6747:                         ; 1F:6747
.db $00,$49,$26,$80,$18

Code1F674C:
    ld   a,[$DED3]                  ; 1F:674C
    inc  a                          ; 1F:674F
    cp   $14                        ; 1F:6750
    jr   c,Code1F6756               ; 1F:6752
    ld   a,$14                      ; 1F:6754
Code1F6756:
    ld   [$DED3],a                  ; 1F:6756
    ld   hl,DataPtrs1F6762          ; 1F:6759
    call Sub1F6838                  ; 1F:675C
    jp   Code1F4777                 ; 1F:675F

DataPtrs1F6762:                     ; 1F:6762
.dw Data1F678A, Data1F678A, Data1F678F, Data1F678F,\
    Data1F6794, Data1F6794, Data1F6799, Data1F6799,\
    Data1F679E, Data1F679E, Data1F67A8, Data1F67A8,\
    Data1F67A3, Data1F67A3, Data1F67AD, Data1F67AD,\
    Data1F67B2, Data1F67B2, Data1F67B7, Data1F67B7
Data1F678A:                         ; 1F:678A
.db $34,$F8,$55,$C0,$08
Data1F678F:                         ; 1F:678F
.db $34,$F8,$47,$C0,$08
Data1F6794:                         ; 1F:6794
.db $38,$F8,$45,$C0,$08
Data1F6799:                         ; 1F:6799
.db $38,$F8,$37,$C0,$08
Data1F679E:                         ; 1F:679E
.db $3C,$F8,$34,$C0,$08
Data1F67A3:                         ; 1F:67A3
.db $3C,$F8,$27,$C0,$08
Data1F67A8:                         ; 1F:67A8
.db $3C,$F8,$26,$C0,$08
Data1F67AD:                         ; 1F:67AD
.db $3C,$F8,$24,$C0,$08
Data1F67B2:                         ; 1F:67B2
.db $3C,$F8,$17,$C0,$08
Data1F67B7:                         ; 1F:67B7
.db $3C,$F8,$15,$C0,$08

Code1F67BC:
    call Sub1F6845                  ; 1F:67BC
    jp   z,Code1F4795               ; 1F:67BF
    ret                             ; 1F:67C2

Code1F67C3:
    ld   hl,Data1F67E2              ; 1F:67C3
    jp   Code1F4777                 ; 1F:67C6
Code1F67C9:
    call Sub1F6845                  ; 1F:67C9
    ret  nz                         ; 1F:67CC
    call Sub1F6849                  ; 1F:67CD
    cp   $03                        ; 1F:67D0
    jp   z,Code1F4795               ; 1F:67D2
    ld   hl,DataPtrs1F67DE          ; 1F:67D5
    call Sub1F6838                  ; 1F:67D8
    jp   Sub1F6868                  ; 1F:67DB
DataPtrs1F67DE:                     ; 1F:67DE
.dw Data1F67E7, Data1F67EC
Data1F67E2:                         ; 1F:67E2
.db $3C,$A9,$02,$C0,$01
Data1F67E7:                         ; 1F:67E7
.db $3C,$F1,$27,$C0,$06
Data1F67EC:                         ; 1F:67EC
.db $3C,$A9,$02,$C0,$02
Code1F67F1:
    cp   $A7                        ; 1F:67F1
    jr   nc,Code1F6830              ; 1F:67F3
    ld   a,[$DE60]                  ; 1F:67F5
    cp   $80                        ; 1F:67F8
    jr   z,Code1F682D               ; 1F:67FA
    cp   $81                        ; 1F:67FC
    jr   z,Code1F681F               ; 1F:67FE
    sub  $81                        ; 1F:6800
    ld   hl,Data1F4132              ; 1F:6802
    call Sub1F6838                  ; 1F:6805
    ld   c,l                        ; 1F:6808
    ld   a,$80                      ; 1F:6809
    or   h                          ; 1F:680B
    ld   b,a                        ; 1F:680C
    ld   hl,NR10                    ; 1F:680D
    ld   a,$08                      ; 1F:6810
    ldi  [hl],a                     ; 1F:6812
    ld   a,$80                      ; 1F:6813
    ldi  [hl],a                     ; 1F:6815
    ld   a,$D2                      ; 1F:6816
    ldi  [hl],a                     ; 1F:6818
    ld   a,c                        ; 1F:6819
    ldi  [hl],a                     ; 1F:681A
    ld   a,b                        ; 1F:681B
    ld   [hl],a                     ; 1F:681C
    jr   Code1F6830                 ; 1F:681D
Code1F681F:
    ld   hl,NR12                    ; 1F:681F
    ld   a,$08                      ; 1F:6822
    ldi  [hl],a                     ; 1F:6824
    ld   a,$00                      ; 1F:6825
    ldi  [hl],a                     ; 1F:6827
    ld   a,$80                      ; 1F:6828
    ld   [hl],a                     ; 1F:682A
    jr   Code1F6830                 ; 1F:682B
Code1F682D:
    call Sub1F4445                  ; 1F:682D
Code1F6830:
    xor  a                          ; 1F:6830
    ld   [$DE60],a                  ; 1F:6831
    ld   [$DE61],a                  ; 1F:6834
    ret                             ; 1F:6837

Sub1F6838:
    dec  a                          ; 1F:6838
    sla  a                          ; 1F:6839
    ld   c,a                        ; 1F:683B
    ld   b,$00                      ; 1F:683C
    add  hl,bc                      ; 1F:683E
    ld   c,[hl]                     ; 1F:683F
    inc  hl                         ; 1F:6840
    ld   b,[hl]                     ; 1F:6841
    ld   h,b                        ; 1F:6842
    ld   l,c                        ; 1F:6843
    ret                             ; 1F:6844

Sub1F6845:
    ld   a,[de]                     ; 1F:6845
    dec  a                          ; 1F:6846
    ld   [de],a                     ; 1F:6847
    ret                             ; 1F:6848

Sub1F6849:
    ld   a,[bc]                     ; 1F:6849
    inc  a                          ; 1F:684A
    ld   [bc],a                     ; 1F:684B
    ret                             ; 1F:684C

Sub1F684D:
    ld   b,$05                      ; 1F:684D
    ld   c,$10                      ; 1F:684F
    ld   de,$DE90                   ; 1F:6851
    jr   Code1F6871                 ; 1F:6854

Sub1F6856:
    ld   b,$04                      ; 1F:6856
    ld   c,$16                      ; 1F:6858
    ld   de,$DE92                   ; 1F:685A
    jr   Code1F6871                 ; 1F:685D

Sub1F685F:
    ld   b,$05                      ; 1F:685F
    ld   c,$1A                      ; 1F:6861
    ld   de,$DE93                   ; 1F:6863
    jr   Code1F6871                 ; 1F:6866

Sub1F6868:
    ld   b,$04                      ; 1F:6868
    ld   c,$20                      ; 1F:686A
    ld   de,$DE93                   ; 1F:686C
    jr   Code1F6871                 ; 1F:686F
Code1F6871:
    ldi  a,[hl]                     ; 1F:6871
    ldh  [c],a                      ; 1F:6872
    inc  c                          ; 1F:6873
    dec  b                          ; 1F:6874
    jr   nz,Code1F6871              ; 1F:6875
    ld   a,[hl]                     ; 1F:6877
    ld   [de],a                     ; 1F:6878
    ret                             ; 1F:6879

Unused1F687A:
    push de                         ; 1F:687A
    ld   de,$DEBC                   ; 1F:687B
    jr   Unused1F6892               ; 1F:687E
Unused1F6880:
    push de                         ; 1F:6880
    ld   de,$DEBD                   ; 1F:6881
    jr   Unused1F6892               ; 1F:6884
Unused1F6886:
    push de                         ; 1F:6886
    ld   de,$DEBE                   ; 1F:6887
    jr   Unused1F6892               ; 1F:688A
Unused1F688C:
    push de                         ; 1F:688C
    ld   de,$DEBF                   ; 1F:688D
    jr   Unused1F6892               ; 1F:6890
Unused1F6892:
    call Sub1F6845                  ; 1F:6892
    pop  de                         ; 1F:6895
    ret                             ; 1F:6896

Sub1F6897:
    push de                         ; 1F:6897
    ld   de,$DEC0                   ; 1F:6898
    jr   Code1F68A1                 ; 1F:689B
    push de                         ; 1F:689D
    ld   de,$DEC4                   ; 1F:689E
Code1F68A1:
    inc  hl                         ; 1F:68A1
    inc  hl                         ; 1F:68A2
    inc  hl                         ; 1F:68A3
    ldi  a,[hl]                     ; 1F:68A4
    ld   [de],a                     ; 1F:68A5
    inc  e                          ; 1F:68A6
    ldd  a,[hl]                     ; 1F:68A7
    and  $0F                        ; 1F:68A8
    ld   [de],a                     ; 1F:68AA
    dec  hl                         ; 1F:68AB
    dec  hl                         ; 1F:68AC
    dec  hl                         ; 1F:68AD
    pop  de                         ; 1F:68AE
    ret                             ; 1F:68AF

Unused1F68B0:
    push de                         ; 1F:68B0
    ld   de,$DEC2                   ; 1F:68B1
    inc  hl                         ; 1F:68B4
    inc  hl                         ; 1F:68B5
    ldi  a,[hl]                     ; 1F:68B6
    ld   [de],a                     ; 1F:68B7
    inc  e                          ; 1F:68B8
    ldd  a,[hl]                     ; 1F:68B9
    and  $0F                        ; 1F:68BA
    ld   [de],a                     ; 1F:68BC
    dec  hl                         ; 1F:68BD
    dec  hl                         ; 1F:68BE
    pop  de                         ; 1F:68BF
    ret                             ; 1F:68C0

Unused1F68C1:
    push de                         ; 1F:68C1
    ld   de,$DEC1                   ; 1F:68C2
    ld   a,[bc]                     ; 1F:68C5
    ld   c,$13                      ; 1F:68C6
    push bc                         ; 1F:68C8
    jr   Unused1F68D5               ; 1F:68C9
    push de                         ; 1F:68CB
    ld   de,$DEC5                   ; 1F:68CC
    ld   a,[bc]                     ; 1F:68CF
    ld   c,$1D                      ; 1F:68D0
    push bc                         ; 1F:68D2
    jr   Unused1F68D5               ; 1F:68D3
Unused1F68D5:
    dec  a                          ; 1F:68D5
    sla  a                          ; 1F:68D6
    ld   c,a                        ; 1F:68D8
    ld   b,$00                      ; 1F:68D9
    add  hl,bc                      ; 1F:68DB
    ldi  a,[hl]                     ; 1F:68DC
    ld   b,a                        ; 1F:68DD
    ld   a,[hl]                     ; 1F:68DE
    ld   c,a                        ; 1F:68DF
    ld   a,[de]                     ; 1F:68E0
    dec  e                          ; 1F:68E1
    ld   h,a                        ; 1F:68E2
    ld   a,[de]                     ; 1F:68E3
    ld   l,a                        ; 1F:68E4
    add  hl,bc                      ; 1F:68E5
    pop  bc                         ; 1F:68E6
    ld   a,l                        ; 1F:68E7
    ldh  [c],a                      ; 1F:68E8
    ld   [de],a                     ; 1F:68E9
    inc  c                          ; 1F:68EA
    inc  e                          ; 1F:68EB
    ld   a,h                        ; 1F:68EC
    ldh  [c],a                      ; 1F:68ED
    ld   [de],a                     ; 1F:68EE
    pop  de                         ; 1F:68EF
    ret                             ; 1F:68F0

Unused1F68F1:
    push de                         ; 1F:68F1
    ld   de,$DEC3                   ; 1F:68F2
    ld   a,[bc]                     ; 1F:68F5
    ld   c,$18                      ; 1F:68F6
    push bc                         ; 1F:68F8
    jr   Unused1F68D5               ; 1F:68F9

Sub1F68FB:
    ld   a,$FF                      ; 1F:68FB
    ldh  [<NR51],a                  ; 1F:68FD
    ld   a,$03                      ; 1F:68FF
    ld   [$DE55],a                  ; 1F:6901
    xor  a                          ; 1F:6904
    ld   [$DE69],a                  ; 1F:6905
    xor  a                          ; 1F:6908
    ld   [$DE61],a                  ; 1F:6909
    ld   [$DE71],a                  ; 1F:690C
    ld   [$DE79],a                  ; 1F:690F
    ld   [$DE1F],a                  ; 1F:6912
    ld   [$DE2F],a                  ; 1F:6915
    ld   [$DE3F],a                  ; 1F:6918
    ld   [$DE4F],a                  ; 1F:691B
    ld   [$DE9E],a                  ; 1F:691E
    ld   [$DE9F],a                  ; 1F:6921
    ld   [$DED9],a                  ; 1F:6924
    ld   [$DEDA],a                  ; 1F:6927
    ld   [$DEB6],a                  ; 1F:692A
    ld   [$DEB7],a                  ; 1F:692D
    ld   [$DEB8],a                  ; 1F:6930
    ld   [$DEB9],a                  ; 1F:6933
    ld   [$DEBA],a                  ; 1F:6936
    ld   [$DEBB],a                  ; 1F:6939
    ld   [$DE94],a                  ; 1F:693C
    ld   [$DE95],a                  ; 1F:693F
    ld   [$DE96],a                  ; 1F:6942
    ld   [$DE98],a                  ; 1F:6945
    ld   [$DE90],a                  ; 1F:6948
    ld   [$DE91],a                  ; 1F:694B
    ld   [$DE92],a                  ; 1F:694E
    ld   [$DE93],a                  ; 1F:6951
    ld   [$DEC6],a                  ; 1F:6954
    ld   [$DEC7],a                  ; 1F:6957
    ld   [$DEC8],a                  ; 1F:695A
    ld   [$DEC9],a                  ; 1F:695D
    ld   [$DEA0],a                  ; 1F:6960
    ld   [$DEA1],a                  ; 1F:6963
    ld   [$DEA2],a                  ; 1F:6966
    ld   [$DEA3],a                  ; 1F:6969
    ld   [$DECD],a                  ; 1F:696C
    ld   [$DED6],a                  ; 1F:696F
    ld   [$DED7],a                  ; 1F:6972
    ld   [$DED8],a                  ; 1F:6975
    ld   [$DEDC],a                  ; 1F:6978
    ld   [$DEE7],a                  ; 1F:697B
    ld   [$DEE2],a                  ; 1F:697E
    ld   [$DEE3],a                  ; 1F:6981
    ld   [$DEE4],a                  ; 1F:6984
    ld   [$DEE5],a                  ; 1F:6987
    ld   a,$08                      ; 1F:698A
    ldh  [<NR12],a                  ; 1F:698C
    ldh  [<NR22],a                  ; 1F:698E
    ldh  [<NR42],a                  ; 1F:6990
    ldh  [<NR10],a                  ; 1F:6992
    ld   a,$80                      ; 1F:6994
    ldh  [<NR14],a                  ; 1F:6996
    ldh  [<NR24],a                  ; 1F:6998
    ldh  [<NR44],a                  ; 1F:699A
    xor  a                          ; 1F:699C
    ldh  [<NR30],a                  ; 1F:699D
    ret                             ; 1F:699F
