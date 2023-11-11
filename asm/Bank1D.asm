.bank $1D slot 1
.orga $4000

    jp   Code1D4009                 ; 1D:4000
    jp   Code1D4DA2                 ; 1D:4003
Sub1D4006:
    jp   Code1D401E                 ; 1D:4006
Code1D4009:
    ld   hl,$DE00                   ; 1D:4009
Code1D400C:
    ld   [hl],$00                   ; 1D:400C
    inc  l                          ; 1D:400E
    jr   nz,Code1D400C              ; 1D:400F
    ld   a,$80                      ; 1D:4011
    ldh  [<NR52],a                  ; 1D:4013
    ld   a,$77                      ; 1D:4015
    ldh  [<NR50],a                  ; 1D:4017
    ld   a,$FF                      ; 1D:4019
    ldh  [<NR51],a                  ; 1D:401B
    ret                             ; 1D:401D

Code1D401E:
    ld   a,[$DE60]                  ; 1D:401E
    ld   hl,$DE68                   ; 1D:4021
    or   [hl]                       ; 1D:4024
    ld   hl,$DE70                   ; 1D:4025
    or   [hl]                       ; 1D:4028
    ld   hl,$DE78                   ; 1D:4029
    or   [hl]                       ; 1D:402C
    call nz,Return1D4FFF            ; 1D:402D
    ld   a,[$DE60]                  ; 1D:4030
    cp   $6E                        ; 1D:4033
    jr   nz,Code1D404A              ; 1D:4035
    ld   a,[$DE69]                  ; 1D:4037
    cp   $37                        ; 1D:403A
    jr   nz,Code1D404A              ; 1D:403C
    ld   a,[$DECB]                  ; 1D:403E
    cp   $7D                        ; 1D:4041
    jr   z,Code1D4047               ; 1D:4043
    ld   a,$FF                      ; 1D:4045
Code1D4047:
    ld   [$DE68],a                  ; 1D:4047
Code1D404A:
    ld   hl,$DE68                   ; 1D:404A
    ld   a,[hl]                     ; 1D:404D
    and  a                          ; 1D:404E
    jr   nz,Code1D405D              ; 1D:404F
Code1D4051:
    xor  a                          ; 1D:4051
    ldh  [<NR31],a                  ; 1D:4052
    call Sub1D4745                  ; 1D:4054
    ret                             ; 1D:4057

Code1D4058:
    xor  a                          ; 1D:4058
    ld   [$DECE],a                  ; 1D:4059
    ret                             ; 1D:405C

Code1D405D:
    call Sub1D4192                  ; 1D:405D
    jr   Code1D4051                 ; 1D:4060

Sub1D4062:
    ld   de,$DE93                   ; 1D:4062
    ld   hl,$DE78                   ; 1D:4065
    ldi  a,[hl]                     ; 1D:4068
    cp   $01                        ; 1D:4069
    jr   z,Code1D4073               ; 1D:406B
    ld   a,[hl]                     ; 1D:406D
    cp   $01                        ; 1D:406E
    jr   z,Code1D407E               ; 1D:4070
    ret                             ; 1D:4072

Code1D4073:
    ld   a,$01                      ; 1D:4073
    ld   [$DE79],a                  ; 1D:4075
    ld   hl,Data1D408B              ; 1D:4078
    jp   Code1D4095                 ; 1D:407B
Code1D407E:
    ld   a,[de]                     ; 1D:407E
    dec  a                          ; 1D:407F
    ld   [de],a                     ; 1D:4080
    ret  nz                         ; 1D:4081
    xor  a                          ; 1D:4082
    ld   [$DE79],a                  ; 1D:4083
    ld   hl,Data1D4090              ; 1D:4086
    jr   Code1D4095                 ; 1D:4089

Data1D408B:                         ; 1D:408B
.db $3B,$80,$07,$C0,$02
Data1D4090:                         ; 1D:4090
.db $00,$42,$02,$C0,$04

Code1D4095:
    ld   b,$04                      ; 1D:4095
    ld   c,$20                      ; 1D:4097
Code1D4099:
    ldi  a,[hl]                     ; 1D:4099
    ldh  [c],a                      ; 1D:409A
    inc  c                          ; 1D:409B
    dec  b                          ; 1D:409C
    jr   nz,Code1D4099              ; 1D:409D
    ld   a,[hl]                     ; 1D:409F
    ld   [de],a                     ; 1D:40A0
    ret                             ; 1D:40A1

DataPtrs1D40A2:                     ; 1D:40A2
.dw Data1D5125, Data1D5125, Data1D5125, Data1D5125,\
    Data1D5125, Data1D5125, Data1D5125, Data1D5125,\
    Data1D5125, Data1D5125, Data1D5125, Data1D5125,\
    Data1D5125, Data1D5125, Data1D5125, Data1D5125,\
    Data1D5125, Data1D5125, Data1D5125, Data1D5125,\
    Data1D5125, Data1D5125, Data1D5125, Data1D5125,\
    Data1D5125, Data1D5125, Data1D5125, Data1D5125,\
    Data1D5125, Data1D5125, Data1D5125, Data1D5125,\
    Data1D5125, Data1D5125, Data1D558F, Data1D563C,\
    Data1D56E1, Data1D57C9, Data1D594A, Data1D59DD,\
    Data1D5AC6, Data1D5B35, Data1D5BC0, Data1D578D,\
    Data1D5D49, Data1D5EF4, Data1D669F, Data1D6840,\
    Data1D5014, Data1D5094, Data1D68CE, Data1D6990,\
    Data1D6A7F, Data1D6BB4, Data1D6DA1, Data1D70A4,\
    Data1D723C, Data1D7328, Data1D7411, Data1D7587,\
    Data1D77EF, Data1D7ABD, Data1D7D7C

Sub1D4120:
    inc  e                          ; 1D:4120
    dec  a                          ; 1D:4121
    sla  a                          ; 1D:4122
    ld   c,a                        ; 1D:4124
    ld   b,$00                      ; 1D:4125
    add  hl,bc                      ; 1D:4127
    ld   c,[hl]                     ; 1D:4128
    inc  hl                         ; 1D:4129
    ld   b,[hl]                     ; 1D:412A
    ld   l,c                        ; 1D:412B
    ld   h,b                        ; 1D:412C
    ld   a,h                        ; 1D:412D
    ret                             ; 1D:412E

Sub1D412F:
    push bc                         ; 1D:412F
    ld   c,$30                      ; 1D:4130
Code1D4132:
    ldi  a,[hl]                     ; 1D:4132
    ldh  [c],a                      ; 1D:4133
    inc  c                          ; 1D:4134
    ld   a,c                        ; 1D:4135
    cp   $40                        ; 1D:4136
    jr   nz,Code1D4132              ; 1D:4138
    pop  bc                         ; 1D:413A
    ret                             ; 1D:413B

Sub1D413C:
    xor  a                          ; 1D:413C
    ld   [$DE79],a                  ; 1D:413D
    ld   [$DE4F],a                  ; 1D:4140
    ld   [$DE98],a                  ; 1D:4143
    ld   [$DE93],a                  ; 1D:4146
    ld   [$DEC9],a                  ; 1D:4149
    ld   [$DEA3],a                  ; 1D:414C
    ld   a,$08                      ; 1D:414F
    ldh  [<NR42],a                  ; 1D:4151
    ld   a,$80                      ; 1D:4153
    ldh  [<NR44],a                  ; 1D:4155
    ret                             ; 1D:4157

Sub1D4158:
    ld   a,[$DE69]                  ; 1D:4158
    and  a                          ; 1D:415B
    ret  z                          ; 1D:415C
    ld   a,[$DECA]                  ; 1D:415D
    ld   [$DECB],a                  ; 1D:4160
    ld   a,$FF                      ; 1D:4163
    ld   [$DECA],a                  ; 1D:4165
    ld   a,[$DE69]                  ; 1D:4168
    cp   $2D                        ; 1D:416B
    jr   z,Code1D4172               ; 1D:416D
    jp   Code1D4DA2                 ; 1D:416F
Code1D4172:
    ld   [$DED1],a                  ; 1D:4172
    xor  a                          ; 1D:4175
    ld   [$DE69],a                  ; 1D:4176
    ld   [$DED2],a                  ; 1D:4179
    ldh  [<NR32],a                  ; 1D:417C
    ld   a,$11                      ; 1D:417E
    ldh  [<NR22],a                  ; 1D:4180
    ldh  [<NR42],a                  ; 1D:4182
    ld   a,$80                      ; 1D:4184
    ldh  [<NR24],a                  ; 1D:4186
    ldh  [<NR44],a                  ; 1D:4188
    ret                             ; 1D:418A

Unused1D418B:
    ld   a,[$DED1]                  ; 1D:418B
    ld   [$DE69],a                  ; 1D:418E
    ret                             ; 1D:4191

Sub1D4192:
    cp   $FF                        ; 1D:4192
    jr   z,Sub1D4158                ; 1D:4194
    jr   @Code1D41B7                ; 1D:4196
@Unused1D4198:
    cp   $11                        ; 1D:4198
    jr   nc,@Code1D419F             ; 1D:419A
    jp   @Code1D424E                ; 1D:419C
@Code1D419F:
    cp   $21                        ; 1D:419F
    jr   nc,@Code1D41A6             ; 1D:41A1
    jp   Code1D4058                 ; 1D:41A3
@Code1D41A6:
    cp   $31                        ; 1D:41A6
    jr   nc,@Code1D41AD             ; 1D:41A8
    jp   Code1D4058                 ; 1D:41AA
@Code1D41AD:
    cp   $41                        ; 1D:41AD
    jp   nc,@Code1D41B7             ; 1D:41AF
    add  $E0                        ; 1D:41B2
    jp   @Code1D424E                ; 1D:41B4
@Code1D41B7:
    cp   $62                        ; 1D:41B7
    jp   c,@Code1D41C1              ; 1D:41B9
    cp   $80                        ; 1D:41BC
    jp   c,@Code1D41C6              ; 1D:41BE
@Code1D41C1:
    xor  a                          ; 1D:41C1
    ld   [$DE68],a                  ; 1D:41C2
    ret                             ; 1D:41C5
@Code1D41C6:
    ld   b,a                        ; 1D:41C6
    ld   a,[$DE69]                  ; 1D:41C7
    add  $40                        ; 1D:41CA
    cp   [hl]                       ; 1D:41CC
    jr   nz,@Code1D41DD             ; 1D:41CD
    cp   $63                        ; 1D:41CF
    jr   z,@Code1D41DD              ; 1D:41D1
    cp   $65                        ; 1D:41D3
    jr   z,@Code1D41DD              ; 1D:41D5
    cp   $68                        ; 1D:41D7
    jr   z,@Code1D41DD              ; 1D:41D9
    jr   @Code1D41C1                ; 1D:41DB
@Code1D41DD:
    ld   a,[hl]                     ; 1D:41DD
    cp   $6D                        ; 1D:41DE
    jr   nz,@Code1D41EA             ; 1D:41E0
    ld   a,[$DED1]                  ; 1D:41E2
    cp   $2D                        ; 1D:41E5
    jp   z,Unused1D418B             ; 1D:41E7
@Code1D41EA:
    ld   a,[$DECA]                  ; 1D:41EA
    ld   [$DECB],a                  ; 1D:41ED
    ldi  a,[hl]                     ; 1D:41F0
    ld   [$DECA],a                  ; 1D:41F1
    ld   [hl],a                     ; 1D:41F4
    xor  a                          ; 1D:41F5
    ld   [$DED2],a                  ; 1D:41F6
    ld   a,b                        ; 1D:41F9
    add  $C0                        ; 1D:41FA
    cp   $31                        ; 1D:41FC
    jr   nz,@Code1D4238             ; 1D:41FE
    ld   b,a                        ; 1D:4200
    ld   a,$01                      ; 1D:4201
    ld   [$DED0],a                  ; 1D:4203
    ld   a,[$DECB]                  ; 1D:4206
    cp   $62                        ; 1D:4209
    call z,@Sub1D4214               ; 1D:420B
    ld   [$DED5],a                  ; 1D:420E
    ld   a,b                        ; 1D:4211
    jr   @Code1D424E                ; 1D:4212
@Sub1D4214:
    ld   a,[$DE20]                  ; 1D:4214
    sub  $30                        ; 1D:4217
    ret                             ; 1D:4219

@Data1D421A:                        ; 1D:421A
.db $01,$01,$00,$01,$01,$00,$01,$00,\
    $00,$00,$00,$00,$00,$00,$00,$01,\
    $01,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$01,$00

@Code1D4238:
    ld   b,a                        ; 1D:4238
    sub  $22                        ; 1D:4239
    ld   hl,@Data1D421A             ; 1D:423B
    ld   e,a                        ; 1D:423E
    ld   d,$00                      ; 1D:423F
    add  hl,de                      ; 1D:4241
    ld   a,[hl]                     ; 1D:4242
    and  a                          ; 1D:4243
    jr   nz,@Code1D424A             ; 1D:4244
    xor  a                          ; 1D:4246
    ld   [$DED0],a                  ; 1D:4247
@Code1D424A:
    ld   a,b                        ; 1D:424A
    ld   hl,$DE69                   ; 1D:424B
@Code1D424E:
    dec  hl                         ; 1D:424E
    ldi  [hl],a                     ; 1D:424F
    ld   b,a                        ; 1D:4250
    ld   a,$01                      ; 1D:4251
    ld   [$DECE],a                  ; 1D:4253
    ld   a,b                        ; 1D:4256
    ld   [hl],a                     ; 1D:4257
    ld   b,a                        ; 1D:4258
    ld   hl,DataPtrs1D40A2          ; 1D:4259
    and  $7F                        ; 1D:425C
    call Sub1D4120                  ; 1D:425E
    call Sub1D446D                  ; 1D:4261
    jp   Code1D4411                 ; 1D:4264

Data1D4267:                         ; 1D:4267
.dw $0001,$FFFF,$0000,$0001,$FFFF,$0000,$0001,$FFFF,\
    $0000,$0001,$FFFF,$0000,$0001,$FFFF,$0000,$0001,\
    $FFFF,$0000,$0001,$FFFF,$0000,$0001,$FFFF,$0000,\
    $0001,$FFFF,$0000,$0001,$FFFF,$0000,$0001,$FFFF,\
    $0000,$0001,$FFFF,$0000,$0001,$FFFF,$0000,$0001,\
    $FFFF,$0000,$0001,$FFFF,$0000,$0001,$FFFF,$0000,\
    $0001,$FFFF,$0000,$0001,$FFFF,$0000,$0001,$FFFF,\
    $0000,$0001,$FFFF,$0000,$0001,$FFFF,$0000,$0001,\
    $FFFF,$0000,$0001,$FFFF,$0000,$0001,$FFFF,$0000,\
    $0001,$FFFF,$0000,$0001,$FFFF,$0000,$0001,$FFFF,\
    $0000,$0001,$FFFF,$0000,$0001,$FFFF,$0000,$0001,\
    $FFFF,$0000,$0001,$FFFF,$0000,$0001,$FFFF,$0000,\
    $0001,$FFFF,$0000,$0001,$FFFF,$0000,$0001,$FFFF,\
    $0000,$0001,$FFFF,$0000,$0001,$FFFF,$0000,$0001,\
    $FFFF,$0000,$0001,$FFFF,$0000,$0001,$FFFF,$0000,\
    $0001,$FFFF,$0000,$0001,$FFFF,$0000,$0001,$FFFF,\
    $0000,$0001,$FFFF,$0000,$0001,$FFFF,$0000,$0001,\
    $FFFF,$0000,$0001,$FFFF,$0000,$0001,$FFFF,$0000,\
    $0001,$FFFF,$0000,$0001,$FFFF,$0000,$0001,$FFFF,\
    $0000,$0001,$FFFF,$0000,$0001,$FFFF,$0000,$0001,\
    $FFFF,$0000,$0001,$FFFF,$0000,$0001,$FFFF,$0000,\
    $0001,$FFFF,$0000,$0001,$FFFF,$0000,$0001,$FFFF,\
    $0000,$0001,$FFFF,$0000,$0001,$FFFF,$0000,$0001,\
    $FFFF,$0000,$0001,$FFFF,$0000,$0001,$FFFF,$0000
Code1D43E7:
    ld   a,[$DEE7]                  ; 1D:43E7
    and  a                          ; 1D:43EA
    jp   z,Code1D4960               ; 1D:43EB
    xor  a                          ; 1D:43EE
    ldh  [<NR30],a                  ; 1D:43EF
    ld   [$DEE7],a                  ; 1D:43F1
    push hl                         ; 1D:43F4
    ld   a,[$DE36]                  ; 1D:43F5
    ld   l,a                        ; 1D:43F8
    ld   a,[$DE37]                  ; 1D:43F9
    ld   h,a                        ; 1D:43FC
    push bc                         ; 1D:43FD
    ld   c,$30                      ; 1D:43FE
Code1D4400:
    ldi  a,[hl]                     ; 1D:4400
    ldh  [c],a                      ; 1D:4401
    inc  c                          ; 1D:4402
    ld   a,c                        ; 1D:4403
    cp   $40                        ; 1D:4404
    jr   nz,Code1D4400              ; 1D:4406
    ld   a,$80                      ; 1D:4408
    ldh  [<NR30],a                  ; 1D:440A
    pop  bc                         ; 1D:440C
    pop  hl                         ; 1D:440D
    jp   Code1D4960                 ; 1D:440E

Code1D4411:
    ld   a,[$DE69]                  ; 1D:4411
    ld   hl,Data1D4267              ; 1D:4414
    ld   bc,$DE55                   ; 1D:4417
    ldi  a,[hl]                     ; 1D:441A
    ld   [bc],a                     ; 1D:441B
    inc  c                          ; 1D:441C
    xor  a                          ; 1D:441D
    ld   [bc],a                     ; 1D:441E
    inc  c                          ; 1D:441F
    ldi  a,[hl]                     ; 1D:4420
    ld   [bc],a                     ; 1D:4421
    inc  c                          ; 1D:4422
    xor  a                          ; 1D:4423
    ld   [bc],a                     ; 1D:4424
    inc  c                          ; 1D:4425
    ldi  a,[hl]                     ; 1D:4426
    ld   [bc],a                     ; 1D:4427
    ldh  [<NR51],a                  ; 1D:4428
    inc  c                          ; 1D:442A
    ldi  a,[hl]                     ; 1D:442B
    ld   [bc],a                     ; 1D:442C
    inc  c                          ; 1D:442D
    ldi  a,[hl]                     ; 1D:442E
    ld   [bc],a                     ; 1D:442F
    inc  c                          ; 1D:4430
    ldi  a,[hl]                     ; 1D:4431
    ld   [bc],a                     ; 1D:4432
    ret                             ; 1D:4433

Sub1D4434:
    ld   hl,$DE55                   ; 1D:4434
    ldi  a,[hl]                     ; 1D:4437
    cp   $01                        ; 1D:4438
    ret  z                          ; 1D:443A
    inc  [hl]                       ; 1D:443B
    ldi  a,[hl]                     ; 1D:443C
    cp   [hl]                       ; 1D:443D
    ret  nz                         ; 1D:443E
    dec  l                          ; 1D:443F
    ld   [hl],$00                   ; 1D:4440
    inc  l                          ; 1D:4442
    inc  l                          ; 1D:4443
    inc  [hl]                       ; 1D:4444
    ldi  a,[hl]                     ; 1D:4445
    and  $03                        ; 1D:4446
    ld   c,l                        ; 1D:4448
    ld   b,h                        ; 1D:4449
    and  a                          ; 1D:444A
    jr   z,Code1D4458               ; 1D:444B
    inc  c                          ; 1D:444D
    cp   $01                        ; 1D:444E
    jr   z,Code1D4458               ; 1D:4450
    inc  c                          ; 1D:4452
    cp   $02                        ; 1D:4453
    jr   z,Code1D4458               ; 1D:4455
    inc  c                          ; 1D:4457
Code1D4458:
    ld   a,[bc]                     ; 1D:4458
    ldh  [<NR51],a                  ; 1D:4459
    ret                             ; 1D:445B

Sub1D445C:
    ldi  a,[hl]                     ; 1D:445C
    ld   c,a                        ; 1D:445D
    ld   a,[hl]                     ; 1D:445E
    ld   b,a                        ; 1D:445F
    ld   a,[bc]                     ; 1D:4460
    ld   [de],a                     ; 1D:4461
    inc  e                          ; 1D:4462
    inc  bc                         ; 1D:4463
    ld   a,[bc]                     ; 1D:4464
    ld   [de],a                     ; 1D:4465
    ret                             ; 1D:4466

Sub1D4467:
    ldi  a,[hl]                     ; 1D:4467
    ld   [de],a                     ; 1D:4468
    inc  e                          ; 1D:4469
    ldi  a,[hl]                     ; 1D:446A
    ld   [de],a                     ; 1D:446B
    ret                             ; 1D:446C

Sub1D446D:
    ld   a,[$DE79]                  ; 1D:446D
    cp   $05                        ; 1D:4470
    jr   z,Code1D448F               ; 1D:4472
    cp   $0C                        ; 1D:4474
    jr   z,Code1D448F               ; 1D:4476
    cp   $1A                        ; 1D:4478
    jr   z,Code1D448F               ; 1D:447A
    cp   $24                        ; 1D:447C
    jr   z,Code1D448F               ; 1D:447E
    cp   $2A                        ; 1D:4480
    jr   z,Code1D448F               ; 1D:4482
    cp   $2E                        ; 1D:4484
    jr   z,Code1D448F               ; 1D:4486
    cp   $3F                        ; 1D:4488
    jr   z,Code1D448F               ; 1D:448A
    call Sub1D413C                  ; 1D:448C
Code1D448F:
    call Sub1D4DD0                  ; 1D:448F
    ld   de,$DE00                   ; 1D:4492
    ld   b,$00                      ; 1D:4495
    ldi  a,[hl]                     ; 1D:4497
    ld   [de],a                     ; 1D:4498
    inc  e                          ; 1D:4499
    call Sub1D4467                  ; 1D:449A
    ld   de,$DE10                   ; 1D:449D
    call Sub1D4467                  ; 1D:44A0
    ld   de,$DE20                   ; 1D:44A3
    call Sub1D4467                  ; 1D:44A6
    ld   de,$DE30                   ; 1D:44A9
    call Sub1D4467                  ; 1D:44AC
    ld   de,$DE40                   ; 1D:44AF
    call Sub1D4467                  ; 1D:44B2

Sub1D44B5:
    ld   hl,$DE10                   ; 1D:44B5
    ld   de,$DE14                   ; 1D:44B8
    call Sub1D445C                  ; 1D:44BB
    ld   hl,$DE20                   ; 1D:44BE
    ld   de,$DE24                   ; 1D:44C1
    call Sub1D445C                  ; 1D:44C4
    ld   hl,$DE30                   ; 1D:44C7
    ld   de,$DE34                   ; 1D:44CA
    call Sub1D445C                  ; 1D:44CD
    ld   hl,$DE40                   ; 1D:44D0
    ld   de,$DE44                   ; 1D:44D3
    call Sub1D445C                  ; 1D:44D6
    ld   bc,$0410                   ; 1D:44D9
    ld   hl,$DE12                   ; 1D:44DC
Code1D44DF:
    ld   [hl],$01                   ; 1D:44DF
    ld   a,c                        ; 1D:44E1
    add  l                          ; 1D:44E2
    ld   l,a                        ; 1D:44E3
    dec  b                          ; 1D:44E4
    jr   nz,Code1D44DF              ; 1D:44E5
    xor  a                          ; 1D:44E7
    ld   [$DE1E],a                  ; 1D:44E8
    ld   [$DE2E],a                  ; 1D:44EB
    ld   [$DE3E],a                  ; 1D:44EE
    ret                             ; 1D:44F1

Code1D44F2:
    push hl                         ; 1D:44F2
    ld   a,e                        ; 1D:44F3
    ld   [$DE36],a                  ; 1D:44F4
    ld   a,d                        ; 1D:44F7
    ld   [$DE37],a                  ; 1D:44F8
    ld   a,[$DE3F]                  ; 1D:44FB
    bit  7,a                        ; 1D:44FE
    jr   nz,Code1D4511              ; 1D:4500
    ldh  a,[<NR30]                  ; 1D:4502
    bit  7,a                        ; 1D:4504
    jr   z,Code1D450B               ; 1D:4506
    xor  a                          ; 1D:4508
    ldh  [<NR30],a                  ; 1D:4509
