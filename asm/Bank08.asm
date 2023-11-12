.bank $08 slot 1
.orga $4000

Code084000:
    ld   de,$0000                   ; 08:4000
Code084003:
    ld   a,e                        ; 08:4003
    cp   c                          ; 08:4004
    jr   z,Code084021               ; 08:4005
    ld   hl,W_SpriteStatus          ; 08:4007
    add  hl,de                      ; 08:400A
    ld   a,[hl]                     ; 08:400B
    and  a                          ; 08:400C
    jr   z,Code084021               ; 08:400D
    ld   hl,W_SpriteID              ; 08:400F
    add  hl,de                      ; 08:4012
    ld   a,[hl]                     ; 08:4013
    cp   $22                        ; 08:4014
    jr   nz,Code084021              ; 08:4016
    ld   hl,$D11D                   ; 08:4018
    add  hl,bc                      ; 08:401B
    ld   a,$01                      ; 08:401C
    ld   [hl],a                     ; 08:401E
    jr   Return084035               ; 08:401F
Code084021:
    inc  e                          ; 08:4021
    ld   a,e                        ; 08:4022
    cp   $0F                        ; 08:4023
    jr   nz,Code084003              ; 08:4025
    ld   a,[W_SublevelID]           ; 08:4027
    ld   [$C185],a                  ; 08:402A
    ld   a,[$C182]                  ; 08:402D
    or   $04                        ; 08:4030
    ld   [$C182],a                  ; 08:4032
Return084035:
    ret                             ; 08:4035

Data084036:                         ; 08:4036
.db $10,$60,$20,$48
Code08403A:
    call Sub0025CB                  ; 08:403A
    jp   c,Return0840BF             ; 08:403D
    ld   hl,$D11D                   ; 08:4040
    add  hl,bc                      ; 08:4043
    ld   a,[hl]                     ; 08:4044
    and  a                          ; 08:4045
    jp   nz,Return0840BF            ; 08:4046
    xor  a                          ; 08:4049
    ldh  [<$FF97],a                 ; 08:404A
    ld   e,a                        ; 08:404C
    ld   d,a                        ; 08:404D
Code08404E:
    ld   hl,W_SpriteStatus          ; 08:404E
    add  hl,de                      ; 08:4051
    ld   a,[hl]                     ; 08:4052
    and  a                          ; 08:4053
    jr   z,Code084077               ; 08:4054
    ld   hl,W_SpriteID              ; 08:4056
    add  hl,de                      ; 08:4059
    ld   a,[hl]                     ; 08:405A
    cp   $22                        ; 08:405B
    jr   nz,Code084077              ; 08:405D
    ld   hl,W_SpriteXHigh           ; 08:405F
    add  hl,de                      ; 08:4062
    push hl                         ; 08:4063
    ld   hl,W_SpriteXLow            ; 08:4064
    add  hl,de                      ; 08:4067
    ldh  a,[<$FFA7]                 ; 08:4068
    sub  [hl]                       ; 08:406A
    pop  hl                         ; 08:406B
    ldh  a,[<$FFA8]                 ; 08:406C
    sbc  [hl]                       ; 08:406E
    bit  7,a                        ; 08:406F
    jr   nz,Code084077              ; 08:4071
    ld   hl,$FF97                   ; 08:4073
    inc  [hl]                       ; 08:4076
Code084077:
    inc  e                          ; 08:4077
    ld   a,e                        ; 08:4078
    cp   $0F                        ; 08:4079
    jr   nz,Code08404E              ; 08:407B
    ldh  a,[<$FF97]                 ; 08:407D
    cp   $02                        ; 08:407F
    jr   z,Return0840BF             ; 08:4081
    call Sub0010E4                  ; 08:4083
    ld   hl,W_SpriteXHigh           ; 08:4086
    add  hl,bc                      ; 08:4089
    push hl                         ; 08:408A
    ld   hl,W_SpriteXLow            ; 08:408B
    add  hl,bc                      ; 08:408E
    ldh  a,[<$FFA7]                 ; 08:408F
    sub  [hl]                       ; 08:4091
    pop  hl                         ; 08:4092
    ldh  a,[<$FFA8]                 ; 08:4093
    sbc  [hl]                       ; 08:4095
    bit  7,a                        ; 08:4096
    jp   nz,Return0840BF            ; 08:4098
    ld   hl,$D096                   ; 08:409B
    add  hl,bc                      ; 08:409E
    ld   a,[hl]                     ; 08:409F
    and  a                          ; 08:40A0
    jp   nz,Code0840BE              ; 08:40A1
    push hl                         ; 08:40A4
    ldh  a,[<$FFBC]                 ; 08:40A5
    srl  a                          ; 08:40A7
    srl  a                          ; 08:40A9
    and  $03                        ; 08:40AB
    ld   e,a                        ; 08:40AD
    ld   d,$00                      ; 08:40AE
    ld   hl,Data084036              ; 08:40B0
    add  hl,de                      ; 08:40B3
    ld   a,[hl]                     ; 08:40B4
    pop  hl                         ; 08:40B5
    ld   [hl],a                     ; 08:40B6
    push bc                         ; 08:40B7
    push hl                         ; 08:40B8
    call Sub0840EC                  ; 08:40B9
    pop  hl                         ; 08:40BC
    pop  bc                         ; 08:40BD
Code0840BE:
    dec  [hl]                       ; 08:40BE
Return0840BF:
    ret                             ; 08:40BF

Data0840C0:                         ; 08:40C0
.db $90,$40,$50,$90,$40,$60,$60,$80,\
    $2C,$4C,$8C,$AC,$80,$50,$A0,$78
Data0840D0:                         ; 08:40D0
.db $70,$20,$30,$70,$20,$40,$40,$60,\
    $10,$30,$70,$90,$60,$30,$80,$58
Data0840E0:                         ; 08:40E0
.db $0E,$05,$06,$0E,$1E,$22,$12,$0E,\
    $20,$24,$1A,$16

Sub0840EC:
    xor  a                          ; 08:40EC
    ldh  [<$FF97],a                 ; 08:40ED
    ld   de,$000E                   ; 08:40EF
Code0840F2:
    ld   hl,W_SpriteID              ; 08:40F2
    add  hl,de                      ; 08:40F5
    ld   a,[hl]                     ; 08:40F6
    cp   $23                        ; 08:40F7
    jr   nz,Code0840FF              ; 08:40F9
    ld   hl,$FF97                   ; 08:40FB
    inc  [hl]                       ; 08:40FE
Code0840FF:
    dec  e                          ; 08:40FF
    bit  7,e                        ; 08:4100
    jr   z,Code0840F2               ; 08:4102
    ld   e,$02                      ; 08:4104
    ld   a,[W_LevelID]              ; 08:4106
    cp   $1F                        ; 08:4109
    jr   z,Code084113               ; 08:410B
    inc  e                          ; 08:410D
    cp   $06                        ; 08:410E
    jr   z,Code084113               ; 08:4110
    inc  e                          ; 08:4112
Code084113:
    ldh  a,[<$FF97]                 ; 08:4113
    cp   e                          ; 08:4115
    ret  nc                         ; 08:4116
    ld   a,$23                      ; 08:4117
    call Sub0026BE                  ; 08:4119
    jp   c,Return0841C5             ; 08:411C
    push de                         ; 08:411F
    ldh  a,[<$FFBC]                 ; 08:4120
    and  $03                        ; 08:4122
    ldh  [<$FF97],a                 ; 08:4124
    ldh  [<$FF98],a                 ; 08:4126
    ld   c,$00                      ; 08:4128
    ldh  a,[<$FFAB]                 ; 08:412A
    cp   $00                        ; 08:412C
    jr   z,Code08413E               ; 08:412E
    ld   c,$04                      ; 08:4130
    bit  7,a                        ; 08:4132
    jr   z,Code084138               ; 08:4134
    cpl                             ; 08:4136
    inc  a                          ; 08:4137
Code084138:
    cp   $19                        ; 08:4138
    jr   c,Code08413E               ; 08:413A
    sla  c                          ; 08:413C
Code08413E:
    ldh  a,[<$FF97]                 ; 08:413E
    add  c                          ; 08:4140
    ldh  [<$FF97],a                 ; 08:4141
    ldh  a,[<$FF98]                 ; 08:4143
    add  c                          ; 08:4145
    ld   e,a                        ; 08:4146
    ld   d,$00                      ; 08:4147
    ld   hl,Data0840E0              ; 08:4149
    add  hl,de                      ; 08:414C
    ld   a,[hl]                     ; 08:414D
    ldh  [<$FFA5],a                 ; 08:414E
    ld   a,$00                      ; 08:4150
    ldh  [<$FFA2],a                 ; 08:4152
    ldh  a,[<$FFAB]                 ; 08:4154
    and  a                          ; 08:4156
    jr   nz,Code084169              ; 08:4157
    ldh  a,[<$FF97]                 ; 08:4159
    and  $02                        ; 08:415B
    jr   z,Code084169               ; 08:415D
    ldh  a,[<$FFA5]                 ; 08:415F
    cpl                             ; 08:4161
    inc  a                          ; 08:4162
    ldh  [<$FFA5],a                 ; 08:4163
    ld   a,$01                      ; 08:4165
    ldh  [<$FFA2],a                 ; 08:4167
Code084169:
    ldh  a,[<$FF97]                 ; 08:4169
    and  $0F                        ; 08:416B
    ld   e,a                        ; 08:416D
    ld   d,$00                      ; 08:416E
    and  $02                        ; 08:4170
    jr   z,Code084183               ; 08:4172
    ld   hl,Data0840C0              ; 08:4174
    add  hl,de                      ; 08:4177
    ldh  a,[<$FFA7]                 ; 08:4178
    add  [hl]                       ; 08:417A
    ldh  [<$FFA3],a                 ; 08:417B
    ldh  a,[<$FFA8]                 ; 08:417D
    adc  $00                        ; 08:417F
    jr   Code084190                 ; 08:4181
Code084183:
    ld   hl,Data0840D0              ; 08:4183
    add  hl,de                      ; 08:4186
    ldh  a,[<$FFA7]                 ; 08:4187
    sub  [hl]                       ; 08:4189
    ldh  [<$FFA3],a                 ; 08:418A
    ldh  a,[<$FFA8]                 ; 08:418C
    sbc  $00                        ; 08:418E
Code084190:
    ldh  [<$FFA4],a                 ; 08:4190
    pop  de                         ; 08:4192
    ld   hl,$D195                   ; 08:4193
    add  hl,de                      ; 08:4196
    ldh  a,[<$FFA2]                 ; 08:4197
    ld   [hl],a                     ; 08:4199
    ld   hl,W_SpriteXLow            ; 08:419A
    add  hl,de                      ; 08:419D
    ldh  a,[<$FFA3]                 ; 08:419E
    ld   [hl],a                     ; 08:41A0
    ld   hl,W_SpriteXHigh           ; 08:41A1
    add  hl,de                      ; 08:41A4
    ldh  a,[<$FFA4]                 ; 08:41A5
    ld   [hl],a                     ; 08:41A7
    ld   hl,W_SpriteXSpeed          ; 08:41A8
    add  hl,de                      ; 08:41AB
    ldh  a,[<$FFA5]                 ; 08:41AC
    ld   [hl],a                     ; 08:41AE
    ld   hl,W_SpriteYLow            ; 08:41AF
    add  hl,de                      ; 08:41B2
    ld   [hl],$00                   ; 08:41B3
    ld   hl,W_SpriteYHigh           ; 08:41B5
    add  hl,de                      ; 08:41B8
    ld   [hl],$01                   ; 08:41B9
    ld   hl,W_SpriteYSpeed          ; 08:41BB
    add  hl,de                      ; 08:41BE
    ld   [hl],$C9                   ; 08:41BF
    ld   a,$4F                      ; 08:41C1
    ldh  [<$FFF2],a                 ; 08:41C3
Return0841C5:
    ret                             ; 08:41C5

Data0841C6:                         ; 08:41C6
.db $4A,$06,$4C,$06,$4E,$06,$4C,$06,\
    $4C,$26,$4A,$26,$4C,$26,$4E,$26
Code0841D6:
    call Sub0025CB                  ; 08:41D6
    jp   c,Code08428D               ; 08:41D9
    call Sub002920                  ; 08:41DC
    jp   c,Code08428D               ; 08:41DF
    ld   hl,W_SpriteYSpeed          ; 08:41E2
    add  hl,bc                      ; 08:41E5
    ld   a,[hl]                     ; 08:41E6
    bit  7,a                        ; 08:41E7
    jr   nz,Code084201              ; 08:41E9
    ld   hl,W_SpriteYHigh           ; 08:41EB
    add  hl,bc                      ; 08:41EE
    ld   a,[hl]                     ; 08:41EF
    cp   $01                        ; 08:41F0
    jr   nz,Code084201              ; 08:41F2
    ld   a,$00                      ; 08:41F4
    ld   hl,W_SpriteStatus          ; 08:41F6
    add  hl,bc                      ; 08:41F9
    ld   [hl],a                     ; 08:41FA
    ld   hl,W_SpriteID              ; 08:41FB
    add  hl,bc                      ; 08:41FE
    ld   [hl],a                     ; 08:41FF
    ret                             ; 08:4200

Code084201:
    ldh  a,[<H_GlobalTimer]         ; 08:4201
    and  $01                        ; 08:4203
    jr   nz,Code08420F              ; 08:4205
    ld   hl,W_SpriteYSpeed          ; 08:4207
    add  hl,bc                      ; 08:420A
    ld   a,[hl]                     ; 08:420B
    add  $01                        ; 08:420C
    ld   [hl],a                     ; 08:420E
Code08420F:
    call Sub001A3D                  ; 08:420F
    call Sub001A79                  ; 08:4212
    call Sub001D21                  ; 08:4215
    jr   nc,Code084279              ; 08:4218
    ld   e,a                        ; 08:421A
    ld   a,[$C1DA]                  ; 08:421B
    ld   hl,$C1DB                   ; 08:421E
    or   [hl]                       ; 08:4221
    jr   nz,Code08426A              ; 08:4222
    ld   a,e                        ; 08:4224
    cp   $02                        ; 08:4225
    jr   z,Code084262               ; 08:4227
    ld   hl,W_SpriteYSpeed          ; 08:4229
    add  hl,bc                      ; 08:422C
    ld   a,[hl]                     ; 08:422D
    bit  7,a                        ; 08:422E
    jr   nz,Code08423B              ; 08:4230
    ld   a,e                        ; 08:4232
    and  a                          ; 08:4233
    jr   z,Code084262               ; 08:4234
    call Sub002189                  ; 08:4236
    jr   nc,Code084262              ; 08:4239
Code08423B:
    ld   a,$00                      ; 08:423B
    ld   hl,W_SpriteXSpeed          ; 08:423D
    add  hl,bc                      ; 08:4240
    ld   [hl],a                     ; 08:4241
    ld   hl,W_SpriteYSpeed          ; 08:4242
    add  hl,bc                      ; 08:4245
    ld   [hl],a                     ; 08:4246
    inc  a                          ; 08:4247
    ld   hl,$D1A4                   ; 08:4248
    add  hl,bc                      ; 08:424B
    ld   [hl],a                     ; 08:424C
    ld   hl,W_SpriteStatus          ; 08:424D
    add  hl,bc                      ; 08:4250
    ld   a,$03                      ; 08:4251
    ld   [hl],a                     ; 08:4253
    call Sub0025F8                  ; 08:4254
    ld   a,$01                      ; 08:4257
    call Sub002E90                  ; 08:4259
    ld   hl,$C42B                   ; 08:425C
    set  6,[hl]                     ; 08:425F
    ret                             ; 08:4261

Code084262:
    ld   a,$08                      ; 08:4262
    rst  $10                        ; 08:4264
.dl SubL_0B4074                     ; 08:4265
    jr   Code084279                 ; 08:4268
Code08426A:
    ld   hl,W_SpriteStatus          ; 08:426A
    add  hl,bc                      ; 08:426D
    ld   a,$03                      ; 08:426E
    ld   [hl],a                     ; 08:4270
    call Sub001965                  ; 08:4271
    ld   hl,$C42B                   ; 08:4274
    set  6,[hl]                     ; 08:4277
Code084279:
    ld   hl,$D096                   ; 08:4279
    add  hl,bc                      ; 08:427C
    ld   a,[hl]                     ; 08:427D
    dec  [hl]                       ; 08:427E
    and  a                          ; 08:427F
    jr   nz,Code08428D              ; 08:4280
    ld   [hl],$04                   ; 08:4282
    ld   hl,$D177                   ; 08:4284
    add  hl,bc                      ; 08:4287
    ld   a,[hl]                     ; 08:4288
    inc  a                          ; 08:4289
    and  $01                        ; 08:428A
    ld   [hl],a                     ; 08:428C
Code08428D:
    ld   hl,$D177                   ; 08:428D
    add  hl,bc                      ; 08:4290
    ld   a,[hl]                     ; 08:4291
    sla  a                          ; 08:4292
    sla  a                          ; 08:4294
    ld   e,a                        ; 08:4296
    ld   d,$00                      ; 08:4297
    ld   hl,$D195                   ; 08:4299
    add  hl,bc                      ; 08:429C
    ld   a,[hl]                     ; 08:429D
    sla  a                          ; 08:429E
    sla  a                          ; 08:42A0
    sla  a                          ; 08:42A2
    ld   l,a                        ; 08:42A4
    ld   h,$00                      ; 08:42A5
    add  hl,de                      ; 08:42A7
    ld   de,Data0841C6              ; 08:42A8
    add  hl,de                      ; 08:42AB
    call Sub0027BD                  ; 08:42AC
    ret                             ; 08:42AF

Code0842B0:
    call Sub0010E4                  ; 08:42B0
    and  $1F                        ; 08:42B3
    add  $20                        ; 08:42B5
    ld   hl,$D096                   ; 08:42B7
    add  hl,bc                      ; 08:42BA
    ld   [hl],a                     ; 08:42BB
    call Sub0842C8                  ; 08:42BC
    ret  nc                         ; 08:42BF
    ld   a,$01                      ; 08:42C0
    ldh  [<$FFA6],a                 ; 08:42C2
    call Sub0843B7                  ; 08:42C4
    ret                             ; 08:42C7

Sub0842C8:
    ld   a,[$D2F9]                  ; 08:42C8
    bit  7,a                        ; 08:42CB
    jr   z,Code0842DA               ; 08:42CD
    bit  0,a                        ; 08:42CF
    ld   hl,$D2F9                   ; 08:42D1
    ld   [hl],$00                   ; 08:42D4
    jr   nz,Code08432F              ; 08:42D6
    jr   Code08432D                 ; 08:42D8
Code0842DA:
    ld   hl,W_SpriteXHigh           ; 08:42DA
    add  hl,bc                      ; 08:42DD
    ld   a,[hl]                     ; 08:42DE
    and  $0F                        ; 08:42DF
    or   $D0                        ; 08:42E1
    ld   d,a                        ; 08:42E3
    ld   hl,W_SpriteXLow            ; 08:42E4
    add  hl,bc                      ; 08:42E7
    ld   a,[hl]                     ; 08:42E8
    swap a                          ; 08:42E9
    ldh  [<$FF97],a                 ; 08:42EB
    ld   hl,W_SpriteYLow            ; 08:42ED
    add  hl,bc                      ; 08:42F0
    ld   a,[hl]                     ; 08:42F1
    ld   hl,$FF97                   ; 08:42F2
    or   [hl]                       ; 08:42F5
    ld   l,a                        ; 08:42F6
    ld   h,d                        ; 08:42F7
    push hl                         ; 08:42F8
    ld   e,$02                      ; 08:42F9
    ld   hl,W_SpriteXHigh           ; 08:42FB
    add  hl,bc                      ; 08:42FE
    ld   a,[hl]                     ; 08:42FF
    and  $F0                        ; 08:4300
    jr   z,Code084306               ; 08:4302
    ld   e,$03                      ; 08:4304
Code084306:
    ld   a,e                        ; 08:4306
    ldh  [<SVBK],a                  ; 08:4307
    pop  hl                         ; 08:4309
Code08430A:
    ld   a,l                        ; 08:430A
    add  $10                        ; 08:430B
    ld   l,a                        ; 08:430D
    and  $F0                        ; 08:430E
    jr   z,Code08432A               ; 08:4310
    ld   a,[hl]                     ; 08:4312
    cp   $24                        ; 08:4313
    jr   nz,Code08430A              ; 08:4315
    xor  a                          ; 08:4317
    ldh  [<SVBK],a                  ; 08:4318
    ld   hl,$D2F9                   ; 08:431A
    ld   [hl],$80                   ; 08:431D
    ldh  a,[<H_GlobalTimer]         ; 08:431F
    and  $01                        ; 08:4321
    jr   z,Code08432F               ; 08:4323
    ld   hl,$D2F9                   ; 08:4325
    set  0,[hl]                     ; 08:4328
Code08432A:
    xor  a                          ; 08:432A
    ldh  [<SVBK],a                  ; 08:432B
Code08432D:
    scf                             ; 08:432D
    ret                             ; 08:432E

Code08432F:
    scf                             ; 08:432F
    ccf                             ; 08:4330
    ret                             ; 08:4331

Data084332:                         ; 08:4332
.db $0F,$07
Code084334:
    call Sub0025CB                  ; 08:4334
    jp   c,Return0843EB             ; 08:4337
    call Sub002920                  ; 08:433A
    jp   c,Return0843EB             ; 08:433D
    ld   a,[$D2F8]                  ; 08:4340
    and  a                          ; 08:4343
    ld   e,a                        ; 08:4344
    ld   d,$00                      ; 08:4345
    ld   hl,Data084332              ; 08:4347
    add  hl,de                      ; 08:434A
    call Sub0010E4                  ; 08:434B
    and  [hl]                       ; 08:434E
    cp   $03                        ; 08:434F
    ret  nc                         ; 08:4351
    ld   hl,$D096                   ; 08:4352
    add  hl,bc                      ; 08:4355
    ld   a,[hl]                     ; 08:4356
    and  a                          ; 08:4357
    jr   z,Code08435D               ; 08:4358
    dec  a                          ; 08:435A
    ld   [hl],a                     ; 08:435B
    ret                             ; 08:435C

Code08435D:
    call Sub0010E4                  ; 08:435D
    and  $1F                        ; 08:4360
    add  $20                        ; 08:4362
    ld   hl,$D096                   ; 08:4364
    add  hl,bc                      ; 08:4367
    ld   [hl],a                     ; 08:4368
    ldh  a,[<$FFA7]                 ; 08:4369
    add  $08                        ; 08:436B
    ldh  [<$FF97],a                 ; 08:436D
    ldh  a,[<$FFA8]                 ; 08:436F
    adc  $00                        ; 08:4371
    ldh  [<$FF98],a                 ; 08:4373
    ld   hl,W_SpriteXHigh           ; 08:4375
    add  hl,bc                      ; 08:4378
    push hl                         ; 08:4379
    ld   hl,W_SpriteXLow            ; 08:437A
    add  hl,bc                      ; 08:437D
    ld   a,[hl]                     ; 08:437E
    add  $08                        ; 08:437F
    ldh  [<$FF99],a                 ; 08:4381
    pop  hl                         ; 08:4383
    ld   a,[hl]                     ; 08:4384
    adc  $00                        ; 08:4385
    ldh  [<$FF9A],a                 ; 08:4387
    ld   hl,$FF99                   ; 08:4389
    ldh  a,[<$FF97]                 ; 08:438C
    sub  [hl]                       ; 08:438E
    ldh  [<$FF97],a                 ; 08:438F
    ld   hl,$FF9A                   ; 08:4391
    ldh  a,[<$FF98]                 ; 08:4394
    sbc  [hl]                       ; 08:4396
    ldh  [<$FF98],a                 ; 08:4397
    bit  7,a                        ; 08:4399
    jr   z,Code0843AA               ; 08:439B
    ldh  a,[<$FF97]                 ; 08:439D
    xor  $FF                        ; 08:439F
    inc  a                          ; 08:43A1
    ldh  [<$FF97],a                 ; 08:43A2
    ldh  a,[<$FF98]                 ; 08:43A4
    xor  $FF                        ; 08:43A6
    ldh  [<$FF98],a                 ; 08:43A8
Code0843AA:
    and  a                          ; 08:43AA
    jr   nz,Code0843B4              ; 08:43AB
    ldh  a,[<$FF97]                 ; 08:43AD
    cp   $29                        ; 08:43AF
    jr   nc,Code0843B4              ; 08:43B1
    ret                             ; 08:43B3

Code0843B4:
    xor  a                          ; 08:43B4
    ldh  [<$FFA6],a                 ; 08:43B5

Sub0843B7:
    ld   de,$0000                   ; 08:43B7
    ld   hl,W_SpriteXHigh           ; 08:43BA
    add  hl,bc                      ; 08:43BD
    ld   a,[hl]                     ; 08:43BE
    ldh  [<$FF98],a                 ; 08:43BF
    ld   hl,W_SpriteXLow            ; 08:43C1
    add  hl,bc                      ; 08:43C4
    ld   a,[hl]                     ; 08:43C5
    ldh  [<$FF97],a                 ; 08:43C6
    ld   hl,$FFA7                   ; 08:43C8
    sub  [hl]                       ; 08:43CB
    ld   hl,$FFA8                   ; 08:43CC
    ldh  a,[<$FF98]                 ; 08:43CF
    sbc  [hl]                       ; 08:43D1
    bit  7,a                        ; 08:43D2
    jr   z,Code0843D7               ; 08:43D4
    inc  e                          ; 08:43D6
Code0843D7:
    ld   a,e                        ; 08:43D7
    ldh  [<$FF9B],a                 ; 08:43D8
    ld   hl,W_SpriteYLow            ; 08:43DA
    add  hl,bc                      ; 08:43DD
    ld   a,[hl]                     ; 08:43DE
    ldh  [<$FF99],a                 ; 08:43DF
    ld   hl,W_SpriteYHigh           ; 08:43E1
    add  hl,bc                      ; 08:43E4
    ld   a,[hl]                     ; 08:43E5
    ldh  [<$FF9A],a                 ; 08:43E6
    call Sub0843EE                  ; 08:43E8
Return0843EB:
    ret                             ; 08:43EB

Data0843EC:                         ; 08:43EC
.db $F0,$10

Sub0843EE:
    ldh  a,[<$FFA6]                 ; 08:43EE
    and  a                          ; 08:43F0
    jr   nz,Code08441D              ; 08:43F1

Sub0843F3:
    ld   a,$00                      ; 08:43F3
    ld   [$D2E4],a                  ; 08:43F5
    ld   de,$0000                   ; 08:43F8
Code0843FB:
    ld   hl,W_SpriteStatus          ; 08:43FB
    add  hl,de                      ; 08:43FE
    ld   a,[hl]                     ; 08:43FF
    and  a                          ; 08:4400
    jr   z,Code084410               ; 08:4401
    ld   hl,W_SpriteID              ; 08:4403
    add  hl,de                      ; 08:4406
    ld   a,[hl]                     ; 08:4407
    cp   $25                        ; 08:4408
    jr   nz,Code084410              ; 08:440A
    ld   hl,$D2E4                   ; 08:440C
    inc  [hl]                       ; 08:440F
Code084410:
    inc  e                          ; 08:4410
    ld   a,e                        ; 08:4411
    cp   $0F                        ; 08:4412
    jr   nz,Code0843FB              ; 08:4414
    ld   a,[$D2E4]                  ; 08:4416
    cp   $02                        ; 08:4419
    jr   nc,Return084468            ; 08:441B
Code08441D:
    ld   a,$25                      ; 08:441D
    call Sub0026BE                  ; 08:441F
    jr   c,Return084468             ; 08:4422
    ld   hl,W_SpriteXLow            ; 08:4424
    add  hl,de                      ; 08:4427
    ldh  a,[<$FF97]                 ; 08:4428
    ld   [hl],a                     ; 08:442A
    ld   hl,W_SpriteXHigh           ; 08:442B
    add  hl,de                      ; 08:442E
    ldh  a,[<$FF98]                 ; 08:442F
    ld   [hl],a                     ; 08:4431
    ld   hl,W_SpriteYLow            ; 08:4432
    add  hl,de                      ; 08:4435
    ldh  a,[<$FF99]                 ; 08:4436
    ld   [hl],a                     ; 08:4438
    ld   hl,W_SpriteYHigh           ; 08:4439
    add  hl,de                      ; 08:443C
    ldh  a,[<$FF9A]                 ; 08:443D
    ld   [hl],a                     ; 08:443F
    ld   hl,$D1B3                   ; 08:4440
    add  hl,de                      ; 08:4443
    ldh  a,[<$FF97]                 ; 08:4444
    ld   [hl],a                     ; 08:4446
    ld   hl,$D1C2                   ; 08:4447
    add  hl,de                      ; 08:444A
    ldh  a,[<$FF98]                 ; 08:444B
    ld   [hl],a                     ; 08:444D
    ld   hl,$D195                   ; 08:444E
    add  hl,de                      ; 08:4451
    ldh  a,[<$FF9B]                 ; 08:4452
    ld   [hl],a                     ; 08:4454
    push de                         ; 08:4455
    ld   e,a                        ; 08:4456
    ld   d,$00                      ; 08:4457
    ld   hl,Data0843EC              ; 08:4459
    add  hl,de                      ; 08:445C
    pop  de                         ; 08:445D
    ld   a,[hl]                     ; 08:445E
    ld   hl,W_SpriteXSpeed          ; 08:445F
    add  hl,de                      ; 08:4462
    ld   [hl],a                     ; 08:4463
    ld   a,$4B                      ; 08:4464
    ldh  [<$FFF2],a                 ; 08:4466