Code1D450B:
    xor  a                          ; 1D:450B
    ld   l,e                        ; 1D:450C
    ld   h,d                        ; 1D:450D
    call Sub1D412F                  ; 1D:450E
Code1D4511:
    pop  hl                         ; 1D:4511
    jr   Code1D453E                 ; 1D:4512
Code1D4514:
    call Sub1D4544                  ; 1D:4514
    call Sub1D4559                  ; 1D:4517
    ld   e,a                        ; 1D:451A
    call Sub1D4544                  ; 1D:451B
    call Sub1D4559                  ; 1D:451E
    ld   d,a                        ; 1D:4521
    call Sub1D4544                  ; 1D:4522
    call Sub1D4559                  ; 1D:4525
    ld   c,a                        ; 1D:4528
    inc  l                          ; 1D:4529
    inc  l                          ; 1D:452A
    ld   [hl],e                     ; 1D:452B
    inc  l                          ; 1D:452C
    ld   [hl],d                     ; 1D:452D
    inc  l                          ; 1D:452E
    ld   [hl],c                     ; 1D:452F
    dec  l                          ; 1D:4530
    dec  l                          ; 1D:4531
    dec  l                          ; 1D:4532
    dec  l                          ; 1D:4533
    push hl                         ; 1D:4534
    ld   hl,$DE50                   ; 1D:4535
    ld   a,[hl]                     ; 1D:4538
    pop  hl                         ; 1D:4539
    cp   $03                        ; 1D:453A
    jr   z,Code1D44F2               ; 1D:453C
Code1D453E:
    call Sub1D4544                  ; 1D:453E
    jp   Code1D4767                 ; 1D:4541

Sub1D4544:
    push de                         ; 1D:4544
    ldi  a,[hl]                     ; 1D:4545
    ld   e,a                        ; 1D:4546
    ldd  a,[hl]                     ; 1D:4547
    ld   d,a                        ; 1D:4548
    inc  de                         ; 1D:4549
Code1D454A:
    ld   a,e                        ; 1D:454A
    ldi  [hl],a                     ; 1D:454B
    ld   a,d                        ; 1D:454C
    ldd  [hl],a                     ; 1D:454D
    pop  de                         ; 1D:454E
    ret                             ; 1D:454F

Sub1D4550:
    push de                         ; 1D:4550
    ldi  a,[hl]                     ; 1D:4551
    ld   e,a                        ; 1D:4552
    ldd  a,[hl]                     ; 1D:4553
    ld   d,a                        ; 1D:4554
    inc  de                         ; 1D:4555
    inc  de                         ; 1D:4556
    jr   Code1D454A                 ; 1D:4557

Sub1D4559:
    ldi  a,[hl]                     ; 1D:4559
    ld   c,a                        ; 1D:455A
    ldd  a,[hl]                     ; 1D:455B
    ld   b,a                        ; 1D:455C
    ld   a,[bc]                     ; 1D:455D
    ld   b,a                        ; 1D:455E
    ret                             ; 1D:455F

Code1D4560:
    pop  hl                         ; 1D:4560
    jr   Code1D45B3                 ; 1D:4561
Code1D4563:
    ld   a,[$DE50]                  ; 1D:4563
    cp   $03                        ; 1D:4566
    jr   nz,Code1D4599              ; 1D:4568
    ld   a,[$DE3B]                  ; 1D:456A
    and  a                          ; 1D:456D
    jr   z,Code1D4589               ; 1D:456E
    cp   $03                        ; 1D:4570
    jr   z,Code1D4589               ; 1D:4572
    inc  a                          ; 1D:4574
    ld   [$DE3B],a                  ; 1D:4575
    ld   a,[$DE3F]                  ; 1D:4578
    bit  7,a                        ; 1D:457B
    jr   nz,Code1D4589              ; 1D:457D
    ld   a,[$DE3B]                  ; 1D:457F
    cp   $03                        ; 1D:4582
    jr   nz,Code1D4589              ; 1D:4584
    xor  a                          ; 1D:4586
    ldh  [<NR32],a                  ; 1D:4587
Code1D4589:
    ld   a,[$DE38]                  ; 1D:4589
    bit  7,a                        ; 1D:458C
    jr   z,Code1D4599               ; 1D:458E
    ld   a,[hl]                     ; 1D:4590
    cp   $06                        ; 1D:4591
    jr   nz,Code1D4599              ; 1D:4593
    ld   a,$40                      ; 1D:4595
    ldh  [<NR32],a                  ; 1D:4597
Code1D4599:
    push hl                         ; 1D:4599
    ld   a,l                        ; 1D:459A
    add  $09                        ; 1D:459B
    ld   l,a                        ; 1D:459D
    ld   a,[hl]                     ; 1D:459E
    and  a                          ; 1D:459F
    jr   nz,Code1D4560              ; 1D:45A0
    ld   a,l                        ; 1D:45A2
    add  $04                        ; 1D:45A3
    ld   l,a                        ; 1D:45A5
    bit  7,[hl]                     ; 1D:45A6
    jr   nz,Code1D4560              ; 1D:45A8
    pop  hl                         ; 1D:45AA
    call Sub1D49B8                  ; 1D:45AB
    push hl                         ; 1D:45AE
    call Sub1D4A41                  ; 1D:45AF
    pop  hl                         ; 1D:45B2
Code1D45B3:
    dec  l                          ; 1D:45B3
    dec  l                          ; 1D:45B4
    jp   Code1D4998                 ; 1D:45B5
Code1D45B8:
    dec  l                          ; 1D:45B8
    dec  l                          ; 1D:45B9
    dec  l                          ; 1D:45BA
    dec  l                          ; 1D:45BB
    call Sub1D4550                  ; 1D:45BC
Code1D45BF:
    ld   a,l                        ; 1D:45BF
    add  $04                        ; 1D:45C0
    ld   e,a                        ; 1D:45C2
    ld   d,h                        ; 1D:45C3
    call Sub1D445C                  ; 1D:45C4
    cp   $00                        ; 1D:45C7
    jr   z,Code1D45EA               ; 1D:45C9
    cp   $FF                        ; 1D:45CB
    jr   z,Code1D45D3               ; 1D:45CD
    inc  l                          ; 1D:45CF
    jp   Code1D4765                 ; 1D:45D0
Code1D45D3:
    dec  l                          ; 1D:45D3
    push hl                         ; 1D:45D4
    call Sub1D4550                  ; 1D:45D5
    call Sub1D4559                  ; 1D:45D8
    ld   e,a                        ; 1D:45DB
    call Sub1D4544                  ; 1D:45DC
    call Sub1D4559                  ; 1D:45DF
    ld   d,a                        ; 1D:45E2
    pop  hl                         ; 1D:45E3
    ld   a,e                        ; 1D:45E4
    ldi  [hl],a                     ; 1D:45E5
    ld   a,d                        ; 1D:45E6
    ldd  [hl],a                     ; 1D:45E7
    jr   Code1D45BF                 ; 1D:45E8
Code1D45EA:
    ld   a,[$DE69]                  ; 1D:45EA
    cp   $31                        ; 1D:45ED
    jp   nz,Code1D46A7              ; 1D:45EF
    ld   a,[$DED5]                  ; 1D:45F2
    cp   $62                        ; 1D:45F5
    jr   c,Code1D4603               ; 1D:45F7
    ld   [$DE68],a                  ; 1D:45F9
    xor  a                          ; 1D:45FC
    ld   [$DECE],a                  ; 1D:45FD
    jp   Code1D401E                 ; 1D:4600
Code1D4603:
    push af                         ; 1D:4603
    call Sub1D4158                  ; 1D:4604
    pop  af                         ; 1D:4607
    cp   $1C                        ; 1D:4608
    jr   nz,Code1D460E              ; 1D:460A
    ld   a,$02                      ; 1D:460C
Code1D460E:
    ld   hl,Data1D5132              ; 1D:460E
    ld   e,a                        ; 1D:4611
    ld   d,$00                      ; 1D:4612
    add  hl,de                      ; 1D:4614
    ld   de,$DE20                   ; 1D:4615
    call Sub1D46A1                  ; 1D:4618
    ld   de,$0022                   ; 1D:461B
    add  hl,de                      ; 1D:461E
    ld   de,$DE10                   ; 1D:461F
    call Sub1D46A1                  ; 1D:4622
    ld   de,$0022                   ; 1D:4625
    add  hl,de                      ; 1D:4628
    ld   de,$DE30                   ; 1D:4629
    call Sub1D46A1                  ; 1D:462C
    ld   de,$0020                   ; 1D:462F
    add  hl,de                      ; 1D:4632
    ld   de,$DE40                   ; 1D:4633
    call Sub1D46A1                  ; 1D:4636
    xor  a                          ; 1D:4639
    ld   [$DE00],a                  ; 1D:463A
    ld   hl,Data1D4D62              ; 1D:463D
    ld   de,$DE01                   ; 1D:4640
    call Sub1D46A1                  ; 1D:4643
    call Sub1D44B5                  ; 1D:4646
    ld   hl,$0067                   ; 1D:4649
    ld   de,$DE16                   ; 1D:464C
    call Sub1D46A1                  ; 1D:464F
    ld   de,$DE26                   ; 1D:4652
    call Sub1D46A1                  ; 1D:4655
    ld   hl,Data1D557F              ; 1D:4658
    ld   de,$DE36                   ; 1D:465B
    call Sub1D46A1                  ; 1D:465E
    ld   a,$80                      ; 1D:4661
    ld   [$DE18],a                  ; 1D:4663
    ld   [$DE28],a                  ; 1D:4666
    ld   a,$21                      ; 1D:4669
    ld   [$DE38],a                  ; 1D:466B
    ld   hl,$0000                   ; 1D:466E
    ld   de,$DE1C                   ; 1D:4671
    call Sub1D46A1                  ; 1D:4674
    ld   de,$DE2C                   ; 1D:4677
    call Sub1D46A1                  ; 1D:467A
    ld   de,$DE3C                   ; 1D:467D
    call Sub1D46A1                  ; 1D:4680
    ld   de,$DE4C                   ; 1D:4683
    call Sub1D46A1                  ; 1D:4686
    xor  a                          ; 1D:4689
    ld   [$DE1B],a                  ; 1D:468A
    ld   [$DE2B],a                  ; 1D:468D
    ld   [$DE3B],a                  ; 1D:4690
    ld   [$DE4B],a                  ; 1D:4693
    ld   a,$22                      ; 1D:4696
    ld   [$DE69],a                  ; 1D:4698
    ld   a,$62                      ; 1D:469B
    ld   [$DECA],a                  ; 1D:469D
    ret                             ; 1D:46A0

Sub1D46A1:
    ld   a,l                        ; 1D:46A1
    ld   [de],a                     ; 1D:46A2
    inc  de                         ; 1D:46A3
    ld   a,h                        ; 1D:46A4
    ld   [de],a                     ; 1D:46A5
    ret                             ; 1D:46A6

Code1D46A7:
    ld   hl,$DE69                   ; 1D:46A7
    ld   [hl],$00                   ; 1D:46AA
    call Sub1D4158                  ; 1D:46AC
    ret                             ; 1D:46AF

    call Sub1D4544                  ; 1D:46B0
    call Sub1D4559                  ; 1D:46B3
    ld   [$DE01],a                  ; 1D:46B6
    call Sub1D4544                  ; 1D:46B9
    call Sub1D4559                  ; 1D:46BC
    ld   [$DE02],a                  ; 1D:46BF
    jr   Code1D46CD                 ; 1D:46C2

    call Sub1D4544                  ; 1D:46C4
    call Sub1D4559                  ; 1D:46C7
    ld   [$DE00],a                  ; 1D:46CA
Code1D46CD:
    call Sub1D4544                  ; 1D:46CD
    jp   Code1D4767                 ; 1D:46D0
Code1D46D3:
    call Sub1D4544                  ; 1D:46D3
    call Sub1D4559                  ; 1D:46D6
    push hl                         ; 1D:46D9
    ld   a,l                        ; 1D:46DA
    add  $0B                        ; 1D:46DB
    ld   l,a                        ; 1D:46DD
    ld   c,[hl]                     ; 1D:46DE
    ld   a,b                        ; 1D:46DF
    or   c                          ; 1D:46E0
    ld   [hl],a                     ; 1D:46E1
    ld   b,h                        ; 1D:46E2
    ld   c,l                        ; 1D:46E3
    dec  c                          ; 1D:46E4
    dec  c                          ; 1D:46E5
    pop  hl                         ; 1D:46E6
    ldi  a,[hl]                     ; 1D:46E7
    ld   e,a                        ; 1D:46E8
    ldd  a,[hl]                     ; 1D:46E9
    ld   d,a                        ; 1D:46EA
    inc  de                         ; 1D:46EB
    ld   a,e                        ; 1D:46EC
    ldi  [hl],a                     ; 1D:46ED
    ld   a,d                        ; 1D:46EE
    ldd  [hl],a                     ; 1D:46EF
    ld   a,d                        ; 1D:46F0
    ld   [bc],a                     ; 1D:46F1
    dec  c                          ; 1D:46F2
    ld   a,e                        ; 1D:46F3
    ld   [bc],a                     ; 1D:46F4
    jr   Code1D4767                 ; 1D:46F5
Code1D46F7:
    push hl                         ; 1D:46F7
    ld   a,l                        ; 1D:46F8
    add  $0B                        ; 1D:46F9
    ld   l,a                        ; 1D:46FB
    ld   a,[hl]                     ; 1D:46FC
    dec  [hl]                       ; 1D:46FD
    ld   a,[hl]                     ; 1D:46FE
    and  $7F                        ; 1D:46FF
    jr   z,Code1D4710               ; 1D:4701
    ld   b,h                        ; 1D:4703
    ld   c,l                        ; 1D:4704
    dec  c                          ; 1D:4705
    dec  c                          ; 1D:4706
    dec  c                          ; 1D:4707
    pop  hl                         ; 1D:4708
    ld   a,[bc]                     ; 1D:4709
    ldi  [hl],a                     ; 1D:470A
    inc  c                          ; 1D:470B
    ld   a,[bc]                     ; 1D:470C
    ldd  [hl],a                     ; 1D:470D
    jr   Code1D4767                 ; 1D:470E
Code1D4710:
    pop  hl                         ; 1D:4710
    jr   Code1D46CD                 ; 1D:4711
Code1D4713:
    call Sub1D4544                  ; 1D:4713
    call Sub1D4559                  ; 1D:4716
    and  $77                        ; 1D:4719
    ldh  [<NR50],a                  ; 1D:471B
    call Sub1D4544                  ; 1D:471D
    jr   Code1D4767                 ; 1D:4720
Code1D4722:
    call Sub1D4544                  ; 1D:4722
    call Sub1D4559                  ; 1D:4725
    ld   b,a                        ; 1D:4728
    ld   a,[$DE50]                  ; 1D:4729
    cp   $01                        ; 1D:472C
    jr   z,Code1D4739               ; 1D:472E
    cp   $02                        ; 1D:4730
    jr   z,Code1D473F               ; 1D:4732
Code1D4734:
    call Sub1D4544                  ; 1D:4734
    jr   Code1D4767                 ; 1D:4737
Code1D4739:
    ld   a,b                        ; 1D:4739
    ld   [$DE80],a                  ; 1D:473A
    jr   Code1D4734                 ; 1D:473D
Code1D473F:
    ld   a,b                        ; 1D:473F
    ld   [$DE81],a                  ; 1D:4740
    jr   Code1D4734                 ; 1D:4743

Sub1D4745:
    ld   hl,$DE69                   ; 1D:4745
    ld   a,[hl]                     ; 1D:4748
    and  a                          ; 1D:4749
    ret  z                          ; 1D:474A
    ld   a,[$DECE]                  ; 1D:474B
    and  a                          ; 1D:474E
    ret  z                          ; 1D:474F
    call Sub1D4434                  ; 1D:4750
    ld   a,$01                      ; 1D:4753
    ld   [$DE50],a                  ; 1D:4755
    ld   hl,$DE10                   ; 1D:4758
Code1D475B:
    inc  l                          ; 1D:475B
    ldi  a,[hl]                     ; 1D:475C
    and  a                          ; 1D:475D
    jp   z,Code1D45B3               ; 1D:475E
    dec  [hl]                       ; 1D:4761
    jp   nz,Code1D4563              ; 1D:4762
Code1D4765:
    inc  l                          ; 1D:4765
    inc  l                          ; 1D:4766
Code1D4767:
    call Sub1D4559                  ; 1D:4767
    cp   $00                        ; 1D:476A
    jp   z,Code1D45B8               ; 1D:476C
    cp   $9D                        ; 1D:476F
    jp   z,Code1D4514               ; 1D:4771
    cp   $9B                        ; 1D:4774
    jp   z,Code1D46D3               ; 1D:4776
    cp   $9C                        ; 1D:4779
    jp   z,Code1D46F7               ; 1D:477B
    cp   $97                        ; 1D:477E
    jp   z,Code1D4B16               ; 1D:4780
    cp   $98                        ; 1D:4783
    jp   z,Code1D4B25               ; 1D:4785
    cp   $9A                        ; 1D:4788
    jp   z,Code1D4713               ; 1D:478A
    cp   $99                        ; 1D:478D
    jp   z,Code1D4722               ; 1D:478F
    and  $F0                        ; 1D:4792
    cp   $A0                        ; 1D:4794
    jr   nz,Code1D480C              ; 1D:4796
    ld   a,b                        ; 1D:4798
    and  $0F                        ; 1D:4799
    ld   c,a                        ; 1D:479B
    ld   b,$00                      ; 1D:479C
    push hl                         ; 1D:479E
    ld   de,$DE01                   ; 1D:479F
    ld   a,[de]                     ; 1D:47A2
    ld   l,a                        ; 1D:47A3
    inc  e                          ; 1D:47A4
    ld   a,[de]                     ; 1D:47A5
    ld   h,a                        ; 1D:47A6
    ld   a,[$DED0]                  ; 1D:47A7
    and  a                          ; 1D:47AA
    jr   z,Code1D47CE               ; 1D:47AB
    ld   a,[$DECA]                  ; 1D:47AD
    cp   $68                        ; 1D:47B0
    jr   z,Code1D47C1               ; 1D:47B2
    cp   $65                        ; 1D:47B4
    jr   z,Code1D47CB               ; 1D:47B6
    cp   $7E                        ; 1D:47B8
    jr   z,Code1D47C6               ; 1D:47BA
    ld   hl,Data1D4D08              ; 1D:47BC
    jr   Code1D47CE                 ; 1D:47BF
Code1D47C1:
    ld   hl,Data1D4D17              ; 1D:47C1
    jr   Code1D47CE                 ; 1D:47C4
Code1D47C6:
    ld   hl,Data1D4D17              ; 1D:47C6
    jr   Code1D47CE                 ; 1D:47C9
Code1D47CB:
    ld   hl,Data1D4D80              ; 1D:47CB
Code1D47CE:
    add  hl,bc                      ; 1D:47CE
    ld   a,[hl]                     ; 1D:47CF
    pop  hl                         ; 1D:47D0
    push hl                         ; 1D:47D1
    ld   d,a                        ; 1D:47D2
    inc  l                          ; 1D:47D3
    inc  l                          ; 1D:47D4
    inc  l                          ; 1D:47D5
    ld   a,[hl]                     ; 1D:47D6
    and  $F0                        ; 1D:47D7
    jr   nz,Code1D47DE              ; 1D:47D9
    ld   a,d                        ; 1D:47DB
    jr   Code1D4803                 ; 1D:47DC
Code1D47DE:
    ld   e,a                        ; 1D:47DE
    ld   a,d                        ; 1D:47DF
    push af                         ; 1D:47E0
    srl  a                          ; 1D:47E1
    sla  e                          ; 1D:47E3
    jr   c,Code1D47EF               ; 1D:47E5
    ld   d,a                        ; 1D:47E7
    srl  a                          ; 1D:47E8
    sla  e                          ; 1D:47EA
    jr   c,Code1D47EF               ; 1D:47EC
    add  d                          ; 1D:47EE
Code1D47EF:
    ld   c,a                        ; 1D:47EF
    and  a                          ; 1D:47F0
    jr   nz,Code1D47F5              ; 1D:47F1
    ld   c,$02                      ; 1D:47F3
Code1D47F5:
    ld   de,$DE50                   ; 1D:47F5
    ld   a,[de]                     ; 1D:47F8
    dec  a                          ; 1D:47F9
    ld   e,a                        ; 1D:47FA
    ld   d,$00                      ; 1D:47FB
    ld   hl,$DE07                   ; 1D:47FD
    add  hl,de                      ; 1D:4800
    ld   [hl],c                     ; 1D:4801
    pop  af                         ; 1D:4802
Code1D4803:
    pop  hl                         ; 1D:4803
    dec  l                          ; 1D:4804
    ldi  [hl],a                     ; 1D:4805
    call Sub1D4544                  ; 1D:4806
    call Sub1D4559                  ; 1D:4809
Code1D480C:
    ld   a,[$DE50]                  ; 1D:480C
    cp   $04                        ; 1D:480F
    jr   z,Code1D484B               ; 1D:4811
    push de                         ; 1D:4813
    ld   de,$DEB0                   ; 1D:4814
    call Sub1D4B65                  ; 1D:4817
    xor  a                          ; 1D:481A
    ld   [de],a                     ; 1D:481B
    inc  e                          ; 1D:481C
    ld   [de],a                     ; 1D:481D
    ld   de,$DEB6                   ; 1D:481E
    call Sub1D4B65                  ; 1D:4821
    inc  e                          ; 1D:4824
    xor  a                          ; 1D:4825
    ld   [de],a                     ; 1D:4826
    ld   a,[$DE50]                  ; 1D:4827
    cp   $03                        ; 1D:482A
    jr   nz,Code1D484A              ; 1D:482C
    ld   de,$DE9E                   ; 1D:482E
    ld   a,[de]                     ; 1D:4831
    and  a                          ; 1D:4832
    jr   z,Code1D483C               ; 1D:4833
    ld   a,$01                      ; 1D:4835
    ld   [de],a                     ; 1D:4837
    xor  a                          ; 1D:4838
    ld   [$DE9F],a                  ; 1D:4839
Code1D483C:
    ld   de,$DED9                   ; 1D:483C
    ld   a,[de]                     ; 1D:483F
    and  a                          ; 1D:4840
    jr   z,Code1D484A               ; 1D:4841
    ld   a,$01                      ; 1D:4843
    ld   [de],a                     ; 1D:4845
    xor  a                          ; 1D:4846
    ld   [$DEDA],a                  ; 1D:4847
Code1D484A:
    pop  de                         ; 1D:484A
Code1D484B:
    ld   c,b                        ; 1D:484B
    ld   b,$00                      ; 1D:484C
    call Sub1D4544                  ; 1D:484E
    ld   a,[$DE50]                  ; 1D:4851
    cp   $04                        ; 1D:4854
    jp   z,Code1D4891               ; 1D:4856
    push hl                         ; 1D:4859
    ld   a,l                        ; 1D:485A
    add  $05                        ; 1D:485B
    ld   l,a                        ; 1D:485D
    ld   e,l                        ; 1D:485E
    ld   d,h                        ; 1D:485F
    inc  l                          ; 1D:4860
    inc  l                          ; 1D:4861
    ld   a,c                        ; 1D:4862
    cp   $01                        ; 1D:4863
    jr   z,Code1D4888               ; 1D:4865
    ld   [hl],$00                   ; 1D:4867
    ld   a,[$DE00]                  ; 1D:4869
    and  a                          ; 1D:486C
    jr   z,Code1D487B               ; 1D:486D
    ld   l,a                        ; 1D:486F
    ld   h,$00                      ; 1D:4870
    bit  7,l                        ; 1D:4872
    jr   z,Code1D4878               ; 1D:4874
    ld   h,$FF                      ; 1D:4876