Return084468:
    ret                             ; 08:4468

Data084469:                         ; 08:4469
.db $58,$29,$56,$29,$56,$09,$58,$09,\
    $58,$A9,$56,$A9,$56,$89,$58,$89
Code084479:
    call Sub0025CB                  ; 08:4479
    jp   c,Code084491               ; 08:447C
    call Sub002920                  ; 08:447F
    jp   c,Code084491               ; 08:4482
    call Sub0029DA                  ; 08:4485
    call Sub001A3D                  ; 08:4488
    call Sub001A79                  ; 08:448B
    call Sub0844FB                  ; 08:448E
Code084491:
    ld   de,$0000                   ; 08:4491
    ld   hl,$D11D                   ; 08:4494
    add  hl,bc                      ; 08:4497
    ld   a,[hl]                     ; 08:4498
    and  a                          ; 08:4499
    jr   nz,Code0844E6              ; 08:449A
    ld   hl,$D1B3                   ; 08:449C
    add  hl,bc                      ; 08:449F
    ld   a,[hl]                     ; 08:44A0
    ldh  [<$FF97],a                 ; 08:44A1
    ld   hl,$D1C2                   ; 08:44A3
    add  hl,bc                      ; 08:44A6
    ld   a,[hl]                     ; 08:44A7
    ldh  [<$FF98],a                 ; 08:44A8
    ld   hl,W_SpriteXHigh           ; 08:44AA
    add  hl,bc                      ; 08:44AD
    push hl                         ; 08:44AE
    ld   hl,W_SpriteXLow            ; 08:44AF
    add  hl,bc                      ; 08:44B2
    ldh  a,[<$FF97]                 ; 08:44B3
    sub  [hl]                       ; 08:44B5
    ldh  [<$FF97],a                 ; 08:44B6
    pop  hl                         ; 08:44B8
    ldh  a,[<$FF98]                 ; 08:44B9
    sbc  [hl]                       ; 08:44BB
    ldh  [<$FF98],a                 ; 08:44BC
    bit  7,a                        ; 08:44BE
    jr   z,Code0844CF               ; 08:44C0
    ldh  a,[<$FF97]                 ; 08:44C2
    xor  $FF                        ; 08:44C4
    inc  a                          ; 08:44C6
    ldh  [<$FF97],a                 ; 08:44C7
    ldh  a,[<$FF98]                 ; 08:44C9
    xor  $FF                        ; 08:44CB
    ldh  [<$FF98],a                 ; 08:44CD
Code0844CF:
    ldh  a,[<$FF98]                 ; 08:44CF
    and  a                          ; 08:44D1
    jr   nz,Code0844E6              ; 08:44D2
    ldh  a,[<$FF97]                 ; 08:44D4
    cp   $10                        ; 08:44D6
    jr   nc,Code0844E6              ; 08:44D8
    ld   hl,W_SpriteSubstate        ; 08:44DA
    add  hl,bc                      ; 08:44DD
    ld   a,[hl]                     ; 08:44DE
    cp   $01                        ; 08:44DF
    jr   z,Code0844E6               ; 08:44E1
    ld   de,$0008                   ; 08:44E3
Code0844E6:
    ld   hl,$D195                   ; 08:44E6
    add  hl,bc                      ; 08:44E9
    ld   a,[hl]                     ; 08:44EA
    sla  a                          ; 08:44EB
    sla  a                          ; 08:44ED
    ld   l,a                        ; 08:44EF
    ld   h,$00                      ; 08:44F0
    add  hl,de                      ; 08:44F2
    ld   de,Data084469              ; 08:44F3
    add  hl,de                      ; 08:44F6
    call Sub0027BD                  ; 08:44F7
    ret                             ; 08:44FA

Sub0844FB:
    ld   hl,W_SpriteSubstate        ; 08:44FB
    add  hl,bc                      ; 08:44FE
    ld   a,[hl]                     ; 08:44FF
    rst  $00                        ; 08:4500
.dw Code084505                      ; 08:4501
.dw Code084569                      ; 08:4503
Code084505:
    call Sub001D21                  ; 08:4505
    jr   nc,Return084568            ; 08:4508
    ld   e,a                        ; 08:450A
    ld   a,[$C1DA]                  ; 08:450B
    ld   hl,$C1DB                   ; 08:450E
    or   [hl]                       ; 08:4511
    jr   nz,Code084538              ; 08:4512
    ld   a,e                        ; 08:4514
    cp   $01                        ; 08:4515
    jr   nz,Code08452A              ; 08:4517
    call Sub002189                  ; 08:4519
    jr   nc,Code08452A              ; 08:451C
    call Sub0025F8                  ; 08:451E
    ld   a,$00                      ; 08:4521
    ld   hl,W_SpriteXSpeed          ; 08:4523
    add  hl,bc                      ; 08:4526
    ld   [hl],a                     ; 08:4527
    jr   Code08454F                 ; 08:4528
Code08452A:
    ldh  a,[<H_GlobalTimer]         ; 08:452A
    srl  a                          ; 08:452C
    jr   nc,Return084568            ; 08:452E
    ld   a,$08                      ; 08:4530
    rst  $10                        ; 08:4532
.dl SubL_0B4074                     ; 08:4533
    jr   Return084568               ; 08:4536
Code084538:
    ld   e,$12                      ; 08:4538
    call Sub002FEF                  ; 08:453A
    jr   c,Code084541               ; 08:453D
    ld   e,$EE                      ; 08:453F
Code084541:
    ld   hl,W_SpriteXSpeed          ; 08:4541
    add  hl,bc                      ; 08:4544
    ld   a,e                        ; 08:4545
    ld   [hl],a                     ; 08:4546
    ld   hl,W_SpriteYSpeed          ; 08:4547
    add  hl,bc                      ; 08:454A
    ld   [hl],$CC                   ; 08:454B
    jr   Code084555                 ; 08:454D
Code08454F:
    xor  a                          ; 08:454F
    ld   hl,W_SpriteYSpeed          ; 08:4550
    add  hl,bc                      ; 08:4553
    ld   [hl],a                     ; 08:4554
Code084555:
    ld   a,$01                      ; 08:4555
    call Sub002E90                  ; 08:4557
    ld   hl,W_SpriteSubstate        ; 08:455A
    add  hl,bc                      ; 08:455D
    inc  [hl]                       ; 08:455E
    ld   a,$45                      ; 08:455F
    ldh  [<$FFF2],a                 ; 08:4561
    ld   hl,$C42B                   ; 08:4563
    set  4,[hl]                     ; 08:4566
Return084568:
    ret                             ; 08:4568

Code084569:
    ld   hl,W_SpriteYSpeed          ; 08:4569
    add  hl,bc                      ; 08:456C
    ld   a,$04                      ; 08:456D
    add  [hl]                       ; 08:456F
    bit  7,a                        ; 08:4570
    jr   nz,Code08457A              ; 08:4572
    cp   $40                        ; 08:4574
    jr   c,Code08457A               ; 08:4576
    ld   a,$40                      ; 08:4578
Code08457A:
    ld   [hl],a                     ; 08:457A
    ret                             ; 08:457B

Data08457C:                         ; 08:457C
.db $00,$00,$00,$00,$00,$00

Sub084582:
    ld   hl,W_SpriteID              ; 08:4582
    add  hl,bc                      ; 08:4585
    ld   a,[hl]                     ; 08:4586
    sub  $26                        ; 08:4587
    ld   hl,$D0FF                   ; 08:4589
    add  hl,bc                      ; 08:458C
    ld   [hl],a                     ; 08:458D
    push af                         ; 08:458E
    cp   $05                        ; 08:458F
    jr   z,Code084597               ; 08:4591
    cp   $03                        ; 08:4593
    jr   nz,Code0845A0              ; 08:4595
Code084597:
    and  $01                        ; 08:4597
    swap a                          ; 08:4599
    ld   hl,$D0F0                   ; 08:459B
    add  hl,bc                      ; 08:459E
    ld   [hl],a                     ; 08:459F
Code0845A0:
    pop  af                         ; 08:45A0
    push af                         ; 08:45A1
    and  $0E                        ; 08:45A2
    srl  a                          ; 08:45A4
    ld   hl,W_SpriteSubstate        ; 08:45A6
    add  hl,bc                      ; 08:45A9
    ld   [hl],a                     ; 08:45AA
    pop  af                         ; 08:45AB
    ld   e,a                        ; 08:45AC
    ld   d,$00                      ; 08:45AD
    ld   hl,Data08457C              ; 08:45AF
    add  hl,de                      ; 08:45B2
    ld   a,[hl]                     ; 08:45B3
    ld   hl,W_SpriteXHigh           ; 08:45B4
    add  hl,bc                      ; 08:45B7
    push hl                         ; 08:45B8
    ld   hl,W_SpriteXLow            ; 08:45B9
    add  hl,bc                      ; 08:45BC
    add  [hl]                       ; 08:45BD
    ld   [hl],a                     ; 08:45BE
    pop  hl                         ; 08:45BF
    ld   a,[hl]                     ; 08:45C0
    adc  $00                        ; 08:45C1
    ld   [hl],a                     ; 08:45C3
    call Sub0845C8                  ; 08:45C4
    ret                             ; 08:45C7

Sub0845C8:
    ld   hl,W_SpriteSubstate        ; 08:45C8
    add  hl,bc                      ; 08:45CB
    ld   a,[hl]                     ; 08:45CC
    rst  $00                        ; 08:45CD
.dw Code0845D4                      ; 08:45CE
.dw Code0845E5                      ; 08:45D0
.dw Return0845EC                    ; 08:45D2
Code0845D4:
    ld   hl,$D11D                   ; 08:45D4
    add  hl,bc                      ; 08:45D7
    ld   [hl],$01                   ; 08:45D8
    ld   hl,W_SpriteYLow            ; 08:45DA
    add  hl,bc                      ; 08:45DD
    ld   a,[hl]                     ; 08:45DE
    ld   hl,$D1D1                   ; 08:45DF
    add  hl,bc                      ; 08:45E2
    ld   [hl],a                     ; 08:45E3
    ret                             ; 08:45E4

Code0845E5:
    ld   hl,W_SpriteXSpeed          ; 08:45E5
    add  hl,bc                      ; 08:45E8
    ld   [hl],$F8                   ; 08:45E9
    ret                             ; 08:45EB

Return0845EC:
    ret                             ; 08:45EC

Data0845ED:                         ; 08:45ED
.db $3A,$26,$5C,$2E,$40,$26,$60,$2E,\
    $5C,$0E,$3A,$06,$60,$0E,$40,$06,\
    $3A,$27,$5C,$2F,$40,$27,$60,$2F,\
    $5C,$0F,$3A,$07,$60,$0F,$40,$07
Data08460D:                         ; 08:460D
.db $3C,$26,$5A,$2E,$42,$26,$5E,$2E,\
    $5A,$0E,$3C,$06,$5E,$0E,$42,$06,\
    $3C,$27,$5A,$2F,$42,$27,$5E,$2F,\
    $5A,$0F,$3C,$07,$5E,$0F,$42,$07
Code08462D:
    call Sub0025CB                  ; 08:462D
    jp   c,Code084659               ; 08:4630
    call Sub002920                  ; 08:4633
    jp   c,Code084659               ; 08:4636
    call Sub0029FC                  ; 08:4639
    call Sub001A3D                  ; 08:463C
    call Sub001A79                  ; 08:463F
    call Sub0846B1                  ; 08:4642
    ld   hl,$D096                   ; 08:4645
    add  hl,bc                      ; 08:4648
    ld   a,[hl]                     ; 08:4649
    dec  [hl]                       ; 08:464A
    and  a                          ; 08:464B
    jr   nz,Code084659              ; 08:464C
    ld   [hl],$08                   ; 08:464E
    ld   hl,$D177                   ; 08:4650
    add  hl,bc                      ; 08:4653
    ld   a,[hl]                     ; 08:4654
    inc  a                          ; 08:4655
    and  $01                        ; 08:4656
    ld   [hl],a                     ; 08:4658
Code084659:
    ld   hl,$D177                   ; 08:4659
    add  hl,bc                      ; 08:465C
    ld   a,[hl]                     ; 08:465D
    sla  a                          ; 08:465E
    sla  a                          ; 08:4660
    ldh  [<$FF97],a                 ; 08:4662
    ld   hl,$D0F0                   ; 08:4664
    add  hl,bc                      ; 08:4667
    ld   e,[hl]                     ; 08:4668
    ld   d,$00                      ; 08:4669
    ld   hl,$D195                   ; 08:466B
    add  hl,bc                      ; 08:466E
    ld   a,[hl]                     ; 08:466F
    sla  a                          ; 08:4670
    sla  a                          ; 08:4672
    sla  a                          ; 08:4674
    ld   l,a                        ; 08:4676
    ld   h,$00                      ; 08:4677
    add  hl,de                      ; 08:4679
    ldh  a,[<$FF97]                 ; 08:467A
    ld   e,a                        ; 08:467C
    add  hl,de                      ; 08:467D
    push hl                         ; 08:467E
    ld   de,Data0845ED              ; 08:467F
    add  hl,de                      ; 08:4682
    call Sub0027BD                  ; 08:4683
    ld   hl,W_SpriteXLow            ; 08:4686
    add  hl,bc                      ; 08:4689
    ld   a,[hl]                     ; 08:468A
    ldh  [<$FF98],a                 ; 08:468B
    ld   hl,W_SpriteXHigh           ; 08:468D
    add  hl,bc                      ; 08:4690
    ld   a,[hl]                     ; 08:4691
    ldh  [<$FF99],a                 ; 08:4692
    ld   hl,W_SpriteYHigh           ; 08:4694
    add  hl,bc                      ; 08:4697
    push hl                         ; 08:4698
    ld   hl,W_SpriteYLow            ; 08:4699
    add  hl,bc                      ; 08:469C
    ld   a,[hl]                     ; 08:469D
    sub  $10                        ; 08:469E
    ldh  [<$FF97],a                 ; 08:46A0
    pop  hl                         ; 08:46A2
    ld   a,[hl]                     ; 08:46A3
    sbc  $00                        ; 08:46A4
    ldh  [<$FF9B],a                 ; 08:46A6
    pop  hl                         ; 08:46A8
    ld   de,Data08460D              ; 08:46A9
    add  hl,de                      ; 08:46AC
    call Sub002769                  ; 08:46AD
    ret                             ; 08:46B0

Sub0846B1:
    ld   hl,W_SpriteSubstate        ; 08:46B1
    add  hl,bc                      ; 08:46B4
    ld   a,[hl]                     ; 08:46B5
    rst  $00                        ; 08:46B6
.dw Code0846C3                      ; 08:46B7
.dw Code0847C6                      ; 08:46B9
.dw Code084890                      ; 08:46BB

Data0846BD:                         ; 08:46BD
.db $02,$02,$02,$03,$02,$03

Code0846C3:
    ld   hl,$D11D                   ; 08:46C3
    add  hl,bc                      ; 08:46C6
    ld   a,[hl]                     ; 08:46C7
    bit  7,a                        ; 08:46C8
    jr   nz,Code0846F5              ; 08:46CA
    ld   hl,W_SpriteYSpeed          ; 08:46CC
    add  hl,bc                      ; 08:46CF
    add  [hl]                       ; 08:46D0
    bit  7,a                        ; 08:46D1
    jr   nz,Code0846E9              ; 08:46D3
    cp   $10                        ; 08:46D5
    jr   c,Code0846EB               ; 08:46D7
    ld   hl,$D1D1                   ; 08:46D9
    add  hl,bc                      ; 08:46DC
    ld   a,[hl]                     ; 08:46DD
    add  $60                        ; 08:46DE
    ld   hl,W_SpriteYLow            ; 08:46E0
    add  hl,bc                      ; 08:46E3
    cp   [hl]                       ; 08:46E4
    ld   a,$10                      ; 08:46E5
    jr   c,Code084712               ; 08:46E7
Code0846E9:
    jr   Code08471D                 ; 08:46E9
Code0846EB:
    ld   e,a                        ; 08:46EB
    ldh  a,[<H_GlobalTimer]         ; 08:46EC
    and  $07                        ; 08:46EE
    jr   nz,Code084722              ; 08:46F0
    ld   a,e                        ; 08:46F2
    jr   Code08471D                 ; 08:46F3
Code0846F5:
    ld   hl,W_SpriteYSpeed          ; 08:46F5
    add  hl,bc                      ; 08:46F8
    add  [hl]                       ; 08:46F9
    bit  7,a                        ; 08:46FA
    jr   z,Code08471D               ; 08:46FC
    cp   $F1                        ; 08:46FE
    jr   nc,Code0846EB              ; 08:4700
    ld   hl,$D1D1                   ; 08:4702
    add  hl,bc                      ; 08:4705
    ld   a,[hl]                     ; 08:4706
    add  $08                        ; 08:4707
    ld   hl,W_SpriteYLow            ; 08:4709
    add  hl,bc                      ; 08:470C
    cp   [hl]                       ; 08:470D
    ld   a,$F0                      ; 08:470E
    jr   c,Code08471D               ; 08:4710
Code084712:
    push af                         ; 08:4712
    ld   hl,$D11D                   ; 08:4713
    add  hl,bc                      ; 08:4716
    ld   a,[hl]                     ; 08:4717
    xor  $FF                        ; 08:4718
    inc  a                          ; 08:471A
    ld   [hl],a                     ; 08:471B
    pop  af                         ; 08:471C
Code08471D:
    ld   hl,W_SpriteYSpeed          ; 08:471D
    add  hl,bc                      ; 08:4720
    ld   [hl],a                     ; 08:4721
Code084722:
    call Sub001D21                  ; 08:4722
    jr   nc,Return08476C            ; 08:4725
    ld   e,a                        ; 08:4727
    ld   a,[$C1DA]                  ; 08:4728
    ld   hl,$C1DB                   ; 08:472B
    or   [hl]                       ; 08:472E
    jr   nz,Code084762              ; 08:472F
    ldh  a,[<H_PlInitY_SubLvType]   ; 08:4731
    and  $0F                        ; 08:4733
    cp   $02                        ; 08:4735
    jr   z,Code084754               ; 08:4737
    ld   a,e                        ; 08:4739
    cp   $02                        ; 08:473A
    jr   z,Code084754               ; 08:473C
    ld   hl,W_SpriteYSpeed          ; 08:473E
    add  hl,bc                      ; 08:4741
    ld   a,[hl]                     ; 08:4742
    bit  7,a                        ; 08:4743
    jr   nz,Code084750              ; 08:4745
    ld   a,e                        ; 08:4747
    and  a                          ; 08:4748
    jr   z,Code084754               ; 08:4749
    call Sub002189                  ; 08:474B
    jr   nc,Code084754              ; 08:474E
Code084750:
    call Sub08476D                  ; 08:4750
    ret                             ; 08:4753

Code084754:
    ldh  a,[<H_GlobalTimer]         ; 08:4754
    srl  a                          ; 08:4756
    jr   nc,Return08476C            ; 08:4758
    ld   a,$08                      ; 08:475A
    rst  $10                        ; 08:475C
.dl SubL_0B4074                     ; 08:475D
    jr   Return08476C               ; 08:4760
Code084762:
    ld   hl,W_SpriteStatus          ; 08:4762
    add  hl,bc                      ; 08:4765
    ld   a,$03                      ; 08:4766
    ld   [hl],a                     ; 08:4768
    call Sub001965                  ; 08:4769
Return08476C:
    ret                             ; 08:476C

Sub08476D:
    call Sub002FEF                  ; 08:476D
    ld   a,$08                      ; 08:4770
    jr   c,Code084776               ; 08:4772
    ld   a,$F8                      ; 08:4774
Code084776:
    ld   hl,W_SpriteXSpeed          ; 08:4776
    add  hl,bc                      ; 08:4779
    ld   [hl],a                     ; 08:477A
    xor  a                          ; 08:477B
    ld   hl,W_SpriteYSpeed          ; 08:477C
    add  hl,bc                      ; 08:477F
    ld   [hl],a                     ; 08:4780
    ld   hl,$D177                   ; 08:4781
    add  hl,bc                      ; 08:4784
    ld   [hl],a                     ; 08:4785
    ld   hl,$D11D                   ; 08:4786
    add  hl,bc                      ; 08:4789
    ld   [hl],a                     ; 08:478A
    ld   hl,$D168                   ; 08:478B
    add  hl,bc                      ; 08:478E
    ld   [hl],a                     ; 08:478F
    ld   hl,W_SpriteSubstate        ; 08:4790
    add  hl,bc                      ; 08:4793
    ld   [hl],a                     ; 08:4794
    ld   hl,$D0FF                   ; 08:4795
    add  hl,bc                      ; 08:4798
    ld   e,[hl]                     ; 08:4799
    ld   d,$00                      ; 08:479A
    ld   hl,Data0846BD              ; 08:479C
    add  hl,de                      ; 08:479F
    ld   a,[hl]                     ; 08:47A0
    ld   hl,W_SpriteID              ; 08:47A1
    add  hl,bc                      ; 08:47A4
    ld   [hl],a                     ; 08:47A5
    ld   hl,Data0847C0              ; 08:47A6
    add  hl,de                      ; 08:47A9
    ld   a,[hl]                     ; 08:47AA
    ld   hl,$D0E1                   ; 08:47AB
    add  hl,bc                      ; 08:47AE
    ld   [hl],a                     ; 08:47AF
    ld   hl,$D20D                   ; 08:47B0
    add  hl,bc                      ; 08:47B3
    ld   [hl],$08                   ; 08:47B4
    call Sub0025F8                  ; 08:47B6
    call Sub002E64                  ; 08:47B9
    call Sub002707                  ; 08:47BC
    ret                             ; 08:47BF

Data0847C0:                         ; 08:47C0
.db $00,$00,$00,$01,$00,$01
Code0847C6:
    ld   hl,W_SpriteYSpeed          ; 08:47C6
    add  hl,bc                      ; 08:47C9
    ld   a,[hl]                     ; 08:47CA
    add  $02                        ; 08:47CB
    bit  7,a                        ; 08:47CD
    jr   nz,Code0847D7              ; 08:47CF
    cp   $20                        ; 08:47D1
    jr   c,Code0847D7               ; 08:47D3
    ld   a,$20                      ; 08:47D5
Code0847D7:
    ld   [hl],a                     ; 08:47D7
    call Sub001D21                  ; 08:47D8
    jp   nc,Code08481A              ; 08:47DB
    ld   e,a                        ; 08:47DE
    ld   a,[$C1DA]                  ; 08:47DF
    ld   hl,$C1DB                   ; 08:47E2
    or   [hl]                       ; 08:47E5
    jr   nz,Code084810              ; 08:47E6
    ld   a,e                        ; 08:47E8
    cp   $02                        ; 08:47E9
    jr   z,Code0847FA               ; 08:47EB
    ld   a,e                        ; 08:47ED
    and  a                          ; 08:47EE
    jr   z,Code0847FA               ; 08:47EF
    call Sub002189                  ; 08:47F1
    jr   nc,Code0847FA              ; 08:47F4
    call Sub08476D                  ; 08:47F6
    ret                             ; 08:47F9

Code0847FA:
    ldh  a,[<H_GlobalTimer]         ; 08:47FA
    srl  a                          ; 08:47FC
    jr   nc,Code08481A              ; 08:47FE
    push bc                         ; 08:4800
    ld   a,$08                      ; 08:4801
    rst  $10                        ; 08:4803
.dl SubL_0B4074                     ; 08:4804
    pop  bc                         ; 08:4807
    call Sub0026A8                  ; 08:4808
    call Sub003000                  ; 08:480B
    jr   Code08481A                 ; 08:480E
Code084810:
    ld   hl,W_SpriteStatus          ; 08:4810
    add  hl,bc                      ; 08:4813
    ld   a,$03                      ; 08:4814
    ld   [hl],a                     ; 08:4816
    call Sub001965                  ; 08:4817
Code08481A:
    ld   hl,$D23A                   ; 08:481A
    add  hl,bc                      ; 08:481D
    ld   a,[hl]                     ; 08:481E
    and  a                          ; 08:481F
    jr   z,Code084825               ; 08:4820
    dec  [hl]                       ; 08:4822
    jr   Code084850                 ; 08:4823
Code084825:
    call Sub00218B                  ; 08:4825
    jr   nc,Code084850              ; 08:4828
    ld   hl,W_SpriteID              ; 08:482A
    add  hl,de                      ; 08:482D
    ld   a,[hl]                     ; 08:482E
    cp   $2E                        ; 08:482F
    jr   z,Code084850               ; 08:4831
    ld   hl,W_SpriteXSpeed          ; 08:4833
    add  hl,bc                      ; 08:4836
    ld   a,[hl]                     ; 08:4837
    xor  $FF                        ; 08:4838
    inc  a                          ; 08:483A
    ld   [hl],a                     ; 08:483B
    ld   hl,$D23A                   ; 08:483C
    add  hl,bc                      ; 08:483F
    ld   [hl],$10                   ; 08:4840
    ld   de,$0000                   ; 08:4842
    bit  7,a                        ; 08:4845
    jr   nz,Code08484A              ; 08:4847
    inc  e                          ; 08:4849
Code08484A:
    ld   hl,$D195                   ; 08:484A
    add  hl,bc                      ; 08:484D
    ld   a,e                        ; 08:484E
    ld   [hl],a                     ; 08:484F
Code084850:
    ld   e,$00                      ; 08:4850
    ld   hl,W_SpriteXSpeed          ; 08:4852
    add  hl,bc                      ; 08:4855
    ld   a,[hl]                     ; 08:4856
    bit  7,a                        ; 08:4857
    jr   nz,Code08485D              ; 08:4859
    ld   e,$10                      ; 08:485B
Code08485D:
    ld   a,e                        ; 08:485D
    ldh  [<$FFA3],a                 ; 08:485E
    ld   a,$0C                      ; 08:4860
    ldh  [<$FFA4],a                 ; 08:4862
    call Sub001C71                  ; 08:4864
    jr   nc,Code084880              ; 08:4867
    ld   hl,W_SpriteXSpeed          ; 08:4869
    add  hl,bc                      ; 08:486C
    ld   a,[hl]                     ; 08:486D
    xor  $FF                        ; 08:486E
    inc  a                          ; 08:4870
    ld   [hl],a                     ; 08:4871
    ld   de,$0000                   ; 08:4872
    bit  7,a                        ; 08:4875
    jr   nz,Code08487A              ; 08:4877
    inc  e                          ; 08:4879
Code08487A:
    ld   hl,$D195                   ; 08:487A
    add  hl,bc                      ; 08:487D
    ld   a,e                        ; 08:487E
    ld   [hl],a                     ; 08:487F
Code084880:
    call Sub001BCF                  ; 08:4880
    ldh  a,[<$FFA5]                 ; 08:4883
    and  $03                        ; 08:4885
    jr   z,Return08488F             ; 08:4887
    ld   hl,W_SpriteYSpeed          ; 08:4889
    add  hl,bc                      ; 08:488C
    ld   [hl],$CC                   ; 08:488D
Return08488F:
    ret                             ; 08:488F

Code084890:
    call Sub001D21                  ; 08:4890
    jp   nc,Code0848D1              ; 08:4893
    ld   e,a                        ; 08:4896
    ld   a,[$C1DA]                  ; 08:4897
    ld   hl,$C1DB                   ; 08:489A
    or   [hl]                       ; 08:489D
    jr   nz,Code0848C7              ; 08:489E
    ldh  a,[<H_PlInitY_SubLvType]   ; 08:48A0
    and  $0F                        ; 08:48A2
    cp   $02                        ; 08:48A4
    jr   z,Code0848B9               ; 08:48A6
    ld   a,e                        ; 08:48A8
    cp   $02                        ; 08:48A9
    jr   z,Code0848B9               ; 08:48AB
    and  a                          ; 08:48AD
    jr   z,Code0848B9               ; 08:48AE
    call Sub002189                  ; 08:48B0
    jr   nc,Code0848B9              ; 08:48B3
    call Sub08476D                  ; 08:48B5
    ret                             ; 08:48B8

Code0848B9:
    ldh  a,[<H_GlobalTimer]         ; 08:48B9
    srl  a                          ; 08:48BB
    jr   nc,Code0848D1              ; 08:48BD
    ld   a,$08                      ; 08:48BF
    rst  $10                        ; 08:48C1
.dl SubL_0B4074                     ; 08:48C2
    jr   Code0848D1                 ; 08:48C5
Code0848C7:
    ld   hl,W_SpriteStatus          ; 08:48C7
    add  hl,bc                      ; 08:48CA
    ld   a,$03                      ; 08:48CB
    ld   [hl],a                     ; 08:48CD
    call Sub001965                  ; 08:48CE
Code0848D1:
    ld   de,$0001                   ; 08:48D1
    ldh  a,[<H_GlobalTimer]         ; 08:48D4
    and  $03                        ; 08:48D6
    jr   nz,Code0848F3              ; 08:48D8
    ldh  a,[<H_GlobalTimer]         ; 08:48DA
    and  $40                        ; 08:48DC
    jr   nz,Code0848E3              ; 08:48DE
    ld   de,IE                      ; 08:48E0