Code1D4878:
    add  hl,bc                      ; 1D:4878
    ld   b,h                        ; 1D:4879
    ld   c,l                        ; 1D:487A
Code1D487B:
    ld   hl,Data1D4C2F              ; 1D:487B
    add  hl,bc                      ; 1D:487E
    ldi  a,[hl]                     ; 1D:487F
    ld   [de],a                     ; 1D:4880
    inc  e                          ; 1D:4881
    ld   a,[hl]                     ; 1D:4882
    ld   [de],a                     ; 1D:4883
    pop  hl                         ; 1D:4884
    jp   Code1D48C2                 ; 1D:4885
Code1D4888:
    ld   a,[hl]                     ; 1D:4888
    and  a                          ; 1D:4889
    jr   nz,Code1D488E              ; 1D:488A
    ld   [hl],$01                   ; 1D:488C
Code1D488E:
    pop  hl                         ; 1D:488E
    jr   Code1D48C2                 ; 1D:488F
Code1D4891:
    push hl                         ; 1D:4891
    ld   a,c                        ; 1D:4892
    cp   $FF                        ; 1D:4893
    jr   z,Code1D48AF               ; 1D:4895
    ld   de,$DE46                   ; 1D:4897
    ld   hl,Data1D4CC1              ; 1D:489A
    add  hl,bc                      ; 1D:489D
Code1D489E:
    ldi  a,[hl]                     ; 1D:489E
    ld   [de],a                     ; 1D:489F
    inc  e                          ; 1D:48A0
    ld   a,e                        ; 1D:48A1
    cp   $4B                        ; 1D:48A2
    jr   nz,Code1D489E              ; 1D:48A4
    ld   c,$20                      ; 1D:48A6
    ld   hl,$DE44                   ; 1D:48A8
    ld   b,$00                      ; 1D:48AB
    jr   Code1D48FF                 ; 1D:48AD
Code1D48AF:
    ld   a,[$DE4F]                  ; 1D:48AF
    bit  7,a                        ; 1D:48B2
    jp   nz,Code1D4993              ; 1D:48B4
    ld   a,$01                      ; 1D:48B7
    ld   [$DE78],a                  ; 1D:48B9
    call Sub1D4062                  ; 1D:48BC
    jp   Code1D4993                 ; 1D:48BF
Code1D48C2:
    push hl                         ; 1D:48C2
    ld   b,$00                      ; 1D:48C3
    ld   a,[$DE50]                  ; 1D:48C5
    cp   $01                        ; 1D:48C8
    jr   z,Code1D48FC               ; 1D:48CA
    cp   $02                        ; 1D:48CC
    jr   z,Code1D48F8               ; 1D:48CE
    ld   c,$1A                      ; 1D:48D0
    ld   a,[$DE3F]                  ; 1D:48D2
    bit  7,a                        ; 1D:48D5
    jr   nz,Code1D48ED              ; 1D:48D7
    ldh  a,[c]                      ; 1D:48D9
    bit  7,a                        ; 1D:48DA
    jr   z,Code1D48E8               ; 1D:48DC
    ldh  a,[<NR52]                  ; 1D:48DE
    bit  3,a                        ; 1D:48E0
    jr   z,Code1D48E6               ; 1D:48E2
    jr   Code1D48ED                 ; 1D:48E4
Code1D48E6:
    xor  a                          ; 1D:48E6
    ldh  [c],a                      ; 1D:48E7
Code1D48E8:
    ld   a,$80                      ; 1D:48E8
    ldh  [c],a                      ; 1D:48EA
    ldh  [<NR34],a                  ; 1D:48EB
Code1D48ED:
    inc  c                          ; 1D:48ED
    inc  l                          ; 1D:48EE
    inc  l                          ; 1D:48EF
    inc  l                          ; 1D:48F0
    inc  l                          ; 1D:48F1
    ldi  a,[hl]                     ; 1D:48F2
    ld   e,a                        ; 1D:48F3
    ld   d,$00                      ; 1D:48F4
    jr   Code1D4910                 ; 1D:48F6
Code1D48F8:
    ld   c,$16                      ; 1D:48F8
    jr   Code1D48FF                 ; 1D:48FA
Code1D48FC:
    ld   c,$10                      ; 1D:48FC
    inc  c                          ; 1D:48FE
Code1D48FF:
    inc  l                          ; 1D:48FF
    inc  l                          ; 1D:4900
    ldi  a,[hl]                     ; 1D:4901
    ld   e,a                        ; 1D:4902
    ld   a,[hl]                     ; 1D:4903
    and  a                          ; 1D:4904
    jr   z,Code1D490D               ; 1D:4905
    push hl                         ; 1D:4907
    ldd  a,[hl]                     ; 1D:4908
    ld   l,[hl]                     ; 1D:4909
    ld   h,a                        ; 1D:490A
    ld   e,[hl]                     ; 1D:490B
    pop  hl                         ; 1D:490C
Code1D490D:
    inc  l                          ; 1D:490D
    ldi  a,[hl]                     ; 1D:490E
    ld   d,a                        ; 1D:490F
Code1D4910:
    push hl                         ; 1D:4910
    inc  l                          ; 1D:4911
    inc  l                          ; 1D:4912
    ldi  a,[hl]                     ; 1D:4913
    and  a                          ; 1D:4914
    jr   z,Code1D494D               ; 1D:4915
    cp   $01                        ; 1D:4917
    jr   nz,Code1D4946              ; 1D:4919
    dec  hl                         ; 1D:491B
    ld   [hl],$02                   ; 1D:491C
    inc  hl                         ; 1D:491E
    ld   a,[$DE50]                  ; 1D:491F
    cp   $03                        ; 1D:4922
    jr   z,Code1D4949               ; 1D:4924
    cp   $02                        ; 1D:4926
    jr   z,Code1D4936               ; 1D:4928
    ld   a,[$DED2]                  ; 1D:492A
    bit  0,a                        ; 1D:492D
    jr   z,Code1D4946               ; 1D:492F
    ld   a,[$DE80]                  ; 1D:4931
    jr   Code1D4940                 ; 1D:4934
Code1D4936:
    ld   a,[$DED2]                  ; 1D:4936
    bit  1,a                        ; 1D:4939
    jr   z,Code1D4946               ; 1D:493B
    ld   a,[$DE81]                  ; 1D:493D
Code1D4940:
    and  a                          ; 1D:4940
    jr   z,Code1D4946               ; 1D:4941
    ld   e,a                        ; 1D:4943
    jr   Code1D494D                 ; 1D:4944
Code1D4946:
    pop  hl                         ; 1D:4946
    jr   Code1D4993                 ; 1D:4947
Code1D4949:
    ld   e,$40                      ; 1D:4949
    jr   Code1D494D                 ; 1D:494B
Code1D494D:
    inc  l                          ; 1D:494D
    inc  l                          ; 1D:494E
    ld   [hl],$00                   ; 1D:494F
    inc  l                          ; 1D:4951
    ld   a,[hl]                     ; 1D:4952
    pop  hl                         ; 1D:4953
    bit  7,a                        ; 1D:4954
    jr   nz,Code1D4993              ; 1D:4956
    ld   a,[$DE50]                  ; 1D:4958
    cp   $03                        ; 1D:495B
    jp   z,Code1D43E7               ; 1D:495D
Code1D4960:
    ld   a,d                        ; 1D:4960
    or   b                          ; 1D:4961
    ldh  [c],a                      ; 1D:4962
    inc  c                          ; 1D:4963
    ld   a,e                        ; 1D:4964
    ldh  [c],a                      ; 1D:4965
    inc  c                          ; 1D:4966
    ldi  a,[hl]                     ; 1D:4967
    ldh  [c],a                      ; 1D:4968
    ld   a,[$DE50]                  ; 1D:4969
    cp   $01                        ; 1D:496C
    jr   z,Code1D4986               ; 1D:496E
    cp   $02                        ; 1D:4970
    jr   z,Code1D497C               ; 1D:4972
    cp   $03                        ; 1D:4974
    jr   nz,Code1D498E              ; 1D:4976
    inc  c                          ; 1D:4978
    ld   a,[hl]                     ; 1D:4979
    jr   Code1D4992                 ; 1D:497A
Code1D497C:
    ld   a,[$DED2]                  ; 1D:497C
    set  1,a                        ; 1D:497F
    ld   [$DED2],a                  ; 1D:4981
    jr   Code1D498E                 ; 1D:4984
Code1D4986:
    ld   a,[$DED2]                  ; 1D:4986
    set  0,a                        ; 1D:4989
    ld   [$DED2],a                  ; 1D:498B
Code1D498E:
    inc  c                          ; 1D:498E
    ld   a,[hl]                     ; 1D:498F
    or   $80                        ; 1D:4990
Code1D4992:
    ldh  [c],a                      ; 1D:4992
Code1D4993:
    pop  hl                         ; 1D:4993
    dec  l                          ; 1D:4994
    ldd  a,[hl]                     ; 1D:4995
    ldd  [hl],a                     ; 1D:4996
    dec  l                          ; 1D:4997
Code1D4998:
    ld   de,$DE50                   ; 1D:4998
    ld   a,[de]                     ; 1D:499B
    cp   $04                        ; 1D:499C
    jr   z,Code1D49A9               ; 1D:499E
    inc  a                          ; 1D:49A0
    ld   [de],a                     ; 1D:49A1
    ld   a,$10                      ; 1D:49A2
    add  l                          ; 1D:49A4
    ld   l,a                        ; 1D:49A5
    jp   Code1D475B                 ; 1D:49A6
Code1D49A9:
    ld   hl,$DE1E                   ; 1D:49A9
    inc  [hl]                       ; 1D:49AC
    ld   hl,$DE2E                   ; 1D:49AD
    inc  [hl]                       ; 1D:49B0
    ld   hl,$DE3E                   ; 1D:49B1
    inc  [hl]                       ; 1D:49B4
    ret                             ; 1D:49B5

Code1D49B6:
    pop  hl                         ; 1D:49B6
    ret                             ; 1D:49B7

Sub1D49B8:
    push hl                         ; 1D:49B8
    ld   a,l                        ; 1D:49B9
    add  $06                        ; 1D:49BA
    ld   l,a                        ; 1D:49BC
    ld   a,[hl]                     ; 1D:49BD
    and  $0F                        ; 1D:49BE
    jr   z,Code1D49DA               ; 1D:49C0
    ld   [$DE51],a                  ; 1D:49C2
    ld   a,[$DE50]                  ; 1D:49C5
    ld   c,$13                      ; 1D:49C8
    cp   $01                        ; 1D:49CA
    jr   z,Code1D4A1C               ; 1D:49CC
    ld   c,$18                      ; 1D:49CE
    cp   $02                        ; 1D:49D0
    jr   z,Code1D4A1C               ; 1D:49D2
    ld   c,$1D                      ; 1D:49D4
    cp   $03                        ; 1D:49D6
    jr   z,Code1D4A1C               ; 1D:49D8
Code1D49DA:
    ld   a,[$DE50]                  ; 1D:49DA
    cp   $04                        ; 1D:49DD
    jp   z,Code1D49B6               ; 1D:49DF
    ld   de,$DEB6                   ; 1D:49E2
    call Sub1D4B65                  ; 1D:49E5
    ld   a,[de]                     ; 1D:49E8
    and  a                          ; 1D:49E9
    jp   z,Code1D4A03               ; 1D:49EA
    ld   a,[$DE50]                  ; 1D:49ED
    ld   c,$13                      ; 1D:49F0
    cp   $01                        ; 1D:49F2
    jp   z,Code1D4B2E               ; 1D:49F4
    ld   c,$18                      ; 1D:49F7
    cp   $02                        ; 1D:49F9
    jp   z,Code1D4B2E               ; 1D:49FB
    ld   c,$1D                      ; 1D:49FE
    jp   Code1D4B2E                 ; 1D:4A00
Code1D4A03:
    ld   a,[$DE50]                  ; 1D:4A03
    cp   $03                        ; 1D:4A06
    jp   nz,Code1D49B6              ; 1D:4A08
    ld   a,[$DE9E]                  ; 1D:4A0B
    and  a                          ; 1D:4A0E
    jp   nz,Code1D4AE0              ; 1D:4A0F
    ld   a,[$DED9]                  ; 1D:4A12
    and  a                          ; 1D:4A15
    jp   nz,Code1D4C05              ; 1D:4A16
    jp   Code1D49B6                 ; 1D:4A19
Code1D4A1C:
    inc  l                          ; 1D:4A1C
    ldi  a,[hl]                     ; 1D:4A1D
    ld   e,a                        ; 1D:4A1E
    ld   a,[hl]                     ; 1D:4A1F
    and  $0F                        ; 1D:4A20
    ld   d,a                        ; 1D:4A22
    push de                         ; 1D:4A23
    ld   a,l                        ; 1D:4A24
    add  $04                        ; 1D:4A25
    ld   l,a                        ; 1D:4A27
    ld   b,[hl]                     ; 1D:4A28
    ld   a,[$DE51]                  ; 1D:4A29
    cp   $01                        ; 1D:4A2C
    jp   z,Code1D4B8D               ; 1D:4A2E
    cp   $02                        ; 1D:4A31
    jp   z,Code1D4B7B               ; 1D:4A33
    ld   hl,IE                      ; 1D:4A36
    pop  de                         ; 1D:4A39
    add  hl,de                      ; 1D:4A3A
    call Sub1D4B54                  ; 1D:4A3B
    jp   Code1D49DA                 ; 1D:4A3E

Sub1D4A41:
    ld   a,[$DE1B]                  ; 1D:4A41
    and  a                          ; 1D:4A44
    jr   nz,Code1D4A85              ; 1D:4A45
    ld   a,[$DE17]                  ; 1D:4A47
    and  a                          ; 1D:4A4A
    jr   z,Code1D4A85               ; 1D:4A4B
    ld   a,[$DED2]                  ; 1D:4A4D
    bit  0,a                        ; 1D:4A50
    jr   z,Code1D4A85               ; 1D:4A52
    ld   a,[$DE1F]                  ; 1D:4A54
    bit  7,a                        ; 1D:4A57
    jr   nz,Code1D4A85              ; 1D:4A59
    ld   a,[$DE16]                  ; 1D:4A5B
    ld   l,a                        ; 1D:4A5E
    ld   a,[$DE17]                  ; 1D:4A5F
    ld   h,a                        ; 1D:4A62
    ld   a,[$DE1E]                  ; 1D:4A63
    and  a                          ; 1D:4A66
    jr   z,Code1D4A85               ; 1D:4A67
    cp   $30                        ; 1D:4A69
    jr   nc,Code1D4A85              ; 1D:4A6B
    ld   e,a                        ; 1D:4A6D
    ld   d,$00                      ; 1D:4A6E
    add  hl,de                      ; 1D:4A70
    ld   a,[hl]                     ; 1D:4A71
    and  a                          ; 1D:4A72
    jr   z,Code1D4A85               ; 1D:4A73
    ldh  [<NR12],a                  ; 1D:4A75
    ld   a,[$DE19]                  ; 1D:4A77
    ldh  [<NR13],a                  ; 1D:4A7A
    ld   a,[$DE1A]                  ; 1D:4A7C
    or   $80                        ; 1D:4A7F
    ldh  [<NR14],a                  ; 1D:4A81
    jr   Code1D4A85                 ; 1D:4A83
Code1D4A85:
    ld   a,[$DE2B]                  ; 1D:4A85
    and  a                          ; 1D:4A88
    ret  nz                         ; 1D:4A89
    ld   a,[$DE27]                  ; 1D:4A8A
    and  a                          ; 1D:4A8D
    ret  z                          ; 1D:4A8E
    ld   a,[$DED2]                  ; 1D:4A8F
    bit  1,a                        ; 1D:4A92
    ret  z                          ; 1D:4A94
    ld   a,[$DE2F]                  ; 1D:4A95
    bit  7,a                        ; 1D:4A98
    ret  nz                         ; 1D:4A9A
    ld   a,[$DE26]                  ; 1D:4A9B
    ld   l,a                        ; 1D:4A9E
    ld   a,[$DE27]                  ; 1D:4A9F
    ld   h,a                        ; 1D:4AA2
    ld   a,[$DE2E]                  ; 1D:4AA3
    and  a                          ; 1D:4AA6
    ret  z                          ; 1D:4AA7
    cp   $30                        ; 1D:4AA8
    ret  nc                         ; 1D:4AAA
    ld   e,a                        ; 1D:4AAB
    ld   d,$00                      ; 1D:4AAC
    add  hl,de                      ; 1D:4AAE
    ld   a,[hl]                     ; 1D:4AAF
    and  a                          ; 1D:4AB0
    ret  z                          ; 1D:4AB1
    ldh  [<NR22],a                  ; 1D:4AB2
    ld   a,[$DE29]                  ; 1D:4AB4
    ldh  [<NR23],a                  ; 1D:4AB7
    ld   a,[$DE2A]                  ; 1D:4AB9
    or   $80                        ; 1D:4ABC
    ldh  [<NR24],a                  ; 1D:4ABE
    ret                             ; 1D:4AC0

    ld   a,$01                      ; 1D:4AC1
Code1D4AC3:
    ld   [$DECD],a                  ; 1D:4AC3
    call Sub1D4544                  ; 1D:4AC6
    jp   Code1D4767                 ; 1D:4AC9
    xor  a                          ; 1D:4ACC
    jr   Code1D4AC3                 ; 1D:4ACD
    ld   a,$01                      ; 1D:4ACF
Code1D4AD1:
    ld   [$DE9E],a                  ; 1D:4AD1
    call Sub1D4544                  ; 1D:4AD4
    jp   Code1D4767                 ; 1D:4AD7
    xor  a                          ; 1D:4ADA
    ld   [$DE9E],a                  ; 1D:4ADB
    jr   Code1D4AD1                 ; 1D:4ADE
Code1D4AE0:
    cp   $02                        ; 1D:4AE0
    jp   z,Code1D49B6               ; 1D:4AE2
    ld   bc,$DE9F                   ; 1D:4AE5
    call Sub1D4B12                  ; 1D:4AE8
    ld   c,$1C                      ; 1D:4AEB
    ld   b,$40                      ; 1D:4AED
    cp   $03                        ; 1D:4AEF
    jr   z,Code1D4B0D               ; 1D:4AF1
    ld   b,$60                      ; 1D:4AF3
    cp   $05                        ; 1D:4AF5
    jr   z,Code1D4B0D               ; 1D:4AF7
    cp   $0A                        ; 1D:4AF9
    jr   z,Code1D4B0D               ; 1D:4AFB
    ld   b,$00                      ; 1D:4AFD
    cp   $07                        ; 1D:4AFF
    jr   z,Code1D4B0D               ; 1D:4B01
    cp   $0D                        ; 1D:4B03
    jp   nz,Code1D49B6              ; 1D:4B05
    ld   a,$02                      ; 1D:4B08
    ld   [$DE9E],a                  ; 1D:4B0A
Code1D4B0D:
    ld   a,b                        ; 1D:4B0D
    ldh  [c],a                      ; 1D:4B0E
    jp   Code1D49B6                 ; 1D:4B0F

Sub1D4B12:
    ld   a,[bc]                     ; 1D:4B12
    inc  a                          ; 1D:4B13
    ld   [bc],a                     ; 1D:4B14
    ret                             ; 1D:4B15

Code1D4B16:
    ld   de,$DEB6                   ; 1D:4B16
    call Sub1D4B65                  ; 1D:4B19
    ld   a,$01                      ; 1D:4B1C
Code1D4B1E:
    ld   [de],a                     ; 1D:4B1E
    call Sub1D4544                  ; 1D:4B1F
    jp   Code1D4767                 ; 1D:4B22
Code1D4B25:
    ld   de,$DEB6                   ; 1D:4B25
    call Sub1D4B65                  ; 1D:4B28
    xor  a                          ; 1D:4B2B
    jr   Code1D4B1E                 ; 1D:4B2C
Code1D4B2E:
    inc  e                          ; 1D:4B2E
    ld   a,[de]                     ; 1D:4B2F
    and  a                          ; 1D:4B30
    jr   nz,Code1D4B44              ; 1D:4B31
    inc  a                          ; 1D:4B33
    ld   [de],a                     ; 1D:4B34
    pop  hl                         ; 1D:4B35
    push hl                         ; 1D:4B36
    call Sub1D4B49                  ; 1D:4B37
Code1D4B3A:
    ld   hl,$FFE0                   ; 1D:4B3A
    add  hl,de                      ; 1D:4B3D
    call Sub1D4B54                  ; 1D:4B3E
    jp   Code1D49B6                 ; 1D:4B41
Code1D4B44:
    call Sub1D4B6E                  ; 1D:4B44
    jr   Code1D4B3A                 ; 1D:4B47

Sub1D4B49:
    ld   a,$07                      ; 1D:4B49
    add  l                          ; 1D:4B4B
    ld   l,a                        ; 1D:4B4C
    ldi  a,[hl]                     ; 1D:4B4D
    ld   e,a                        ; 1D:4B4E
    ld   a,[hl]                     ; 1D:4B4F
    and  $0F                        ; 1D:4B50
    ld   d,a                        ; 1D:4B52
    ret                             ; 1D:4B53

Sub1D4B54:
    ld   de,$DEA4                   ; 1D:4B54
    call Sub1D4B65                  ; 1D:4B57
    ld   a,l                        ; 1D:4B5A
    ldh  [c],a                      ; 1D:4B5B
    ld   [de],a                     ; 1D:4B5C
    inc  c                          ; 1D:4B5D
    inc  e                          ; 1D:4B5E
    ld   a,h                        ; 1D:4B5F
    and  $0F                        ; 1D:4B60
    ldh  [c],a                      ; 1D:4B62
    ld   [de],a                     ; 1D:4B63
    ret                             ; 1D:4B64

Sub1D4B65:
    ld   a,[$DE50]                  ; 1D:4B65
    dec  a                          ; 1D:4B68
    sla  a                          ; 1D:4B69
    add  e                          ; 1D:4B6B
    ld   e,a                        ; 1D:4B6C
    ret                             ; 1D:4B6D

Sub1D4B6E:
    ld   de,$DEA4                   ; 1D:4B6E
    call Sub1D4B65                  ; 1D:4B71
    ld   a,[de]                     ; 1D:4B74
    ld   l,a                        ; 1D:4B75
    inc  e                          ; 1D:4B76
    ld   a,[de]                     ; 1D:4B77
    ld   d,a                        ; 1D:4B78
    ld   e,l                        ; 1D:4B79
    ret                             ; 1D:4B7A

Code1D4B7B:
    pop  de                         ; 1D:4B7B
    ld   de,$DEB0                   ; 1D:4B7C
    call Sub1D4B65                  ; 1D:4B7F
    ld   a,[de]                     ; 1D:4B82
    and  a                          ; 1D:4B83
    jr   nz,Code1D4B88              ; 1D:4B84
    ld   a,$10                      ; 1D:4B86
Code1D4B88:
    inc  a                          ; 1D:4B88
    ld   [de],a                     ; 1D:4B89
    inc  e                          ; 1D:4B8A
    jr   Code1D4B98                 ; 1D:4B8B
Code1D4B8D:
    pop  de                         ; 1D:4B8D
    ld   de,$DEB0                   ; 1D:4B8E
    call Sub1D4B65                  ; 1D:4B91
    ld   a,[de]                     ; 1D:4B94
    inc  a                          ; 1D:4B95
    ld   [de],a                     ; 1D:4B96
    inc  e                          ; 1D:4B97
Code1D4B98:
    cp   $19                        ; 1D:4B98
    jr   z,Code1D4BCD               ; 1D:4B9A
    cp   $2D                        ; 1D:4B9C
    jr   z,Code1D4BC6               ; 1D:4B9E
    ld   a,[de]                     ; 1D:4BA0
    and  a                          ; 1D:4BA1
    jp   z,Code1D49DA               ; 1D:4BA2