Code0848E3:
    ld   hl,W_SpriteYHigh           ; 08:48E3
    add  hl,bc                      ; 08:48E6
    push hl                         ; 08:48E7
    ld   a,e                        ; 08:48E8
    ld   hl,W_SpriteYLow            ; 08:48E9
    add  hl,bc                      ; 08:48EC
    add  [hl]                       ; 08:48ED
    ld   [hl],a                     ; 08:48EE
    pop  hl                         ; 08:48EF
    ld   a,[hl]                     ; 08:48F0
    adc  d                          ; 08:48F1
    ld   [hl],a                     ; 08:48F2
Code0848F3:
    ldh  a,[<H_GlobalTimer]         ; 08:48F3
    and  $03                        ; 08:48F5
    jr   nz,Return084949            ; 08:48F7
    ld   hl,$D0D2                   ; 08:48F9
    add  hl,bc                      ; 08:48FC
    ld   a,[hl]                     ; 08:48FD
    and  $01                        ; 08:48FE
    jr   nz,Code08490E              ; 08:4900
    ld   hl,$D11D                   ; 08:4902
    add  hl,bc                      ; 08:4905
    ld   a,[hl]                     ; 08:4906
    cp   $12                        ; 08:4907
    jr   nc,Code084919              ; 08:4909
    inc  [hl]                       ; 08:490B
    jr   Code08492C                 ; 08:490C
Code08490E:
    ld   hl,$D11D                   ; 08:490E
    add  hl,bc                      ; 08:4911
    ld   a,[hl]                     ; 08:4912
    and  a                          ; 08:4913
    jr   z,Code084919               ; 08:4914
    dec  [hl]                       ; 08:4916
    jr   Code08492C                 ; 08:4917
Code084919:
    ld   hl,$D0D2                   ; 08:4919
    add  hl,bc                      ; 08:491C
    inc  [hl]                       ; 08:491D
    ld   a,[hl]                     ; 08:491E
    and  $01                        ; 08:491F
    jr   nz,Code08492C              ; 08:4921
    ld   hl,$D195                   ; 08:4923
    add  hl,bc                      ; 08:4926
    ld   a,[hl]                     ; 08:4927
    inc  a                          ; 08:4928
    and  $01                        ; 08:4929
    ld   [hl],a                     ; 08:492B
Code08492C:
    ld   hl,$D11D                   ; 08:492C
    add  hl,bc                      ; 08:492F
    ld   a,[hl]                     ; 08:4930
    ldh  [<$FF97],a                 ; 08:4931
    ld   hl,$D195                   ; 08:4933
    add  hl,bc                      ; 08:4936
    ld   a,[hl]                     ; 08:4937
    and  a                          ; 08:4938
    jr   nz,Code084942              ; 08:4939
    ldh  a,[<$FF97]                 ; 08:493B
    xor  $FF                        ; 08:493D
    inc  a                          ; 08:493F
    ldh  [<$FF97],a                 ; 08:4940
Code084942:
    ld   hl,W_SpriteXSpeed          ; 08:4942
    add  hl,bc                      ; 08:4945
    ldh  a,[<$FF97]                 ; 08:4946
    ld   [hl],a                     ; 08:4948
Return084949:
    ret                             ; 08:4949

Return08494A:
    ret                             ; 08:494A

Data08494B:                         ; 08:494B
.db $3F,$03
Data08494D:                         ; 08:494D
.db $26,$09,$26,$29,$2A,$09,$2A,$29
Data084955:                         ; 08:4955
.db $28,$09,$28,$29
Code084959:
    call Sub0025CB                  ; 08:4959
    jp   c,Code0849E9               ; 08:495C
    call Sub002920                  ; 08:495F
    jp   c,Code0849E9               ; 08:4962
    call Sub0010E4                  ; 08:4965
    ld   a,[W_HardFlag]             ; 08:4968
    ld   e,a                        ; 08:496B
    ld   d,$00                      ; 08:496C
    ld   hl,Data08494B              ; 08:496E
    add  hl,de                      ; 08:4971
    ldh  a,[<$FFBC]                 ; 08:4972
    and  [hl]                       ; 08:4974
    and  a                          ; 08:4975
    jr   nz,Code0849A8              ; 08:4976
    ld   a,c                        ; 08:4978
    srl  a                          ; 08:4979
    jr   nc,Code08498A              ; 08:497B
    ld   a,[W_SublevelID]           ; 08:497D
    cp   $53                        ; 08:4980
    jr   z,Code08498A               ; 08:4982
    ld   a,[$C1C3]                  ; 08:4984
    ld   e,a                        ; 08:4987
    jr   Code0849A2                 ; 08:4988
Code08498A:
    ld   e,$02                      ; 08:498A
    ld   hl,W_SpriteXHigh           ; 08:498C
    add  hl,bc                      ; 08:498F
    push hl                         ; 08:4990
    ld   hl,W_SpriteXLow            ; 08:4991
    add  hl,bc                      ; 08:4994
    ldh  a,[<$FFA7]                 ; 08:4995
    sub  [hl]                       ; 08:4997
    pop  hl                         ; 08:4998
    ldh  a,[<$FFA8]                 ; 08:4999
    sbc  [hl]                       ; 08:499B
    bit  7,a                        ; 08:499C
    jr   z,Code0849A2               ; 08:499E
    ld   e,$00                      ; 08:49A0
Code0849A2:
    ld   hl,$D195                   ; 08:49A2
    add  hl,bc                      ; 08:49A5
    ld   a,e                        ; 08:49A6
    ld   [hl],a                     ; 08:49A7
Code0849A8:
    call Sub084A2A                  ; 08:49A8
    ld   hl,W_SpriteYLow            ; 08:49AB
    add  hl,bc                      ; 08:49AE
    push hl                         ; 08:49AF
    ld   a,[hl]                     ; 08:49B0
    ld   hl,W_SpriteYSpeed          ; 08:49B1
    add  hl,bc                      ; 08:49B4
    sub  [hl]                       ; 08:49B5
    pop  hl                         ; 08:49B6
    cp   $40                        ; 08:49B7
    jr   c,Code0849BC               ; 08:49B9
    ld   [hl],a                     ; 08:49BB
Code0849BC:
    ld   hl,W_SpriteXSpeed          ; 08:49BC
    add  hl,bc                      ; 08:49BF
    ld   a,[hl]                     ; 08:49C0
    ld   e,a                        ; 08:49C1
    ld   hl,W_SpriteXHigh           ; 08:49C2
    add  hl,bc                      ; 08:49C5
    push hl                         ; 08:49C6
    ld   hl,$D195                   ; 08:49C7
    add  hl,bc                      ; 08:49CA
    ld   a,[hl]                     ; 08:49CB
    and  a                          ; 08:49CC
    jr   z,Code0849DD               ; 08:49CD
    ld   hl,W_SpriteXLow            ; 08:49CF
    add  hl,bc                      ; 08:49D2
    ld   a,[hl]                     ; 08:49D3
    add  e                          ; 08:49D4
    ld   [hl],a                     ; 08:49D5
    pop  hl                         ; 08:49D6
    ld   a,[hl]                     ; 08:49D7
    adc  $00                        ; 08:49D8
    ld   [hl],a                     ; 08:49DA
    jr   Code0849E9                 ; 08:49DB
Code0849DD:
    ld   hl,W_SpriteXLow            ; 08:49DD
    add  hl,bc                      ; 08:49E0
    ld   a,[hl]                     ; 08:49E1
    sub  e                          ; 08:49E2
    ld   [hl],a                     ; 08:49E3
    pop  hl                         ; 08:49E4
    ld   a,[hl]                     ; 08:49E5
    sbc  $00                        ; 08:49E6
    ld   [hl],a                     ; 08:49E8
Code0849E9:
    ld   hl,$D177                   ; 08:49E9
    add  hl,bc                      ; 08:49EC
    ld   a,[hl]                     ; 08:49ED
    push af                         ; 08:49EE
    sla  a                          ; 08:49EF
    sla  a                          ; 08:49F1
    ld   e,a                        ; 08:49F3
    ld   d,$00                      ; 08:49F4
    ld   hl,Data08494D              ; 08:49F6
    add  hl,de                      ; 08:49F9
    call Sub0027BD                  ; 08:49FA
    pop  af                         ; 08:49FD
    and  a                          ; 08:49FE
    jr   nz,Return084A29            ; 08:49FF
    ld   hl,W_SpriteXLow            ; 08:4A01
    add  hl,bc                      ; 08:4A04
    ld   a,[hl]                     ; 08:4A05
    ldh  [<$FF98],a                 ; 08:4A06
    ld   hl,W_SpriteXHigh           ; 08:4A08
    add  hl,bc                      ; 08:4A0B
    ld   a,[hl]                     ; 08:4A0C
    ldh  [<$FF99],a                 ; 08:4A0D
    ld   hl,W_SpriteYHigh           ; 08:4A0F
    add  hl,bc                      ; 08:4A12
    push hl                         ; 08:4A13
    ld   hl,W_SpriteYLow            ; 08:4A14
    add  hl,bc                      ; 08:4A17
    ld   a,[hl]                     ; 08:4A18
    add  $10                        ; 08:4A19
    ldh  [<$FF97],a                 ; 08:4A1B
    pop  hl                         ; 08:4A1D
    ld   a,[hl]                     ; 08:4A1E
    adc  $00                        ; 08:4A1F
    ldh  [<$FF9B],a                 ; 08:4A21
    ld   hl,Data084955              ; 08:4A23
    call Sub002769                  ; 08:4A26
Return084A29:
    ret                             ; 08:4A29

Sub084A2A:
    ld   a,[W_PlayerSize]           ; 08:4A2A
    ld   [$D2E4],a                  ; 08:4A2D
    ld   a,$00                      ; 08:4A30
    ld   [W_PlayerSize],a           ; 08:4A32
    call Sub001D21                  ; 08:4A35
    ld   e,a                        ; 08:4A38
    ld   a,[$D2E4]                  ; 08:4A39
    ld   [W_PlayerSize],a           ; 08:4A3C
    jr   nc,Code084A9A              ; 08:4A3F
    ld   a,[$C1DA]                  ; 08:4A41
    ld   hl,$C1DB                   ; 08:4A44
    or   [hl]                       ; 08:4A47
    jr   nz,Code084A8A              ; 08:4A48
    ldh  a,[<H_PlInitY_SubLvType]   ; 08:4A4A
    and  $0F                        ; 08:4A4C
    cp   $02                        ; 08:4A4E
    jr   z,Code084A7C               ; 08:4A50
    ld   a,e                        ; 08:4A52
    cp   $02                        ; 08:4A53
    jr   z,Code084A7C               ; 08:4A55
    and  a                          ; 08:4A57
    jr   z,Code084A7C               ; 08:4A58
    xor  a                          ; 08:4A5A
    ld   hl,W_SpriteXSpeed          ; 08:4A5B
    add  hl,bc                      ; 08:4A5E
    ld   [hl],a                     ; 08:4A5F
    ld   hl,W_SpriteYSpeed          ; 08:4A60
    add  hl,bc                      ; 08:4A63
    ld   [hl],a                     ; 08:4A64
    inc  a                          ; 08:4A65
    ld   hl,$D1A4                   ; 08:4A66
    add  hl,bc                      ; 08:4A69
    ld   [hl],a                     ; 08:4A6A
    ld   hl,W_SpriteStatus          ; 08:4A6B
    add  hl,bc                      ; 08:4A6E
    ld   a,$03                      ; 08:4A6F
    ld   [hl],a                     ; 08:4A71
    call Sub0025F8                  ; 08:4A72
    ld   a,$05                      ; 08:4A75
    call Sub002E90                  ; 08:4A77
    jr   Code084A94                 ; 08:4A7A
Code084A7C:
    ldh  a,[<H_GlobalTimer]         ; 08:4A7C
    srl  a                          ; 08:4A7E
    jr   nc,Code084A9A              ; 08:4A80
    ld   a,$08                      ; 08:4A82
    rst  $10                        ; 08:4A84
.dl SubL_0B4074                     ; 08:4A85
    jr   Code084A9A                 ; 08:4A88
Code084A8A:
    ld   hl,W_SpriteStatus          ; 08:4A8A
    add  hl,bc                      ; 08:4A8D
    ld   a,$03                      ; 08:4A8E
    ld   [hl],a                     ; 08:4A90
    call Sub001965                  ; 08:4A91
Code084A94:
    ld   hl,$C42A                   ; 08:4A94
    set  0,[hl]                     ; 08:4A97
    ret                             ; 08:4A99

Code084A9A:
    ldh  a,[<H_GlobalTimer]         ; 08:4A9A
    and  $07                        ; 08:4A9C
    ldh  [<$FF97],a                 ; 08:4A9E
    ld   hl,W_SpriteSubstate        ; 08:4AA0
    add  hl,bc                      ; 08:4AA3
    ld   a,[hl]                     ; 08:4AA4
    bit  1,a                        ; 08:4AA5
    jr   nz,Code084AE9              ; 08:4AA7
    bit  0,a                        ; 08:4AA9
    jr   nz,Code084AC8              ; 08:4AAB
    ldh  a,[<$FF97]                 ; 08:4AAD
    and  a                          ; 08:4AAF
    jr   nz,Return084AC7            ; 08:4AB0
    ld   hl,W_SpriteYSpeed          ; 08:4AB2
    add  hl,bc                      ; 08:4AB5
    ld   a,[hl]                     ; 08:4AB6
    inc  a                          ; 08:4AB7
    ld   [hl],a                     ; 08:4AB8
    ld   hl,W_SpriteXSpeed          ; 08:4AB9
    add  hl,bc                      ; 08:4ABC
    ld   [hl],a                     ; 08:4ABD
    cp   $02                        ; 08:4ABE
    jr   c,Return084AC7             ; 08:4AC0
    ld   hl,W_SpriteSubstate        ; 08:4AC2
    add  hl,bc                      ; 08:4AC5
    inc  [hl]                       ; 08:4AC6
Return084AC7:
    ret                             ; 08:4AC7

Code084AC8:
    ldh  a,[<$FF97]                 ; 08:4AC8
    and  a                          ; 08:4ACA
    jr   nz,Return084AE8            ; 08:4ACB
    ld   hl,W_SpriteYSpeed          ; 08:4ACD
    add  hl,bc                      ; 08:4AD0
    ld   a,[hl]                     ; 08:4AD1
    sub  $01                        ; 08:4AD2
    ld   [hl],a                     ; 08:4AD4
    ld   hl,W_SpriteXSpeed          ; 08:4AD5
    add  hl,bc                      ; 08:4AD8
    ld   [hl],a                     ; 08:4AD9
    and  a                          ; 08:4ADA
    jr   nz,Return084AE8            ; 08:4ADB
    ld   hl,W_SpriteSubstate        ; 08:4ADD
    add  hl,bc                      ; 08:4AE0
    inc  [hl]                       ; 08:4AE1
    ld   hl,$D096                   ; 08:4AE2
    add  hl,bc                      ; 08:4AE5
    ld   [hl],$20                   ; 08:4AE6
Return084AE8:
    ret                             ; 08:4AE8

Code084AE9:
    ld   hl,$D096                   ; 08:4AE9
    add  hl,bc                      ; 08:4AEC
    ld   a,[hl]                     ; 08:4AED
    and  a                          ; 08:4AEE
    jr   z,Code084B0A               ; 08:4AEF
    dec  [hl]                       ; 08:4AF1
    cp   $1A                        ; 08:4AF2
    jr   nz,Code084AFE              ; 08:4AF4
    ld   hl,$D177                   ; 08:4AF6
    add  hl,bc                      ; 08:4AF9
    ld   [hl],$01                   ; 08:4AFA
    jr   Code084B1E                 ; 08:4AFC
Code084AFE:
    cp   $04                        ; 08:4AFE
    jr   z,Code084B04               ; 08:4B00
    jr   nc,Code084B1E              ; 08:4B02
Code084B04:
    ld   hl,$D177                   ; 08:4B04
    add  hl,bc                      ; 08:4B07
    ld   [hl],$00                   ; 08:4B08
Code084B0A:
    ld   hl,W_SpriteYLow            ; 08:4B0A
    add  hl,bc                      ; 08:4B0D
    ld   a,[hl]                     ; 08:4B0E
    add  $10                        ; 08:4B0F
    ld   hl,$FFA9                   ; 08:4B11
    cp   [hl]                       ; 08:4B14
    jr   c,Code084B1E               ; 08:4B15
    ld   hl,W_SpriteSubstate        ; 08:4B17
    add  hl,bc                      ; 08:4B1A
    ld   [hl],$00                   ; 08:4B1B
    ret                             ; 08:4B1D

Code084B1E:
    ldh  a,[<$FF97]                 ; 08:4B1E
    srl  a                          ; 08:4B20
    jr   c,Return084B29             ; 08:4B22
    ld   hl,W_SpriteYLow            ; 08:4B24
    add  hl,bc                      ; 08:4B27
    inc  [hl]                       ; 08:4B28
Return084B29:
    ret                             ; 08:4B29

Code084B2A:
    ld   de,$0000                   ; 08:4B2A
    ld   a,e                        ; 08:4B2D
    ldh  [<$FF97],a                 ; 08:4B2E
Code084B30:
    ld   hl,W_SpriteStatus          ; 08:4B30
    add  hl,de                      ; 08:4B33
    ld   a,[hl]                     ; 08:4B34
    and  a                          ; 08:4B35
    jr   z,Code084B46               ; 08:4B36
    ld   hl,W_SpriteID              ; 08:4B38
    add  hl,de                      ; 08:4B3B
    ld   a,[hl]                     ; 08:4B3C
    cp   $2E                        ; 08:4B3D
    jr   nz,Code084B46              ; 08:4B3F
    ldh  a,[<$FF97]                 ; 08:4B41
    inc  a                          ; 08:4B43
    ldh  [<$FF97],a                 ; 08:4B44
Code084B46:
    inc  e                          ; 08:4B46
    ld   a,e                        ; 08:4B47
    cp   $0F                        ; 08:4B48
    jr   nz,Code084B30              ; 08:4B4A
    ldh  a,[<$FF97]                 ; 08:4B4C
    cp   $02                        ; 08:4B4E
    jr   z,Code084B88               ; 08:4B50
    ld   hl,W_SpriteYLow            ; 08:4B52
    add  hl,bc                      ; 08:4B55
    ld   a,$08                      ; 08:4B56
    add  [hl]                       ; 08:4B58
    ld   [hl],a                     ; 08:4B59
    ld   hl,$D1D1                   ; 08:4B5A
    add  hl,bc                      ; 08:4B5D
    ld   [hl],a                     ; 08:4B5E
    ld   a,c                        ; 08:4B5F
    ld   [$D2F2],a                  ; 08:4B60
    ld   a,[W_SublevelID]           ; 08:4B63
    ld   [$C183],a                  ; 08:4B66
    ld   a,[$C182]                  ; 08:4B69
    or   $01                        ; 08:4B6C
    ld   [$C182],a                  ; 08:4B6E
    ld   a,[W_SPFlag]               ; 08:4B71
    and  a                          ; 08:4B74
    jr   z,Code084B84               ; 08:4B75
    ld   a,[W_LevelID]              ; 08:4B77
    cp   $1E                        ; 08:4B7A
    jr   nz,Code084B84              ; 08:4B7C
    ld   hl,$D0A5                   ; 08:4B7E
    add  hl,bc                      ; 08:4B81
    ld   [hl],$70                   ; 08:4B82
Code084B84:
    call Sub084DD6                  ; 08:4B84
    ret                             ; 08:4B87

Code084B88:
    ld   hl,$D14A                   ; 08:4B88
    add  hl,bc                      ; 08:4B8B
    ld   [hl],$01                   ; 08:4B8C
    ld   a,c                        ; 08:4B8E
    ld   [$D2F3],a                  ; 08:4B8F
    ld   a,[W_SublevelID]           ; 08:4B92
    cp   $1D                        ; 08:4B95
    jr   nz,Code084B9E              ; 08:4B97
    ld   a,$00                      ; 08:4B99
    ld   [$C182],a                  ; 08:4B9B
Code084B9E:
    ld   hl,$D2A3                   ; 08:4B9E
    add  hl,bc                      ; 08:4BA1
    ld   [hl],$01                   ; 08:4BA2
    ret                             ; 08:4BA4

Code084BA5:
    ld   hl,$D14A                   ; 08:4BA5
    add  hl,bc                      ; 08:4BA8
    ld   a,[hl]                     ; 08:4BA9
    and  a                          ; 08:4BAA
    jr   z,Code084BCF               ; 08:4BAB
    ld   hl,W_SpriteXHigh           ; 08:4BAD
    add  hl,bc                      ; 08:4BB0
    push hl                         ; 08:4BB1
    ld   hl,W_SpriteXLow            ; 08:4BB2
    add  hl,bc                      ; 08:4BB5
    ldh  a,[<$FFA7]                 ; 08:4BB6
    sub  [hl]                       ; 08:4BB8
    pop  hl                         ; 08:4BB9
    ldh  a,[<$FFA8]                 ; 08:4BBA
    sbc  [hl]                       ; 08:4BBC
    bit  7,a                        ; 08:4BBD
    jr   nz,Return084C02            ; 08:4BBF
    ld   a,[$D2F2]                  ; 08:4BC1
    ld   e,a                        ; 08:4BC4
    ld   d,$00                      ; 08:4BC5
    ld   hl,$D0FF                   ; 08:4BC7
    add  hl,de                      ; 08:4BCA
    ld   [hl],$01                   ; 08:4BCB
    jr   Return084C02               ; 08:4BCD
Code084BCF:
    call Sub0025CB                  ; 08:4BCF
    jp   c,Code084BFF               ; 08:4BD2
    ld   hl,$D0FF                   ; 08:4BD5
    add  hl,bc                      ; 08:4BD8
    ld   a,[hl]                     ; 08:4BD9
    and  a                          ; 08:4BDA
    jr   z,Code084BF6               ; 08:4BDB
    call Sub002920                  ; 08:4BDD
    jp   nc,Code084BF6              ; 08:4BE0
    ld   a,[$D2F3]                  ; 08:4BE3
    ld   e,a                        ; 08:4BE6
    ld   d,$00                      ; 08:4BE7
    ld   a,d                        ; 08:4BE9
    ld   hl,W_SpriteID              ; 08:4BEA
    add  hl,de                      ; 08:4BED
    ld   [hl],a                     ; 08:4BEE
    ld   hl,W_SpriteStatus          ; 08:4BEF
    add  hl,de                      ; 08:4BF2
    ld   [hl],a                     ; 08:4BF3
    jr   Return084C02               ; 08:4BF4
Code084BF6:
    call Sub001A3D                  ; 08:4BF6
    call Sub001A79                  ; 08:4BF9
    call Sub084C03                  ; 08:4BFC
Code084BFF:
    call Sub084C13                  ; 08:4BFF
Return084C02:
    ret                             ; 08:4C02

Sub084C03:
    ld   hl,W_SpriteSubstate        ; 08:4C03
    add  hl,bc                      ; 08:4C06
    ld   a,[hl]                     ; 08:4C07
    rst  $00                        ; 08:4C08
.dw Code084C25                      ; 08:4C09
.dw Code084D49                      ; 08:4C0B
.dw Code084D7F                      ; 08:4C0D
.dw Code084DD2                      ; 08:4C0F
.dw Code084D3D                      ; 08:4C11

Sub084C13:
    ld   hl,W_SpriteSubstate        ; 08:4C13
    add  hl,bc                      ; 08:4C16
    ld   a,[hl]                     ; 08:4C17
    rst  $00                        ; 08:4C18
.dw Code084EB0                      ; 08:4C19
.dw Code084F02                      ; 08:4C1B
.dw Return084F30                    ; 08:4C1D
.dw Code084EB0                      ; 08:4C1F
.dw Code084F02                      ; 08:4C21

Data084C23:                         ; 08:4C23
.db $15,$21

Code084C25:
    call Sub084DD6                  ; 08:4C25
    ld   hl,$D0FF                   ; 08:4C28
    add  hl,bc                      ; 08:4C2B
    ld   a,[hl]                     ; 08:4C2C
    and  a                          ; 08:4C2D
    jr   z,Code084C3A               ; 08:4C2E
    ld   hl,$D11D                   ; 08:4C30
    add  hl,bc                      ; 08:4C33
    ld   [hl],$00                   ; 08:4C34
    ld   a,$15                      ; 08:4C36
    jr   Code084C3D                 ; 08:4C38
Code084C3A:
    call Sub084E04                  ; 08:4C3A
Code084C3D:
    ld   hl,W_SpriteXSpeed          ; 08:4C3D
    add  hl,bc                      ; 08:4C40
    ld   [hl],a                     ; 08:4C41
    push hl                         ; 08:4C42
    ld   hl,$D11D                   ; 08:4C43
    add  hl,bc                      ; 08:4C46
    ld   a,[hl]                     ; 08:4C47
    pop  hl                         ; 08:4C48
    ld   e,$00                      ; 08:4C49
    bit  0,a                        ; 08:4C4B
    jr   nz,Code084C55              ; 08:4C4D
    inc  e                          ; 08:4C4F
    ld   a,[hl]                     ; 08:4C50
    xor  $FF                        ; 08:4C51
    inc  a                          ; 08:4C53
    ld   [hl],a                     ; 08:4C54
Code084C55:
    ld   hl,$D195                   ; 08:4C55
    add  hl,bc                      ; 08:4C58
    ld   a,e                        ; 08:4C59
    ld   [hl],a                     ; 08:4C5A
    ld   hl,$D0FF                   ; 08:4C5B
    add  hl,bc                      ; 08:4C5E
    ld   a,[hl]                     ; 08:4C5F
    and  a                          ; 08:4C60
    jr   z,Code084C6B               ; 08:4C61
    ld   hl,$D177                   ; 08:4C63
    add  hl,bc                      ; 08:4C66
    ld   a,[hl]                     ; 08:4C67
    and  a                          ; 08:4C68
    jr   nz,Code084CC8              ; 08:4C69
Code084C6B:
    ld   hl,$D0A5                   ; 08:4C6B
    add  hl,bc                      ; 08:4C6E
    ld   a,[hl]                     ; 08:4C6F
    dec  [hl]                       ; 08:4C70
    cp   $70                        ; 08:4C71
    jr   z,Code084C83               ; 08:4C73
    and  a                          ; 08:4C75
    jr   nz,Code084CC8              ; 08:4C76
    ld   a,$78                      ; 08:4C78
    ld   [hl],a                     ; 08:4C7A
    ld   hl,$D177                   ; 08:4C7B
    add  hl,bc                      ; 08:4C7E
    ld   [hl],$01                   ; 08:4C7F
    jr   Code084CC8                 ; 08:4C81
Code084C83:
    ld   de,$0000                   ; 08:4C83
    ld   a,e                        ; 08:4C86
    ldh  [<$FF97],a                 ; 08:4C87
Code084C89:
    ld   hl,W_SpriteStatus          ; 08:4C89
    add  hl,de                      ; 08:4C8C
    ld   a,[hl]                     ; 08:4C8D
    and  a                          ; 08:4C8E
    jr   z,Code084CAB               ; 08:4C8F
    ld   hl,W_SpriteID              ; 08:4C91
    add  hl,de                      ; 08:4C94
    ld   a,[hl]                     ; 08:4C95
    cp   $19                        ; 08:4C96
    jr   z,Code084CA6               ; 08:4C98
    cp   $47                        ; 08:4C9A
    jr   z,Code084CA6               ; 08:4C9C
    cp   $2F                        ; 08:4C9E
    jr   z,Code084CA6               ; 08:4CA0
    cp   $30                        ; 08:4CA2
    jr   nz,Code084CAB              ; 08:4CA4
Code084CA6:
    ldh  a,[<$FF97]                 ; 08:4CA6
    inc  a                          ; 08:4CA8
    ldh  [<$FF97],a                 ; 08:4CA9
Code084CAB:
    inc  e                          ; 08:4CAB
    ld   a,e                        ; 08:4CAC
    cp   $0F                        ; 08:4CAD
    jr   nz,Code084C89              ; 08:4CAF
    ldh  a,[<$FF97]                 ; 08:4CB1
    cp   $04                        ; 08:4CB3
    jr   c,Code084CBF               ; 08:4CB5
    ld   hl,$D0A5                   ; 08:4CB7
    add  hl,bc                      ; 08:4CBA
    ld   [hl],$78                   ; 08:4CBB
    jr   Code084CC8                 ; 08:4CBD
Code084CBF:
    ld   hl,$D177                   ; 08:4CBF
    add  hl,bc                      ; 08:4CC2
    ld   [hl],$00                   ; 08:4CC3
    call Sub084F35                  ; 08:4CC5
Code084CC8:
    ld   hl,$D177                   ; 08:4CC8
    add  hl,bc                      ; 08:4CCB
    ld   a,[hl]                     ; 08:4CCC
    ld   e,a                        ; 08:4CCD
    ld   d,$00                      ; 08:4CCE
    ld   hl,Data084C23              ; 08:4CD0
    add  hl,de                      ; 08:4CD3
    ld   a,[hl]                     ; 08:4CD4
    ld   hl,$D285                   ; 08:4CD5
    add  hl,bc                      ; 08:4CD8
    ld   [hl],a                     ; 08:4CD9
    call Sub001D21                  ; 08:4CDA
    jr   nc,Return084D16            ; 08:4CDD
    ld   e,a                        ; 08:4CDF
    ld   a,[$C1DA]                  ; 08:4CE0
    ld   hl,$C1DB                   ; 08:4CE3
    or   [hl]                       ; 08:4CE6
    jr   nz,Code084D07              ; 08:4CE7
    ld   a,e                        ; 08:4CE9
    cp   $01                        ; 08:4CEA
    jr   z,Code084CF7               ; 08:4CEC
    ldh  a,[<$FFAC]                 ; 08:4CEE
    and  a                          ; 08:4CF0
    jr   z,Code084D10               ; 08:4CF1
    bit  7,a                        ; 08:4CF3
    jr   nz,Code084D10              ; 08:4CF5