Code1D4BA5:
    dec  e                          ; 1D:4BA5
    ld   a,[de]                     ; 1D:4BA6
    sub  $19                        ; 1D:4BA7
    sla  a                          ; 1D:4BA9
    ld   l,a                        ; 1D:4BAB
    ld   h,$00                      ; 1D:4BAC
    ld   de,Data1D4BD2              ; 1D:4BAE
    add  hl,de                      ; 1D:4BB1
    ldi  a,[hl]                     ; 1D:4BB2
    ld   d,a                        ; 1D:4BB3
    ld   a,[hl]                     ; 1D:4BB4
    ld   e,a                        ; 1D:4BB5
    pop  hl                         ; 1D:4BB6
    push hl                         ; 1D:4BB7
    push de                         ; 1D:4BB8
    call Sub1D4B49                  ; 1D:4BB9
    ld   h,d                        ; 1D:4BBC
    ld   l,e                        ; 1D:4BBD
    pop  de                         ; 1D:4BBE
    add  hl,de                      ; 1D:4BBF
    call Sub1D4B54                  ; 1D:4BC0
    jp   Code1D49DA                 ; 1D:4BC3
Code1D4BC6:
    dec  e                          ; 1D:4BC6
    ld   a,$19                      ; 1D:4BC7
    ld   [de],a                     ; 1D:4BC9
    inc  e                          ; 1D:4BCA
    jr   Code1D4BA5                 ; 1D:4BCB
Code1D4BCD:
    ld   a,$01                      ; 1D:4BCD
    ld   [de],a                     ; 1D:4BCF
    jr   Code1D4BA5                 ; 1D:4BD0

Data1D4BD2:                         ; 1D:4BD2
.db $00,$00,$00,$00,$00,$01,$00,$01,\
    $00,$02,$00,$02,$00,$00,$00,$00,\
    $FF,$FF,$FF,$FF,$FF,$FE,$FF,$FE,\
    $00,$00,$00,$01,$00,$02,$00,$01,\
    $00,$00,$FF,$FF,$FF,$FE,$FF,$FF,\
    $3E,$01,$EA,$D9,$DE,$CD,$44,$45,\
    $C3,$67,$47

Code1D4C05:
    cp   $02                        ; 1D:4C05
    jp   z,Code1D49B6               ; 1D:4C07
    ld   bc,$DEDA                   ; 1D:4C0A
    call Sub1D4B12                  ; 1D:4C0D
    ld   c,$1C                      ; 1D:4C10
    ld   b,$60                      ; 1D:4C12
    cp   $03                        ; 1D:4C14
    jp   z,Code1D4B0D               ; 1D:4C16
    ld   b,$40                      ; 1D:4C19
    cp   $05                        ; 1D:4C1B
    jp   z,Code1D4B0D               ; 1D:4C1D
    ld   b,$20                      ; 1D:4C20
    cp   $06                        ; 1D:4C22
    jp   nz,Code1D49B6              ; 1D:4C24
    ld   a,$02                      ; 1D:4C27
    ld   [$DED9],a                  ; 1D:4C29
    jp   Code1D4B0D                 ; 1D:4C2C

Data1D4C2F:                         ; 1D:4C2F
.db $00,$0F,$2C,$00,$9C,$00,$06,$01,\
    $6B,$01,$C9,$01,$23,$02,$77,$02,\
    $C6,$02,$12,$03,$56,$03,$9B,$03,\
    $DA,$03,$16,$04,$4E,$04,$83,$04,\
    $B5,$04,$E5,$04,$11,$05,$3B,$05,\
    $63,$05,$89,$05,$AC,$05,$CE,$05,\
    $ED,$05,$0A,$06,$27,$06,$42,$06,\
    $5B,$06,$72,$06,$89,$06,$9E,$06,\
    $B2,$06,$C4,$06,$D6,$06,$E7,$06,\
    $F7,$06,$06,$07,$14,$07,$21,$07,\
    $2D,$07,$39,$07,$44,$07,$4F,$07,\
    $59,$07,$62,$07,$6B,$07,$74,$07,\
    $7B,$07,$83,$07,$8A,$07,$90,$07,\
    $97,$07,$9D,$07,$A2,$07,$A7,$07,\
    $AC,$07,$B1,$07,$B6,$07,$BA,$07,\
    $BE,$07,$C1,$07,$C5,$07,$C8,$07,\
    $CB,$07,$CE,$07,$D1,$07,$D4,$07,\
    $D6,$07,$D9,$07,$DB,$07,$DD,$07,\
    $DF,$07
Data1D4CC1:                         ; 1D:4CC1
.db $00,$08,$00,$00,$00,$C0,$09,$00,\
    $38,$34,$C0,$88,$00,$2B,$05,$C0,\
    $86,$00,$13,$10,$C0,$43,$00,$20,\
    $40,$80,$56,$00,$2B,$05,$C0,$91,\
    $00,$39,$05,$C0,$F2,$00,$00,$18,\
    $80,$61,$00,$3A,$05,$C0,$81,$00,\
    $3A,$37,$C0,$57,$00,$00,$60,$80,\
    $02,$04,$08,$10,$20,$40,$01,$18,\
    $30,$02,$06,$0E,$1E,$16,$0C
Data1D4D08:                         ; 1D:4D08
.db $01,$03,$06,$0C,$18,$30,$09,$12,\
    $24,$02,$04,$08,$01,$01,$08
Data1D4D17:                         ; 1D:4D17
.db $02,$04,$08,$10,$20,$40,$0C,$18,\
    $30,$02,$05,$03,$01,$01,$60,$03,\
    $05,$0A,$14,$28,$50,$0F,$1E,$3C,\
    $02,$08,$0D,$0E,$01,$78,$03,$06,\
    $0C,$18,$30,$60,$12,$24,$48,$03,\
    $08,$10,$02,$04,$90,$03,$07,$0E,\
    $1C,$38,$70,$15,$2A,$54,$04,$09,\
    $12,$02,$01,$A8,$04,$08,$10,$20,\
    $40,$80,$18,$30,$60,$04,$02,$01,\
    $01,$00,$C0
Data1D4D62:                         ; 1D:4D62
.db $02,$04,$09,$12,$24,$48,$0C,$1B,\
    $36,$02,$06,$0C,$01,$01,$6C,$04,\
    $08,$0B,$16,$2C,$50,$0F,$21,$3C,\
    $02,$09,$10,$02,$01,$78
Data1D4D80:                         ; 1D:4D80
.db $01,$02,$03,$06,$10,$20,$05,$09,\
    $18,$01,$02,$04,$02,$02,$02,$10,\
    $32,$22,$47,$81,$20,$00,$9C,$4D,\
    $FF,$FF,$96,$4D,$9B,$20,$AE,$01,\
    $9C,$00

Code1D4DA2:
    xor  a                          ; 1D:4DA2
    ld   [$DE79],a                  ; 1D:4DA3
    ld   [$DE4F],a                  ; 1D:4DA6
    ld   [$DE98],a                  ; 1D:4DA9
    ld   [$DE93],a                  ; 1D:4DAC
    ld   [$DEC9],a                  ; 1D:4DAF
    ld   [$DEA3],a                  ; 1D:4DB2
    ld   [$DEE5],a                  ; 1D:4DB5
    ld   a,$08                      ; 1D:4DB8
    ldh  [<NR42],a                  ; 1D:4DBA
    ld   a,$80                      ; 1D:4DBC
    ldh  [<NR44],a                  ; 1D:4DBE
    ld   a,$FF                      ; 1D:4DC0
    ldh  [<NR51],a                  ; 1D:4DC2
    ld   a,$01                      ; 1D:4DC4
    ld   [$DE55],a                  ; 1D:4DC6
    xor  a                          ; 1D:4DC9
    ld   [$DE68],a                  ; 1D:4DCA
    ld   [$DE69],a                  ; 1D:4DCD

Sub1D4DD0:
    xor  a                          ; 1D:4DD0
    ld   [$DE61],a                  ; 1D:4DD1
    ld   [$DE71],a                  ; 1D:4DD4
    ld   [$DE1F],a                  ; 1D:4DD7
    ld   [$DE2F],a                  ; 1D:4DDA
    ld   [$DE3F],a                  ; 1D:4DDD
    ld   [$DE9E],a                  ; 1D:4DE0
    ld   [$DE9F],a                  ; 1D:4DE3
    ld   [$DED9],a                  ; 1D:4DE6
    ld   [$DEDA],a                  ; 1D:4DE9
    ld   [$DEB6],a                  ; 1D:4DEC
    ld   [$DEB7],a                  ; 1D:4DEF
    ld   [$DEB8],a                  ; 1D:4DF2
    ld   [$DEB9],a                  ; 1D:4DF5
    ld   [$DEBA],a                  ; 1D:4DF8
    ld   [$DEBB],a                  ; 1D:4DFB
    ld   [$DE94],a                  ; 1D:4DFE
    ld   [$DE95],a                  ; 1D:4E01
    ld   [$DE96],a                  ; 1D:4E04
    ld   [$DE90],a                  ; 1D:4E07
    ld   [$DE91],a                  ; 1D:4E0A
    ld   [$DE92],a                  ; 1D:4E0D
    ld   [$DEC6],a                  ; 1D:4E10
    ld   [$DEC7],a                  ; 1D:4E13
    ld   [$DEC8],a                  ; 1D:4E16
    ld   [$DEA0],a                  ; 1D:4E19
    ld   [$DEA1],a                  ; 1D:4E1C
    ld   [$DEA2],a                  ; 1D:4E1F
    ld   [$DECD],a                  ; 1D:4E22
    ld   [$DED6],a                  ; 1D:4E25
    ld   [$DED7],a                  ; 1D:4E28
    ld   [$DED8],a                  ; 1D:4E2B
    ld   [$DEDC],a                  ; 1D:4E2E
    ld   [$DEE7],a                  ; 1D:4E31
    ld   [$DEE2],a                  ; 1D:4E34
    ld   [$DEE3],a                  ; 1D:4E37
    ld   [$DEE4],a                  ; 1D:4E3A
    xor  a                          ; 1D:4E3D
    ld   [$DED1],a                  ; 1D:4E3E
    ld   [$DED3],a                  ; 1D:4E41
    ld   a,$11                      ; 1D:4E44
    ld   [$DE80],a                  ; 1D:4E46
    ld   [$DE81],a                  ; 1D:4E49
    ld   a,$77                      ; 1D:4E4C
    ldh  [<NR50],a                  ; 1D:4E4E
    ld   a,$08                      ; 1D:4E50
    ldh  [<NR12],a                  ; 1D:4E52
    ldh  [<NR22],a                  ; 1D:4E54
    ld   a,$80                      ; 1D:4E56
    ldh  [<NR14],a                  ; 1D:4E58
    ldh  [<NR24],a                  ; 1D:4E5A
    ld   a,$08                      ; 1D:4E5C
    ldh  [<NR10],a                  ; 1D:4E5E
    xor  a                          ; 1D:4E60
    ldh  [<NR32],a                  ; 1D:4E61
    ret                             ; 1D:4E63

.orga $4FFF
Return1D4FFF:
    ret                             ; 1D:4FFF

.db $A5,$01,$01,$01,$01,$01,$01,$01,\
    $01,$00,$A5,$01,$01,$01,$01,$01,\
    $01,$01,$01,$00
Data1D5014:                         ; 1D:5014
.db $00,$08,$4D,$25,$50,$1F,$50,$2B,\
    $50,$00,$00,$31,$50,$40,$50,$00,\
    $00,$36,$50,$5B,$50,$00,$00,$3B,\
    $50,$79,$50,$00,$00,$9D,$67,$00,\
    $80,$00,$9D,$67,$00,$80,$00,$9D,\
    $7F,$55,$21,$00,$A2,$3A,$4E,$01,\
    $4E,$4E,$01,$A2,$3C,$50,$01,$50,\
    $50,$01,$A2,$3E,$52,$01,$52,$52,\
    $01,$A2,$54,$01,$A5,$54,$00,$A2,\
    $22,$A3,$42,$A2,$42,$A3,$42,$A2,\
    $24,$A3,$44,$A2,$44,$A3,$44,$A2,\
    $26,$A3,$46,$A2,$46,$A3,$46,$A2,\
    $48,$01,$A5,$48,$00,$A2,$48,$60,\
    $01,$60,$60,$01,$A2,$4A,$62,$01,\
    $62,$62,$01,$A2,$4C,$64,$01,$64,\
    $64,$01,$A2,$40,$01,$A5,$40,$00
Data1D5094:                         ; 1D:5094
.db $00,$62,$4D,$A9,$50,$9F,$50,$B3,\
    $50,$BD,$50,$C5,$50,$DA,$50,$00,\
    $50,$FF,$FF,$A3,$50,$CC,$50,$EB,\
    $50,$00,$50,$FF,$FF,$AD,$50,$D3,\
    $50,$FF,$50,$00,$50,$FF,$FF,$B7,\
    $50,$12,$51,$0A,$50,$FF,$FF,$BF,\
    $50,$9D,$7E,$5C,$80,$AC,$01,$00,\
    $9D,$7E,$5C,$80,$AC,$01,$00,$9D,\
    $7F,$55,$21,$AC,$01,$00,$A2,$52,\
    $52,$01,$52,$01,$4A,$52,$01,$A2,\
    $58,$01,$A3,$01,$01,$01,$00,$A2,\
    $3E,$3E,$01,$3E,$01,$3E,$3E,$01,\
    $A2,$48,$01,$A3,$01,$A2,$40,$01,\
    $01,$01,$00,$A2,$36,$36,$01,$36,\
    $01,$36,$36,$01,$A2,$58,$01,$01,\
    $01,$40,$01,$01,$01,$00,$A3,$1A,\
    $A2,$29,$A3,$1A,$A2,$29,$A3,$1A,\
    $A7,$1A,$A3,$1A,$A2,$29,$29,$29,\
    $00
Data1D5125:                         ; 1D:5125
.db $00,$62,$4D,$52,$51,$30,$51,$74,\
    $51,$96,$51,$B6,$51
Data1D5132:                         ; 1D:5132
.db $CF,$51,$E0,$51,$E0,$51,$13,$52,\
    $13,$52,$5A,$52,$CF,$51,$E0,$51,\
    $E0,$51,$8A,$52,$8A,$52,$5A,$52,\
    $CF,$51,$8A,$52,$FF,$FF,$34,$51,\
    $BF,$51,$FA,$52,$0E,$53,$0E,$53,\
    $41,$53,$41,$53,$88,$53,$FA,$52,\
    $0E,$53,$0E,$53,$B8,$53,$B8,$53,\
    $88,$53,$FA,$52,$B8,$53,$FF,$FF,\
    $56,$51,$C8,$51,$2A,$54,$3D,$54,\
    $3D,$54,$62,$54,$62,$54,$AB,$54,\
    $2A,$54,$3D,$54,$3D,$54,$E2,$54,\
    $E2,$54,$AB,$54,$2A,$54,$E2,$54,\
    $FF,$FF,$78,$51,$2B,$55,$3E,$55,\
    $3E,$55,$4E,$55,$4E,$55,$5E,$55,\
    $2B,$55,$3E,$55,$3E,$55,$74,$55,\
    $74,$55,$5E,$55,$2B,$55,$74,$55,\
    $FF,$FF,$98,$51,$9D,$7E,$5C,$80,\
    $99,$00,$AC,$01,$00,$9D,$7E,$5C,\
    $80,$99,$00,$AC,$01,$00,$9D,$7F,\
    $55,$21,$AC,$01,$00,$A2,$52,$52,\
    $01,$52,$01,$4A,$52,$01,$A2,$58,\
    $01,$A3,$01,$01,$01,$00,$A2,$4A,\
    $01,$01,$40,$01,$01,$3A,$01,$A2,\
    $01,$44,$01,$48,$01,$46,$44,$01,\
    $A2,$40,$A0,$01,$AD,$01,$A2,$52,\
    $A0,$01,$AD,$01,$A2,$58,$A0,$01,\
    $AD,$01,$A2,$5C,$01,$54,$58,$A2,\
    $01,$52,$01,$4A,$4E,$48,$01,$01,\
    $00,$A2,$01,$01,$58,$56,$54,$50,\
    $01,$52,$A2,$01,$42,$44,$4A,$01,\
    $44,$4A,$4E,$A2,$01,$01,$58,$56,\
    $54,$50,$01,$52,$A2,$01,$62,$01,\
    $62,$62,$01,$01,$01,$A2,$01,$01,\
    $58,$56,$54,$50,$01,$52,$A2,$01,\
    $42,$44,$4A,$01,$44,$4A,$4E,$A2,\
    $01,$01,$50,$01,$01,$4E,$01,$01,\
    $A2,$4A,$01,$A3,$01,$01,$01,$00,\
    $A2,$4A,$4A,$01,$4A,$01,$4A,$4E,\
    $01,$A2,$52,$4A,$01,$44,$40,$01,\
    $01,$01,$A2,$4A,$4A,$01,$4A,$01,\
    $4A,$4E,$52,$A5,$01,$A2,$4A,$4A,\
    $01,$4A,$01,$4A,$4E,$01,$A2,$52,\
    $4A,$01,$44,$40,$01,$01,$01,$00,\
    $A2,$52,$4A,$01,$40,$01,$01,$42,\
    $01,$A2,$44,$54,$01,$54,$44,$01,\
    $01,$01,$A2,$48,$A0,$01,$AD,$01,\
    $A2,$5C,$A0,$01,$AD,$01,$A2,$5C,\
    $A0,$01,$AD,$01,$A2,$5C,$A0,$01,\
    $AD,$01,$A2,$58,$A0,$01,$AD,$01,\
    $A2,$54,$A0,$01,$AD,$01,$A2,$52,\
    $4A,$01,$44,$40,$01,$01,$01,$A2,\
    $52,$4A,$01,$40,$01,$01,$42,$01,\
    $A2,$44,$54,$01,$54,$44,$01,$01,\
    $01,$A2,$48,$54,$01,$54,$A2,$54,\
    $A0,$01,$AD,$01,$A2,$52,$A0,$01,\
    $AD,$01,$A2,$4E,$A0,$01,$AD,$01,\
    $A2,$4A,$01,$A3,$01,$01,$01,$00,\
    $A2,$3E,$3E,$01,$3E,$01,$3E,$3E,\
    $01,$A2,$48,$01,$A3,$01,$A2,$40,\
    $01,$01,$01,$00,$A2,$3A,$01,$01,\
    $32,$01,$01,$28,$01,$A2,$01,$32,\
    $01,$36,$01,$34,$32,$01,$A2,$32,\
    $A0,$01,$AD,$01,$A2,$40,$A0,$01,\
    $AD,$01,$A2,$48,$A0,$01,$AD,$01,\
    $A2,$4A,$01,$44,$48,$A2,$01,$44,\
    $01,$3A,$3C,$36,$01,$01,$00,$A2,\
    $01,$01,$52,$50,$4E,$48,$01,$4A,\
    $A2,$01,$3A,$3C,$40,$01,$32,$3A,\
    $3C,$A2,$01,$01,$52,$50,$4E,$48,\
    $01,$4A,$A2,$01,$54,$01,$54,$54,\
    $01,$01,$01,$A2,$01,$01,$52,$50,\
    $4E,$48,$01,$4A,$A2,$01,$3A,$3C,\
    $40,$01,$32,$3A,$3C,$A2,$01,$01,\
    $42,$01,$01,$3C,$01,$01,$A2,$3A,\
    $01,$A3,$01,$01,$01,$00,$A2,$42,\
    $42,$01,$42,$01,$42,$46,$01,$A2,\
    $40,$3A,$01,$3A,$32,$01,$01,$01,\
    $A2,$42,$42,$01,$42,$01,$42,$46,\
    $40,$A5,$01,$A2,$42,$42,$01,$42,\
    $01,$42,$46,$01,$A2,$4A,$40,$01,\
    $3A,$32,$01,$01,$01,$00,$A2,$4A,\
    $44,$01,$3A,$01,$01,$3A,$01,$A2,\
    $3C,$4A,$01,$4A,$3C,$01,$01,$01,\
    $A2,$40,$A0,$01,$AD,$01,$A2,$54,\
    $A0,$01,$AD,$01,$A2,$54,$A0,$01,\
    $AD,$01,$A2,$54,$A0,$01,$AD,$01,\
    $A2,$52,$A0,$01,$AD,$01,$A2,$4E,\
    $A0,$01,$AD,$01,$A2,$4A,$44,$01,\
    $3C,$3A,$01,$01,$01,$A2,$4A,$44,\
    $01,$3A,$01,$01,$3A,$01,$A2,$3C,\
    $4A,$01,$4A,$3C,$01,$01,$01,$A2,\
    $40,$4E,$01,$4E,$A2,$4E,$A0,$01,\
    $AD,$01,$A2,$4A,$A0,$01,$AD,$01,\
    $A2,$48,$A0,$01,$AD,$01,$A2,$40,\
    $3A,$01,$3A,$32,$01,$01,$01,$00,\
    $A2,$36,$36,$01,$36,$01,$36,$36,\
    $01,$A2,$58,$01,$01,$01,$40,$01,\
    $01,$01,$00,$A2,$40,$01,$01,$3A,\
    $01,$01,$32,$01,$A2,$01,$3C,$01,\
    $40,$01,$3E,$3C,$01,$AB,$3A,$4A,\
    $52,$A2,$54,$01,$4E,$52,$A2,$01,\
    $4A,$01,$44,$48,$40,$01,$01,$00,\
    $A2,$32,$01,$01,$40,$01,$01,$4A,\
    $01,$A2,$3C,$01,$01,$4A,$4A,$01,\
    $3C,$01,$A2,$32,$01,$01,$3A,$01,\
    $01,$40,$4A,$A2,$01,$70,$01,$70,\
    $70,$01,$40,$01,$A2,$32,$01,$01,\
    $40,$01,$01,$4A,$01,$A2,$3C,$01,\
    $01,$4A,$4A,$01,$3C,$01,$A2,$32,\
    $01,$42,$01,$01,$46,$01,$01,$A2,\
    $4A,$01,$01,$40,$40,$01,$32,$01,\
    $00,$A2,$2A,$01,$01,$38,$01,$01,\
    $42,$01,$A2,$40,$01,$01,$32,$01,\
    $01,$28,$01,$A2,$2A,$01,$01,$38,\
    $01,$01,$42,$01,$A2,$40,$01,$01,\
    $32,$01,$01,$28,$01,$A2,$2A,$01,\
    $01,$38,$01,$01,$42,$01,$A2,$40,\
    $01,$01,$32,$01,$01,$28,$01,$00,\
    $A2,$32,$01,$01,$3E,$40,$01,$4A,\
    $01,$A2,$3C,$01,$3C,$01,$4A,$4A,\
    $3C,$01,$A2,$36,$01,$01,$3C,$40,\
    $01,$48,$01,$A2,$40,$01,$40,$01,\
    $4A,$4A,$40,$01,$A2,$32,$01,$01,\
    $3E,$40,$01,$4A,$01,$A2,$3C,$01,\
    $3C,$01,$4A,$4A,$3C,$01,$A2,$40,\
    $01,$01,$40,$AB,$40,$44,$48,$A2,\
    $4A,$01,$40,$01,$32,$01,$01,$01,\
    $00,$A3,$1A,$A2,$29,$A3,$1A,$A2,\
    $29,$A3,$1A,$A7,$1A,$A3,$1A,$A2,\
    $29,$29,$29,$00,$9B,$04,$A3,$2E,\
    $AB,$29,$AA,$29,$A3,$1A,$AB,$29,\
    $AA,$29,$9C,$00,$9B,$08,$A3,$2E,\
    $AB,$29,$AA,$29,$A3,$1A,$AB,$29,\
    $AA,$29,$9C,$00,$9B,$03,$A3,$1A,\
    $A2,$29,$A3,$1A,$A2,$29,$A3,$1A,\
    $A7,$1A,$A3,$1A,$A2,$29,$29,$29,\
    $9C,$00,$9B,$08,$A7,$29,$A2,$29,\
    $A3,$1A,$29,$9C,$00
Data1D557F:                         ; 1D:557F
.db $48,$CC,$CC,$CC,$CC,$CC,$CC,$CC,\
    $84,$00,$00,$00,$00,$00,$00,$00