Code084CF7:
    call Sub002189                  ; 08:4CF7
    jr   nc,Code084D10              ; 08:4CFA
    call Sub084D17                  ; 08:4CFC
    call Sub0025F8                  ; 08:4CFF
    call Sub002E64                  ; 08:4D02
    jr   Return084D16               ; 08:4D05
Code084D07:
    ld   a,$01                      ; 08:4D07
    call Sub002E90                  ; 08:4D09
    call Sub084D1A                  ; 08:4D0C
    ret                             ; 08:4D0F

Code084D10:
    ld   a,$08                      ; 08:4D10
    rst  $10                        ; 08:4D12
.dl SubL_0B4074                     ; 08:4D13
Return084D16:
    ret                             ; 08:4D16

Sub084D17:
    xor  a                          ; 08:4D17
    jr   Code084D1C                 ; 08:4D18

Sub084D1A:
    ld   a,$DC                      ; 08:4D1A
Code084D1C:
    ld   hl,W_SpriteYSpeed          ; 08:4D1C
    add  hl,bc                      ; 08:4D1F
    ld   [hl],a                     ; 08:4D20
    ld   hl,W_SpriteXSpeed          ; 08:4D21
    add  hl,bc                      ; 08:4D24
    ld   [hl],$00                   ; 08:4D25
    ld   hl,$D1A4                   ; 08:4D27
    add  hl,bc                      ; 08:4D2A
    ld   [hl],$01                   ; 08:4D2B
    ld   hl,W_SpriteSubstate        ; 08:4D2D
    add  hl,bc                      ; 08:4D30
    ld   [hl],$01                   ; 08:4D31
    ld   a,$45                      ; 08:4D33
    ldh  [<$FFF2],a                 ; 08:4D35
    ld   hl,$C42B                   ; 08:4D37
    set  7,[hl]                     ; 08:4D3A
    ret                             ; 08:4D3C

Code084D3D:
    ld   hl,W_SpriteSubstate        ; 08:4D3D
    add  hl,bc                      ; 08:4D40
    ld   [hl],$01                   ; 08:4D41
    ld   hl,$D1A4                   ; 08:4D43
    add  hl,bc                      ; 08:4D46
    ld   [hl],$01                   ; 08:4D47
Code084D49:
    ld   hl,W_SpriteYSpeed          ; 08:4D49
    add  hl,bc                      ; 08:4D4C
    ld   a,[hl]                     ; 08:4D4D
    add  $02                        ; 08:4D4E
    bit  7,a                        ; 08:4D50
    jr   nz,Code084D5A              ; 08:4D52
    cp   $30                        ; 08:4D54
    jr   c,Code084D5A               ; 08:4D56
    ld   a,$30                      ; 08:4D58
Code084D5A:
    ld   [hl],a                     ; 08:4D5A
    ld   hl,W_SpriteYHigh           ; 08:4D5B
    add  hl,bc                      ; 08:4D5E
    ld   a,[hl]                     ; 08:4D5F
    cp   $01                        ; 08:4D60
    jr   z,Code084D6D               ; 08:4D62
    ld   hl,W_SpriteYLow            ; 08:4D64
    add  hl,bc                      ; 08:4D67
    ld   a,[hl]                     ; 08:4D68
    cp   $F0                        ; 08:4D69
    jr   c,Return084D7E             ; 08:4D6B
Code084D6D:
    ld   hl,W_SpriteSubstate        ; 08:4D6D
    add  hl,bc                      ; 08:4D70
    inc  [hl]                       ; 08:4D71
    ld   hl,$D0B4                   ; 08:4D72
    add  hl,bc                      ; 08:4D75
    ld   [hl],$84                   ; 08:4D76
    ld   hl,$D0C3                   ; 08:4D78
    add  hl,bc                      ; 08:4D7B
    ld   [hl],$03                   ; 08:4D7C
Return084D7E:
    ret                             ; 08:4D7E

Code084D7F:
    ld   hl,$D0FF                   ; 08:4D7F
    add  hl,bc                      ; 08:4D82
    ld   a,[hl]                     ; 08:4D83
    and  a                          ; 08:4D84
    jr   nz,Return084D7E            ; 08:4D85
    ld   hl,$D0B4                   ; 08:4D87
    add  hl,bc                      ; 08:4D8A
    ld   a,[hl]                     ; 08:4D8B
    dec  [hl]                       ; 08:4D8C
    and  a                          ; 08:4D8D
    jr   nz,Return084DD1            ; 08:4D8E
    ld   hl,$D0C3                   ; 08:4D90
    add  hl,bc                      ; 08:4D93
    ld   a,[hl]                     ; 08:4D94
    dec  [hl]                       ; 08:4D95
    and  a                          ; 08:4D96
    jr   nz,Return084DD1            ; 08:4D97
    ld   a,$00                      ; 08:4D99
    ld   hl,W_SpriteSubstate        ; 08:4D9B
    add  hl,bc                      ; 08:4D9E
    ld   [hl],a                     ; 08:4D9F
    ld   hl,W_SpriteYSpeed          ; 08:4DA0
    add  hl,bc                      ; 08:4DA3
    ld   [hl],a                     ; 08:4DA4
    ld   hl,$D1A4                   ; 08:4DA5
    add  hl,bc                      ; 08:4DA8
    ld   [hl],a                     ; 08:4DA9
    ld   hl,W_SpriteXHigh           ; 08:4DAA
    add  hl,bc                      ; 08:4DAD
    push hl                         ; 08:4DAE
    ld   hl,W_SpriteXLow            ; 08:4DAF
    add  hl,bc                      ; 08:4DB2
    ldh  a,[<$FFB8]                 ; 08:4DB3
    add  $B0                        ; 08:4DB5
    ld   [hl],a                     ; 08:4DB7
    pop  hl                         ; 08:4DB8
    ldh  a,[<$FFB9]                 ; 08:4DB9
    adc  $00                        ; 08:4DBB
    ld   [hl],a                     ; 08:4DBD
    ld   hl,$D1D1                   ; 08:4DBE
    add  hl,bc                      ; 08:4DC1
    ld   a,[hl]                     ; 08:4DC2
    ld   hl,W_SpriteYLow            ; 08:4DC3
    add  hl,bc                      ; 08:4DC6
    ld   [hl],a                     ; 08:4DC7
    ld   hl,W_SpriteYHigh           ; 08:4DC8
    add  hl,bc                      ; 08:4DCB
    ld   [hl],$00                   ; 08:4DCC
    call Sub084DD6                  ; 08:4DCE
Return084DD1:
    ret                             ; 08:4DD1

Code084DD2:
    call Sub084DD6                  ; 08:4DD2
    ret                             ; 08:4DD5

Sub084DD6:
    ld   a,[W_SPFlag]               ; 08:4DD6
    and  a                          ; 08:4DD9
    jr   z,Code084DE7               ; 08:4DDA
    ld   a,[W_LevelID]              ; 08:4DDC
    cp   $1E                        ; 08:4DDF
    jr   nz,Code084DE7              ; 08:4DE1
    ld   a,$89                      ; 08:4DE3
    jr   Code084DFB                 ; 08:4DE5
Code084DE7:
    ld   hl,$FFBA                   ; 08:4DE7
    ld   a,$70                      ; 08:4DEA
    sub  [hl]                       ; 08:4DEC
    cp   $21                        ; 08:4DED
    jr   c,Code084DF3               ; 08:4DEF
    ld   a,$21                      ; 08:4DF1
Code084DF3:
    ldh  [<$FF97],a                 ; 08:4DF3
    ld   hl,$FF97                   ; 08:4DF5
    ld   a,$69                      ; 08:4DF8
    sub  [hl]                       ; 08:4DFA
Code084DFB:
    ld   hl,W_SpriteYLow            ; 08:4DFB
    add  hl,bc                      ; 08:4DFE
    ld   [hl],a                     ; 08:4DFF
    ret                             ; 08:4E00

Data084E01:                         ; 08:4E01
.db $15,$30,$40

Sub084E04:
    ld   de,$0000                   ; 08:4E04
    ld   hl,W_SpriteXHigh           ; 08:4E07
    add  hl,bc                      ; 08:4E0A
    push hl                         ; 08:4E0B
    ld   hl,W_SpriteXLow            ; 08:4E0C
    add  hl,bc                      ; 08:4E0F
    ld   a,[hl]                     ; 08:4E10
    ld   hl,$FFA7                   ; 08:4E11
    sub  [hl]                       ; 08:4E14
    ldh  [<$FF97],a                 ; 08:4E15
    pop  hl                         ; 08:4E17
    ld   a,[hl]                     ; 08:4E18
    ld   hl,$FFA8                   ; 08:4E19
    sbc  [hl]                       ; 08:4E1C
    bit  7,a                        ; 08:4E1D
    jr   z,Code084E29               ; 08:4E1F
    ldh  a,[<$FF97]                 ; 08:4E21
    xor  $FF                        ; 08:4E23
    inc  a                          ; 08:4E25
    ldh  [<$FF97],a                 ; 08:4E26
    inc  e                          ; 08:4E28
Code084E29:
    ldh  a,[<$FF97]                 ; 08:4E29
    cp   $3C                        ; 08:4E2B
    jr   c,Code084E4E               ; 08:4E2D
    ld   a,$3C                      ; 08:4E2F
    ldh  [<$FF97],a                 ; 08:4E31
    ld   hl,$D11D                   ; 08:4E33
    add  hl,bc                      ; 08:4E36
    ld   a,[hl]                     ; 08:4E37
    cp   e                          ; 08:4E38
    jr   z,Code084E4E               ; 08:4E39
    and  a                          ; 08:4E3B
    jr   z,Code084E48               ; 08:4E3C
    ld   hl,W_SpriteXSpeed          ; 08:4E3E
    add  hl,bc                      ; 08:4E41
    dec  [hl]                       ; 08:4E42
    ld   a,[hl]                     ; 08:4E43
    cp   $00                        ; 08:4E44
    jr   nz,Return084E9B            ; 08:4E46
Code084E48:
    ld   hl,$D11D                   ; 08:4E48
    add  hl,bc                      ; 08:4E4B
    ld   a,e                        ; 08:4E4C
    ld   [hl],a                     ; 08:4E4D
Code084E4E:
    ldh  a,[<$FF97]                 ; 08:4E4E
    and  $3C                        ; 08:4E50
    srl  a                          ; 08:4E52
    srl  a                          ; 08:4E54
    ldh  [<$FF97],a                 ; 08:4E56
    ld   de,$0000                   ; 08:4E58
    ldh  a,[<$FFAB]                 ; 08:4E5B
    and  a                          ; 08:4E5D
    jr   z,Code084E84               ; 08:4E5E
    bit  7,a                        ; 08:4E60
    jr   nz,Code084E84              ; 08:4E62
    ld   a,[$C1D6]                  ; 08:4E64
    and  a                          ; 08:4E67
    jr   z,Code084E84               ; 08:4E68
    inc  e                          ; 08:4E6A
    ldh  a,[<$FFAB]                 ; 08:4E6B
    cp   $19                        ; 08:4E6D
    jr   c,Code084E79               ; 08:4E6F
    ld   a,[$C1D6]                  ; 08:4E71
    cp   $02                        ; 08:4E74
    jr   c,Code084E79               ; 08:4E76
    inc  e                          ; 08:4E78
Code084E79:
    ld   hl,$D11D                   ; 08:4E79
    add  hl,bc                      ; 08:4E7C
    ld   a,[hl]                     ; 08:4E7D
    and  a                          ; 08:4E7E
    jr   nz,Code084E84              ; 08:4E7F
    ld   de,$0000                   ; 08:4E81
Code084E84:
    ld   hl,Data084E01              ; 08:4E84
    add  hl,de                      ; 08:4E87
    ld   a,[hl]                     ; 08:4E88
    ldh  [<$FF98],a                 ; 08:4E89
    ldh  a,[<$FF97]                 ; 08:4E8B
    ld   e,a                        ; 08:4E8D
Code084E8E:
    ldh  a,[<$FF98]                 ; 08:4E8E
    dec  a                          ; 08:4E90
    ldh  [<$FF98],a                 ; 08:4E91
    dec  e                          ; 08:4E93
    ld   a,e                        ; 08:4E94
    bit  7,a                        ; 08:4E95
    jr   z,Code084E8E               ; 08:4E97
    ldh  a,[<$FF98]                 ; 08:4E99
Return084E9B:
    ret                             ; 08:4E9B

Data084E9C:                         ; 08:4E9C
.db $40,$0F,$42,$0F,$42,$2F,$40,$2F,\
    $46,$0F,$46,$2F,$46,$0F,$46,$2F
Data084EAC:                         ; 08:4EAC
.db $44,$0F,$44,$2F
Code084EB0:
    ld   hl,$D177                   ; 08:4EB0
    add  hl,bc                      ; 08:4EB3
    ld   e,[hl]                     ; 08:4EB4
    sla  e                          ; 08:4EB5
    sla  e                          ; 08:4EB7
    sla  e                          ; 08:4EB9
    ld   d,$00                      ; 08:4EBB
    ld   hl,$D195                   ; 08:4EBD
    add  hl,bc                      ; 08:4EC0
    ld   a,[hl]                     ; 08:4EC1
    sla  a                          ; 08:4EC2
    sla  a                          ; 08:4EC4
    ld   l,a                        ; 08:4EC6
    ld   h,$00                      ; 08:4EC7
    add  hl,de                      ; 08:4EC9
    ld   de,Data084E9C              ; 08:4ECA
    add  hl,de                      ; 08:4ECD
    call Sub0027BD                  ; 08:4ECE
    ld   hl,W_SpriteXLow            ; 08:4ED1
    add  hl,bc                      ; 08:4ED4
    ld   a,[hl]                     ; 08:4ED5
    ldh  [<$FF98],a                 ; 08:4ED6
    ld   hl,W_SpriteXHigh           ; 08:4ED8
    add  hl,bc                      ; 08:4EDB
    ld   a,[hl]                     ; 08:4EDC
    ldh  [<$FF99],a                 ; 08:4EDD
    ld   hl,W_SpriteYHigh           ; 08:4EDF
    add  hl,bc                      ; 08:4EE2
    push hl                         ; 08:4EE3
    ld   hl,W_SpriteYLow            ; 08:4EE4
    add  hl,bc                      ; 08:4EE7
    ld   a,[hl]                     ; 08:4EE8
    add  $10                        ; 08:4EE9
    ldh  [<$FF97],a                 ; 08:4EEB
    pop  hl                         ; 08:4EED
    ld   a,[hl]                     ; 08:4EEE
    adc  $00                        ; 08:4EEF
    ldh  [<$FF9B],a                 ; 08:4EF1
    ld   hl,Data084EAC              ; 08:4EF3
    call Sub002769                  ; 08:4EF6
    ret                             ; 08:4EF9

Data084EFA:                         ; 08:4EFA
.db $44,$4F,$44,$6F
Data084EFE:                         ; 08:4EFE
.db $40,$4F,$42,$4F
Code084F02:
    ld   hl,Data084EFA              ; 08:4F02
    call Sub0027BD                  ; 08:4F05
    ld   hl,W_SpriteXLow            ; 08:4F08
    add  hl,bc                      ; 08:4F0B
    ld   a,[hl]                     ; 08:4F0C
    ldh  [<$FF98],a                 ; 08:4F0D
    ld   hl,W_SpriteXHigh           ; 08:4F0F
    add  hl,bc                      ; 08:4F12
    ld   a,[hl]                     ; 08:4F13
    ldh  [<$FF99],a                 ; 08:4F14
    ld   hl,W_SpriteYHigh           ; 08:4F16
    add  hl,bc                      ; 08:4F19
    push hl                         ; 08:4F1A
    ld   hl,W_SpriteYLow            ; 08:4F1B
    add  hl,bc                      ; 08:4F1E
    ld   a,[hl]                     ; 08:4F1F
    add  $10                        ; 08:4F20
    ldh  [<$FF97],a                 ; 08:4F22
    pop  hl                         ; 08:4F24
    ld   a,[hl]                     ; 08:4F25
    adc  $00                        ; 08:4F26
    ldh  [<$FF9B],a                 ; 08:4F28
    ld   hl,Data084EFE              ; 08:4F2A
    call Sub002769                  ; 08:4F2D
Return084F30:
    ret                             ; 08:4F30

Data084F31:                         ; 08:4F31
.db $E0,$DC,$D8,$D4

Sub084F35:
    ld   hl,W_SpriteXLow            ; 08:4F35
    add  hl,bc                      ; 08:4F38
    ld   a,[hl]                     ; 08:4F39
    ldh  [<$FF97],a                 ; 08:4F3A
    ld   hl,W_SpriteXHigh           ; 08:4F3C
    add  hl,bc                      ; 08:4F3F
    ld   a,[hl]                     ; 08:4F40
    ldh  [<$FF98],a                 ; 08:4F41
    ld   hl,W_SpriteYHigh           ; 08:4F43
    add  hl,bc                      ; 08:4F46
    ld   a,[hl]                     ; 08:4F47
    ldh  [<$FF9A],a                 ; 08:4F48
    ld   de,$0000                   ; 08:4F4A
    ld   hl,W_SpriteYLow            ; 08:4F4D
    add  hl,bc                      ; 08:4F50
    ld   a,[hl]                     ; 08:4F51
    ldh  [<$FF99],a                 ; 08:4F52
    cp   $50                        ; 08:4F54
    jr   c,Code084F63               ; 08:4F56
    inc  e                          ; 08:4F58
    cp   $58                        ; 08:4F59
    jr   c,Code084F63               ; 08:4F5B
    inc  e                          ; 08:4F5D
    cp   $60                        ; 08:4F5E
    jr   c,Code084F63               ; 08:4F60
    inc  e                          ; 08:4F62
Code084F63:
    ld   hl,Data084F31              ; 08:4F63
    add  hl,de                      ; 08:4F66
    ld   a,[hl]                     ; 08:4F67
    ldh  [<$FF9B],a                 ; 08:4F68
    push bc                         ; 08:4F6A
    ld   a,$2F                      ; 08:4F6B
    call Sub0026BE                  ; 08:4F6D
    jr   c,Code084F9F               ; 08:4F70
    ld   hl,W_SpriteYSpeed          ; 08:4F72
    add  hl,de                      ; 08:4F75
    ldh  a,[<$FF9B]                 ; 08:4F76
    ld   [hl],a                     ; 08:4F78
    ld   hl,W_SpriteXLow            ; 08:4F79
    add  hl,de                      ; 08:4F7C
    ldh  a,[<$FF97]                 ; 08:4F7D
    ld   [hl],a                     ; 08:4F7F
    ld   hl,W_SpriteXHigh           ; 08:4F80
    add  hl,de                      ; 08:4F83
    ldh  a,[<$FF98]                 ; 08:4F84
    ld   [hl],a                     ; 08:4F86
    ld   hl,W_SpriteYLow            ; 08:4F87
    add  hl,de                      ; 08:4F8A
    ldh  a,[<$FF99]                 ; 08:4F8B
    ld   [hl],a                     ; 08:4F8D
    ld   hl,W_SpriteYHigh           ; 08:4F8E
    add  hl,de                      ; 08:4F91
    ldh  a,[<$FF9A]                 ; 08:4F92
    ld   [hl],a                     ; 08:4F94
    ld   hl,$D0A5                   ; 08:4F95
    add  hl,de                      ; 08:4F98
    ld   [hl],$08                   ; 08:4F99
    ld   a,$4F                      ; 08:4F9B
    ldh  [<$FFF2],a                 ; 08:4F9D
Code084F9F:
    pop  bc                         ; 08:4F9F
    ret                             ; 08:4FA0

Data084FA1:                         ; 08:4FA1
.db $50,$0E,$50,$6E,$52,$0E,$52,$6E
Code084FA9:
    call Sub0025CB                  ; 08:4FA9
    jp   c,Code084FE7               ; 08:4FAC
    call Sub002920                  ; 08:4FAF
    jp   c,Code084FE7               ; 08:4FB2
    call Sub0029FC                  ; 08:4FB5
    ld   hl,W_SpriteYSpeed          ; 08:4FB8
    add  hl,bc                      ; 08:4FBB
    ld   a,[hl]                     ; 08:4FBC
    add  $02                        ; 08:4FBD
    bit  7,a                        ; 08:4FBF
    jr   nz,Code084FC9              ; 08:4FC1
    cp   $20                        ; 08:4FC3
    jr   c,Code084FC9               ; 08:4FC5
    ld   a,$20                      ; 08:4FC7
Code084FC9:
    ld   [hl],a                     ; 08:4FC9
    call Sub001A3D                  ; 08:4FCA
    call Sub001A79                  ; 08:4FCD
    call Sub084FFA                  ; 08:4FD0
    ld   hl,$D096                   ; 08:4FD3
    add  hl,bc                      ; 08:4FD6
    ld   a,[hl]                     ; 08:4FD7
    dec  [hl]                       ; 08:4FD8
    and  a                          ; 08:4FD9
    jr   nz,Code084FE7              ; 08:4FDA
    ld   [hl],$04                   ; 08:4FDC
    ld   hl,$D177                   ; 08:4FDE
    add  hl,bc                      ; 08:4FE1
    ld   a,[hl]                     ; 08:4FE2
    inc  a                          ; 08:4FE3
    and  $01                        ; 08:4FE4
    ld   [hl],a                     ; 08:4FE6
Code084FE7:
    ld   hl,$D177                   ; 08:4FE7
    add  hl,bc                      ; 08:4FEA
    ld   e,[hl]                     ; 08:4FEB
    sla  e                          ; 08:4FEC
    sla  e                          ; 08:4FEE
    ld   d,$00                      ; 08:4FF0
    ld   hl,Data084FA1              ; 08:4FF2
    add  hl,de                      ; 08:4FF5
    call Sub0027BD                  ; 08:4FF6
    ret                             ; 08:4FF9

Sub084FFA:
    call Sub001D21                  ; 08:4FFA
    jr   nc,Code085020              ; 08:4FFD
    ld   a,[$C1DA]                  ; 08:4FFF
    ld   hl,$C1DB                   ; 08:5002
    or   [hl]                       ; 08:5005
    jr   nz,Code085016              ; 08:5006
    ldh  a,[<H_GlobalTimer]         ; 08:5008
    srl  a                          ; 08:500A
    jr   nc,Code085020              ; 08:500C
    ld   a,$08                      ; 08:500E
    rst  $10                        ; 08:5010
.dl SubL_0B4074                     ; 08:5011
    jr   Code085020                 ; 08:5014
Code085016:
    ld   hl,W_SpriteStatus          ; 08:5016
    add  hl,bc                      ; 08:5019
    ld   a,$03                      ; 08:501A
    ld   [hl],a                     ; 08:501C
    call Sub001965                  ; 08:501D
Code085020:
    ld   hl,$D0A5                   ; 08:5020
    add  hl,bc                      ; 08:5023
    ld   a,[hl]                     ; 08:5024
    dec  [hl]                       ; 08:5025
    and  a                          ; 08:5026
    jr   nz,Code08502B              ; 08:5027
    ld   [hl],$00                   ; 08:5029
Code08502B:
    ld   e,$00                      ; 08:502B
    ld   hl,W_SpriteXSpeed          ; 08:502D
    add  hl,bc                      ; 08:5030
    ld   a,[hl]                     ; 08:5031
    bit  7,a                        ; 08:5032
    jr   nz,Code085038              ; 08:5034
    ld   e,$10                      ; 08:5036
Code085038:
    ld   a,e                        ; 08:5038
    ldh  [<$FFA3],a                 ; 08:5039
    ld   a,$08                      ; 08:503B
    ldh  [<$FFA4],a                 ; 08:503D
    call Sub001C71                  ; 08:503F
    jr   nc,Code08504D              ; 08:5042
    ld   hl,W_SpriteXSpeed          ; 08:5044
    add  hl,bc                      ; 08:5047
    ld   a,[hl]                     ; 08:5048
    xor  $FF                        ; 08:5049
    inc  a                          ; 08:504B
    ld   [hl],a                     ; 08:504C
Code08504D:
    call Sub001BCF                  ; 08:504D
    ldh  a,[<$FFA5]                 ; 08:5050
    and  $03                        ; 08:5052
    jr   z,Return08507C             ; 08:5054
    call Sub002FEF                  ; 08:5056
    ld   a,$F8                      ; 08:5059
    jr   c,Code08505F               ; 08:505B
    ld   a,$08                      ; 08:505D
Code08505F:
    ld   hl,W_SpriteXSpeed          ; 08:505F
    add  hl,bc                      ; 08:5062
    ld   [hl],a                     ; 08:5063
    ld   hl,W_SpriteID              ; 08:5064
    add  hl,bc                      ; 08:5067
    ld   [hl],$30                   ; 08:5068
    ld   hl,$D294                   ; 08:506A
    add  hl,bc                      ; 08:506D
    ld   [hl],$3C                   ; 08:506E
    ld   hl,$D2A3                   ; 08:5070
    add  hl,bc                      ; 08:5073
    ld   [hl],$2C                   ; 08:5074
    ld   hl,$D2B2                   ; 08:5076
    add  hl,bc                      ; 08:5079
    ld   [hl],$11                   ; 08:507A
Return08507C:
    ret                             ; 08:507C

    ret                             ; 08:507D

Data08507E:                         ; 08:507E
.db $4A,$2E,$48,$2E,$4E,$2E,$4C,$2E,\
    $48,$0E,$4A,$0E,$4C,$0E,$4E,$0E,\
    $4A,$6E,$48,$6E,$4A,$6E,$48,$6E,\
    $48,$4E,$4A,$4E,$48,$4E,$4A,$4E
Code08509E:
    call Sub0025CB                  ; 08:509E
    jp   c,Code0850F2               ; 08:50A1
    call Sub002920                  ; 08:50A4
    jp   c,Code0850F2               ; 08:50A7
    call Sub0029DA                  ; 08:50AA
    ld   hl,W_SpriteSubstate        ; 08:50AD
    add  hl,bc                      ; 08:50B0
    ld   a,[hl]                     ; 08:50B1
    cp   $02                        ; 08:50B2
    jr   nz,Code0850C3              ; 08:50B4
    dec  [hl]                       ; 08:50B6
    ld   hl,W_SpriteYSpeed          ; 08:50B7
    add  hl,bc                      ; 08:50BA
    ld   [hl],$CC                   ; 08:50BB
    ld   hl,$D1A4                   ; 08:50BD
    add  hl,bc                      ; 08:50C0
    ld   [hl],$01                   ; 08:50C1
Code0850C3:
    ld   hl,W_SpriteYSpeed          ; 08:50C3
    add  hl,bc                      ; 08:50C6
    ld   a,[hl]                     ; 08:50C7
    add  $04                        ; 08:50C8
    bit  7,a                        ; 08:50CA
    jr   nz,Code0850D4              ; 08:50CC
    cp   $30                        ; 08:50CE
    jr   c,Code0850D4               ; 08:50D0
    ld   a,$30                      ; 08:50D2
Code0850D4:
    ld   [hl],a                     ; 08:50D4
    call Sub001A3D                  ; 08:50D5
    call Sub001A79                  ; 08:50D8
    call Sub085124                  ; 08:50DB
    ld   hl,$D096                   ; 08:50DE
    add  hl,bc                      ; 08:50E1
    ld   a,[hl]                     ; 08:50E2
    dec  [hl]                       ; 08:50E3
    and  a                          ; 08:50E4
    jr   nz,Code0850F2              ; 08:50E5
    ld   [hl],$07                   ; 08:50E7
    ld   hl,$D177                   ; 08:50E9
    add  hl,bc                      ; 08:50EC
    ld   a,[hl]                     ; 08:50ED
    inc  a                          ; 08:50EE
    and  $01                        ; 08:50EF
    ld   [hl],a                     ; 08:50F1
Code0850F2:
    ld   d,$00                      ; 08:50F2
    ld   hl,W_SpriteSubstate        ; 08:50F4
    add  hl,bc                      ; 08:50F7
    ld   a,[hl]                     ; 08:50F8
    cp   $03                        ; 08:50F9
    jr   nz,Code0850FF              ; 08:50FB
    ld   a,$00                      ; 08:50FD
Code0850FF:
    swap a                          ; 08:50FF
    ld   e,a                        ; 08:5101
    ld   hl,W_SpriteXSpeed          ; 08:5102
    add  hl,bc                      ; 08:5105
    ld   a,[hl]                     ; 08:5106
    bit  7,a                        ; 08:5107
    jr   nz,Code08510F              ; 08:5109
    ld   a,e                        ; 08:510B
    add  $08                        ; 08:510C
    ld   e,a                        ; 08:510E
Code08510F:
    ld   hl,$D177                   ; 08:510F
    add  hl,bc                      ; 08:5112
    ld   a,[hl]                     ; 08:5113
    sla  a                          ; 08:5114
    sla  a                          ; 08:5116
    ld   l,a                        ; 08:5118
    ld   h,$00                      ; 08:5119
    add  hl,de                      ; 08:511B
    ld   de,Data08507E              ; 08:511C
    add  hl,de                      ; 08:511F
    call Sub0027BD                  ; 08:5120
    ret                             ; 08:5123

Sub085124:
    ld   hl,W_SpriteSubstate        ; 08:5124
    add  hl,bc                      ; 08:5127
    ld   a,[hl]                     ; 08:5128
    rst  $00                        ; 08:5129
.dw Code085132                      ; 08:512A
.dw Return0851A9                    ; 08:512C
.dw Return0851A9                    ; 08:512E
.dw Code0851AA                      ; 08:5130
Code085132:
    call Sub001D21                  ; 08:5132
    jr   nc,Code085160              ; 08:5135
    ld   a,[$C1DA]                  ; 08:5137
    ld   hl,$C1DB                   ; 08:513A
    or   [hl]                       ; 08:513D
    jr   nz,Code085151              ; 08:513E
    ldh  a,[<H_GlobalTimer]         ; 08:5140
    srl  a                          ; 08:5142
    jr   nc,Code085160              ; 08:5144
    ld   a,$08                      ; 08:5146
    rst  $10                        ; 08:5148
.dl SubL_0B4074                     ; 08:5149
    call Sub003000                  ; 08:514C
    jr   Code085160                 ; 08:514F
Code085151:
    ld   hl,W_SpriteStatus          ; 08:5151
    add  hl,bc                      ; 08:5154
    ld   a,$03                      ; 08:5155
    ld   [hl],a                     ; 08:5157
    call Sub001965                  ; 08:5158
    ld   hl,$C42B                   ; 08:515B
    set  2,[hl]                     ; 08:515E
Code085160:
    call Sub002597                  ; 08:5160
    ld   e,$00                      ; 08:5163
    ld   hl,W_SpriteXSpeed          ; 08:5165
    add  hl,bc                      ; 08:5168
    ld   a,[hl]                     ; 08:5169
    bit  7,a                        ; 08:516A
    jr   nz,Code085170              ; 08:516C
    ld   e,$10                      ; 08:516E
Code085170:
    ld   a,e                        ; 08:5170
    ldh  [<$FFA3],a                 ; 08:5171
    ld   a,$08                      ; 08:5173
    ldh  [<$FFA4],a                 ; 08:5175
    call Sub001C71                  ; 08:5177
    jr   nc,Code085185              ; 08:517A
    ld   hl,W_SpriteXSpeed          ; 08:517C
    add  hl,bc                      ; 08:517F
    ld   a,[hl]                     ; 08:5180
    xor  $FF                        ; 08:5181
    inc  a                          ; 08:5183
    ld   [hl],a                     ; 08:5184
Code085185:
    call Sub001BCF                  ; 08:5185
    ld   hl,$D1EF                   ; 08:5188
    add  hl,bc                      ; 08:518B
    ld   a,[hl]                     ; 08:518C
    cp   $01                        ; 08:518D
    jr   nz,Return0851A9            ; 08:518F
    call Sub002FEF                  ; 08:5191
    ld   a,$F8                      ; 08:5194
    jr   c,Code08519A               ; 08:5196
    ld   a,$08                      ; 08:5198
Code08519A:
    ld   hl,W_SpriteXSpeed          ; 08:519A
    add  hl,bc                      ; 08:519D
    ld   [hl],a                     ; 08:519E
    ldh  a,[<H_GlobalTimer]         ; 08:519F
    and  $03                        ; 08:51A1
    jr   nz,Return0851A9            ; 08:51A3
    ld   a,[hl]                     ; 08:51A5
    cpl                             ; 08:51A6
    inc  a                          ; 08:51A7
    ld   [hl],a                     ; 08:51A8
Return0851A9:
    ret                             ; 08:51A9

Code0851AA:
    ld   hl,W_SpriteSubstate        ; 08:51AA
    add  hl,bc                      ; 08:51AD
    ld   [hl],$00                   ; 08:51AE
    ret                             ; 08:51B0

Data0851B1:                         ; 08:51B1
.db $00,$0C
Data0851B3:                         ; 08:51B3
.db $00,$00,$F4,$FF

SubL_0851B7:
    ld   a,[W_GameMode]             ; 08:51B7
    cp   $02                        ; 08:51BA
    jr   nz,Code0851E5              ; 08:51BC
    ld   de,$0000                   ; 08:51BE
Code0851C1:
    ld   hl,W_SpriteStatus          ; 08:51C1
    add  hl,de                      ; 08:51C4
    ld   a,[hl]                     ; 08:51C5
    and  a                          ; 08:51C6
    jr   z,Code0851DD               ; 08:51C7
    ld   hl,W_SpriteID              ; 08:51C9
    add  hl,de                      ; 08:51CC
    ld   a,[hl]                     ; 08:51CD
    cp   $35                        ; 08:51CE
    jr   nz,Code0851DD              ; 08:51D0
    ld   hl,$D159                   ; 08:51D2
    add  hl,de                      ; 08:51D5
    ld   a,[$C366]                  ; 08:51D6
    cp   [hl]                       ; 08:51D9
    jr   nz,Code0851DD              ; 08:51DA
    rst  $18                        ; 08:51DC

Code0851DD:
    inc  e                          ; 08:51DD
    ld   a,e                        ; 08:51DE
    cp   $0F                        ; 08:51DF
    jr   nz,Code0851C1              ; 08:51E1
    jr   Code08520D                 ; 08:51E3
Code0851E5:
    xor  a                          ; 08:51E5
    ldh  [<$FF97],a                 ; 08:51E6
    ld   de,$0000                   ; 08:51E8
Code0851EB:
    ld   hl,W_SpriteStatus          ; 08:51EB
    add  hl,de                      ; 08:51EE
    ld   a,[hl]                     ; 08:51EF
    and  a                          ; 08:51F0
    jr   z,Code085201               ; 08:51F1
    ld   hl,W_SpriteID              ; 08:51F3
    add  hl,de                      ; 08:51F6
    ld   a,[hl]                     ; 08:51F7
    cp   $35                        ; 08:51F8
    jr   nz,Code085201              ; 08:51FA
    ldh  a,[<$FF97]                 ; 08:51FC
    inc  a                          ; 08:51FE
    ldh  [<$FF97],a                 ; 08:51FF
Code085201:
    inc  e                          ; 08:5201
    ld   a,e                        ; 08:5202
    cp   $0F                        ; 08:5203
    jr   nz,Code0851EB              ; 08:5205
    ldh  a,[<$FF97]                 ; 08:5207
    cp   $03                        ; 08:5209
    jr   nc,ReturnL_085278          ; 08:520B
Code08520D:
    ldh  a,[<$FFA9]                 ; 08:520D
    cp   $38                        ; 08:520F
    jr   c,ReturnL_085278           ; 08:5211
    ld   a,$35                      ; 08:5213
    call Sub0026BE                  ; 08:5215
    jr   c,ReturnL_085278           ; 08:5218
    ld   a,[$C1C3]                  ; 08:521A
    srl  a                          ; 08:521D
    ld   c,a                        ; 08:521F
    ld   b,$00                      ; 08:5220
    ld   hl,Data0851B1              ; 08:5222
    add  hl,bc                      ; 08:5225
    ldh  a,[<$FFA7]                 ; 08:5226
    add  [hl]                       ; 08:5228
    ldh  [<$FF97],a                 ; 08:5229
    ldh  a,[<$FFA8]                 ; 08:522B
    adc  $00                        ; 08:522D
    ld   hl,W_SpriteXHigh           ; 08:522F
    add  hl,de                      ; 08:5232
    ld   [hl],a                     ; 08:5233
    ld   hl,W_SpriteXLow            ; 08:5234
    add  hl,de                      ; 08:5237
    ldh  a,[<$FF97]                 ; 08:5238
    ld   [hl],a                     ; 08:523A
    ld   bc,$0000                   ; 08:523B
    ld   a,[$C1DD]                  ; 08:523E
    and  a                          ; 08:5241
    jr   nz,Code085248              ; 08:5242
    ld   a,[W_PlayerSize]           ; 08:5244
    ld   c,a                        ; 08:5247
Code085248:
    sla  c                          ; 08:5248
    ld   hl,Data0851B3              ; 08:524A
    add  hl,bc                      ; 08:524D
    ldh  a,[<$FFA9]                 ; 08:524E
    add  [hl]                       ; 08:5250
    ldh  [<$FF97],a                 ; 08:5251
    inc  hl                         ; 08:5253
    ldh  a,[<$FFAA]                 ; 08:5254
    adc  [hl]                       ; 08:5256
    ld   hl,W_SpriteYHigh           ; 08:5257
    add  hl,de                      ; 08:525A
    ld   [hl],a                     ; 08:525B
    ld   hl,W_SpriteYLow            ; 08:525C
    add  hl,de                      ; 08:525F
    ldh  a,[<$FF97]                 ; 08:5260
    ld   [hl],a                     ; 08:5262
    ld   hl,W_SpriteYSpeed          ; 08:5263
    add  hl,de                      ; 08:5266
    ld   [hl],$F4                   ; 08:5267
    ld   a,[W_GameMode]             ; 08:5269
    cp   $02                        ; 08:526C
    jr   nz,ReturnL_085278          ; 08:526E
    ld   hl,$D159                   ; 08:5270
    add  hl,de                      ; 08:5273
    ld   a,[$C366]                  ; 08:5274
    ld   [hl],a                     ; 08:5277
ReturnL_085278:
    rst  $18                        ; 08:5278

Data085279:                         ; 08:5279
.db $26,$06
Code08527B:
    call Sub0025CB                  ; 08:527B
    jp   c,Code08528D               ; 08:527E
    call Sub002920                  ; 08:5281
    jp   c,Code08528D               ; 08:5284
    call Sub001A79                  ; 08:5287
    call Sub0852A9                  ; 08:528A
Code08528D:
    ld   hl,$D177                   ; 08:528D
    add  hl,bc                      ; 08:5290
    ld   a,[hl]                     ; 08:5291
    ldh  [<$FF97],a                 ; 08:5292
    ld   hl,W_SpriteYLow            ; 08:5294
    add  hl,bc                      ; 08:5297
    ld   a,[hl]                     ; 08:5298
    push af                         ; 08:5299
    push hl                         ; 08:529A
    ldh  a,[<$FF97]                 ; 08:529B
    add  [hl]                       ; 08:529D
    ld   [hl],a                     ; 08:529E
    ld   hl,Data085279              ; 08:529F
    call Sub002893                  ; 08:52A2
    pop  hl                         ; 08:52A5
    pop  af                         ; 08:52A6
    ld   [hl],a                     ; 08:52A7
    ret                             ; 08:52A8

Sub0852A9:
    ld   hl,$D096                   ; 08:52A9
    add  hl,bc                      ; 08:52AC
    ld   a,[hl]                     ; 08:52AD
    dec  [hl]                       ; 08:52AE
    and  a                          ; 08:52AF
    jr   nz,Code0852BD              ; 08:52B0
    ld   [hl],$02                   ; 08:52B2
    ld   hl,$D177                   ; 08:52B4
    add  hl,bc                      ; 08:52B7
    ld   a,[hl]                     ; 08:52B8
    inc  a                          ; 08:52B9
    and  $01                        ; 08:52BA
    ld   [hl],a                     ; 08:52BC
Code0852BD:
    ld   hl,W_SpriteYLow            ; 08:52BD
    add  hl,bc                      ; 08:52C0
    ld   a,[hl]                     ; 08:52C1
    cp   $38                        ; 08:52C2
    jr   nc,Return0852D1            ; 08:52C4
    xor  a                          ; 08:52C6
    ld   hl,W_SpriteStatus          ; 08:52C7
    add  hl,bc                      ; 08:52CA
    ld   [hl],a                     ; 08:52CB
    ld   hl,W_SpriteID              ; 08:52CC
    add  hl,bc                      ; 08:52CF
    ld   [hl],a                     ; 08:52D0
Return0852D1:
    ret                             ; 08:52D1

Code0852D2:
    ld   a,$00                      ; 08:52D2
    ldh  [<$FF97],a                 ; 08:52D4
    ld   de,$0000                   ; 08:52D6
Code0852D9:
    ld   hl,W_SpriteStatus          ; 08:52D9
    add  hl,de                      ; 08:52DC
    ld   a,[hl]                     ; 08:52DD
    and  a                          ; 08:52DE
    jr   z,Code0852EE               ; 08:52DF
    ld   hl,W_SpriteID              ; 08:52E1
    add  hl,de                      ; 08:52E4
    ld   a,[hl]                     ; 08:52E5
    cp   $36                        ; 08:52E6
    jr   nz,Code0852EE              ; 08:52E8
    ld   hl,$FF97                   ; 08:52EA
    inc  [hl]                       ; 08:52ED
Code0852EE:
    inc  e                          ; 08:52EE
    ld   a,e                        ; 08:52EF
    cp   $0F                        ; 08:52F0
    jr   nz,Code0852D9              ; 08:52F2
    ldh  a,[<$FF97]                 ; 08:52F4
    cp   $02                        ; 08:52F6
    jr   nc,Code08530E              ; 08:52F8
    ld   a,c                        ; 08:52FA
    ld   [$D2F2],a                  ; 08:52FB
    ld   a,[W_SublevelID]           ; 08:52FE
    ld   [$C184],a                  ; 08:5301
    ld   a,[$C182]                  ; 08:5304
    or   $02                        ; 08:5307
    ld   [$C182],a                  ; 08:5309
    jr   Return08532C               ; 08:530C
Code08530E:
    ld   hl,W_SpriteStatus          ; 08:530E
    add  hl,bc                      ; 08:5311
    ld   [hl],$00                   ; 08:5312
    ld   hl,W_SpriteID              ; 08:5314
    add  hl,bc                      ; 08:5317
    ld   [hl],$00                   ; 08:5318
    ld   a,[$D2F2]                  ; 08:531A
    ld   e,a                        ; 08:531D
    ld   d,$00                      ; 08:531E
    ld   hl,W_SpriteStatus          ; 08:5320
    add  hl,de                      ; 08:5323
    ld   [hl],$00                   ; 08:5324
    ld   hl,W_SpriteID              ; 08:5326
    add  hl,de                      ; 08:5329
    ld   [hl],$00                   ; 08:532A
Return08532C:
    ret                             ; 08:532C

Data08532D:                         ; 08:532D
.db $40,$60,$80,$A0,$C0,$40,$C0,$60
Code085335:
    call Sub0025CB                  ; 08:5335
    jp   c,Return085370             ; 08:5338
    ld   hl,$D096                   ; 08:533B
    add  hl,bc                      ; 08:533E
    ld   a,[hl]                     ; 08:533F
    dec  [hl]                       ; 08:5340
    and  a                          ; 08:5341
    jr   nz,Return085370            ; 08:5342
    ld   [hl],$C0                   ; 08:5344
    call Sub0010E4                  ; 08:5346
    and  $07                        ; 08:5349
    ld   e,a                        ; 08:534B
    ld   d,$00                      ; 08:534C
    ldh  a,[<$FFB8]                 ; 08:534E
    add  $B0                        ; 08:5350
    ldh  [<$FF97],a                 ; 08:5352
    ldh  a,[<$FFB9]                 ; 08:5354
    adc  $00                        ; 08:5356
    ldh  [<$FF98],a                 ; 08:5358
    ld   hl,Data08532D              ; 08:535A
    add  hl,de                      ; 08:535D
    ld   a,[hl]                     ; 08:535E
    ldh  [<$FF99],a                 ; 08:535F
    ld   a,$00                      ; 08:5361
    ldh  [<$FF9A],a                 ; 08:5363
    ldh  [<$FF9B],a                 ; 08:5365
    call Sub0843F3                  ; 08:5367
    ld   hl,$D11D                   ; 08:536A
    add  hl,de                      ; 08:536D
    ld   [hl],$01                   ; 08:536E
Return085370:
    ret                             ; 08:5370

Data085371:                         ; 08:5371
.db $06,$02,$00,$04,$03,$35,$08,$09,\
    $0A,$0C,$0E,$10,$11,$12,$14,$15,\
    $16,$18,$1A,$1C,$1D,$1E,$07,$27,\
    $26,$2D,$2A,$13,$17,$1B,$0F,$1F,\
    $37,$0B,$40,$42,$44,$45,$46,$47,\
    $48,$4A,$4B,$4C,$4D,$4E,$50,$51,\
    $53,$54,$56,$57,$58,$5A,$5B,$5C,\
    $5D,$5E,$86,$8B,$8F,$94,$A3,$70,\
    $06,$40,$0D,$C0,$03,$F0,$08,$C0,\
    $05,$B0,$0B,$D0,$01,$70,$03,$E0,\
    $0B,$50,$06,$B0,$00,$D0,$0B,$A0,\
    $05,$60,$0C,$80,$03,$D0,$04,$90,\
    $06,$D0,$08,$60,$0D,$50,$07,$A0,\
    $08,$C0,$0B,$00,$02,$40,$04,$50,\
    $05,$90,$05,$B0,$07,$30,$09,$B0,\
    $09,$D0,$0A,$D0,$0B,$C0,$03,$F0,\
    $08,$40,$02,$90,$02,$00,$0B,$80,\
    $03,$70,$05,$D0,$07,$50,$0C,$D0,\
    $0C,$00,$02,$50,$05,$A0,$05,$D0,\
    $06,$D0,$09,$00,$04,$60,$05,$80,\
    $08,$80,$09,$80,$0A,$70,$06,$40,\
    $0D,$F0,$09,$D0,$0B,$50,$11,$C0,\
    $16,$10,$01,$70,$01,$E0,$01,$E0,\
    $0C,$10,$04,$80,$07,$F0,$0C,$00,\
    $06,$D0,$04,$00,$05,$D0,$03,$D0,\
    $04,$00,$05,$D0,$03,$00,$06,$50,\
    $06,$D0,$09,$D0,$04,$A0,$08,$F0,\
    $05,$50,$06,$C0,$05,$40,$04,$80,\
    $02,$00,$02,$F0,$06,$00,$08,$10,\
    $0B,$B0,$02,$E0,$09,$50,$04,$D0,\
    $0D,$E0,$0B,$B0,$0F,$50,$0A,$50,\
    $01,$00,$03,$60,$05,$F0,$0A,$D0,\
    $01,$60,$04,$E0,$0A,$10,$01,$D0,\
    $04,$20,$09,$C0,$0B,$50,$0C,$00,\
    $0B,$40,$0A,$00,$16,$C0,$05,$A0,\
    $05,$F0,$09,$00,$05,$10,$0B,$40,\
    $0B,$90,$0E,$E0,$0C,$80,$00,$D0,\
    $04,$70,$06,$E0,$08,$D0,$03,$40,\
    $06,$00,$0C,$E0,$02,$50,$0A,$40,\
    $0E,$00,$13,$70,$00,$A0,$01,$E0,\
    $07,$00,$0C,$70,$0B,$E0,$0C,$90,\
    $06,$C0,$0C,$40,$06,$80,$06,$00,\
    $01,$A0,$03,$10,$01,$00,$07,$01,\
    $07,$02,$06,$03,$04,$07,$0F,$07,\
    $07,$09,$07,$07,$0F,$0F,$07,$07,\
    $0F,$07,$07,$0F,$0F,$0F,$0F,$0F,\
    $0F,$0F,$0F,$07,$01,$07,$10,$0F,\
    $07,$0F,$0F,$0F,$0F,$07,$0F,$0F,\
    $0F,$0F,$07,$0F,$0F,$0F,$0F,$07,\
    $00,$07,$0D,$0E,$07,$07,$0F,$0F,\
    $0F,$07,$0F,$0F,$07,$08,$0A,$0B,\
    $0C,$0A,$0B,$0C,$05,$0F,$0F,$0F,\
    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,\
    $0F,$07,$0F,$07,$0F,$07,$0F,$07,\
    $07,$0F,$0F,$0F,$07,$0F,$0F,$07,\
    $0F,$0F,$0F,$07,$07,$07,$0F,$07,\
    $0F,$0F,$0F,$0F,$0F,$0F,$07,$07,\
    $0F,$0F,$0F,$0F,$0F,$0F,$07,$0F,\
    $0F,$0F,$07,$0F,$0F,$0F,$0F,$0F,\
    $07,$0F,$07,$07,$07,$07,$0F,$07
Data085551:                         ; 08:5551
.db $B0,$53,$B4,$53,$B8,$53,$BC,$53,\
    $C2,$53,$C4,$53,$C6,$53,$CA,$53,\
    $CC,$53,$D4,$53,$D6,$53,$DA,$53,\
    $DC,$53,$EE,$53,$F2,$53,$F8,$53,\
    $02,$54,$0C,$54,$16,$54,$1A,$54,\
    $22,$54,$2A,$54,$30,$54,$32,$54,\
    $36,$54,$38,$54,$3C,$54,$3E,$54,\
    $40,$54,$42,$54,$44,$54,$4C,$54,\
    $4E,$54,$52,$54,$56,$54,$5A,$54,\
    $5E,$54,$62,$54,$66,$54,$68,$54,\
    $6A,$54,$70,$54,$76,$54,$7C,$54,\
    $7E,$54,$80,$54,$82,$54,$86,$54,\
    $88,$54,$8C,$54,$94,$54,$96,$54,\
    $9E,$54,$A4,$54,$AC,$54,$B4,$54,\
    $B8,$54,$BA,$54,$BC,$54,$BE,$54,\
    $C0,$54,$C2,$54,$C4,$54
Data0855CF:                         ; 08:55CF
.db $04,$00,$04,$00,$04,$00,$06,$00,\
    $02,$00,$02,$00,$04,$00,$02,$00,\
    $08,$00,$02,$00,$04,$00,$02,$00,\
    $12,$00,$04,$00,$06,$00,$0A,$00,\
    $0A,$00,$0A,$00,$04,$00,$08,$00,\
    $08,$00,$06,$00,$02,$00,$04,$00,\
    $02,$00,$04,$00,$02,$00,$02,$00,\
    $02,$00,$02,$00,$08,$00,$02,$00,\
    $04,$00,$04,$00,$04,$00,$04,$00,\
    $04,$00,$04,$00,$02,$00,$02,$00,\
    $06,$00,$06,$00,$06,$00,$02,$00,\
    $02,$00,$02,$00,$04,$00,$02,$00,\
    $04,$00,$08,$00,$02,$00,$08,$00,\
    $06,$00,$08,$00,$08,$00,$04,$00,\
    $02,$00,$02,$00,$02,$00,$02,$00,\
    $02,$00,$02,$00,$02,$00
Data08564D:                         ; 08:564D
.db $C6,$54,$C8,$54,$CA,$54,$CC,$54,\
    $CF,$54,$D0,$54,$D1,$54,$D3,$54,\
    $D4,$54,$D8,$54,$D9,$54,$DB,$54,\
    $DC,$54,$E5,$54,$E7,$54,$EA,$54,\
    $EF,$54,$F4,$54,$F9,$54,$FB,$54,\
    $FF,$54,$03,$55,$06,$55,$07,$55,\
    $09,$55,$0A,$55,$0C,$55,$0D,$55,\
    $0E,$55,$0F,$55,$10,$55,$14,$55,\
    $15,$55,$17,$55,$19,$55,$1B,$55,\
    $1D,$55,$1F,$55,$21,$55,$22,$55,\
    $23,$55,$26,$55,$29,$55,$2C,$55,\
    $2D,$55,$2E,$55,$2F,$55,$31,$55,\
    $32,$55,$34,$55,$38,$55,$39,$55,\
    $3D,$55,$40,$55,$44,$55,$48,$55,\
    $4A,$55,$4B,$55,$4C,$55,$4D,$55,\
    $4E,$55,$4F,$55,$50,$55
Code0856CB:
    ld   a,[W_SublevelID]           ; 08:56CB
    ldh  [<$FF97],a                 ; 08:56CE
    ld   a,[W_SPFlag]               ; 08:56D0
    and  a                          ; 08:56D3
    jr   z,Code0856DC               ; 08:56D4
    ldh  a,[<$FF97]                 ; 08:56D6
    add  $40                        ; 08:56D8
    ldh  [<$FF97],a                 ; 08:56DA
Code0856DC:
    ld   de,$0000                   ; 08:56DC
Code0856DF:
    ld   hl,Data085371              ; 08:56DF
    add  hl,de                      ; 08:56E2
    ldh  a,[<$FF97]                 ; 08:56E3
    cp   [hl]                       ; 08:56E5
    jr   z,Code0856F2               ; 08:56E6
    inc  e                          ; 08:56E8
    ld   a,e                        ; 08:56E9
    cp   $3F                        ; 08:56EA
    jr   nz,Code0856DF              ; 08:56EC
Code0856EE:
    call Sub0029EF                  ; 08:56EE
    ret                             ; 08:56F1

Code0856F2:
    sla  e                          ; 08:56F2
    ld   a,e                        ; 08:56F4
    ld   [$D2E4],a                  ; 08:56F5
    ld   a,d                        ; 08:56F8
    ld   [$D2E5],a                  ; 08:56F9
    ld   hl,Data085551              ; 08:56FC
    add  hl,de                      ; 08:56FF
    ldi  a,[hl]                     ; 08:5700
    ldh  [<$FF97],a                 ; 08:5701
    ldi  a,[hl]                     ; 08:5703
    ldh  [<$FF98],a                 ; 08:5704
    ld   hl,Data0855CF              ; 08:5706
    add  hl,de                      ; 08:5709
    ldi  a,[hl]                     ; 08:570A
    ldh  [<$FF99],a                 ; 08:570B
    ldi  a,[hl]                     ; 08:570D
    ldh  [<$FF9A],a                 ; 08:570E
    ld   hl,W_SpriteXLow            ; 08:5710
    add  hl,bc                      ; 08:5713
    ld   a,[hl]                     ; 08:5714
    ldh  [<$FF9B],a                 ; 08:5715
    ld   hl,W_SpriteXHigh           ; 08:5717
    add  hl,bc                      ; 08:571A
    ld   a,[hl]                     ; 08:571B
    ldh  [<$FF9C],a                 ; 08:571C
    ld   de,$0000                   ; 08:571E
Code085721:
    ldh  a,[<$FF97]                 ; 08:5721
    ld   l,a                        ; 08:5723
    ldh  a,[<$FF98]                 ; 08:5724
    ld   h,a                        ; 08:5726
    add  hl,de                      ; 08:5727
    ldh  a,[<$FF9B]                 ; 08:5728
    cp   [hl]                       ; 08:572A
    jr   nz,Code085733              ; 08:572B
    inc  hl                         ; 08:572D
    ldh  a,[<$FF9C]                 ; 08:572E
    cp   [hl]                       ; 08:5730
    jr   z,Code085741               ; 08:5731
Code085733:
    inc  de                         ; 08:5733
    inc  de                         ; 08:5734
    ldh  a,[<$FF9A]                 ; 08:5735
    cp   d                          ; 08:5737
    jr   nz,Code085721              ; 08:5738
    ldh  a,[<$FF99]                 ; 08:573A
    cp   e                          ; 08:573C
    jr   nz,Code085721              ; 08:573D
    jr   Code0856EE                 ; 08:573F
Code085741:
    push de                         ; 08:5741
    ld   a,[$D2E4]                  ; 08:5742
    ld   e,a                        ; 08:5745
    ld   a,[$D2E5]                  ; 08:5746
    ld   d,a                        ; 08:5749
    ld   hl,Data08564D              ; 08:574A
    add  hl,de                      ; 08:574D
    ldi  a,[hl]                     ; 08:574E
    ld   e,a                        ; 08:574F
    ld   a,[hl]                     ; 08:5750
    ld   h,a                        ; 08:5751
    ld   l,e                        ; 08:5752
    pop  de                         ; 08:5753
    srl  d                          ; 08:5754
    rr   e                          ; 08:5756
    add  hl,de                      ; 08:5758
    ld   a,[hl]                     ; 08:5759
    ld   hl,$D285                   ; 08:575A
    add  hl,bc                      ; 08:575D
    ld   [hl],a                     ; 08:575E
    ld   hl,W_SpriteID              ; 08:575F
    add  hl,bc                      ; 08:5762
    ld   a,[hl]                     ; 08:5763
    sub  $39                        ; 08:5764
    ld   hl,W_SpriteSubstate        ; 08:5766
    add  hl,bc                      ; 08:5769
    ld   [hl],a                     ; 08:576A
    ret                             ; 08:576B

Code08576C:
    call Sub002920                  ; 08:576C
    jp   c,Return0857FF             ; 08:576F
    call Sub08584B                  ; 08:5772
    jr   c,Code085780               ; 08:5775
    ld   hl,$D11D                   ; 08:5777
    add  hl,bc                      ; 08:577A
    ld   [hl],$00                   ; 08:577B
    jp   Return0857FF               ; 08:577D
Code085780:
    ld   hl,$D11D                   ; 08:5780
    add  hl,bc                      ; 08:5783
    ld   a,[hl]                     ; 08:5784
    and  a                          ; 08:5785
    jr   nz,Return0857FF            ; 08:5786
    ld   a,[$C26B]                  ; 08:5788
    and  a                          ; 08:578B
    jr   nz,Code085794              ; 08:578C
    ld   a,[$C1D8]                  ; 08:578E
    and  a                          ; 08:5791
    jr   z,Return0857FF             ; 08:5792