Data1D558F:                         ; 1D:558F
.db $00,$62,$4D,$96,$4D,$A0,$55,$AA,\
    $55,$00,$00,$B4,$55,$FF,$FF,$A2,\
    $55,$B7,$55,$C3,$55,$FA,$55,$FF,\
    $FF,$AC,$55,$BE,$55,$C3,$55,$29,\
    $56,$FF,$FF,$AC,$55,$9D,$83,$00,\
    $9D,$AE,$5C,$80,$99,$00,$00,$9D,\
    $7F,$55,$21,$00,$A2,$32,$4A,$2C,\
    $44,$2E,$46,$A8,$01,$A2,$32,$4A,\
    $2C,$44,$2E,$46,$A8,$01,$A2,$24,\
    $3C,$1E,$36,$20,$38,$A8,$01,$A2,\
    $24,$3C,$1E,$36,$20,$38,$A4,$01,\
    $AA,$38,$36,$34,$A2,$32,$01,$38,\
    $01,$36,$01,$2A,$01,$A2,$28,$01,\
    $34,$01,$00,$AA,$32,$3E,$3C,$3A,\
    $46,$44,$A2,$42,$A0,$01,$AD,$01,\
    $A2,$38,$A0,$01,$AD,$01,$A2,$30,\
    $A0,$01,$AD,$01,$A2,$2E,$A0,$01,\
    $AD,$01,$A2,$2C,$A0,$01,$AD,$01,\
    $A2,$2A,$A0,$01,$AD,$01,$A8,$01,\
    $01,$00,$AA,$32,$3E,$3C,$3A,$46,\
    $44,$AB,$42,$38,$30,$AB,$2E,$2C,\
    $2A,$A8,$01,$01,$00
Data1D563C:                         ; 1D:563C
.db $00,$17,$4D,$47,$56,$51,$56,$5B,\
    $56,$00,$00,$65,$56,$74,$56,$00,\
    $50,$FF,$FF,$4B,$56,$6A,$56,$95,\
    $56,$00,$50,$FF,$FF,$55,$56,$6F,\
    $56,$B9,$56,$00,$50,$FF,$FF,$5F,\
    $56,$9D,$77,$00,$80,$00,$9D,$77,\
    $00,$80,$00,$9D,$7F,$55,$21,$00,\
    $A2,$01,$22,$28,$32,$3A,$40,$A7,\
    $4A,$40,$A2,$01,$20,$2A,$32,$38,\
    $42,$A7,$4A,$42,$A2,$01,$24,$2E,\
    $36,$3C,$46,$A7,$4E,$4E,$A4,$62,\
    $00,$A2,$28,$32,$3A,$40,$4A,$52,\
    $A7,$58,$52,$A2,$2A,$32,$38,$42,\
    $4A,$50,$A7,$5A,$50,$A2,$2E,$36,\
    $3C,$46,$4E,$54,$A7,$5E,$A2,$5E,\
    $5E,$5E,$A4,$52,$00,$A2,$01,$01,\
    $01,$32,$3A,$40,$A7,$52,$A6,$4A,\
    $01,$A6,$01,$01,$A2,$32,$38,$42,\
    $A7,$50,$A6,$4A,$01,$A2,$01,$01,\
    $01,$36,$3C,$46,$A7,$54,$A2,$4E,\
    $4E,$4E,$A4,$4A,$00
Data1D56E1:                         ; 1D:56E1
.db $00,$08,$4D,$F4,$56,$EC,$56,$FC,\
    $56,$04,$57,$0A,$57,$19,$57,$FF,\
    $FF,$EE,$56,$0F,$57,$34,$57,$FF,\
    $FF,$F6,$56,$14,$57,$53,$57,$FF,\
    $FF,$FE,$56,$80,$57,$FF,$FF,$04,\
    $57,$9D,$72,$00,$80,$00,$9D,$72,\
    $00,$80,$00,$9D,$7F,$55,$21,$00,\
    $A3,$4A,$4A,$4A,$A2,$01,$4A,$01,\
    $A7,$4A,$A3,$4A,$4A,$A3,$48,$48,\
    $48,$A2,$01,$48,$01,$A7,$48,$A3,\
    $48,$48,$00,$A3,$3C,$3C,$3C,$A2,\
    $36,$A3,$3C,$3C,$A2,$36,$3C,$36,\
    $A3,$3C,$A3,$3A,$3A,$3A,$A2,$32,\
    $A3,$3A,$3A,$A2,$32,$3A,$32,$A3,\
    $3A,$00,$A3,$36,$01,$A6,$44,$AE,\
    $01,$AC,$01,$A6,$4E,$AE,$01,$AC,\
    $01,$A2,$01,$01,$44,$01,$4E,$01,\
    $A3,$32,$01,$A6,$40,$AE,$01,$AC,\
    $01,$A6,$4A,$AE,$01,$AC,$01,$A2,\
    $01,$01,$40,$01,$4A,$01,$00,$A3,\
    $2E,$AB,$29,$AA,$29,$A3,$1A,$AB,\
    $29,$AA,$29,$00
Data1D578D:                         ; 1D:578D
.db $18,$17,$4D,$A0,$57,$98,$57,$A8,\
    $57,$B0,$57,$B6,$57,$01,$58,$FF,\
    $FF,$9A,$57,$BD,$57,$70,$58,$FF,\
    $FF,$A2,$57,$C4,$57,$C5,$58,$FF,\
    $FF,$AA,$57,$3E,$59,$FF,$FF,$B0,\
    $57,$9D,$C4,$5E,$80,$99,$27,$00,\
    $9D,$C4,$5E,$80,$99,$27,$00,$9D,\
    $7F,$55,$21,$00
Data1D57C9:                         ; 1D:57C9
.db $00,$17,$4D,$DC,$57,$D4,$57,$E4,\
    $57,$EC,$57,$F2,$57,$01,$58,$FF,\
    $FF,$D6,$57,$F7,$57,$70,$58,$FF,\
    $FF,$DE,$57,$FC,$57,$C5,$58,$FF,\
    $FF,$E6,$57,$3E,$59,$FF,$FF,$EC,\
    $57,$9D,$DE,$5C,$80,$00,$9D,$DE,\
    $5C,$80,$00,$9D,$7F,$55,$21,$00,\
    $A3,$36,$3A,$3E,$A3,$40,$44,$46,\
    $A2,$48,$48,$48,$01,$48,$01,$A4,\
    $48,$A3,$40,$A8,$52,$A8,$50,$A8,\
    $52,$A2,$01,$40,$44,$48,$4A,$4E,\
    $A8,$52,$A4,$50,$A3,$54,$A5,$52,\
    $A7,$01,$A2,$40,$A8,$4E,$A8,$4C,\
    $A8,$4E,$A2,$01,$40,$44,$48,$4A,\
    $4C,$A8,$4E,$A4,$40,$A3,$54,$A5,\
    $52,$A7,$01,$A2,$40,$A8,$58,$A8,\
    $58,$A8,$58,$A3,$58,$A2,$5C,$01,\
    $01,$58,$A8,$54,$A8,$54,$A8,$54,\
    $A3,$54,$A2,$58,$01,$01,$54,$A8,\
    $52,$A3,$44,$48,$54,$A2,$52,$52,\
    $A7,$52,$A2,$48,$A8,$4A,$00,$A3,\
    $01,$34,$32,$A3,$30,$32,$34,$A2,\
    $36,$36,$36,$01,$3A,$01,$A8,$3C,\
    $A8,$40,$A8,$3E,$A8,$40,$A8,$01,\
    $A8,$40,$A4,$3E,$A3,$44,$A5,$40,\
    $A4,$01,$A8,$3C,$A8,$3A,$A8,$3C,\
    $A8,$01,$A8,$3C,$A4,$30,$A3,$44,\
    $A5,$40,$A4,$01,$A8,$52,$A8,$4E,\
    $A8,$4C,$A8,$01,$A8,$4E,$A8,$4C,\
    $A8,$4A,$A8,$01,$A8,$4A,$A3,$3C,\
    $40,$48,$A2,$48,$48,$A7,$48,$A2,\
    $3C,$A8,$3A,$00,$A5,$01,$01,$A3,\
    $40,$A8,$40,$A3,$32,$40,$4A,$A3,\
    $30,$40,$48,$A3,$32,$40,$4A,$A3,\
    $3A,$40,$4A,$A3,$32,$40,$4A,$A3,\
    $30,$40,$48,$A3,$32,$40,$4A,$A3,\
    $3A,$40,$4A,$A3,$36,$40,$48,$A3,\
    $34,$3E,$46,$A3,$36,$40,$48,$A3,\
    $30,$40,$48,$A3,$36,$40,$48,$A3,\
    $30,$40,$48,$A3,$32,$40,$4A,$A3,\
    $28,$40,$4A,$A3,$32,$40,$52,$A3,\
    $30,$40,$4E,$A3,$2E,$40,$4C,$A3,\
    $34,$40,$52,$A3,$36,$44,$54,$A3,\
    $34,$44,$54,$A3,$32,$44,$54,$A3,\
    $30,$40,$54,$A3,$32,$40,$52,$A3,\
    $28,$40,$40,$A2,$3C,$3C,$A7,$3C,\
    $A2,$30,$A8,$32,$00,$A3,$01,$29,\
    $1A,$A3,$01,$A2,$29,$29,$A3,$1A,\
    $00
Data1D594A:                         ; 1D:594A
.db $00,$17,$4D,$5F,$59,$55,$59,$69,\
    $59,$00,$00,$7B,$59,$8A,$59,$00,\
    $50,$FF,$FF,$59,$59,$80,$59,$A1,\
    $59,$00,$50,$FF,$FF,$63,$59,$85,\
    $59,$BA,$59,$00,$50,$FF,$FF,$6D,\
    $59,$D5,$59,$00,$50,$FF,$FF,$75,\
    $59,$9D,$92,$00,$80,$00,$9D,$A2,\
    $00,$80,$00,$9D,$7F,$55,$21,$00,\
    $A2,$48,$54,$01,$54,$A2,$54,$AB,\
    $01,$A2,$52,$AB,$01,$A2,$4E,$A0,\
    $01,$A2,$4A,$01,$A8,$01,$00,$97,\
    $A2,$40,$4E,$01,$4E,$A2,$4E,$AB,\
    $01,$A2,$4A,$AB,$01,$A2,$48,$A0,\
    $01,$A2,$40,$3A,$01,$3A,$32,$00,\
    $A2,$40,$01,$01,$40,$A2,$40,$AB,\
    $01,$A2,$44,$AB,$01,$A2,$48,$A0,\
    $01,$A2,$4A,$01,$40,$01,$32,$01,\
    $01,$01,$00,$A7,$29,$A2,$29,$A3,\
    $1A,$29,$00
Data1D59DD:                         ; 1D:59DD
.db $00,$26,$4D,$F0,$59,$E8,$59,$F8,\
    $59,$00,$00,$00,$5A,$11,$5A,$FF,\
    $FF,$EA,$59,$05,$5A,$7E,$5A,$FF,\
    $FF,$F2,$59,$0C,$5A,$B5,$5A,$FF,\
    $FF,$FA,$59,$9D,$71,$00,$80,$00,\
    $9D,$71,$00,$80,$A1,$01,$00,$9D,\
    $7F,$55,$21,$00,$A1,$40,$46,$40,\
    $44,$40,$42,$40,$44,$A1,$40,$46,\
    $40,$48,$40,$46,$40,$44,$A1,$40,\
    $46,$40,$44,$40,$42,$40,$44,$A1,\
    $40,$46,$40,$48,$40,$46,$40,$44,\
    $A1,$3E,$44,$3E,$42,$3E,$44,$3E,\
    $46,$A1,$3E,$44,$3E,$46,$3E,$44,\
    $3E,$42,$A1,$3E,$44,$3E,$42,$3E,\
    $44,$3E,$46,$A1,$3E,$44,$3E,$46,\
    $3E,$44,$3E,$42,$A1,$46,$4E,$46,\
    $50,$46,$4E,$46,$4C,$A1,$46,$4E,\
    $46,$4C,$46,$4A,$46,$4C,$A1,$46,\
    $4E,$46,$50,$46,$4E,$46,$4C,$A1,\
    $46,$4E,$46,$4C,$46,$4A,$46,$4C,\
    $00,$A2,$4E,$4C,$4A,$4C,$4E,$50,\
    $4E,$4C,$A2,$4E,$4C,$4A,$4C,$4E,\
    $50,$4E,$4C,$A2,$4C,$4A,$4C,$4E,\
    $4C,$4E,$4C,$4A,$A2,$4C,$4A,$4C,\
    $4E,$4C,$4E,$4C,$4A,$A2,$54,$56,\
    $54,$52,$54,$52,$50,$52,$A2,$54,\
    $56,$54,$52,$54,$52,$50,$52,$00,\
    $A5,$38,$A4,$36,$3E,$A5,$3C,$A4,\
    $3A,$46,$A4,$44,$3A,$A4,$38,$3A,\
    $00
Data1D5AC6:                         ; 1D:5AC6
.db $00,$26,$4D,$DB,$5A,$D1,$5A,$E5,\
    $5A,$00,$00,$EF,$5A,$FE,$5A,$00,\
    $50,$FF,$FF,$D5,$5A,$F4,$5A,$13,\
    $5B,$00,$50,$FF,$FF,$DF,$5A,$F9,\
    $5A,$25,$5B,$00,$50,$FF,$FF,$E9,\
    $5A,$9D,$DE,$5C,$80,$00,$9D,$DE,\
    $5C,$80,$00,$9D,$7F,$55,$21,$00,\
    $A2,$4A,$01,$01,$40,$01,$01,$A3,\
    $3A,$AB,$44,$48,$AC,$44,$A3,$42,\
    $46,$42,$A8,$40,$00,$A2,$3A,$01,\
    $01,$32,$A3,$01,$28,$A4,$3C,$A8,\
    $3C,$A2,$3A,$36,$A4,$3A,$00,$A2,\
    $40,$01,$01,$3A,$01,$01,$A3,$32,\
    $A4,$3C,$A8,$34,$A8,$32,$00
Data1D5B35:                         ; 1D:5B35
.db $00,$35,$4D,$4A,$5B,$40,$5B,$54,\
    $5B,$00,$00,$5E,$5B,$6D,$5B,$72,\
    $5B,$FF,$FF,$44,$5B,$63,$5B,$8D,\
    $5B,$90,$5B,$FF,$FF,$4E,$5B,$68,\
    $5B,$A8,$5B,$AB,$5B,$FF,$FF,$58,\
    $5B,$9D,$77,$00,$80,$00,$9D,$77,\
    $00,$80,$00,$9D,$7F,$55,$21,$00,\
    $AA,$40,$3E,$40,$00,$A4,$3A,$A3,\
    $3C,$3E,$A4,$40,$A3,$4A,$AB,$52,\
    $AA,$52,$A3,$4E,$52,$54,$48,$A4,\
    $4E,$A3,$4A,$AA,$40,$3E,$40,$00,\
    $A3,$01,$00,$A4,$28,$A3,$2C,$2E,\
    $A4,$30,$A3,$3A,$AB,$40,$AA,$40,\
    $A3,$3C,$40,$44,$36,$A4,$3C,$A3,\
    $3A,$01,$00,$A3,$30,$00,$A4,$32,\
    $A3,$36,$38,$A3,$3A,$32,$44,$40,\
    $A3,$3C,$3A,$36,$3C,$A3,$40,$28,\
    $32,$30,$00
Data1D5BC0:                         ; 1D:5BC0
.db $00,$17,$4D,$D5,$5B,$CB,$5B,$DF,\
    $5B,$00,$00,$E9,$5B,$F8,$5B,$00,\
    $50,$FF,$FF,$CF,$5B,$EE,$5B,$1A,\
    $5C,$00,$50,$FF,$FF,$D9,$5B,$F3,\
    $5B,$51,$5C,$00,$50,$FF,$FF,$E3,\
    $5B,$9D,$0E,$5D,$80,$00,$9D,$0E,\
    $5D,$80,$00,$9D,$7F,$55,$21,$00,\
    $A2,$4A,$40,$3A,$4A,$40,$3A,$A8,\
    $4A,$A2,$4C,$42,$3C,$4C,$42,$3C,\
    $A8,$4C,$A2,$50,$46,$40,$50,$46,\
    $40,$A7,$50,$A6,$54,$54,$54,$A5,\
    $58,$00,$A2,$3A,$32,$28,$3A,$32,\
    $28,$A2,$3A,$A1,$3A,$3A,$A2,$3A,\
    $3A,$3A,$3A,$A2,$3C,$34,$2A,$3C,\
    $34,$2A,$A2,$3C,$A1,$3C,$3C,$A2,\
    $3C,$3C,$3C,$3C,$A2,$40,$38,$2E,\
    $40,$38,$2E,$A2,$40,$A1,$40,$40,\
    $A2,$40,$A6,$44,$44,$44,$A5,$48,\
    $00,$A8,$32,$A2,$32,$A1,$32,$32,\
    $A2,$32,$32,$32,$32,$A8,$34,$A2,\
    $34,$A1,$34,$34,$A2,$34,$34,$34,\
    $34,$A2,$46,$40,$38,$46,$40,$38,\
    $A2,$46,$A1,$46,$46,$A2,$46,$A6,\
    $4A,$4A,$4A,$A5,$4E,$00,$72,$00,\
    $00,$00,$00,$00,$00,$22,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$72,$00,\
    $00,$00,$00,$00,$00,$25,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$5F,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$66,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$18,$C1,$00,\
    $88,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$96,$4D,$96,$4D,$96,$4D,$00,\
    $00
Data1D5D49:                         ; 1D:5D49
.db $00,$90,$66,$54,$5D,$66,$5D,$78,\
    $5D,$8A,$5D,$90,$5D,$97,$5D,$97,\
    $5D,$A8,$5D,$97,$5D,$B9,$5D,$C5,\
    $5D,$FF,$FF,$54,$5D,$CD,$5D,$D4,\
    $5D,$D4,$5D,$E9,$5D,$D4,$5D,$FE,\
    $5D,$20,$5E,$FF,$FF,$66,$5D,$3A,\
    $5E,$3F,$5E,$3F,$5E,$59,$5E,$3F,\
    $5E,$73,$5E,$90,$5E,$FF,$FF,$7A,\
    $5D,$AA,$5E,$FF,$FF,$8A,$5D,$9D,\
    $74,$00,$00,$99,$17,$00,$9B,$03,\
    $AB,$01,$01,$01,$3A,$01,$01,$9C,\
    $01,$01,$3A,$01,$01,$01,$00,$9B,\
    $03,$AB,$01,$01,$01,$38,$01,$01,\
    $9C,$01,$01,$38,$01,$01,$01,$00,\
    $9D,$A1,$00,$00,$A3,$01,$3C,$A4,\
    $3C,$A5,$01,$00,$9B,$08,$AB,$28,\
    $28,$28,$9C,$00,$9D,$74,$00,$00,\
    $99,$17,$00,$9B,$03,$AB,$01,$01,\
    $01,$46,$01,$01,$9C,$01,$01,$46,\
    $AA,$44,$01,$46,$01,$40,$01,$00,\
    $9B,$03,$AB,$01,$01,$01,$44,$01,\
    $01,$9C,$01,$01,$44,$AA,$40,$01,\
    $44,$01,$3C,$01,$00,$9D,$83,$00,\
    $00,$AD,$01,$AB,$40,$AD,$48,$AB,\
    $40,$AD,$48,$A2,$40,$01,$AB,$40,\
    $46,$44,$40,$3C,$3A,$A3,$3C,$AA,\
    $40,$3C,$AB,$3A,$AD,$01,$00,$AB,\
    $01,$01,$32,$3A,$01,$32,$3C,$01,\
    $32,$3E,$01,$32,$40,$46,$40,$46,\
    $40,$46,$40,$3C,$3E,$40,$38,$3A,\
    $00,$9D,$AD,$7A,$21,$00,$AB,$32,\
    $01,$01,$01,$01,$32,$3A,$01,$01,\
    $01,$01,$3A,$3C,$01,$01,$01,$01,\
    $3E,$01,$01,$3E,$40,$01,$01,$00,\
    $AB,$3C,$01,$01,$01,$01,$3C,$44,\
    $01,$01,$01,$01,$44,$46,$01,$01,\
    $01,$01,$48,$01,$01,$48,$4A,$01,\
    $01,$00,$AB,$40,$01,$01,$4E,$01,\
    $01,$40,$01,$3E,$01,$01,$3C,$01,\
    $01,$3C,$01,$01,$4A,$AD,$3C,$AA,\
    $40,$3C,$AB,$3A,$01,$01,$00,$AB,\
    $01,$01,$32,$3A,$01,$32,$3C,$01,\
    $32,$3E,$01,$32,$40,$46,$40,$46,\
    $40,$46,$40,$3C,$3E,$40,$38,$3A,\
    $00,$9B,$0B,$A3,$2E,$AD,$29,$AB,\
    $29,$A3,$1A,$AD,$29,$AB,$29,$9C,\
    $9B,$02,$AB,$2E,$1A,$2E,$1A,$2E,\
    $1A,$9C,$00,$81,$00,$00,$00,$00,\
    $00,$00,$00,$61,$00,$00,$00,$00,\
    $00,$00,$00,$51,$00,$00,$00,$00,\
    $00,$00,$00,$41,$00,$00,$00,$00,\
    $00,$00,$00,$31,$00,$00,$00,$00,\
    $00,$00,$00,$31,$00,$00,$00,$00,\
    $00,$00,$28