Code085794:
    ld   hl,W_SpriteSubstate        ; 08:5794
    add  hl,bc                      ; 08:5797
    ld   a,[hl]                     ; 08:5798
    cp   $02                        ; 08:5799
    jr   z,Code085800               ; 08:579B
    ld   a,[$C28D]                  ; 08:579D
    and  a                          ; 08:57A0
    jr   nz,Return0857FF            ; 08:57A1
    ld   a,[$C25F]                  ; 08:57A3
    and  a                          ; 08:57A6
    jr   nz,Return0857FF            ; 08:57A7
    ld   hl,$FFBA                   ; 08:57A9
    ld   a,[hl]                     ; 08:57AC
    cp   $38                        ; 08:57AD
    jr   c,Return0857FF             ; 08:57AF
    cp   $71                        ; 08:57B1
    jr   nc,Return0857FF            ; 08:57B3
    ldh  a,[<$FFA9]                 ; 08:57B5
    sub  [hl]                       ; 08:57B7
    ld   e,a                        ; 08:57B8
    ld   hl,$FFBB                   ; 08:57B9
    ldh  a,[<$FFAA]                 ; 08:57BC
    sbc  [hl]                       ; 08:57BE
    ld   d,a                        ; 08:57BF
    ld   hl,W_SpriteSubstate        ; 08:57C0
    add  hl,bc                      ; 08:57C3
    ld   a,[hl]                     ; 08:57C4
    and  a                          ; 08:57C5
    jr   nz,Code0857D9              ; 08:57C6
    bit  7,d                        ; 08:57C8
    jr   z,Code0857D1               ; 08:57CA
    ld   a,e                        ; 08:57CC
    cp   $EE                        ; 08:57CD
    jr   c,Return0857FF             ; 08:57CF
Code0857D1:
    xor  a                          ; 08:57D1
    ld   [$C1FA],a                  ; 08:57D2
    ld   a,$01                      ; 08:57D5
    jr   Code0857F6                 ; 08:57D7
Code0857D9:
    ld   a,d                        ; 08:57D9
    and  a                          ; 08:57DA
    jr   z,Code0857E4               ; 08:57DB
    ld   a,e                        ; 08:57DD
    cp   $EC                        ; 08:57DE
    jr   c,Return0857FF             ; 08:57E0
    jr   Code0857E9                 ; 08:57E2
Code0857E4:
    ld   a,e                        ; 08:57E4
    cp   $71                        ; 08:57E5
    jr   nc,Return0857FF            ; 08:57E7
Code0857E9:
    ldh  a,[<$FFBA]                 ; 08:57E9
    cp   $70                        ; 08:57EB
    jr   z,Code0857F4               ; 08:57ED
    ld   a,$01                      ; 08:57EF
    ld   [$C1FA],a                  ; 08:57F1
Code0857F4:
    ld   a,$02                      ; 08:57F4
Code0857F6:
    ld   [$C28D],a                  ; 08:57F6
    ld   hl,$D11D                   ; 08:57F9
    add  hl,bc                      ; 08:57FC
    ld   [hl],$01                   ; 08:57FD
Return0857FF:
    ret                             ; 08:57FF

Code085800:
    ld   a,[$C1E7]                  ; 08:5800
    and  a                          ; 08:5803
    jr   nz,Return085828            ; 08:5804
    ld   hl,$FFB8                   ; 08:5806
    ldh  a,[<$FFB9]                 ; 08:5809
    or   [hl]                       ; 08:580B
    jr   z,Return085828             ; 08:580C
    ld   hl,$FFB8                   ; 08:580E
    ldh  a,[<$FFA7]                 ; 08:5811
    sub  [hl]                       ; 08:5813
    cp   $03                        ; 08:5814
    jr   c,Return085828             ; 08:5816
    ld   a,$03                      ; 08:5818
    ld   [$C1E7],a                  ; 08:581A
    ld   a,$00                      ; 08:581D
    ld   [$C1E9],a                  ; 08:581F
    ld   hl,$D11D                   ; 08:5822
    add  hl,bc                      ; 08:5825
    ld   [hl],$01                   ; 08:5826
Return085828:
    ret                             ; 08:5828

Data085829:                         ; 08:5829
.db $18,$0F,$18,$0F,$18,$0F,$18,$0F,\
    $18,$0F,$18,$0F,$10,$08,$10,$08,\
    $18,$0F,$18,$0F,$18,$0F,$18,$0F,\
    $18,$0F,$18,$0F,$18,$0F,$18,$0F,\
    $10,$0F

Sub08584B:
    ld   a,[W_PlayerState]          ; 08:584B
    cp   $11                        ; 08:584E
    jp   z,Return0857FF             ; 08:5850
    ld   hl,$D285                   ; 08:5853
    add  hl,bc                      ; 08:5856
    ld   a,[hl]                     ; 08:5857
    sla  a                          ; 08:5858
    ld   e,a                        ; 08:585A
    ld   d,$00                      ; 08:585B
    ld   hl,Data085829              ; 08:585D
    add  hl,de                      ; 08:5860
    ldi  a,[hl]                     ; 08:5861
    ldh  [<$FF97],a                 ; 08:5862
    ldi  a,[hl]                     ; 08:5864
    ld   [$D2D8],a                  ; 08:5865
    ld   hl,W_SpriteXHigh           ; 08:5868
    add  hl,bc                      ; 08:586B
    ld   e,[hl]                     ; 08:586C
    ldh  a,[<$FF97]                 ; 08:586D
    ld   hl,W_SpriteXLow            ; 08:586F
    add  hl,bc                      ; 08:5872
    add  [hl]                       ; 08:5873
    ld   [$D2D4],a                  ; 08:5874
    ld   a,$00                      ; 08:5877
    adc  e                          ; 08:5879
    ld   [$D2D5],a                  ; 08:587A
    ldh  a,[<$FFA7]                 ; 08:587D
    add  $08                        ; 08:587F
    ldh  [<$FF9B],a                 ; 08:5881
    ldh  a,[<$FFA8]                 ; 08:5883
    adc  $00                        ; 08:5885
    ldh  [<$FF9C],a                 ; 08:5887
    ld   hl,$D2D4                   ; 08:5889
    ldh  a,[<$FF9B]                 ; 08:588C
    sub  [hl]                       ; 08:588E
    ldh  [<$FFA0],a                 ; 08:588F
    ld   hl,$D2D5                   ; 08:5891
    ldh  a,[<$FF9C]                 ; 08:5894
    sbc  [hl]                       ; 08:5896
    bit  7,a                        ; 08:5897
    jr   z,Code0858A9               ; 08:5899
    xor  $FF                        ; 08:589B
    ld   e,a                        ; 08:589D
    ldh  a,[<$FFA0]                 ; 08:589E
    xor  $FF                        ; 08:58A0
    add  $01                        ; 08:58A2
    ldh  [<$FFA0],a                 ; 08:58A4
    ld   a,e                        ; 08:58A6
    adc  $00                        ; 08:58A7
Code0858A9:
    and  a                          ; 08:58A9
    jp   nz,Code0858CE              ; 08:58AA
    ld   a,[$D2D8]                  ; 08:58AD
    add  $06                        ; 08:58B0
    ld   hl,$FFA0                   ; 08:58B2
    cp   [hl]                       ; 08:58B5
    jr   c,Code0858CE               ; 08:58B6
    ld   hl,W_SpriteYHigh           ; 08:58B8
    add  hl,bc                      ; 08:58BB
    push hl                         ; 08:58BC
    ld   hl,W_SpriteYLow            ; 08:58BD
    add  hl,bc                      ; 08:58C0
    ldh  a,[<$FFA9]                 ; 08:58C1
    sub  [hl]                       ; 08:58C3
    pop  hl                         ; 08:58C4
    ldh  a,[<$FFAA]                 ; 08:58C5
    sbc  [hl]                       ; 08:58C7
    bit  7,a                        ; 08:58C8
    jr   z,Code0858CE               ; 08:58CA
    scf                             ; 08:58CC
    ret                             ; 08:58CD

Code0858CE:
    scf                             ; 08:58CE
    ccf                             ; 08:58CF
    ret                             ; 08:58D0

Code0858D1:
    ld   hl,W_SpriteYHigh           ; 08:58D1
    add  hl,bc                      ; 08:58D4
    push hl                         ; 08:58D5
    ld   hl,W_SpriteYLow            ; 08:58D6
    add  hl,bc                      ; 08:58D9
    ld   a,$10                      ; 08:58DA
    add  [hl]                       ; 08:58DC
    ld   [hl],a                     ; 08:58DD
    pop  hl                         ; 08:58DE
    ld   a,[hl]                     ; 08:58DF
    adc  $00                        ; 08:58E0
    ld   [hl],a                     ; 08:58E2
    ret                             ; 08:58E3

Code0858E4:
    call Sub002920                  ; 08:58E4
    jp   c,Return085903             ; 08:58E7
    call Sub001D21                  ; 08:58EA
    jr   nc,Return085903            ; 08:58ED
    ld   a,[$C1CA]                  ; 08:58EF
    ldh  [<$FFA7],a                 ; 08:58F2
    ld   a,[$C1CB]                  ; 08:58F4
    ldh  [<$FFA8],a                 ; 08:58F7
    ld   a,[$C27B]                  ; 08:58F9
    ldh  [<$FFB8],a                 ; 08:58FC
    ld   a,[$C27C]                  ; 08:58FE
    ldh  [<$FFB9],a                 ; 08:5901
Return085903:
    ret                             ; 08:5903

Code085904:
    ld   hl,W_SpriteID              ; 08:5904
    add  hl,bc                      ; 08:5907
    ld   a,[hl]                     ; 08:5908
    sub  $4E                        ; 08:5909
    or   $02                        ; 08:590B
    ld   e,a                        ; 08:590D
    ld   d,$00                      ; 08:590E
Code085910:
    push de                         ; 08:5910
    ld   a,$26                      ; 08:5911
    call Sub0026BE                  ; 08:5913
    jr   c,Code085956               ; 08:5916
    push bc                         ; 08:5918
    push de                         ; 08:5919
    ld   hl,W_SpriteYLow            ; 08:591A
    add  hl,bc                      ; 08:591D
    ld   a,[hl]                     ; 08:591E
    ld   hl,W_SpriteYLow            ; 08:591F
    add  hl,de                      ; 08:5922
    ld   [hl],a                     ; 08:5923
    ld   b,d                        ; 08:5924
    ld   c,e                        ; 08:5925
    call Sub084582                  ; 08:5926
    pop  de                         ; 08:5929
    pop  bc                         ; 08:592A
    ld   hl,W_SpriteXHigh           ; 08:592B
    add  hl,bc                      ; 08:592E
    ld   a,[hl]                     ; 08:592F
    ld   hl,W_SpriteXHigh           ; 08:5930
    add  hl,de                      ; 08:5933
    ld   [hl],a                     ; 08:5934
    ld   hl,W_SpriteXLow            ; 08:5935
    add  hl,bc                      ; 08:5938
    ld   a,[hl]                     ; 08:5939
    ld   hl,W_SpriteXLow            ; 08:593A
    add  hl,de                      ; 08:593D
    ld   [hl],a                     ; 08:593E
    add  $20                        ; 08:593F
    push af                         ; 08:5941
    ld   hl,W_SpriteXLow            ; 08:5942
    add  hl,bc                      ; 08:5945
    ld   [hl],a                     ; 08:5946
    ld   hl,W_SpriteXHigh           ; 08:5947
    add  hl,bc                      ; 08:594A
    pop  af                         ; 08:594B
    ld   a,[hl]                     ; 08:594C
    adc  $00                        ; 08:594D
    ld   [hl],a                     ; 08:594F
    pop  de                         ; 08:5950
    dec  e                          ; 08:5951
    jr   nz,Code085910              ; 08:5952
    jr   Code085957                 ; 08:5954
Code085956:
    pop  de                         ; 08:5956
Code085957:
    call Sub0029EF                  ; 08:5957
    ret                             ; 08:595A

Code08595B:
    ld   hl,W_SpriteID              ; 08:595B
    add  hl,bc                      ; 08:595E
    ld   a,[hl]                     ; 08:595F
    sub  $0F                        ; 08:5960
    push af                         ; 08:5962
    and  $01                        ; 08:5963
    ld   hl,$D195                   ; 08:5965
    add  hl,bc                      ; 08:5968
    ld   [hl],a                     ; 08:5969
    pop  af                         ; 08:596A
    push af                         ; 08:596B
    and  $02                        ; 08:596C
    srl  a                          ; 08:596E
    ld   hl,$D11D                   ; 08:5970
    add  hl,bc                      ; 08:5973
    ld   [hl],a                     ; 08:5974
    ld   hl,W_SpriteXHigh           ; 08:5975
    add  hl,bc                      ; 08:5978
    push hl                         ; 08:5979
    ld   hl,W_SpriteXLow            ; 08:597A
    add  hl,bc                      ; 08:597D
    ld   a,[hl]                     ; 08:597E
    add  $04                        ; 08:597F
    ld   [hl],a                     ; 08:5981
    pop  hl                         ; 08:5982
    ld   a,[hl]                     ; 08:5983
    adc  $00                        ; 08:5984
    ld   [hl],a                     ; 08:5986
    ld   hl,W_SpriteYLow            ; 08:5987
    add  hl,bc                      ; 08:598A
    ld   a,[hl]                     ; 08:598B
    add  $05                        ; 08:598C
    ld   [hl],a                     ; 08:598E
    ld   hl,W_SpriteXSpeed          ; 08:598F
    add  hl,bc                      ; 08:5992
    pop  af                         ; 08:5993
    and  $04                        ; 08:5994
    jr   nz,Code08599C              ; 08:5996
    ld   a,$28                      ; 08:5998
    jr   Code08599E                 ; 08:599A
Code08599C:
    ld   a,$38                      ; 08:599C
Code08599E:
    ld   [hl],a                     ; 08:599E
    ret                             ; 08:599F

Data0859A0:                         ; 08:59A0
.db $04,$0A
Code0859A2:
    call Sub0025CB                  ; 08:59A2
    jp   c,Code0859D7               ; 08:59A5
    call Sub002920                  ; 08:59A8
    jp   c,Return085A31             ; 08:59AB
    ld   hl,W_SpriteXHigh           ; 08:59AE
    add  hl,bc                      ; 08:59B1
    ld   d,[hl]                     ; 08:59B2
    ld   hl,W_SpriteXLow            ; 08:59B3
    add  hl,bc                      ; 08:59B6
    ld   e,[hl]                     ; 08:59B7
    ldh  a,[<$FFB9]                 ; 08:59B8
    ld   h,a                        ; 08:59BA
    ldh  a,[<$FFB8]                 ; 08:59BB
    sub  e                          ; 08:59BD
    ld   e,a                        ; 08:59BE
    ld   a,h                        ; 08:59BF
    sbc  d                          ; 08:59C0
    and  a                          ; 08:59C1
    jr   nz,Code0859CF              ; 08:59C2
    ld   a,e                        ; 08:59C4
    cp   $70                        ; 08:59C5
    jr   c,Code0859CF               ; 08:59C7
    call Sub0029EF                  ; 08:59C9
    jp   Return085A31               ; 08:59CC
Code0859CF:
    ld   hl,W_SpriteXSpeed          ; 08:59CF
    add  hl,bc                      ; 08:59D2
    ld   a,[hl]                     ; 08:59D3
    call Sub085A32                  ; 08:59D4
Code0859D7:
    ld   hl,$D096                   ; 08:59D7
    add  hl,bc                      ; 08:59DA
    ld   a,[hl]                     ; 08:59DB
    and  a                          ; 08:59DC
    jr   nz,Code0859EC              ; 08:59DD
    ld   [hl],$02                   ; 08:59DF
    ld   hl,$D0D2                   ; 08:59E1
    add  hl,bc                      ; 08:59E4
    ld   a,[hl]                     ; 08:59E5
    inc  a                          ; 08:59E6
    and  $03                        ; 08:59E7
    ld   [hl],a                     ; 08:59E9
    jr   Code0859ED                 ; 08:59EA
Code0859EC:
    dec  [hl]                       ; 08:59EC
Code0859ED:
    ld   hl,$D0D2                   ; 08:59ED
    add  hl,bc                      ; 08:59F0
    ld   e,[hl]                     ; 08:59F1
    sla  e                          ; 08:59F2
    ld   d,$00                      ; 08:59F4
    ld   hl,Data085B2E              ; 08:59F6
    add  hl,de                      ; 08:59F9
    call Sub002893                  ; 08:59FA
    call Sub001D21                  ; 08:59FD
    jr   nc,Code085A0E              ; 08:5A00
    ldh  a,[<H_GlobalTimer]         ; 08:5A02
    srl  a                          ; 08:5A04
    jr   nc,Code085A0E              ; 08:5A06
    ld   a,$08                      ; 08:5A08
    rst  $10                        ; 08:5A0A
.dl SubL_0B4074                     ; 08:5A0B
Code085A0E:
    ld   hl,$D11D                   ; 08:5A0E
    add  hl,bc                      ; 08:5A11
    ld   e,[hl]                     ; 08:5A12
    ld   d,$00                      ; 08:5A13
    ld   hl,Data0859A0              ; 08:5A15
    add  hl,de                      ; 08:5A18
    ld   a,[hl]                     ; 08:5A19
    ld   [$D2E4],a                  ; 08:5A1A
    ld   de,$0000                   ; 08:5A1D
Code085A20:
    push de                         ; 08:5A20
    call Sub085AD8                  ; 08:5A21
    pop  de                         ; 08:5A24
    push de                         ; 08:5A25
    call Sub085B36                  ; 08:5A26
    pop  de                         ; 08:5A29
    inc  e                          ; 08:5A2A
    ld   a,[$D2E4]                  ; 08:5A2B
    cp   e                          ; 08:5A2E
    jr   nc,Code085A20              ; 08:5A2F
Return085A31:
    ret                             ; 08:5A31

Sub085A32:
    ldh  [<$FF97],a                 ; 08:5A32
    ld   hl,$D14A                   ; 08:5A34
    add  hl,bc                      ; 08:5A37
    push hl                         ; 08:5A38
    ld   hl,$D195                   ; 08:5A39
    add  hl,bc                      ; 08:5A3C
    ld   a,[hl]                     ; 08:5A3D
    and  a                          ; 08:5A3E
    jr   nz,Code085A51              ; 08:5A3F
    ld   hl,$D078                   ; 08:5A41
    add  hl,bc                      ; 08:5A44
    ldh  a,[<$FF97]                 ; 08:5A45
    add  [hl]                       ; 08:5A47
    ld   [hl],a                     ; 08:5A48
    pop  hl                         ; 08:5A49
    ld   a,[hl]                     ; 08:5A4A
    adc  $00                        ; 08:5A4B
    and  $1F                        ; 08:5A4D
    ld   [hl],a                     ; 08:5A4F
    ret                             ; 08:5A50

Code085A51:
    ld   hl,$D078                   ; 08:5A51
    add  hl,bc                      ; 08:5A54
    ld   a,[hl]                     ; 08:5A55
    push hl                         ; 08:5A56
    ld   hl,$FF97                   ; 08:5A57
    sub  [hl]                       ; 08:5A5A
    pop  hl                         ; 08:5A5B
    ld   [hl],a                     ; 08:5A5C
    pop  hl                         ; 08:5A5D
    ld   a,[hl]                     ; 08:5A5E
    sbc  $00                        ; 08:5A5F
    and  $1F                        ; 08:5A61
    ld   [hl],a                     ; 08:5A63
    ret                             ; 08:5A64

Data085A65:                         ; 08:5A65
.db $00,$01,$03,$04,$05,$06,$07,$07,\
    $08,$00,$03,$06,$09,$0B,$0D,$0E,\
    $0F,$10,$00,$04,$09,$0D,$10,$13,\
    $16,$17,$18,$00,$06,$0C,$12,$16,\
    $1A,$1D,$1F,$20,$00,$07,$0F,$16,\
    $1C,$21,$25,$27,$28,$00,$09,$12,\
    $1B,$21,$27,$2C,$2F,$30,$00,$0B,\
    $15,$1F,$27,$2E,$33,$37,$38,$00,\
    $0C,$18,$24,$2D,$35,$3B,$3E,$40,\
    $00,$0E,$1B,$28,$32,$3B,$42,$46,\
    $48,$00,$0F,$1F,$2D,$38,$42,$4A,\
    $4E,$50,$00,$11,$22,$31,$3E,$49,\
    $51,$56,$58
Data085AC8:                         ; 08:5AC8
.db $01,$03,$02,$00
Data085ACC:                         ; 08:5ACC
.db $00,$09,$12,$1B,$24,$2D,$36,$3F,\
    $48,$51,$5A,$63

Sub085AD8:
    ld   hl,$D14A                   ; 08:5AD8
    add  hl,bc                      ; 08:5ADB
    ld   a,[hl]                     ; 08:5ADC
    push af                         ; 08:5ADD
    and  $0F                        ; 08:5ADE
    cp   $09                        ; 08:5AE0
    jr   c,Code085AE7               ; 08:5AE2
    xor  $0F                        ; 08:5AE4
    inc  a                          ; 08:5AE6
Code085AE7:
    push de                         ; 08:5AE7
    ldh  [<$FF9F],a                 ; 08:5AE8
    ld   hl,Data085ACC              ; 08:5AEA
    add  hl,de                      ; 08:5AED
    ld   e,[hl]                     ; 08:5AEE
    ld   d,$00                      ; 08:5AEF
    ld   hl,Data085A65              ; 08:5AF1
    add  hl,de                      ; 08:5AF4
    ldh  a,[<$FF9F]                 ; 08:5AF5
    ld   e,a                        ; 08:5AF7
    add  hl,de                      ; 08:5AF8
    ld   a,[hl]                     ; 08:5AF9
    ldh  [<$FF9F],a                 ; 08:5AFA
    pop  de                         ; 08:5AFC
    pop  af                         ; 08:5AFD
    push af                         ; 08:5AFE
    add  $08                        ; 08:5AFF
    and  $0F                        ; 08:5B01
    cp   $09                        ; 08:5B03
    jr   c,Code085B0A               ; 08:5B05
    xor  $0F                        ; 08:5B07
    inc  a                          ; 08:5B09
Code085B0A:
    ldh  [<$FFA0],a                 ; 08:5B0A
    ld   hl,Data085ACC              ; 08:5B0C
    add  hl,de                      ; 08:5B0F
    ld   e,[hl]                     ; 08:5B10
    ld   d,$00                      ; 08:5B11
    ld   hl,Data085A65              ; 08:5B13
    add  hl,de                      ; 08:5B16
    ldh  a,[<$FFA0]                 ; 08:5B17
    ld   e,a                        ; 08:5B19
    add  hl,de                      ; 08:5B1A
    ld   a,[hl]                     ; 08:5B1B
    ldh  [<$FFA0],a                 ; 08:5B1C
    ld   hl,Data085AC8              ; 08:5B1E
    pop  af                         ; 08:5B21
    srl  a                          ; 08:5B22
    srl  a                          ; 08:5B24
    srl  a                          ; 08:5B26
    ld   e,a                        ; 08:5B28
    add  hl,de                      ; 08:5B29
    ld   a,[hl]                     ; 08:5B2A
    ldh  [<$FFA1],a                 ; 08:5B2B
    ret                             ; 08:5B2D

Data085B2E:                         ; 08:5B2E
.db $5C,$06,$5E,$06,$C2,$06,$C4,$06

Sub085B36:
    ld   hl,$FFA1                   ; 08:5B36
    srl  [hl]                       ; 08:5B39
    jr   nc,Code085B44              ; 08:5B3B
    ldh  a,[<$FF9F]                 ; 08:5B3D
    xor  $FF                        ; 08:5B3F
    inc  a                          ; 08:5B41
    ldh  [<$FF9F],a                 ; 08:5B42
Code085B44:
    srl  [hl]                       ; 08:5B44
    jr   nc,Code085B4F              ; 08:5B46
    ldh  a,[<$FFA0]                 ; 08:5B48
    xor  $FF                        ; 08:5B4A
    inc  a                          ; 08:5B4C
    ldh  [<$FFA0],a                 ; 08:5B4D
Code085B4F:
    ld   hl,$FF99                   ; 08:5B4F
    xor  a                          ; 08:5B52
    ld   [hl],a                     ; 08:5B53
    ldh  a,[<$FF9F]                 ; 08:5B54
    ldh  [<$FF98],a                 ; 08:5B56
    bit  7,a                        ; 08:5B58
    jr   z,Code085B5D               ; 08:5B5A
    dec  [hl]                       ; 08:5B5C
Code085B5D:
    ld   hl,W_SpriteXHigh           ; 08:5B5D
    add  hl,bc                      ; 08:5B60
    ld   e,[hl]                     ; 08:5B61
    ld   hl,W_SpriteXLow            ; 08:5B62
    add  hl,bc                      ; 08:5B65
    ldh  a,[<$FF98]                 ; 08:5B66
    add  [hl]                       ; 08:5B68
    ldh  [<$FF98],a                 ; 08:5B69
    ldh  a,[<$FF99]                 ; 08:5B6B
    adc  e                          ; 08:5B6D
    ldh  [<$FF99],a                 ; 08:5B6E
    ld   hl,W_SpriteYHigh           ; 08:5B70
    add  hl,bc                      ; 08:5B73
    ld   e,[hl]                     ; 08:5B74
    ld   hl,W_SpriteYLow            ; 08:5B75
    add  hl,bc                      ; 08:5B78
    ldh  a,[<$FFA0]                 ; 08:5B79
    add  [hl]                       ; 08:5B7B
    ldh  [<$FF97],a                 ; 08:5B7C
    ld   a,$00                      ; 08:5B7E
    adc  e                          ; 08:5B80
    ldh  [<$FFA6],a                 ; 08:5B81
    ldh  a,[<$FF98]                 ; 08:5B83
    push af                         ; 08:5B85
    ldh  a,[<$FF99]                 ; 08:5B86
    push af                         ; 08:5B88
    ldh  a,[<$FF97]                 ; 08:5B89
    push af                         ; 08:5B8B
    ld   hl,$D0D2                   ; 08:5B8C
    add  hl,bc                      ; 08:5B8F
    ld   e,[hl]                     ; 08:5B90
    sla  e                          ; 08:5B91
    ld   d,$00                      ; 08:5B93
    ld   hl,Data085B2E              ; 08:5B95
    add  hl,de                      ; 08:5B98
    ldi  a,[hl]                     ; 08:5B99
    ldh  [<$FF9F],a                 ; 08:5B9A
    ld   a,[hl]                     ; 08:5B9C
    ldh  [<$FFA0],a                 ; 08:5B9D
    ldh  a,[<$FF97]                 ; 08:5B9F
    ld   hl,$FFBA                   ; 08:5BA1
    add  $10                        ; 08:5BA4
    sub  [hl]                       ; 08:5BA6
    ldh  [<$FF97],a                 ; 08:5BA7
    call Sub002879                  ; 08:5BA9
    ld   hl,W_SpriteYLow            ; 08:5BAC
    add  hl,bc                      ; 08:5BAF
    ld   a,[hl]                     ; 08:5BB0
    ld   [$D2E2],a                  ; 08:5BB1
    pop  af                         ; 08:5BB4
    ld   [hl],a                     ; 08:5BB5
    ld   hl,W_SpriteXHigh           ; 08:5BB6
    add  hl,bc                      ; 08:5BB9
    ld   a,[hl]                     ; 08:5BBA
    ld   [$D2E1],a                  ; 08:5BBB
    pop  af                         ; 08:5BBE
    ld   [hl],a                     ; 08:5BBF
    ld   hl,W_SpriteXLow            ; 08:5BC0
    add  hl,bc                      ; 08:5BC3
    ld   a,[hl]                     ; 08:5BC4
    ld   [$D2E0],a                  ; 08:5BC5
    pop  af                         ; 08:5BC8
    ld   [hl],a                     ; 08:5BC9
    call Sub001D21                  ; 08:5BCA
    jr   nc,Code085BDB              ; 08:5BCD
    ldh  a,[<H_GlobalTimer]         ; 08:5BCF
    srl  a                          ; 08:5BD1
    jr   nc,Code085BDB              ; 08:5BD3
    ld   a,$08                      ; 08:5BD5
    rst  $10                        ; 08:5BD7
.dl SubL_0B4074                     ; 08:5BD8
Code085BDB:
    ld   hl,W_SpriteXLow            ; 08:5BDB
    add  hl,bc                      ; 08:5BDE
    ld   a,[$D2E0]                  ; 08:5BDF
    ld   [hl],a                     ; 08:5BE2
    ld   hl,W_SpriteXHigh           ; 08:5BE3
    add  hl,bc                      ; 08:5BE6
    ld   a,[$D2E1]                  ; 08:5BE7
    ld   [hl],a                     ; 08:5BEA
    ld   hl,W_SpriteYLow            ; 08:5BEB
    add  hl,bc                      ; 08:5BEE
    ld   a,[$D2E2]                  ; 08:5BEF
    ld   [hl],a                     ; 08:5BF2
    ret                             ; 08:5BF3

Code085BF4:
    ld   hl,$D0FF                   ; 08:5BF4
    add  hl,bc                      ; 08:5BF7
    ld   [hl],$01                   ; 08:5BF8
Return085BFA:
    ret                             ; 08:5BFA

SubL_085BFB:
    ld   de,$0000                   ; 08:5BFB