Data1D5EF4:                         ; 1D:5EF4
.db $00,$FF,$5E,$0E,$5F,$16,$5F,$1E,\
    $5F,$26,$5F,$03,$06,$0C,$18,$30,\
    $60,$12,$24,$48,$6F,$04,$08,$08,\
    $10,$6F,$2E,$5F,$00,$50,$FF,$FF,\
    $10,$5F,$64,$61,$00,$50,$FF,$FF,\
    $18,$5F,$2B,$64,$00,$50,$FF,$FF,\
    $20,$5F,$44,$66,$0A,$50,$FF,$FF,\
    $28,$5F,$9D,$72,$00,$83,$9B,$04,\
    $A2,$4A,$4A,$4A,$A1,$36,$A2,$4A,\
    $4A,$A1,$36,$4A,$36,$A2,$4A,$A2,\
    $48,$48,$48,$A1,$32,$A2,$48,$48,\
    $A1,$32,$48,$32,$A2,$48,$9C,$A2,\
    $4A,$4A,$4A,$A1,$36,$A2,$48,$48,\
    $A1,$36,$48,$36,$A2,$48,$A2,$4E,\
    $4E,$4E,$A1,$3A,$A2,$4A,$4A,$A1,\
    $3A,$4A,$3A,$A2,$4A,$A2,$4A,$4A,\
    $4A,$A1,$36,$A2,$48,$48,$A1,$36,\
    $48,$36,$A2,$48,$A2,$48,$48,$48,\
    $A1,$32,$A2,$46,$46,$A1,$34,$46,\
    $34,$A2,$46,$A2,$4A,$4A,$4A,$A1,\
    $36,$A2,$48,$48,$A1,$36,$48,$36,\
    $A2,$48,$A2,$4E,$4E,$4E,$A1,$3A,\
    $A2,$4A,$4A,$A1,$3A,$4A,$3A,$A2,\
    $4A,$A2,$4A,$4A,$4A,$A1,$36,$A2,\
    $48,$48,$A1,$36,$48,$36,$A2,$48,\
    $A2,$48,$48,$48,$A1,$36,$A2,$46,\
    $46,$A1,$32,$46,$32,$A2,$46,$A2,\
    $4A,$4A,$4A,$A1,$36,$A2,$48,$48,\
    $A1,$36,$48,$36,$A2,$48,$A2,$48,\
    $48,$48,$A1,$32,$A2,$44,$44,$A1,\
    $32,$44,$32,$A2,$44,$A2,$44,$44,\
    $44,$A1,$30,$A2,$42,$42,$A1,$30,\
    $42,$30,$A2,$42,$A2,$40,$40,$40,\
    $A1,$2C,$A2,$40,$40,$A1,$34,$40,\
    $34,$A2,$40,$A2,$4A,$4A,$4A,$A1,\
    $36,$A2,$48,$48,$A1,$36,$48,$36,\
    $A2,$48,$A2,$4E,$4E,$4E,$A1,$3A,\
    $A2,$4C,$4C,$A1,$3A,$4C,$3A,$A2,\
    $4C,$A2,$4A,$4A,$4A,$A1,$36,$A2,\
    $48,$48,$A1,$36,$48,$36,$A2,$48,\
    $9B,$02,$A2,$48,$48,$48,$A1,$32,\
    $A2,$48,$48,$A1,$32,$48,$32,$A2,\
    $48,$A2,$46,$46,$46,$A1,$32,$A2,\
    $46,$46,$A1,$32,$46,$34,$A2,$46,\
    $9C,$A2,$52,$52,$52,$A1,$3C,$A2,\
    $52,$52,$A1,$3C,$52,$3C,$A2,$52,\
    $A2,$4E,$4E,$4E,$A1,$3C,$A2,$4E,\
    $4E,$A1,$3C,$4E,$3C,$A2,$4E,$A2,\
    $4E,$4E,$4E,$A1,$3A,$A2,$4E,$4E,\
    $A1,$3A,$4E,$3A,$A2,$4E,$A2,$4C,\
    $4C,$4C,$A1,$3A,$A2,$4C,$4C,$A1,\
    $3A,$4C,$3A,$A2,$4C,$9B,$02,$A2,\
    $4A,$4A,$4A,$A1,$36,$A2,$4A,$4A,\
    $A1,$36,$4A,$36,$A2,$4A,$A2,$48,\
    $48,$48,$A1,$36,$A2,$48,$48,$A1,\
    $36,$48,$36,$A2,$48,$9C,$9B,$0C,\
    $A2,$4A,$4A,$4A,$A1,$36,$A2,$4A,\
    $4A,$A1,$36,$4A,$36,$A2,$4A,$A2,\
    $48,$48,$48,$A1,$32,$A2,$48,$48,\
    $A1,$32,$48,$32,$A2,$48,$9C,$00,\
    $81,$00,$00,$00,$38,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$28,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $C1,$00,$00,$00,$00,$00,$38,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$28,\
    $49,$00,$00,$00,$00,$38,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$38,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$28,\
    $9D,$72,$00,$80,$A2,$3C,$3C,$A6,\
    $3C,$A2,$3C,$A6,$3C,$A2,$3C,$3C,\
    $A2,$3A,$3A,$A6,$3A,$A2,$3A,$A6,\
    $3A,$A2,$3A,$3A,$A2,$3C,$3C,$A6,\
    $3C,$A2,$3C,$A6,$3C,$A2,$3C,$3C,\
    $A2,$3A,$3A,$A6,$3A,$A2,$3A,$A6,\
    $3A,$9D,$D4,$60,$40,$99,$27,$AA,\
    $52,$54,$58,$A0,$5C,$60,$62,$66,\
    $AD,$01,$AA,$6A,$6A,$6A,$6A,$AB,\
    $6A,$6A,$AD,$6A,$66,$62,$A1,$60,\
    $01,$62,$60,$01,$58,$01,$A4,$52,\
    $A1,$01,$A1,$01,$60,$5C,$01,$A0,\
    $60,$60,$A1,$5C,$01,$60,$5C,$01,\
    $A0,$60,$60,$A1,$5C,$01,$60,$5C,\
    $01,$66,$01,$5C,$AA,$60,$60,$60,\
    $A3,$60,$A1,$5C,$60,$5C,$AA,$60,\
    $5C,$58,$54,$52,$4E,$9D,$04,$61,\
    $00,$A6,$44,$48,$A2,$4A,$A6,$4E,\
    $52,$A2,$54,$A6,$58,$52,$A2,$4E,\
    $A3,$4A,$AB,$01,$4E,$52,$A6,$54,\
    $4E,$A2,$4A,$A6,$48,$44,$A2,$48,\
    $A8,$40,$A3,$01,$A6,$44,$48,$A2,\
    $4A,$A6,$4E,$52,$A2,$54,$A3,$58,\
    $A1,$52,$01,$A6,$5E,$A1,$01,$5C,\
    $01,$58,$A6,$54,$A6,$52,$4E,$A2,\
    $4A,$A6,$48,$44,$A2,$48,$A4,$4A,\
    $A3,$01,$9D,$34,$61,$80,$AA,$48,\
    $4A,$4E,$52,$54,$58,$AD,$5C,$58,\
    $AB,$54,$52,$A3,$4E,$A2,$52,$54,\
    $AD,$58,$54,$AB,$52,$4E,$A3,$4A,\
    $A2,$4E,$52,$AD,$54,$52,$AB,$4E,\
    $4A,$A2,$48,$42,$44,$48,$A6,$4A,\
    $4E,$A3,$52,$A2,$01,$54,$58,$AD,\
    $5C,$58,$AB,$54,$52,$A3,$4E,$A2,\
    $52,$54,$A2,$01,$58,$A1,$01,$52,\
    $01,$A2,$5E,$A1,$01,$5C,$01,$58,\
    $A1,$54,$01,$A0,$54,$58,$A6,$5A,\
    $58,$A2,$54,$A6,$52,$42,$A2,$44,\
    $A5,$4E,$A7,$01,$A3,$01,$A6,$40,\
    $44,$A5,$4E,$A7,$01,$A3,$01,$A6,\
    $40,$44,$9D,$C4,$5E,$80,$AD,$01,\
    $54,$5C,$6A,$66,$62,$A7,$5E,$62,\
    $A3,$66,$A4,$58,$AD,$01,$5C,$5E,\
    $A2,$01,$A1,$64,$A2,$01,$A6,$5E,\
    $5C,$58,$A2,$54,$A2,$01,$52,$A1,\
    $01,$52,$A2,$01,$A6,$52,$4E,$A2,\
    $4A,$A2,$01,$52,$A1,$01,$52,$A2,\
    $01,$A6,$52,$A1,$52,$A3,$01,$A2,\
    $01,$52,$A1,$01,$52,$A2,$01,$A6,\
    $52,$54,$A2,$58,$A2,$01,$52,$A1,\
    $01,$52,$A2,$01,$A3,$52,$9D,$D4,\
    $60,$40,$AA,$52,$54,$58,$A0,$5C,\
    $60,$62,$66,$AD,$01,$AA,$6A,$6A,\
    $6A,$6A,$AB,$6A,$6A,$AD,$6A,$66,\
    $62,$A1,$60,$01,$62,$60,$01,$58,\
    $01,$A4,$52,$A1,$01,$A1,$01,$60,\
    $5C,$01,$A0,$60,$60,$A1,$5C,$01,\
    $60,$5C,$01,$A0,$60,$60,$A1,$5C,\
    $01,$60,$5C,$01,$66,$01,$5C,$AA,\
    $60,$60,$60,$A3,$60,$A1,$5C,$60,\
    $5C,$AA,$60,$5C,$58,$54,$52,$4E,\
    $9D,$D4,$60,$40,$A1,$01,$01,$4E,\
    $52,$01,$58,$01,$4E,$52,$01,$5C,\
    $01,$4E,$52,$01,$60,$01,$4E,$52,\
    $01,$62,$01,$4E,$52,$01,$66,$01,\
    $4E,$52,$01,$6A,$01,$AD,$52,$6A,\
    $6A,$A1,$52,$6A,$6A,$52,$6A,$6A,\
    $52,$6A,$A2,$6A,$A1,$6C,$A4,$70,\
    $A1,$01,$A3,$01,$A0,$01,$AA,$01,\
    $A0,$6A,$70,$78,$AD,$7E,$7E,$A6,\
    $7E,$7A,$78,$A1,$01,$7A,$01,$78,\
    $70,$01,$A4,$6A,$A1,$01,$A0,$01,\
    $01,$6A,$70,$A1,$78,$A2,$74,$A1,\
    $78,$A2,$74,$A1,$78,$A2,$74,$A1,\
    $78,$A2,$74,$A1,$78,$A2,$74,$A1,\
    $66,$A4,$6A,$A7,$01,$9A,$66,$A1,\
    $01,$01,$66,$6A,$01,$78,$74,$01,\
    $66,$6A,$01,$78,$74,$01,$66,$6A,\
    $9A,$55,$01,$78,$74,$01,$66,$6A,\
    $01,$78,$74,$01,$66,$6A,$01,$78,\
    $74,$01,$9A,$44,$66,$6A,$01,$78,\
    $74,$01,$66,$6A,$01,$78,$74,$01,\
    $66,$6A,$01,$78,$9A,$33,$A1,$74,\
    $01,$A2,$78,$A1,$01,$A2,$7A,$A1,\
    $01,$A2,$7E,$A1,$01,$A2,$82,$A1,\
    $01,$A2,$84,$A1,$01,$A2,$88,$A1,\
    $01,$A2,$8C,$A1,$01,$A4,$90,$A1,\
    $01,$9A,$22,$A5,$01,$01,$9A,$11,\
    $01,$01,$9A,$00,$01,$01,$00,$9D,\
    $7F,$55,$21,$9B,$04,$A2,$36,$01,\
    $AC,$44,$AA,$01,$A1,$01,$AC,$4E,\
    $AA,$01,$A6,$01,$A1,$44,$01,$4E,\
    $01,$A2,$32,$01,$AC,$40,$AA,$01,\
    $A1,$01,$AC,$4A,$AA,$01,$A6,$01,\
    $A1,$40,$01,$4A,$01,$9C,$A2,$36,\
    $01,$AC,$44,$AA,$01,$A1,$01,$AC,\
    $40,$AA,$01,$A6,$01,$A1,$48,$01,\
    $40,$01,$A2,$3A,$01,$AC,$48,$AA,\
    $01,$A1,$01,$AC,$44,$AA,$01,$A6,\
    $01,$A1,$4A,$01,$44,$01,$A2,$36,\
    $01,$AC,$44,$AA,$01,$A1,$01,$AC,\
    $40,$AA,$01,$A6,$01,$A1,$48,$01,\
    $40,$01,$A2,$32,$01,$AC,$40,$AA,\
    $01,$A1,$01,$AC,$34,$AA,$01,$A6,\
    $01,$A1,$46,$01,$34,$01,$A2,$36,\
    $01,$AC,$44,$AA,$01,$A1,$01,$AC,\
    $40,$AA,$01,$A6,$01,$A1,$48,$01,\
    $40,$01,$A2,$3A,$01,$AC,$48,$AA,\
    $01,$A1,$01,$AC,$44,$AA,$01,$A6,\
    $01,$A1,$4A,$01,$44,$01,$A2,$36,\
    $01,$AC,$44,$AA,$01,$A1,$01,$AC,\
    $40,$AA,$01,$A6,$01,$A1,$48,$01,\
    $40,$01,$A2,$32,$01,$AC,$4A,$AA,\
    $01,$A1,$01,$AC,$40,$AA,$01,$A6,\
    $01,$A1,$46,$01,$32,$01,$A2,$36,\
    $01,$AC,$44,$AA,$01,$A1,$01,$AC,\
    $40,$AA,$01,$A6,$01,$A1,$48,$01,\
    $40,$01,$A2,$32,$01,$AC,$40,$AA,\
    $01,$A1,$01,$AC,$3C,$AA,$01,$A6,\
    $01,$A1,$44,$01,$3C,$01,$A2,$30,\
    $01,$AC,$3C,$AA,$01,$A1,$01,$AC,\
    $3A,$AA,$01,$A6,$01,$A1,$42,$01,\
    $3A,$01,$A2,$2C,$01,$AC,$3A,$AA,\
    $01,$A1,$01,$AC,$34,$AA,$01,$A6,\
    $01,$A1,$44,$01,$34,$01,$A2,$36,\
    $01,$AC,$44,$AA,$01,$A1,$01,$AC,\
    $40,$AA,$01,$A6,$01,$A1,$48,$01,\
    $40,$01,$A2,$3A,$01,$AC,$48,$AA,\
    $01,$A1,$01,$AC,$44,$AA,$01,$A6,\
    $01,$A1,$4C,$01,$44,$01,$A2,$36,\
    $01,$AC,$44,$AA,$01,$A1,$01,$AC,\
    $40,$AA,$01,$A6,$01,$A1,$48,$01,\
    $40,$01,$9B,$04,$A2,$32,$01,$AC,\
    $40,$AA,$01,$A1,$01,$AC,$4A,$AA,\
    $01,$A6,$01,$A1,$40,$01,$4A,$01,\
    $9C,$A2,$3C,$01,$AC,$4A,$AA,$01,\
    $A1,$01,$AC,$54,$AA,$01,$A6,$01,\
    $A1,$4A,$01,$54,$01,$A2,$46,$01,\
    $AC,$54,$AA,$01,$A1,$01,$AC,$46,\
    $AA,$01,$A6,$01,$A1,$3C,$01,$46,\
    $01,$A2,$3A,$01,$AC,$48,$AA,$01,\
    $A1,$01,$AC,$3A,$AA,$01,$A6,$01,\
    $A1,$48,$01,$52,$01,$A2,$44,$01,\
    $AC,$52,$AA,$01,$A1,$01,$AC,$44,\
    $AA,$01,$A6,$01,$A1,$3A,$01,$44,\
    $01,$9B,$02,$A2,$36,$01,$AC,$44,\
    $AA,$01,$A1,$01,$AC,$4E,$AA,$01,\
    $A6,$01,$A1,$44,$01,$4E,$01,$A2,\
    $40,$01,$AC,$4E,$AA,$01,$A1,$01,\
    $AC,$40,$AA,$01,$A6,$01,$A1,$36,\
    $01,$40,$01,$9C,$9B,$0C,$A2,$36,\
    $01,$AC,$44,$AA,$01,$A1,$01,$AC,\
    $4E,$AA,$01,$A6,$01,$A1,$44,$01,\
    $4E,$01,$A2,$32,$01,$AC,$40,$AA,\
    $01,$A1,$01,$AC,$4A,$AA,$01,$A6,\
    $01,$A1,$40,$01,$4A,$01,$9C,$00,\
    $9B,$10,$A2,$2E,$AC,$29,$AA,$29,\
    $A2,$1A,$AC,$29,$AA,$29,$9C,$9B,\
    $10,$A2,$2E,$AC,$29,$AA,$29,$A2,\
    $1A,$AC,$29,$AA,$29,$9C,$9B,$16,\
    $A2,$2E,$AC,$29,$AA,$29,$A2,$1A,\
    $AC,$29,$AA,$29,$9C,$9B,$10,$A2,\
    $2E,$AC,$29,$AA,$29,$A2,$1A,$AC,\
    $29,$AA,$29,$9C,$9B,$2C,$A2,$2E,\
    $AC,$29,$AA,$29,$A2,$1A,$AC,$29,\
    $AA,$29,$9C,$00,$03,$6F,$0F,$1E,\
    $3C,$78,$6F,$6F,$5A,$6F,$05,$0A,\
    $0A,$14,$F0
Data1D669F:                         ; 1D:669F
.db $00,$90,$66,$AA,$66,$B2,$66,$BA,\
    $66,$C2,$66,$61,$67,$00,$50,$FF,\
    $FF,$AC,$66,$FA,$66,$00,$50,$FF,\
    $FF,$B4,$66,$DD,$67,$00,$50,$FF,\
    $FF,$BC,$66,$02,$68,$0A,$50,$FF,\
    $FF,$C4,$66,$C1,$00,$00,$00,$58,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$9D,$CA,$66,$80,$AD,\
    $4A,$AA,$4A,$4A,$AB,$4A,$4A,$4A,\
    $4A,$40,$4A,$52,$4A,$40,$AD,$52,\
    $AA,$52,$52,$AB,$52,$52,$52,$52,\
    $4A,$52,$58,$52,$4A,$AD,$54,$AA,\
    $54,$54,$AB,$54,$54,$54,$AD,$58,\
    $AA,$58,$58,$AB,$58,$58,$58,$AD,\
    $5C,$AA,$5C,$5C,$AB,$5C,$5C,$5C,\
    $AD,$60,$62,$66,$A4,$01,$A5,$6A,\
    $9D,$78,$00,$80,$9B,$04,$A0,$6E,\
    $6A,$6E,$6A,$6E,$6A,$6E,$6A,$6E,\
    $6A,$9C,$9D,$A3,$00,$80,$AB,$6A,\
    $AD,$01,$AD,$44,$AB,$44,$44,$AD,\
    $44,$00,$9D,$CA,$66,$80,$A4,$3A,\
    $AD,$01,$AA,$3A,$3A,$AB,$40,$3A,\
    $32,$A4,$40,$AD,$01,$AA,$40,$40,\
    $AB,$4A,$40,$3A,$AB,$3C,$3C,$3C,\
    $AD,$3C,$AA,$3C,$3C,$AB,$3A,$3A,\
    $3A,$AD,$3A,$AA,$3A,$3A,$AB,$3C,\
    $3C,$3C,$AD,$3C,$AA,$3C,$3C,$AD,\
    $40,$44,$48,$A4,$01,$9D,$B2,$00,\
    $80,$AB,$44,$52,$4E,$4C,$44,$3A,\
    $44,$3A,$36,$34,$2C,$22,$A3,$2C,\
    $9D,$C8,$00,$80,$9B,$03,$AA,$22,\
    $2C,$22,$2C,$22,$2C,$9C,$9D,$C3,\
    $00,$80,$AB,$2C,$AD,$01,$AD,$2C,\
    $AB,$2C,$2C,$AD,$2C,$00,$88,$88,\
    $88,$88,$88,$88,$88,$88,$00,$00,\
    $00,$00,$00,$00,$00,$00,$9D,$CD,\
    $67,$21,$A4,$58,$AB,$01,$52,$58,\
    $62,$58,$52,$A4,$62,$AB,$01,$58,\
    $62,$6A,$62,$58,$A4,$66,$6A,$6C,\
    $AD,$70,$74,$78,$A4,$01,$AE,$7C,\
    $AB,$7C,$00,$9B,$02,$A3,$1A,$AB,\
    $29,$29,$29,$AD,$2E,$AA,$29,$29,\
    $AB,$29,$29,$29,$9C,$9B,$03,$AD,\
    $1A,$AA,$29,$29,$AB,$2E,$29,$29,\
    $9C,$9B,$03,$AB,$1A,$AA,$29,$29,\
    $9C,$9B,$0A,$A0,$29,$29,$29,$29,\
    $29,$29,$29,$29,$29,$29,$9C,$A3,\
    $1A,$AD,$29,$AB,$29,$29,$AD,$29,\
    $00
Data1D6840:                         ; 1D:6840
.db $0E,$4B,$68,$5A,$68,$62,$68,$6A,\
    $68,$00,$00,$04,$07,$0E,$18,$50,\
    $5C,$6F,$6F,$6F,$03,$6F,$6F,$6F,\
    $6F,$6F,$72,$68,$00,$50,$FF,$FF,\
    $5C,$68,$7F,$68,$00,$50,$FF,$FF,\
    $64,$68,$B5,$68,$00,$50,$FF,$FF,\
    $6C,$68,$9D,$58,$00,$80,$A5,$32,\
    $9D,$47,$00,$80,$A3,$32,$00,$9D,\
    $83,$00,$80,$A1,$32,$3A,$40,$44,\
    $9D,$68,$00,$80,$A0,$4E,$44,$4E,\
    $44,$4E,$44,$4E,$9D,$58,$00,$80,\
    $44,$4E,$44,$4E,$9D,$48,$00,$80,\
    $44,$4E,$44,$4E,$9D,$38,$00,$80,\
    $44,$4E,$44,$4E,$9D,$28,$00,$80,\
    $44,$4E,$44,$4E,$00,$9D,$BE,$68,\
    $20,$A1,$01,$A5,$52,$00,$55,$55,\
    $55,$55,$55,$55,$55,$55,$00,$00,\
    $00,$00,$00,$00,$00,$00
Data1D68CE:                         ; 1D:68CE
.db $00,$D9,$68,$E8,$68,$F0,$68,$F8,\
    $68,$00,$69,$6F,$08,$0D,$1A,$6F,\
    $6F,$05,$12,$6F,$6F,$6F,$6F,$6F,\
    $6F,$6F,$08,$69,$00,$50,$FF,$FF,\
    $EA,$68,$4A,$69,$00,$50,$FF,$FF,\
    $F2,$68,$6C,$69,$00,$50,$FF,$FF,\
    $FA,$68,$85,$69,$0A,$50,$FF,$FF,\
    $02,$69,$9D,$1A,$69,$40,$99,$00,\
    $A3,$40,$42,$A2,$44,$46,$A1,$48,\
    $4A,$A3,$4C,$00,$B7,$00,$00,$27,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$9D,$1A,$69,$40,\
    $99,$00,$A3,$4A,$4C,$A2,$4E,$50,\
    $A1,$52,$54,$A3,$56,$00,$EE,$EE,\
    $EE,$EE,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$9D,$5C,\
    $69,$20,$A1,$1A,$A7,$01,$A1,$1C,\
    $A7,$01,$A1,$1E,$A6,$01,$A1,$20,\
    $A6,$01,$A1,$22,$24,$26,$00,$A3,\
    $29,$29,$A2,$29,$29,$A1,$29,$29,\
    $29,$00
Data1D6990:                         ; 1D:6990
.db $00,$9B,$69,$AA,$69,$B2,$69,$BA,\
    $69,$C2,$69,$6F,$6F,$6F,$15,$2A,\
    $6F,$6F,$6F,$6F,$6F,$6F,$07,$6F,\
    $0E,$6F,$CA,$69,$00,$50,$FF,$FF,\
    $AC,$69,$15,$6A,$00,$50,$FF,$FF,\
    $B4,$69,$4E,$6A,$00,$50,$FF,$FF,\
    $BC,$69,$6A,$6A,$0A,$50,$FF,$FF,\
    $C4,$69,$9D,$B1,$00,$40,$AB,$3E,\
    $01,$01,$3E,$01,$01,$40,$01,$01,\
    $3C,$AB,$3A,$AD,$01,$A4,$01,$AD,\
    $32,$01,$AB,$01,$00,$B1,$00,$00,\
    $00,$38,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$9D,$E5,$69,\
    $40,$AB,$5C,$AD,$5A,$AB,$5C,$AD,\
    $60,$AB,$5C,$AD,$60,$AB,$58,$AB,\
    $62,$01,$9D,$D1,$00,$80,$22,$24,\
    $26,$28,$1A,$01,$01,$9D,$E5,$69,\
    $40,$AD,$62,$AB,$01,$00,$7E,$EE,\
    $EE,$EE,$EE,$EE,$EE,$EE,$70,$00,\
    $00,$00,$00,$00,$00,$00,$9D,$3E,\
    $6A,$20,$AB,$32,$1E,$01,$32,$28,\
    $01,$3C,$28,$01,$36,$32,$01,$01,\
    $01,$01,$01,$01,$01,$01,$1A,$01,\
    $01,$00,$AB,$1A,$2E,$01,$1A,$2E,\
    $01,$1A,$2E,$01,$1A,$A3,$1A,$AB,\
    $29,$29,$29,$A3,$2E,$1A,$00