Code085BFE:
    ld   hl,W_SpriteStatus          ; 08:5BFE
    add  hl,de                      ; 08:5C01
    ld   a,[hl]                     ; 08:5C02
    and  a                          ; 08:5C03
    jr   z,Code085C55               ; 08:5C04
    ld   hl,W_SpriteID              ; 08:5C06
    add  hl,de                      ; 08:5C09
    ld   a,[hl]                     ; 08:5C0A
    cp   $4D                        ; 08:5C0B
    jr   z,Code085C13               ; 08:5C0D
    cp   $2D                        ; 08:5C0F
    jr   nz,Code085C55              ; 08:5C11
Code085C13:
    ldh  a,[<$FFA7]                 ; 08:5C13
    and  $F0                        ; 08:5C15
    ldh  [<$FF97],a                 ; 08:5C17
    ld   hl,W_SpriteXHigh           ; 08:5C19
    add  hl,de                      ; 08:5C1C
    push hl                         ; 08:5C1D
    ld   hl,W_SpriteXLow            ; 08:5C1E
    add  hl,de                      ; 08:5C21
    ldh  a,[<$FF97]                 ; 08:5C22
    sub  [hl]                       ; 08:5C24
    ldh  [<$FF97],a                 ; 08:5C25
    pop  hl                         ; 08:5C27
    ldh  a,[<$FFA8]                 ; 08:5C28
    sbc  [hl]                       ; 08:5C2A
    ldh  [<$FF98],a                 ; 08:5C2B
    bit  7,a                        ; 08:5C2D
    jr   z,Code085C3D               ; 08:5C2F
    ldh  a,[<$FF97]                 ; 08:5C31
    cpl                             ; 08:5C33
    inc  a                          ; 08:5C34
    ldh  [<$FF97],a                 ; 08:5C35
    ldh  a,[<$FF98]                 ; 08:5C37
    xor  $FF                        ; 08:5C39
    ldh  [<$FF98],a                 ; 08:5C3B
Code085C3D:
    ldh  a,[<$FF98]                 ; 08:5C3D
    and  a                          ; 08:5C3F
    jr   nz,Code085C55              ; 08:5C40
    ldh  a,[<$FF97]                 ; 08:5C42
    cp   $11                        ; 08:5C44
    jr   nc,Code085C55              ; 08:5C46
    ld   hl,$D14A                   ; 08:5C48
    add  hl,de                      ; 08:5C4B
    ld   [hl],$01                   ; 08:5C4C
    ld   hl,$D13B                   ; 08:5C4E
    add  hl,de                      ; 08:5C51
    ld   [hl],$00                   ; 08:5C52
    rst  $18                        ; 08:5C54

Code085C55:
    inc  de                         ; 08:5C55
    ld   a,e                        ; 08:5C56
    cp   $0F                        ; 08:5C57
    jr   nz,Code085BFE              ; 08:5C59
    rst  $18                        ; 08:5C5B

Data085C5C:                         ; 08:5C5C
.db $1E,$0E,$1E,$2E,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00
Data085C6C:                         ; 08:5C6C
.db $20,$0E,$20,$2E,$22,$0E,$22,$2E,\
    $62,$0E,$62,$2E,$22,$0E,$22,$2E
Data085C7C:                         ; 08:5C7C
.db $1E,$0F,$1E,$2F,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00
Data085C8C:                         ; 08:5C8C
.db $20,$0F,$20,$2F,$22,$0F,$22,$2F,\
    $62,$0F,$62,$2F,$22,$0F,$22,$2F
Data085C9C:                         ; 08:5C9C
.db $00,$00,$F8,$FF,$00,$00,$F8,$FF
Data085CA4:                         ; 08:5CA4
.db $A0,$86,$80
Data085CA7:                         ; 08:5CA7
.db $69,$68,$6B,$6A
Code085CAB:
    call Sub0025CB                  ; 08:5CAB
    jp   c,Code085CBA               ; 08:5CAE
    call Sub002920                  ; 08:5CB1
    jp   c,Code085CBA               ; 08:5CB4
    call Sub085D37                  ; 08:5CB7
Code085CBA:
    ld   hl,$D177                   ; 08:5CBA
    add  hl,bc                      ; 08:5CBD
    ld   a,[hl]                     ; 08:5CBE
    sla  a                          ; 08:5CBF
    sla  a                          ; 08:5CC1
    ld   e,a                        ; 08:5CC3
    ld   d,$00                      ; 08:5CC4
    cp   $00                        ; 08:5CC6
    jr   nz,Code085CE1              ; 08:5CC8
    ld   hl,$D0FF                   ; 08:5CCA
    add  hl,bc                      ; 08:5CCD
    ld   a,[hl]                     ; 08:5CCE
    and  a                          ; 08:5CCF
    jr   z,Code085CD8               ; 08:5CD0
    ld   hl,Data085C7C              ; 08:5CD2
    add  hl,de                      ; 08:5CD5
    jr   Code085CDC                 ; 08:5CD6
Code085CD8:
    ld   hl,Data085C5C              ; 08:5CD8
    add  hl,de                      ; 08:5CDB
Code085CDC:
    push de                         ; 08:5CDC
    call Sub0027BD                  ; 08:5CDD
    pop  de                         ; 08:5CE0
Code085CE1:
    push de                         ; 08:5CE1
    ld   hl,$D177                   ; 08:5CE2
    add  hl,bc                      ; 08:5CE5
    ld   a,[hl]                     ; 08:5CE6
    sla  a                          ; 08:5CE7
    ld   e,a                        ; 08:5CE9
    ld   d,$00                      ; 08:5CEA
    ld   hl,Data085C9C              ; 08:5CEC
    add  hl,de                      ; 08:5CEF
    ldi  a,[hl]                     ; 08:5CF0
    add  $10                        ; 08:5CF1
    ldh  [<$FF97],a                 ; 08:5CF3
    ld   a,[hl]                     ; 08:5CF5
    adc  $00                        ; 08:5CF6
    ldh  [<$FF9B],a                 ; 08:5CF8
    pop  de                         ; 08:5CFA
    ld   hl,W_SpriteYHigh           ; 08:5CFB
    add  hl,bc                      ; 08:5CFE
    push hl                         ; 08:5CFF
    ld   hl,W_SpriteYLow            ; 08:5D00
    add  hl,bc                      ; 08:5D03
    ldh  a,[<$FF97]                 ; 08:5D04
    add  [hl]                       ; 08:5D06
    ldh  [<$FF97],a                 ; 08:5D07
    pop  hl                         ; 08:5D09
    ldh  a,[<$FF9B]                 ; 08:5D0A
    adc  [hl]                       ; 08:5D0C
    ldh  [<$FF9B],a                 ; 08:5D0D
    ld   hl,W_SpriteXLow            ; 08:5D0F
    add  hl,bc                      ; 08:5D12
    ld   a,[hl]                     ; 08:5D13
    ldh  [<$FF98],a                 ; 08:5D14
    ld   hl,W_SpriteXHigh           ; 08:5D16
    add  hl,bc                      ; 08:5D19
    ld   a,[hl]                     ; 08:5D1A
    ldh  [<$FF99],a                 ; 08:5D1B
    ld   hl,$D0FF                   ; 08:5D1D
    add  hl,bc                      ; 08:5D20
    ld   a,[hl]                     ; 08:5D21
    and  a                          ; 08:5D22
    jr   z,Code085D2B               ; 08:5D23
    ld   hl,Data085C8C              ; 08:5D25
    add  hl,de                      ; 08:5D28
    jr   Code085D2F                 ; 08:5D29
Code085D2B:
    ld   hl,Data085C6C              ; 08:5D2B
    add  hl,de                      ; 08:5D2E
Code085D2F:
    call Sub002769                  ; 08:5D2F
    ret                             ; 08:5D32

Data085D33:                         ; 08:5D33
.db $00,$04,$04,$04

Sub085D37:
    ld   hl,$D14A                   ; 08:5D37
    add  hl,bc                      ; 08:5D3A
    ld   a,[hl]                     ; 08:5D3B
    and  a                          ; 08:5D3C
    jp   z,Code085E45               ; 08:5D3D
    ld   a,[$C1CA]                  ; 08:5D40
    ldh  [<$FFA7],a                 ; 08:5D43
    ld   a,[$C1CB]                  ; 08:5D45
    ldh  [<$FFA8],a                 ; 08:5D48
    ld   a,[$C27B]                  ; 08:5D4A
    ldh  [<$FFB8],a                 ; 08:5D4D
    ld   a,[$C27C]                  ; 08:5D4F
    ldh  [<$FFB9],a                 ; 08:5D52
    xor  a                          ; 08:5D54
    ld   [$C1FA],a                  ; 08:5D55
    ld   a,[$C1CC]                  ; 08:5D58
    ldh  [<$FFA9],a                 ; 08:5D5B
    ld   a,[$C1CD]                  ; 08:5D5D
    ldh  [<$FFAA],a                 ; 08:5D60
    ld   hl,$D177                   ; 08:5D62
    add  hl,bc                      ; 08:5D65
    ld   a,[hl]                     ; 08:5D66
    cp   $02                        ; 08:5D67
    jr   z,Code085D7D               ; 08:5D69
    and  $02                        ; 08:5D6B
    jr   nz,Code085D77              ; 08:5D6D
    ldh  a,[<$FFA9]                 ; 08:5D6F
    inc  a                          ; 08:5D71
    inc  a                          ; 08:5D72
    ldh  [<$FFA9],a                 ; 08:5D73
    jr   Code085D7D                 ; 08:5D75
Code085D77:
    ldh  a,[<$FFA9]                 ; 08:5D77
    dec  a                          ; 08:5D79
    dec  a                          ; 08:5D7A
    ldh  [<$FFA9],a                 ; 08:5D7B
Code085D7D:
    ld   hl,$D177                   ; 08:5D7D
    add  hl,bc                      ; 08:5D80
    ld   a,[hl]                     ; 08:5D81
    cp   $02                        ; 08:5D82
    jr   c,Code085D94               ; 08:5D84
    ldh  a,[<H_ButtonsPressed]      ; 08:5D86
    bit  0,a                        ; 08:5D88
    jr   z,Code085D94               ; 08:5D8A
    push hl                         ; 08:5D8C
    ld   hl,$D13B                   ; 08:5D8D
    add  hl,bc                      ; 08:5D90
    ld   [hl],$01                   ; 08:5D91
    pop  hl                         ; 08:5D93
Code085D94:
    ld   hl,$D096                   ; 08:5D94
    add  hl,bc                      ; 08:5D97
    ld   a,[hl]                     ; 08:5D98
    and  a                          ; 08:5D99
    jr   z,Code085D9E               ; 08:5D9A
    dec  [hl]                       ; 08:5D9C
    ret                             ; 08:5D9D

Code085D9E:
    push hl                         ; 08:5D9E
    ld   hl,$D177                   ; 08:5D9F
    add  hl,bc                      ; 08:5DA2
    ld   a,[hl]                     ; 08:5DA3
    inc  a                          ; 08:5DA4
    and  $03                        ; 08:5DA5
    ld   [hl],a                     ; 08:5DA7
    ld   e,a                        ; 08:5DA8
    ld   d,$00                      ; 08:5DA9
    ld   hl,Data085D33              ; 08:5DAB
    add  hl,de                      ; 08:5DAE
    ld   a,[hl]                     ; 08:5DAF
    pop  hl                         ; 08:5DB0
    ld   [hl],a                     ; 08:5DB1
    ld   hl,$D177                   ; 08:5DB2
    add  hl,bc                      ; 08:5DB5
    ld   a,[hl]                     ; 08:5DB6
    and  a                          ; 08:5DB7
    jp   nz,Code085E45              ; 08:5DB8
    ld   hl,$D14A                   ; 08:5DBB
    add  hl,bc                      ; 08:5DBE
    ld   [hl],$00                   ; 08:5DBF
    call Sub085E4A                  ; 08:5DC1
    ld   hl,$D13B                   ; 08:5DC4
    add  hl,bc                      ; 08:5DC7
    ld   e,[hl]                     ; 08:5DC8
    ld   d,$00                      ; 08:5DC9
    ld   hl,$D0FF                   ; 08:5DCB
    add  hl,bc                      ; 08:5DCE
    ld   a,[hl]                     ; 08:5DCF
    and  a                          ; 08:5DD0
    jr   z,Code085DD7               ; 08:5DD1
    ld   a,e                        ; 08:5DD3
    and  a                          ; 08:5DD4
    jr   nz,Code085DE5              ; 08:5DD5
Code085DD7:
    ld   hl,Data085CA4              ; 08:5DD7
    add  hl,de                      ; 08:5DDA
    ld   a,[hl]                     ; 08:5DDB
    ldh  [<$FFAC],a                 ; 08:5DDC
    ld   a,$0F                      ; 08:5DDE
    ld   [W_PlayerState],a          ; 08:5DE0
    jr   Code085DF6                 ; 08:5DE3
Code085DE5:
    push de                         ; 08:5DE5
    ld   de,$0002                   ; 08:5DE6
    ld   hl,Data085CA4              ; 08:5DE9
    add  hl,de                      ; 08:5DEC
    ld   a,[hl]                     ; 08:5DED
    ldh  [<$FFAC],a                 ; 08:5DEE
    ld   a,$16                      ; 08:5DF0
    ld   [W_PlayerState],a          ; 08:5DF2
    pop  de                         ; 08:5DF5
Code085DF6:
    xor  a                          ; 08:5DF6
    ld   [$C1C7],a                  ; 08:5DF7
    ld   [$C1FB],a                  ; 08:5DFA
    ld   [$C1FC],a                  ; 08:5DFD
    ld   a,[$C1F0]                  ; 08:5E00
    bit  7,a                        ; 08:5E03
    jr   z,Code085E09               ; 08:5E05
    cpl                             ; 08:5E07
    inc  a                          ; 08:5E08
Code085E09:
    cp   $0C                        ; 08:5E09
    jr   nc,Code085E10              ; 08:5E0B
    xor  a                          ; 08:5E0D
    jr   Code085E13                 ; 08:5E0E
Code085E10:
    ld   a,[$C1F0]                  ; 08:5E10
Code085E13:
    ldh  [<$FFAB],a                 ; 08:5E13
    and  a                          ; 08:5E15
    jr   nz,Code085E1C              ; 08:5E16
    xor  a                          ; 08:5E18
    ld   [$C1C2],a                  ; 08:5E19
Code085E1C:
    ld   hl,$D11D                   ; 08:5E1C
    add  hl,bc                      ; 08:5E1F
    ld   [hl],$01                   ; 08:5E20
    ldh  a,[<H_ButtonsHeld]         ; 08:5E22
    and  $C0                        ; 08:5E24
    jr   z,Code085E2D               ; 08:5E26
    ld   a,$02                      ; 08:5E28
    ld   [$C1C2],a                  ; 08:5E2A
Code085E2D:
    ld   a,[W_PlayerSize]           ; 08:5E2D
    sla  a                          ; 08:5E30
    ld   l,a                        ; 08:5E32
    ld   h,$00                      ; 08:5E33
    add  hl,de                      ; 08:5E35
    ld   de,Data085CA7              ; 08:5E36
    add  hl,de                      ; 08:5E39
    ld   a,[hl]                     ; 08:5E3A
    ldh  [<$FFF2],a                 ; 08:5E3B
    ld   de,$0008                   ; 08:5E3D
    ld   a,$01                      ; 08:5E40
    call Return0010B2               ; 08:5E42
Code085E45:
    scf                             ; 08:5E45
    ret                             ; 08:5E46

    scf                             ; 08:5E47
    ccf                             ; 08:5E48
    ret                             ; 08:5E49

Sub085E4A:
    ld   hl,W_SpriteXLow            ; 08:5E4A
    add  hl,bc                      ; 08:5E4D
    ld   a,[hl]                     ; 08:5E4E
    ldh  [<$FF97],a                 ; 08:5E4F
    ld   hl,W_SpriteXHigh           ; 08:5E51
    add  hl,bc                      ; 08:5E54
    ld   d,[hl]                     ; 08:5E55
    ld   hl,W_SpriteYLow            ; 08:5E56
    add  hl,bc                      ; 08:5E59
    ld   a,[hl]                     ; 08:5E5A
    ldh  [<$FF99],a                 ; 08:5E5B
    ld   e,$06                      ; 08:5E5D
    ld   a,d                        ; 08:5E5F
    cp   $10                        ; 08:5E60
    jr   c,Code085E66               ; 08:5E62
    ld   e,$07                      ; 08:5E64
Code085E66:
    ld   a,e                        ; 08:5E66
    ldh  [<SVBK],a                  ; 08:5E67
    ld   a,d                        ; 08:5E69
    and  $0F                        ; 08:5E6A
    ld   d,a                        ; 08:5E6C
    ld   e,$00                      ; 08:5E6D
    ld   hl,W_SubLv16x16Tilemap     ; 08:5E6F
    add  hl,de                      ; 08:5E72
    ld   d,$00                      ; 08:5E73
    ldh  a,[<$FF99]                 ; 08:5E75
    ld   e,a                        ; 08:5E77
    add  hl,de                      ; 08:5E78
    ld   d,$00                      ; 08:5E79
    ldh  a,[<$FF97]                 ; 08:5E7B
    swap a                          ; 08:5E7D
    ld   e,a                        ; 08:5E7F
    ld   d,$00                      ; 08:5E80
    add  hl,de                      ; 08:5E82
    ld   [hl],$95                   ; 08:5E83
    xor  a                          ; 08:5E85
    ldh  [<SVBK],a                  ; 08:5E86
    ret                             ; 08:5E88

Data085E89:                         ; 08:5E89
.db $0F,$0F,$1B,$1B,$1F,$36,$37,$52,\
    $59,$5F,$93,$4B,$4B,$57,$57
Data085E98:                         ; 08:5E98
.db $04,$08,$03,$07,$06,$03,$03,$04,\
    $04,$04,$03,$02,$06,$02,$06
Data085EA7:                         ; 08:5EA7
.db $00,$00,$01,$01,$00,$00,$00,$00,\
    $00,$00,$00,$02,$02,$02,$02
Data085EB6:                         ; 08:5EB6
.db $00,$04,$00,$00,$00,$08,$00,$04,\
    $00,$05,$00,$01,$00,$09,$00,$05,\
    $00,$06,$00,$02,$00,$04,$00,$00,\
    $00,$04,$00,$00,$00,$04,$00,$00,\
    $00,$04,$00,$00,$00,$04,$00,$00,\
    $00,$04,$00,$00,$00,$04,$00,$00,\
    $00,$08,$00,$04,$00,$04,$00,$00,\
    $00,$09,$00,$05
Code085EF2:
    ld   a,[W_SublevelID]           ; 08:5EF2
    ldh  [<$FF99],a                 ; 08:5EF5
    ld   a,[W_SPFlag]               ; 08:5EF7
    and  a                          ; 08:5EFA
    jr   z,Code085F03               ; 08:5EFB
    ldh  a,[<$FF99]                 ; 08:5EFD
    add  $40                        ; 08:5EFF
    ldh  [<$FF99],a                 ; 08:5F01
Code085F03:
    ld   hl,W_SpriteXHigh           ; 08:5F03
    add  hl,bc                      ; 08:5F06
    ld   a,[hl]                     ; 08:5F07
    ldh  [<$FF97],a                 ; 08:5F08
    ld   de,$0000                   ; 08:5F0A
Code085F0D:
    ld   hl,Data085E89              ; 08:5F0D
    add  hl,de                      ; 08:5F10
    ldh  a,[<$FF99]                 ; 08:5F11
    cp   [hl]                       ; 08:5F13
    jr   nz,Code085F1F              ; 08:5F14
    ld   hl,Data085E98              ; 08:5F16
    add  hl,de                      ; 08:5F19
    ldh  a,[<$FF97]                 ; 08:5F1A
    cp   [hl]                       ; 08:5F1C
    jr   z,Code085F29               ; 08:5F1D
Code085F1F:
    inc  e                          ; 08:5F1F
    ld   a,$0F                      ; 08:5F20
    cp   e                          ; 08:5F22
    jr   nz,Code085F0D              ; 08:5F23
    call Sub0029EF                  ; 08:5F25
    ret                             ; 08:5F28

Code085F29:
    ld   hl,$D11D                   ; 08:5F29
    add  hl,bc                      ; 08:5F2C
    ld   a,e                        ; 08:5F2D
    ld   [hl],a                     ; 08:5F2E
    ld   hl,Data085EA7              ; 08:5F2F
    add  hl,de                      ; 08:5F32
    ld   a,[hl]                     ; 08:5F33
    ld   hl,W_SpriteSubstate        ; 08:5F34
    add  hl,bc                      ; 08:5F37
    ld   [hl],a                     ; 08:5F38
    ld   a,e                        ; 08:5F39
    cp   $0E                        ; 08:5F3A
    jr   z,Return085F6F             ; 08:5F3C

Sub085F3E:
    push bc                         ; 08:5F3E
    sla  e                          ; 08:5F3F
    sla  e                          ; 08:5F41
    ld   hl,Data085EB6              ; 08:5F43
    add  hl,de                      ; 08:5F46
    ldi  a,[hl]                     ; 08:5F47
    ld   e,a                        ; 08:5F48
    ldi  a,[hl]                     ; 08:5F49
    ld   d,a                        ; 08:5F4A
    ldi  a,[hl]                     ; 08:5F4B
    ld   c,a                        ; 08:5F4C
    ld   b,[hl]                     ; 08:5F4D
    xor  a                          ; 08:5F4E
    ldh  [<$FF97],a                 ; 08:5F4F
    ld   a,$06                      ; 08:5F51
    ldh  [<SVBK],a                  ; 08:5F53
Code085F55:
    ld   hl,W_SubLv16x16Tilemap     ; 08:5F55
    add  hl,de                      ; 08:5F58
    ld   a,[hl]                     ; 08:5F59
    ld   hl,W_SubLv16x16Tilemap     ; 08:5F5A
    add  hl,bc                      ; 08:5F5D
    ld   [hl],a                     ; 08:5F5E
    inc  de                         ; 08:5F5F
    inc  bc                         ; 08:5F60
    ldh  a,[<$FF97]                 ; 08:5F61
    add  $01                        ; 08:5F63
    ldh  [<$FF97],a                 ; 08:5F65
    and  a                          ; 08:5F67
    jr   nz,Code085F55              ; 08:5F68
    ld   a,$00                      ; 08:5F6A
    ldh  [<SVBK],a                  ; 08:5F6C
    pop  bc                         ; 08:5F6E
Return085F6F:
    ret                             ; 08:5F6F

Data085F70:                         ; 08:5F70
.db $40,$B0,$00,$00,$00,$00,$00,$00,\
    $00,$00,$D0,$00,$00,$00,$00
Data085F7F:                         ; 08:5F7F
.db $00,$04,$01,$05,$02,$00,$00,$00,\
    $00,$00,$00,$00,$04,$00,$05
Data085F8E:                         ; 08:5F8E
.db $20,$04,$20,$08,$20,$05,$20,$09,\
    $20,$06,$20,$04,$20,$04,$20,$04,\
    $20,$04,$20,$04,$10,$04,$20,$04,\
    $20,$08,$20,$04,$20,$09
Code085FAC:
    call Sub085FB0                  ; 08:5FAC
    ret                             ; 08:5FAF

Sub085FB0:
    ld   hl,W_SpriteSubstate        ; 08:5FB0
    add  hl,bc                      ; 08:5FB3
    ld   a,[hl]                     ; 08:5FB4
    rst  $00                        ; 08:5FB5
.dw Code085FBC                      ; 08:5FB6
.dw Code086137                      ; 08:5FB8
.dw Code0861F2                      ; 08:5FBA
Code085FBC:
    ld   hl,$D11D                   ; 08:5FBC
    add  hl,bc                      ; 08:5FBF
    ld   e,[hl]                     ; 08:5FC0
    ld   d,$00                      ; 08:5FC1
    sla  e                          ; 08:5FC3
    ld   hl,Data085F8E              ; 08:5FC5
    add  hl,de                      ; 08:5FC8
    ldi  a,[hl]                     ; 08:5FC9
    ldh  [<$FF97],a                 ; 08:5FCA
    ld   a,e                        ; 08:5FCC
    cp   $14                        ; 08:5FCD
    jr   nz,Code085FE2              ; 08:5FCF
    ldh  a,[<$FFB9]                 ; 08:5FD1
    cp   [hl]                       ; 08:5FD3
    jp   nz,Return0860BB            ; 08:5FD4
    ld   hl,$FF97                   ; 08:5FD7
    ldh  a,[<$FFB8]                 ; 08:5FDA
    cp   [hl]                       ; 08:5FDC
    jp   c,Return0860BB             ; 08:5FDD
    jr   Code085FF1                 ; 08:5FE0
Code085FE2:
    ldh  a,[<$FFB9]                 ; 08:5FE2
    cp   [hl]                       ; 08:5FE4
    jp   nz,Return0860BB            ; 08:5FE5
    ld   hl,$FF97                   ; 08:5FE8
    ldh  a,[<$FFB8]                 ; 08:5FEB
    cp   [hl]                       ; 08:5FED
    jp   c,Return0860BB             ; 08:5FEE
Code085FF1:
    srl  e                          ; 08:5FF1
    ld   hl,Data085F70              ; 08:5FF3
    add  hl,de                      ; 08:5FF6
    ld   a,[hl]                     ; 08:5FF7
    ldh  [<$FF97],a                 ; 08:5FF8
    add  $24                        ; 08:5FFA
    ldh  [<$FF98],a                 ; 08:5FFC
    ld   hl,$FF97                   ; 08:5FFE
    ldh  a,[<$FFA9]                 ; 08:6001
    cp   [hl]                       ; 08:6003
    jr   c,Code08601D               ; 08:6004
    ld   hl,$FF98                   ; 08:6006
    cp   [hl]                       ; 08:6009
    jr   nc,Code08601D              ; 08:600A
    ld   a,$2F                      ; 08:600C
    ldh  [<$FFF3],a                 ; 08:600E
Code086010:
    ld   hl,W_SpriteStatus          ; 08:6010
    add  hl,bc                      ; 08:6013
    ld   [hl],$00                   ; 08:6014
    ld   hl,W_SpriteID              ; 08:6016
    add  hl,bc                      ; 08:6019
    ld   [hl],$00                   ; 08:601A
    ret                             ; 08:601C

Code08601D:
    ld   a,[W_SublevelID]           ; 08:601D
    ldh  [<$FF97],a                 ; 08:6020
    ld   a,[W_SPFlag]               ; 08:6022
    and  a                          ; 08:6025
    jr   z,Code08602E               ; 08:6026
    ldh  a,[<$FF97]                 ; 08:6028
    add  $40                        ; 08:602A
    ldh  [<$FF97],a                 ; 08:602C
Code08602E:
    ldh  a,[<$FF97]                 ; 08:602E
    cp   $5F                        ; 08:6030
    jr   z,Code08603C               ; 08:6032
    cp   $93                        ; 08:6034
    jr   z,Code08603C               ; 08:6036
    cp   $0F                        ; 08:6038
    jr   nz,Code086040              ; 08:603A
Code08603C:
    ld   a,$30                      ; 08:603C
    ldh  [<$FFF3],a                 ; 08:603E
Code086040:
    call Sub0860BC                  ; 08:6040
    ldh  a,[<$FFA8]                 ; 08:6043
    ldh  [<$FF97],a                 ; 08:6045
    ld   hl,$D11D                   ; 08:6047
    add  hl,bc                      ; 08:604A
    ld   e,[hl]                     ; 08:604B
    ld   d,$00                      ; 08:604C
    ld   hl,Data085F7F              ; 08:604E
    add  hl,de                      ; 08:6051
    ld   a,[hl]                     ; 08:6052
    ldh  [<$FFC4],a                 ; 08:6053
    ldh  [<$FFB9],a                 ; 08:6055
    ldh  [<$FFA8],a                 ; 08:6057
    ld   [$C1EE],a                  ; 08:6059
    ld   hl,$FFA8                   ; 08:605C
    ldh  a,[<$FF97]                 ; 08:605F
    sub  [hl]                       ; 08:6061
    ldh  [<$FF97],a                 ; 08:6062
    ldh  a,[<$FFB8]                 ; 08:6064
    add  $B0                        ; 08:6066
    ld   e,a                        ; 08:6068
    ldh  a,[<$FFB9]                 ; 08:6069
    adc  $00                        ; 08:606B
    ld   d,a                        ; 08:606D
    srl  d                          ; 08:606E
    rr   e                          ; 08:6070
    srl  d                          ; 08:6072
    rr   e                          ; 08:6074
    srl  d                          ; 08:6076
    rr   e                          ; 08:6078
    srl  d                          ; 08:607A
    rr   e                          ; 08:607C
    ld   a,e                        ; 08:607E
    ld   [$D2D2],a                  ; 08:607F
    ld   a,d                        ; 08:6082
    ld   [$D2D3],a                  ; 08:6083
    ld   de,$0000                   ; 08:6086
Code086089:
    ld   hl,W_SpriteStatus          ; 08:6089
    add  hl,de                      ; 08:608C
    ld   a,[hl]                     ; 08:608D
    and  a                          ; 08:608E
    jr   z,Code0860B2               ; 08:608F
    ld   hl,W_SpriteXHigh           ; 08:6091
    add  hl,de                      ; 08:6094
    ld   a,[hl]                     ; 08:6095
    push hl                         ; 08:6096
    ld   hl,$FF97                   ; 08:6097
    sub  [hl]                       ; 08:609A
    pop  hl                         ; 08:609B
    ld   [hl],a                     ; 08:609C
    ld   hl,W_SpriteID              ; 08:609D
    add  hl,de                      ; 08:60A0
    ld   a,[hl]                     ; 08:60A1
    cp   $5F                        ; 08:60A2
    jr   z,Code0860AA               ; 08:60A4
    cp   $32                        ; 08:60A6
    jr   nz,Code0860B2              ; 08:60A8