Data1D6A7F:                         ; 1D:6A7F
.db $E8,$8A,$6A,$99,$6A,$A1,$6A,$A9,\
    $6A,$B1,$6A,$01,$6F,$6F,$15,$2A,\
    $6F,$6F,$6F,$6F,$6F,$6F,$07,$6F,\
    $0E,$6F,$2F,$6B,$34,$6B,$FF,$FF,\
    $9B,$6A,$B7,$6A,$BE,$6A,$FF,$FF,\
    $A3,$6A,$85,$6B,$9A,$6B,$FF,$FF,\
    $AB,$6A,$A2,$6B,$FF,$FF,$B1,$6A,\
    $9D,$71,$00,$80,$A0,$01,$00,$AD,\
    $4A,$AB,$52,$AD,$70,$AB,$4A,$AD,\
    $52,$AB,$70,$AD,$4A,$AB,$52,$AD,\
    $6E,$AB,$4A,$AD,$50,$A4,$6E,$AB,\
    $01,$AD,$4A,$AB,$4E,$AD,$6C,$AB,\
    $4A,$AD,$4E,$AB,$6C,$AD,$4A,$AB,\
    $4E,$AD,$6A,$AB,$40,$AD,$4A,$A3,\
    $6A,$AB,$58,$AD,$01,$AB,$58,$AD,\
    $4A,$AB,$52,$AD,$70,$AB,$4A,$AD,\
    $52,$AB,$70,$AD,$4A,$AB,$52,$AD,\
    $6E,$AB,$4A,$AD,$50,$A4,$6E,$AB,\
    $01,$AD,$4A,$AB,$4E,$AD,$6C,$AB,\
    $4A,$AD,$4E,$AB,$6C,$AD,$4A,$AB,\
    $4E,$AD,$6A,$AB,$4A,$AD,$4E,$A3,\
    $4A,$AB,$62,$AD,$01,$AB,$62,$00,\
    $9D,$71,$00,$80,$00,$A3,$01,$AD,\
    $6A,$A3,$01,$AB,$6A,$A3,$01,$AD,\
    $68,$A3,$01,$A4,$68,$AB,$01,$A3,\
    $01,$AD,$66,$A3,$01,$AB,$66,$A3,\
    $01,$AD,$62,$A3,$01,$A3,$62,$AB,\
    $52,$AD,$01,$AB,$52,$A3,$01,$AD,\
    $6A,$A3,$01,$AB,$6A,$A3,$01,$AD,\
    $68,$A3,$01,$A4,$68,$AB,$01,$A3,\
    $01,$AD,$66,$A3,$01,$AB,$66,$A3,\
    $01,$AD,$62,$A3,$01,$A3,$40,$AB,\
    $58,$AD,$01,$AB,$58,$00,$9D,$8A,\
    $6B,$21,$00,$38,$BB,$BB,$BB,$BB,\
    $BB,$BB,$BB,$83,$00,$00,$00,$00,\
    $00,$00,$00,$9B,$20,$AD,$4A,$AB,\
    $01,$9C,$00,$9B,$07,$A3,$2E,$AD,\
    $29,$AB,$29,$9C,$AD,$2E,$AB,$29,\
    $AD,$29,$AB,$29,$00
Data1D6BB4:                         ; 1D:6BB4
.db $00,$BF,$6B,$CE,$6B,$D6,$6B,$DE,\
    $6B,$E6,$6B,$6F,$05,$0A,$12,$24,\
    $48,$4D,$18,$22,$17,$03,$06,$06,\
    $0C,$90,$C3,$6C,$00,$50,$FF,$FF,\
    $D0,$6B,$7E,$6C,$00,$50,$FF,$FF,\
    $D8,$6B,$3D,$6D,$00,$50,$FF,$FF,\
    $E0,$6B,$7B,$6D,$0A,$50,$FF,$FF,\
    $E8,$6B,$D1,$00,$00,$00,$00,$00,\
    $00,$00,$48,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$91,$00,$00,$00,$00,$00,\
    $00,$00,$38,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$29,$00,$00,$00,$00,$38,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$28,$9D,$91,$00,$80,$A1,$58,\
    $5C,$60,$66,$6C,$70,$78,$7E,$9D,\
    $EE,$6B,$40,$AB,$62,$AD,$01,$01,\
    $A7,$58,$AB,$52,$AD,$01,$01,$AB,\
    $5C,$01,$01,$A3,$60,$AB,$5E,$AB,\
    $5C,$01,$01,$AE,$58,$AB,$01,$AD,\
    $01,$A3,$01,$AD,$5E,$AB,$60,$AD,\
    $01,$AB,$62,$A4,$01,$9D,$4E,$6C,\
    $80,$A2,$01,$58,$A5,$66,$00,$9D,\
    $44,$00,$80,$AD,$01,$A1,$58,$5C,\
    $60,$66,$54,$70,$78,$A9,$01,$9D,\
    $1E,$6C,$40,$A7,$4A,$AB,$40,$AD,\
    $01,$01,$AB,$4A,$01,$01,$A3,$4E,\
    $AB,$4C,$AB,$4A,$01,$01,$A3,$01,\
    $AB,$52,$54,$56,$AD,$58,$AB,$52,\
    $AD,$4A,$AB,$40,$AB,$46,$44,$46,\
    $44,$46,$44,$46,$44,$46,$44,$46,\
    $44,$46,$AD,$01,$A3,$01,$A3,$54,\
    $AD,$01,$AB,$52,$A4,$01,$9D,$4E,\
    $6C,$80,$A1,$01,$A2,$52,$A6,$5C,\
    $00,$6C,$CC,$CC,$CC,$CC,$CC,$CC,\
    $CC,$60,$00,$00,$00,$00,$00,$00,\
    $00,$24,$66,$66,$66,$66,$66,$66,\
    $66,$42,$00,$00,$00,$00,$00,$00,\
    $00,$9D,$2D,$6D,$21,$A8,$70,$AB,\
    $01,$9D,$1D,$6D,$21,$AB,$40,$AD,\
    $01,$01,$A7,$3A,$AB,$32,$AD,$01,\
    $AD,$3C,$AB,$01,$28,$01,$A3,$40,\
    $AB,$3E,$AB,$3C,$01,$01,$AE,$3A,\
    $AB,$3A,$AD,$01,$A3,$01,$AD,$36,\
    $AB,$34,$AD,$01,$AB,$32,$A4,$01,\
    $9D,$2D,$6D,$21,$A6,$4A,$00,$A8,\
    $01,$AA,$29,$29,$9B,$08,$A3,$2E,\
    $AD,$29,$AB,$29,$9C,$A3,$1A,$AB,\
    $29,$29,$29,$AD,$2E,$AB,$29,$AD,\
    $29,$AB,$1A,$A4,$01,$A6,$01,$A1,\
    $29,$29,$A3,$2E,$00
Data1D6DA1:                         ; 1D:6DA1
.db $F6,$AC,$6D,$BB,$6D,$C3,$6D,$CB,\
    $6D,$D3,$6D,$6F,$6F,$6F,$1E,$3C,\
    $78,$6F,$6F,$5A,$6F,$05,$0A,$0A,\
    $14,$6F,$D9,$6D,$DE,$6D,$FF,$FF,\
    $BD,$6D,$9C,$6E,$A1,$6E,$FF,$FF,\
    $C5,$6D,$5A,$6F,$6F,$6F,$FF,$FF,\
    $CD,$6D,$32,$70,$FF,$FF,$D3,$6D,\
    $9D,$74,$00,$80,$00,$A3,$01,$01,\
    $01,$AB,$4A,$01,$01,$40,$01,$01,\
    $4A,$01,$01,$40,$01,$01,$48,$01,\
    $01,$40,$01,$01,$48,$01,$01,$3C,\
    $01,$01,$44,$01,$01,$3A,$01,$01,\
    $44,$01,$01,$3A,$01,$40,$AD,$01,\
    $A3,$3C,$AB,$3C,$A3,$3A,$36,$AB,\
    $3C,$01,$01,$32,$01,$01,$44,$01,\
    $01,$32,$01,$01,$3A,$01,$01,$3A,\
    $01,$01,$44,$01,$01,$3A,$01,$01,\
    $4A,$01,$01,$3E,$01,$01,$44,$01,\
    $01,$AD,$3E,$AB,$3C,$AD,$01,$AB,\
    $28,$AD,$01,$AB,$28,$A3,$2C,$30,\
    $AB,$4A,$01,$01,$40,$01,$01,$4A,\
    $01,$01,$40,$01,$01,$48,$01,$01,\
    $40,$01,$01,$48,$01,$AB,$52,$AD,\
    $54,$AB,$5A,$AB,$44,$01,$5C,$3A,\
    $01,$A3,$5C,$AB,$52,$AD,$5C,$A3,\
    $58,$A3,$3C,$AB,$3C,$A3,$3A,$36,\
    $AB,$54,$01,$01,$32,$01,$01,$5C,\
    $01,$01,$32,$01,$01,$4A,$01,$01,\
    $3A,$01,$01,$44,$01,$AB,$40,$AD,\
    $44,$AB,$46,$A3,$3E,$01,$AD,$01,\
    $AB,$36,$AD,$3C,$AB,$3A,$A5,$01,\
    $A3,$01,$00,$9D,$94,$00,$80,$00,\
    $A3,$48,$4A,$4E,$AD,$52,$AB,$50,\
    $AD,$52,$AB,$50,$AD,$52,$AB,$58,\
    $01,$01,$A3,$4E,$AB,$4C,$AD,$4E,\
    $AB,$4C,$AD,$4E,$AB,$58,$A3,$01,\
    $AD,$01,$AB,$4A,$AD,$01,$AB,$4A,\
    $A3,$52,$AD,$4A,$A5,$46,$AB,$01,\
    $A3,$44,$48,$4A,$44,$40,$AD,$52,\
    $4A,$01,$A3,$01,$AD,$4E,$AB,$4C,\
    $AD,$4E,$AB,$4C,$A3,$4E,$AD,$44,\
    $A3,$48,$AB,$30,$01,$01,$30,$A3,\
    $32,$36,$AD,$52,$AB,$50,$AD,$52,\
    $AB,$50,$AD,$52,$AB,$58,$01,$01,\
    $A3,$4E,$AB,$4C,$AD,$4E,$AB,$4C,\
    $AD,$4E,$AB,$5A,$AD,$5C,$AB,$60,\
    $AD,$01,$AB,$62,$AD,$01,$AB,$62,\
    $AD,$62,$AB,$58,$AD,$62,$A5,$5E,\
    $AB,$01,$A3,$5C,$60,$62,$5C,$AD,\
    $58,$AB,$50,$AD,$4E,$A3,$4A,$AB,\
    $30,$AD,$32,$AB,$34,$AD,$4E,$AB,\
    $4C,$AD,$4E,$AB,$4C,$AD,$4E,$AB,\
    $44,$AD,$48,$AD,$4A,$AB,$01,$32,\
    $AD,$2C,$AB,$01,$AD,$28,$AB,$20,\
    $AD,$1E,$AB,$01,$AB,$1A,$AD,$01,\
    $00,$9D,$5F,$6F,$21,$00,$37,$AA,\
    $AA,$AA,$AA,$AA,$AA,$AA,$73,$00,\
    $00,$00,$00,$00,$00,$00,$AD,$40,\
    $AB,$01,$AD,$44,$AB,$01,$AD,$48,\
    $AB,$01,$AD,$4A,$AB,$01,$52,$AD,\
    $01,$40,$AB,$01,$52,$AD,$01,$4E,\
    $AB,$01,$54,$AD,$01,$40,$AB,$01,\
    $A3,$42,$AB,$44,$01,$01,$4A,$AD,\
    $01,$3A,$AB,$01,$4A,$01,$4A,$40,\
    $01,$4E,$01,$01,$4E,$4A,$01,$46,\
    $44,$01,$40,$AD,$3C,$AB,$01,$44,\
    $AD,$01,$32,$AB,$01,$44,$AD,$01,\
    $3A,$AB,$01,$4A,$AD,$01,$A3,$32,\
    $AB,$36,$01,$3A,$AD,$36,$AB,$01,\
    $4E,$AD,$01,$44,$AB,$01,$4E,$01,\
    $40,$A5,$01,$AD,$4A,$AB,$01,$52,\
    $AD,$01,$40,$AB,$01,$52,$AD,$01,\
    $4E,$AB,$01,$54,$AD,$01,$40,$AB,\
    $4E,$AB,$4A,$01,$48,$AD,$44,$AB,\
    $01,$4A,$AD,$01,$3A,$AB,$01,$4A,\
    $AD,$01,$AB,$40,$01,$4E,$01,$01,\
    $4E,$4A,$01,$46,$44,$01,$40,$AD,\
    $3C,$AB,$01,$44,$AD,$01,$32,$AB,\
    $01,$44,$AD,$01,$3A,$AB,$01,$4A,\
    $AD,$01,$32,$AB,$01,$A3,$50,$AB,\
    $4E,$AD,$01,$01,$A3,$01,$AB,$3E,\
    $AD,$40,$AB,$4A,$A5,$01,$A3,$01,\
    $00,$A3,$01,$AD,$01,$AB,$29,$A3,\
    $29,$9B,$03,$A3,$2E,$29,$2E,$29,\
    $9C,$AD,$2E,$A3,$29,$AB,$2E,$AD,\
    $29,$AB,$2E,$A3,$29,$9B,$03,$A3,\
    $2E,$29,$2E,$29,$9C,$AD,$2E,$A3,\
    $29,$AB,$2E,$A3,$29,$AB,$29,$29,\
    $29,$A3,$2E,$29,$2E,$29,$A3,$2E,\
    $29,$AD,$2E,$AB,$29,$29,$01,$29,\
    $A3,$2E,$29,$2E,$29,$AD,$2E,$A3,\
    $29,$AB,$2E,$AD,$29,$AB,$2E,$A3,\
    $29,$A3,$2E,$29,$2E,$29,$2E,$AD,\
    $29,$A3,$2E,$AB,$29,$29,$29,$29,\
    $A3,$1A,$01,$AD,$01,$AB,$29,$AB,\
    $29,$01,$29,$A3,$2E,$29,$2E,$29,\
    $A3,$29,$00
Data1D70A4:                         ; 1D:70A4
.db $00,$AF,$70,$BE,$70,$C6,$70,$CE,\
    $70,$D6,$70,$6F,$6F,$6F,$15,$2A,\
    $6F,$6F,$6F,$6F,$6F,$6F,$07,$6F,\
    $0E,$6F,$DC,$70,$E1,$70,$FF,$FF,\
    $C0,$70,$03,$71,$38,$71,$FF,$FF,\
    $C8,$70,$A3,$71,$B8,$71,$FF,$FF,\
    $D0,$70,$FC,$71,$FF,$FF,$D6,$70,\
    $9D,$91,$00,$40,$00,$9B,$10,$AB,\
    $01,$01,$40,$9C,$9B,$04,$01,$01,\
    $44,$9C,$9B,$04,$01,$01,$40,$9C,\
    $9B,$04,$01,$01,$44,$9C,$AB,$48,\
    $01,$01,$A3,$40,$A4,$3C,$00,$9D,\
    $08,$71,$40,$00,$91,$00,$00,$00,\
    $28,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$AD,$01,$AB,$52,\
    $AD,$50,$AB,$52,$AD,$58,$AB,$52,\
    $AD,$4A,$AB,$40,$AD,$01,$AB,$40,\
    $AD,$44,$A3,$40,$01,$AB,$01,$AD,\
    $01,$AB,$52,$AD,$50,$AB,$52,$AD,\
    $58,$AB,$52,$AD,$4A,$AD,$58,$AB,\
    $01,$AB,$58,$AD,$5C,$A3,$58,$01,\
    $AB,$01,$AD,$01,$AB,$5C,$AD,$5A,\
    $AB,$5C,$AD,$62,$A3,$5C,$AB,$01,\
    $AD,$01,$AB,$58,$AD,$56,$AB,$58,\
    $AD,$62,$A3,$58,$AB,$01,$AD,$01,\
    $AB,$5C,$AD,$5A,$AB,$5C,$AD,$60,\
    $AB,$5C,$AD,$60,$AB,$62,$AB,$66,\
    $AD,$01,$A3,$60,$5C,$58,$00,$9D,\
    $A8,$71,$20,$00,$4A,$EE,$EE,$EE,\
    $EE,$EE,$EE,$EE,$A4,$00,$00,$00,\
    $00,$00,$00,$00,$9B,$06,$AB,$32,\
    $01,$3A,$28,$01,$3A,$9C,$32,$01,\
    $3A,$32,$01,$3A,$2E,$01,$3A,$28,\
    $01,$3A,$9B,$02,$24,$01,$3C,$32,\
    $01,$3C,$9C,$9B,$02,$28,$01,$3A,\
    $1A,$01,$22,$9C,$1E,$01,$3E,$1E,\
    $01,$3E,$26,$01,$3E,$26,$01,$3E,\
    $28,$01,$01,$AD,$28,$AB,$01,$AD,\
    $2C,$AB,$01,$AD,$30,$AB,$01,$00,\
    $9B,$02,$AB,$2E,$01,$1A,$2E,$01,\
    $1A,$2E,$01,$1A,$2E,$01,$1A,$2E,\
    $01,$1A,$2E,$01,$1A,$2E,$01,$1A,\
    $AD,$1A,$AB,$2E,$9C,$9B,$02,$2E,\
    $01,$1A,$2E,$01,$1A,$2E,$01,$1A,\
    $AD,$1A,$AB,$2E,$9C,$AB,$2E,$01,\
    $1A,$2E,$01,$1A,$2E,$01,$1A,$2E,\
    $01,$1A,$A3,$1A,$2E,$01,$01,$00
Data1D723C:                         ; 1D:723C
.db $00,$47,$72,$56,$72,$5E,$72,$66,\
    $72,$00,$00,$05,$6F,$6F,$18,$6F,\
    $6C,$6F,$2E,$6F,$6F,$07,$08,$0E,\
    $10,$6F,$6E,$72,$00,$50,$FF,$FF,\
    $58,$72,$9F,$72,$00,$50,$FF,$FF,\
    $60,$72,$F3,$72,$00,$50,$FF,$FF,\
    $68,$72,$9D,$C3,$72,$80,$AA,$36,\
    $38,$3A,$3C,$3E,$40,$AC,$42,$AA,\
    $01,$AC,$40,$AA,$01,$AC,$3E,$AA,\
    $01,$AC,$3C,$AA,$01,$AB,$3A,$01,\
    $01,$AD,$30,$AB,$01,$AB,$01,$AD,\
    $28,$A0,$2E,$28,$2E,$28,$2E,$28,\
    $A7,$2E,$00,$9D,$C3,$72,$80,$AA,\
    $3C,$3E,$40,$42,$44,$46,$AA,$48,\
    $AC,$01,$AA,$46,$AC,$01,$AA,$44,\
    $AC,$01,$AA,$42,$AC,$01,$AB,$40,\
    $01,$01,$AD,$3C,$A5,$3A,$00,$69,\
    $00,$00,$87,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$27,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$9D,\
    $18,$73,$21,$AA,$36,$34,$32,$30,\
    $2E,$2C,$AA,$2A,$01,$AA,$40,$AC,\
    $01,$AA,$3E,$AC,$01,$AA,$3C,$AC,\
    $01,$AA,$3A,$AB,$38,$01,$01,$AD,\
    $34,$A5,$32,$00,$48,$CC,$CC,$CC,\
    $CC,$CC,$CC,$CC,$84,$00,$00,$00,\
    $00,$00,$00,$00
Data1D7328:                         ; 1D:7328
.db $00,$33,$73,$42,$73,$4A,$73,$52,\
    $73,$00,$00,$00,$00,$0F,$1E,$3C,\
    $1E,$00,$00,$32,$00,$05,$0A,$0A,\
    $14,$1E,$B0,$73,$00,$50,$FF,$FF,\
    $44,$73,$62,$73,$00,$50,$FF,$FF,\
    $4C,$73,$CE,$73,$00,$50,$FF,$FF,\
    $54,$73,$FE,$73,$00,$50,$FF,$FF,\
    $5C,$73,$9D,$61,$00,$80,$A3,$01,\
    $58,$AD,$01,$AB,$56,$A3,$58,$AD,\
    $01,$AB,$58,$AD,$01,$AB,$58,$AD,\
    $01,$9D,$80,$73,$80,$AE,$58,$00,\
    $81,$00,$00,$00,$47,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $9D,$61,$00,$80,$A3,$01,$52,$AD,\
    $01,$AB,$50,$A3,$52,$AD,$01,$AB,\
    $54,$AD,$01,$AB,$54,$A3,$01,$9D,\
    $80,$73,$80,$A5,$52,$00,$9D,$EE,\
    $73,$20,$AB,$4A,$01,$AD,$40,$AB,\
    $01,$48,$40,$01,$01,$01,$01,$01,\
    $3C,$01,$3C,$AB,$40,$01,$40,$4A,\
    $01,$01,$01,$01,$01,$00,$8F,$FF,\
    $FF,$FF,$FF,$FF,$FF,$FF,$70,$00,\
    $00,$00,$00,$00,$00,$00,$A3,$2E,\
    $AD,$29,$AB,$2E,$A4,$2E,$AD,$2E,\
    $AB,$29,$AD,$2E,$AB,$29,$A4,$2E,\
    $00
Data1D7411:                         ; 1D:7411
.db $00,$1C,$74,$2B,$74,$33,$74,$3B,\
    $74,$43,$74,$03,$06,$0C,$18,$30,\
    $60,$12,$24,$48,$01,$04,$08,$08,\
    $10,$90,$C9,$74,$00,$50,$FF,$FF,\
    $2D,$74,$4B,$74,$00,$50,$FF,$FF,\
    $35,$74,$09,$75,$00,$50,$FF,$FF,\
    $3D,$74,$59,$75,$0A,$50,$FF,$FF,\
    $45,$74,$9D,$68,$00,$80,$A1,$01,\
    $40,$44,$48,$4A,$4E,$52,$54,$9D,\
    $48,$00,$80,$A9,$7E,$7A,$7E,$7A,\
    $7E,$7A,$A1,$01,$A9,$7E,$7A,$7E,\
    $7A,$7E,$7A,$A9,$7E,$7A,$7E,$7A,\
    $7E,$7A,$A9,$74,$70,$74,$70,$74,\
    $70,$A9,$74,$70,$74,$70,$74,$70,\
    $A1,$01,$A9,$7E,$7A,$7E,$7A,$7E,\
    $7A,$A1,$01,$A9,$7E,$7A,$7E,$7A,\
    $7E,$7A,$A1,$01,$A9,$7E,$7A,$7E,\
    $7A,$7E,$7A,$A9,$74,$70,$74,$70,\
    $74,$70,$A1,$01,$A9,$74,$70,$74,\
    $70,$74,$70,$A1,$01,$9D,$72,$00,\
    $40,$A1,$58,$5A,$01,$5C,$01,$5E,\
    $01,$60,$AB,$62,$AA,$01,$A9,$01,\
    $A0,$4A,$01,$4A,$01,$AB,$4A,$00,\
    $9D,$68,$00,$80,$A1,$01,$3A,$3C,\
    $40,$44,$48,$4A,$4E,$9D,$81,$00,\
    $40,$A1,$74,$32,$3A,$28,$A1,$74,\
    $3A,$28,$32,$A1,$74,$28,$32,$74,\
    $A1,$74,$3A,$74,$74,$9D,$72,$00,\
    $40,$A1,$52,$54,$01,$56,$01,$58,\
    $01,$54,$AB,$52,$AA,$01,$A9,$01,\
    $A0,$32,$01,$32,$01,$AB,$32,$00,\
    $9D,$49,$75,$20,$A1,$28,$40,$3C,\
    $36,$32,$30,$2C,$28,$A2,$1A,$A1,\
    $01,$A0,$28,$01,$A2,$28,$A1,$01,\
    $A0,$1A,$01,$A2,$1A,$A1,$01,$A0,\
    $28,$01,$A1,$28,$01,$1A,$01,$A0,\
    $28,$01,$A1,$28,$01,$24,$01,$22,\
    $01,$1E,$AB,$1A,$AA,$01,$A9,$01,\
    $A0,$32,$01,$32,$01,$AB,$32,$00,\
    $4A,$EE,$EE,$EE,$EE,$EE,$EE,$EE,\
    $A4,$00,$00,$00,$00,$00,$00,$00,\
    $A1,$2E,$01,$01,$01,$2E,$01,$29,\
    $29,$29,$29,$1A,$29,$29,$1A,$29,\
    $29,$29,$29,$1A,$29,$29,$1A,$1A,\
    $29,$A1,$2E,$1A,$01,$1A,$01,$1A,\
    $01,$1A,$AB,$1A,$AA,$01,$A9,$01,\
    $A1,$29,$29,$AB,$2E,$00
Data1D7587:                         ; 1D:7587
.db $00,$92,$75,$A1,$75,$A9,$75,$B1,\
    $75,$B9,$75,$03,$06,$0C,$18,$30,\
    $60,$12,$24,$40,$05,$04,$08,$08,\
    $10,$90,$2F,$76,$45,$76,$FF,$FF,\
    $A3,$75,$C1,$75,$E4,$75,$FF,$FF,\
    $AB,$75,$98,$76,$BE,$76,$FF,$FF,\
    $B3,$75,$5F,$77,$72,$77,$FF,$FF,\
    $BB,$75,$9D,$72,$00,$40,$A1,$54,\
    $58,$62,$5E,$01,$58,$01,$54,$01,\
    $52,$54,$52,$46,$4A,$01,$9D,$FF,\
    $75,$80,$A0,$52,$54,$A5,$58,$01,\
    $A4,$62,$A5,$58,$00,$A6,$58,$5A,\
    $A5,$5C,$A2,$01,$A4,$01,$01,$66,\
    $A5,$5C,$A6,$5C,$5A,$A5,$58,$A2,\
    $01,$A4,$01,$01,$62,$A5,$58,$00,\
    $34,$00,$00,$00,$3C,$00,$00,$00,\
    $00,$00,$00,$00,$44,$00,$00,$00,\
    $00,$00,$00,$00,$2C,$00,$00,$00,\
    $00,$00,$00,$00,$34,$00,$00,$00,\
    $00,$00,$00,$00,$1C,$00,$00,$00,\
    $00,$00,$00,$00,$24,$00,$00,$17,\
    $9D,$92,$00,$40,$A1,$3C,$40,$4A,\
    $46,$01,$40,$01,$3C,$01,$3A,$3C,\
    $3A,$2E,$32,$01,$01,$00,$9D,$81,\
    $00,$40,$9B,$03,$A1,$3C,$32,$3C,\
    $32,$3A,$28,$32,$3C,$32,$3C,$32,\
    $3A,$28,$32,$3A,$32,$9C,$3C,$32,\
    $3C,$32,$3A,$28,$32,$3C,$9D,$92,\
    $00,$40,$A6,$3C,$3E,$A2,$40,$9D,\
    $81,$00,$40,$9B,$03,$A1,$40,$36,\
    $40,$36,$3E,$2C,$36,$40,$36,$40,\
    $36,$3E,$2C,$36,$3E,$36,$9C,$40,\
    $36,$40,$36,$3E,$2C,$36,$40,$9D,\
    $92,$00,$40,$A6,$40,$3E,$A2,$3C,\
    $00,$9D,$AE,$76,$20,$A1,$32,$2E,\
    $28,$24,$01,$22,$01,$32,$01,$2E,\
    $32,$2E,$3C,$3A,$01,$01,$00,$FE,\
    $DC,$BA,$98,$76,$54,$32,$10,$00,\
    $00,$00,$00,$00,$00,$00,$00,$A2,\
    $1A,$A1,$32,$01,$A2,$1A,$A1,$32,\
    $01,$A2,$1A,$A1,$32,$01,$A2,$1A,\
    $A1,$32,$01,$A2,$1A,$A1,$32,$01,\
    $A2,$1A,$A1,$32,$01,$A2,$1A,$A1,\
    $32,$01,$A1,$1A,$32,$1A,$01,$A2,\
    $1A,$A1,$32,$01,$A2,$1A,$A1,$32,\
    $01,$A2,$1A,$A1,$32,$01,$A2,$1A,\
    $A1,$32,$01,$A2,$1A,$A1,$32,$01,\
    $A2,$1A,$A1,$32,$01,$A2,$1A,$A1,\
    $32,$A2,$1C,$A1,$34,$A2,$1E,$A2,\
    $1E,$A1,$36,$01,$A2,$1E,$A1,$36,\
    $01,$A2,$1E,$A1,$36,$01,$A2,$1E,\
    $A1,$36,$01,$A2,$1E,$A1,$36,$01,\
    $A2,$1E,$A1,$36,$01,$A2,$1E,$A1,\
    $36,$01,$A1,$1E,$36,$1E,$01,$A2,\
    $1E,$A1,$36,$01,$A2,$1E,$A1,$36,\
    $01,$A2,$1E,$A1,$36,$01,$A2,$1E,\
    $A1,$36,$01,$A2,$1E,$A1,$36,$01,\
    $A2,$1E,$A1,$36,$01,$A2,$1E,$A1,\
    $36,$A2,$1C,$A1,$34,$A2,$1A,$00,\
    $A2,$1A,$A1,$2E,$29,$01,$29,$01,\
    $29,$01,$29,$01,$A6,$1A,$A1,$01,\
    $A0,$2E,$2E,$A2,$29,$29,$A1,$1A,\
    $A2,$01,$2E,$2E,$A1,$01,$A1,$1A,\
    $A6,$01,$A2,$29,$29,$A1,$1A,$A2,\
    $01,$2E,$2E,$A1,$29,$A6,$1A,$A0,\
    $2E,$2E,$A2,$29,$29,$A1,$1A,$A2,\
    $01,$2E,$2E,$A1,$01,$A1,$1A,$A6,\
    $01,$A2,$29,$29,$A1,$1A,$A6,$01,\
    $A1,$1A,$1A,$01,$1A,$1A,$01,$A2,\
    $1A,$A2,$29,$29,$A1,$1A,$A2,$01,\
    $2E,$2E,$A1,$01,$A1,$1A,$A6,$01,\
    $A2,$29,$29,$A1,$1A,$A2,$01,$2E,\
    $2E,$A1,$29,$A6,$1A,$A0,$2E,$2E,\
    $A2,$29,$29,$A1,$1A,$A2,$01,$2E,\
    $2E,$A1,$01,$A1,$1A,$A6,$01,$A2,\
    $29,$29,$A1,$1A,$A6,$01,$A1,$1A,\
    $1A,$01,$1A,$1A,$01,$A2,$1A,$00
Data1D77EF:                         ; 1D:77EF
.db $00,$FA,$77,$09,$78,$11,$78,$19,\
    $78,$21,$78,$03,$09,$12,$24,$48,\
    $90,$1B,$36,$6C,$05,$06,$0C,$0C,\
    $18,$90,$29,$78,$38,$78,$FF,$FF,\
    $0B,$78,$B1,$78,$C0,$78,$FF,$FF,\
    $13,$78,$39,$79,$69,$79,$FF,$FF,\
    $1B,$78,$35,$7A,$4B,$7A,$FF,$FF,\
    $23,$78,$9D,$91,$00,$40,$A3,$40,\
    $40,$44,$44,$40,$40,$40,$A2,$40,\
    $00,$9B,$02,$A2,$01,$40,$AC,$01,\
    $A0,$32,$3A,$AC,$40,$AA,$3A,$A2,\
    $01,$44,$01,$44,$A2,$01,$40,$AC,\
    $01,$A0,$30,$36,$AC,$40,$AA,$36,\
    $A2,$01,$40,$01,$40,$9C,$A2,$01,\
    $40,$AC,$01,$A0,$32,$3A,$AC,$40,\
    $AA,$3A,$A2,$01,$44,$01,$44,$A2,\
    $01,$40,$AC,$01,$A0,$30,$36,$AC,\
    $40,$AA,$36,$A2,$40,$40,$48,$48,\
    $9B,$03,$AB,$44,$44,$44,$44,$48,\
    $01,$9C,$A2,$40,$3A,$01,$3A,$A2,\
    $01,$40,$AC,$01,$A0,$32,$3A,$AC,\
    $40,$AA,$3A,$A2,$01,$44,$01,$44,\
    $A2,$01,$40,$AC,$01,$A0,$30,$36,\
    $AC,$40,$AA,$36,$A2,$01,$40,$01,\
    $40,$00,$9D,$91,$00,$40,$A3,$4A,\
    $4A,$4A,$4A,$48,$48,$4A,$A2,$4A,\
    $00,$9B,$02,$A2,$01,$4A,$AC,$01,\
    $A0,$3A,$40,$AC,$4A,$AA,$40,$A2,\
    $01,$4A,$01,$4A,$A2,$01,$48,$AC,\
    $01,$A0,$36,$40,$AC,$48,$AA,$40,\
    $A2,$01,$4A,$01,$4A,$9C,$A2,$01,\
    $4A,$AC,$01,$A0,$3A,$40,$AC,$4A,\
    $AA,$40,$A2,$01,$4A,$01,$4A,$A2,\
    $01,$48,$AC,$01,$A0,$36,$40,$AC,\
    $48,$AA,$40,$A2,$48,$48,$4E,$4E,\
    $9B,$03,$AB,$4A,$4A,$4A,$4A,$36,\
    $01,$9C,$A2,$4A,$40,$01,$40,$A2,\
    $01,$4A,$AC,$01,$A0,$3A,$40,$AC,\
    $4A,$AA,$40,$A2,$01,$4A,$01,$4A,\
    $A2,$01,$48,$AC,$01,$A0,$36,$40,\
    $AC,$48,$AA,$40,$A2,$01,$4A,$01,\
    $4A,$00,$9D,$AD,$7A,$20,$AA,$32,\
    $01,$32,$01,$01,$28,$2C,$01,$01,\
    $A1,$3C,$01,$3A,$01,$3C,$A6,$01,\
    $A2,$01,$AA,$40,$01,$40,$01,$01,\
    $40,$3C,$01,$01,$A1,$3A,$01,$32,\
    $01,$AA,$28,$01,$28,$AC,$2C,$AA,\
    $28,$00,$A2,$01,$AA,$32,$01,$32,\
    $01,$01,$28,$2C,$01,$01,$A1,$3C,\
    $01,$3A,$01,$3C,$A6,$01,$A2,$01,\
    $AA,$40,$01,$40,$01,$01,$40,$3C,\
    $01,$01,$A1,$3A,$01,$32,$01,$AA,\
    $32,$01,$40,$AC,$44,$AA,$48,$A2,\
    $01,$AA,$4A,$AC,$01,$01,$A2,$40,\
    $AA,$3A,$A1,$3C,$01,$3A,$01,$3C,\
    $A6,$01,$A2,$01,$AA,$40,$01,$40,\
    $01,$01,$40,$3C,$01,$01,$A1,$3A,\
    $01,$AA,$32,$01,$28,$AC,$01,$AA,\
    $28,$AC,$2C,$AA,$28,$A2,$01,$AA,\
    $32,$01,$32,$01,$01,$28,$2C,$01,\
    $01,$A1,$3C,$01,$3A,$01,$3C,$A6,\
    $01,$A2,$01,$AA,$40,$01,$40,$01,\
    $01,$40,$44,$01,$01,$A1,$40,$01,\
    $40,$01,$3C,$01,$36,$01,$9B,$03,\
    $AA,$24,$01,$3C,$01,$3C,$01,$3C,\
    $01,$40,$01,$01,$01,$9C,$A1,$32,\
    $01,$01,$28,$A2,$2C,$A1,$28,$01,\
    $A2,$01,$AA,$32,$01,$32,$01,$01,\
    $28,$2C,$01,$01,$A1,$3C,$01,$3A,\
    $01,$3C,$A6,$01,$A2,$01,$AA,$40,\
    $01,$40,$01,$01,$40,$3C,$01,$01,\
    $A1,$3A,$01,$32,$01,$AA,$28,$01,\
    $28,$AC,$2C,$AA,$28,$00,$A2,$01,\
    $A3,$01,$01,$01,$A4,$01,$A2,$01,\
    $AC,$01,$A0,$29,$29,$AC,$1A,$A2,\
    $1A,$AA,$1A,$00,$A2,$29,$2E,$29,\
    $2E,$29,$AC,$2E,$AA,$2E,$A2,$29,\
    $2E,$A2,$29,$2E,$29,$2E,$29,$AC,\
    $2E,$AA,$1A,$A2,$1A,$1A,$9B,$03,\
    $A2,$29,$2E,$29,$1A,$29,$AC,$2E,\
    $AA,$2E,$A2,$29,$1A,$9C,$A2,$29,\
    $2E,$29,$1A,$A2,$29,$29,$29,$29,\
    $9B,$02,$AB,$2E,$1A,$1A,$2E,$1A,\
    $2E,$9C,$2E,$1A,$1A,$2E,$1A,$2E,\
    $A2,$2E,$AC,$01,$A0,$29,$29,$AC,\
    $1A,$A2,$1A,$AA,$1A,$9B,$02,$A2,\
    $29,$2E,$29,$2E,$29,$AC,$2E,$AA,\
    $2E,$A2,$29,$2E,$9C,$00,$8F,$FF,\
    $FF,$FF,$FF,$FF,$FF,$FF,$70,$00,\
    $00,$00,$00,$00,$00,$00
Data1D7ABD:                         ; 1D:7ABD
.db $00,$C8,$7A,$D8,$7A,$E0,$7A,$E8,\
    $7A,$F0,$7A,$03,$06,$0C,$18,$30,\
    $60,$12,$24,$48,$03,$04,$08,$0C,\
    $18,$90,$10,$F8,$7A,$20,$7B,$FF,\
    $FF,$DA,$7A,$55,$7B,$81,$7B,$FF,\
    $FF,$E2,$7A,$4E,$7C,$84,$7C,$FF,\
    $FF,$EA,$7A,$0B,$7D,$23,$7D,$FF,\
    $FF,$F2,$7A,$9D,$B2,$00,$80,$A1,\
    $3A,$01,$01,$01,$01,$01,$38,$01,\
    $36,$01,$01,$01,$01,$01,$34,$01,\
    $32,$01,$01,$01,$A2,$32,$A1,$30,\
    $01,$9D,$82,$00,$80,$A3,$01,$A2,\
    $32,$30,$00,$9B,$08,$01,$32,$01,\
    $32,$01,$32,$01,$32,$9C,$9B,$03,\
    $01,$40,$01,$40,$01,$40,$01,$40,\
    $01,$A1,$3C,$3A,$A2,$3C,$01,$A1,\
    $3C,$3A,$A2,$3C,$01,$01,$9C,$40,\
    $40,$36,$36,$3C,$3C,$32,$32,$01,\
    $32,$01,$32,$01,$32,$01,$30,$00,\
    $9D,$B1,$00,$40,$A1,$48,$32,$46,\
    $32,$44,$32,$42,$32,$40,$32,$3E,\
    $32,$3C,$32,$3A,$32,$38,$01,$2A,\
    $01,$A2,$38,$A1,$36,$01,$9D,$91,\
    $00,$40,$A1,$01,$28,$30,$1E,$24,\
    $3C,$36,$28,$00,$A2,$3A,$3A,$A1,\
    $32,$3A,$28,$32,$3A,$28,$A2,$32,\
    $3A,$A1,$32,$28,$A2,$3A,$3A,$A1,\
    $32,$3A,$28,$32,$3A,$28,$32,$40,\
    $3A,$28,$36,$28,$A2,$3C,$3C,$A1,\
    $32,$3C,$2C,$32,$3C,$2C,$A2,$32,\
    $3C,$A1,$32,$3C,$A1,$42,$44,$44,\
    $44,$A2,$4A,$A1,$32,$3C,$44,$32,\
    $3C,$2C,$32,$3C,$2C,$32,$A2,$3A,\
    $3A,$A1,$32,$3A,$28,$32,$3A,$28,\
    $A2,$32,$3A,$A1,$32,$28,$A2,$3A,\
    $3A,$A1,$32,$3A,$28,$32,$3A,$28,\
    $32,$40,$3A,$28,$36,$28,$A2,$3C,\
    $3C,$A1,$32,$3C,$2C,$32,$3C,$2C,\
    $A2,$32,$3C,$A1,$32,$3C,$A1,$42,\
    $44,$44,$44,$A2,$4A,$A1,$32,$3C,\
    $44,$32,$3C,$2C,$32,$3C,$44,$4A,\
    $9B,$03,$A1,$46,$48,$48,$46,$48,\
    $48,$46,$48,$48,$46,$48,$48,$4E,\
    $48,$40,$36,$A1,$3C,$44,$A2,$32,\
    $3C,$A1,$32,$3C,$A2,$44,$A1,$32,\
    $3C,$44,$4A,$44,$3C,$9C,$A1,$46,\
    $48,$48,$48,$3E,$40,$40,$40,$42,\
    $44,$44,$44,$3A,$3C,$3C,$3C,$A2,\
    $3A,$3A,$A1,$32,$3A,$2C,$32,$A2,\
    $40,$A1,$36,$40,$46,$48,$40,$36,\
    $00,$9D,$74,$7C,$20,$A1,$32,$01,\
    $01,$01,$01,$01,$30,$01,$2E,$01,\
    $01,$01,$01,$01,$2C,$01,$2A,$01,\
    $01,$01,$2A,$2A,$28,$01,$01,$01,\
    $28,$01,$2C,$01,$30,$01,$00,$49,\
    $DD,$DD,$DD,$DD,$DD,$DD,$DD,$94,\
    $00,$00,$00,$00,$00,$00,$00,$A2,\
    $32,$01,$28,$01,$32,$01,$28,$01,\
    $32,$01,$28,$01,$A1,$32,$01,$32,\
    $01,$36,$01,$3A,$01,$A2,$3C,$01,\
    $32,$01,$3C,$01,$32,$01,$3C,$01,\
    $32,$01,$A1,$3C,$01,$3A,$01,$38,\
    $01,$36,$01,$A2,$32,$01,$28,$01,\
    $32,$01,$28,$01,$32,$01,$28,$01,\
    $A1,$32,$01,$32,$01,$36,$01,$3A,\
    $01,$A2,$3C,$01,$32,$01,$3C,$01,\
    $32,$01,$3C,$01,$32,$01,$A1,$3C,\
    $01,$3A,$01,$3C,$01,$3E,$01,$9B,\
    $03,$A2,$40,$01,$36,$01,$40,$01,\
    $A3,$40,$A1,$3C,$01,$32,$01,$32,\
    $01,$3C,$01,$32,$01,$32,$01,$3C,\
    $01,$32,$01,$9C,$A2,$40,$01,$40,\
    $01,$3C,$01,$3C,$01,$32,$01,$2C,\
    $01,$36,$01,$28,$01,$00,$A2,$29,\
    $01,$01,$29,$29,$01,$01,$29,$29,\
    $01,$1A,$29,$A1,$29,$29,$1A,$01,\
    $A2,$2E,$A1,$29,$29,$00,$9B,$03,\
    $A2,$2E,$29,$1A,$29,$2E,$29,$1A,\
    $29,$9C,$2E,$29,$1A,$29,$2E,$29,\
    $A1,$2E,$2E,$A2,$1A,$9B,$03,$A2,\
    $2E,$29,$1A,$29,$2E,$29,$1A,$29,\
    $9C,$2E,$29,$1A,$29,$A1,$2E,$2E,\
    $A2,$1A,$A1,$2E,$2E,$29,$29,$9B,\
    $03,$A2,$2E,$1A,$2E,$1A,$2E,$1A,\
    $2E,$1A,$2E,$1A,$1A,$2E,$1A,$1A,\
    $2E,$1A,$9C,$2E,$29,$1A,$29,$2E,\
    $29,$1A,$29,$2E,$29,$1A,$29,$2E,\
    $29,$A1,$2E,$2E,$A2,$1A,$00
Data1D7D7C:                         ; 1D:7D7C
.db $0A,$87,$7D,$97,$7D,$9F,$7D,$A7,\
    $7D,$AF,$7D,$04,$09,$12,$24,$6F,\
    $6F,$1B,$6F,$6F,$6F,$6F,$6F,$6F,\
    $6F,$6F,$6F,$B7,$7D,$D2,$7D,$FF,\
    $FF,$99,$7D,$D0,$7E,$F0,$7E,$FF,\
    $FF,$A1,$7D,$2D,$7F,$4E,$7F,$FF,\
    $FF,$A9,$7D,$7C,$7F,$89,$7F,$FF,\
    $FF,$B1,$7D,$9D,$71,$00,$80,$A0,\
    $3A,$42,$9D,$81,$00,$80,$A1,$48,\
    $9D,$71,$00,$80,$3A,$42,$48,$9D,\
    $81,$00,$80,$4E,$A6,$4E,$9D,$51,\
    $00,$80,$A1,$74,$9D,$62,$00,$80,\
    $01,$32,$9D,$51,$00,$80,$A1,$74,\
    $9D,$62,$00,$80,$01,$32,$9D,$51,\
    $00,$80,$A1,$74,$9D,$62,$00,$80,\
    $01,$01,$32,$9D,$51,$00,$80,$A1,\
    $74,$9D,$62,$00,$80,$32,$9D,$51,\
    $00,$80,$A1,$74,$9D,$62,$00,$80,\
    $36,$38,$3A,$9D,$51,$00,$80,$A1,\
    $74,$9D,$62,$00,$80,$01,$32,$9D,\
    $51,$00,$80,$A1,$74,$9D,$62,$00,\
    $80,$01,$32,$9D,$51,$00,$80,$A1,\
    $74,$9D,$62,$00,$80,$01,$01,$32,\
    $9D,$51,$00,$80,$A1,$74,$9D,$62,\
    $00,$80,$32,$9D,$51,$00,$80,$A1,\
    $74,$9D,$62,$00,$80,$30,$38,$36,\
    $9D,$51,$00,$80,$A1,$74,$9D,$62,\
    $00,$80,$01,$30,$9D,$51,$00,$80,\
    $A1,$74,$9D,$62,$00,$80,$01,$30,\
    $9D,$51,$00,$80,$A1,$74,$9D,$62,\
    $00,$80,$01,$01,$30,$9D,$51,$00,\
    $80,$A1,$74,$9D,$62,$00,$80,$30,\
    $9D,$51,$00,$80,$A1,$74,$9D,$62,\
    $00,$80,$32,$34,$36,$9D,$51,$00,\
    $80,$A1,$74,$9D,$62,$00,$80,$01,\
    $30,$9D,$51,$00,$80,$A1,$74,$9D,\
    $62,$00,$80,$01,$30,$9D,$51,$00,\
    $80,$A1,$74,$9D,$62,$00,$80,$01,\
    $01,$9D,$51,$00,$80,$A1,$74,$9D,\
    $62,$00,$80,$01,$30,$9D,$51,$00,\
    $80,$A1,$74,$9D,$62,$00,$80,$32,\
    $9D,$51,$00,$80,$A1,$74,$9D,$62,\
    $00,$80,$3A,$00,$9D,$71,$00,$80,\
    $A0,$48,$4E,$9D,$81,$00,$80,$A1,\
    $52,$9D,$71,$00,$80,$48,$4E,$52,\
    $9D,$81,$00,$80,$5A,$A6,$5A,$9D,\
    $62,$00,$80,$00,$A2,$44,$A1,$4A,\
    $A2,$40,$4A,$3E,$4A,$A2,$3A,$A1,\
    $3E,$40,$42,$A2,$44,$A1,$4A,$A2,\
    $40,$4A,$3E,$4A,$A2,$3A,$A1,$38,\
    $3A,$3E,$A2,$40,$A1,$48,$A2,$3E,\
    $48,$3A,$48,$A2,$36,$A1,$3A,$3C,\
    $3E,$A2,$40,$A1,$48,$A2,$3E,$48,\
    $3A,$48,$A2,$36,$A1,$3A,$3E,$42,\
    $00,$9D,$3E,$7F,$21,$A0,$01,$01,\
    $A1,$48,$A6,$01,$A2,$3A,$A1,$01,\
    $3A,$00,$12,$47,$9A,$BB,$BB,$BB,\
    $BB,$BB,$A9,$74,$21,$00,$00,$00,\
    $00,$00,$A6,$2C,$3A,$A3,$44,$A1,\
    $44,$A6,$3A,$A2,$44,$A6,$2C,$3A,\
    $A3,$44,$A1,$44,$A6,$3A,$A2,$44,\
    $A6,$28,$36,$A3,$40,$A1,$40,$A6,\
    $36,$A2,$40,$A6,$28,$36,$40,$A1,\
    $28,$01,$36,$40,$01,$36,$01,$00,\
    $A0,$29,$29,$A1,$1A,$01,$01,$29,\
    $1A,$1A,$A2,$01,$00,$9B,$07,$A1,\
    $2E,$29,$2E,$29,$29,$2E,$29,$29,\
    $9C,$2E,$29,$2E,$29,$2E,$29,$29,\
    $2E,$00,$6A,$04,$AD,$00,$A5,$00,\
    $AC,$00,$81,$01,$93,$00,$E9,$00,\
    $6F,$00,$8B,$00,$BE,$00,$3C,$00,\
    $7B,$01,$9C,$07,$A1,$01,$8E,$00,\
    $80,$00,$91,$00,$C2,$00,$EF,$00,\
    $35,$01,$ED,$01,$03,$03,$98,$01,\
    $EC,$00,$E9,$00,$76,$01,$68,$02,\
    $CE,$02,$BF,$02,$22,$02