Code0860AA:
    ld   [hl],$00                   ; 08:60AA
    ld   hl,W_SpriteStatus          ; 08:60AC
    add  hl,de                      ; 08:60AF
    ld   [hl],$00                   ; 08:60B0
Code0860B2:
    inc  e                          ; 08:60B2
    ld   a,$0F                      ; 08:60B3
    cp   e                          ; 08:60B5
    jr   nz,Code086089              ; 08:60B6
    jp   Code086010                 ; 08:60B8
Return0860BB:
    ret                             ; 08:60BB

Sub0860BC:
    push bc                         ; 08:60BC
    ld   hl,$D11D                   ; 08:60BD
    add  hl,bc                      ; 08:60C0
    ld   c,$26                      ; 08:60C1
    ld   de,$0270                   ; 08:60C3
    ld   a,[hl]                     ; 08:60C6
    cp   $08                        ; 08:60C7
    jr   z,Code0860F5               ; 08:60C9
    ld   c,$75                      ; 08:60CB
    ld   de,$01AC                   ; 08:60CD
    cp   $09                        ; 08:60D0
    jr   z,Code0860F5               ; 08:60D2
    ld   b,$76                      ; 08:60D4
    ld   c,$01                      ; 08:60D6
    ld   de,$02B0                   ; 08:60D8
    cp   $0A                        ; 08:60DB
    jr   z,Code086103               ; 08:60DD
    cp   $0C                        ; 08:60DF
    jr   nz,Code08611D              ; 08:60E1
    ld   a,$06                      ; 08:60E3
    ldh  [<SVBK],a                  ; 08:60E5
    ld   hl,$D6B0                   ; 08:60E7
    ld   a,$3E                      ; 08:60EA
    ldi  [hl],a                     ; 08:60EC
    ldi  [hl],a                     ; 08:60ED
    ldi  [hl],a                     ; 08:60EE
    ld   [hl],a                     ; 08:60EF
    xor  a                          ; 08:60F0
    ldh  [<SVBK],a                  ; 08:60F1
    jr   Code08611D                 ; 08:60F3
Code0860F5:
    ld   a,$06                      ; 08:60F5
    ldh  [<SVBK],a                  ; 08:60F7
    ld   hl,W_SubLv16x16Tilemap     ; 08:60F9
    add  hl,de                      ; 08:60FC
    ld   [hl],c                     ; 08:60FD
    xor  a                          ; 08:60FE
    ldh  [<SVBK],a                  ; 08:60FF
    jr   Code08611D                 ; 08:6101
Code086103:
    ld   a,$06                      ; 08:6103
    ldh  [<SVBK],a                  ; 08:6105
    ld   hl,W_SubLv16x16Tilemap     ; 08:6107
    add  hl,de                      ; 08:610A
    ld   a,c                        ; 08:610B
    ldi  [hl],a                     ; 08:610C
    ldi  [hl],a                     ; 08:610D
    ld   [hl],b                     ; 08:610E
    inc  hl                         ; 08:610F
    ld   [hl],a                     ; 08:6110
    ld   de,$03A0                   ; 08:6111
    ld   hl,W_SubLv16x16Tilemap     ; 08:6114
    add  hl,de                      ; 08:6117
    ld   [hl],$75                   ; 08:6118
    xor  a                          ; 08:611A
    ldh  [<SVBK],a                  ; 08:611B
Code08611D:
    pop  bc                         ; 08:611D
    ret                             ; 08:611E

Data08611F:                         ; 08:611F
.db $B0,$80,$40,$00,$40,$80,$40,$00
Data086127:                         ; 08:6127
.db $00,$03,$00,$04,$00,$05,$00,$00,\
    $00,$07,$00,$08,$00,$09,$00,$00
Code086137:
    ld   hl,$D0E1                   ; 08:6137
    add  hl,bc                      ; 08:613A
    ld   a,[hl]                     ; 08:613B
    and  a                          ; 08:613C
    jr   nz,Code0861A9              ; 08:613D
    ld   hl,$D11D                   ; 08:613F
    add  hl,bc                      ; 08:6142
    ld   a,[hl]                     ; 08:6143
    sub  $02                        ; 08:6144
    ld   e,a                        ; 08:6146
    ld   d,$00                      ; 08:6147
    sla  e                          ; 08:6149
    sla  e                          ; 08:614B
    sla  e                          ; 08:614D
    ld   hl,$D0D2                   ; 08:614F
    add  hl,bc                      ; 08:6152
    ld   a,[hl]                     ; 08:6153
    sla  a                          ; 08:6154
    ld   l,a                        ; 08:6156
    ld   h,$00                      ; 08:6157
    add  hl,de                      ; 08:6159
    ld   a,l                        ; 08:615A
    ldh  [<$FF97],a                 ; 08:615B
    ld   de,Data086127              ; 08:615D
    add  hl,de                      ; 08:6160
    ldh  a,[<$FFA7]                 ; 08:6161
    sub  [hl]                       ; 08:6163
    inc  hl                         ; 08:6164
    ldh  a,[<$FFA8]                 ; 08:6165
    sbc  [hl]                       ; 08:6167
    bit  7,a                        ; 08:6168
    jr   nz,Return0861D9            ; 08:616A
    ldh  a,[<$FF97]                 ; 08:616C
    srl  a                          ; 08:616E
    ld   e,a                        ; 08:6170
    ld   d,$00                      ; 08:6171
    ld   hl,Data08611F              ; 08:6173
    add  hl,de                      ; 08:6176
    ld   a,[hl]                     ; 08:6177
    ldh  [<$FF97],a                 ; 08:6178
    add  $24                        ; 08:617A
    ldh  [<$FF98],a                 ; 08:617C
    ld   hl,$FF97                   ; 08:617E
    ldh  a,[<$FFA9]                 ; 08:6181
    cp   [hl]                       ; 08:6183
    jr   c,Code08619E               ; 08:6184
    ld   hl,$FF98                   ; 08:6186
    cp   [hl]                       ; 08:6189
    jr   nc,Code08619E              ; 08:618A
    ld   a,$2F                      ; 08:618C
    ldh  [<$FFF3],a                 ; 08:618E
    ld   hl,$D0D2                   ; 08:6190
    add  hl,bc                      ; 08:6193
    inc  [hl]                       ; 08:6194
    ld   a,[hl]                     ; 08:6195
    cp   $03                        ; 08:6196
    jr   nz,Return08619D            ; 08:6198
    call Sub0029EF                  ; 08:619A
Return08619D:
    ret                             ; 08:619D

Code08619E:
    ld   hl,$D0E1                   ; 08:619E
    add  hl,bc                      ; 08:61A1
    ld   [hl],$01                   ; 08:61A2
    ld   a,$30                      ; 08:61A4
    ldh  [<$FFF3],a                 ; 08:61A6
    ret                             ; 08:61A8

Code0861A9:
    ld   hl,$D11D                   ; 08:61A9
    add  hl,bc                      ; 08:61AC
    ld   e,[hl]                     ; 08:61AD
    ld   d,$00                      ; 08:61AE
    sla  e                          ; 08:61B0
    ld   hl,Data085F8E              ; 08:61B2
    add  hl,de                      ; 08:61B5
    ldi  a,[hl]                     ; 08:61B6
    ldh  [<$FF97],a                 ; 08:61B7
    ldh  a,[<$FFB9]                 ; 08:61B9
    cp   [hl]                       ; 08:61BB
    jp   nz,Return0861D9            ; 08:61BC
    ld   hl,$FF97                   ; 08:61BF
    ldh  a,[<$FFB8]                 ; 08:61C2
    cp   [hl]                       ; 08:61C4
    jp   c,Return0861D9             ; 08:61C5
    ld   a,e                        ; 08:61C8
    srl  a                          ; 08:61C9
    cp   $0E                        ; 08:61CB
    jr   nz,Code0861D6              ; 08:61CD
    push de                         ; 08:61CF
    srl  e                          ; 08:61D0
    call Sub085F3E                  ; 08:61D2
    pop  de                         ; 08:61D5
Code0861D6:
    jp   Code08601D                 ; 08:61D6
Return0861D9:
    ret                             ; 08:61D9

Data0861DA:                         ; 08:61DA
.db $B0,$B0,$40,$40,$B0,$40,$B0,$B0
Data0861E2:                         ; 08:61E2
.db $00,$02,$F0,$03,$F0,$06,$00,$08,\
    $10,$02,$E0,$04,$20,$06,$10,$09
Code0861F2:
    ld   hl,$D0E1                   ; 08:61F2
    add  hl,bc                      ; 08:61F5
    ld   a,[hl]                     ; 08:61F6
    and  a                          ; 08:61F7
    jr   nz,Code0861A9              ; 08:61F8
    ld   hl,$D11D                   ; 08:61FA
    add  hl,bc                      ; 08:61FD
    ld   a,[hl]                     ; 08:61FE
    sub  $0B                        ; 08:61FF
    ld   e,a                        ; 08:6201
    ld   d,$00                      ; 08:6202
    sla  e                          ; 08:6204
    sla  e                          ; 08:6206
    ld   hl,$D0D2                   ; 08:6208
    add  hl,bc                      ; 08:620B
    ld   a,[hl]                     ; 08:620C
    sla  a                          ; 08:620D
    ld   l,a                        ; 08:620F
    ld   h,$00                      ; 08:6210
    add  hl,de                      ; 08:6212
    ld   a,l                        ; 08:6213
    ldh  [<$FF97],a                 ; 08:6214
    ld   de,Data0861E2              ; 08:6216
    add  hl,de                      ; 08:6219
    ldh  a,[<$FFA7]                 ; 08:621A
    sub  [hl]                       ; 08:621C
    inc  hl                         ; 08:621D
    ldh  a,[<$FFA8]                 ; 08:621E
    sbc  [hl]                       ; 08:6220
    bit  7,a                        ; 08:6221
    jr   nz,Return086262            ; 08:6223
    ldh  a,[<$FF97]                 ; 08:6225
    srl  a                          ; 08:6227
    ld   e,a                        ; 08:6229
    ld   d,$00                      ; 08:622A
    ld   hl,Data0861DA              ; 08:622C
    add  hl,de                      ; 08:622F
    ld   a,[hl]                     ; 08:6230
    ldh  [<$FF97],a                 ; 08:6231
    add  $24                        ; 08:6233
    ldh  [<$FF98],a                 ; 08:6235
    ld   hl,$FF97                   ; 08:6237
    ldh  a,[<$FFA9]                 ; 08:623A
    cp   [hl]                       ; 08:623C
    jr   c,Code086257               ; 08:623D
    ld   hl,$FF98                   ; 08:623F
    cp   [hl]                       ; 08:6242
    jr   nc,Code086257              ; 08:6243
    ld   a,$2F                      ; 08:6245
    ldh  [<$FFF3],a                 ; 08:6247
    ld   hl,$D0D2                   ; 08:6249
    add  hl,bc                      ; 08:624C
    inc  [hl]                       ; 08:624D
    ld   a,[hl]                     ; 08:624E
    cp   $02                        ; 08:624F
    jr   nz,Return086256            ; 08:6251
    call Sub0029EF                  ; 08:6253
Return086256:
    ret                             ; 08:6256

Code086257:
    ld   hl,$D0E1                   ; 08:6257
    add  hl,bc                      ; 08:625A
    ld   [hl],$01                   ; 08:625B
    ld   a,$30                      ; 08:625D
    ldh  [<$FFF3],a                 ; 08:625F
    ret                             ; 08:6261

Return086262:
    ret                             ; 08:6262

Code086263:
    ld   a,[$C283]                  ; 08:6263
    and  a                          ; 08:6266
    jr   z,Return086274             ; 08:6267
    xor  a                          ; 08:6269
    ld   hl,W_SpriteStatus          ; 08:626A
    add  hl,bc                      ; 08:626D
    ld   [hl],a                     ; 08:626E
    ld   hl,W_SpriteID              ; 08:626F
    add  hl,bc                      ; 08:6272
    ld   [hl],a                     ; 08:6273
Return086274:
    ret                             ; 08:6274

Code086275:
    call Sub0025CB                  ; 08:6275
    ret  c                          ; 08:6278
    ld   hl,W_SpriteXHigh           ; 08:6279
    add  hl,bc                      ; 08:627C
    push hl                         ; 08:627D
    ld   hl,W_SpriteXLow            ; 08:627E
    add  hl,bc                      ; 08:6281
    ldh  a,[<$FFA7]                 ; 08:6282
    sub  [hl]                       ; 08:6284
    pop  hl                         ; 08:6285
    ldh  a,[<$FFA8]                 ; 08:6286
    sbc  [hl]                       ; 08:6288
    bit  7,a                        ; 08:6289
    ret  nz                         ; 08:628B
    ld   hl,$D11D                   ; 08:628C
    add  hl,bc                      ; 08:628F
    ld   a,[hl]                     ; 08:6290
    and  a                          ; 08:6291
    ret  nz                         ; 08:6292
    ld   [hl],$01                   ; 08:6293
    call Sub08646D                  ; 08:6295
    call Sub0863AD                  ; 08:6298
    ld   de,$0000                   ; 08:629B
Code08629E:
    ld   hl,W_SpriteStatus          ; 08:629E
    add  hl,de                      ; 08:62A1
    ld   a,[hl]                     ; 08:62A2
    and  a                          ; 08:62A3
    jr   z,Code0862B7               ; 08:62A4
    ld   hl,W_SpriteID              ; 08:62A6
    add  hl,de                      ; 08:62A9
    ld   a,[hl]                     ; 08:62AA
    cp   $19                        ; 08:62AB
    jr   nz,Code0862B7              ; 08:62AD
    ld   [hl],$00                   ; 08:62AF
    ld   hl,W_SpriteStatus          ; 08:62B1
    add  hl,de                      ; 08:62B4
    ld   [hl],$00                   ; 08:62B5
Code0862B7:
    inc  e                          ; 08:62B7
    ld   a,e                        ; 08:62B8
    cp   $0F                        ; 08:62B9
    jr   nz,Code08629E              ; 08:62BB
    ret                             ; 08:62BD

Data0862BE:                         ; 08:62BE
.db $9A,$09,$0A,$00,$F0,$00,$DE,$00,\
    $E5,$00,$DC,$00,$E8,$00,$E6,$00,\
    $DE,$00,$F4,$00,$ED,$00,$E8,$9A,\
    $49,$0A,$00,$F0,$00,$DA,$00,$EB,\
    $00,$E9,$00,$F4,$00,$F3,$00,$E8,\
    $00,$E7,$00,$DE,$00,$FB,$00
Data0862ED:                         ; 08:62ED
.db $9A,$0B,$0A,$00,$F0,$00,$DE,$00,\
    $E5,$00,$DC,$00,$E8,$00,$E6,$00,\
    $DE,$00,$F4,$00,$ED,$00,$E8,$9A,\
    $4B,$0A,$00,$F0,$00,$DA,$00,$EB,\
    $00,$E9,$00,$F4,$00,$F3,$00,$E8,\
    $00,$E7,$00,$DE,$00,$FB,$00
Data08631C:                         ; 08:631C
.db $9A,$A4,$01,$00,$D4,$9A,$AD,$01,\
    $00,$D3,$9A,$B5,$01,$00,$D2,$00
Data08632C:                         ; 08:632C
.db $9A,$A4,$01,$00,$D8,$9A,$AD,$01,\
    $00,$D7,$9A,$B5,$01,$00,$D6,$00
Data08633C:                         ; 08:633C
.db $9A,$AD,$01,$00,$D5,$00
Data086342:                         ; 08:6342
.db $9A,$AF,$01,$00,$D2,$00
Data086348:                         ; 08:6348
.db $9A,$AD,$01,$00,$D3,$00
Data08634E:                         ; 08:634E
.db $9A,$AD,$01,$00,$D4,$00
Data086354:                         ; 08:6354
.db $9A,$AD,$01,$00,$D1,$00
Data08635A:                         ; 08:635A
.db $9A,$AD,$01,$00,$D6,$00
Data086360:                         ; 08:6360
.db $9A,$AD,$01,$00,$D7,$00
Data086366:                         ; 08:6366
.db $9A,$AD,$01,$00,$D8,$00
Data08636C:                         ; 08:636C
.db $9A,$AD,$01,$00,$D5,$00
DataPtrs086372:                     ; 08:6372
.dw Data08631C, Data08632C, Data08633C
DataPtrs086378:                     ; 08:6378
.dw Data086342, Data086348, Data08634E, Data086354,\
    Data08635A, Data086360, Data086366, Data08636C
Data086388:                         ; 08:6388
.db $10,$00,$10,$00,$06,$00
Data08638E:                         ; 08:638E
.db $06,$00,$06,$00,$06,$00,$06,$00,\
    $06,$00,$06,$00,$06,$00,$06,$00
DataPtrs08639E:                     ; 08:639E
.dw Data0862BE, Data0862ED
Data0863A2:                         ; 08:63A2
.db $00,$00,$00
Data0863A5:                         ; 08:63A5
.db $01,$00,$00,$00,$00,$00,$00,$00

Sub0863AD:
    ld   a,[W_SPFlag]               ; 08:63AD
    and  a                          ; 08:63B0
    jr   nz,Code0863B8              ; 08:63B1
    ld   hl,Data0863A2              ; 08:63B3
    jr   Code0863BB                 ; 08:63B6
Code0863B8:
    ld   hl,Data0863A5              ; 08:63B8
Code0863BB:
    ld   a,[$D2E6]                  ; 08:63BB
    ld   e,a                        ; 08:63BE
    ld   d,$00                      ; 08:63BF
    add  hl,de                      ; 08:63C1
    ld   a,[hl]                     ; 08:63C2
    sla  a                          ; 08:63C3
    ld   e,a                        ; 08:63C5
    ld   hl,DataPtrs08639E          ; 08:63C6
    add  hl,de                      ; 08:63C9
    ld   e,[hl]                     ; 08:63CA
    inc  hl                         ; 08:63CB
    ld   d,[hl]                     ; 08:63CC
    ld   l,e                        ; 08:63CD
    ld   h,d                        ; 08:63CE
    ld   de,$DF01                   ; 08:63CF
    ld   bc,$002F                   ; 08:63D2
    call CopyBytes                  ; 08:63D5
    ld   a,[$D2E6]                  ; 08:63D8
    sla  a                          ; 08:63DB
    ld   e,a                        ; 08:63DD
    ld   d,$00                      ; 08:63DE
    ld   a,[W_SPFlag]               ; 08:63E0
    and  a                          ; 08:63E3
    jr   nz,Code0863F2              ; 08:63E4
    ld   hl,Data086388              ; 08:63E6
    add  hl,de                      ; 08:63E9
    ld   a,[hl]                     ; 08:63EA
    ldh  [<$FF97],a                 ; 08:63EB
    ld   hl,DataPtrs086372          ; 08:63ED
    jr   Code0863FC                 ; 08:63F0
Code0863F2:
    ld   hl,Data08638E              ; 08:63F2
    add  hl,de                      ; 08:63F5
    ld   a,[hl]                     ; 08:63F6
    ldh  [<$FF97],a                 ; 08:63F7
    ld   hl,DataPtrs086378          ; 08:63F9
Code0863FC:
    add  hl,de                      ; 08:63FC
    ldi  a,[hl]                     ; 08:63FD
    ld   e,a                        ; 08:63FE
    ld   d,[hl]                     ; 08:63FF
    ld   l,e                        ; 08:6400
    ld   h,d                        ; 08:6401
    ld   de,$0000                   ; 08:6402
Code086405:
    ldi  a,[hl]                     ; 08:6405
    push hl                         ; 08:6406
    ld   hl,$DF2F                   ; 08:6407
    add  hl,de                      ; 08:640A
    ld   [hl],a                     ; 08:640B
    pop  hl                         ; 08:640C
    inc  e                          ; 08:640D
    ldh  a,[<$FF97]                 ; 08:640E
    cp   e                          ; 08:6410
    jr   nz,Code086405              ; 08:6411
    ret                             ; 08:6413

Data086414:                         ; 08:6414
.db $5D,$5E,$5F,$60,$61,$9D,$62,$63,\
    $64,$65,$66,$67
Data086420:                         ; 08:6420
.db $6A,$69,$68,$00,$6E,$6D,$6C,$00,\
    $00,$6B,$00,$00
Data08642C:                         ; 08:642C
.db $00,$68,$00,$00,$00,$69,$00,$00,\
    $00,$6A,$00,$00,$00,$9C,$00,$00,\
    $00,$6C,$00,$00,$00,$6D,$00,$00,\
    $00,$6E,$00,$00,$00,$6B,$00,$00
Data08644C:                         ; 08:644C
.db $01,$30,$0D
Data08644F:                         ; 08:644F
.db $01,$35,$36,$08,$43,$11,$44,$4D
Data086457:                         ; 08:6457
.db $C0,$FF,$C0,$FF,$C0,$FF
Data08645D:                         ; 08:645D
.db $D0,$FF,$C0,$FF,$C0,$FF,$C0,$FF,\
    $C0,$FF,$C0,$FF,$C0,$FF,$C0,$FF

Sub08646D:
    push bc                         ; 08:646D
    ld   a,[W_SPFlag]               ; 08:646E
    and  a                          ; 08:6471
    jr   nz,Code08648A              ; 08:6472
    ld   hl,Data08644C              ; 08:6474
    ld   de,$0000                   ; 08:6477
Code08647A:
    ld   a,[W_SublevelID]           ; 08:647A
    cp   [hl]                       ; 08:647D
    jr   z,Code0864A0               ; 08:647E
    inc  hl                         ; 08:6480
    inc  e                          ; 08:6481
    ld   a,e                        ; 08:6482
    cp   $03                        ; 08:6483
    jr   nz,Code08647A              ; 08:6485
    jp   Code086595                 ; 08:6487
Code08648A:
    ld   hl,Data08644F              ; 08:648A
    ld   de,$0000                   ; 08:648D
Code086490:
    ld   a,[W_SublevelID]           ; 08:6490
    cp   [hl]                       ; 08:6493
    jr   z,Code0864A0               ; 08:6494
    inc  hl                         ; 08:6496
    inc  e                          ; 08:6497
    ld   a,e                        ; 08:6498
    cp   $08                        ; 08:6499
    jr   nz,Code086490              ; 08:649B
    jp   Code086595                 ; 08:649D
Code0864A0:
    ld   a,e                        ; 08:64A0
    ld   [$D2E6],a                  ; 08:64A1
    ld   hl,Data086457              ; 08:64A4
    ld   a,[W_SPFlag]               ; 08:64A7
    and  a                          ; 08:64AA
    jr   z,Code0864B0               ; 08:64AB
    ld   hl,Data08645D              ; 08:64AD
Code0864B0:
    sla  e                          ; 08:64B0
    add  hl,de                      ; 08:64B2
    ldi  a,[hl]                     ; 08:64B3
    ldh  [<$FF97],a                 ; 08:64B4
    ld   a,[hl]                     ; 08:64B6
    ldh  [<$FF98],a                 ; 08:64B7
    ld   hl,W_SpriteXHigh           ; 08:64B9
    add  hl,bc                      ; 08:64BC
    push hl                         ; 08:64BD
    ld   hl,W_SpriteXLow            ; 08:64BE
    add  hl,bc                      ; 08:64C1
    ldh  a,[<$FF97]                 ; 08:64C2
    add  [hl]                       ; 08:64C4
    ldh  [<$FFA5],a                 ; 08:64C5
    ld   [$D2E4],a                  ; 08:64C7
    pop  hl                         ; 08:64CA
    ldh  a,[<$FF98]                 ; 08:64CB
    adc  [hl]                       ; 08:64CD
    ldh  [<$FFA6],a                 ; 08:64CE
    ld   [$D2E5],a                  ; 08:64D0
    ld   hl,W_SpriteYLow            ; 08:64D3
    add  hl,bc                      ; 08:64D6
    ld   a,[hl]                     ; 08:64D7
    add  $50                        ; 08:64D8
    ldh  [<$FF98],a                 ; 08:64DA
    ld   a,$06                      ; 08:64DC
    ldh  [<SVBK],a                  ; 08:64DE
    ld   bc,$0000                   ; 08:64E0
Code0864E3:
    ld   hl,Data086414              ; 08:64E3
    add  hl,bc                      ; 08:64E6
    ld   a,[hl]                     ; 08:64E7
    ldh  [<$FFA3],a                 ; 08:64E8
    ldh  a,[<$FFA6]                 ; 08:64EA
    ld   d,a                        ; 08:64EC
    ld   e,$00                      ; 08:64ED
    ld   hl,W_SubLv16x16Tilemap     ; 08:64EF
    add  hl,de                      ; 08:64F2
    ld   d,$00                      ; 08:64F3
    ldh  a,[<$FF98]                 ; 08:64F5
    ld   e,a                        ; 08:64F7
    add  hl,de                      ; 08:64F8
    ldh  a,[<$FFA5]                 ; 08:64F9
    swap a                          ; 08:64FB
    ld   e,a                        ; 08:64FD
    add  hl,de                      ; 08:64FE
    ldh  a,[<$FFA3]                 ; 08:64FF
    ldi  [hl],a                     ; 08:6501
    ldh  a,[<$FFA5]                 ; 08:6502
    add  $10                        ; 08:6504
    ldh  [<$FFA5],a                 ; 08:6506
    ldh  a,[<$FFA6]                 ; 08:6508
    adc  $00                        ; 08:650A
    ldh  [<$FFA6],a                 ; 08:650C
    ld   a,c                        ; 08:650E
    cp   $05                        ; 08:650F
    jr   nz,Code08651F              ; 08:6511
    ldh  a,[<$FFA5]                 ; 08:6513
    sub  $60                        ; 08:6515
    ldh  [<$FFA5],a                 ; 08:6517
    ldh  a,[<$FF98]                 ; 08:6519
    add  $10                        ; 08:651B
    ldh  [<$FF98],a                 ; 08:651D
Code08651F:
    inc  c                          ; 08:651F
    ld   a,c                        ; 08:6520
    cp   $0C                        ; 08:6521
    jr   nz,Code0864E3              ; 08:6523
    ld   a,$00                      ; 08:6525
    ldh  [<SVBK],a                  ; 08:6527
    ld   b,$00                      ; 08:6529
    ld   a,[$D2E6]                  ; 08:652B
    ld   c,a                        ; 08:652E
    sla  c                          ; 08:652F
    sla  c                          ; 08:6531
    ld   a,$02                      ; 08:6533
    ldh  [<$FFA1],a                 ; 08:6535
    ld   a,[$D2E4]                  ; 08:6537
    sub  $20                        ; 08:653A
    ldh  [<$FFA5],a                 ; 08:653C
    ld   a,[$D2E5]                  ; 08:653E
    ldh  [<$FFA6],a                 ; 08:6541
    ldh  a,[<$FF98]                 ; 08:6543
    add  $10                        ; 08:6545
    ldh  [<$FF98],a                 ; 08:6547
Code086549:
    ld   a,[W_SPFlag]               ; 08:6549
    and  a                          ; 08:654C
    jr   nz,Code086554              ; 08:654D
    ld   hl,Data086420              ; 08:654F
    jr   Code086557                 ; 08:6552
Code086554:
    ld   hl,Data08642C              ; 08:6554
Code086557:
    add  hl,bc                      ; 08:6557
    ld   a,[hl]                     ; 08:6558
    ldh  [<$FFA3],a                 ; 08:6559
    and  a                          ; 08:655B
    jr   z,Code08657E               ; 08:655C
    ld   a,$06                      ; 08:655E
    ldh  [<SVBK],a                  ; 08:6560
    ldh  a,[<$FFA6]                 ; 08:6562
    ld   d,a                        ; 08:6564
    ld   e,$00                      ; 08:6565
    ld   hl,W_SubLv16x16Tilemap     ; 08:6567
    add  hl,de                      ; 08:656A
    ld   d,$00                      ; 08:656B
    ldh  a,[<$FF98]                 ; 08:656D
    ld   e,a                        ; 08:656F
    add  hl,de                      ; 08:6570
    ldh  a,[<$FFA5]                 ; 08:6571
    swap a                          ; 08:6573
    ld   e,a                        ; 08:6575
    add  hl,de                      ; 08:6576
    ldh  a,[<$FFA3]                 ; 08:6577
    ld   [hl],a                     ; 08:6579
    ld   a,$00                      ; 08:657A
    ldh  [<SVBK],a                  ; 08:657C
Code08657E:
    ldh  a,[<$FFA5]                 ; 08:657E
    add  $40                        ; 08:6580
    ldh  [<$FFA5],a                 ; 08:6582
    ldh  a,[<$FFA6]                 ; 08:6584
    adc  $00                        ; 08:6586
    ldh  [<$FFA6],a                 ; 08:6588
    inc  c                          ; 08:658A
    inc  c                          ; 08:658B
    ldh  a,[<$FFA1]                 ; 08:658C
    dec  a                          ; 08:658E
    ldh  [<$FFA1],a                 ; 08:658F
    bit  7,a                        ; 08:6591
    jr   z,Code086549               ; 08:6593
Code086595:
    pop  bc                         ; 08:6595
    ret                             ; 08:6596
