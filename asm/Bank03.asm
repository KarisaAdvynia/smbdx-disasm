.bank $03 slot 1
.orga $4000

Sub034000:
    ldh  a,[<H_ButtonFlags]         ; 03:4000
    push af                         ; 03:4002
    ldh  a,[<$FF8C]                 ; 03:4003
    push af                         ; 03:4005
    ld   a,$03                      ; 03:4006
    rst  $10                        ; 03:4008
.dl SubL_0B488F                     ; 03:4009
    call Sub0341C2                  ; 03:400C
    jr   Code034020                 ; 03:400F

Sub034011:
    ldh  a,[<H_ButtonFlags]         ; 03:4011
    push af                         ; 03:4013
    ldh  a,[<$FF8C]                 ; 03:4014
    push af                         ; 03:4016
    ld   a,$03                      ; 03:4017
    rst  $10                        ; 03:4019
.dl SubL_0B52C5                     ; 03:401A
    call Sub034033                  ; 03:401D
Code034020:
    pop  af                         ; 03:4020
    ldh  [<$FF8C],a                 ; 03:4021
    pop  af                         ; 03:4023
    ldh  [<H_ButtonFlags],a         ; 03:4024
    ldh  a,[<$FF8C]                 ; 03:4026
    and  $0B                        ; 03:4028
    ret  z                          ; 03:402A
    ld   a,$02                      ; 03:402B
    ldh  [<H_GameState],a           ; 03:402D
    xor  a                          ; 03:402F
    ldh  [<H_GameSubstate],a        ; 03:4030
    ret                             ; 03:4032

Sub034033:
    ld   a,[$C38D]                  ; 03:4033
    and  a                          ; 03:4036
    jp   z,Code034088               ; 03:4037
    ldh  a,[<H_ButtonFlags]         ; 03:403A
    push af                         ; 03:403C
    ldh  a,[<$FF8C]                 ; 03:403D
    push af                         ; 03:403F
    ld   a,[$C535]                  ; 03:4040
    ld   [$C3E9],a                  ; 03:4043
    ld   a,[$C536]                  ; 03:4046
    ld   [$C3EA],a                  ; 03:4049
    ld   a,[$DA6A]                  ; 03:404C
    and  a                          ; 03:404F
    jr   z,Code03405A               ; 03:4050
    call Sub0340C9                  ; 03:4052
    call Sub0340F9                  ; 03:4055
    jr   Code034060                 ; 03:4058
Code03405A:
    call Sub0340F9                  ; 03:405A
    call Sub0340C9                  ; 03:405D
Code034060:
    ld   a,[$C53A]                  ; 03:4060
    ld   [$C1F2],a                  ; 03:4063
    ld   hl,$C1ED                   ; 03:4066
    ld   a,[$C535]                  ; 03:4069
    ldi  [hl],a                     ; 03:406C
    ld   a,[$C536]                  ; 03:406D
    ld   [hl],a                     ; 03:4070
    pop  af                         ; 03:4071
    ldh  [<$FF8C],a                 ; 03:4072
    pop  af                         ; 03:4074
    ldh  [<H_ButtonFlags],a         ; 03:4075
    call Sub0378F6                  ; 03:4077
    xor  a                          ; 03:407A
    ld   [$C53D],a                  ; 03:407B
    ld   [$C53E],a                  ; 03:407E
    ld   [$C5BD],a                  ; 03:4081
    ld   [$C5BE],a                  ; 03:4084
    ret                             ; 03:4087

Code034088:
    call Sub037817                  ; 03:4088
    xor  a                          ; 03:408B
    ldh  [<H_ButtonFlags],a         ; 03:408C
    ldh  [<$FF8C],a                 ; 03:408E
    ld   [$C366],a                  ; 03:4090
    call Sub03421E                  ; 03:4093
    call Sub035A3C                  ; 03:4096
    xor  a                          ; 03:4099
    ld   [$C369],a                  ; 03:409A
    ld   [$C1E3],a                  ; 03:409D
    ld   a,[$DA6A]                  ; 03:40A0
    xor  $01                        ; 03:40A3
    call Sub03737C                  ; 03:40A5
    call Sub03781C                  ; 03:40A8
    xor  a                          ; 03:40AB
    ldh  [<H_ButtonFlags],a         ; 03:40AC
    ldh  [<$FF8C],a                 ; 03:40AE
    inc  a                          ; 03:40B0
    ld   [$C366],a                  ; 03:40B1
    ld   a,$01                      ; 03:40B4
    ld   [$C369],a                  ; 03:40B6
    ld   [$C1E3],a                  ; 03:40B9
    ld   a,[$DA6A]                  ; 03:40BC
    call Sub03737C                  ; 03:40BF
    call Sub0377E4                  ; 03:40C2
    call Sub037817                  ; 03:40C5
    ret                             ; 03:40C8

Sub0340C9:
    call Sub037817                  ; 03:40C9
    ld   a,[$DA74]                  ; 03:40CC
    ldh  [<H_ButtonFlags],a         ; 03:40CF
    ld   a,[$DA76]                  ; 03:40D1
    ldh  [<$FF8C],a                 ; 03:40D4
    xor  a                          ; 03:40D6
    ld   [$C366],a                  ; 03:40D7
    call Sub03421E                  ; 03:40DA
    call Sub0379AD                  ; 03:40DD
    call Sub034979                  ; 03:40E0
    call Sub035A3C                  ; 03:40E3
    xor  a                          ; 03:40E6
    ld   [$C369],a                  ; 03:40E7
    ld   [$C1E3],a                  ; 03:40EA
    ld   a,[$DA6A]                  ; 03:40ED
    xor  $01                        ; 03:40F0
    call Sub03737C                  ; 03:40F2
    call Sub0377DF                  ; 03:40F5
    ret                             ; 03:40F8

Sub0340F9:
    ld   a,[$DA6A]                  ; 03:40F9
    and  a                          ; 03:40FC
    jr   z,Code03410F               ; 03:40FD
    ldh  a,[<$FFB8]                 ; 03:40FF
    push af                         ; 03:4101
    ldh  a,[<$FFB9]                 ; 03:4102
    push af                         ; 03:4104
    ld   a,[$C27B]                  ; 03:4105
    ldh  [<$FFB8],a                 ; 03:4108
    ld   a,[$C27C]                  ; 03:410A
    ldh  [<$FFB9],a                 ; 03:410D
Code03410F:
    call Sub03781C                  ; 03:410F
    ld   a,[$DA75]                  ; 03:4112
    ldh  [<H_ButtonFlags],a         ; 03:4115
    ld   a,[$DA77]                  ; 03:4117
    ldh  [<$FF8C],a                 ; 03:411A
    ld   a,$01                      ; 03:411C
    ld   [$C366],a                  ; 03:411E
    call Sub03421E                  ; 03:4121
    call Sub0379AD                  ; 03:4124
    call Sub034979                  ; 03:4127
    ld   a,[$DA6A]                  ; 03:412A
    and  a                          ; 03:412D
    jr   z,Code034136               ; 03:412E
    pop  af                         ; 03:4130
    ldh  [<$FFB9],a                 ; 03:4131
    pop  af                         ; 03:4133
    ldh  [<$FFB8],a                 ; 03:4134
Code034136:
    ld   a,$01                      ; 03:4136
    ld   [$C369],a                  ; 03:4138
    ld   [$C1E3],a                  ; 03:413B
    ld   a,[$DA6A]                  ; 03:413E
    call Sub03737C                  ; 03:4141
    call Sub0377E4                  ; 03:4144
    ret                             ; 03:4147

SubL_034148:
    ld   a,[$C196]                  ; 03:4148
    and  a                          ; 03:414B
    jr   nz,ReturnL_034156          ; 03:414C
    ld   a,$C0                      ; 03:414E
    ldh  [<$FFA7],a                 ; 03:4150
    ld   a,$FF                      ; 03:4152
    ldh  [<$FFA8],a                 ; 03:4154
ReturnL_034156:
    rst  $18                        ; 03:4156

SubL_034157:
    ldh  a,[<$FFB8]                 ; 03:4157
    ld   [$C27B],a                  ; 03:4159
    ldh  a,[<$FFB9]                 ; 03:415C
    ld   [$C27C],a                  ; 03:415E
    ldh  a,[<$FFBA]                 ; 03:4161
    ld   [$C27D],a                  ; 03:4163
    ldh  a,[<$FFBB]                 ; 03:4166
    ld   [$C27E],a                  ; 03:4168
    ldh  a,[<$FFA7]                 ; 03:416B
    ld   [$C1CA],a                  ; 03:416D
    ldh  a,[<$FFA8]                 ; 03:4170
    ld   [$C1CB],a                  ; 03:4172
    ldh  a,[<$FFA9]                 ; 03:4175
    ld   [$C1CC],a                  ; 03:4177
    ldh  a,[<$FFAA]                 ; 03:417A
    ld   [$C1CD],a                  ; 03:417C
    xor  a                          ; 03:417F
    ld   [$C1D6],a                  ; 03:4180
    ld   [$C1D7],a                  ; 03:4183
    ld   [$C366],a                  ; 03:4186
    ld   hl,$C1E3                   ; 03:4189
    ld   [hl],$01                   ; 03:418C
    ldh  a,[<$FFA8]                 ; 03:418E
    and  a                          ; 03:4190
    jr   nz,Code0341A9              ; 03:4191
    ldh  a,[<$FFA7]                 ; 03:4193
    cp   $08                        ; 03:4195
    jr   c,Code0341A9               ; 03:4197
    ld   [hl],$00                   ; 03:4199
    cp   $30                        ; 03:419B
    jr   c,Code0341A9               ; 03:419D
    ld   a,$30                      ; 03:419F
    ldh  [<$FFA7],a                 ; 03:41A1
    xor  a                          ; 03:41A3
    ld   [$C1C2],a                  ; 03:41A4
    jr   Code0341B7                 ; 03:41A7
Code0341A9:
    ld   a,$10                      ; 03:41A9
    ld   [$C25E],a                  ; 03:41AB
    call Sub035680                  ; 03:41AE
    call Sub0361DF                  ; 03:41B1
    call Sub035A14                  ; 03:41B4
Code0341B7:
    ld   a,$A8                      ; 03:41B7
    ldh  [<$FFA9],a                 ; 03:41B9
    xor  a                          ; 03:41BB
    ldh  [<$FFAA],a                 ; 03:41BC
    call Sub037376                  ; 03:41BE
    rst  $18                        ; 03:41C1

Sub0341C2:
    ld   a,$03                      ; 03:41C2
    rst  $10                        ; 03:41C4
.dl SubL_0B5302                     ; 03:41C5
    xor  a                          ; 03:41C8
    ld   [$C366],a                  ; 03:41C9
    ld   a,$00                      ; 03:41CC
    and  a                          ; 03:41CE
    jr   z,Sub03421E                ; 03:41CF
    ldh  a,[<H_ButtonFlags]         ; 03:41D1
    and  $04                        ; 03:41D3
    jr   z,Sub03421E                ; 03:41D5
    ldh  a,[<$FF8C]                 ; 03:41D7
    and  $03                        ; 03:41D9
    jr   z,Sub03421E                ; 03:41DB
    and  $01                        ; 03:41DD
    jr   nz,Code034208              ; 03:41DF
    xor  a                          ; 03:41E1
    ld   [$C1CE],a                  ; 03:41E2
    ld   a,[$C167]                  ; 03:41E5
    inc  a                          ; 03:41E8
    cp   $03                        ; 03:41E9
    jr   c,Code0341EE               ; 03:41EB
    xor  a                          ; 03:41ED
Code0341EE:
    ld   [$C167],a                  ; 03:41EE
    ld   [$C1C5],a                  ; 03:41F1
    cp   $02                        ; 03:41F4
    jr   nz,Code034200              ; 03:41F6
    ld   a,$01                      ; 03:41F8
    ld   [$C1C5],a                  ; 03:41FA
    ld   [$C1CE],a                  ; 03:41FD
Code034200:
    ld   a,$03                      ; 03:4200
    rst  $10                        ; 03:4202
.dl SubL_0B421E                     ; 03:4203
    jr   Code03421A                 ; 03:4206
Code034208:
    ld   a,[W_PlayerState]          ; 03:4208
    and  a                          ; 03:420B
    jr   nz,Code034212              ; 03:420C
    ld   a,$02                      ; 03:420E
    jr   Code034213                 ; 03:4210
Code034212:
    xor  a                          ; 03:4212
Code034213:
    ld   [W_PlayerState],a          ; 03:4213
    xor  a                          ; 03:4216
    ld   [$C1F3],a                  ; 03:4217
Code03421A:
    ld   a,$51                      ; 03:421A
    ldh  [<$FFF2],a                 ; 03:421C

Sub03421E:
    ldh  a,[<H_ButtonFlags]         ; 03:421E
    ld   [$C25E],a                  ; 03:4220
    ldh  a,[<$FF8C]                 ; 03:4223
    ld   [$C1C8],a                  ; 03:4225
    ld   hl,$C1D5                   ; 03:4228
    ld   a,[hl]                     ; 03:422B
    and  a                          ; 03:422C
    jr   z,Code034230               ; 03:422D
    dec  [hl]                       ; 03:422F
Code034230:
    ldh  a,[<$FFB8]                 ; 03:4230
    ld   [$C27B],a                  ; 03:4232
    ldh  a,[<$FFB9]                 ; 03:4235
    ld   [$C27C],a                  ; 03:4237
    ldh  a,[<$FFBA]                 ; 03:423A
    ld   [$C27D],a                  ; 03:423C
    ldh  a,[<$FFBB]                 ; 03:423F
    ld   [$C27E],a                  ; 03:4241
    ldh  a,[<$FFA7]                 ; 03:4244
    ld   [$C1CA],a                  ; 03:4246
    ldh  a,[<$FFA8]                 ; 03:4249
    ld   [$C1CB],a                  ; 03:424B
    ldh  a,[<$FFA9]                 ; 03:424E
    ld   [$C1CC],a                  ; 03:4250
    ldh  a,[<$FFAA]                 ; 03:4253
    ld   [$C1CD],a                  ; 03:4255
    xor  a                          ; 03:4258
    ld   [$C1D6],a                  ; 03:4259
    ld   [$C1D7],a                  ; 03:425C
    call Sub03574C                  ; 03:425F
    call Sub036BDB                  ; 03:4262
    call Sub0342AF                  ; 03:4265
    call Sub03427D                  ; 03:4268
    call Sub037043                  ; 03:426B
    ld   a,[W_GameMode]             ; 03:426E
    cp   $07                        ; 03:4271
    ret  nz                         ; 03:4273
    ld   a,[$C38D]                  ; 03:4274
    and  a                          ; 03:4277
    ret  z                          ; 03:4278
    call Sub0378F6                  ; 03:4279
    ret                             ; 03:427C

Sub03427D:
    ld   a,[W_PlayerState]          ; 03:427D
    rst  $00                        ; 03:4280
.dw Code034365                      ; 03:4281
.dw Code034572                      ; 03:4283
.dw Code0347FA                      ; 03:4285
.dw Code03483D                      ; 03:4287
.dw Code03489A                      ; 03:4289
.dw Code034AD6                      ; 03:428B
.dw Code034D75                      ; 03:428D
.dw Code034DE8                      ; 03:428F
.dw Code0374CB                      ; 03:4291
.dw Code034E31                      ; 03:4293
.dw Code034E71                      ; 03:4295
.dw Code037524                      ; 03:4297
.dw Code0343C0                      ; 03:4299
.dw Code03447F                      ; 03:429B
.dw Code03449C                      ; 03:429D
.dw Code034737                      ; 03:429F
.dw Code0347D4                      ; 03:42A1
.dw Code034A24                      ; 03:42A3
.dw Code0347E6                      ; 03:42A5
.dw Code034572                      ; 03:42A7
.dw Code034737                      ; 03:42A9
.dw Return034E70                    ; 03:42AB
.dw Code0346E5                      ; 03:42AD

Sub0342AF:
    ld   a,[$C1DA]                  ; 03:42AF
    ld   hl,$C1DB                   ; 03:42B2
    or   [hl]                       ; 03:42B5
    ret  z                          ; 03:42B6
    ld   a,[$C1DA]                  ; 03:42B7
    ld   l,a                        ; 03:42BA
    ld   a,[$C1DB]                  ; 03:42BB
    ld   h,a                        ; 03:42BE
    dec  hl                         ; 03:42BF
    ld   a,h                        ; 03:42C0
    ld   [$C1DB],a                  ; 03:42C1
    ld   a,l                        ; 03:42C4
    ld   [$C1DA],a                  ; 03:42C5
    or   h                          ; 03:42C8
    jr   z,Sub034328                ; 03:42C9
    ld   a,h                        ; 03:42CB
    and  a                          ; 03:42CC
    jr   nz,Code034336              ; 03:42CD
    ld   a,l                        ; 03:42CF
    cp   $18                        ; 03:42D0
    jr   z,Sub034328                ; 03:42D2
    cp   $60                        ; 03:42D4
    jr   nz,Code034336              ; 03:42D6
    ld   a,[W_PlayerState]          ; 03:42D8
    cp   $05                        ; 03:42DB
    jr   z,Code034336               ; 03:42DD
    cp   $0A                        ; 03:42DF
    jr   z,Code034336               ; 03:42E1
    cp   $11                        ; 03:42E3
    jr   z,Code034336               ; 03:42E5
    cp   $04                        ; 03:42E7
    jr   z,Code034336               ; 03:42E9
    ld   a,[W_GameMode]             ; 03:42EB
    cp   $02                        ; 03:42EE
    jr   nz,Code034320              ; 03:42F0
    ld   a,[$C366]                  ; 03:42F2
    xor  $01                        ; 03:42F5
    swap a                          ; 03:42F7
    sla  a                          ; 03:42F9
    sla  a                          ; 03:42FB
    sla  a                          ; 03:42FD
    ld   e,a                        ; 03:42FF
    ld   d,$00                      ; 03:4300
    ld   hl,$C509                   ; 03:4302
    add  hl,de                      ; 03:4305
    ld   a,[hl]                     ; 03:4306
    cp   $05                        ; 03:4307
    jr   z,Code034336               ; 03:4309
    cp   $0A                        ; 03:430B
    jr   z,Code034336               ; 03:430D
    cp   $11                        ; 03:430F
    jr   z,Code034336               ; 03:4311
    cp   $04                        ; 03:4313
    jr   z,Code034336               ; 03:4315
    ld   hl,$C522                   ; 03:4317
    add  hl,de                      ; 03:431A
    ld   a,[hl]                     ; 03:431B
    inc  hl                         ; 03:431C
    or   [hl]                       ; 03:431D
    jr   nz,Code034336              ; 03:431E
Code034320:
    ld   a,[$C36F]                  ; 03:4320
    ld   [$DE68],a                  ; 03:4323
    jr   Code034336                 ; 03:4326

Sub034328:
    xor  a                          ; 03:4328
    ld   [$C1DA],a                  ; 03:4329
    ld   [$C1DB],a                  ; 03:432C
    ld   a,$02                      ; 03:432F
    ld   [$C1DC],a                  ; 03:4331
    jr   Code034358                 ; 03:4334
Code034336:
    ld   a,[$C1DB]                  ; 03:4336
    and  a                          ; 03:4339
    jr   nz,Code03434A              ; 03:433A
    ld   a,[$C1DA]                  ; 03:433C
    cp   $E0                        ; 03:433F
    jr   nc,Code03434A              ; 03:4341
    ldh  a,[<$FFB7]                 ; 03:4343
    and  $03                        ; 03:4345
    ret  nz                         ; 03:4347
    jr   Code03434F                 ; 03:4348
Code03434A:
    ldh  a,[<$FFB7]                 ; 03:434A
    and  $01                        ; 03:434C
    ret  nz                         ; 03:434E
Code03434F:
    ld   a,[$C1DC]                  ; 03:434F
    inc  a                          ; 03:4352
    and  $03                        ; 03:4353
    ld   [$C1DC],a                  ; 03:4355
Code034358:
    ld   a,[W_PlayerState]          ; 03:4358
    cp   $06                        ; 03:435B
    ret  z                          ; 03:435D
    ld   a,$03                      ; 03:435E
    rst  $10                        ; 03:4360
.dl SubL_0B433F                     ; 03:4361
    ret                             ; 03:4364

Code034365:
    ld   hl,$C1DD                   ; 03:4365
    ld   a,[$C1C5]                  ; 03:4368
    and  a                          ; 03:436B
    jr   z,Code034379               ; 03:436C
    ld   a,[$C25E]                  ; 03:436E
    bit  7,a                        ; 03:4371
    jr   z,Code034379               ; 03:4373
    ld   [hl],$01                   ; 03:4375
    jr   Code03437B                 ; 03:4377
Code034379:
    ld   [hl],$00                   ; 03:4379
Code03437B:
    ldh  a,[<H_PlInitY_SubLvType]   ; 03:437B
    and  $0F                        ; 03:437D
    cp   $02                        ; 03:437F
    jr   z,Code034396               ; 03:4381
    call Sub035548                  ; 03:4383
    call Sub035615                  ; 03:4386
    call Sub035680                  ; 03:4389
    call Sub0361DF                  ; 03:438C
    call Sub03650F                  ; 03:438F
    call Sub035A14                  ; 03:4392
    ret                             ; 03:4395

Code034396:
    call Sub0355E7                  ; 03:4396
    call Sub035615                  ; 03:4399
    call Sub0356CA                  ; 03:439C
    call Sub0361DF                  ; 03:439F
    call Sub03650F                  ; 03:43A2
    call Sub035A14                  ; 03:43A5
    ld   hl,$C20D                   ; 03:43A8
    inc  [hl]                       ; 03:43AB
    ld   a,[hl]                     ; 03:43AC
    cp   $48                        ; 03:43AD
    jr   c,Return0343B9             ; 03:43AF
    ld   [hl],$00                   ; 03:43B1
    ld   a,$03                      ; 03:43B3
    rst  $10                        ; 03:43B5
.dl SubL_0851B7                     ; 03:43B6
Return0343B9:
    ret                             ; 03:43B9

Data0343BA:                         ; 03:43BA
.db $F0,$20
Data0343BC:                         ; 03:43BC
.db $10,$00,$F0,$FF
Code0343C0:
    ld   a,[$C1DD]                  ; 03:43C0
    and  a                          ; 03:43C3
    jr   nz,Code0343CC              ; 03:43C4
    ld   a,[$C1E4]                  ; 03:43C6
    and  a                          ; 03:43C9
    jr   nz,Code0343D1              ; 03:43CA
Code0343CC:
    xor  a                          ; 03:43CC
    ld   [W_PlayerState],a          ; 03:43CD
    ret                             ; 03:43D0

Code0343D1:
    ldh  a,[<$FFA9]                 ; 03:43D1
    cp   $40                        ; 03:43D3
    jr   nc,Code0343E6              ; 03:43D5
    ld   a,$0E                      ; 03:43D7
    ld   [W_PlayerState],a          ; 03:43D9
    xor  a                          ; 03:43DC
    ld   [$C1D3],a                  ; 03:43DD
    ld   [$C181],a                  ; 03:43E0
    jp   Code03449C                 ; 03:43E3
Code0343E6:
    ld   a,[$C1C8]                  ; 03:43E6
    and  $30                        ; 03:43E9
    jr   z,Code034440               ; 03:43EB
    and  $10                        ; 03:43ED
    jr   z,Code0343FB               ; 03:43EF
    ld   a,[$C1C3]                  ; 03:43F1
    and  a                          ; 03:43F4
    jr   nz,Code034415              ; 03:43F5
    ld   a,$10                      ; 03:43F7
    jr   Code034403                 ; 03:43F9
Code0343FB:
    ld   a,[$C1C3]                  ; 03:43FB
    and  a                          ; 03:43FE
    jr   z,Code034415               ; 03:43FF
    ld   a,$20                      ; 03:4401
Code034403:
    ld   [$C1E5],a                  ; 03:4403
    ld   a,$0D                      ; 03:4406
    ld   [W_PlayerState],a          ; 03:4408
    ld   a,$02                      ; 03:440B
    ld   [$C1C2],a                  ; 03:440D
    xor  a                          ; 03:4410
    ldh  [<$FFAC],a                 ; 03:4411
    jr   Code034471                 ; 03:4413
Code034415:
    ld   a,[$C1C3]                  ; 03:4415
    cp   $02                        ; 03:4418
    jr   z,Code034426               ; 03:441A
    ld   hl,$FFB8                   ; 03:441C
    ldh  a,[<$FFA7]                 ; 03:441F
    sub  [hl]                       ; 03:4421
    cp   $18                        ; 03:4422
    jr   c,Code034440               ; 03:4424
Code034426:
    ld   a,[$C1C3]                  ; 03:4426
    xor  $02                        ; 03:4429
    ld   [$C1C3],a                  ; 03:442B
    ld   e,a                        ; 03:442E
    ld   d,$00                      ; 03:442F
    ld   hl,Data0343BC              ; 03:4431
    add  hl,de                      ; 03:4434
    ldh  a,[<$FFA7]                 ; 03:4435
    add  [hl]                       ; 03:4437
    ldh  [<$FFA7],a                 ; 03:4438
    inc  hl                         ; 03:443A
    ldh  a,[<$FFA8]                 ; 03:443B
    adc  [hl]                       ; 03:443D
    ldh  [<$FFA8],a                 ; 03:443E
Code034440:
    xor  a                          ; 03:4440
    ldh  [<$FFAC],a                 ; 03:4441
    ld   de,$0000                   ; 03:4443
    ld   a,[$C25E]                  ; 03:4446
    and  $C0                        ; 03:4449
    jr   z,Code034471               ; 03:444B
    and  $40                        ; 03:444D
    jr   nz,Code034452              ; 03:444F
    inc  e                          ; 03:4451
Code034452:
    ld   hl,Data0343BA              ; 03:4452
    add  hl,de                      ; 03:4455
    ld   a,[hl]                     ; 03:4456
    ldh  [<$FFAC],a                 ; 03:4457
    ldh  a,[<$FFB7]                 ; 03:4459
    and  $03                        ; 03:445B
    jr   nz,Code034471              ; 03:445D
    ld   e,$07                      ; 03:445F
    ld   a,[$C1C6]                  ; 03:4461
    cp   $07                        ; 03:4464
    jr   nz,Code03446A              ; 03:4466
    ld   e,$0C                      ; 03:4468
Code03446A:
    ld   a,e                        ; 03:446A
    ld   [$C1C2],a                  ; 03:446B
    ld   [$C1C6],a                  ; 03:446E
Code034471:
    call Sub0359E4                  ; 03:4471
    call Sub03650F                  ; 03:4474
    call Sub035A14                  ; 03:4477
    xor  a                          ; 03:447A
    ld   [$C1D6],a                  ; 03:447B
    ret                             ; 03:447E

Code03447F:
    ld   a,[$C1E4]                  ; 03:447F
    and  a                          ; 03:4482
    jr   nz,Code034489              ; 03:4483
    ld   [W_PlayerState],a          ; 03:4485
    ret                             ; 03:4488

Code034489:
    ld   a,[$C1E5]                  ; 03:4489
    ld   [$C25E],a                  ; 03:448C
    call Sub035680                  ; 03:448F
    call Sub0361DF                  ; 03:4492
    call Sub03650F                  ; 03:4495
    call Sub035A14                  ; 03:4498
    ret                             ; 03:449B

Code03449C:
    call Sub0344A0                  ; 03:449C
    ret                             ; 03:449F

Sub0344A0:
    ld   a,[$C1D3]                  ; 03:44A0
    rst  $00                        ; 03:44A3
.dw Code0344B0                      ; 03:44A4
.dw Code0344EF                      ; 03:44A6
.dw Return0344FC                    ; 03:44A8
.dw Code0344FD                      ; 03:44AA
.dw Code03451B                      ; 03:44AC
.dw Code03453A                      ; 03:44AE
Code0344B0:
    ldh  a,[<$FFAA]                 ; 03:44B0
    and  a                          ; 03:44B2
    jr   nz,Code0344BB              ; 03:44B3
    ld   a,[$C1E4]                  ; 03:44B5
    and  a                          ; 03:44B8
    jr   z,Code0344EB               ; 03:44B9
Code0344BB:
    ld   hl,Data0343BA              ; 03:44BB
    ld   a,[hl]                     ; 03:44BE
    ldh  [<$FFAC],a                 ; 03:44BF
    call Sub0359E4                  ; 03:44C1
    ldh  a,[<$FFAA]                 ; 03:44C4
    and  a                          ; 03:44C6
    jr   z,Code0344D3               ; 03:44C7
    ldh  a,[<$FFA9]                 ; 03:44C9
    cp   $E0                        ; 03:44CB
    jr   nc,Code0344D3              ; 03:44CD
    ld   a,$0D                      ; 03:44CF
    ldh  [<H_GameState],a           ; 03:44D1
Code0344D3:
    ldh  a,[<$FFB7]                 ; 03:44D3
    and  $03                        ; 03:44D5
    jr   nz,Code0344EB              ; 03:44D7
    ld   e,$07                      ; 03:44D9
    ld   a,[$C1C6]                  ; 03:44DB
    cp   $07                        ; 03:44DE
    jr   nz,Code0344E4              ; 03:44E0
    ld   e,$0C                      ; 03:44E2
Code0344E4:
    ld   a,e                        ; 03:44E4
    ld   [$C1C2],a                  ; 03:44E5
    ld   [$C1C6],a                  ; 03:44E8
Code0344EB:
    call Sub035A14                  ; 03:44EB
    ret                             ; 03:44EE

Code0344EF:
    ld   a,$03                      ; 03:44EF
    rst  $10                        ; 03:44F1
.dl SubL_027806                     ; 03:44F2
    ld   a,[$C1D3]                  ; 03:44F5
    inc  a                          ; 03:44F8
    ld   [$C1D3],a                  ; 03:44F9
Return0344FC:
    ret                             ; 03:44FC

Code0344FD:
    ld   hl,Data0343BA              ; 03:44FD
    ld   a,[hl]                     ; 03:4500
    ldh  [<$FFAC],a                 ; 03:4501
    call Sub0359E4                  ; 03:4503
    ldh  a,[<$FFAA]                 ; 03:4506
    and  a                          ; 03:4508
    jr   nz,Code034519              ; 03:4509
    ldh  a,[<$FFA9]                 ; 03:450B
    cp   $C8                        ; 03:450D
    jp   nc,Code034519              ; 03:450F
    ld   a,[$C1D3]                  ; 03:4512
    inc  a                          ; 03:4515
    ld   [$C1D3],a                  ; 03:4516
Code034519:
    jr   Code0344D3                 ; 03:4519
Code03451B:
    xor  a                          ; 03:451B
    ld   [$C1C3],a                  ; 03:451C
    ld   hl,Data0343BC              ; 03:451F
    ldh  a,[<$FFA7]                 ; 03:4522
    add  [hl]                       ; 03:4524
    ldh  [<$FFA7],a                 ; 03:4525
    inc  hl                         ; 03:4527
    ldh  a,[<$FFA8]                 ; 03:4528
    adc  [hl]                       ; 03:452A
    ldh  [<$FFA8],a                 ; 03:452B
    ld   a,[$C1D3]                  ; 03:452D
    inc  a                          ; 03:4530
    ld   [$C1D3],a                  ; 03:4531
    ld   a,$10                      ; 03:4534
    ld   [$C1D1],a                  ; 03:4536
    ret                             ; 03:4539

Code03453A:
    ld   a,[$C1D1]                  ; 03:453A
    dec  a                          ; 03:453D
    ld   [$C1D1],a                  ; 03:453E
    cp   $00                        ; 03:4541
    jr   z,Code03454B               ; 03:4543
    cp   $08                        ; 03:4545
    jr   nc,Return034571            ; 03:4547
    jr   Code034557                 ; 03:4549
Code03454B:
    xor  a                          ; 03:454B
    ld   [W_PlayerState],a          ; 03:454C
    ld   [$C170],a                  ; 03:454F
    inc  a                          ; 03:4552
    ld   [$C181],a                  ; 03:4553
    ret                             ; 03:4556

Code034557:
    xor  a                          ; 03:4557
    ld   [$C1C2],a                  ; 03:4558
    ld   a,$10                      ; 03:455B
    ld   [$C25E],a                  ; 03:455D
    ld   a,$02                      ; 03:4560
    ld   [$C1C3],a                  ; 03:4562
    call Sub035680                  ; 03:4565
    call Sub0361DF                  ; 03:4568
    call Sub03650F                  ; 03:456B
    call Sub035A14                  ; 03:456E
Return034571:
    ret                             ; 03:4571

Code034572:
    call Sub035615                  ; 03:4572
    ld   hl,$C1F7                   ; 03:4575
    ld   a,[hl]                     ; 03:4578
    and  a                          ; 03:4579
    jr   z,Code03457D               ; 03:457A
    dec  [hl]                       ; 03:457C
Code03457D:
    ld   a,[W_PlayerState]          ; 03:457D
    cp   $13                        ; 03:4580
    jr   z,Code0345BE               ; 03:4582
    ld   a,[$C1DD]                  ; 03:4584
    and  a                          ; 03:4587
    jr   z,Code034591               ; 03:4588
    ld   a,[$C1C2]                  ; 03:458A
    cp   $0B                        ; 03:458D
    jr   z,Code034596               ; 03:458F
Code034591:
    ld   a,$04                      ; 03:4591
    ld   [$C1C2],a                  ; 03:4593
Code034596:
    ldh  a,[<$FFAC]                 ; 03:4596
    bit  7,a                        ; 03:4598
    jr   z,Code0345BE               ; 03:459A
    ld   hl,$FFA9                   ; 03:459C
    ld   a,[$C201]                  ; 03:459F
    sub  [hl]                       ; 03:45A2
    cp   $10                        ; 03:45A3
    jr   c,Code0345B7               ; 03:45A5
    ld   hl,$C1C7                   ; 03:45A7
    ld   a,[hl]                     ; 03:45AA
    and  a                          ; 03:45AB
    jr   z,Code0345BE               ; 03:45AC
    dec  [hl]                       ; 03:45AE
    ld   a,[$C25E]                  ; 03:45AF
    bit  0,a                        ; 03:45B2
    jp   z,Code0345BC               ; 03:45B4
Code0345B7:
    ld   de,$0180                   ; 03:45B7
    jr   Code0345D2                 ; 03:45BA
Code0345BC:
    xor  a                          ; 03:45BC
    ld   [hl],a                     ; 03:45BD
Code0345BE:
    ld   a,[$C205]                  ; 03:45BE
    ld   [$C203],a                  ; 03:45C1
    ld   a,[$C206]                  ; 03:45C4
    ld   [$C204],a                  ; 03:45C7
    ld   a,[$C203]                  ; 03:45CA
    ld   e,a                        ; 03:45CD
    ld   a,[$C204]                  ; 03:45CE
    ld   d,a                        ; 03:45D1
Code0345D2:
    ld   a,[$C200]                  ; 03:45D2
    add  e                          ; 03:45D5
    ld   [$C200],a                  ; 03:45D6
    ldh  a,[<$FFAC]                 ; 03:45D9
    adc  d                          ; 03:45DB
    bit  7,a                        ; 03:45DC
    jr   nz,Code0345E6              ; 03:45DE
    cp   $40                        ; 03:45E0
    jr   c,Code0345E6               ; 03:45E2
    ld   a,$40                      ; 03:45E4
Code0345E6:
    ldh  [<$FFAC],a                 ; 03:45E6
    ld   a,[$C25E]                  ; 03:45E8
    and  $30                        ; 03:45EB
    jp   z,Code0345F3               ; 03:45ED
    call Sub03577E                  ; 03:45F0
Code0345F3:
    call Sub0359B4                  ; 03:45F3
    call Sub0359E4                  ; 03:45F6
    ld   a,[$C26B]                  ; 03:45F9
    and  a                          ; 03:45FC
    jr   nz,Code034633              ; 03:45FD
    ld   a,[$C25E]                  ; 03:45FF
    push af                         ; 03:4602
    call Sub03650F                  ; 03:4603
    pop  af                         ; 03:4606
    ld   [$C25E],a                  ; 03:4607
    ld   a,[W_PlayerState]          ; 03:460A
    cp   $0A                        ; 03:460D
    jp   z,Code03464B               ; 03:460F
    cp   $03                        ; 03:4612
    jp   z,Code03464B               ; 03:4614
    cp   $06                        ; 03:4617
    jp   z,Code03464B               ; 03:4619
    ld   a,[$C20F]                  ; 03:461C
    and  $03                        ; 03:461F
    jp   z,Code03464B               ; 03:4621
    xor  a                          ; 03:4624
    ld   [$C1FA],a                  ; 03:4625
    ld   a,[$C1C2]                  ; 03:4628
    cp   $04                        ; 03:462B
    jr   nz,Code034633              ; 03:462D
    xor  a                          ; 03:462F
    ld   [$C1DD],a                  ; 03:4630
Code034633:
    call Sub03464F                  ; 03:4633
    call Sub0346AA                  ; 03:4636
    ldh  a,[<$FFAC]                 ; 03:4639
    bit  7,a                        ; 03:463B
    jr   nz,Code03464B              ; 03:463D
    ld   a,[W_PlayerState]          ; 03:463F
    cp   $0B                        ; 03:4642
    jr   z,Code03464B               ; 03:4644
    ld   a,$00                      ; 03:4646
    ld   [W_PlayerState],a          ; 03:4648
Code03464B:
    call Sub035A14                  ; 03:464B
    ret                             ; 03:464E

Sub03464F:
    ld   a,[$C25E]                  ; 03:464F
    and  $30                        ; 03:4652
    ld   d,a                        ; 03:4654
    ld   a,[$C1C3]                  ; 03:4655
    srl  a                          ; 03:4658
    ld   c,a                        ; 03:465A
    ld   b,$00                      ; 03:465B
    ld   hl,Data03577C              ; 03:465D
    add  hl,bc                      ; 03:4660
    ld   e,$20                      ; 03:4661
    ldh  a,[<$FFAB]                 ; 03:4663
    cp   $00                        ; 03:4665
    ret  z                          ; 03:4667
    bit  7,a                        ; 03:4668
    jr   nz,Code03466E              ; 03:466A
    ld   e,$10                      ; 03:466C
Code03466E:
    ld   a,e                        ; 03:466E
    cp   [hl]                       ; 03:466F
    ret  z                          ; 03:4670
    ld   a,d                        ; 03:4671
    cp   e                          ; 03:4672
    jr   nz,Code03467A              ; 03:4673
    xor  a                          ; 03:4675
    ld   [$C207],a                  ; 03:4676
    ret                             ; 03:4679

Code03467A:
    ldh  a,[<$FFAB]                 ; 03:467A
    bit  7,a                        ; 03:467C
    jr   z,Code034682               ; 03:467E
    cpl                             ; 03:4680
    inc  a                          ; 03:4681
Code034682:
    cp   $19                        ; 03:4682
    ret  c                          ; 03:4684
    ld   a,$03                      ; 03:4685
    ld   [$C1C2],a                  ; 03:4687
    ld   [$C1C6],a                  ; 03:468A
    ld   [$C207],a                  ; 03:468D
    xor  a                          ; 03:4690
    ld   [$C1FF],a                  ; 03:4691
    ld   e,$20                      ; 03:4694
    ld   d,$18                      ; 03:4696
    ldh  a,[<$FFAB]                 ; 03:4698
    bit  7,a                        ; 03:469A
    jr   z,Code0346A2               ; 03:469C
    ld   e,$10                      ; 03:469E
    ld   d,$E8                      ; 03:46A0
Code0346A2:
    ld   a,e                        ; 03:46A2
    ld   [$C20A],a                  ; 03:46A3
    ld   a,d                        ; 03:46A6
    ldh  [<$FFAB],a                 ; 03:46A7
    ret                             ; 03:46A9

Sub0346AA:
    call Sub03592B                  ; 03:46AA
    jr   c,Return0346D4             ; 03:46AD
    ld   a,[$C25E]                  ; 03:46AF
    bit  1,a                        ; 03:46B2
    jp   z,Return0346D4             ; 03:46B4
    ld   a,[$C1FF]                  ; 03:46B7
    and  a                          ; 03:46BA
    jr   z,Return0346D4             ; 03:46BB
    ld   e,$28                      ; 03:46BD
    ldh  a,[<$FFAB]                 ; 03:46BF
    bit  7,a                        ; 03:46C1
    jr   z,Code0346C9               ; 03:46C3
    cpl                             ; 03:46C5
    inc  a                          ; 03:46C6
    ld   e,$D8                      ; 03:46C7
Code0346C9:
    cp   $18                        ; 03:46C9
    jr   nz,Return0346D4            ; 03:46CB
    ld   a,e                        ; 03:46CD
    ldh  [<$FFAB],a                 ; 03:46CE
    xor  a                          ; 03:46D0
    ld   [$C207],a                  ; 03:46D1
Return0346D4:
    ret                             ; 03:46D4

Data0346D5:                         ; 03:46D5
.db $A8,$A7,$A6,$A5,$A4,$A3,$A2,$A1,\
    $A0,$BF,$BE,$BD,$BC,$BB,$BA,$B9
Code0346E5:
    call Sub035615                  ; 03:46E5
    ld   a,[$C1FB]                  ; 03:46E8
    ld   e,a                        ; 03:46EB
    ld   a,[$C1FC]                  ; 03:46EC
    ld   d,a                        ; 03:46EF
    or   e                          ; 03:46F0
    jr   z,Code0346FE               ; 03:46F1
    dec  de                         ; 03:46F3
    ld   a,e                        ; 03:46F4
    ld   [$C1FB],a                  ; 03:46F5
    ld   a,d                        ; 03:46F8
    ld   [$C1FC],a                  ; 03:46F9
    jr   Code034735                 ; 03:46FC
Code0346FE:
    ld   hl,$FFAC                   ; 03:46FE
    ld   a,[hl]                     ; 03:4701
    ldh  [<$FF97],a                 ; 03:4702
    bit  7,a                        ; 03:4704
    jr   z,Code034710               ; 03:4706
    cp   $90                        ; 03:4708
    jr   nc,Code034710              ; 03:470A
    ld   a,$01                      ; 03:470C
    jr   Code034712                 ; 03:470E
Code034710:
    ld   a,$05                      ; 03:4710
Code034712:
    add  [hl]                       ; 03:4712
    bit  7,a                        ; 03:4713
    jr   nz,Code03471D              ; 03:4715
    cp   $40                        ; 03:4717
    jr   c,Code03471D               ; 03:4719
    ld   a,$40                      ; 03:471B
Code03471D:
    ldh  [<$FFAC],a                 ; 03:471D
    bit  7,a                        ; 03:471F
    jr   nz,Code034735              ; 03:4721
    ldh  a,[<$FF97]                 ; 03:4723
    bit  7,a                        ; 03:4725
    jr   z,Code034735               ; 03:4727
    ld   a,$2C                      ; 03:4729
    ld   [$C1FB],a                  ; 03:472B
    xor  a                          ; 03:472E
    ldh  [<$FFAC],a                 ; 03:472F
    inc  a                          ; 03:4731
    ld   [$C1FC],a                  ; 03:4732
Code034735:
    jr   Code034794                 ; 03:4735
Code034737:
    call Sub035615                  ; 03:4737
    ld   a,[W_PlayerState]          ; 03:473A
    cp   $0F                        ; 03:473D
    jr   z,Code034765               ; 03:473F
    cp   $13                        ; 03:4741
    jr   z,Code034771               ; 03:4743
    ld   hl,$C1C7                   ; 03:4745
    ld   a,[hl]                     ; 03:4748
    and  a                          ; 03:4749
    jp   z,Code034765               ; 03:474A
    dec  [hl]                       ; 03:474D
    ld   a,[$C1C8]                  ; 03:474E
    and  $01                        ; 03:4751
    jp   z,Code034765               ; 03:4753
    xor  a                          ; 03:4756
    ld   [hl],a                     ; 03:4757
    ld   a,[$C1C7]                  ; 03:4758
    ld   e,a                        ; 03:475B
    ld   d,$00                      ; 03:475C
    ld   hl,Data0346D5              ; 03:475E
    add  hl,de                      ; 03:4761
    ld   a,[hl]                     ; 03:4762
    ldh  [<$FFAC],a                 ; 03:4763
Code034765:
    ld   hl,$FFAC                   ; 03:4765
    ld   a,[hl]                     ; 03:4768
    bit  7,a                        ; 03:4769
    jr   z,Code03477D               ; 03:476B
    cp   $90                        ; 03:476D
    jr   nc,Code03477D              ; 03:476F
Code034771:
    ld   a,[$C200]                  ; 03:4771
    add  $00                        ; 03:4774
    ld   [$C200],a                  ; 03:4776
    ld   a,$01                      ; 03:4779
    jr   Code034787                 ; 03:477B
Code03477D:
    ld   a,[$C200]                  ; 03:477D
    add  $80                        ; 03:4780
    ld   [$C200],a                  ; 03:4782
    ld   a,$05                      ; 03:4785
Code034787:
    adc  [hl]                       ; 03:4787
    bit  7,a                        ; 03:4788
    jr   nz,Code034792              ; 03:478A
    cp   $40                        ; 03:478C
    jr   c,Code034792               ; 03:478E
    ld   a,$40                      ; 03:4790
Code034792:
    ldh  [<$FFAC],a                 ; 03:4792
Code034794:
    ld   a,[$C25E]                  ; 03:4794
    and  $30                        ; 03:4797
    jp   z,Code03479F               ; 03:4799
    call Sub03577E                  ; 03:479C
Code03479F:
    call Sub0359B4                  ; 03:479F
    call Sub0359E4                  ; 03:47A2
    call Sub03650F                  ; 03:47A5
    ld   a,[$C20F]                  ; 03:47A8
    and  $03                        ; 03:47AB
    jp   z,Code0347D0               ; 03:47AD
    ldh  a,[<$FFAC]                 ; 03:47B0
    bit  7,a                        ; 03:47B2
    jr   nz,Code0347D0              ; 03:47B4
    ld   a,[W_PlayerState]          ; 03:47B6
    cp   $06                        ; 03:47B9
    jr   z,Code0347D0               ; 03:47BB
    cp   $03                        ; 03:47BD
    jr   z,Code0347D0               ; 03:47BF
    ld   a,$00                      ; 03:47C1
    ld   [W_PlayerState],a          ; 03:47C3
    ld   a,[$C1DD]                  ; 03:47C6
    and  a                          ; 03:47C9
    jr   nz,Code0347D0              ; 03:47CA
    xor  a                          ; 03:47CC
    ld   [$C1C2],a                  ; 03:47CD
Code0347D0:
    call Sub035A14                  ; 03:47D0
    ret                             ; 03:47D3

Code0347D4:
    ld   a,$10                      ; 03:47D4
    ld   [$C25E],a                  ; 03:47D6
    call Sub035680                  ; 03:47D9
    call Sub0361DF                  ; 03:47DC
    call Sub03650F                  ; 03:47DF
    call Sub035A14                  ; 03:47E2
    ret                             ; 03:47E5

Code0347E6:
    ld   hl,$C1D1                   ; 03:47E6
    dec  [hl]                       ; 03:47E9
    ld   a,[hl]                     ; 03:47EA
    and  a                          ; 03:47EB
    ret  nz                         ; 03:47EC
    ld   a,$0D                      ; 03:47ED
    ldh  [<H_GameState],a           ; 03:47EF
    ret                             ; 03:47F1

Data0347F2:                         ; 03:47F2
.db $00,$00,$C0,$40
Data0347F6:                         ; 03:47F6
.db $C0,$40,$00,$00
Code0347FA:
    xor  a                          ; 03:47FA
    ldh  [<$FFAB],a                 ; 03:47FB
    ldh  [<$FFAC],a                 ; 03:47FD
    ld   a,[$C25E]                  ; 03:47FF
    and  $C0                        ; 03:4802
    jp   z,Code034817               ; 03:4804
    ld   d,$00                      ; 03:4807
    ld   e,d                        ; 03:4809
    and  $80                        ; 03:480A
    jp   z,Code034810               ; 03:480C
    inc  e                          ; 03:480F
Code034810:
    ld   hl,Data0347F6              ; 03:4810
    add  hl,de                      ; 03:4813
    ld   a,[hl]                     ; 03:4814
    ldh  [<$FFAC],a                 ; 03:4815
Code034817:
    ld   a,[$C25E]                  ; 03:4817
    and  $30                        ; 03:481A
    jp   z,Code034830               ; 03:481C
    ld   d,$00                      ; 03:481F
    ld   e,$02                      ; 03:4821
    and  $10                        ; 03:4823
    jp   z,Code034829               ; 03:4825
    inc  e                          ; 03:4828
Code034829:
    ld   hl,Data0347F2              ; 03:4829
    add  hl,de                      ; 03:482C
    ld   a,[hl]                     ; 03:482D
    ldh  [<$FFAB],a                 ; 03:482E
Code034830:
    call Sub0359B4                  ; 03:4830
    call Sub0359E4                  ; 03:4833
    call Sub03644C                  ; 03:4836
    call Sub035A14                  ; 03:4839
    ret                             ; 03:483C

Code03483D:
    ld   a,$05                      ; 03:483D
    ld   [$C1C2],a                  ; 03:483F
    ld   a,[$C1CE]                  ; 03:4842
    push af                         ; 03:4845
    xor  a                          ; 03:4846
    ld   [$C1CE],a                  ; 03:4847
    ld   a,$03                      ; 03:484A
    rst  $10                        ; 03:484C
.dl SubL_0B421E                     ; 03:484D
    pop  af                         ; 03:4850
    ld   [$C1CE],a                  ; 03:4851
    ld   hl,$C1CF                   ; 03:4854
    ld   a,[hl]                     ; 03:4857
    cp   $00                        ; 03:4858
    jr   z,Code03486B               ; 03:485A
    dec  [hl]                       ; 03:485C
    cp   $08                        ; 03:485D
    jr   z,Code034866               ; 03:485F
    cp   $1C                        ; 03:4861
    jr   c,Code03486B               ; 03:4863
    ret                             ; 03:4865

Code034866:
    ld   a,$67                      ; 03:4866
    ld   [$DE68],a                  ; 03:4868
Code03486B:
    ld   hl,$FFAC                   ; 03:486B
    ld   a,$02                      ; 03:486E
    add  [hl]                       ; 03:4870
    bit  7,a                        ; 03:4871
    jr   nz,Code03487B              ; 03:4873
    cp   $38                        ; 03:4875
    jr   c,Code03487B               ; 03:4877
    ld   a,$38                      ; 03:4879
Code03487B:
    ld   [hl],a                     ; 03:487B
    call Sub0359E4                  ; 03:487C
    ldh  a,[<$FFAA]                 ; 03:487F
    bit  7,a                        ; 03:4881
    jr   nz,Return034899            ; 03:4883
    cp   $01                        ; 03:4885
    jr   z,Code03488F               ; 03:4887
    ldh  a,[<$FFA9]                 ; 03:4889
    cp   $F0                        ; 03:488B
    jr   c,Return034899             ; 03:488D
Code03488F:
    ld   a,$04                      ; 03:488F
    ld   [W_PlayerState],a          ; 03:4891
    ld   a,$78                      ; 03:4894
    ld   [$C1CF],a                  ; 03:4896
Return034899:
    ret                             ; 03:4899

Code03489A:
    ld   a,[W_GameMode]             ; 03:489A
    cp   $02                        ; 03:489D
    jp   z,Code034931               ; 03:489F
    ld   hl,$C1CF                   ; 03:48A2
    ld   a,[hl]                     ; 03:48A5
    and  a                          ; 03:48A6
    jr   nz,Code034922              ; 03:48A7
    ld   a,[W_SublevelID]           ; 03:48A9
    ld   d,a                        ; 03:48AC
    ld   e,$35                      ; 03:48AD
    ld   a,[W_SPFlag]               ; 03:48AF
    and  a                          ; 03:48B2
    jr   z,Code0348B7               ; 03:48B3
    ld   e,$63                      ; 03:48B5
Code0348B7:
    ld   a,e                        ; 03:48B7
    cp   d                          ; 03:48B8
    jr   z,Code0348C6               ; 03:48B9
    ld   a,[W_SublevelID]           ; 03:48BB
    cp   $20                        ; 03:48BE
    jr   c,Code0348C6               ; 03:48C0
    xor  a                          ; 03:48C2
    ld   [$C1EF],a                  ; 03:48C3
Code0348C6:
    ld   a,[W_GameMode]             ; 03:48C6
    cp   $07                        ; 03:48C9
    jr   z,Code034924               ; 03:48CB
    ld   hl,$C17D                   ; 03:48CD
    ld   e,[hl]                     ; 03:48D0
    inc  hl                         ; 03:48D1
    ld   a,[hl]                     ; 03:48D2
    or   e                          ; 03:48D3
    jr   z,Code034911               ; 03:48D4
    ld   a,[W_PlayerLives]          ; 03:48D6
    dec  a                          ; 03:48D9
    ld   [W_PlayerLives],a          ; 03:48DA
    bit  7,a                        ; 03:48DD
    jr   nz,Code0348FA              ; 03:48DF
    and  a                          ; 03:48E1
    jr   z,Code0348FA               ; 03:48E2
    ld   a,$04                      ; 03:48E4
    ldh  [<H_GameState],a           ; 03:48E6
    ld   a,[W_LevelID]              ; 03:48E8
    ld   [W_SublevelID],a           ; 03:48EB
    ld   hl,$C164                   ; 03:48EE
    ld   [hl],$FF                   ; 03:48F1
    inc  hl                         ; 03:48F3
    ld   [hl],$01                   ; 03:48F4
    ld   a,$01                      ; 03:48F6
    jr   Code034917                 ; 03:48F8
Code0348FA:
    ld   a,[$C283]                  ; 03:48FA
    and  a                          ; 03:48FD
    jr   nz,Code034907              ; 03:48FE
    ld   a,$0E                      ; 03:4900
    ldh  [<H_GameState],a           ; 03:4902
    xor  a                          ; 03:4904
    jr   Code034917                 ; 03:4905
Code034907:
    xor  a                          ; 03:4907
    ld   [$C168],a                  ; 03:4908
    ld   a,$22                      ; 03:490B
    ldh  [<H_GameState],a           ; 03:490D
    jr   Code034917                 ; 03:490F
Code034911:
    ld   a,$10                      ; 03:4911
    ldh  [<H_GameState],a           ; 03:4913
    ld   a,$01                      ; 03:4915
Code034917:
    ld   [$C28E],a                  ; 03:4917
    xor  a                          ; 03:491A
    ld   [$C1CE],a                  ; 03:491B
    ld   [$C1C5],a                  ; 03:491E
    ret                             ; 03:4921

Code034922:
    dec  [hl]                       ; 03:4922
    ret                             ; 03:4923

Code034924:
    xor  a                          ; 03:4924
    ld   [$C36A],a                  ; 03:4925
    inc  a                          ; 03:4928
    ld   [$C168],a                  ; 03:4929
    ld   a,$25                      ; 03:492C
    ldh  [<H_GameState],a           ; 03:492E
    ret                             ; 03:4930

Code034931:
    ld   hl,$C1CF                   ; 03:4931
    ld   a,[hl]                     ; 03:4934
    and  a                          ; 03:4935
    jr   nz,Code034922              ; 03:4936
    ld   a,[$C366]                  ; 03:4938
    xor  $01                        ; 03:493B
    swap a                          ; 03:493D
    sla  a                          ; 03:493F
    sla  a                          ; 03:4941
    sla  a                          ; 03:4943
    ld   e,a                        ; 03:4945
    ld   d,$00                      ; 03:4946
    ld   a,$04                      ; 03:4948
    ld   hl,$C509                   ; 03:494A
    add  hl,de                      ; 03:494D
    ld   a,[hl]                     ; 03:494E
    cp   $03                        ; 03:494F
    jr   z,Code03495B               ; 03:4951
    cp   $04                        ; 03:4953
    jr   z,Code03495B               ; 03:4955
    cp   $11                        ; 03:4957
    jr   nz,Code03495F              ; 03:4959
Code03495B:
    ld   e,$02                      ; 03:495B
    jr   Code034968                 ; 03:495D
Code03495F:
    ld   e,$00                      ; 03:495F
    ld   a,[$C366]                  ; 03:4961
    and  a                          ; 03:4964
    jr   z,Code034968               ; 03:4965
    inc  e                          ; 03:4967
Code034968:
    ld   a,e                        ; 03:4968
    ld   [$C36A],a                  ; 03:4969
    xor  a                          ; 03:496C
    ld   [$C168],a                  ; 03:496D
    inc  a                          ; 03:4970
    ld   [$C0C3],a                  ; 03:4971
    ld   a,$25                      ; 03:4974
    ldh  [<H_GameState],a           ; 03:4976
    ret                             ; 03:4978

Sub034979:
    ld   a,[W_GameMode]             ; 03:4979
    cp   $02                        ; 03:497C
    ret  nz                         ; 03:497E
    ld   a,[W_PlayerState]          ; 03:497F
    cp   $03                        ; 03:4982
    jr   z,Code03498D               ; 03:4984
    cp   $11                        ; 03:4986
    jr   z,Code03498D               ; 03:4988
    cp   $04                        ; 03:498A
    ret  nz                         ; 03:498C
Code03498D:
    ld   a,[$C3A6]                  ; 03:498D
    and  a                          ; 03:4990
    ret  nz                         ; 03:4991
    ldh  a,[<$FF8C]                 ; 03:4992
    bit  0,a                        ; 03:4994
    ret  z                          ; 03:4996
    ld   a,[$C366]                  ; 03:4997
    xor  $01                        ; 03:499A
    srl  a                          ; 03:499C
    rr   a                          ; 03:499E
    ld   e,a                        ; 03:49A0
    ld   d,$00                      ; 03:49A1
    ld   hl,$C520                   ; 03:49A3
    add  hl,de                      ; 03:49A6
    ld   a,[hl]                     ; 03:49A7
    and  a                          ; 03:49A8
    ret  z                          ; 03:49A9
    ld   hl,$C509                   ; 03:49AA
    add  hl,de                      ; 03:49AD
    ld   a,[hl]                     ; 03:49AE
    cp   $03                        ; 03:49AF
    ret  z                          ; 03:49B1
    cp   $11                        ; 03:49B2
    ret  z                          ; 03:49B4
    cp   $04                        ; 03:49B5
    ret  z                          ; 03:49B7
    cp   $0A                        ; 03:49B8
    ret  z                          ; 03:49BA
    cp   $13                        ; 03:49BB
    ret  z                          ; 03:49BD
    cp   $07                        ; 03:49BE
    ret  z                          ; 03:49C0
    cp   $06                        ; 03:49C1
    ret  z                          ; 03:49C3
    cp   $09                        ; 03:49C4
    ret  z                          ; 03:49C6
    cp   $05                        ; 03:49C7
    ret  z                          ; 03:49C9
    ld   [hl],$13                   ; 03:49CA
    ld   hl,$C506                   ; 03:49CC
    add  hl,de                      ; 03:49CF
    ld   [hl],$B6                   ; 03:49D0
    xor  a                          ; 03:49D2
    ld   hl,$C508                   ; 03:49D3
    add  hl,de                      ; 03:49D6
    ld   [hl],a                     ; 03:49D7
    ld   hl,$C548                   ; 03:49D8
    add  hl,de                      ; 03:49DB
    ld   [hl],a                     ; 03:49DC
    ld   hl,$C50F                   ; 03:49DD
    add  hl,de                      ; 03:49E0
    ld   [hl],a                     ; 03:49E1
    ld   hl,$C503                   ; 03:49E2
    add  hl,de                      ; 03:49E5
    ld   a,[hl]                     ; 03:49E6
    ld   hl,$C549                   ; 03:49E7
    add  hl,de                      ; 03:49EA
    ld   [hl],a                     ; 03:49EB
    ld   hl,$C504                   ; 03:49EC
    add  hl,de                      ; 03:49EF
    ld   a,[hl]                     ; 03:49F0
    ld   hl,$C54A                   ; 03:49F1
    add  hl,de                      ; 03:49F4
    ld   [hl],a                     ; 03:49F5
    xor  a                          ; 03:49F6
    ld   hl,$C54B                   ; 03:49F7
    add  hl,de                      ; 03:49FA
    ld   [hl],a                     ; 03:49FB
    ld   hl,$C54D                   ; 03:49FC
    add  hl,de                      ; 03:49FF
    ld   [hl],a                     ; 03:4A00
    ld   a,$0A                      ; 03:4A01
    ld   hl,$C54C                   ; 03:4A03
    add  hl,de                      ; 03:4A06
    ld   [hl],a                     ; 03:4A07
    ld   hl,$C54E                   ; 03:4A08
    add  hl,de                      ; 03:4A0B
    ld   [hl],a                     ; 03:4A0C
    ld   de,$0010                   ; 03:4A0D
    ld   a,$03                      ; 03:4A10
    call Return0010B2               ; 03:4A12
    ld   a,$43                      ; 03:4A15
    ldh  [<$FFF2],a                 ; 03:4A17
    ld   a,$01                      ; 03:4A19
    ld   [$C3A6],a                  ; 03:4A1B
    ld   a,$05                      ; 03:4A1E
    ld   [$C3A7],a                  ; 03:4A20
    ret                             ; 03:4A23

Code034A24:
    ld   hl,$C1CF                   ; 03:4A24
    ld   a,[hl]                     ; 03:4A27
    dec  [hl]                       ; 03:4A28
    cp   $A0                        ; 03:4A29
    jr   z,Code034A3B               ; 03:4A2B
    cp   $C8                        ; 03:4A2D
    jr   z,Code034A41               ; 03:4A2F
    and  a                          ; 03:4A31
    ret  nz                         ; 03:4A32
    ld   a,$04                      ; 03:4A33
    ld   [W_PlayerState],a          ; 03:4A35
    xor  a                          ; 03:4A38
    ld   [hl],a                     ; 03:4A39
    ret                             ; 03:4A3A

Code034A3B:
    ld   a,$67                      ; 03:4A3B
    ld   [$DE68],a                  ; 03:4A3D
    ret                             ; 03:4A40

Code034A41:
    ld   a,$49                      ; 03:4A41
    ldh  [<$FFF2],a                 ; 03:4A43
    ret                             ; 03:4A45

Data034A46:                         ; 03:4A46
.db $05,$06,$04,$00,$06,$05,$07,$00,\
    $06,$06,$04,$00,$06,$06,$04,$00,\
    $06,$06,$04,$00,$06,$06,$06,$00,\
    $06,$05,$07,$00,$00,$00,$00,$00
Data034A66:                         ; 03:4A66
.db $06,$06,$06,$00,$08,$08,$06,$00,\
    $06,$06,$07,$00,$07,$07,$06,$00,\
    $0D,$06,$00,$00,$07,$07,$08,$00,\
    $07,$00,$0B,$00,$00,$00,$00,$00

Sub034A86:
    ld   a,[$C1EF]                  ; 03:4A86
    and  a                          ; 03:4A89
    ret  z                          ; 03:4A8A
    ld   hl,Data034A46              ; 03:4A8B
    ld   a,[W_SPFlag]               ; 03:4A8E
    and  a                          ; 03:4A91
    jr   z,Code034A97               ; 03:4A92
    ld   hl,Data034A66              ; 03:4A94
Code034A97:
    ld   a,[W_LevelID]              ; 03:4A97
    ld   e,a                        ; 03:4A9A
    ld   d,$00                      ; 03:4A9B
    add  hl,de                      ; 03:4A9D
    ld   a,[$C1EF]                  ; 03:4A9E
    cp   [hl]                       ; 03:4AA1
    jr   nc,Code034AAA              ; 03:4AA2
    xor  a                          ; 03:4AA4
    ld   [$C182],a                  ; 03:4AA5
    jr   Code034AB2                 ; 03:4AA8
Code034AAA:
    ld   a,[hl]                     ; 03:4AAA
    cp   $00                        ; 03:4AAB
    jr   nz,Code034AB2              ; 03:4AAD
    ld   [$C182],a                  ; 03:4AAF
Code034AB2:
    ldh  [<$FFC4],a                 ; 03:4AB2
    ldh  [<$FFB9],a                 ; 03:4AB4
    ldh  [<$FFA8],a                 ; 03:4AB6
    ld   [$C1EE],a                  ; 03:4AB8
    ld   [$C1EF],a                  ; 03:4ABB
    and  a                          ; 03:4ABE
    jr   z,Code034AD1               ; 03:4ABF
    ld   a,[$C1ED]                  ; 03:4AC1
    add  $60                        ; 03:4AC4
    ld   [$C1ED],a                  ; 03:4AC6
    ld   a,[$C1EE]                  ; 03:4AC9
    adc  $00                        ; 03:4ACC
    ld   [$C1EE],a                  ; 03:4ACE
Code034AD1:
    ld   a,$20                      ; 03:4AD1
    ldh  [<$FFA7],a                 ; 03:4AD3
    ret                             ; 03:4AD5

Code034AD6:
    ld   hl,$C20B                   ; 03:4AD6
    ld   e,[hl]                     ; 03:4AD9
    inc  hl                         ; 03:4ADA
    ld   d,[hl]                     ; 03:4ADB
    inc  de                         ; 03:4ADC
    ld   [hl],d                     ; 03:4ADD
    dec  hl                         ; 03:4ADE
    ld   [hl],e                     ; 03:4ADF
    call Sub034AE4                  ; 03:4AE0
    ret                             ; 03:4AE3

Sub034AE4:
    ld   a,[$C1D3]                  ; 03:4AE4
    rst  $00                        ; 03:4AE7
.dw Return034B2D                    ; 03:4AE8
.dw Code034AF4                      ; 03:4AEA
.dw Code034B6E                      ; 03:4AEC
.dw Code034BC6                      ; 03:4AEE
.dw Code034C4B                      ; 03:4AF0
.dw Code034CAC                      ; 03:4AF2
Code034AF4:
    ld   hl,$C1D1                   ; 03:4AF4
    ld   a,[hl]                     ; 03:4AF7
    and  a                          ; 03:4AF8
    jr   z,Code034AFE               ; 03:4AF9
    dec  [hl]                       ; 03:4AFB
    jr   Code034B2A                 ; 03:4AFC
Code034AFE:
    ld   a,$02                      ; 03:4AFE
    ld   [$C1C2],a                  ; 03:4B00
    ld   hl,$FFAC                   ; 03:4B03
    ld   a,$01                      ; 03:4B06
    add  [hl]                       ; 03:4B08
    bit  7,a                        ; 03:4B09
    jr   nz,Code034B13              ; 03:4B0B
    cp   $30                        ; 03:4B0D
    jr   c,Code034B13               ; 03:4B0F
    ld   a,$30                      ; 03:4B11
Code034B13:
    ld   [hl],a                     ; 03:4B13
    call Sub0359B4                  ; 03:4B14
    call Sub0359E4                  ; 03:4B17
    call Sub03650F                  ; 03:4B1A
    ld   a,[$C20F]                  ; 03:4B1D
    and  $03                        ; 03:4B20
    cp   $03                        ; 03:4B22
    jr   nz,Code034B2A              ; 03:4B24
    ld   hl,$C1D3                   ; 03:4B26
    inc  [hl]                       ; 03:4B29
Code034B2A:
    call Sub035A14                  ; 03:4B2A
Return034B2D:
    ret                             ; 03:4B2D

Data034B2E:                         ; 03:4B2E
.db $B0,$B0,$D0,$00,$E0,$B0,$50,$00,\
    $D0,$60,$F0,$00,$60,$B0,$A0,$00,\
    $C0,$D0,$D0,$00,$00,$D0,$E0,$00,\
    $80,$B0,$50,$00,$C0,$E0,$30,$00
Data034B4E:                         ; 03:4B4E
.db $10,$10,$F0,$00,$C0,$B0,$70,$00,\
    $F0,$10,$00,$00,$C0,$50,$00,$00,\
    $00,$10,$50,$00,$A0,$10,$F0,$00,\
    $00,$60,$20,$00,$D0,$F0,$C0,$00
Code034B6E:
    ld   a,$10                      ; 03:4B6E
    ld   [$C25E],a                  ; 03:4B70
    call Sub035680                  ; 03:4B73
    call Sub0361DF                  ; 03:4B76
    call Sub03650F                  ; 03:4B79
    call Sub035A14                  ; 03:4B7C
    ld   a,[W_LevelID]              ; 03:4B7F
    ld   e,a                        ; 03:4B82
    ld   d,$00                      ; 03:4B83
    ld   hl,Data034B2E              ; 03:4B85
    ld   a,[W_SPFlag]               ; 03:4B88
    and  a                          ; 03:4B8B
    jr   z,Code034B91               ; 03:4B8C
    ld   hl,Data034B4E              ; 03:4B8E
Code034B91:
    add  hl,de                      ; 03:4B91
    ld   d,[hl]                     ; 03:4B92
    ldh  a,[<$FFA7]                 ; 03:4B93
    and  $F0                        ; 03:4B95
    cp   d                          ; 03:4B97
    ret  nz                         ; 03:4B98
    ld   a,d                        ; 03:4B99
    ldh  [<$FFA7],a                 ; 03:4B9A
    xor  a                          ; 03:4B9C
    ld   [$C1C2],a                  ; 03:4B9D
    ld   [$C20B],a                  ; 03:4BA0
    ld   [$C20C],a                  ; 03:4BA3
    ld   hl,$C1D3                   ; 03:4BA6
    inc  [hl]                       ; 03:4BA9
    ld   a,$04                      ; 03:4BAA
    ld   [$C1D1],a                  ; 03:4BAC
    ld   hl,$C17D                   ; 03:4BAF
    ld   e,[hl]                     ; 03:4BB2
    inc  hl                         ; 03:4BB3
    ld   d,[hl]                     ; 03:4BB4
    push de                         ; 03:4BB5
    call Sub002EFE                  ; 03:4BB6
    ld   hl,$C280                   ; 03:4BB9
    ld   [hl],e                     ; 03:4BBC
    pop  de                         ; 03:4BBD
    ld   a,e                        ; 03:4BBE
    or   d                          ; 03:4BBF
    ret  z                          ; 03:4BC0
    ld   a,$47                      ; 03:4BC1
    ldh  [<$FFF2],a                 ; 03:4BC3
    ret                             ; 03:4BC5

Code034BC6:
    call Sub034C07                  ; 03:4BC6
    jr   c,Return034C06             ; 03:4BC9
    and  a                          ; 03:4BCB
    jr   z,Code034BFA               ; 03:4BCC
    push de                         ; 03:4BCE
    push hl                         ; 03:4BCF
    xor  a                          ; 03:4BD0
    ld   [$C27F],a                  ; 03:4BD1
    ld   a,$30                      ; 03:4BD4
    ld   [$C281],a                  ; 03:4BD6
    ld   a,$96                      ; 03:4BD9
    ld   [$C1D1],a                  ; 03:4BDB
    ld   hl,$C1D3                   ; 03:4BDE
    inc  [hl]                       ; 03:4BE1
    ld   a,[$C280]                  ; 03:4BE2
    cp   $01                        ; 03:4BE5
    jr   z,Code034BF2               ; 03:4BE7
    cp   $03                        ; 03:4BE9
    jr   z,Code034BF2               ; 03:4BEB
    cp   $06                        ; 03:4BED
    jr   z,Code034BF2               ; 03:4BEF
    inc  [hl]                       ; 03:4BF1
Code034BF2:
    ld   a,$03                      ; 03:4BF2
    rst  $10                        ; 03:4BF4
.dl SubL_06499F                     ; 03:4BF5
    pop  hl                         ; 03:4BF8
    pop  de                         ; 03:4BF9
Code034BFA:
    ld   [hl],d                     ; 03:4BFA
    dec  hl                         ; 03:4BFB
    ld   [hl],e                     ; 03:4BFC
    ld   a,c                        ; 03:4BFD
    ldh  [<$FF97],a                 ; 03:4BFE
    xor  a                          ; 03:4C00
    ldh  [<$FF98],a                 ; 03:4C01
    call Sub002E30                  ; 03:4C03
Return034C06:
    ret                             ; 03:4C06

Sub034C07:
    ld   hl,$C1D1                   ; 03:4C07
    dec  [hl]                       ; 03:4C0A
    ld   a,[hl]                     ; 03:4C0B
    and  a                          ; 03:4C0C
    jp   nz,Code034C39              ; 03:4C0D
    ld   [hl],$02                   ; 03:4C10
    ld   hl,$C17D                   ; 03:4C12
    ld   e,[hl]                     ; 03:4C15
    inc  hl                         ; 03:4C16
    ld   d,[hl]                     ; 03:4C17
    ld   c,$00                      ; 03:4C18
    ld   a,e                        ; 03:4C1A
    or   d                          ; 03:4C1B
    jr   z,Code034C34               ; 03:4C1C
    ld   a,$47                      ; 03:4C1E
    ldh  [<$FFF2],a                 ; 03:4C20
    dec  de                         ; 03:4C22
    ld   c,$05                      ; 03:4C23
    ld   a,e                        ; 03:4C25
    or   d                          ; 03:4C26
    jr   z,Code034C34               ; 03:4C27
    dec  de                         ; 03:4C29
    ld   c,$0A                      ; 03:4C2A
    ld   a,e                        ; 03:4C2C
    or   d                          ; 03:4C2D
    jr   z,Code034C34               ; 03:4C2E
    xor  a                          ; 03:4C30
    scf                             ; 03:4C31
    ccf                             ; 03:4C32
    ret                             ; 03:4C33

Code034C34:
    ld   a,$01                      ; 03:4C34
    scf                             ; 03:4C36
    ccf                             ; 03:4C37
    ret                             ; 03:4C38

Code034C39:
    scf                             ; 03:4C39
    ret                             ; 03:4C3A

Data034C3B:                         ; 03:4C3B
.db $F0,$FF,$B0,$FF,$E0,$FF,$C0,$FF,\
    $08,$00,$C0,$FF,$E0,$FF,$D0,$FF
Code034C4B:
    ld   hl,$C281                   ; 03:4C4B
    ld   a,[hl]                     ; 03:4C4E
    dec  [hl]                       ; 03:4C4F
    and  a                          ; 03:4C50
    ret  nz                         ; 03:4C51
    ld   [hl],$20                   ; 03:4C52
    ld   a,[$C27F]                  ; 03:4C54
    sla  a                          ; 03:4C57
    sla  a                          ; 03:4C59
    ld   e,a                        ; 03:4C5B
    ld   d,$00                      ; 03:4C5C
    ld   hl,Data034C3B              ; 03:4C5E
    add  hl,de                      ; 03:4C61
    ldh  a,[<$FFA7]                 ; 03:4C62
    add  [hl]                       ; 03:4C64
    ldh  [<$FF97],a                 ; 03:4C65
    inc  hl                         ; 03:4C67
    ldh  a,[<$FFA8]                 ; 03:4C68
    adc  [hl]                       ; 03:4C6A
    ldh  [<$FF98],a                 ; 03:4C6B
    inc  hl                         ; 03:4C6D
    ldh  a,[<$FFA9]                 ; 03:4C6E
    add  [hl]                       ; 03:4C70
    ldh  [<$FF99],a                 ; 03:4C71
    ld   a,$03                      ; 03:4C73
    rst  $10                        ; 03:4C75
.dl SubL_064A0F                     ; 03:4C76
    ld   a,$32                      ; 03:4C79
    ldh  [<$FF97],a                 ; 03:4C7B
    xor  a                          ; 03:4C7D
    ldh  [<$FF98],a                 ; 03:4C7E
    call Sub002E30                  ; 03:4C80
    ld   de,$0008                   ; 03:4C83
    ld   a,$01                      ; 03:4C86
    call Return0010B2               ; 03:4C88
    ld   hl,$C27F                   ; 03:4C8B
    ld   a,[hl]                     ; 03:4C8E
    inc  a                          ; 03:4C8F
    and  $03                        ; 03:4C90
    ld   [hl],a                     ; 03:4C92
    ld   hl,$C280                   ; 03:4C93
    dec  [hl]                       ; 03:4C96
    ld   a,[hl]                     ; 03:4C97
    and  a                          ; 03:4C98
    ret  nz                         ; 03:4C99
    ld   hl,$C429                   ; 03:4C9A
    set  2,[hl]                     ; 03:4C9D
    ld   hl,$C1D3                   ; 03:4C9F
    inc  [hl]                       ; 03:4CA2
    ret                             ; 03:4CA3

BitTable8Asc_034CA4:                ; 03:4CA4
.db $01,$02,$04,$08,$10,$20,$40,$80
Code034CAC:
    ld   hl,$C1D1                   ; 03:4CAC
    ld   a,[hl]                     ; 03:4CAF
    and  a                          ; 03:4CB0
    jr   z,Code034CB5               ; 03:4CB1
    dec  [hl]                       ; 03:4CB3
    ret                             ; 03:4CB4

Code034CB5:
    ld   a,[$C20C]                  ; 03:4CB5
    cp   $01                        ; 03:4CB8
    jr   z,Code034CBF               ; 03:4CBA
    jr   nc,Code034CC5              ; 03:4CBC
    ret                             ; 03:4CBE

Code034CBF:
    ld   a,[$C20B]                  ; 03:4CBF
    cp   $2C                        ; 03:4CC2
    ret  c                          ; 03:4CC4
Code034CC5:
    xor  a                          ; 03:4CC5
    ld   [$C28E],a                  ; 03:4CC6
    ld   [$C1EF],a                  ; 03:4CC9
    ld   [$C182],a                  ; 03:4CCC
    ld   [$C20B],a                  ; 03:4CCF
    ld   [$C20C],a                  ; 03:4CD2
    ld   a,[$C283]                  ; 03:4CD5
    and  a                          ; 03:4CD8
    jr   z,Code034CE0               ; 03:4CD9
    ld   a,$20                      ; 03:4CDB
    ldh  [<H_GameState],a           ; 03:4CDD
    ret                             ; 03:4CDF

Code034CE0:
    ld   a,[W_SPFlag]               ; 03:4CE0
    and  a                          ; 03:4CE3
    jr   nz,Code034CF1              ; 03:4CE4
    call Sub034D36                  ; 03:4CE6
    ld   a,$03                      ; 03:4CE9
    rst  $10                        ; 03:4CEB
.dl SubL_0757EF                     ; 03:4CEC
    jr   Code034CF4                 ; 03:4CEF
Code034CF1:
    call Sub034D41                  ; 03:4CF1
Code034CF4:
    ld   a,[W_LevelID]              ; 03:4CF4
    and  $03                        ; 03:4CF7
    cp   $03                        ; 03:4CF9
    jr   nz,Code034D06              ; 03:4CFB
    ld   a,$01                      ; 03:4CFD
    ld   [$C1B7],a                  ; 03:4CFF
    ld   a,$04                      ; 03:4D02
    jr   Code034D0C                 ; 03:4D04
Code034D06:
    xor  a                          ; 03:4D06
    ld   [$C1B7],a                  ; 03:4D07
    ld   a,$07                      ; 03:4D0A
Code034D0C:
    ldh  [<H_GameState],a           ; 03:4D0C
    ld   hl,$C164                   ; 03:4D0E
    ld   [hl],$FF                   ; 03:4D11
    inc  hl                         ; 03:4D13
    ld   [hl],$01                   ; 03:4D14
    jr   Sub034D26                  ; 03:4D16

Sub034D18:
    ld   a,[W_SPFlag]               ; 03:4D18
    and  a                          ; 03:4D1B
    jr   nz,Code034D23              ; 03:4D1C
    call Sub034D36                  ; 03:4D1E
    jr   Sub034D26                  ; 03:4D21
Code034D23:
    call Sub034D41                  ; 03:4D23

Sub034D26:
    ld   hl,W_LevelID               ; 03:4D26
    inc  [hl]                       ; 03:4D29
    ld   a,[hl]                     ; 03:4D2A
    cp   $20                        ; 03:4D2B
    ret  nz                         ; 03:4D2D
    ld   [hl],$00                   ; 03:4D2E
    ld   a,$01                      ; 03:4D30
    ld   [W_HardFlag],a             ; 03:4D32
    ret                             ; 03:4D35

Sub034D36:
    call Sub034D41                  ; 03:4D36
    ld   hl,$C18E                   ; 03:4D39
    add  hl,de                      ; 03:4D3C
    ld   a,c                        ; 03:4D3D
    or   [hl]                       ; 03:4D3E
    ld   [hl],a                     ; 03:4D3F
    ret                             ; 03:4D40

Sub034D41:
    ld   a,[W_LevelID]              ; 03:4D41
    push af                         ; 03:4D44
    srl  a                          ; 03:4D45
    srl  a                          ; 03:4D47
    ld   e,a                        ; 03:4D49
    ld   d,$00                      ; 03:4D4A
    ld   hl,BitTable8Asc_034CA4     ; 03:4D4C
    add  hl,de                      ; 03:4D4F
    ld   c,[hl]                     ; 03:4D50
    pop  af                         ; 03:4D51
    and  $03                        ; 03:4D52
    ld   e,a                        ; 03:4D54
    ld   hl,$C1A9                   ; 03:4D55
    add  hl,de                      ; 03:4D58
    ld   a,c                        ; 03:4D59
    or   [hl]                       ; 03:4D5A
    ld   [hl],a                     ; 03:4D5B
    ret                             ; 03:4D5C

Data034D5D:                         ; 03:4D5D
.db $04,$08,$08,$08,$08,$08,$08,$08,\
    $08,$08,$08,$00
Data034D69:                         ; 03:4D69
.db $01,$00,$01,$00,$01,$00,$01,$00,\
    $01,$00,$01,$00
Code034D75:
    ld   a,[W_GameMode]             ; 03:4D75
    cp   $02                        ; 03:4D78
    jr   z,Code034D80               ; 03:4D7A
    xor  a                          ; 03:4D7C
    ld   [$C181],a                  ; 03:4D7D
Code034D80:
    ld   d,$00                      ; 03:4D80
    ld   a,[$C1D4]                  ; 03:4D82
    ld   e,a                        ; 03:4D85
    ld   hl,$C1C4                   ; 03:4D86
    ld   a,[hl]                     ; 03:4D89
    and  a                          ; 03:4D8A
    jr   nz,Code034DB6              ; 03:4D8B
    ld   [hl],$04                   ; 03:4D8D
    inc  e                          ; 03:4D8F
    ld   a,e                        ; 03:4D90
    ld   [$C1D4],a                  ; 03:4D91
    cp   $0B                        ; 03:4D94
    jr   nz,Code034DB6              ; 03:4D96
    xor  a                          ; 03:4D98
    ld   [$C1D4],a                  ; 03:4D99
    ld   [W_PlayerState],a          ; 03:4D9C
    ld   [$C1CE],a                  ; 03:4D9F
    ld   [$C1F7],a                  ; 03:4DA2
    ld   [$C1C2],a                  ; 03:4DA5
    ld   [$C1C5],a                  ; 03:4DA8
    inc  a                          ; 03:4DAB
    ld   [$C181],a                  ; 03:4DAC
    ld   a,$03                      ; 03:4DAF
    rst  $10                        ; 03:4DB1
.dl SubL_0B421E                     ; 03:4DB2
    ret                             ; 03:4DB5

Code034DB6:
    dec  [hl]                       ; 03:4DB6
    ld   hl,Data034D5D              ; 03:4DB7
    add  hl,de                      ; 03:4DBA
    ld   a,[hl]                     ; 03:4DBB
    ld   [$C1C2],a                  ; 03:4DBC
    ld   hl,Data034D69              ; 03:4DBF
    add  hl,de                      ; 03:4DC2
    ld   a,[hl]                     ; 03:4DC3
    ld   [$C1C5],a                  ; 03:4DC4
    ret                             ; 03:4DC7

Data034DC8:                         ; 03:4DC8
.db $00,$0F,$00,$0F,$00,$0F,$00,$00,\
    $0F,$00,$00,$00,$00,$00,$00,$00
Data034DD8:                         ; 03:4DD8
.db $00,$01,$00,$01,$00,$01,$01,$00,\
    $01,$01,$00,$01,$01,$01,$01,$01
Code034DE8:
    ld   a,[W_GameMode]             ; 03:4DE8
    cp   $02                        ; 03:4DEB
    jr   z,Code034DF3               ; 03:4DED
    xor  a                          ; 03:4DEF
    ld   [$C181],a                  ; 03:4DF0
Code034DF3:
    ld   d,$00                      ; 03:4DF3
    ld   a,[$C1D4]                  ; 03:4DF5
    ld   e,a                        ; 03:4DF8
    ld   hl,$C1C4                   ; 03:4DF9
    ld   a,[hl]                     ; 03:4DFC
    and  a                          ; 03:4DFD
    jr   nz,Code034E1F              ; 03:4DFE
    ld   [hl],$04                   ; 03:4E00
    inc  e                          ; 03:4E02
    ld   a,e                        ; 03:4E03
    ld   [$C1D4],a                  ; 03:4E04
    cp   $0F                        ; 03:4E07
    jr   nz,Code034E1F              ; 03:4E09
    xor  a                          ; 03:4E0B
    ld   [$C1D4],a                  ; 03:4E0C
    ld   a,[$C1D9]                  ; 03:4E0F
    cp   $01                        ; 03:4E12
    jr   nz,Code034E17              ; 03:4E14
    xor  a                          ; 03:4E16
Code034E17:
    ld   [W_PlayerState],a          ; 03:4E17
    ld   a,$01                      ; 03:4E1A
    ld   [$C181],a                  ; 03:4E1C
Code034E1F:
    dec  [hl]                       ; 03:4E1F
    ld   hl,Data034DC8              ; 03:4E20
    add  hl,de                      ; 03:4E23
    ld   a,[hl]                     ; 03:4E24
    ld   [$C1C2],a                  ; 03:4E25
    ld   hl,Data034DD8              ; 03:4E28
    add  hl,de                      ; 03:4E2B
    ld   a,[hl]                     ; 03:4E2C
    ld   [$C1C5],a                  ; 03:4E2D
    ret                             ; 03:4E30

Code034E31:
    ld   a,[W_GameMode]             ; 03:4E31
    cp   $02                        ; 03:4E34
    jr   z,Code034E3C               ; 03:4E36
    xor  a                          ; 03:4E38
    ld   [$C181],a                  ; 03:4E39
Code034E3C:
    ld   d,$00                      ; 03:4E3C
    ld   a,[$C1D4]                  ; 03:4E3E
    ld   e,a                        ; 03:4E41
    ld   hl,$C1C4                   ; 03:4E42
    ld   a,[hl]                     ; 03:4E45
    and  a                          ; 03:4E46
    jr   nz,Code034E68              ; 03:4E47
    ld   [hl],$02                   ; 03:4E49
    inc  e                          ; 03:4E4B
    ld   a,e                        ; 03:4E4C
    ld   [$C1D4],a                  ; 03:4E4D
    cp   $17                        ; 03:4E50
    jr   nz,Code034E68              ; 03:4E52
    ld   a,[$C1D9]                  ; 03:4E54
    ld   [W_PlayerState],a          ; 03:4E57
    ld   a,$01                      ; 03:4E5A
    ld   [$C1CE],a                  ; 03:4E5C
    ld   [$C181],a                  ; 03:4E5F
    inc  a                          ; 03:4E62
    ld   [$C1D4],a                  ; 03:4E63
    jr   Code034E69                 ; 03:4E66
Code034E68:
    dec  [hl]                       ; 03:4E68
Code034E69:
    ld   a,$03                      ; 03:4E69
    rst  $10                        ; 03:4E6B
.dl SubL_0B42F4                     ; 03:4E6C
    ret                             ; 03:4E6F

Return034E70:
    ret                             ; 03:4E70

Code034E71:
    ld   a,[$C1D3]                  ; 03:4E71
    rst  $00                        ; 03:4E74
.dw Code034E8D                      ; 03:4E75
.dw Code034EFC                      ; 03:4E77
.dw Code034FA9                      ; 03:4E79
.dw Code035000                      ; 03:4E7B
.dw Code035071                      ; 03:4E7D
.dw Code0350C3                      ; 03:4E7F
.dw Code035349                      ; 03:4E81
.dw Code0353CF                      ; 03:4E83
.dw Code0353E6                      ; 03:4E85
.dw Sub03540B                       ; 03:4E87
.dw Return035429                    ; 03:4E89
.dw Code03542A                      ; 03:4E8B
Code034E8D:
    xor  a                          ; 03:4E8D
    ld   [$C28E],a                  ; 03:4E8E
    ld   [$D2F6],a                  ; 03:4E91
    ld   de,$0000                   ; 03:4E94
Code034E97:
    ld   hl,W_SpriteStatus          ; 03:4E97
    add  hl,de                      ; 03:4E9A
    ld   a,[hl]                     ; 03:4E9B
    and  a                          ; 03:4E9C
    jr   z,Code034EDB               ; 03:4E9D
    ld   hl,W_SpriteID              ; 03:4E9F
    add  hl,de                      ; 03:4EA2
    ld   a,[hl]                     ; 03:4EA3
    cp   $1A                        ; 03:4EA4
    jr   nz,Code034EDB              ; 03:4EA6
    ld   hl,W_SpriteSubstate        ; 03:4EA8
    add  hl,de                      ; 03:4EAB
    ld   a,[hl]                     ; 03:4EAC
    cp   $03                        ; 03:4EAD
    jr   z,Code034EE1               ; 03:4EAF
    call Sub036CA0                  ; 03:4EB1
    jr   c,Code034ECA               ; 03:4EB4
    ld   a,[$C265]                  ; 03:4EB6
    ldh  [<$FF97],a                 ; 03:4EB9
    ld   a,[$C267]                  ; 03:4EBB
    sub  $10                        ; 03:4EBE
    ldh  [<$FF98],a                 ; 03:4EC0
    ld   de,$0003                   ; 03:4EC2
    ld   a,$03                      ; 03:4EC5
    call Sub001124                  ; 03:4EC7
Code034ECA:
    ld   a,$04                      ; 03:4ECA
    ld   [$C269],a                  ; 03:4ECC
    ld   [$C268],a                  ; 03:4ECF
    xor  a                          ; 03:4ED2
    ld   [$C26A],a                  ; 03:4ED3
    ld   hl,$C1D3                   ; 03:4ED6
    inc  [hl]                       ; 03:4ED9
    ret                             ; 03:4EDA

Code034EDB:
    inc  e                          ; 03:4EDB
    ld   a,e                        ; 03:4EDC
    cp   $0F                        ; 03:4EDD
    jr   nz,Code034E97              ; 03:4EDF
Code034EE1:
    ld   hl,$C1D3                   ; 03:4EE1
    ld   a,$04                      ; 03:4EE4
    ld   [hl],a                     ; 03:4EE6
    ld   a,$01                      ; 03:4EE7
    ld   [$D2F6],a                  ; 03:4EE9
    ld   a,[W_GameMode]             ; 03:4EEC
    cp   $02                        ; 03:4EEF
    jp   z,Code03502B               ; 03:4EF1
    cp   $07                        ; 03:4EF4
    jp   z,Code035030               ; 03:4EF6
    jp   Code035039                 ; 03:4EF9
Code034EFC:
    ld   hl,$C269                   ; 03:4EFC
    dec  [hl]                       ; 03:4EFF
    ld   a,[hl]                     ; 03:4F00
    and  a                          ; 03:4F01
    ret  nz                         ; 03:4F02
    ld   [hl],$04                   ; 03:4F03
    ld   a,$41                      ; 03:4F05
    ldh  [<$FFF4],a                 ; 03:4F07
    ld   de,$0002                   ; 03:4F09
    ld   a,$01                      ; 03:4F0C
    call Return0010B2               ; 03:4F0E
    ld   a,[W_GameMode]             ; 03:4F11
    cp   $02                        ; 03:4F14
    jr   z,Code034F3D               ; 03:4F16
    ld   a,[$C265]                  ; 03:4F18
    ldh  [<$FF97],a                 ; 03:4F1B
    ld   a,[$C267]                  ; 03:4F1D
    ldh  [<$FF98],a                 ; 03:4F20
    ld   de,$0003                   ; 03:4F22
    ld   a,$03                      ; 03:4F25
    call Sub001124                  ; 03:4F27
    ld   a,[$C265]                  ; 03:4F2A
    sub  $10                        ; 03:4F2D
    ld   [$C265],a                  ; 03:4F2F
    ret  nc                         ; 03:4F32
    ld   a,$20                      ; 03:4F33
    ld   [$C269],a                  ; 03:4F35
    ld   hl,$C1D3                   ; 03:4F38
    inc  [hl]                       ; 03:4F3B
    ret                             ; 03:4F3C

Code034F3D:
    ld   a,[$C265]                  ; 03:4F3D
    ldh  [<$FF97],a                 ; 03:4F40
    ld   a,[$C267]                  ; 03:4F42
    ldh  [<$FF98],a                 ; 03:4F45
    call Sub036CA0                  ; 03:4F47
    jr   c,Code034F54               ; 03:4F4A
    ld   de,$0003                   ; 03:4F4C
    ld   a,$03                      ; 03:4F4F
    call Sub001124                  ; 03:4F51
Code034F54:
    ld   a,$06                      ; 03:4F54
    ldh  [<SVBK],a                  ; 03:4F56
    ld   a,[$C266]                  ; 03:4F58
    and  $0F                        ; 03:4F5B
    ld   d,a                        ; 03:4F5D
    ld   e,$00                      ; 03:4F5E
    ld   hl,W_SubLv16x16Tilemap     ; 03:4F60
    add  hl,de                      ; 03:4F63
    ld   d,$00                      ; 03:4F64
    ld   a,[$C267]                  ; 03:4F66
    and  $F0                        ; 03:4F69
    ld   e,a                        ; 03:4F6B
    add  hl,de                      ; 03:4F6C
    ld   a,[$C265]                  ; 03:4F6D
    and  $F0                        ; 03:4F70
    swap a                          ; 03:4F72
    ld   e,a                        ; 03:4F74
    add  hl,de                      ; 03:4F75
    ld   [hl],$03                   ; 03:4F76
    xor  a                          ; 03:4F78
    ldh  [<SVBK],a                  ; 03:4F79
    ld   a,[$C265]                  ; 03:4F7B
    sub  $10                        ; 03:4F7E
    ld   [$C265],a                  ; 03:4F80
    ld   a,[$C266]                  ; 03:4F83
    sbc  $00                        ; 03:4F86
    ld   [$C266],a                  ; 03:4F88
    ld   e,$0D                      ; 03:4F8B
    ld   a,[W_SublevelID]           ; 03:4F8D
    cp   $3D                        ; 03:4F90
    jr   z,Code034F96               ; 03:4F92
    ld   e,$0C                      ; 03:4F94
Code034F96:
    ld   hl,$C26A                   ; 03:4F96
    inc  [hl]                       ; 03:4F99
    ld   a,[hl]                     ; 03:4F9A
    cp   e                          ; 03:4F9B
    ret  c                          ; 03:4F9C
    xor  a                          ; 03:4F9D
    ld   [hl],a                     ; 03:4F9E
    ld   a,$20                      ; 03:4F9F
    ld   [$C269],a                  ; 03:4FA1
    ld   hl,$C1D3                   ; 03:4FA4
    inc  [hl]                       ; 03:4FA7
    ret                             ; 03:4FA8

Code034FA9:
    ld   hl,$C269                   ; 03:4FA9
    dec  [hl]                       ; 03:4FAC
    ld   a,[hl]                     ; 03:4FAD
    and  a                          ; 03:4FAE
    jr   nz,Return034FE7            ; 03:4FAF
    ld   de,$0000                   ; 03:4FB1
Code034FB4:
    ld   hl,W_SpriteStatus          ; 03:4FB4
    add  hl,de                      ; 03:4FB7
    ld   a,[hl]                     ; 03:4FB8
    and  a                          ; 03:4FB9
    jr   z,Code034FC5               ; 03:4FBA
    ld   hl,W_SpriteID              ; 03:4FBC
    add  hl,de                      ; 03:4FBF
    ld   a,[hl]                     ; 03:4FC0
    cp   $1A                        ; 03:4FC1
    jr   z,Code034FCB               ; 03:4FC3
Code034FC5:
    inc  e                          ; 03:4FC5
    ld   a,e                        ; 03:4FC6
    cp   $0F                        ; 03:4FC7
    jr   nz,Code034FB4              ; 03:4FC9
Code034FCB:
    ld   hl,W_SpriteSubstate        ; 03:4FCB
    add  hl,de                      ; 03:4FCE
    ld   [hl],$01                   ; 03:4FCF
    ld   hl,W_SpriteYSpeed          ; 03:4FD1
    add  hl,de                      ; 03:4FD4
    xor  a                          ; 03:4FD5
    ld   [hl],a                     ; 03:4FD6
    ld   hl,W_SpriteXSpeed          ; 03:4FD7
    add  hl,de                      ; 03:4FDA
    ld   [hl],a                     ; 03:4FDB
    ld   [$C268],a                  ; 03:4FDC
    ld   a,$4A                      ; 03:4FDF
    ldh  [<$FFF2],a                 ; 03:4FE1
    ld   hl,$C1D3                   ; 03:4FE3
    inc  [hl]                       ; 03:4FE6
Return034FE7:
    ret                             ; 03:4FE7

Data034FE8:                         ; 03:4FE8
.db $95,$95,$95,$B5,$95,$95,$D5,$35,\
    $96,$96,$96,$B6,$96,$96,$D6,$36
Data034FF8:                         ; 03:4FF8
.db $95,$95,$B5,$D5,$D5,$D5,$F5,$95
Code035000:
    ld   de,$0000                   ; 03:5000
Code035003:
    ld   hl,W_SpriteStatus          ; 03:5003
    add  hl,de                      ; 03:5006
    ld   a,[hl]                     ; 03:5007
    and  a                          ; 03:5008
    jr   z,Code035014               ; 03:5009
    ld   hl,W_SpriteID              ; 03:500B
    add  hl,de                      ; 03:500E
    ld   a,[hl]                     ; 03:500F
    cp   $1A                        ; 03:5010
    jr   z,Return035070             ; 03:5012
Code035014:
    inc  e                          ; 03:5014
    ld   a,e                        ; 03:5015
    cp   $0F                        ; 03:5016
    jr   nz,Code035003              ; 03:5018
    ld   hl,$C1D3                   ; 03:501A
    inc  [hl]                       ; 03:501D
    ld   a,[W_GameMode]             ; 03:501E
    cp   $02                        ; 03:5021
    jr   z,Code03502B               ; 03:5023
    cp   $07                        ; 03:5025
    jr   z,Code035030               ; 03:5027
    jr   Code035039                 ; 03:5029
Code03502B:
    ld   a,$01                      ; 03:502B
    ld   [$C0C3],a                  ; 03:502D
Code035030:
    xor  a                          ; 03:5030
    ld   [$C168],a                  ; 03:5031
    ld   a,$25                      ; 03:5034
    ldh  [<H_GameState],a           ; 03:5036
    ret                             ; 03:5038

Code035039:
    ld   a,$6B                      ; 03:5039
    ld   [$DE68],a                  ; 03:503B
    ld   hl,Data034FE8              ; 03:503E
    ld   a,[W_SPFlag]               ; 03:5041
    and  a                          ; 03:5044
    jr   z,Code03504A               ; 03:5045
    ld   hl,Data034FF8              ; 03:5047
Code03504A:
    ld   a,[W_LevelID]              ; 03:504A
    srl  a                          ; 03:504D
    srl  a                          ; 03:504F
    ld   e,a                        ; 03:5051
    ld   d,$00                      ; 03:5052
    add  hl,de                      ; 03:5054
    ld   a,[$C283]                  ; 03:5055
    and  a                          ; 03:5058
    jr   z,Code03505F               ; 03:5059
    ld   de,$0008                   ; 03:505B
    add  hl,de                      ; 03:505E
Code03505F:
    ld   a,[hl]                     ; 03:505F
    ld   e,a                        ; 03:5060
    and  $0F                        ; 03:5061
    swap a                          ; 03:5063
    ld   [$C265],a                  ; 03:5065
    ld   a,e                        ; 03:5068
    and  $F0                        ; 03:5069
    swap a                          ; 03:506B
    ld   [$C267],a                  ; 03:506D
Return035070:
    ret                             ; 03:5070

Code035071:
    ld   a,$01                      ; 03:5071
    ld   [$C264],a                  ; 03:5073
    ld   a,$10                      ; 03:5076
    ld   [$C25E],a                  ; 03:5078
    call Sub035680                  ; 03:507B
    call Sub0361DF                  ; 03:507E
    call Sub03650F                  ; 03:5081
    call Sub035A14                  ; 03:5084
    ld   hl,$C267                   ; 03:5087
    ldh  a,[<$FFA8]                 ; 03:508A
    cp   [hl]                       ; 03:508C
    jr   nz,Code0350A4              ; 03:508D
    ld   hl,$C265                   ; 03:508F
    ldh  a,[<$FFA7]                 ; 03:5092
    cp   [hl]                       ; 03:5094
    jr   c,Code0350A4               ; 03:5095
    ld   hl,$C1D3                   ; 03:5097
    inc  [hl]                       ; 03:509A
    ld   a,$10                      ; 03:509B
    ld   [$C269],a                  ; 03:509D
    xor  a                          ; 03:50A0
    ld   [$C1C2],a                  ; 03:50A1
Code0350A4:
    ld   a,[$C161]                  ; 03:50A4
    dec  a                          ; 03:50A7
    ld   hl,$FFB9                   ; 03:50A8
    cp   [hl]                       ; 03:50AB
    jr   nz,Return0350C2            ; 03:50AC
    ldh  a,[<$FFB8]                 ; 03:50AE
    cp   $04                        ; 03:50B0
    jr   c,Return0350C2             ; 03:50B2
    xor  a                          ; 03:50B4
    ld   [$C1D6],a                  ; 03:50B5
    ld   a,$04                      ; 03:50B8
    ldh  [<$FFB8],a                 ; 03:50BA
    ld   a,[$C161]                  ; 03:50BC
    dec  a                          ; 03:50BF
    ldh  [<$FFB9],a                 ; 03:50C0
Return0350C2:
    ret                             ; 03:50C2

Code0350C3:
    ld   a,[$C161]                  ; 03:50C3
    dec  a                          ; 03:50C6
    ld   hl,$FFB9                   ; 03:50C7
    cp   [hl]                       ; 03:50CA
    jr   nz,Code0350D3              ; 03:50CB
    ldh  a,[<$FFB8]                 ; 03:50CD
    cp   $04                        ; 03:50CF
    jr   nc,Code0350D9              ; 03:50D1
Code0350D3:
    ld   a,$02                      ; 03:50D3
    ld   [$C1D6],a                  ; 03:50D5
    ret                             ; 03:50D8

Code0350D9:
    ld   a,$04                      ; 03:50D9
    ldh  [<$FFB8],a                 ; 03:50DB
    ld   a,[$C161]                  ; 03:50DD
    dec  a                          ; 03:50E0
    ldh  [<$FFB9],a                 ; 03:50E1
    ld   hl,$C269                   ; 03:50E3
    dec  [hl]                       ; 03:50E6
    ld   a,[hl]                     ; 03:50E7
    and  a                          ; 03:50E8
    ret  nz                         ; 03:50E9
    ld   [hl],$20                   ; 03:50EA
    xor  a                          ; 03:50EC
    ld   [$C265],a                  ; 03:50ED
    ld   hl,$C1D3                   ; 03:50F0
    inc  [hl]                       ; 03:50F3
    ld   a,[$C283]                  ; 03:50F4
    and  a                          ; 03:50F7
    jr   z,Code035102               ; 03:50F8
    ld   [hl],$07                   ; 03:50FA
    ld   a,$30                      ; 03:50FC
    ld   [$C1D1],a                  ; 03:50FE
    ret                             ; 03:5101

Code035102:
    ld   a,[W_LevelID]              ; 03:5102
    srl  a                          ; 03:5105
    srl  a                          ; 03:5107
    cp   $07                        ; 03:5109
    jr   z,Code035124               ; 03:510B
    call Sub03540B                  ; 03:510D
    ld   a,[W_SPFlag]               ; 03:5110
    and  a                          ; 03:5113
    jr   nz,Code035120              ; 03:5114
    call Sub034D36                  ; 03:5116
    ld   a,$03                      ; 03:5119
    rst  $10                        ; 03:511B
.dl SubL_0757EF                     ; 03:511C
    ret                             ; 03:511F

Code035120:
    call Sub034D41                  ; 03:5120
    ret                             ; 03:5123

Code035124:
    ld   a,[W_LevelID]              ; 03:5124
    push af                         ; 03:5127
    ld   a,[W_HardFlag]             ; 03:5128
    push af                         ; 03:512B
    call Sub03540B                  ; 03:512C
    call Sub035513                  ; 03:512F
    call Sub035457                  ; 03:5132
    pop  af                         ; 03:5135
    ld   [W_HardFlag],a             ; 03:5136
    pop  af                         ; 03:5139
    ld   [W_LevelID],a              ; 03:513A
    ret                             ; 03:513D

Data03513E:                         ; 03:513E
.db $9A,$23,$10,$00,$ED,$00,$E1,$00,\
    $DA,$00,$E7,$00,$E4,$00,$F4,$00,\
    $F2,$00,$E8,$00,$EE,$00,$FC,$00,\
    $E5,$00,$EE,$00,$E2,$00,$E0,$00,\
    $E2,$00,$FB,$00
Data035162:                         ; 03:5162
.db $9A,$23,$10,$00,$ED,$00,$E1,$00,\
    $DA,$00,$E7,$00,$E4,$00,$F4,$00,\
    $F2,$00,$E8,$00,$EE,$00,$FC,$00,\
    $E5,$00,$EE,$00,$E2,$00,$E0,$00,\
    $E2,$00,$FB,$00
Data035186:                         ; 03:5186
.db $9A,$23,$10,$00,$ED,$00,$E1,$00,\
    $DA,$00,$E7,$00,$E4,$00,$F4,$00,\
    $F2,$00,$E8,$00,$EE,$00,$FC,$00,\
    $E6,$00,$DA,$00,$EB,$00,$E2,$00,\
    $E8,$00,$FB,$00
Data0351AA:                         ; 03:51AA
.db $9A,$81,$13,$00,$DB,$00,$EE,$00,\
    $ED,$00,$F4,$00,$E8,$00,$EE,$00,\
    $EB,$00,$F4,$00,$E9,$00,$EB,$00,\
    $E2,$00,$E7,$00,$DC,$00,$DE,$00,\
    $EC,$00,$EC,$00,$F4,$00,$E2,$00,\
    $EC,$00
Data0351D4:                         ; 03:51D4
.db $9A,$C1,$12,$00,$E2,$00,$E7,$00,\
    $F4,$00,$DA,$00,$E7,$00,$E8,$00,\
    $ED,$00,$E1,$00,$DE,$00,$EB,$00,\
    $F4,$00,$DC,$00,$DA,$00,$EC,$00,\
    $ED,$00,$E5,$00,$DE,$00,$FB,$00
Data0351FC:                         ; 03:51FC
.db $9A,$24,$0E,$00,$F0,$00,$E8,$00,\
    $F0,$00,$FB,$00,$F4,$00,$F2,$00,\
    $E8,$00,$EE,$00,$F4,$00,$DA,$00,\
    $EB,$00,$DE,$00,$F4,$00,$DA,$00
Data03521C:                         ; 03:521C
.db $9A,$84,$0D,$00,$EC,$00,$EE,$00,\
    $E9,$00,$DE,$00,$EB,$00,$F4,$00,\
    $E9,$00,$E5,$00,$DA,$00,$F2,$00,\
    $DE,$00,$EB,$00,$FB,$00
Data03523A:                         ; 03:523A
.db $9A,$E3,$10,$00,$DC,$00,$E8,$00,\
    $E7,$00,$E0,$00,$EB,$00,$DA,$00,\
    $ED,$00,$EE,$00,$E5,$00,$DA,$00,\
    $ED,$00,$E2,$00,$E8,$00,$E7,$00,\
    $EC,$00,$FB,$00
Data03525E:                         ; 03:525E
.db $9A,$23,$10,$00,$ED,$00,$E1,$00,\
    $DA,$00,$E7,$00,$E4,$00,$F4,$00,\
    $F2,$00,$E8,$00,$EE,$00,$FC,$00,\
    $E6,$00,$DA,$00,$EB,$00,$E2,$00,\
    $E8,$00,$FB,$00
Data035282:                         ; 03:5282
.db $9A,$81,$13,$00,$F2,$00,$E8,$00,\
    $EE,$00,$EB,$00,$F4,$00,$EA,$00,\
    $EE,$00,$DE,$00,$EC,$00,$ED,$00,\
    $F4,$00,$E2,$00,$EC,$00,$F4,$00,\
    $E8,$00,$EF,$00,$DE,$00,$EB,$00,\
    $CE,$00
Data0352AC:                         ; 03:52AC
.db $9A,$C3,$0E,$00,$F0,$00,$DE,$00,\
    $F4,$00,$E9,$00,$EB,$00,$DE,$00,\
    $EC,$00,$DE,$00,$E7,$00,$ED,$00,\
    $F4,$00,$F2,$00,$E8,$00,$EE,$9B,\
    $02,$11,$00,$F0,$00,$E2,$00,$ED,\
    $00,$E1,$00,$F4,$00,$DA,$00,$F4,\
    $00,$E7,$00,$DE,$00,$F0,$00,$F4,\
    $00,$EA,$00,$EE,$00,$DE,$00,$EC,\
    $00,$ED,$00,$CE,$00
DataPtrs0352F1:                     ; 03:52F1
.dw Data03513E, Data035162, Data035186, Data035186,\
    Data0351AA, Data0351D4, Data0351FC, Data03521C,\
    Data03523A, Data03525E, Data035282, Data0352AC,\
    Data03513E, Data0351AA, Data0351D4, Data035162,\
    Data035282, Data0352AC
Data035315:                         ; 03:5315
.db $24,$00,$24,$00,$00,$00,$24,$00,\
    $2A,$00,$28,$00,$20,$00,$1E,$00,\
    $24,$00,$24,$00,$2A,$00,$45,$00,\
    $24,$00,$2A,$00,$28,$00,$24,$00,\
    $2A,$00,$45,$00
Data035339:                         ; 03:5339
.db $06,$06,$06,$06,$06,$06,$06,$12,\
    $18,$18,$18,$18,$18,$18,$18,$1E

Code035349:
    ld   hl,$C269                   ; 03:5349
    dec  [hl]                       ; 03:534C
    ld   a,[hl]                     ; 03:534D
    and  a                          ; 03:534E
    jr   z,Code035352               ; 03:534F
    ret                             ; 03:5351

Code035352:
    ld   [hl],$50                   ; 03:5352
    ld   a,[W_LevelID]              ; 03:5354
    srl  a                          ; 03:5357
    srl  a                          ; 03:5359
    ld   e,a                        ; 03:535B
    ld   d,$00                      ; 03:535C
    ld   a,[W_CurrentPlayer]        ; 03:535E
    and  a                          ; 03:5361
    jr   z,Code035368               ; 03:5362
    ld   a,e                        ; 03:5364
    add  $08                        ; 03:5365
    ld   e,a                        ; 03:5367
Code035368:
    ld   hl,Data035339              ; 03:5368
    add  hl,de                      ; 03:536B
    ld   e,[hl]                     ; 03:536C
    ld   a,e                        ; 03:536D
    cp   $12                        ; 03:536E
    jr   z,Code035376               ; 03:5370
    cp   $1E                        ; 03:5372
    jr   nz,Code035384              ; 03:5374
Code035376:
    ld   a,[W_SPFlag]               ; 03:5376
    and  a                          ; 03:5379
    jr   nz,Code035382              ; 03:537A
    ld   a,[W_HardFlag]             ; 03:537C
    and  a                          ; 03:537F
    jr   z,Code035384               ; 03:5380
Code035382:
    ld   e,$0C                      ; 03:5382
Code035384:
    ld   a,[$C265]                  ; 03:5384
    sla  a                          ; 03:5387
    ld   l,a                        ; 03:5389
    ld   h,$00                      ; 03:538A
    add  hl,de                      ; 03:538C
    ld   e,l                        ; 03:538D
    ld   hl,Data035315              ; 03:538E
    add  hl,de                      ; 03:5391
    ld   c,[hl]                     ; 03:5392
    ld   hl,DataPtrs0352F1          ; 03:5393
    add  hl,de                      ; 03:5396
    ld   e,[hl]                     ; 03:5397
    inc  hl                         ; 03:5398
    ld   d,[hl]                     ; 03:5399
    ld   h,d                        ; 03:539A
    ld   l,e                        ; 03:539B
    ld   de,$0000                   ; 03:539C
Code03539F:
    ldi  a,[hl]                     ; 03:539F
    push hl                         ; 03:53A0
    ld   hl,$DF01                   ; 03:53A1
    add  hl,de                      ; 03:53A4
    ld   [hl],a                     ; 03:53A5
    pop  hl                         ; 03:53A6
    inc  e                          ; 03:53A7
    ld   a,e                        ; 03:53A8
    cp   c                          ; 03:53A9
    jr   nz,Code03539F              ; 03:53AA
    ld   a,[$C265]                  ; 03:53AC
    inc  a                          ; 03:53AF
    ld   [$C265],a                  ; 03:53B0
    cp   $03                        ; 03:53B3
    jr   nz,Return0353CE            ; 03:53B5
    ld   hl,$C1D3                   ; 03:53B7
    ld   [hl],$08                   ; 03:53BA
    ld   a,[W_LevelID]              ; 03:53BC
    srl  a                          ; 03:53BF
    srl  a                          ; 03:53C1
    cp   $07                        ; 03:53C3
    jr   nz,Code0353C9              ; 03:53C5
    ld   [hl],$09                   ; 03:53C7
Code0353C9:
    ld   a,$F0                      ; 03:53C9
    ld   [$C269],a                  ; 03:53CB
Return0353CE:
    ret                             ; 03:53CE

Code0353CF:
    call Sub034C07                  ; 03:53CF
    jr   c,Return0353E5             ; 03:53D2
    and  a                          ; 03:53D4
    jr   z,Code0353E2               ; 03:53D5
    push hl                         ; 03:53D7
    ld   a,$F0                      ; 03:53D8
    ld   [$C269],a                  ; 03:53DA
    ld   hl,$C1D3                   ; 03:53DD
    inc  [hl]                       ; 03:53E0
    pop  hl                         ; 03:53E1
Code0353E2:
    jp   Code034BFA                 ; 03:53E2
Return0353E5:
    ret                             ; 03:53E5

Code0353E6:
    ld   hl,$C269                   ; 03:53E6
    dec  [hl]                       ; 03:53E9
    ld   a,[hl]                     ; 03:53EA
    and  a                          ; 03:53EB
    ret  nz                         ; 03:53EC
    xor  a                          ; 03:53ED
    ld   [$C28E],a                  ; 03:53EE
    ld   [$C1EF],a                  ; 03:53F1
    ld   [$C182],a                  ; 03:53F4
    ld   [$C20B],a                  ; 03:53F7
    ld   [$C20C],a                  ; 03:53FA
    ld   a,[$C283]                  ; 03:53FD
    and  a                          ; 03:5400
    jr   z,Code035408               ; 03:5401
    ld   a,$20                      ; 03:5403
    ldh  [<H_GameState],a           ; 03:5405
    ret                             ; 03:5407

Code035408:
    jp   Code034CF4                 ; 03:5408

Sub03540B:
    ld   hl,$C269                   ; 03:540B
    ld   a,[hl]                     ; 03:540E
    cp   $00                        ; 03:540F
    jr   z,Code03541E               ; 03:5411
    cp   $80                        ; 03:5413
    jr   nz,Code03541C              ; 03:5415
    ld   a,$6A                      ; 03:5417
    ld   [$DE68],a                  ; 03:5419
Code03541C:
    dec  [hl]                       ; 03:541C
    ret                             ; 03:541D

Code03541E:
    xor  a                          ; 03:541E
    ld   [$C265],a                  ; 03:541F
    ld   [$C269],a                  ; 03:5422
    ld   hl,$C1D3                   ; 03:5425
    inc  [hl]                       ; 03:5428
Return035429:
    ret                             ; 03:5429

Code03542A:
    ldh  a,[<$FF8C]                 ; 03:542A
    and  $03                        ; 03:542C
    ret  z                          ; 03:542E
    ld   a,[$C283]                  ; 03:542F
    and  a                          ; 03:5432
    jr   nz,Code035438              ; 03:5433
    call Sub034D26                  ; 03:5435
Code035438:
    xor  a                          ; 03:5438
    ldh  [<H_GameSubstate],a        ; 03:5439
    ld   [$C168],a                  ; 03:543B
    ld   a,$20                      ; 03:543E
    ld   [$C1AD],a                  ; 03:5440
    ld   a,$3A                      ; 03:5443
    ldh  [<H_GameState],a           ; 03:5445
    ld   a,[$C283]                  ; 03:5447
    and  a                          ; 03:544A
    ret  nz                         ; 03:544B
    xor  a                          ; 03:544C
    ld   [$C1F2],a                  ; 03:544D
    ld   [$C1EF],a                  ; 03:5450
    ld   [$C182],a                  ; 03:5453
    ret                             ; 03:5456

Sub035457:
    ld   hl,$C169                   ; 03:5457
    set  0,[hl]                     ; 03:545A
    ld   hl,$C362                   ; 03:545C
    ld   a,[W_LevelID]              ; 03:545F
    ld   [hl],a                     ; 03:5462
    ld   a,[W_HardFlag]             ; 03:5463
    and  a                          ; 03:5466
    jr   z,Code03547B               ; 03:5467
    ld   a,[$C169]                  ; 03:5469
    or   $03                        ; 03:546C
    ld   [$C169],a                  ; 03:546E
    set  7,[hl]                     ; 03:5471
    ld   a,[$C429]                  ; 03:5473
    or   $10                        ; 03:5476
    ld   [$C429],a                  ; 03:5478
Code03547B:
    call Sub034D18                  ; 03:547B
    ld   a,[W_SPFlag]               ; 03:547E
    and  a                          ; 03:5481
    jr   z,Code035494               ; 03:5482
    ld   a,[$C429]                  ; 03:5484
    or   $08                        ; 03:5487
    ld   [$C429],a                  ; 03:5489
    ld   a,$03                      ; 03:548C
    rst  $10                        ; 03:548E
.dl SubL_094736                     ; 03:548F
    jr   Code0354E0                 ; 03:5492
Code035494:
    ld   a,[$C429]                  ; 03:5494
    or   $40                        ; 03:5497
    ld   [$C429],a                  ; 03:5499
    ld   a,[$C42A]                  ; 03:549C
    or   $40                        ; 03:549F
    ld   [$C42A],a                  ; 03:54A1
    ld   a,[$C17C]                  ; 03:54A4
    and  a                          ; 03:54A7
    jr   nz,Code0354BA              ; 03:54A8
    ld   a,[$C17B]                  ; 03:54AA
    cp   $27                        ; 03:54AD
    jr   c,Code0354E0               ; 03:54AF
    jr   nz,Code0354BA              ; 03:54B1
    ld   a,[$C17A]                  ; 03:54B3
    cp   $10                        ; 03:54B6
    jr   c,Code0354E0               ; 03:54B8
Code0354BA:
    ld   a,[$C192]                  ; 03:54BA
    or   $02                        ; 03:54BD
    ld   [$C192],a                  ; 03:54BF
    ld   a,[$C17C]                  ; 03:54C2
    and  a                          ; 03:54C5
    jr   nz,Code0354D8              ; 03:54C6
    ld   a,[$C17B]                  ; 03:54C8
    cp   $75                        ; 03:54CB
    jr   c,Code0354E0               ; 03:54CD
    jr   nz,Code0354D8              ; 03:54CF
    ld   a,[$C17A]                  ; 03:54D1
    cp   $30                        ; 03:54D4
    jr   c,Code0354E0               ; 03:54D6
Code0354D8:
    ld   a,[$C192]                  ; 03:54D8
    or   $01                        ; 03:54DB
    ld   [$C192],a                  ; 03:54DD
Code0354E0:
    ld   hl,$C17A                   ; 03:54E0
    ldi  a,[hl]                     ; 03:54E3
    ldh  [<$FFA1],a                 ; 03:54E4
    ldi  a,[hl]                     ; 03:54E6
    ldh  [<$FFA2],a                 ; 03:54E7
    ld   a,[hl]                     ; 03:54E9
    ldh  [<$FFA3],a                 ; 03:54EA
    xor  a                          ; 03:54EC
    ldd  [hl],a                     ; 03:54ED
    ldd  [hl],a                     ; 03:54EE
    ld   [hl],a                     ; 03:54EF
    ld   a,$03                      ; 03:54F0
    rst  $10                        ; 03:54F2
.dl SubL_0757EF                     ; 03:54F3
    ld   a,[W_SPFlag]               ; 03:54F6
    and  a                          ; 03:54F9
    jr   z,Code035500               ; 03:54FA
    xor  a                          ; 03:54FC
    ld   [W_HardFlag],a             ; 03:54FD
Code035500:
    ld   a,$03                      ; 03:5500
    rst  $10                        ; 03:5502
.dl SubL_075584                     ; 03:5503
    ld   hl,$C17A                   ; 03:5506
    ldh  a,[<$FFA1]                 ; 03:5509
    ldi  [hl],a                     ; 03:550B
    ldh  a,[<$FFA2]                 ; 03:550C
    ldi  [hl],a                     ; 03:550E
    ldh  a,[<$FFA3]                 ; 03:550F
    ld   [hl],a                     ; 03:5511
    ret                             ; 03:5512

Sub035513:
; determine award to give, for clearing 8-4
    ld   a,[W_SPFlag]               ; 03:5513
    and  a                          ; 03:5516
    jr   nz,Code035527              ; 03:5517
    ld   a,[W_HardFlag]             ; 03:5519
    and  a                          ; 03:551C
    jr   nz,Code035523              ; 03:551D
    ld   a,$02                      ; 03:551F
    jr   Code035529                 ; 03:5521
Code035523:
    ld   a,$04                      ; 03:5523
    jr   Code035529                 ; 03:5525
Code035527:
    ld   a,$05                      ; 03:5527
Code035529:
    ld   [$C1B0],a                  ; 03:5529
    ret                             ; 03:552C

Data03552D:                         ; 03:552D
.db $80,$09,$80,$09,$80,$09,$80,$09,\
    $80,$0A
Data035537:                         ; 03:5537
.db $00,$0A,$00,$0A,$00,$0A,$00,$0A,\
    $C0,$09
Data035541:                         ; 03:5541
.db $C0,$C0,$C0,$C0,$BC
Data035546:                         ; 03:5546
.db $42,$4C

Sub035548:
    ld   a,[$C26B]                  ; 03:5548
    and  a                          ; 03:554B
    jr   nz,Code035555              ; 03:554C
    ld   a,[$C1D8]                  ; 03:554E
    and  a                          ; 03:5551
    jp   z,Return0355E6             ; 03:5552
Code035555:
    ld   a,[$C1C8]                  ; 03:5555
    and  $01                        ; 03:5558
    jp   z,Return0355E6             ; 03:555A
    ld   a,[$C1DD]                  ; 03:555D
    and  a                          ; 03:5560
    jr   z,Code03556A               ; 03:5561
    ld   a,[$C1C2]                  ; 03:5563
    cp   $0B                        ; 03:5566
    jr   z,Code03556F               ; 03:5568
Code03556A:
    ld   a,$04                      ; 03:556A
    ld   [$C1C2],a                  ; 03:556C
Code03556F:
    ld   a,$01                      ; 03:556F
    ld   [W_PlayerState],a          ; 03:5571
    xor  a                          ; 03:5574
    ldh  [<$FFAE],a                 ; 03:5575
    ld   [$C200],a                  ; 03:5577
    ldh  a,[<$FFA9]                 ; 03:557A
    ld   [$C201],a                  ; 03:557C
    ldh  a,[<$FFAA]                 ; 03:557F
    ld   [$C202],a                  ; 03:5581
    ld   a,$20                      ; 03:5584
    ld   [$C1C7],a                  ; 03:5586
    ldh  a,[<$FFAB]                 ; 03:5589
    ld   [$C1F0],a                  ; 03:558B
    bit  7,a                        ; 03:558E
    jr   z,Code035594               ; 03:5590
    cpl                             ; 03:5592
    inc  a                          ; 03:5593
Code035594:
    ld   [$C1FF],a                  ; 03:5594
    ld   a,[$C1C5]                  ; 03:5597
    ld   e,a                        ; 03:559A
    ld   d,$00                      ; 03:559B
    ld   hl,Data035546              ; 03:559D
    add  hl,de                      ; 03:55A0
    ld   a,[hl]                     ; 03:55A1
    ldh  [<$FFF2],a                 ; 03:55A2
    ld   de,$0000                   ; 03:55A4
    ldh  a,[<$FFAB]                 ; 03:55A7
    bit  7,a                        ; 03:55A9
    jr   z,Code0355AF               ; 03:55AB
    cpl                             ; 03:55AD
    inc  a                          ; 03:55AE
Code0355AF:
    cp   $09                        ; 03:55AF
    jr   c,Code0355C3               ; 03:55B1
    inc  e                          ; 03:55B3
    cp   $10                        ; 03:55B4
    jr   c,Code0355C3               ; 03:55B6
    inc  e                          ; 03:55B8
    cp   $19                        ; 03:55B9
    jr   c,Code0355C3               ; 03:55BB
    inc  e                          ; 03:55BD
    cp   $1C                        ; 03:55BE
    jr   c,Code0355C3               ; 03:55C0
    inc  e                          ; 03:55C2
Code0355C3:
    sla  e                          ; 03:55C3
    ld   hl,Data03552D              ; 03:55C5
    add  hl,de                      ; 03:55C8
    ldi  a,[hl]                     ; 03:55C9
    ld   [$C203],a                  ; 03:55CA
    ld   a,[hl]                     ; 03:55CD
    ld   [$C204],a                  ; 03:55CE
    ld   hl,Data035537              ; 03:55D1
    add  hl,de                      ; 03:55D4
    ldi  a,[hl]                     ; 03:55D5
    ld   [$C205],a                  ; 03:55D6
    ld   a,[hl]                     ; 03:55D9
    ld   [$C206],a                  ; 03:55DA
    srl  e                          ; 03:55DD
    ld   hl,Data035541              ; 03:55DF
    add  hl,de                      ; 03:55E2
    ld   a,[hl]                     ; 03:55E3
    ldh  [<$FFAC],a                 ; 03:55E4
Return0355E6:
    ret                             ; 03:55E6

Sub0355E7:
    ld   hl,$FFAC                   ; 03:55E7
    ldh  a,[<$FFAA]                 ; 03:55EA
    and  a                          ; 03:55EC
    jr   nz,Code0355FE              ; 03:55ED
    ldh  a,[<$FFA9]                 ; 03:55EF
    cp   $2C                        ; 03:55F1
    jr   nc,Code0355FE              ; 03:55F3
    ld   a,[hl]                     ; 03:55F5
    bit  7,a                        ; 03:55F6
    jr   z,Code0355FE               ; 03:55F8
    cp   $F0                        ; 03:55FA
    jr   c,Return035614             ; 03:55FC
Code0355FE:
    ld   a,[$C1C8]                  ; 03:55FE
    and  $01                        ; 03:5601
    jp   z,Return035614             ; 03:5603
    ld   a,$44                      ; 03:5606
    ldh  [<$FFF2],a                 ; 03:5608
    ld   [hl],$EC                   ; 03:560A
    ld   a,[$C1F6]                  ; 03:560C
    and  a                          ; 03:560F
    jr   z,Return035614             ; 03:5610
    ld   [hl],$E0                   ; 03:5612
Return035614:
    ret                             ; 03:5614

Sub035615:
    ld   a,[$C1CE]                  ; 03:5615
    and  a                          ; 03:5618
    jr   z,Return035641             ; 03:5619
    ld   a,[$C1DD]                  ; 03:561B
    and  a                          ; 03:561E
    jr   nz,Return035641            ; 03:561F
    ld   a,[$C1C8]                  ; 03:5621
    and  $02                        ; 03:5624
    jp   z,Return035641             ; 03:5626
    ld   a,[W_GameMode]             ; 03:5629
    cp   $02                        ; 03:562C
    jr   z,Code035642               ; 03:562E
    ld   a,$03                      ; 03:5630
    rst  $10                        ; 03:5632
.dl SubL_024007                     ; 03:5633
    ldh  a,[<$FFF2]                 ; 03:5636
    cp   $48                        ; 03:5638
    jr   nz,Return035641            ; 03:563A
    ld   a,$08                      ; 03:563C
    ld   [$C1F7],a                  ; 03:563E
Return035641:
    ret                             ; 03:5641

Code035642:
    ld   de,$0000                   ; 03:5642
Code035645:
    ld   hl,W_SpriteStatus          ; 03:5645
    add  hl,de                      ; 03:5648
    ld   a,[hl]                     ; 03:5649
    and  a                          ; 03:564A
    jr   z,Code035661               ; 03:564B
    ld   hl,W_SpriteID              ; 03:564D
    add  hl,de                      ; 03:5650
    ld   a,[hl]                     ; 03:5651
    cp   $0D                        ; 03:5652
    jr   nz,Code035661              ; 03:5654
    ld   a,[$C366]                  ; 03:5656
    ld   hl,$D10E                   ; 03:5659
    add  hl,de                      ; 03:565C
    cp   [hl]                       ; 03:565D
    jr   nz,Code035661              ; 03:565E
    ret                             ; 03:5660

Code035661:
    inc  de                         ; 03:5661
    ld   a,e                        ; 03:5662
    cp   $0F                        ; 03:5663
    jr   nz,Code035645              ; 03:5665
    ld   a,$03                      ; 03:5667
    rst  $10                        ; 03:5669
.dl SubL_024030                     ; 03:566A
    ldh  a,[<$FFF2]                 ; 03:566D
    cp   $48                        ; 03:566F
    ret  nz                         ; 03:5671
    ld   hl,$D10E                   ; 03:5672
    add  hl,de                      ; 03:5675
    ld   a,[$C366]                  ; 03:5676
    ld   [hl],a                     ; 03:5679
    ld   a,$08                      ; 03:567A
    ld   [$C1F7],a                  ; 03:567C
    ret                             ; 03:567F

Sub035680:
    ld   a,[$C25E]                  ; 03:5680
    and  $30                        ; 03:5683
    jp   z,Code035699               ; 03:5685
    ld   a,[$C1DD]                  ; 03:5688
    and  a                          ; 03:568B
    jr   nz,Code035699              ; 03:568C
    ld   a,[$C25E]                  ; 03:568E
    and  $30                        ; 03:5691
    call Sub03577E                  ; 03:5693
    jp   Code0356A8                 ; 03:5696
Code035699:
    ld   a,[$C26B]                  ; 03:5699
    and  a                          ; 03:569C
    jr   nz,Code0356A5              ; 03:569D
    ld   a,[$C1D8]                  ; 03:569F
    and  a                          ; 03:56A2
    jr   z,Code0356A8               ; 03:56A3
Code0356A5:
    call Sub03596C                  ; 03:56A5
Code0356A8:
    call Sub0359B4                  ; 03:56A8
    ld   a,[$C200]                  ; 03:56AB
    add  $AA                        ; 03:56AE
    ld   [$C200],a                  ; 03:56B0
    ld   a,$08                      ; 03:56B3
    ld   hl,$FFAC                   ; 03:56B5
    adc  [hl]                       ; 03:56B8
    bit  7,a                        ; 03:56B9
    jr   nz,Code0356C4              ; 03:56BB
    cp   $40                        ; 03:56BD
    jp   c,Code0356C4               ; 03:56BF
    ld   a,$40                      ; 03:56C2
Code0356C4:
    ldh  [<$FFAC],a                 ; 03:56C4
    call Sub0359E4                  ; 03:56C6
    ret                             ; 03:56C9

Sub0356CA:
    ld   hl,$C25E                   ; 03:56CA
    ld   a,[hl]                     ; 03:56CD
    and  $30                        ; 03:56CE
    jp   z,Code0356E1               ; 03:56D0
    ld   a,[$C1DD]                  ; 03:56D3
    and  a                          ; 03:56D6
    jr   z,Code0356E9               ; 03:56D7
    ld   a,[$C1D8]                  ; 03:56D9
    and  a                          ; 03:56DC
    jr   nz,Code0356FA              ; 03:56DD
    jr   Code0356E9                 ; 03:56DF
Code0356E1:
    ld   a,[$C1D8]                  ; 03:56E1
    and  a                          ; 03:56E4
    jr   nz,Code0356FA              ; 03:56E5
    jr   Code0356FD                 ; 03:56E7
Code0356E9:
    ld   a,[hl]                     ; 03:56E9
    push af                         ; 03:56EA
    and  $FD                        ; 03:56EB
    ld   [hl],a                     ; 03:56ED
    and  $30                        ; 03:56EE
    call Sub03577E                  ; 03:56F0
    pop  af                         ; 03:56F3
    ld   [$C25E],a                  ; 03:56F4
    jp   Code0356FD                 ; 03:56F7
Code0356FA:
    call Sub03596C                  ; 03:56FA
Code0356FD:
    ld   hl,$C1F5                   ; 03:56FD
    ldh  a,[<$FFAB]                 ; 03:5700
    push af                         ; 03:5702
    add  [hl]                       ; 03:5703
    ldh  [<$FFAB],a                 ; 03:5704
    call Sub0359B4                  ; 03:5706
    pop  af                         ; 03:5709
    ldh  [<$FFAB],a                 ; 03:570A
    ld   e,$28                      ; 03:570C
    ldh  a,[<$FFAB]                 ; 03:570E
    bit  7,a                        ; 03:5710
    jr   z,Code035716               ; 03:5712
    cpl                             ; 03:5714
    inc  a                          ; 03:5715
Code035716:
    cp   $08                        ; 03:5716
    jr   nc,Code03571C              ; 03:5718
    ld   e,$30                      ; 03:571A
Code03571C:
    ld   bc,$0080                   ; 03:571C
    ld   a,[$C1F6]                  ; 03:571F
    and  a                          ; 03:5722
    jr   z,Code035728               ; 03:5723
    ld   bc,$0180                   ; 03:5725
Code035728:
    ld   a,[$C200]                  ; 03:5728
    add  c                          ; 03:572B
    ld   [$C200],a                  ; 03:572C
    ldh  a,[<$FFAC]                 ; 03:572F
    adc  b                          ; 03:5731
    bit  7,a                        ; 03:5732
    jr   nz,Code03573A              ; 03:5734
    cp   e                          ; 03:5736
    jr   c,Code03573A               ; 03:5737
    ld   a,e                        ; 03:5739
Code03573A:
    ldh  [<$FFAC],a                 ; 03:573A
    ldh  a,[<$FFAC]                 ; 03:573C
    push af                         ; 03:573E
    ld   hl,$C1F6                   ; 03:573F
    add  [hl]                       ; 03:5742
    ldh  [<$FFAC],a                 ; 03:5743
    call Sub0359E4                  ; 03:5745
    pop  af                         ; 03:5748
    ldh  [<$FFAC],a                 ; 03:5749
    ret                             ; 03:574B

Sub03574C:
    ld   hl,$C1FE                   ; 03:574C
    ld   a,[hl]                     ; 03:574F
    and  a                          ; 03:5750
    ret  nz                         ; 03:5751
    dec  [hl]                       ; 03:5752
    ret                             ; 03:5753

Data035754:                         ; 03:5754
.db $E8,$18,$D8,$28,$F0,$10,$F4,$0C
Data03575C:                         ; 03:575C
.db $E0,$20,$D0,$30,$F0,$10,$F4,$0C
Data035764:                         ; 03:5764
.db $34,$01,$98,$00,$D0,$00,$C0,$01
Data03576C:                         ; 03:576C
.db $40,$01,$98,$00,$D0,$00,$C0,$01
Data035774:                         ; 03:5774
.db $E4,$00,$98,$00,$D0,$00,$10,$01
Data03577C:                         ; 03:577C
.db $20,$10

Sub03577E:
    push bc                         ; 03:577E
    push af                         ; 03:577F
    ld   e,a                        ; 03:5780
    ld   d,$00                      ; 03:5781
    call Sub035944                  ; 03:5783
    jr   c,Code0357C2               ; 03:5786
    ld   a,[$C1FF]                  ; 03:5788
    and  a                          ; 03:578B
    jr   z,Code0357C2               ; 03:578C
    ld   a,[$C207]                  ; 03:578E
    and  a                          ; 03:5791
    jr   z,Code0357C2               ; 03:5792
    xor  a                          ; 03:5794
    ld   [$C207],a                  ; 03:5795
    ld   c,$00                      ; 03:5798
    ldh  a,[<H_PlInitY_SubLvType]   ; 03:579A
    and  $0F                        ; 03:579C
    cp   $02                        ; 03:579E
    jr   z,Code0357B0               ; 03:57A0
    ldh  a,[<$FFAB]                 ; 03:57A2
    bit  7,a                        ; 03:57A4
    jr   z,Code0357AA               ; 03:57A6
    cpl                             ; 03:57A8
    inc  a                          ; 03:57A9
Code0357AA:
    cp   $19                        ; 03:57AA
    jr   c,Code0357B0               ; 03:57AC
    ld   c,$08                      ; 03:57AE
Code0357B0:
    ld   a,[$C25E]                  ; 03:57B0
    and  $30                        ; 03:57B3
    jr   z,Code0357C2               ; 03:57B5
    and  $10                        ; 03:57B7
    jr   nz,Code0357BF              ; 03:57B9
    ld   a,c                        ; 03:57BB
    cpl                             ; 03:57BC
    inc  a                          ; 03:57BD
    ld   c,a                        ; 03:57BE
Code0357BF:
    ld   a,c                        ; 03:57BF
    ldh  [<$FFAB],a                 ; 03:57C0
Code0357C2:
    call Sub035944                  ; 03:57C2
    jr   nc,Code035809              ; 03:57C5
    ld   a,[$C25E]                  ; 03:57C7
    and  $30                        ; 03:57CA
    jr   nz,Code0357D1              ; 03:57CC
Code0357CE:
    pop  af                         ; 03:57CE
    pop  bc                         ; 03:57CF
    ret                             ; 03:57D0

Code0357D1:
    call Sub03592B                  ; 03:57D1
    jr   c,Code035800               ; 03:57D4
    ld   e,$20                      ; 03:57D6
    ldh  a,[<$FFAB]                 ; 03:57D8
    cp   $00                        ; 03:57DA
    jr   z,Code035800               ; 03:57DC
    bit  7,a                        ; 03:57DE
    jr   nz,Code0357E4              ; 03:57E0
    ld   e,$10                      ; 03:57E2
Code0357E4:
    ld   a,[$C25E]                  ; 03:57E4
    and  $30                        ; 03:57E7
    cp   e                          ; 03:57E9
    jr   nz,Code035800              ; 03:57EA
    ld   a,[$C1FF]                  ; 03:57EC
    and  a                          ; 03:57EF
    jr   z,Code035809               ; 03:57F0
    ldh  a,[<$FFAB]                 ; 03:57F2
    bit  7,a                        ; 03:57F4
    jr   z,Code0357FA               ; 03:57F6
    cpl                             ; 03:57F8
    inc  a                          ; 03:57F9
Code0357FA:
    cp   $19                        ; 03:57FA
    jr   nc,Code0357CE              ; 03:57FC
    jr   Code035809                 ; 03:57FE
Code035800:
    ld   a,d                        ; 03:5800
    ld   d,$00                      ; 03:5801
    ld   e,a                        ; 03:5803
    ld   hl,Data03576C              ; 03:5804
    jr   Code03586D                 ; 03:5807
Code035809:
    ldh  a,[<$FFAB]                 ; 03:5809
    bit  7,a                        ; 03:580B
    jr   z,Code035811               ; 03:580D
    cpl                             ; 03:580F
    inc  a                          ; 03:5810
Code035811:
    ldh  [<$FFA5],a                 ; 03:5811
    ld   a,[W_PlayerState]          ; 03:5813
    cp   $00                        ; 03:5816
    jr   z,Code035822               ; 03:5818
    ldh  a,[<$FFA5]                 ; 03:581A
    cp   $19                        ; 03:581C
    jr   nc,Code03585B              ; 03:581E
    jr   Code03584F                 ; 03:5820
Code035822:
    ldh  a,[<H_PlInitY_SubLvType]   ; 03:5822
    and  $0F                        ; 03:5824
    cp   $02                        ; 03:5826
    jr   z,Code03584F               ; 03:5828
    ld   c,$20                      ; 03:582A
    ldh  a,[<$FFAB]                 ; 03:582C
    bit  7,a                        ; 03:582E
    jr   nz,Code035834              ; 03:5830
    ld   c,$10                      ; 03:5832
Code035834:
    ld   a,e                        ; 03:5834
    cp   c                          ; 03:5835
    jr   nz,Code03584F              ; 03:5836
    ld   a,[$C25E]                  ; 03:5838
    bit  1,a                        ; 03:583B
    jp   nz,Code035848              ; 03:583D
    ld   a,[$C1FE]                  ; 03:5840
    and  a                          ; 03:5843
    jr   nz,Code03585B              ; 03:5844
    jr   Code03584F                 ; 03:5846
Code035848:
    ld   a,$0A                      ; 03:5848
    ld   [$C1FE],a                  ; 03:584A
    jr   Code03585B                 ; 03:584D
Code03584F:
    inc  d                          ; 03:584F
    inc  d                          ; 03:5850
    ld   a,[$C1FF]                  ; 03:5851
    and  a                          ; 03:5854
    jr   nz,Code035859              ; 03:5855
    ld   d,$04                      ; 03:5857
Code035859:
    inc  d                          ; 03:5859
    inc  d                          ; 03:585A
Code03585B:
    ld   a,d                        ; 03:585B
    ld   d,$00                      ; 03:585C
    ld   e,a                        ; 03:585E
    ld   hl,Data035764              ; 03:585F
    ldh  a,[<H_PlInitY_SubLvType]   ; 03:5862
    and  $0F                        ; 03:5864
    cp   $02                        ; 03:5866
    jr   nz,Code03586D              ; 03:5868
    ld   hl,Data035774              ; 03:586A
Code03586D:
    add  hl,de                      ; 03:586D
    ldi  a,[hl]                     ; 03:586E
    ldh  [<$FFA6],a                 ; 03:586F
    ld   a,[hl]                     ; 03:5871
    ldh  [<$FFA4],a                 ; 03:5872
    pop  af                         ; 03:5874
    pop  bc                         ; 03:5875
    ld   de,$0000                   ; 03:5876
    and  $10                        ; 03:5879
    jp   z,Code03587F               ; 03:587B
    inc  e                          ; 03:587E
Code03587F:
    ldh  a,[<H_PlInitY_SubLvType]   ; 03:587F
    and  $0F                        ; 03:5881
    cp   $02                        ; 03:5883
    jr   nz,Code035895              ; 03:5885
    ld   a,[$C1D8]                  ; 03:5887
    and  a                          ; 03:588A
    jr   z,Code0358BF               ; 03:588B
    ld   a,e                        ; 03:588D
    and  $01                        ; 03:588E
    or   $04                        ; 03:5890
    ld   e,a                        ; 03:5892
    jr   Code0358BF                 ; 03:5893
Code035895:
    ld   a,[W_PlayerState]          ; 03:5895
    cp   $16                        ; 03:5898
    jr   z,Code0358B2               ; 03:589A
    cp   $0F                        ; 03:589C
    jr   z,Code0358B2               ; 03:589E
    cp   $01                        ; 03:58A0
    jr   z,Code0358B2               ; 03:58A2
    cp   $13                        ; 03:58A4
    jr   z,Code0358B2               ; 03:58A6
    ld   a,[$C25E]                  ; 03:58A8
    bit  1,a                        ; 03:58AB
    jp   z,Code0358B2               ; 03:58AD
    inc  e                          ; 03:58B0
    inc  e                          ; 03:58B1
Code0358B2:
    ld   a,[W_PlayerState]          ; 03:58B2
    cp   $10                        ; 03:58B5
    jr   nz,Code0358BF              ; 03:58B7
    ld   a,e                        ; 03:58B9
    and  $01                        ; 03:58BA
    or   $06                        ; 03:58BC
    ld   e,a                        ; 03:58BE
Code0358BF:
    ld   a,[W_GameMode]             ; 03:58BF
    cp   $02                        ; 03:58C2
    jr   nz,Code0358D5              ; 03:58C4
    ld   hl,$C1DB                   ; 03:58C6
    ld   a,[$C1DA]                  ; 03:58C9
    or   [hl]                       ; 03:58CC
    and  a                          ; 03:58CD
    jr   z,Code0358D5               ; 03:58CE
    ld   hl,Data03575C              ; 03:58D0
    jr   Code0358D8                 ; 03:58D3
Code0358D5:
    ld   hl,Data035754              ; 03:58D5
Code0358D8:
    add  hl,de                      ; 03:58D8
    ldh  a,[<$FFA6]                 ; 03:58D9
    ld   e,a                        ; 03:58DB
    ldh  a,[<$FFA4]                 ; 03:58DC
    ld   d,a                        ; 03:58DE
    ld   a,[$C25E]                  ; 03:58DF
    and  $10                        ; 03:58E2
    jp   z,Code035907               ; 03:58E4
    ld   a,[$C1FD]                  ; 03:58E7
    add  e                          ; 03:58EA
    ld   [$C1FD],a                  ; 03:58EB
    ldh  a,[<$FFAB]                 ; 03:58EE
    ldh  [<$FFA4],a                 ; 03:58F0
    adc  d                          ; 03:58F2
    ldh  [<$FFAB],a                 ; 03:58F3
    bit  7,a                        ; 03:58F5
    ret  nz                         ; 03:58F7
    cp   [hl]                       ; 03:58F8
    ret  c                          ; 03:58F9
    sub  [hl]                       ; 03:58FA
    cp   $03                        ; 03:58FB
    jp   c,Code035927               ; 03:58FD
    ldh  a,[<$FFA4]                 ; 03:5900
    ldh  [<$FFAB],a                 ; 03:5902
    jp   Sub03596C                  ; 03:5904
Code035907:
    ld   a,[$C1FD]                  ; 03:5907
    sub  e                          ; 03:590A
    ld   [$C1FD],a                  ; 03:590B
    ldh  a,[<$FFAB]                 ; 03:590E
    ldh  [<$FFA4],a                 ; 03:5910
    sbc  d                          ; 03:5912
    ldh  [<$FFAB],a                 ; 03:5913
    bit  7,a                        ; 03:5915
    ret  z                          ; 03:5917
    cp   [hl]                       ; 03:5918
    ret  nc                         ; 03:5919
    sub  [hl]                       ; 03:591A
    cp   $03                        ; 03:591B
    jp   c,Code035927               ; 03:591D
    ldh  a,[<$FFA4]                 ; 03:5920
    ldh  [<$FFAB],a                 ; 03:5922
    jp   Sub03596C                  ; 03:5924
Code035927:
    ld   a,[hl]                     ; 03:5927
    ldh  [<$FFAB],a                 ; 03:5928
    ret                             ; 03:592A

Sub03592B:
    ld   a,[$C1C3]                  ; 03:592B
    srl  a                          ; 03:592E
    ld   c,a                        ; 03:5930
    ld   b,$00                      ; 03:5931
    ld   hl,Data03577C              ; 03:5933
    add  hl,bc                      ; 03:5936
    ld   a,[$C25E]                  ; 03:5937
    and  $30                        ; 03:593A
    cp   [hl]                       ; 03:593C
    jr   nz,Code035942              ; 03:593D
    scf                             ; 03:593F
    ccf                             ; 03:5940
    ret                             ; 03:5941

Code035942:
    scf                             ; 03:5942
    ret                             ; 03:5943

Sub035944:
    ld   a,[W_PlayerState]          ; 03:5944
    cp   $01                        ; 03:5947
    jr   z,Code035966               ; 03:5949
    cp   $13                        ; 03:594B
    jr   z,Code035966               ; 03:594D
    ldh  a,[<H_PlInitY_SubLvType]   ; 03:594F
    and  $0F                        ; 03:5951
    cp   $02                        ; 03:5953
    jr   z,Code035963               ; 03:5955
    ld   a,[$C26B]                  ; 03:5957
    and  a                          ; 03:595A
    jr   nz,Code035963              ; 03:595B
    ld   a,[$C1D8]                  ; 03:595D
    and  a                          ; 03:5960
    jr   z,Code035966               ; 03:5961
Code035963:
    scf                             ; 03:5963
    ccf                             ; 03:5964
    ret                             ; 03:5965

Code035966:
    scf                             ; 03:5966
    ret                             ; 03:5967

Data035968:                         ; 03:5968
.db $20,$01,$00,$01

Sub03596C:
    push hl                         ; 03:596C
    push de                         ; 03:596D
    ld   de,$0000                   ; 03:596E
    ld   a,[$C1DD]                  ; 03:5971
    and  a                          ; 03:5974
    jr   z,Code035979               ; 03:5975
    inc  e                          ; 03:5977
    inc  e                          ; 03:5978
Code035979:
    ld   hl,Data035968              ; 03:5979
    add  hl,de                      ; 03:597C
    ld   c,[hl]                     ; 03:597D
    inc  hl                         ; 03:597E
    ld   b,[hl]                     ; 03:597F
    ldh  a,[<$FFAB]                 ; 03:5980
    and  a                          ; 03:5982
    jr   z,Code0359B1               ; 03:5983
    bit  7,a                        ; 03:5985
    jr   nz,Code03599D              ; 03:5987
    ld   a,[$C1FD]                  ; 03:5989
    sub  c                          ; 03:598C
    ld   [$C1FD],a                  ; 03:598D
    ldh  a,[<$FFAB]                 ; 03:5990
    sbc  b                          ; 03:5992
    bit  7,a                        ; 03:5993
    jr   z,Code0359AF               ; 03:5995
    xor  a                          ; 03:5997
    ld   [$C1FD],a                  ; 03:5998
    jr   Code0359AF                 ; 03:599B
Code03599D:
    ld   a,[$C1FD]                  ; 03:599D
    add  c                          ; 03:59A0
    ld   [$C1FD],a                  ; 03:59A1
    ldh  a,[<$FFAB]                 ; 03:59A4
    adc  b                          ; 03:59A6
    bit  7,a                        ; 03:59A7
    jr   nz,Code0359AF              ; 03:59A9
    xor  a                          ; 03:59AB
    ld   [$C1FD],a                  ; 03:59AC
Code0359AF:
    ldh  [<$FFAB],a                 ; 03:59AF
Code0359B1:
    pop  de                         ; 03:59B1
    pop  hl                         ; 03:59B2
    ret                             ; 03:59B3

Sub0359B4:
    ldh  a,[<$FFAB]                 ; 03:59B4
    and  a                          ; 03:59B6
    ret  z                          ; 03:59B7
    ldh  a,[<$FFAB]                 ; 03:59B8
    swap a                          ; 03:59BA
    and  $F0                        ; 03:59BC
    ld   hl,$FFAD                   ; 03:59BE
    add  [hl]                       ; 03:59C1
    ld   [hl],a                     ; 03:59C2
    push af                         ; 03:59C3
    ld   e,$00                      ; 03:59C4
    ldh  a,[<$FFAB]                 ; 03:59C6
    swap a                          ; 03:59C8
    and  $0F                        ; 03:59CA
    bit  3,a                        ; 03:59CC
    jp   z,Code0359D4               ; 03:59CE
    or   $F0                        ; 03:59D1
    dec  e                          ; 03:59D3
Code0359D4:
    ld   hl,$FFA7                   ; 03:59D4
    ldh  [<$FF97],a                 ; 03:59D7
    pop  af                         ; 03:59D9
    ldh  a,[<$FF97]                 ; 03:59DA
    adc  [hl]                       ; 03:59DC
    ld   [hl],a                     ; 03:59DD
    ldh  a,[<$FFA8]                 ; 03:59DE
    adc  e                          ; 03:59E0
    ldh  [<$FFA8],a                 ; 03:59E1
    ret                             ; 03:59E3

Sub0359E4:
    ldh  a,[<$FFAC]                 ; 03:59E4
    and  a                          ; 03:59E6
    ret  z                          ; 03:59E7
    ldh  a,[<$FFAC]                 ; 03:59E8
    swap a                          ; 03:59EA
    and  $F0                        ; 03:59EC
    ld   hl,$FFAE                   ; 03:59EE
    add  [hl]                       ; 03:59F1
    ld   [hl],a                     ; 03:59F2
    push af                         ; 03:59F3
    ld   e,$00                      ; 03:59F4
    ldh  a,[<$FFAC]                 ; 03:59F6
    swap a                          ; 03:59F8
    and  $0F                        ; 03:59FA
    bit  3,a                        ; 03:59FC
    jp   z,Code035A04               ; 03:59FE
    or   $F0                        ; 03:5A01
    dec  e                          ; 03:5A03
Code035A04:
    ld   hl,$FFA9                   ; 03:5A04
    ldh  [<$FF97],a                 ; 03:5A07
    pop  af                         ; 03:5A09
    ldh  a,[<$FF97]                 ; 03:5A0A
    adc  [hl]                       ; 03:5A0C
    ld   [hl],a                     ; 03:5A0D
    ldh  a,[<$FFAA]                 ; 03:5A0E
    adc  e                          ; 03:5A10
    ldh  [<$FFAA],a                 ; 03:5A11
    ret                             ; 03:5A13

Sub035A14:
    ldh  a,[<$FFA7]                 ; 03:5A14
    ld   hl,$C1CA                   ; 03:5A16
    sub  [hl]                       ; 03:5A19
    ld   [$C1D6],a                  ; 03:5A1A
    ldh  a,[<$FFA9]                 ; 03:5A1D
    ld   hl,$C1CC                   ; 03:5A1F
    sub  [hl]                       ; 03:5A22
    ld   [$C1D7],a                  ; 03:5A23
    ret                             ; 03:5A26

Data035A27:                         ; 03:5A27
.db $40,$40,$40,$40,$40,$40,$40,$40,\
    $40,$40
Data035A31:                         ; 03:5A31
.db $60,$40,$30
Data035A34:                         ; 03:5A34
.db $58,$58,$48,$48,$58,$58,$48,$48

Sub035A3C:
    ldh  a,[<H_GameState]           ; 03:5A3C
    cp   $3B                        ; 03:5A3E
    jp   z,Code035B6F               ; 03:5A40
    cp   $3C                        ; 03:5A43
    jp   z,Code035B6F               ; 03:5A45
    cp   $3D                        ; 03:5A48
    jp   z,Code035B6F               ; 03:5A4A
    cp   $3E                        ; 03:5A4D
    jp   z,Code035B6F               ; 03:5A4F
    ld   a,[$C366]                  ; 03:5A52
    and  a                          ; 03:5A55
    jp   nz,Code035B12              ; 03:5A56
    ld   a,[W_PlayerState]          ; 03:5A59
    cp   $03                        ; 03:5A5C
    jp   z,Code035B6F               ; 03:5A5E
    cp   $04                        ; 03:5A61
    jp   z,Code035B6F               ; 03:5A63
    ld   a,[$C26B]                  ; 03:5A66
    and  a                          ; 03:5A69
    jr   nz,Code035A7F              ; 03:5A6A
    ld   a,[$C1D8]                  ; 03:5A6C
    and  a                          ; 03:5A6F
    jr   nz,Code035A7F              ; 03:5A70
    xor  a                          ; 03:5A72
    ld   [$C25F],a                  ; 03:5A73
    ld   [$C262],a                  ; 03:5A76
    ld   [$C261],a                  ; 03:5A79
    ld   [$C263],a                  ; 03:5A7C
Code035A7F:
    ld   a,[$C25F]                  ; 03:5A7F
    and  a                          ; 03:5A82
    jp   nz,Code035B12              ; 03:5A83
    ld   a,[$C26B]                  ; 03:5A86
    and  a                          ; 03:5A89
    jr   nz,Code035A93              ; 03:5A8A
    ld   a,[$C1D8]                  ; 03:5A8C
    and  a                          ; 03:5A8F
    jp   z,Code035B12               ; 03:5A90
Code035A93:
    ld   hl,$FFBA                   ; 03:5A93
    ldh  a,[<$FFA9]                 ; 03:5A96
    sub  [hl]                       ; 03:5A98
    ldh  [<$FF97],a                 ; 03:5A99
    ld   hl,$FFBB                   ; 03:5A9B
    ldh  a,[<$FFAA]                 ; 03:5A9E
    sbc  [hl]                       ; 03:5AA0
    ldh  [<$FF98],a                 ; 03:5AA1
    ldh  a,[<$FF8C]                 ; 03:5AA3
    bit  7,a                        ; 03:5AA5
    jr   z,Code035ADA               ; 03:5AA7
    call Sub035F73                  ; 03:5AA9
    jr   c,Code035ADA               ; 03:5AAC
    ldh  a,[<$FF98]                 ; 03:5AAE
    and  a                          ; 03:5AB0
    jr   nz,Code035B12              ; 03:5AB1
    ld   a,$01                      ; 03:5AB3
    ld   [$C25F],a                  ; 03:5AB5
    ld   [$C1FA],a                  ; 03:5AB8
    ldh  a,[<H_PlInitY_SubLvType]   ; 03:5ABB
    and  $0F                        ; 03:5ABD
    cp   $02                        ; 03:5ABF
    jr   nz,Code035AC7              ; 03:5AC1
    xor  a                          ; 03:5AC3
    ld   [$C1FA],a                  ; 03:5AC4
Code035AC7:
    ld   a,[W_PlayerState]          ; 03:5AC7
    cp   $0B                        ; 03:5ACA
    jr   z,Code035B12               ; 03:5ACC
    ldh  a,[<$FFBA]                 ; 03:5ACE
    cp   $70                        ; 03:5AD0
    jr   z,Code035B12               ; 03:5AD2
    ld   a,$77                      ; 03:5AD4
    ldh  [<$FFF2],a                 ; 03:5AD6
    jr   Code035B12                 ; 03:5AD8
Code035ADA:
    ldh  a,[<$FF8C]                 ; 03:5ADA
    bit  6,a                        ; 03:5ADC
    jr   z,Code035B12               ; 03:5ADE
    call Sub035F73                  ; 03:5AE0
    jr   c,Code035B12               ; 03:5AE3
    xor  a                          ; 03:5AE5
    ld   [$C1FA],a                  ; 03:5AE6
    ldh  a,[<$FF98]                 ; 03:5AE9
    and  a                          ; 03:5AEB
    jr   z,Code035AF6               ; 03:5AEC
    ldh  a,[<$FF97]                 ; 03:5AEE
    cp   $B0                        ; 03:5AF0
    jr   c,Code035B12               ; 03:5AF2
    jr   Code035AFC                 ; 03:5AF4
Code035AF6:
    ldh  a,[<$FF97]                 ; 03:5AF6
    cp   $70                        ; 03:5AF8
    jr   nc,Code035B12              ; 03:5AFA
Code035AFC:
    ldh  a,[<$FFBA]                 ; 03:5AFC
    cp   $38                        ; 03:5AFE
    jr   z,Code035B12               ; 03:5B00
    ld   a,[W_PlayerState]          ; 03:5B02
    cp   $0B                        ; 03:5B05
    jr   z,Code035B12               ; 03:5B07
    ld   a,$02                      ; 03:5B09
    ld   [$C25F],a                  ; 03:5B0B
    ld   a,$77                      ; 03:5B0E
    ldh  [<$FFF2],a                 ; 03:5B10
Code035B12:
    ldh  a,[<$FF8C]                 ; 03:5B12
    and  $04                        ; 03:5B14
    jr   z,Code035B6F               ; 03:5B16
    ld   a,[W_GameMode]             ; 03:5B18
    cp   $02                        ; 03:5B1B
    jr   z,Code035B6B               ; 03:5B1D
    cp   $07                        ; 03:5B1F
    jr   z,Code035B6B               ; 03:5B21
    call Sub035F73                  ; 03:5B23
    jr   c,Code035B6F               ; 03:5B26
    ld   a,[$C1E7]                  ; 03:5B28
    and  a                          ; 03:5B2B
    jr   nz,Code035B6F              ; 03:5B2C
    ld   a,[$C1E8]                  ; 03:5B2E
    and  a                          ; 03:5B31
    jr   z,Code035B43               ; 03:5B32
    xor  a                          ; 03:5B34
    ld   [$C1E8],a                  ; 03:5B35
    ld   a,$02                      ; 03:5B38
    ld   [$C1E7],a                  ; 03:5B3A
    ld   a,$77                      ; 03:5B3D
    ldh  [<$FFF2],a                 ; 03:5B3F
    jr   Code035B6F                 ; 03:5B41
Code035B43:
    ld   hl,$FFB8                   ; 03:5B43
    ldh  a,[<$FFB9]                 ; 03:5B46
    or   [hl]                       ; 03:5B48
    jr   z,Code035B6B               ; 03:5B49
    ld   hl,$FFB8                   ; 03:5B4B
    ldh  a,[<$FFA7]                 ; 03:5B4E
    sub  [hl]                       ; 03:5B50
    bit  7,a                        ; 03:5B51
    jr   nz,Code035B6B              ; 03:5B53
    cp   $04                        ; 03:5B55
    jr   c,Code035B6B               ; 03:5B57
    ld   a,$01                      ; 03:5B59
    ld   [$C1E7],a                  ; 03:5B5B
    ld   [$C1E8],a                  ; 03:5B5E
    dec  a                          ; 03:5B61
    ld   [$C1E9],a                  ; 03:5B62
    ld   a,$77                      ; 03:5B65
    ldh  [<$FFF2],a                 ; 03:5B67
    jr   Code035B6F                 ; 03:5B69
Code035B6B:
    ld   a,$30                      ; 03:5B6B
    ldh  [<$FFF3],a                 ; 03:5B6D
Code035B6F:
    call Sub035F5D                  ; 03:5B6F
    ld   a,[$C1D6]                  ; 03:5B72
    ld   b,a                        ; 03:5B75
    ld   a,[W_PlayerState]          ; 03:5B76
    cp   $03                        ; 03:5B79
    jp   z,Code035B89               ; 03:5B7B
    cp   $04                        ; 03:5B7E
    jp   z,Code035B89               ; 03:5B80
    call Sub036130                  ; 03:5B83
    call Sub035F8C                  ; 03:5B86
Code035B89:
    ld   a,[$C1E8]                  ; 03:5B89
    and  a                          ; 03:5B8C
    jp   nz,Code035C70              ; 03:5B8D
    ld   hl,$FFA8                   ; 03:5B90
    ld   a,b                        ; 03:5B93
    bit  7,a                        ; 03:5B94
    jp   nz,Code035C15              ; 03:5B96
    and  a                          ; 03:5B99
    jp   z,Code035DA0               ; 03:5B9A
    call Sub035EFA                  ; 03:5B9D
    jr   c,Code035BB8               ; 03:5BA0
    push hl                         ; 03:5BA2
    ld   a,[W_SublevelID]           ; 03:5BA3
    sub  $3A                        ; 03:5BA6
    ld   e,a                        ; 03:5BA8
    ld   d,$00                      ; 03:5BA9
    ld   hl,Data035A34              ; 03:5BAB
    add  hl,de                      ; 03:5BAE
    ld   e,[hl]                     ; 03:5BAF
    ld   a,e                        ; 03:5BB0
    sub  $04                        ; 03:5BB1
    ld   d,a                        ; 03:5BB3
    pop  hl                         ; 03:5BB4
    jp   Code035BBF                 ; 03:5BB5
Code035BB8:
    ld   a,[$C1EB]                  ; 03:5BB8
    ld   e,a                        ; 03:5BBB
    sub  $04                        ; 03:5BBC
    ld   d,a                        ; 03:5BBE
Code035BBF:
    ld   a,[hl]                     ; 03:5BBF
    and  a                          ; 03:5BC0
    jr   nz,Code035BE2              ; 03:5BC1
    ld   a,[$C1CA]                  ; 03:5BC3
    cp   e                          ; 03:5BC6
    jr   nc,Code035BE2              ; 03:5BC7
    ldh  a,[<$FFA7]                 ; 03:5BC9
    cp   e                          ; 03:5BCB
    jp   c,Code035DA0               ; 03:5BCC
    jp   z,Code035DA0               ; 03:5BCF
    ld   a,[$C1CA]                  ; 03:5BD2
    cp   e                          ; 03:5BD5
    jp   nc,Code035C70              ; 03:5BD6
    ld   hl,$FFA7                   ; 03:5BD9
    ld   a,e                        ; 03:5BDC
    sub  [hl]                       ; 03:5BDD
    ld   b,a                        ; 03:5BDE
    jp   Code035C70                 ; 03:5BDF
Code035BE2:
    ld   hl,$FFB8                   ; 03:5BE2
    ldh  a,[<$FFA7]                 ; 03:5BE5
    sub  [hl]                       ; 03:5BE7
    ldh  [<$FF97],a                 ; 03:5BE8
    cp   e                          ; 03:5BEA
    jr   c,Code035C02               ; 03:5BEB
    ld   a,[$C1EC]                  ; 03:5BED
    bit  7,a                        ; 03:5BF0
    jr   nz,Code035BFA              ; 03:5BF2
    dec  a                          ; 03:5BF4
    ld   [$C1EC],a                  ; 03:5BF5
    jr   nz,Code035C70              ; 03:5BF8
Code035BFA:
    ld   a,$02                      ; 03:5BFA
    ld   [$C1EC],a                  ; 03:5BFC
    inc  b                          ; 03:5BFF
    jr   Code035C70                 ; 03:5C00
Code035C02:
    cp   d                          ; 03:5C02
    jr   nc,Code035C70              ; 03:5C03
    ld   a,[$C1E7]                  ; 03:5C05
    and  a                          ; 03:5C08
    jr   nz,Code035C70              ; 03:5C09
    ld   a,[$C1E9]                  ; 03:5C0B
    cp   $01                        ; 03:5C0E
    jr   z,Code035C70               ; 03:5C10
    jp   Code035DA0                 ; 03:5C12
Code035C15:
    call Sub0360ED                  ; 03:5C15
    jr   nc,Code035C35              ; 03:5C18
    ld   a,[$C161]                  ; 03:5C1A
    dec  a                          ; 03:5C1D
    dec  a                          ; 03:5C1E
    cp   [hl]                       ; 03:5C1F
    jr   nz,Code035C4F              ; 03:5C20
    ld   a,[$C1CA]                  ; 03:5C22
    cp   $40                        ; 03:5C25
    jr   c,Code035C70               ; 03:5C27
    ldh  a,[<$FFA7]                 ; 03:5C29
    cp   $40                        ; 03:5C2B
    jp   nc,Code035DA0              ; 03:5C2D
    sub  $40                        ; 03:5C30
    ld   b,a                        ; 03:5C32
    jr   Code035C70                 ; 03:5C33
Code035C35:
    ld   a,[$C161]                  ; 03:5C35
    dec  a                          ; 03:5C38
    cp   [hl]                       ; 03:5C39
    jr   nz,Code035C4F              ; 03:5C3A
    ld   a,[$C1CA]                  ; 03:5C3C
    cp   $B0                        ; 03:5C3F
    jr   c,Code035C70               ; 03:5C41
    ldh  a,[<$FFA7]                 ; 03:5C43
    cp   $B0                        ; 03:5C45
    jp   nc,Code035DA0              ; 03:5C47
    sub  $B0                        ; 03:5C4A
    ld   b,a                        ; 03:5C4C
    jr   Code035C70                 ; 03:5C4D
Code035C4F:
    ld   hl,$FFB8                   ; 03:5C4F
    ldh  a,[<$FFA7]                 ; 03:5C52
    sub  [hl]                       ; 03:5C54
    ldh  [<$FF97],a                 ; 03:5C55
    cp   $58                        ; 03:5C57
    jr   nc,Code035C70              ; 03:5C59
    ld   a,[$C1EC]                  ; 03:5C5B
    bit  7,a                        ; 03:5C5E
    jr   nz,Code035C68              ; 03:5C60
    dec  a                          ; 03:5C62
    ld   [$C1EC],a                  ; 03:5C63
    jr   nz,Code035C70              ; 03:5C66
Code035C68:
    ld   a,$02                      ; 03:5C68
    ld   [$C1EC],a                  ; 03:5C6A
    ld   a,b                        ; 03:5C6D
    dec  a                          ; 03:5C6E
    ld   b,a                        ; 03:5C6F
Code035C70:
    ld   e,$04                      ; 03:5C70
    ld   a,b                        ; 03:5C72
    bit  7,a                        ; 03:5C73
    jr   z,Code035C7B               ; 03:5C75
    cpl                             ; 03:5C77
    inc  a                          ; 03:5C78
    ld   e,$FC                      ; 03:5C79
Code035C7B:
    cp   $05                        ; 03:5C7B
    jr   c,Code035C80               ; 03:5C7D
    ld   b,e                        ; 03:5C7F
Code035C80:
    ld   e,$00                      ; 03:5C80
    ld   hl,$FFB8                   ; 03:5C82
    ld   a,b                        ; 03:5C85
    bit  7,a                        ; 03:5C86
    jp   z,Code035C8C               ; 03:5C88
    dec  e                          ; 03:5C8B
Code035C8C:
    add  [hl]                       ; 03:5C8C
    ld   [hl],a                     ; 03:5C8D
    ldh  a,[<$FFB9]                 ; 03:5C8E
    adc  e                          ; 03:5C90
    ldh  [<$FFB9],a                 ; 03:5C91
    ld   c,a                        ; 03:5C93
    push hl                         ; 03:5C94
    push bc                         ; 03:5C95
    ld   hl,$FFB8                   ; 03:5C96
    ldh  a,[<$FFA7]                 ; 03:5C99
    sub  [hl]                       ; 03:5C9B
    ld   hl,$FFB9                   ; 03:5C9C
    ldh  a,[<$FFA8]                 ; 03:5C9F
    sbc  [hl]                       ; 03:5CA1
    bit  7,a                        ; 03:5CA2
    jr   z,Code035CAE               ; 03:5CA4
    ldh  a,[<$FFA7]                 ; 03:5CA6
    ldh  [<$FFB8],a                 ; 03:5CA8
    ldh  a,[<$FFA8]                 ; 03:5CAA
    ldh  [<$FFB9],a                 ; 03:5CAC
Code035CAE:
    pop  bc                         ; 03:5CAE
    pop  hl                         ; 03:5CAF
    ld   a,[$C1ED]                  ; 03:5CB0
    sub  [hl]                       ; 03:5CB3
    ld   a,[$C1EE]                  ; 03:5CB4
    sbc  c                          ; 03:5CB7
    bit  7,a                        ; 03:5CB8
    jr   z,Code035CDB               ; 03:5CBA
    ld   a,[hl]                     ; 03:5CBC
    ld   [$C1ED],a                  ; 03:5CBD
    ldh  a,[<$FFB9]                 ; 03:5CC0
    ld   [$C1EE],a                  ; 03:5CC2
    push hl                         ; 03:5CC5
    ld   hl,W_SublevelID            ; 03:5CC6
    ld   a,[W_LevelID]              ; 03:5CC9
    cp   [hl]                       ; 03:5CCC
    jr   nz,Code035CDA              ; 03:5CCD
    ld   hl,$C1EF                   ; 03:5CCF
    ldh  a,[<$FFB9]                 ; 03:5CD2
    cp   [hl]                       ; 03:5CD4
    jr   c,Code035CDA               ; 03:5CD5
    ld   [$C1EF],a                  ; 03:5CD7
Code035CDA:
    pop  hl                         ; 03:5CDA
Code035CDB:
    ld   a,c                        ; 03:5CDB
    cp   $FF                        ; 03:5CDC
    jr   nz,Code035CE7              ; 03:5CDE
    xor  a                          ; 03:5CE0
    ldh  [<$FF97],a                 ; 03:5CE1
    ldh  [<$FF98],a                 ; 03:5CE3
    jr   Code035D06                 ; 03:5CE5
Code035CE7:
    bit  7,e                        ; 03:5CE7
    jr   z,Code035D18               ; 03:5CE9
    ld   a,[$C1ED]                  ; 03:5CEB
    sub  $60                        ; 03:5CEE
    ldh  [<$FF97],a                 ; 03:5CF0
    ld   a,[$C1EE]                  ; 03:5CF2
    sbc  $00                        ; 03:5CF5
    ldh  [<$FF98],a                 ; 03:5CF7
    ldh  a,[<$FFB9]                 ; 03:5CF9
    ld   c,a                        ; 03:5CFB
    ldh  a,[<$FF97]                 ; 03:5CFC
    sub  [hl]                       ; 03:5CFE
    ldh  a,[<$FF98]                 ; 03:5CFF
    sbc  c                          ; 03:5D01
    bit  7,a                        ; 03:5D02
    jr   nz,Code035D18              ; 03:5D04
Code035D06:
    ldh  a,[<$FF97]                 ; 03:5D06
    ldh  [<$FFB8],a                 ; 03:5D08
    ldh  a,[<$FF98]                 ; 03:5D0A
    ldh  [<$FFB9],a                 ; 03:5D0C
    xor  a                          ; 03:5D0E
    ld   [$C1E9],a                  ; 03:5D0F
    ld   [$C1E7],a                  ; 03:5D12
    jp   Code035DA0                 ; 03:5D15
Code035D18:
    call Sub0360ED                  ; 03:5D18
    jr   nc,Code035D5A              ; 03:5D1B
    ld   hl,$FFB9                   ; 03:5D1D
    ld   a,[$C161]                  ; 03:5D20
    dec  a                          ; 03:5D23
    dec  a                          ; 03:5D24
    cp   [hl]                       ; 03:5D25
    jr   nz,Code035DA0              ; 03:5D26
    ld   a,[W_SublevelID]           ; 03:5D28
    cp   $41                        ; 03:5D2B
    jr   z,Code035D33               ; 03:5D2D
    ld   a,$08                      ; 03:5D2F
    jr   Code035D41                 ; 03:5D31
Code035D33:
    ld   a,$09                      ; 03:5D33
    jr   Code035D41                 ; 03:5D35
@Unused035D37:
    srl  a                          ; 03:5D37
    srl  a                          ; 03:5D39
    cp   $0E                        ; 03:5D3B
    jr   nz,Code035D41              ; 03:5D3D
    srl  a                          ; 03:5D3F
Code035D41:
    ld   e,a                        ; 03:5D41
    ld   d,$00                      ; 03:5D42
    ld   hl,Data035A27              ; 03:5D44
    add  hl,de                      ; 03:5D47
    ld   a,[hl]                     ; 03:5D48
    ld   hl,$FFB8                   ; 03:5D49
    cp   [hl]                       ; 03:5D4C
    jr   nc,Code035DA0              ; 03:5D4D
    ldh  [<$FFB8],a                 ; 03:5D4F
    xor  a                          ; 03:5D51
    ld   [$C1E9],a                  ; 03:5D52
    ld   [$C1E7],a                  ; 03:5D55
    jr   Code035DA0                 ; 03:5D58
Code035D5A:
    ld   hl,$FFB9                   ; 03:5D5A
    ld   a,[$C161]                  ; 03:5D5D
    dec  a                          ; 03:5D60
    cp   [hl]                       ; 03:5D61
    jr   nz,Code035DA0              ; 03:5D62
    ld   a,[W_SPFlag]               ; 03:5D64
    and  a                          ; 03:5D67
    jr   z,Code035D76               ; 03:5D68
    ld   de,$0001                   ; 03:5D6A
    ld   a,[W_SublevelID]           ; 03:5D6D
    cp   $62                        ; 03:5D70
    jr   z,Code035D87               ; 03:5D72
    jr   Code035D85                 ; 03:5D74
Code035D76:
    ld   de,$0001                   ; 03:5D76
    ld   a,[W_SublevelID]           ; 03:5D79
    cp   $34                        ; 03:5D7C
    jr   z,Code035D87               ; 03:5D7E
    inc  e                          ; 03:5D80
    cp   $18                        ; 03:5D81
    jr   z,Code035D87               ; 03:5D83
Code035D85:
    ld   e,$00                      ; 03:5D85
Code035D87:
    ld   hl,Data035A31              ; 03:5D87
    add  hl,de                      ; 03:5D8A
    ldh  a,[<$FFB8]                 ; 03:5D8B
    cp   [hl]                       ; 03:5D8D
    jr   c,Code035DA0               ; 03:5D8E
    xor  a                          ; 03:5D90
    ld   [$C1E9],a                  ; 03:5D91
    ld   [$C1E7],a                  ; 03:5D94
    ld   a,[hl]                     ; 03:5D97
    ldh  [<$FFB8],a                 ; 03:5D98
    ld   a,[$C161]                  ; 03:5D9A
    dec  a                          ; 03:5D9D
    ldh  [<$FFB9],a                 ; 03:5D9E
Code035DA0:
    call Sub035EA9                  ; 03:5DA0
    ldh  a,[<$FFAA]                 ; 03:5DA3
    cp   $FF                        ; 03:5DA5
    ret  z                          ; 03:5DA7
    ld   hl,$FFBA                   ; 03:5DA8
    ldh  a,[<$FFA9]                 ; 03:5DAB
    sub  [hl]                       ; 03:5DAD
    ld   c,a                        ; 03:5DAE
    ld   a,[$C1D7]                  ; 03:5DAF
    ld   b,a                        ; 03:5DB2
    call Sub036045                  ; 03:5DB3
    call Sub036059                  ; 03:5DB6
    call Sub035FFE                  ; 03:5DB9
    ld   a,[$C282]                  ; 03:5DBC
    and  a                          ; 03:5DBF
    jr   z,Code035DD0               ; 03:5DC0
    bit  7,b                        ; 03:5DC2
    jr   z,Code035DFB               ; 03:5DC4
    ldh  a,[<$FFA9]                 ; 03:5DC6
    cp   $20                        ; 03:5DC8
    ret  c                          ; 03:5DCA
    cp   $90                        ; 03:5DCB
    ret  nc                         ; 03:5DCD
    jr   Code035DFB                 ; 03:5DCE
Code035DD0:
    ld   hl,$FFBA                   ; 03:5DD0
    ldh  a,[<$FFA9]                 ; 03:5DD3
    sub  [hl]                       ; 03:5DD5
    ld   hl,$FFBB                   ; 03:5DD6
    ldh  a,[<$FFAA]                 ; 03:5DD9
    sbc  [hl]                       ; 03:5DDB
    ldh  [<$FF98],a                 ; 03:5DDC
    bit  7,b                        ; 03:5DDE
    jr   z,Code035DEF               ; 03:5DE0
    ldh  a,[<$FF98]                 ; 03:5DE2
    and  a                          ; 03:5DE4
    jr   nz,Code035DFB              ; 03:5DE5
    call Sub035FD1                  ; 03:5DE7
    ld   a,c                        ; 03:5DEA
    cp   e                          ; 03:5DEB
    ret  nc                         ; 03:5DEC
    jr   Code035DFB                 ; 03:5DED
Code035DEF:
    ldh  a,[<$FF98]                 ; 03:5DEF
    and  a                          ; 03:5DF1
    ret  nz                         ; 03:5DF2
    ld   a,c                        ; 03:5DF3
    cp   $50                        ; 03:5DF4
    ret  c                          ; 03:5DF6
    xor  a                          ; 03:5DF7
    ld   [$C260],a                  ; 03:5DF8
Code035DFB:
    ld   a,[$C1FA]                  ; 03:5DFB
    and  a                          ; 03:5DFE
    jr   z,Code035E04               ; 03:5DFF
    bit  7,b                        ; 03:5E01
    ret  nz                         ; 03:5E03
Code035E04:
    ld   e,$00                      ; 03:5E04
    ld   a,b                        ; 03:5E06
    bit  7,a                        ; 03:5E07
    jp   z,Code035E0D               ; 03:5E09
    dec  e                          ; 03:5E0C
Code035E0D:
    ld   hl,$FFBA                   ; 03:5E0D
    add  [hl]                       ; 03:5E10
    ld   [hl],a                     ; 03:5E11
    ldh  a,[<$FFBB]                 ; 03:5E12
    adc  e                          ; 03:5E14
    ldh  [<$FFBB],a                 ; 03:5E15
    ld   a,[hl]                     ; 03:5E17
    cp   $38                        ; 03:5E18
    jr   nc,Code035E22              ; 03:5E1A
    ld   a,$38                      ; 03:5E1C
    ldi  [hl],a                     ; 03:5E1E
    ld   [hl],$00                   ; 03:5E1F
    ret                             ; 03:5E21

Code035E22:
    ld   a,[hl]                     ; 03:5E22
    cp   $70                        ; 03:5E23
    ret  c                          ; 03:5E25
    ld   [hl],$70                   ; 03:5E26
    ret                             ; 03:5E28

Data035E29:                         ; 03:5E29
.db $00,$00,$00,$00,$50,$09,$00,$00,\
    $90,$0C,$00,$00,$D0,$0D,$00,$00,\
    $80,$0C,$10,$0D,$70,$09,$00,$00,\
    $10,$0E,$00,$00,$20,$09,$00,$00,\
    $70,$0C,$80,$0C,$50,$09,$00,$00,\
    $B0,$0B,$80,$0D,$00,$00,$00,$00,\
    $00,$00,$00,$00,$D0,$0D,$00,$00,\
    $70,$17,$90,$0D,$B0,$0D,$00,$00
Data035E69:                         ; 03:5E69
.db $C0,$0B,$C0,$01,$70,$0A,$00,$00,\
    $70,$0E,$60,$10,$F0,$0A,$00,$00,\
    $A0,$0B,$C0,$01,$80,$0B,$00,$00,\
    $70,$0C,$00,$0D,$80,$0B,$00,$00,\
    $B0,$16,$C0,$01,$D0,$06,$00,$00,\
    $50,$0F,$C0,$01,$70,$0D,$00,$00,\
    $B0,$0C,$10,$07,$A0,$13,$00,$00,\
    $80,$0D,$A0,$01,$40,$0D,$00,$00

Sub035EA9:
    ld   a,[W_GameMode]             ; 03:5EA9
    cp   $02                        ; 03:5EAC
    ret  z                          ; 03:5EAE
    cp   $07                        ; 03:5EAF
    ret  z                          ; 03:5EB1
    ld   a,[W_PlayerState]          ; 03:5EB2
    cp   $05                        ; 03:5EB5
    ret  nz                         ; 03:5EB7
    ld   hl,Data035E29              ; 03:5EB8
    ld   a,[W_SPFlag]               ; 03:5EBB
    and  a                          ; 03:5EBE
    jr   z,Code035EC4               ; 03:5EBF
    ld   hl,Data035E69              ; 03:5EC1
Code035EC4:
    ld   a,[W_LevelID]              ; 03:5EC4
    sla  a                          ; 03:5EC7
    ld   e,a                        ; 03:5EC9
    ld   d,$00                      ; 03:5ECA
    add  hl,de                      ; 03:5ECC
    ldi  a,[hl]                     ; 03:5ECD
    ldh  [<$FF97],a                 ; 03:5ECE
    ld   a,[hl]                     ; 03:5ED0
    ldh  [<$FF98],a                 ; 03:5ED1
    ld   hl,$FF97                   ; 03:5ED3
    or   [hl]                       ; 03:5ED6
    ret  z                          ; 03:5ED7
    ld   hl,$FFB8                   ; 03:5ED8
    ldh  a,[<$FF97]                 ; 03:5EDB
    sub  [hl]                       ; 03:5EDD
    ldh  [<$FF99],a                 ; 03:5EDE
    ld   hl,$FFB9                   ; 03:5EE0
    ldh  a,[<$FF98]                 ; 03:5EE3
    sbc  [hl]                       ; 03:5EE5
    ldh  [<$FF9A],a                 ; 03:5EE6
    bit  7,a                        ; 03:5EE8
    jr   nz,Code035EF1              ; 03:5EEA
    ld   hl,$FF99                   ; 03:5EEC
    or   [hl]                       ; 03:5EEF
    ret  nz                         ; 03:5EF0
Code035EF1:
    ldh  a,[<$FF97]                 ; 03:5EF1
    ldh  [<$FFB8],a                 ; 03:5EF3
    ldh  a,[<$FF98]                 ; 03:5EF5
    ldh  [<$FFB9],a                 ; 03:5EF7
    ret                             ; 03:5EF9

Sub035EFA:
    push hl                         ; 03:5EFA
    push de                         ; 03:5EFB
    ld   a,[W_GameMode]             ; 03:5EFC
    cp   $07                        ; 03:5EFF
    jp   z,Code035F41               ; 03:5F01
    cp   $02                        ; 03:5F04
    jr   nz,Code035F3D              ; 03:5F06
    ld   hl,$C581                   ; 03:5F08
    ld   a,[$C501]                  ; 03:5F0B
    sub  [hl]                       ; 03:5F0E
    ld   e,a                        ; 03:5F0F
    ld   hl,$C582                   ; 03:5F10
    ld   a,[$C502]                  ; 03:5F13
    sbc  [hl]                       ; 03:5F16
    ld   d,a                        ; 03:5F17
    ld   a,[$C366]                  ; 03:5F18
    and  a                          ; 03:5F1B
    jr   z,Code035F2C               ; 03:5F1C
    ld   a,d                        ; 03:5F1E
    bit  7,a                        ; 03:5F1F
    jr   z,Code035F3D               ; 03:5F21
    and  a                          ; 03:5F23
    jr   nz,Code035F38              ; 03:5F24
    ld   a,e                        ; 03:5F26
    and  a                          ; 03:5F27
    jr   z,Code035F3D               ; 03:5F28
    jr   Code035F38                 ; 03:5F2A
Code035F2C:
    ld   a,d                        ; 03:5F2C
    bit  7,a                        ; 03:5F2D
    jr   nz,Code035F3D              ; 03:5F2F
    and  a                          ; 03:5F31
    jr   nz,Code035F38              ; 03:5F32
    ld   a,e                        ; 03:5F34
    and  a                          ; 03:5F35
    jr   z,Code035F3D               ; 03:5F36
Code035F38:
    pop  de                         ; 03:5F38
    pop  hl                         ; 03:5F39
    scf                             ; 03:5F3A
    ccf                             ; 03:5F3B
    ret                             ; 03:5F3C

Code035F3D:
    pop  de                         ; 03:5F3D
    pop  hl                         ; 03:5F3E
    scf                             ; 03:5F3F
    ret                             ; 03:5F40

Code035F41:
    ld   hl,$C3B0                   ; 03:5F41
    ldh  a,[<$FFA7]                 ; 03:5F44
    sub  [hl]                       ; 03:5F46
    ld   e,a                        ; 03:5F47
    ld   hl,$C3B1                   ; 03:5F48
    ldh  a,[<$FFA8]                 ; 03:5F4B
    sbc  [hl]                       ; 03:5F4D
    ld   d,a                        ; 03:5F4E
    ld   a,d                        ; 03:5F4F
    bit  7,a                        ; 03:5F50
    jr   nz,Code035F3D              ; 03:5F52
    and  a                          ; 03:5F54
    jr   nz,Code035F38              ; 03:5F55
    ld   a,e                        ; 03:5F57
    and  a                          ; 03:5F58
    jr   z,Code035F3D               ; 03:5F59
    jr   Code035F38                 ; 03:5F5B

Sub035F5D:
    ld   a,$20                      ; 03:5F5D
    ld   [$C1EB],a                  ; 03:5F5F
    ld   a,[W_SPFlag]               ; 03:5F62
    and  a                          ; 03:5F65
    ret  nz                         ; 03:5F66
    ld   a,[W_SublevelID]           ; 03:5F67
    cp   $18                        ; 03:5F6A
    ret  nz                         ; 03:5F6C
    ld   a,$38                      ; 03:5F6D
    ld   [$C1EB],a                  ; 03:5F6F
    ret                             ; 03:5F72

Sub035F73:
    ld   a,[$C1F3]                  ; 03:5F73
    and  a                          ; 03:5F76
    jr   z,Code035F86               ; 03:5F77
    ld   a,[W_PlayerState]          ; 03:5F79
    cp   $11                        ; 03:5F7C
    jr   z,Code035F84               ; 03:5F7E
    cp   $05                        ; 03:5F80
    jr   z,Code035F84               ; 03:5F82
Code035F84:
    scf                             ; 03:5F84
    ret                             ; 03:5F85

Code035F86:
    scf                             ; 03:5F86
    ccf                             ; 03:5F87
    ret                             ; 03:5F88

Data035F89:                         ; 03:5F89
.db $02,$FE,$01

Sub035F8C:
    ld   a,[$C1E7]                  ; 03:5F8C
    cp   $00                        ; 03:5F8F
    ret  z                          ; 03:5F91
    dec  a                          ; 03:5F92
    rst  $00                        ; 03:5F93
.dw Code035F9A                      ; 03:5F94
.dw Code035FA6                      ; 03:5F96
.dw Code035F9A                      ; 03:5F98
Code035F9A:
    ld   hl,$FFB8                   ; 03:5F9A
    ldh  a,[<$FFA7]                 ; 03:5F9D
    sub  [hl]                       ; 03:5F9F
    cp   $03                        ; 03:5FA0
    jr   c,Code035FC4               ; 03:5FA2
    jr   Code035FB5                 ; 03:5FA4
Code035FA6:
    ld   a,[$C1EB]                  ; 03:5FA6
    sub  $08                        ; 03:5FA9
    ld   e,a                        ; 03:5FAB
    ld   hl,$FFB8                   ; 03:5FAC
    ldh  a,[<$FFA7]                 ; 03:5FAF
    sub  [hl]                       ; 03:5FB1
    cp   e                          ; 03:5FB2
    jr   nc,Code035FC4              ; 03:5FB3
Code035FB5:
    ld   a,[$C1E7]                  ; 03:5FB5
    dec  a                          ; 03:5FB8
    ld   e,a                        ; 03:5FB9
    ld   d,$00                      ; 03:5FBA
    ld   hl,Data035F89              ; 03:5FBC
    add  hl,de                      ; 03:5FBF
    ld   a,[hl]                     ; 03:5FC0
    add  b                          ; 03:5FC1
    ld   b,a                        ; 03:5FC2
    ret                             ; 03:5FC3

Code035FC4:
    xor  a                          ; 03:5FC4
    ld   [$C1E7],a                  ; 03:5FC5
    ret                             ; 03:5FC8

Data035FC9:                         ; 03:5FC9
.db $03,$0B,$17,$1B
Data035FCD:                         ; 03:5FCD
.db $02,$02,$02,$02

Sub035FD1:
    ld   de,$0000                   ; 03:5FD1
Code035FD4:
    ld   hl,Data035FC9              ; 03:5FD4
    add  hl,de                      ; 03:5FD7
    ld   a,[W_SublevelID]           ; 03:5FD8
    cp   [hl]                       ; 03:5FDB
    jr   z,Code035FE7               ; 03:5FDC
    inc  e                          ; 03:5FDE
    ld   a,e                        ; 03:5FDF
    cp   $04                        ; 03:5FE0
    jr   nz,Code035FD4              ; 03:5FE2
    ld   e,$08                      ; 03:5FE4
    ret                             ; 03:5FE6

Code035FE7:
    ld   hl,Data035FCD              ; 03:5FE7
    add  hl,de                      ; 03:5FEA
    ld   e,[hl]                     ; 03:5FEB
    ret                             ; 03:5FEC

Sub035FED:
    ld   hl,$FFBA                   ; 03:5FED
    ldh  a,[<$FFA9]                 ; 03:5FF0
    sub  [hl]                       ; 03:5FF2
    ldh  [<$FF97],a                 ; 03:5FF3
    ld   hl,$FFBB                   ; 03:5FF5
    ldh  a,[<$FFAA]                 ; 03:5FF8
    sbc  [hl]                       ; 03:5FFA
    ldh  [<$FF98],a                 ; 03:5FFB
    ret                             ; 03:5FFD

Sub035FFE:
    ld   a,[W_GameMode]             ; 03:5FFE
    cp   $02                        ; 03:6001
    ret  nz                         ; 03:6003
    ld   a,[$C3A6]                  ; 03:6004
    and  a                          ; 03:6007
    ret  z                          ; 03:6008
    ld   d,$FF                      ; 03:6009
    ld   e,$01                      ; 03:600B
    ldh  a,[<$FFBA]                 ; 03:600D
    cp   $5C                        ; 03:600F
    jr   c,Code036017               ; 03:6011
    ld   d,$01                      ; 03:6013
    ld   e,$FF                      ; 03:6015
Code036017:
    ld   a,[$C3A7]                  ; 03:6017
    sub  $01                        ; 03:601A
    bit  7,a                        ; 03:601C
    jr   z,Code03602D               ; 03:601E
    ld   e,d                        ; 03:6020
    cp   $FA                        ; 03:6021
    jr   nc,Code03602D              ; 03:6023
    xor  a                          ; 03:6025
    ld   [$C3A6],a                  ; 03:6026
    ld   [$C3A7],a                  ; 03:6029
    ret                             ; 03:602C

Code03602D:
    ld   [$C3A7],a                  ; 03:602D
    ldh  a,[<$FFBA]                 ; 03:6030
    add  e                          ; 03:6032
    cp   $70                        ; 03:6033
    jr   c,Code036039               ; 03:6035
    ld   a,$70                      ; 03:6037
Code036039:
    ldh  [<$FFBA],a                 ; 03:6039
    cp   $40                        ; 03:603B
    ret  nc                         ; 03:603D
    ld   a,b                        ; 03:603E
    bit  7,a                        ; 03:603F
    ret  z                          ; 03:6041
    ld   b,$00                      ; 03:6042
    ret                             ; 03:6044

Sub036045:
    ld   a,[$C260]                  ; 03:6045
    and  a                          ; 03:6048
    ret  z                          ; 03:6049
    ld   a,[$C260]                  ; 03:604A
    sub  $02                        ; 03:604D
    ld   [$C260],a                  ; 03:604F
    ldh  a,[<$FFBA]                 ; 03:6052
    sub  $02                        ; 03:6054
    ldh  [<$FFBA],a                 ; 03:6056
    ret                             ; 03:6058

Sub036059:
    ld   a,[$C28D]                  ; 03:6059
    cp   $01                        ; 03:605C
    jr   z,Code036095               ; 03:605E
    cp   $02                        ; 03:6060
    jr   z,Code03606E               ; 03:6062
    ld   a,[$C25F]                  ; 03:6064
    cp   $00                        ; 03:6067
    ret  z                          ; 03:6069
    cp   $01                        ; 03:606A
    jr   nz,Code036095              ; 03:606C
Code03606E:
    call Sub035FED                  ; 03:606E
    ldh  a,[<$FF98]                 ; 03:6071
    bit  7,a                        ; 03:6073
    jr   z,Code03607D               ; 03:6075
    ldh  a,[<$FF97]                 ; 03:6077
    cp   $EE                        ; 03:6079
    jr   c,Code03608D               ; 03:607B
Code03607D:
    ldh  a,[<$FFBA]                 ; 03:607D
    add  $02                        ; 03:607F
    ldh  [<$FFBA],a                 ; 03:6081
    ldh  a,[<$FFBB]                 ; 03:6083
    adc  $00                        ; 03:6085
    ldh  [<$FFBB],a                 ; 03:6087
    call Sub0360C6                  ; 03:6089
    ret                             ; 03:608C

Code03608D:
    xor  a                          ; 03:608D
    ld   [$C25F],a                  ; 03:608E
    ld   [$C28D],a                  ; 03:6091
    ret                             ; 03:6094

Code036095:
    call Sub035FED                  ; 03:6095
    ldh  a,[<$FF98]                 ; 03:6098
    and  a                          ; 03:609A
    jr   z,Code0360A5               ; 03:609B
    ldh  a,[<$FF97]                 ; 03:609D
    cp   $B0                        ; 03:609F
    jr   c,Code0360BB               ; 03:60A1
    jr   Code0360AB                 ; 03:60A3
Code0360A5:
    ldh  a,[<$FF97]                 ; 03:60A5
    cp   $71                        ; 03:60A7
    jr   nc,Code0360BB              ; 03:60A9
Code0360AB:
    ldh  a,[<$FFBA]                 ; 03:60AB
    sub  $02                        ; 03:60AD
    ldh  [<$FFBA],a                 ; 03:60AF
    ldh  a,[<$FFBB]                 ; 03:60B1
    sbc  $00                        ; 03:60B3
    ldh  [<$FFBB],a                 ; 03:60B5
    call Sub0360C6                  ; 03:60B7
    ret                             ; 03:60BA

Code0360BB:
    xor  a                          ; 03:60BB
    ld   [$C25F],a                  ; 03:60BC
    ld   [$C261],a                  ; 03:60BF
    ld   [$C28D],a                  ; 03:60C2
    ret                             ; 03:60C5

Sub0360C6:
    ldh  a,[<$FFBA]                 ; 03:60C6
    cp   $38                        ; 03:60C8
    jr   nc,Code0360D3              ; 03:60CA
    xor  a                          ; 03:60CC
    ldh  [<$FFBB],a                 ; 03:60CD
    ld   a,$38                      ; 03:60CF
    jr   Code0360DA                 ; 03:60D1
Code0360D3:
    ldh  a,[<$FFBA]                 ; 03:60D3
    cp   $70                        ; 03:60D5
    ret  c                          ; 03:60D7
    ld   a,$70                      ; 03:60D8
Code0360DA:
    ldh  [<$FFBA],a                 ; 03:60DA
    xor  a                          ; 03:60DC
    ld   [$C25F],a                  ; 03:60DD
    ld   [$C261],a                  ; 03:60E0
    ld   [$C263],a                  ; 03:60E3
    ld   [$C262],a                  ; 03:60E6
    ld   [$C28D],a                  ; 03:60E9
    ret                             ; 03:60EC

Sub0360ED:
    ld   a,[W_SPFlag]               ; 03:60ED
    and  a                          ; 03:60F0
    jr   z,Code036108               ; 03:60F1
    ld   a,[W_SublevelID]           ; 03:60F3
    cp   $1F                        ; 03:60F6
    jr   z,Code03612B               ; 03:60F8
    cp   $51                        ; 03:60FA
    jr   z,Code03612B               ; 03:60FC
    cp   $52                        ; 03:60FE
    jr   z,Code03612B               ; 03:6100
    cp   $53                        ; 03:6102
    jr   z,Code03612B               ; 03:6104
    jr   Code03611B                 ; 03:6106
Code036108:
    ld   a,[W_SublevelID]           ; 03:6108
    cp   $1F                        ; 03:610B
    jr   z,Code03612B               ; 03:610D
    cp   $36                        ; 03:610F
    jr   z,Code03612B               ; 03:6111
    cp   $37                        ; 03:6113
    jr   z,Code03612B               ; 03:6115
    cp   $38                        ; 03:6117
    jr   z,Code03612B               ; 03:6119
Code03611B:
    ldh  a,[<H_PlInitY_SubLvType]   ; 03:611B
    and  $0F                        ; 03:611D
    cp   $04                        ; 03:611F
    jr   nz,Code03612B              ; 03:6121
    ld   a,[$C264]                  ; 03:6123
    and  a                          ; 03:6126
    jr   nz,Code03612B              ; 03:6127
    scf                             ; 03:6129
    ret                             ; 03:612A

Code03612B:
    scf                             ; 03:612B
    ccf                             ; 03:612C
    ret                             ; 03:612D

Data03612E:                         ; 03:612E
.db $FF,$01

Sub036130:
    ld   a,[W_PlayerState]          ; 03:6130
    cp   $05                        ; 03:6133
    ret  z                          ; 03:6135
    ld   a,[$C1E8]                  ; 03:6136
    and  a                          ; 03:6139
    ret  nz                         ; 03:613A
    ld   hl,$C161                   ; 03:613B
    ld   a,[hl]                     ; 03:613E
    dec  a                          ; 03:613F
    ldh  [<$FF97],a                 ; 03:6140
    ld   hl,$FF97                   ; 03:6142
    ld   a,[W_GameMode]             ; 03:6145
    cp   $02                        ; 03:6148
    jr   z,Code036154               ; 03:614A
    ld   a,[$C1EB]                  ; 03:614C
    cp   $20                        ; 03:614F
    jp   nz,Code0361CD              ; 03:6151
Code036154:
    ldh  a,[<$FFA8]                 ; 03:6154
    cp   $00                        ; 03:6156
    jr   z,Code036166               ; 03:6158
    cp   [hl]                       ; 03:615A
    jr   nz,Code03616F              ; 03:615B
    ldh  a,[<$FFA7]                 ; 03:615D
    cp   $B0                        ; 03:615F
    jr   c,Code036179               ; 03:6161
    jp   Code0361C8                 ; 03:6163
Code036166:
    ldh  a,[<$FFA7]                 ; 03:6166
    cp   $20                        ; 03:6168
    jp   c,Code0361C8               ; 03:616A
    jr   Code036179                 ; 03:616D
Code03616F:
    ld   a,[$C1E9]                  ; 03:616F
    cp   $00                        ; 03:6172
    ret  z                          ; 03:6174
    cp   $02                        ; 03:6175
    jr   z,Code0361C8               ; 03:6177
Code036179:
    ld   a,[$C1C3]                  ; 03:6179
    and  a                          ; 03:617C
    jr   nz,Code0361C8              ; 03:617D
    ld   hl,$C1C3                   ; 03:617F
    ld   a,[$C1EA]                  ; 03:6182
    cp   [hl]                       ; 03:6185
    jr   nz,Code0361C8              ; 03:6186
    ld   hl,$C1F4                   ; 03:6188
    ldh  a,[<H_ButtonFlags]         ; 03:618B
    and  $30                        ; 03:618D
    jr   z,Code036194               ; 03:618F
    ld   [hl],$00                   ; 03:6191
    ret                             ; 03:6193

Code036194:
    inc  [hl]                       ; 03:6194
    ld   a,[hl]                     ; 03:6195
    cp   $20                        ; 03:6196
    ret  c                          ; 03:6198
    ld   [hl],$21                   ; 03:6199
    ld   hl,$FFB8                   ; 03:619B
    ldh  a,[<$FFA7]                 ; 03:619E
    sub  [hl]                       ; 03:61A0
    cp   $48                        ; 03:61A1
    jr   nc,Code0361C8              ; 03:61A3
    sub  $48                        ; 03:61A5
    bit  7,a                        ; 03:61A7
    jr   z,Code0361AD               ; 03:61A9
    cpl                             ; 03:61AB
    inc  a                          ; 03:61AC
Code0361AD:
    cp   $03                        ; 03:61AD
    jr   c,Code0361C8               ; 03:61AF
    ldh  a,[<$FFB7]                 ; 03:61B1
    and  $01                        ; 03:61B3
    ret  nz                         ; 03:61B5
    ld   a,[$C1E9]                  ; 03:61B6
    cp   $00                        ; 03:61B9
    ret  z                          ; 03:61BB
    dec  a                          ; 03:61BC
    ld   e,a                        ; 03:61BD
    ld   d,$00                      ; 03:61BE
    ld   hl,Data03612E              ; 03:61C0
    add  hl,de                      ; 03:61C3
    ld   a,[hl]                     ; 03:61C4
    add  b                          ; 03:61C5
    ld   b,a                        ; 03:61C6
    ret                             ; 03:61C7

Code0361C8:
    xor  a                          ; 03:61C8
    ld   [$C1E9],a                  ; 03:61C9
    ret                             ; 03:61CC

Code0361CD:
    ld   hl,$C1F4                   ; 03:61CD
    ld   [hl],$00                   ; 03:61D0
    xor  a                          ; 03:61D2
    ld   [$C1E9],a                  ; 03:61D3
    ret                             ; 03:61D6

Data0361D7:                         ; 03:61D7
.db $00,$02
Data0361D9:                         ; 03:61D9
.db $02,$01,$06
Data0361DC:                         ; 03:61DC
.db $02,$04,$07

Sub0361DF:
    ldh  a,[<H_PlInitY_SubLvType]   ; 03:61DF
    and  $0F                        ; 03:61E1
    cp   $02                        ; 03:61E3
    jp   z,Code0361F4               ; 03:61E5
    ld   a,[$C26B]                  ; 03:61E8
    and  a                          ; 03:61EB
    jr   nz,Code0361F4              ; 03:61EC
    ld   a,[$C1D8]                  ; 03:61EE
    and  a                          ; 03:61F1
    jr   z,Code036229               ; 03:61F2
Code0361F4:
    ld   a,[$C1C5]                  ; 03:61F4
    and  a                          ; 03:61F7
    jr   z,Code036200               ; 03:61F8
    ld   a,[$C1DD]                  ; 03:61FA
    and  a                          ; 03:61FD
    jr   nz,Code036229              ; 03:61FE
Code036200:
    ld   hl,$C1C3                   ; 03:6200
    ld   a,[$C25E]                  ; 03:6203
    rlc  a                          ; 03:6206
    rlc  a                          ; 03:6208
    ld   b,$02                      ; 03:620A
    ld   d,$00                      ; 03:620C
    ld   e,d                        ; 03:620E
Code03620F:
    rlc  a                          ; 03:620F
    jr   nc,Code036225              ; 03:6211
    ld   a,[$C1C3]                  ; 03:6213
    ldh  [<$FF97],a                 ; 03:6216
    ld   hl,Data0361D7              ; 03:6218
    add  hl,de                      ; 03:621B
    ld   a,[hl]                     ; 03:621C
    ld   [$C1C3],a                  ; 03:621D
    call Sub036398                  ; 03:6220
    jr   Code036229                 ; 03:6223
Code036225:
    inc  e                          ; 03:6225
    dec  b                          ; 03:6226
    jr   nz,Code03620F              ; 03:6227
Code036229:
    ldh  a,[<H_PlInitY_SubLvType]   ; 03:6229
    and  $0F                        ; 03:622B
    cp   $02                        ; 03:622D
    jp   z,Code036321               ; 03:622F
    ld   a,[W_PlayerState]          ; 03:6232
    cp   $01                        ; 03:6235
    ret  z                          ; 03:6237
Code036238:
    ld   hl,$C25E                   ; 03:6238
    ld   a,[$C1C5]                  ; 03:623B
    and  a                          ; 03:623E
    jr   nz,Code036248              ; 03:623F
    ldh  a,[<$FFAB]                 ; 03:6241
    and  a                          ; 03:6243
    jr   nz,Code0362AB              ; 03:6244
    jr   Code036262                 ; 03:6246
Code036248:
    ld   a,[$C1F7]                  ; 03:6248
    and  a                          ; 03:624B
    jr   z,Code036255               ; 03:624C
    ld   a,[$C1F7]                  ; 03:624E
    dec  a                          ; 03:6251
    ld   [$C1F7],a                  ; 03:6252
Code036255:
    ld   a,[$C1DD]                  ; 03:6255
    and  a                          ; 03:6258
    jr   nz,Code036267              ; 03:6259
    ldh  a,[<$FFAB]                 ; 03:625B
    and  a                          ; 03:625D
    jr   nz,Code0362AB              ; 03:625E
    jr   Code03628F                 ; 03:6260
Code036262:
    ld   a,[hl]                     ; 03:6262
    and  $30                        ; 03:6263
    jr   nz,Code0362AB              ; 03:6265
Code036267:
    ld   a,[$C1C5]                  ; 03:6267
    and  a                          ; 03:626A
    jr   z,Code03629F               ; 03:626B
    ld   a,[$C26B]                  ; 03:626D
    and  a                          ; 03:6270
    jr   nz,Code036279              ; 03:6271
    ld   a,[$C1D8]                  ; 03:6273
    and  a                          ; 03:6276
    jr   z,Code0362AB               ; 03:6277
Code036279:
    ld   a,[hl]                     ; 03:6279
    and  $30                        ; 03:627A
    jr   z,Code036285               ; 03:627C
    ldh  a,[<$FFAB]                 ; 03:627E
    and  a                          ; 03:6280
    jr   z,Code03629F               ; 03:6281
    jr   Code0362AB                 ; 03:6283
Code036285:
    ld   a,$0B                      ; 03:6285
    ld   [$C1C2],a                  ; 03:6287
    ld   [$C1C6],a                  ; 03:628A
    jr   Code0362A6                 ; 03:628D
Code03628F:
    ld   a,[hl]                     ; 03:628F
    and  $30                        ; 03:6290
    jr   nz,Code0362AB              ; 03:6292
    ld   a,[$C26B]                  ; 03:6294
    and  a                          ; 03:6297
    jr   nz,Code03629F              ; 03:6298
    ld   a,[$C1D8]                  ; 03:629A
    and  a                          ; 03:629D
    ret  z                          ; 03:629E
Code03629F:
    xor  a                          ; 03:629F
    ld   [$C1C2],a                  ; 03:62A0
    ld   [$C1C6],a                  ; 03:62A3
Code0362A6:
    xor  a                          ; 03:62A6
    ld   [$C1C4],a                  ; 03:62A7
    ret                             ; 03:62AA

Code0362AB:
    ld   a,[$C26B]                  ; 03:62AB
    and  a                          ; 03:62AE
    jr   nz,Code0362B6              ; 03:62AF
    ld   a,[$C1D8]                  ; 03:62B1
    and  a                          ; 03:62B4
    ret  z                          ; 03:62B5
Code0362B6:
    ldh  a,[<$FFAB]                 ; 03:62B6
    bit  7,a                        ; 03:62B8
    jr   z,Code0362BE               ; 03:62BA
    cpl                             ; 03:62BC
    inc  a                          ; 03:62BD
Code0362BE:
    ld   [$C1FF],a                  ; 03:62BE
    call Sub0363BE                  ; 03:62C1
    jr   c,Code0362A6               ; 03:62C4
    ld   de,$0000                   ; 03:62C6
    ld   a,[$C1FF]                  ; 03:62C9
    cp   $1C                        ; 03:62CC
    jr   nc,Code0362D6              ; 03:62CE
    inc  e                          ; 03:62D0
    cp   $0E                        ; 03:62D1
    jr   nc,Code0362D6              ; 03:62D3
    inc  e                          ; 03:62D5
Code0362D6:
    ld   hl,Data0361DC              ; 03:62D6
    add  hl,de                      ; 03:62D9
    ld   a,[$C1C4]                  ; 03:62DA
    dec  a                          ; 03:62DD
    ld   [$C1C4],a                  ; 03:62DE
    bit  7,a                        ; 03:62E1
    ret  z                          ; 03:62E3
    ld   a,[hl]                     ; 03:62E4
    ld   [$C1C4],a                  ; 03:62E5
    ld   a,[$C1C6]                  ; 03:62E8
    inc  a                          ; 03:62EB
    cp   $03                        ; 03:62EC
    jp   c,Code0362F2               ; 03:62EE
    xor  a                          ; 03:62F1
Code0362F2:
    ld   [$C1C6],a                  ; 03:62F2
    ld   l,a                        ; 03:62F5
    ld   h,$00                      ; 03:62F6
    ld   de,Data0361D9              ; 03:62F8
    add  hl,de                      ; 03:62FB
    ld   a,[hl]                     ; 03:62FC
    ld   [$C1C2],a                  ; 03:62FD
    ret                             ; 03:6300

Data036301:                         ; 03:6301
.db $08,$0E,$10,$09,$11,$0A,$00,$00,\
    $08,$0E,$08,$0E,$08,$0E,$00,$00
Data036311:                         ; 03:6311
.db $02,$02,$01,$01,$01,$01,$00,$00,\
    $02,$02,$02,$02,$02,$02,$00,$00
Code036321:
    ldh  a,[<$FFAB]                 ; 03:6321
    bit  7,a                        ; 03:6323
    jr   z,Code036329               ; 03:6325
    cpl                             ; 03:6327
    inc  a                          ; 03:6328
Code036329:
    ld   [$C1FF],a                  ; 03:6329
    ld   a,[$C1C6]                  ; 03:632C
    push af                         ; 03:632F
    ld   a,[$C1C2]                  ; 03:6330
    push af                         ; 03:6333
    call Sub0363BE                  ; 03:6334
    pop  af                         ; 03:6337
    ld   [$C1C2],a                  ; 03:6338
    pop  af                         ; 03:633B
    ld   [$C1C6],a                  ; 03:633C
    ld   a,[$C1F7]                  ; 03:633F
    and  a                          ; 03:6342
    jr   z,Code03634C               ; 03:6343
    ld   a,[$C1F7]                  ; 03:6345
    dec  a                          ; 03:6348
    ld   [$C1F7],a                  ; 03:6349
Code03634C:
    ld   a,[$C1D8]                  ; 03:634C
    and  a                          ; 03:634F
    jp   nz,Code036238              ; 03:6350
    ld   a,[$C1C4]                  ; 03:6353
    dec  a                          ; 03:6356
    ld   [$C1C4],a                  ; 03:6357
    bit  7,a                        ; 03:635A
    jp   z,Code036389               ; 03:635C
    ld   h,$00                      ; 03:635F
    ld   a,[$C1C6]                  ; 03:6361
    and  $07                        ; 03:6364
    inc  a                          ; 03:6366
    cp   $06                        ; 03:6367
    jr   c,Code03636C               ; 03:6369
    xor  a                          ; 03:636B
Code03636C:
    ld   l,a                        ; 03:636C
    ldh  a,[<$FFAC]                 ; 03:636D
    cp   $00                        ; 03:636F
    jr   z,Code03637B               ; 03:6371
    cp   $FB                        ; 03:6373
    jr   nc,Code03637B              ; 03:6375
    bit  7,a                        ; 03:6377
    jr   nz,Code03637D              ; 03:6379
Code03637B:
    set  3,l                        ; 03:637B
Code03637D:
    ld   a,l                        ; 03:637D
    ld   [$C1C6],a                  ; 03:637E
    ld   de,Data036311              ; 03:6381
    add  hl,de                      ; 03:6384
    ld   a,[hl]                     ; 03:6385
    ld   [$C1C4],a                  ; 03:6386
Code036389:
    ld   a,[$C1C6]                  ; 03:6389
    ld   l,a                        ; 03:638C
    ld   h,$00                      ; 03:638D
    ld   de,Data036301              ; 03:638F
    add  hl,de                      ; 03:6392
    ld   a,[hl]                     ; 03:6393
    ld   [$C1C2],a                  ; 03:6394
    ret                             ; 03:6397

Sub036398:
    ld   hl,$FF97                   ; 03:6398
    cp   [hl]                       ; 03:639B
    ret  z                          ; 03:639C
    ld   a,[$C1E9]                  ; 03:639D
    and  a                          ; 03:63A0
    ret  nz                         ; 03:63A1
    ld   a,$01                      ; 03:63A2
    ld   b,a                        ; 03:63A4
    ld   hl,$FFB8                   ; 03:63A5
    ldh  a,[<$FFA7]                 ; 03:63A8
    sub  [hl]                       ; 03:63AA
    cp   $34                        ; 03:63AB
    jr   c,Code0363B3               ; 03:63AD
    inc  b                          ; 03:63AF
    cp   $5C                        ; 03:63B0
    ret  c                          ; 03:63B2
Code0363B3:
    ld   a,b                        ; 03:63B3
    ld   [$C1E9],a                  ; 03:63B4
    ld   a,[$C1C3]                  ; 03:63B7
    ld   [$C1EA],a                  ; 03:63BA
    ret                             ; 03:63BD

Sub0363BE:
    ldh  a,[<$FFAB]                 ; 03:63BE
    bit  7,a                        ; 03:63C0
    jp   z,Code0363C7               ; 03:63C2
    cpl                             ; 03:63C5
    inc  a                          ; 03:63C6
Code0363C7:
    cp   $08                        ; 03:63C7
    jp   c,Code036449               ; 03:63C9
    ld   a,[$C25E]                  ; 03:63CC
    and  $30                        ; 03:63CF
    jr   nz,Code0363E3              ; 03:63D1
    ld   a,[$C1C6]                  ; 03:63D3
    cp   $03                        ; 03:63D6
    jr   nz,Code0363E3              ; 03:63D8
    ld   a,[$C20A]                  ; 03:63DA
    bit  5,a                        ; 03:63DD
    jr   z,Code0363FC               ; 03:63DF
    jr   Code0363EE                 ; 03:63E1
Code0363E3:
    ld   a,[$C25E]                  ; 03:63E3
    ld   [$C20A],a                  ; 03:63E6
    bit  5,a                        ; 03:63E9
    jp   z,Code0363FC               ; 03:63EB
Code0363EE:
    ldh  a,[<$FFAB]                 ; 03:63EE
    bit  7,a                        ; 03:63F0
    jp   z,Code03640F               ; 03:63F2
    xor  a                          ; 03:63F5
    ld   [$C207],a                  ; 03:63F6
    jp   Code036449                 ; 03:63F9
Code0363FC:
    bit  4,a                        ; 03:63FC
    jp   z,Code036449               ; 03:63FE
    ldh  a,[<$FFAB]                 ; 03:6401
    bit  7,a                        ; 03:6403
    jp   nz,Code03640F              ; 03:6405
    xor  a                          ; 03:6408
    ld   [$C207],a                  ; 03:6409
    jp   Code036449                 ; 03:640C
Code03640F:
    ldh  a,[<H_PlInitY_SubLvType]   ; 03:640F
    and  $0F                        ; 03:6411
    cp   $02                        ; 03:6413
    jr   z,Code036438               ; 03:6415
    ld   a,[$C1C6]                  ; 03:6417
    cp   $03                        ; 03:641A
    jr   nz,Code036427              ; 03:641C
    ld   hl,$C208                   ; 03:641E
    inc  [hl]                       ; 03:6421
    ld   a,[hl]                     ; 03:6422
    cp   $05                        ; 03:6423
    jr   c,Code036438               ; 03:6425
Code036427:
    xor  a                          ; 03:6427
    ld   [$C208],a                  ; 03:6428
    ld   l,$74                      ; 03:642B
    ld   a,[$C1C5]                  ; 03:642D
    and  a                          ; 03:6430
    jr   z,Code036435               ; 03:6431
    ld   l,$75                      ; 03:6433
Code036435:
    ld   a,l                        ; 03:6435
    ldh  [<$FFF2],a                 ; 03:6436
Code036438:
    ld   a,$03                      ; 03:6438
    ld   [$C1C2],a                  ; 03:643A
    ld   [$C1C6],a                  ; 03:643D
    ld   [$C207],a                  ; 03:6440
    xor  a                          ; 03:6443
    ld   [$C1FF],a                  ; 03:6444
    scf                             ; 03:6447
    ret                             ; 03:6448

Code036449:
    scf                             ; 03:6449
    ccf                             ; 03:644A
    ret                             ; 03:644B

Sub03644C:
    ldh  a,[<H_PlInitY_SubLvType]   ; 03:644C
    and  $0F                        ; 03:644E
    cp   $02                        ; 03:6450
    jr   nz,Code036462              ; 03:6452
    ldh  a,[<$FFA9]                 ; 03:6454
    cp   $2C                        ; 03:6456
    jr   nc,Code036462              ; 03:6458
    ld   a,$2C                      ; 03:645A
    ldh  [<$FFA9],a                 ; 03:645C
    ld   a,$10                      ; 03:645E
    ldh  [<$FFAC],a                 ; 03:6460
Code036462:
    ldh  a,[<$FFA8]                 ; 03:6462
    cp   $FF                        ; 03:6464
    jr   nz,Code03646F              ; 03:6466
    xor  a                          ; 03:6468
    ldh  [<$FFA7],a                 ; 03:6469
    ldh  [<$FFA8],a                 ; 03:646B
    jr   Code0364AF                 ; 03:646D
Code03646F:
    ld   a,[$C1ED]                  ; 03:646F
    sub  $60                        ; 03:6472
    ldh  [<$FF97],a                 ; 03:6474
    ld   a,[$C1EE]                  ; 03:6476
    sbc  $00                        ; 03:6479
    ldh  [<$FF98],a                 ; 03:647B
    ld   hl,$FF97                   ; 03:647D
    ldh  a,[<$FFA7]                 ; 03:6480
    sub  [hl]                       ; 03:6482
    ld   hl,$FF98                   ; 03:6483
    ldh  a,[<$FFA8]                 ; 03:6486
    sbc  [hl]                       ; 03:6488
    bit  7,a                        ; 03:6489
    jr   z,Code036497               ; 03:648B
    ldh  a,[<$FF97]                 ; 03:648D
    ldh  [<$FFA7],a                 ; 03:648F
    ldh  a,[<$FF98]                 ; 03:6491
    ldh  [<$FFA8],a                 ; 03:6493
    jr   Code0364AF                 ; 03:6495
Code036497:
    ld   hl,$FFA8                   ; 03:6497
    ld   a,[$C161]                  ; 03:649A
    dec  a                          ; 03:649D
    ld   c,a                        ; 03:649E
    cp   [hl]                       ; 03:649F
    jr   nz,Code0364AF              ; 03:64A0
    ldh  a,[<$FFA7]                 ; 03:64A2
    cp   $F0                        ; 03:64A4
    jr   c,Code0364AF               ; 03:64A6
    ld   a,$F0                      ; 03:64A8
    ldh  [<$FFA7],a                 ; 03:64AA
    ld   a,c                        ; 03:64AC
    ldh  [<$FFA8],a                 ; 03:64AD
Code0364AF:
    call Sub0360ED                  ; 03:64AF
    ret  nc                         ; 03:64B2
    ld   a,[$C161]                  ; 03:64B3
    dec  a                          ; 03:64B6
    dec  a                          ; 03:64B7
    ld   c,a                        ; 03:64B8
    cp   [hl]                       ; 03:64B9
    ret  nz                         ; 03:64BA
    ld   a,[W_SublevelID]           ; 03:64BB
    cp   $41                        ; 03:64BE
    jr   z,Code0364C6               ; 03:64C0
    ld   a,$08                      ; 03:64C2
    jr   Code0364D4                 ; 03:64C4
Code0364C6:
    ld   a,$09                      ; 03:64C6
    jr   Code0364D4                 ; 03:64C8
@Unused0364CA:
    srl  a                          ; 03:64CA
    srl  a                          ; 03:64CC
    cp   $0E                        ; 03:64CE
    jr   nz,Code0364D4              ; 03:64D0
    srl  a                          ; 03:64D2
Code0364D4:
    ld   e,a                        ; 03:64D4
    ld   d,$00                      ; 03:64D5
    ld   hl,Data035A27              ; 03:64D7
    add  hl,de                      ; 03:64DA
    ld   a,[hl]                     ; 03:64DB
    add  $90                        ; 03:64DC
    ld   hl,$FFA7                   ; 03:64DE
    cp   [hl]                       ; 03:64E1
    ret  nc                         ; 03:64E2
    ldh  [<$FFA7],a                 ; 03:64E3
    ret                             ; 03:64E5

Data0364E6:                         ; 03:64E6
.db $03,$0C,$02,$0D,$08
Data0364EB:                         ; 03:64EB
.db $20,$20,$18,$18,$14
Data0364F0:                         ; 03:64F0
.db $03,$0C,$02,$0D,$08,$02,$0D
Data0364F7:                         ; 03:64F7
.db $20,$20,$0E,$0E,$08,$18,$18
Data0364FE:                         ; 03:64FE
.db $01,$02,$04,$08,$10,$20,$40
DataPtrs036505:                     ; 03:6505
.dw Data0364E6, Data0364F0
DataPtrs036509:                     ; 03:6509
.dw Data0364EB, Data0364F7
Data03650D:                         ; 03:650D
.db $05,$07

Sub03650F:
    call Sub036516                  ; 03:650F
    call Sub03644C                  ; 03:6512
    ret                             ; 03:6515

Sub036516:
    xor  a                          ; 03:6516
    ld   [$C20F],a                  ; 03:6517
    ld   [$C210],a                  ; 03:651A
    ld   [$C211],a                  ; 03:651D
    ld   [$C212],a                  ; 03:6520
    ld   [$C213],a                  ; 03:6523
    ld   [$C214],a                  ; 03:6526
    ld   [$C215],a                  ; 03:6529
    ld   [$C216],a                  ; 03:652C
    ld   [$C217],a                  ; 03:652F
    ld   [$C218],a                  ; 03:6532
    ld   [$C219],a                  ; 03:6535
    ld   [$C21A],a                  ; 03:6538
    ld   [$C21B],a                  ; 03:653B
    ld   [$C21C],a                  ; 03:653E
    ld   [$C21D],a                  ; 03:6541
    ld   [$C21E],a                  ; 03:6544
    ld   [$C21F],a                  ; 03:6547
    ld   [$C220],a                  ; 03:654A
    ld   d,$00                      ; 03:654D
    ld   a,[$C1C2]                  ; 03:654F
    cp   $0B                        ; 03:6552
    jr   nz,Code036559              ; 03:6554
    xor  a                          ; 03:6556
    jr   Code03655C                 ; 03:6557
Code036559:
    ld   a,[$C1C5]                  ; 03:6559
Code03655C:
    push af                         ; 03:655C
    ld   e,a                        ; 03:655D
    ld   hl,Data03650D              ; 03:655E
    add  hl,de                      ; 03:6561
    ld   a,[hl]                     ; 03:6562
    ld   [$C23D],a                  ; 03:6563
    pop  af                         ; 03:6566
    sla  a                          ; 03:6567
    ld   e,a                        ; 03:6569
    ld   hl,DataPtrs036505          ; 03:656A
    add  hl,de                      ; 03:656D
    ldi  a,[hl]                     ; 03:656E
    ld   [$C239],a                  ; 03:656F
    ld   a,[hl]                     ; 03:6572
    ld   [$C23A],a                  ; 03:6573
    ld   hl,DataPtrs036509          ; 03:6576
    add  hl,de                      ; 03:6579
    ldi  a,[hl]                     ; 03:657A
    ld   [$C23B],a                  ; 03:657B
    ld   a,[hl]                     ; 03:657E
    ld   [$C23C],a                  ; 03:657F
    ld   de,$0000                   ; 03:6582
Code036585:
    ld   a,[$C239]                  ; 03:6585
    ld   l,a                        ; 03:6588
    ld   a,[$C23A]                  ; 03:6589
    ld   h,a                        ; 03:658C
    add  hl,de                      ; 03:658D
    ld   a,[hl]                     ; 03:658E
    ld   hl,$FFA7                   ; 03:658F
    add  [hl]                       ; 03:6592
    ldh  [<$FF97],a                 ; 03:6593
    ldh  a,[<$FFA8]                 ; 03:6595
    adc  $00                        ; 03:6597
    ldh  [<$FF98],a                 ; 03:6599
    ld   hl,$C229                   ; 03:659B
    add  hl,de                      ; 03:659E
    ld   [hl],a                     ; 03:659F
    ldh  a,[<$FF97]                 ; 03:65A0
    ld   hl,$C221                   ; 03:65A2
    add  hl,de                      ; 03:65A5
    ld   [hl],a                     ; 03:65A6
    and  $F0                        ; 03:65A7
    ldh  [<$FF97],a                 ; 03:65A9
    ld   a,[$C23B]                  ; 03:65AB
    ld   l,a                        ; 03:65AE
    ld   a,[$C23C]                  ; 03:65AF
    ld   h,a                        ; 03:65B2
    add  hl,de                      ; 03:65B3
    ldh  a,[<$FFA9]                 ; 03:65B4
    add  [hl]                       ; 03:65B6
    ldh  [<$FF99],a                 ; 03:65B7
    ldh  a,[<$FFAA]                 ; 03:65B9
    adc  $00                        ; 03:65BB
    and  a                          ; 03:65BD
    jr   nz,Code0365D7              ; 03:65BE
    ld   hl,$C231                   ; 03:65C0
    add  hl,de                      ; 03:65C3
    ldh  a,[<$FF99]                 ; 03:65C4
    ld   [hl],a                     ; 03:65C6
    and  $F0                        ; 03:65C7
    ldh  [<$FF99],a                 ; 03:65C9
    ld   hl,Data0364FE              ; 03:65CB
    add  hl,de                      ; 03:65CE
    ld   a,[hl]                     ; 03:65CF
    ldh  [<$FF9B],a                 ; 03:65D0
    push de                         ; 03:65D2
    call Sub036E16                  ; 03:65D3
    pop  de                         ; 03:65D6
Code0365D7:
    ld   hl,$C23D                   ; 03:65D7
    inc  e                          ; 03:65DA
    ld   a,e                        ; 03:65DB
    cp   [hl]                       ; 03:65DC
    jp   nz,Code036585              ; 03:65DD
    ld   a,[$C21C]                  ; 03:65E0
    and  a                          ; 03:65E3
    jr   z,Code036632               ; 03:65E4
    ld   a,[$C1D5]                  ; 03:65E6
    and  a                          ; 03:65E9
    jr   nz,Code036632              ; 03:65EA
    ld   a,[$C1DA]                  ; 03:65EC
    ld   l,a                        ; 03:65EF
    ld   a,[$C1DB]                  ; 03:65F0
    or   l                          ; 03:65F3
    and  a                          ; 03:65F4
    jr   nz,Code0365FF              ; 03:65F5
    ld   a,$03                      ; 03:65F7
    rst  $10                        ; 03:65F9
.dl SubL_0B407C                     ; 03:65FA
    jr   Code036632                 ; 03:65FD
Code0365FF:
    call Sub034328                  ; 03:65FF
    ld   a,$A0                      ; 03:6602
    ld   [$C1D5],a                  ; 03:6604
    ld   a,[$C366]                  ; 03:6607
    xor  $01                        ; 03:660A
    swap a                          ; 03:660C
    sla  a                          ; 03:660E
    sla  a                          ; 03:6610
    sla  a                          ; 03:6612
    ld   e,a                        ; 03:6614
    ld   d,$00                      ; 03:6615
    ld   hl,$C509                   ; 03:6617
    add  hl,de                      ; 03:661A
    ld   a,[hl]                     ; 03:661B
    cp   $05                        ; 03:661C
    jr   z,Code036632               ; 03:661E
    cp   $0A                        ; 03:6620
    jr   z,Code036632               ; 03:6622
    cp   $11                        ; 03:6624
    jr   z,Code036632               ; 03:6626
    cp   $04                        ; 03:6628
    jr   z,Code036632               ; 03:662A
    ld   a,[$C36F]                  ; 03:662C
    ld   [$DE68],a                  ; 03:662F
Code036632:
    ld   a,[$C213]                  ; 03:6632
    and  $0C                        ; 03:6635
    jr   z,Code03667A               ; 03:6637
    ld   a,[W_PlayerState]          ; 03:6639
    cp   $01                        ; 03:663C
    jr   z,Code03667A               ; 03:663E
    ld   a,[$C20F]                  ; 03:6640
    and  $03                        ; 03:6643
    jr   z,Code03667A               ; 03:6645
    ld   a,[$C1D8]                  ; 03:6647
    and  a                          ; 03:664A
    jr   z,Code03667A               ; 03:664B
    ld   a,[$C25E]                  ; 03:664D
    and  $10                        ; 03:6650
    jr   z,Code03667A               ; 03:6652
    ld   a,$08                      ; 03:6654
    ld   [W_PlayerState],a          ; 03:6656
    xor  a                          ; 03:6659
    ld   [$C1D3],a                  ; 03:665A
    ld   [$C181],a                  ; 03:665D
    ldh  a,[<$FFA7]                 ; 03:6660
    add  $10                        ; 03:6662
    ld   [$C1E1],a                  ; 03:6664
    ldh  a,[<$FFA8]                 ; 03:6667
    adc  $00                        ; 03:6669
    ld   [$C1E2],a                  ; 03:666B
    ld   a,$25                      ; 03:666E
    ldh  [<$FFF3],a                 ; 03:6670
    ld   de,$0018                   ; 03:6672
    ld   a,$01                      ; 03:6675
    call Return0010B2               ; 03:6677
Code03667A:
    xor  a                          ; 03:667A
    ld   [$C1E0],a                  ; 03:667B
    xor  a                          ; 03:667E
    ld   [$C1D8],a                  ; 03:667F
    ld   a,[$C26B]                  ; 03:6682
    and  a                          ; 03:6685
    jp   nz,Code036833              ; 03:6686
    ld   a,[$C20F]                  ; 03:6689
    and  $03                        ; 03:668C
    jr   nz,Code03669F              ; 03:668E
    ld   a,[$C1C2]                  ; 03:6690
    and  a                          ; 03:6693
    jp   nz,Code036833              ; 03:6694
    ld   a,$02                      ; 03:6697
    ld   [$C1C2],a                  ; 03:6699
    jp   Code036833                 ; 03:669C
Code03669F:
    xor  a                          ; 03:669F
    ld   [$C1DE],a                  ; 03:66A0
    ldh  a,[<$FFAC]                 ; 03:66A3
    bit  7,a                        ; 03:66A5
    jp   nz,Code036833              ; 03:66A7
    ld   a,[$C20F]                  ; 03:66AA
    and  $03                        ; 03:66AD
    cp   $03                        ; 03:66AF
    jr   z,Code0366C7               ; 03:66B1
    ld   a,[$C20F]                  ; 03:66B3
    and  $6C                        ; 03:66B6
    jr   z,Code0366C7               ; 03:66B8
    call Sub036AC3                  ; 03:66BA
    ld   a,[$C231]                  ; 03:66BD
    and  $0F                        ; 03:66C0
    cp   $06                        ; 03:66C2
    jp   nc,Code036833              ; 03:66C4
Code0366C7:
    ld   hl,$FFA9                   ; 03:66C7
    ld   a,[$C231]                  ; 03:66CA
    and  $0F                        ; 03:66CD
    xor  $FF                        ; 03:66CF
    inc  a                          ; 03:66D1
    add  [hl]                       ; 03:66D2
    ld   [hl],a                     ; 03:66D3
    ld   a,$01                      ; 03:66D4
    ld   [$C1D8],a                  ; 03:66D6
    ld   a,[$C217]                  ; 03:66D9
    and  $01                        ; 03:66DC
    jr   z,Code036713               ; 03:66DE
    ld   a,[$C218]                  ; 03:66E0
    and  $02                        ; 03:66E3
    jr   z,Code036713               ; 03:66E5
    ld   a,[$C25E]                  ; 03:66E7
    and  $80                        ; 03:66EA
    jr   z,Code036713               ; 03:66EC
    ldh  a,[<$FFA9]                 ; 03:66EE
    add  $20                        ; 03:66F0
    ld   [$C1E1],a                  ; 03:66F2
    ld   a,$0B                      ; 03:66F5
    ld   [W_PlayerState],a          ; 03:66F7
    xor  a                          ; 03:66FA
    ld   [$C1D3],a                  ; 03:66FB
    ld   [$C181],a                  ; 03:66FE
    ld   [$C25E],a                  ; 03:6701
    ldh  [<$FFAB],a                 ; 03:6704
    ld   a,$25                      ; 03:6706
    ldh  [<$FFF3],a                 ; 03:6708
    ld   de,$0018                   ; 03:670A
    ld   a,$01                      ; 03:670D
    call Return0010B2               ; 03:670F
    ret                             ; 03:6712

Code036713:
    xor  a                          ; 03:6713
    ld   [$C25E],a                  ; 03:6714
    ld   a,[$C214]                  ; 03:6717
    and  $03                        ; 03:671A
    jp   z,Code0367A6               ; 03:671C
    ld   a,[W_PlayerState]          ; 03:671F
    cp   $0A                        ; 03:6722
    jp   z,Code0367A6               ; 03:6724
    ld   a,[W_GameMode]             ; 03:6727
    cp   $07                        ; 03:672A
    jr   z,Code03673F               ; 03:672C
    cp   $02                        ; 03:672E
    jr   nz,Code03674E              ; 03:6730
    ld   a,$03                      ; 03:6732
    rst  $10                        ; 03:6734
.dl SubL_0B5328                     ; 03:6735
    ldh  a,[<$FFA6]                 ; 03:6738
    and  a                          ; 03:673A
    jr   z,Code03674E               ; 03:673B
    jr   Code0367A6                 ; 03:673D
Code03673F:
    ld   a,$01                      ; 03:673F
    ld   [$C36A],a                  ; 03:6741
    inc  a                          ; 03:6744
    ld   [W_SpriteSubstate],a       ; 03:6745
    ld   a,$03                      ; 03:6748
    rst  $10                        ; 03:674A
.dl SubL_075D06                     ; 03:674B
Code03674E:
    ld   a,$0A                      ; 03:674E
    ld   [W_PlayerState],a          ; 03:6750
    xor  a                          ; 03:6753
    ld   [$C1D3],a                  ; 03:6754
    ld   [$C181],a                  ; 03:6757
    ld   [$C1DD],a                  ; 03:675A
    ldh  [<$FFAB],a                 ; 03:675D
    ldh  [<$FFAD],a                 ; 03:675F
    ld   [$C1FD],a                  ; 03:6761
    inc  a                          ; 03:6764
    ld   [$C1F3],a                  ; 03:6765
    ld   de,$0001                   ; 03:6768
    ld   hl,$C229                   ; 03:676B
    add  hl,de                      ; 03:676E
    push hl                         ; 03:676F
    ld   hl,$C221                   ; 03:6770
    add  hl,de                      ; 03:6773
    ld   a,[hl]                     ; 03:6774
    ldh  [<$FF97],a                 ; 03:6775
    sub  $10                        ; 03:6777
    ld   [$C265],a                  ; 03:6779
    pop  hl                         ; 03:677C
    ld   a,[hl]                     ; 03:677D
    sbc  $00                        ; 03:677E
    ld   [$C266],a                  ; 03:6780
    ld   hl,$C231                   ; 03:6783
    add  hl,de                      ; 03:6786
    ld   a,[hl]                     ; 03:6787
    ldh  [<$FF98],a                 ; 03:6788
    add  $20                        ; 03:678A
    ld   [$C267],a                  ; 03:678C
    call Sub036CA0                  ; 03:678F
    jr   c,Code03679C               ; 03:6792
    ld   de,$0003                   ; 03:6794
    ld   a,$03                      ; 03:6797
    call Sub001124                  ; 03:6799
Code03679C:
    ld   de,$0002                   ; 03:679C
    ld   a,$03                      ; 03:679F
    ldh  [<$FFA6],a                 ; 03:67A1
    call Sub036CF9                  ; 03:67A3
Code0367A6:
    ld   a,[W_PlayerState]          ; 03:67A6
    cp   $01                        ; 03:67A9
    jr   z,Code0367B5               ; 03:67AB
    xor  a                          ; 03:67AD
    ldh  [<$FFAC],a                 ; 03:67AE
    ldh  [<$FFAE],a                 ; 03:67B0
    ld   [$C200],a                  ; 03:67B2
Code0367B5:
    ld   a,[$C21F]                  ; 03:67B5
    and  $03                        ; 03:67B8
    jr   z,Code036811               ; 03:67BA
    ld   de,$0000                   ; 03:67BC
    bit  0,a                        ; 03:67BF
    jr   nz,Code0367C4              ; 03:67C1
    inc  de                         ; 03:67C3
Code0367C4:
    ld   bc,$0003                   ; 03:67C4
    push de                         ; 03:67C7
    call Sub036CC2                  ; 03:67C8
    pop  de                         ; 03:67CB
    push de                         ; 03:67CC
    sla  e                          ; 03:67CD
    ld   a,$03                      ; 03:67CF
    ldh  [<$FFA6],a                 ; 03:67D1
    call Sub036CF9                  ; 03:67D3
    pop  de                         ; 03:67D6
    ld   a,l                        ; 03:67D7
    ldh  [<$FF9D],a                 ; 03:67D8
    ld   a,h                        ; 03:67DA
    ldh  [<$FF9E],a                 ; 03:67DB
    ld   a,c                        ; 03:67DD
    ldh  [<$FF9F],a                 ; 03:67DE
    ld   hl,$C221                   ; 03:67E0
    add  hl,de                      ; 03:67E3
    ld   a,[hl]                     ; 03:67E4
    and  $F0                        ; 03:67E5
    ldh  [<$FF97],a                 ; 03:67E7
    ld   hl,$C229                   ; 03:67E9
    add  hl,de                      ; 03:67EC
    ld   a,[hl]                     ; 03:67ED
    ldh  [<$FF98],a                 ; 03:67EE
    ld   hl,$C231                   ; 03:67F0
    add  hl,de                      ; 03:67F3
    ld   a,[hl]                     ; 03:67F4
    and  $F0                        ; 03:67F5
    ldh  [<$FF99],a                 ; 03:67F7
    ld   hl,$C23E                   ; 03:67F9
    add  hl,de                      ; 03:67FC
    ld   a,[hl]                     ; 03:67FD
    ldh  [<$FF9B],a                 ; 03:67FE
    ld   a,$03                      ; 03:6800
    rst  $10                        ; 03:6802
.dl SubL_074412                     ; 03:6803
    xor  a                          ; 03:6806
    ld   [$C1D8],a                  ; 03:6807
    ldh  [<$FFAC],a                 ; 03:680A
    ldh  [<$FFAE],a                 ; 03:680C
    ld   [$C200],a                  ; 03:680E
Code036811:
    ld   a,[$C220]                  ; 03:6811
    and  $03                        ; 03:6814
    jr   z,Code036833               ; 03:6816
    ld   de,$0000                   ; 03:6818
    bit  0,a                        ; 03:681B
    jr   nz,Code036821              ; 03:681D
    inc  e                          ; 03:681F
    inc  e                          ; 03:6820
Code036821:
    ld   a,$03                      ; 03:6821
    ldh  [<$FFA6],a                 ; 03:6823
    call Sub036CF9                  ; 03:6825
    ldh  a,[<$FFAB]                 ; 03:6828
    ld   [$C1F0],a                  ; 03:682A
    ld   a,$03                      ; 03:682D
    rst  $10                        ; 03:682F
.dl SubL_085BFB                     ; 03:6830
Code036833:
    ld   a,[$C20F]                  ; 03:6833
    and  $6C                        ; 03:6836
    jr   z,Code036894               ; 03:6838
    call Sub036AA0                  ; 03:683A
    jr   c,Code036894               ; 03:683D
    ldh  a,[<$FFAB]                 ; 03:683F
    and  a                          ; 03:6841
    jr   nz,Code03684B              ; 03:6842
    ld   a,[$C20F]                  ; 03:6844
    and  $6C                        ; 03:6847
    jr   Code036861                 ; 03:6849
Code03684B:
    ldh  a,[<$FFAB]                 ; 03:684B
    bit  7,a                        ; 03:684D
    jr   z,Code03685A               ; 03:684F
    ld   a,[$C20F]                  ; 03:6851
    and  $24                        ; 03:6854
    jr   z,Code036894               ; 03:6856
    jr   Code036861                 ; 03:6858
Code03685A:
    ld   a,[$C20F]                  ; 03:685A
    and  $48                        ; 03:685D
    jr   z,Code036894               ; 03:685F
Code036861:
    call Sub036AC3                  ; 03:6861
    ld   a,b                        ; 03:6864
    and  a                          ; 03:6865
    jp   nz,Return036A4E            ; 03:6866
    ld   a,[W_PlayerState]          ; 03:6869
    cp   $01                        ; 03:686C
    jr   nz,Code036897              ; 03:686E
    ld   a,[$C25E]                  ; 03:6870
    and  $30                        ; 03:6873
    jr   z,Code036897               ; 03:6875
    ld   e,$20                      ; 03:6877
    ld   a,[$C1F0]                  ; 03:6879
    bit  7,a                        ; 03:687C
    jr   nz,Code036882              ; 03:687E
    ld   e,$10                      ; 03:6880
Code036882:
    ld   a,[$C25E]                  ; 03:6882
    and  $30                        ; 03:6885
    cp   e                          ; 03:6887
    jr   z,Code036897               ; 03:6888
    ld   a,[$C1F0]                  ; 03:688A
    cpl                             ; 03:688D
    inc  a                          ; 03:688E
    ld   [$C1F0],a                  ; 03:688F
    jr   Code036897                 ; 03:6892
Code036894:
    call Sub036A4F                  ; 03:6894
Code036897:
    ldh  a,[<$FFAC]                 ; 03:6897
    bit  7,a                        ; 03:6899
    jp   z,Code0369E6               ; 03:689B
    ld   a,[$C215]                  ; 03:689E
    and  $10                        ; 03:68A1
    jr   z,Code0368AC               ; 03:68A3
    ld   a,[$C215]                  ; 03:68A5
    and  $6C                        ; 03:68A8
    jr   z,Code0368BC               ; 03:68AA
Code0368AC:
    ld   a,[$C20F]                  ; 03:68AC
    and  $10                        ; 03:68AF
    jp   z,Code0369E6               ; 03:68B1
    ld   a,[$C211]                  ; 03:68B4
    and  $10                        ; 03:68B7
    jp   nz,Code0369E6              ; 03:68B9
Code0368BC:
    xor  a                          ; 03:68BC
    ldh  [<$FFAE],a                 ; 03:68BD
    ld   [$C200],a                  ; 03:68BF
    ld   [$C1C7],a                  ; 03:68C2
    ld   a,$18                      ; 03:68C5
    ldh  [<$FFAC],a                 ; 03:68C7
    ld   de,$0010                   ; 03:68C9
    ld   a,$03                      ; 03:68CC
    call Return0010B2               ; 03:68CE
    ld   de,$0004                   ; 03:68D1
    ld   hl,$C231                   ; 03:68D4
    add  hl,de                      ; 03:68D7
    ld   a,[hl]                     ; 03:68D8
    and  $0F                        ; 03:68D9
    sub  $10                        ; 03:68DB
    xor  $FF                        ; 03:68DD
    inc  a                          ; 03:68DF
    ld   hl,$FFA9                   ; 03:68E0
    add  [hl]                       ; 03:68E3
    ld   [hl],a                     ; 03:68E4
    ld   a,[$C21E]                  ; 03:68E5
    and  $10                        ; 03:68E8
    jp   nz,Code0369DD              ; 03:68EA
    ld   a,[$C21B]                  ; 03:68ED
    and  $10                        ; 03:68F0
    jp   nz,Code0369C5              ; 03:68F2
    ld   a,[$C215]                  ; 03:68F5
    and  $10                        ; 03:68F8
    jr   nz,Code036912              ; 03:68FA
    ld   a,[$C210]                  ; 03:68FC
    and  $10                        ; 03:68FF
    jr   nz,Code036912              ; 03:6901
    ld   a,[$C21C]                  ; 03:6903
    and  $10                        ; 03:6906
    jp   nz,Code0369E6              ; 03:6908
    ld   a,$43                      ; 03:690B
    ldh  [<$FFF2],a                 ; 03:690D
    jp   Code0369E6                 ; 03:690F
Code036912:
    ld   a,$43                      ; 03:6912
    ldh  [<$FFF2],a                 ; 03:6914
    ld   bc,$0003                   ; 03:6916
    ld   de,$0004                   ; 03:6919
    push de                         ; 03:691C
    call Sub036CC2                  ; 03:691D
    pop  de                         ; 03:6920
    sla  e                          ; 03:6921
    ld   a,$02                      ; 03:6923
    ldh  [<$FFA6],a                 ; 03:6925
    call Sub036CF9                  ; 03:6927
    ld   a,l                        ; 03:692A
    ldh  [<$FF9D],a                 ; 03:692B
    ld   a,h                        ; 03:692D
    ldh  [<$FF9E],a                 ; 03:692E
    ld   a,c                        ; 03:6930
    ldh  [<$FF9F],a                 ; 03:6931
    ld   de,$0004                   ; 03:6933
    ld   hl,$C221                   ; 03:6936
    add  hl,de                      ; 03:6939
    ld   a,[hl]                     ; 03:693A
    and  $F0                        ; 03:693B
    ldh  [<$FF97],a                 ; 03:693D
    ld   hl,$C229                   ; 03:693F
    add  hl,de                      ; 03:6942
    ld   a,[hl]                     ; 03:6943
    ldh  [<$FF98],a                 ; 03:6944
    ld   hl,$C231                   ; 03:6946
    add  hl,de                      ; 03:6949
    ld   a,[hl]                     ; 03:694A
    and  $F0                        ; 03:694B
    ldh  [<$FF99],a                 ; 03:694D
    ld   hl,$C23E                   ; 03:694F
    add  hl,de                      ; 03:6952
    ld   a,[hl]                     ; 03:6953
    ldh  [<$FF9B],a                 ; 03:6954
    ld   a,[$C21D]                  ; 03:6956
    and  $10                        ; 03:6959
    jr   nz,Code0369D5              ; 03:695B
    ld   a,[$C216]                  ; 03:695D
    and  $10                        ; 03:6960
    jr   nz,Code036977              ; 03:6962
    ldh  a,[<$FF9B]                 ; 03:6964
    cp   $3F                        ; 03:6966
    jr   nz,Code03696F              ; 03:6968
    ld   a,$01                      ; 03:696A
    ld   [$C1B3],a                  ; 03:696C
Code03696F:
    ld   a,$03                      ; 03:696F
    rst  $10                        ; 03:6971
.dl SubL_02442B                     ; 03:6972
    jr   Code0369B7                 ; 03:6975
Code036977:
    call Sub036B90                  ; 03:6977
    ld   a,e                        ; 03:697A
    cp   $06                        ; 03:697B
    jr   z,Code0369B7               ; 03:697D
    xor  a                          ; 03:697F
    ld   [$D2E5],a                  ; 03:6980
    ld   a,[$C21A]                  ; 03:6983
    and  $10                        ; 03:6986
    jr   z,Code0369AA               ; 03:6988
    ld   a,$01                      ; 03:698A
    ld   [$D2E5],a                  ; 03:698C
    srl  e                          ; 03:698F
    ld   hl,$C278                   ; 03:6991
    add  hl,de                      ; 03:6994
    inc  [hl]                       ; 03:6995
    ld   a,[hl]                     ; 03:6996
    cp   $0A                        ; 03:6997
    jr   nz,Code0369AA              ; 03:6999
    ld   a,$01                      ; 03:699B
    ld   [$D2E4],a                  ; 03:699D
    ldh  [<$FFA3],a                 ; 03:69A0
    ld   a,$03                      ; 03:69A2
    rst  $10                        ; 03:69A4
.dl SubL_027560                     ; 03:69A5
    jr   Code0369B7                 ; 03:69A8
Code0369AA:
    xor  a                          ; 03:69AA
    ld   [$D2E4],a                  ; 03:69AB
    ld   a,$03                      ; 03:69AE
    rst  $10                        ; 03:69B0
.dl SubL_027560                     ; 03:69B1
    call Sub002D66                  ; 03:69B4
Code0369B7:
    ld   a,[$C1C5]                  ; 03:69B7
    and  a                          ; 03:69BA
    jr   nz,Code0369C1              ; 03:69BB
    ld   a,$02                      ; 03:69BD
    ldh  [<$FFAC],a                 ; 03:69BF
Code0369C1:
    call Sub036C06                  ; 03:69C1
    ret                             ; 03:69C4

Code0369C5:
    ld   a,$60                      ; 03:69C5
    ldh  [<$FFF2],a                 ; 03:69C7
    ld   a,$01                      ; 03:69C9
    ldh  [<$FF9B],a                 ; 03:69CB
    ld   a,$03                      ; 03:69CD
    rst  $10                        ; 03:69CF
.dl SubL_074022                     ; 03:69D0
    jr   Code0369B7                 ; 03:69D3
Code0369D5:
    ld   a,$03                      ; 03:69D5
    rst  $10                        ; 03:69D7
.dl SubL_027AAE                     ; 03:69D8
    jr   Code0369B7                 ; 03:69DB
Code0369DD:
    ld   a,$60                      ; 03:69DD
    ldh  [<$FFF2],a                 ; 03:69DF
    call Sub036B67                  ; 03:69E1
    jr   Code0369B7                 ; 03:69E4
Code0369E6:
    ld   a,[$C211]                  ; 03:69E6
    and  $10                        ; 03:69E9
    jr   z,Return036A4E             ; 03:69EB
    ldh  a,[<$FFAC]                 ; 03:69ED
    bit  7,a                        ; 03:69EF
    jr   z,Return036A4E             ; 03:69F1
    xor  a                          ; 03:69F3
    ldh  [<$FFAC],a                 ; 03:69F4
    ldh  [<$FFAE],a                 ; 03:69F6
    ld   [$C200],a                  ; 03:69F8
    ld   [$C1C7],a                  ; 03:69FB
    ld   de,$0010                   ; 03:69FE
    ld   a,$03                      ; 03:6A01
    call Return0010B2               ; 03:6A03
    ld   bc,$0003                   ; 03:6A06
    ld   de,$0004                   ; 03:6A09
    push de                         ; 03:6A0C
    call Sub036CC2                  ; 03:6A0D
    pop  de                         ; 03:6A10
    sla  e                          ; 03:6A11
    ld   a,$03                      ; 03:6A13
    ldh  [<$FFA6],a                 ; 03:6A15
    call Sub036CF9                  ; 03:6A17
    ld   de,$0004                   ; 03:6A1A
    ld   hl,$C221                   ; 03:6A1D
    add  hl,de                      ; 03:6A20
    ld   a,[hl]                     ; 03:6A21
    and  $F0                        ; 03:6A22
    ldh  [<$FF97],a                 ; 03:6A24
    ld   hl,$C229                   ; 03:6A26
    add  hl,de                      ; 03:6A29
    ld   a,[hl]                     ; 03:6A2A
    ldh  [<$FF98],a                 ; 03:6A2B
    ld   hl,$C231                   ; 03:6A2D
    add  hl,de                      ; 03:6A30
    ld   a,[hl]                     ; 03:6A31
    and  $F0                        ; 03:6A32
    ldh  [<$FF99],a                 ; 03:6A34
    ld   a,$03                      ; 03:6A36
    rst  $10                        ; 03:6A38
.dl SubL_025894                     ; 03:6A39
    call Sub036C06                  ; 03:6A3C
    ld   a,$41                      ; 03:6A3F
    ldh  [<$FFF4],a                 ; 03:6A41
    ld   a,$05                      ; 03:6A43
    ldh  [<$FF97],a                 ; 03:6A45
    xor  a                          ; 03:6A47
    ldh  [<$FF98],a                 ; 03:6A48
    call Sub002E30                  ; 03:6A4A
    ret                             ; 03:6A4D

Return036A4E:
    ret                             ; 03:6A4E

Sub036A4F:
    ld   a,[$C212]                  ; 03:6A4F
    and  $7C                        ; 03:6A52
    ret  z                          ; 03:6A54
    ld   de,$0002                   ; 03:6A55
    bit  2,a                        ; 03:6A58
    jr   nz,Code036A6C              ; 03:6A5A
    inc  e                          ; 03:6A5C
    bit  3,a                        ; 03:6A5D
    jr   nz,Code036A6C              ; 03:6A5F
    inc  e                          ; 03:6A61
    bit  4,a                        ; 03:6A62
    jr   nz,Code036A6C              ; 03:6A64
    inc  e                          ; 03:6A66
    bit  5,a                        ; 03:6A67
    jr   nz,Code036A6C              ; 03:6A69
    inc  e                          ; 03:6A6B
Code036A6C:
    push de                         ; 03:6A6C
    ld   bc,$0003                   ; 03:6A6D
    call Sub036CC2                  ; 03:6A70
    pop  de                         ; 03:6A73
    push de                         ; 03:6A74
    sla  e                          ; 03:6A75
    ld   a,$03                      ; 03:6A77
    ldh  [<$FFA6],a                 ; 03:6A79
    call Sub036CF9                  ; 03:6A7B
    pop  de                         ; 03:6A7E
    ld   a,[$C219]                  ; 03:6A7F
    and  $7C                        ; 03:6A82
    jr   nz,Code036A92              ; 03:6A84
    call Sub002D66                  ; 03:6A86
    ld   a,[$C3A5]                  ; 03:6A89
    inc  a                          ; 03:6A8C
    ld   [$C3A5],a                  ; 03:6A8D
    jr   Code036A95                 ; 03:6A90
Code036A92:
    call Sub002D9C                  ; 03:6A92
Code036A95:
    ld   a,$14                      ; 03:6A95
    ldh  [<$FF97],a                 ; 03:6A97
    xor  a                          ; 03:6A99
    ldh  [<$FF98],a                 ; 03:6A9A
    call Sub002E30                  ; 03:6A9C
    ret                             ; 03:6A9F

Sub036AA0:
    ld   a,[$C20F]                  ; 03:6AA0
    and  $0C                        ; 03:6AA3
    cp   $0C                        ; 03:6AA5
    jr   z,Code036AB2               ; 03:6AA7
    ld   a,[$C20F]                  ; 03:6AA9
    and  $60                        ; 03:6AAC
    cp   $60                        ; 03:6AAE
    jr   nz,Code036AC0              ; 03:6AB0
Code036AB2:
    ldh  a,[<$FFA7]                 ; 03:6AB2
    add  $01                        ; 03:6AB4
    ldh  [<$FFA7],a                 ; 03:6AB6
    ldh  a,[<$FFA8]                 ; 03:6AB8
    adc  $00                        ; 03:6ABA
    ldh  [<$FFA8],a                 ; 03:6ABC
    scf                             ; 03:6ABE
    ret                             ; 03:6ABF

Code036AC0:
    scf                             ; 03:6AC0
    ccf                             ; 03:6AC1
    ret                             ; 03:6AC2

Sub036AC3:
    ld   de,$0002                   ; 03:6AC3
    bit  2,a                        ; 03:6AC6
    jr   nz,Code036AD5              ; 03:6AC8
    inc  e                          ; 03:6ACA
    bit  3,a                        ; 03:6ACB
    jr   nz,Code036AD5              ; 03:6ACD
    dec  e                          ; 03:6ACF
    bit  5,a                        ; 03:6AD0
    jr   nz,Code036AD5              ; 03:6AD2
    inc  e                          ; 03:6AD4
Code036AD5:
    ld   hl,$C221                   ; 03:6AD5
    add  hl,de                      ; 03:6AD8
    ld   a,[hl]                     ; 03:6AD9
    and  $0F                        ; 03:6ADA
    ldh  [<$FF97],a                 ; 03:6ADC
    cpl                             ; 03:6ADE
    inc  a                          ; 03:6ADF
    ldh  [<$FF98],a                 ; 03:6AE0
    ld   hl,$FF97                   ; 03:6AE2
    ld   a,$10                      ; 03:6AE5
    sub  [hl]                       ; 03:6AE7
    ld   [hl],a                     ; 03:6AE8
    ld   a,[$C20F]                  ; 03:6AE9
    and  $6C                        ; 03:6AEC
    cp   $24                        ; 03:6AEE
    jr   z,Code036B36               ; 03:6AF0
    cp   $48                        ; 03:6AF2
    jr   z,Code036B36               ; 03:6AF4
    ld   a,[$C1D8]                  ; 03:6AF6
    and  a                          ; 03:6AF9
    jr   nz,Code036B36              ; 03:6AFA
    ldh  a,[<$FFAC]                 ; 03:6AFC
    bit  7,a                        ; 03:6AFE
    jr   z,Code036B36               ; 03:6B00
    ld   a,e                        ; 03:6B02
    sub  $02                        ; 03:6B03
    ld   c,a                        ; 03:6B05
    ld   b,$00                      ; 03:6B06
    add  hl,bc                      ; 03:6B08
    ld   a,[hl]                     ; 03:6B09
    bit  7,a                        ; 03:6B0A
    jr   z,Code036B10               ; 03:6B0C
    cpl                             ; 03:6B0E
    inc  a                          ; 03:6B0F
Code036B10:
    cp   $04                        ; 03:6B10
    jr   c,Code036B36               ; 03:6B12
    ld   a,[$C1CA]                  ; 03:6B14
    ldh  [<$FFA7],a                 ; 03:6B17
    ld   a,[$C1CB]                  ; 03:6B19
    ldh  [<$FFA8],a                 ; 03:6B1C
    ld   hl,$C231                   ; 03:6B1E
    add  hl,de                      ; 03:6B21
    ld   a,[hl]                     ; 03:6B22
    and  $0F                        ; 03:6B23
    sub  $10                        ; 03:6B25
    ldh  [<$FF98],a                 ; 03:6B27
    cpl                             ; 03:6B29
    inc  a                          ; 03:6B2A
    ldh  [<$FF97],a                 ; 03:6B2B
    ld   hl,$FFA9                   ; 03:6B2D
    add  [hl]                       ; 03:6B30
    ld   [hl],a                     ; 03:6B31
    ld   b,$01                      ; 03:6B32
    jr   Code036B4D                 ; 03:6B34
Code036B36:
    ldh  a,[<$FF97]                 ; 03:6B36
    cp   $03                        ; 03:6B38
    jr   c,Code036B44               ; 03:6B3A
    ld   a,$01                      ; 03:6B3C
    ldh  [<$FF97],a                 ; 03:6B3E
    ld   a,$FF                      ; 03:6B40
    ldh  [<$FF98],a                 ; 03:6B42
Code036B44:
    xor  a                          ; 03:6B44
    ldh  [<$FFAB],a                 ; 03:6B45
    ldh  [<$FFAD],a                 ; 03:6B47
    ld   [$C1FD],a                  ; 03:6B49
    ld   b,a                        ; 03:6B4C
Code036B4D:
    ld   c,$00                      ; 03:6B4D
    ld   a,e                        ; 03:6B4F
    sub  $02                        ; 03:6B50
    ld   e,a                        ; 03:6B52
    ld   hl,$FF97                   ; 03:6B53
    add  hl,de                      ; 03:6B56
    ld   a,[hl]                     ; 03:6B57
    bit  7,a                        ; 03:6B58
    jr   z,Code036B5D               ; 03:6B5A
    dec  c                          ; 03:6B5C
Code036B5D:
    ld   hl,$FFA7                   ; 03:6B5D
    add  [hl]                       ; 03:6B60
    ld   [hl],a                     ; 03:6B61
    inc  l                          ; 03:6B62
    ld   a,[hl]                     ; 03:6B63
    adc  c                          ; 03:6B64
    ld   [hl],a                     ; 03:6B65
    ret                             ; 03:6B66

Sub036B67:
    ld   a,[$C385]                  ; 03:6B67
    jr   Code036B81                 ; 03:6B6A
Code036B6C:
    ld   a,[$DA6A]                  ; 03:6B6C
    xor  $01                        ; 03:6B6F
    ld   e,a                        ; 03:6B71
    ld   d,$00                      ; 03:6B72
    ld   hl,Data0378F4              ; 03:6B74
    add  hl,de                      ; 03:6B77
    ld   e,[hl]                     ; 03:6B78
    ld   a,c                        ; 03:6B79
    ld   [$C385],a                  ; 03:6B7A
    call Sub03794C                  ; 03:6B7D
    ret                             ; 03:6B80

Code036B81:
    ld   c,$03                      ; 03:6B81
    ld   hl,$C384                   ; 03:6B83
    ld   [hl],$04                   ; 03:6B86
    cp   $06                        ; 03:6B88
    jr   c,Code036B6C               ; 03:6B8A
    ld   c,$09                      ; 03:6B8C
    jr   Code036B6C                 ; 03:6B8E

Sub036B90:
    xor  a                          ; 03:6B90
    ldh  [<$FFA3],a                 ; 03:6B91
    ld   de,$0000                   ; 03:6B93
Code036B96:
    ld   hl,$C272                   ; 03:6B96
    add  hl,de                      ; 03:6B99
    ld   b,[hl]                     ; 03:6B9A
    ld   hl,$C273                   ; 03:6B9B
    add  hl,de                      ; 03:6B9E
    ld   a,[hl]                     ; 03:6B9F
    or   b                          ; 03:6BA0
    and  a                          ; 03:6BA1
    jr   z,Code036BBF               ; 03:6BA2
    ldh  a,[<$FF9E]                 ; 03:6BA4
    cp   [hl]                       ; 03:6BA6
    jr   nz,Code036BD3              ; 03:6BA7
    ldh  a,[<$FF9D]                 ; 03:6BA9
    cp   b                          ; 03:6BAB
    jr   nz,Code036BD3              ; 03:6BAC
    ld   hl,$C26D                   ; 03:6BAE
    add  hl,de                      ; 03:6BB1
    ld   b,[hl]                     ; 03:6BB2
    ld   hl,$C26C                   ; 03:6BB3
    add  hl,de                      ; 03:6BB6
    ld   a,[hl]                     ; 03:6BB7
    or   b                          ; 03:6BB8
    ret  nz                         ; 03:6BB9
    ld   a,$01                      ; 03:6BBA
    ldh  [<$FFA3],a                 ; 03:6BBC
    ret                             ; 03:6BBE

Code036BBF:
    ldh  a,[<$FF9E]                 ; 03:6BBF
    ld   [hl],a                     ; 03:6BC1
    ldh  a,[<$FF9D]                 ; 03:6BC2
    ld   hl,$C272                   ; 03:6BC4
    add  hl,de                      ; 03:6BC7
    ld   [hl],a                     ; 03:6BC8
    ld   hl,$C26C                   ; 03:6BC9
    add  hl,de                      ; 03:6BCC
    ld   [hl],$EC                   ; 03:6BCD
    inc  hl                         ; 03:6BCF
    ld   [hl],$00                   ; 03:6BD0
    ret                             ; 03:6BD2

Code036BD3:
    inc  e                          ; 03:6BD3
    inc  e                          ; 03:6BD4
    ld   a,e                        ; 03:6BD5
    cp   $06                        ; 03:6BD6
    jr   nz,Code036B96              ; 03:6BD8
    ret                             ; 03:6BDA

Sub036BDB:
    ld   a,[W_GameMode]             ; 03:6BDB
    cp   $02                        ; 03:6BDE
    ret  z                          ; 03:6BE0
    ld   de,$0000                   ; 03:6BE1
Code036BE4:
    ld   hl,$C26C                   ; 03:6BE4
    add  hl,de                      ; 03:6BE7
    ld   b,[hl]                     ; 03:6BE8
    ld   hl,$C26D                   ; 03:6BE9
    add  hl,de                      ; 03:6BEC
    ld   a,[hl]                     ; 03:6BED
    or   b                          ; 03:6BEE
    jr   z,Code036BFE               ; 03:6BEF
    push hl                         ; 03:6BF1
    ld   hl,$C26C                   ; 03:6BF2
    add  hl,de                      ; 03:6BF5
    ld   a,[hl]                     ; 03:6BF6
    sub  $01                        ; 03:6BF7
    ld   [hl],a                     ; 03:6BF9
    pop  hl                         ; 03:6BFA
    jr   nc,Code036BFE              ; 03:6BFB
    dec  [hl]                       ; 03:6BFD
Code036BFE:
    inc  e                          ; 03:6BFE
    inc  e                          ; 03:6BFF
    ld   a,e                        ; 03:6C00
    cp   $06                        ; 03:6C01
    jr   nz,Code036BE4              ; 03:6C03
    ret                             ; 03:6C05

Sub036C06:
    ld   de,$0004                   ; 03:6C06
    ld   hl,$C229                   ; 03:6C09
    add  hl,de                      ; 03:6C0C
    ld   a,[hl]                     ; 03:6C0D
    ldh  [<$FF98],a                 ; 03:6C0E
    ld   hl,$C221                   ; 03:6C10
    add  hl,de                      ; 03:6C13
    ld   a,[hl]                     ; 03:6C14
    and  $F0                        ; 03:6C15
    ldh  [<$FF97],a                 ; 03:6C17
    ld   hl,$C231                   ; 03:6C19
    add  hl,de                      ; 03:6C1C
    ld   a,[hl]                     ; 03:6C1D
    and  $F0                        ; 03:6C1E
    sub  $10                        ; 03:6C20
    ldh  [<$FF99],a                 ; 03:6C22
    call Sub037001                  ; 03:6C24
    ld   e,$01                      ; 03:6C27
    cp   $56                        ; 03:6C29
    jr   z,Code036C32               ; 03:6C2B
    cp   $27                        ; 03:6C2D
    ret  nz                         ; 03:6C2F
    ld   e,$00                      ; 03:6C30
Code036C32:
    push af                         ; 03:6C32
    ld   a,e                        ; 03:6C33
    ldh  [<$FF9B],a                 ; 03:6C34
    ld   hl,$FFA0                   ; 03:6C36
    ldi  a,[hl]                     ; 03:6C39
    ld   e,a                        ; 03:6C3A
    ld   a,[hl]                     ; 03:6C3B
    ld   h,a                        ; 03:6C3C
    ld   l,e                        ; 03:6C3D
    ldh  a,[<$FFA6]                 ; 03:6C3E
    ldh  [<SVBK],a                  ; 03:6C40
    ld   [hl],$03                   ; 03:6C42
    ld   a,$00                      ; 03:6C44
    ldh  [<SVBK],a                  ; 03:6C46
    ldh  a,[<$FF99]                 ; 03:6C48
    add  $10                        ; 03:6C4A
    ldh  [<$FF99],a                 ; 03:6C4C
    ld   a,$03                      ; 03:6C4E
    rst  $10                        ; 03:6C50
.dl SubL_0247F3                     ; 03:6C51
    ld   de,$0004                   ; 03:6C54
    ld   hl,$C221                   ; 03:6C57
    add  hl,de                      ; 03:6C5A
    ld   a,[hl]                     ; 03:6C5B
    ldh  [<$FF97],a                 ; 03:6C5C
    ld   hl,$C229                   ; 03:6C5E
    add  hl,de                      ; 03:6C61
    ld   a,[hl]                     ; 03:6C62
    ldh  [<$FF9E],a                 ; 03:6C63
    ld   hl,$FFB8                   ; 03:6C65
    ldh  a,[<$FF97]                 ; 03:6C68
    sub  [hl]                       ; 03:6C6A
    ldh  [<$FF9D],a                 ; 03:6C6B
    ld   hl,$FFB9                   ; 03:6C6D
    ldh  a,[<$FF9E]                 ; 03:6C70
    sbc  [hl]                       ; 03:6C72
    ldh  [<$FF9E],a                 ; 03:6C73
    ldh  a,[<$FF9D]                 ; 03:6C75
    add  $28                        ; 03:6C77
    ldh  a,[<$FF9E]                 ; 03:6C79
    adc  $00                        ; 03:6C7B
    and  a                          ; 03:6C7D
    jr   z,Code036C82               ; 03:6C7E
    jr   Code036C91                 ; 03:6C80
Code036C82:
    ld   hl,$C231                   ; 03:6C82
    add  hl,de                      ; 03:6C85
    ld   a,[hl]                     ; 03:6C86
    sub  $10                        ; 03:6C87
    ldh  [<$FF98],a                 ; 03:6C89
    ld   bc,$0003                   ; 03:6C8B
    call Sub036CF1                  ; 03:6C8E
Code036C91:
    pop  af                         ; 03:6C91
    cp   $27                        ; 03:6C92
    jr   nz,Code036C9B              ; 03:6C94
    call Sub002D66                  ; 03:6C96
    jr   Return036C9F               ; 03:6C99
Code036C9B:
    call Sub002DA1                  ; 03:6C9B
    ret                             ; 03:6C9E

Return036C9F:
    ret                             ; 03:6C9F

Sub036CA0:
    ld   hl,$FFB8                   ; 03:6CA0
    ld   a,[$C265]                  ; 03:6CA3
    sub  [hl]                       ; 03:6CA6
    ldh  [<$FFA3],a                 ; 03:6CA7
    ld   hl,$FFB9                   ; 03:6CA9
    ld   a,[$C266]                  ; 03:6CAC
    sbc  [hl]                       ; 03:6CAF
    ldh  [<$FFA4],a                 ; 03:6CB0
    ldh  a,[<$FFA3]                 ; 03:6CB2
    add  $30                        ; 03:6CB4
    ldh  a,[<$FFA4]                 ; 03:6CB6
    adc  $00                        ; 03:6CB8
    and  a                          ; 03:6CBA
    jr   nz,Code036CC0              ; 03:6CBB
    scf                             ; 03:6CBD
    ccf                             ; 03:6CBE
    ret                             ; 03:6CBF

Code036CC0:
    scf                             ; 03:6CC0
    ret                             ; 03:6CC1

Sub036CC2:
    ld   hl,$C221                   ; 03:6CC2
    add  hl,de                      ; 03:6CC5
    ld   a,[hl]                     ; 03:6CC6
    ldh  [<$FF97],a                 ; 03:6CC7
    ld   hl,$C229                   ; 03:6CC9
    add  hl,de                      ; 03:6CCC
    ld   a,[hl]                     ; 03:6CCD
    ldh  [<$FF9E],a                 ; 03:6CCE
    ld   hl,$FFB8                   ; 03:6CD0
    ldh  a,[<$FF97]                 ; 03:6CD3
    sub  [hl]                       ; 03:6CD5
    ldh  [<$FF9D],a                 ; 03:6CD6
    ld   hl,$FFB9                   ; 03:6CD8
    ldh  a,[<$FF9E]                 ; 03:6CDB
    sbc  [hl]                       ; 03:6CDD
    ldh  [<$FF9E],a                 ; 03:6CDE
    ldh  a,[<$FF9D]                 ; 03:6CE0
    add  $30                        ; 03:6CE2
    ldh  a,[<$FF9E]                 ; 03:6CE4
    adc  $00                        ; 03:6CE6
    and  a                          ; 03:6CE8
    ret  nz                         ; 03:6CE9
    ld   hl,$C231                   ; 03:6CEA
    add  hl,de                      ; 03:6CED
    ld   a,[hl]                     ; 03:6CEE
    ldh  [<$FF98],a                 ; 03:6CEF

Sub036CF1:
    ld   d,b                        ; 03:6CF1
    ld   e,c                        ; 03:6CF2
    ld   a,$03                      ; 03:6CF3
    call Sub001124                  ; 03:6CF5
    ret                             ; 03:6CF8

Sub036CF9:
    push de                         ; 03:6CF9
    srl  e                          ; 03:6CFA
    ld   hl,$C256                   ; 03:6CFC
    add  hl,de                      ; 03:6CFF
    ld   a,[hl]                     ; 03:6D00
    ld   c,a                        ; 03:6D01
    pop  de                         ; 03:6D02
    ld   hl,$C246                   ; 03:6D03
    add  hl,de                      ; 03:6D06
    ldi  a,[hl]                     ; 03:6D07
    ld   e,a                        ; 03:6D08
    ld   a,[hl]                     ; 03:6D09
    ld   h,a                        ; 03:6D0A
    ld   l,e                        ; 03:6D0B
    ld   a,c                        ; 03:6D0C
    ldh  [<SVBK],a                  ; 03:6D0D
    ldh  a,[<$FFA6]                 ; 03:6D0F
    ld   [hl],a                     ; 03:6D11
    xor  a                          ; 03:6D12
    ldh  [<SVBK],a                  ; 03:6D13
    ret                             ; 03:6D15

Data036D16:                         ; 03:6D16
.db $01,$02,$01,$00,$03,$01,$01,$01,\
    $01,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $01,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$09,$0A,$08,$02,$02,$04,\
    $05,$05,$01,$01,$01,$01,$01,$01,\
    $00,$00,$01,$01,$01,$00,$01,$00,\
    $00,$01,$00,$01,$00,$01,$07,$07,\
    $02,$02,$00,$01,$00,$00,$01,$01,\
    $00,$00,$00,$00,$00,$00,$01,$01,\
    $01,$01,$00,$00,$06,$02,$0B,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$01,\
    $00,$00,$00,$00,$07,$07,$02,$02,\
    $02,$07,$0C,$0D,$0E,$0F,$02,$07,\
    $0D,$10,$11,$10,$0D,$0E,$0F,$12,\
    $13,$01,$14,$15,$01,$01,$01,$00,\
    $00,$00,$00,$00,$00,$16,$02,$05,\
    $05,$01,$01,$00,$00,$00,$00,$00,\
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
    $00,$00,$00,$00,$00,$00,$00,$00

Sub036E16:
    ld   b,d                        ; 03:6E16
    ld   c,e                        ; 03:6E17
    ld   e,$06                      ; 03:6E18
    ldh  a,[<$FF98]                 ; 03:6E1A
    cp   $10                        ; 03:6E1C
    jr   c,Code036E22               ; 03:6E1E
    ld   e,$07                      ; 03:6E20
Code036E22:
    ld   a,e                        ; 03:6E22
    ldh  [<SVBK],a                  ; 03:6E23
    ldh  [<$FFA6],a                 ; 03:6E25
    ldh  a,[<$FF98]                 ; 03:6E27
    and  $0F                        ; 03:6E29
    ld   d,a                        ; 03:6E2B
    ld   e,$00                      ; 03:6E2C
    ld   hl,W_SubLv16x16Tilemap     ; 03:6E2E
    add  hl,de                      ; 03:6E31
    ld   d,$00                      ; 03:6E32
    ldh  a,[<$FF99]                 ; 03:6E34
    ld   e,a                        ; 03:6E36
    add  hl,de                      ; 03:6E37
    ld   d,$00                      ; 03:6E38
    ldh  a,[<$FF97]                 ; 03:6E3A
    swap a                          ; 03:6E3C
    ld   e,a                        ; 03:6E3E
    ld   d,$00                      ; 03:6E3F
    add  hl,de                      ; 03:6E41
    ld   a,[hl]                     ; 03:6E42
    ldh  [<$FF9F],a                 ; 03:6E43
    ld   a,l                        ; 03:6E45
    ldh  [<$FFA0],a                 ; 03:6E46
    ld   a,h                        ; 03:6E48
    ldh  [<$FFA1],a                 ; 03:6E49
    ld   e,[hl]                     ; 03:6E4B
    ld   d,$00                      ; 03:6E4C
    ld   hl,Data036D16              ; 03:6E4E
    add  hl,de                      ; 03:6E51
    ld   a,[hl]                     ; 03:6E52
    push af                         ; 03:6E53
    ld   a,$00                      ; 03:6E54
    ldh  [<SVBK],a                  ; 03:6E56
    ld   hl,$C23E                   ; 03:6E58
    add  hl,bc                      ; 03:6E5B
    ldh  a,[<$FF9F]                 ; 03:6E5C
    ld   [hl],a                     ; 03:6E5E
    ld   hl,$C256                   ; 03:6E5F
    add  hl,bc                      ; 03:6E62
    ldh  a,[<$FFA6]                 ; 03:6E63
    ld   [hl],a                     ; 03:6E65
    sla  c                          ; 03:6E66
    ld   hl,$C246                   ; 03:6E68
    add  hl,bc                      ; 03:6E6B
    ldh  a,[<$FFA0]                 ; 03:6E6C
    ldi  [hl],a                     ; 03:6E6E
    ldh  a,[<$FFA1]                 ; 03:6E6F
    ld   [hl],a                     ; 03:6E71
    ld   a,c                        ; 03:6E72
    ldh  [<$FFA6],a                 ; 03:6E73
    pop  af                         ; 03:6E75
    rst  $00                        ; 03:6E76
.dw Return036EAC                    ; 03:6E77
.dw Code036EA5                      ; 03:6E79
.dw Code036EAD                      ; 03:6E7B
.dw Code036ECA                      ; 03:6E7D
.dw Code036EBB                      ; 03:6E7F
.dw Code036EC2                      ; 03:6E81
.dw Code036EDA                      ; 03:6E83
.dw Code036EE2                      ; 03:6E85
.dw Code036EF5                      ; 03:6E87
.dw Code036F03                      ; 03:6E89
.dw Code036F0B                      ; 03:6E8B
.dw Code036EB5                      ; 03:6E8D
.dw Code036EEF                      ; 03:6E8F
.dw Code036F13                      ; 03:6E91
.dw Code036F1C                      ; 03:6E93
.dw Code036F4B                      ; 03:6E95
.dw Code036F85                      ; 03:6E97
.dw Code036F8E                      ; 03:6E99
.dw Code036FA1                      ; 03:6E9B
.dw Code036FB1                      ; 03:6E9D
.dw Code036FBA                      ; 03:6E9F
.dw Code036FC3                      ; 03:6EA1
.dw Code036FF8                      ; 03:6EA3
Code036EA5:
    ld   hl,$C20F                   ; 03:6EA5

Sub036EA8:
    ldh  a,[<$FF9B]                 ; 03:6EA8
    or   [hl]                       ; 03:6EAA
    ld   [hl],a                     ; 03:6EAB
Return036EAC:
    ret                             ; 03:6EAC

Code036EAD:
    ld   hl,$C210                   ; 03:6EAD
    call Sub036EA8                  ; 03:6EB0
    jr   Code036EA5                 ; 03:6EB3
Code036EB5:
    ld   hl,$C219                   ; 03:6EB5
    call Sub036EA8                  ; 03:6EB8
Code036EBB:
    ld   hl,$C212                   ; 03:6EBB
    call Sub036EA8                  ; 03:6EBE
    ret                             ; 03:6EC1

Code036EC2:
    ld   hl,$C213                   ; 03:6EC2
    call Sub036EA8                  ; 03:6EC5
    jr   Code036EA5                 ; 03:6EC8
Code036ECA:
    ld   a,[$C1C5]                  ; 03:6ECA
    and  a                          ; 03:6ECD
    jr   nz,Code036ED2              ; 03:6ECE
    jr   Code036EAD                 ; 03:6ED0
Code036ED2:
    ld   hl,$C211                   ; 03:6ED2
    call Sub036EA8                  ; 03:6ED5
    jr   Code036EA5                 ; 03:6ED8
Code036EDA:
    ld   hl,$C214                   ; 03:6EDA
    call Sub036EA8                  ; 03:6EDD
    jr   Code036EA5                 ; 03:6EE0
Code036EE2:
    ldh  a,[<$FF9F]                 ; 03:6EE2
    cp   $3F                        ; 03:6EE4
    jr   nz,Code036EE8              ; 03:6EE6
Code036EE8:
    ld   hl,$C215                   ; 03:6EE8
    call Sub036EA8                  ; 03:6EEB
    ret                             ; 03:6EEE

Code036EEF:
    ld   hl,$C21A                   ; 03:6EEF
    call Sub036EA8                  ; 03:6EF2
Code036EF5:
    ld   hl,$C216                   ; 03:6EF5
    call Sub036EA8                  ; 03:6EF8
    ld   hl,$C210                   ; 03:6EFB
    call Sub036EA8                  ; 03:6EFE
    jr   Code036EA5                 ; 03:6F01
Code036F03:
    ld   hl,$C217                   ; 03:6F03
    call Sub036EA8                  ; 03:6F06
    jr   Code036EA5                 ; 03:6F09
Code036F0B:
    ld   hl,$C218                   ; 03:6F0B
    call Sub036EA8                  ; 03:6F0E
    jr   Code036EA5                 ; 03:6F11
Code036F13:
    ld   hl,$C21B                   ; 03:6F13
    call Sub036EA8                  ; 03:6F16
    jp   Code036EAD                 ; 03:6F19
Code036F1C:
    ld   a,[$C366]                  ; 03:6F1C
    and  a                          ; 03:6F1F
    jr   nz,Code036F40              ; 03:6F20
    ld   a,[$DA6A]                  ; 03:6F22
    xor  $01                        ; 03:6F25
    and  a                          ; 03:6F27
    jr   z,Code036F35               ; 03:6F28
Code036F2A:
    ld   a,[$C375]                  ; 03:6F2A
    bit  1,a                        ; 03:6F2D
    jr   nz,Code036F48              ; 03:6F2F
    and  a                          ; 03:6F31
    jr   nz,Code036F48              ; 03:6F32
    ret                             ; 03:6F34

Code036F35:
    ld   a,[$C375]                  ; 03:6F35
    bit  1,a                        ; 03:6F38
    jr   nz,Code036F48              ; 03:6F3A
    and  a                          ; 03:6F3C
    jr   z,Code036F48               ; 03:6F3D
    ret                             ; 03:6F3F

Code036F40:
    ld   a,[$DA6A]                  ; 03:6F40
    and  a                          ; 03:6F43
    jr   z,Code036F35               ; 03:6F44
    jr   Code036F2A                 ; 03:6F46
Code036F48:
    jp   Code036EA5                 ; 03:6F48
Code036F4B:
    ld   a,[$C366]                  ; 03:6F4B
    and  a                          ; 03:6F4E
    jr   nz,Code036F7D              ; 03:6F4F
    ld   a,[$DA6A]                  ; 03:6F51
    xor  $01                        ; 03:6F54
    and  a                          ; 03:6F56
    jr   z,Code036F66               ; 03:6F57
Code036F59:
    ld   a,[$C375]                  ; 03:6F59
    bit  1,a                        ; 03:6F5C
    jr   nz,Code036F48              ; 03:6F5E
    and  a                          ; 03:6F60
    jp   nz,Code036F7A              ; 03:6F61
    jr   Code036F71                 ; 03:6F64
Code036F66:
    ld   a,[$C375]                  ; 03:6F66
    bit  1,a                        ; 03:6F69
    jr   nz,Code036F48              ; 03:6F6B
    and  a                          ; 03:6F6D
    jp   z,Code036F7A               ; 03:6F6E
Code036F71:
    ld   hl,$C21C                   ; 03:6F71
    call Sub036EA8                  ; 03:6F74
    jp   Code036EA5                 ; 03:6F77
Code036F7A:
    jp   Code036EA5                 ; 03:6F7A
Code036F7D:
    ld   a,[$DA6A]                  ; 03:6F7D
    and  a                          ; 03:6F80
    jr   z,Code036F66               ; 03:6F81
    jr   Code036F59                 ; 03:6F83
Code036F85:
    ld   hl,$C21D                   ; 03:6F85
    call Sub036EA8                  ; 03:6F88
    jp   Code036EAD                 ; 03:6F8B
Code036F8E:
    ldh  a,[<$FF9F]                 ; 03:6F8E
    cp   $3F                        ; 03:6F90
    jr   nz,Code036F94              ; 03:6F92
Code036F94:
    ld   hl,$C215                   ; 03:6F94
    call Sub036EA8                  ; 03:6F97
    ld   hl,$C21D                   ; 03:6F9A
    call Sub036EA8                  ; 03:6F9D
    ret                             ; 03:6FA0

Code036FA1:
    ld   a,[$C375]                  ; 03:6FA1
    bit  1,a                        ; 03:6FA4
    jr   nz,Code036FAE              ; 03:6FA6
    ld   hl,$C21E                   ; 03:6FA8
    call Sub036EA8                  ; 03:6FAB
Code036FAE:
    jp   Code036EA5                 ; 03:6FAE
Code036FB1:
    ld   hl,$C21C                   ; 03:6FB1
    call Sub036EA8                  ; 03:6FB4
    jp   Code036EA5                 ; 03:6FB7
Code036FBA:
    ld   hl,$C21F                   ; 03:6FBA
    call Sub036EA8                  ; 03:6FBD
    jp   Code036EA5                 ; 03:6FC0
Code036FC3:
    ld   a,[$C366]                  ; 03:6FC3
    and  a                          ; 03:6FC6
    jr   nz,Code036FF0              ; 03:6FC7
    ld   a,[$DA6A]                  ; 03:6FC9
    xor  $01                        ; 03:6FCC
    and  a                          ; 03:6FCE
    jr   z,Code036FDE               ; 03:6FCF
Code036FD1:
    ld   a,[$C375]                  ; 03:6FD1
    bit  1,a                        ; 03:6FD4
    jr   nz,Code036FED              ; 03:6FD6
    and  a                          ; 03:6FD8
    jp   nz,Return036FEC            ; 03:6FD9
    jr   Code036FE9                 ; 03:6FDC
Code036FDE:
    ld   a,[$C375]                  ; 03:6FDE
    bit  1,a                        ; 03:6FE1
    jr   nz,Code036FED              ; 03:6FE3
    and  a                          ; 03:6FE5
    jp   z,Return036FEC             ; 03:6FE6
Code036FE9:
    jp   Code036EA5                 ; 03:6FE9
Return036FEC:
    ret                             ; 03:6FEC

Code036FED:
    jp   Code036EA5                 ; 03:6FED
Code036FF0:
    ld   a,[$DA6A]                  ; 03:6FF0
    and  a                          ; 03:6FF3
    jr   z,Code036FDE               ; 03:6FF4
    jr   Code036FD1                 ; 03:6FF6
Code036FF8:
    ld   hl,$C220                   ; 03:6FF8
    call Sub036EA8                  ; 03:6FFB
    jp   Code036EA5                 ; 03:6FFE

Sub037001:
    ld   b,d                        ; 03:7001
    ld   c,e                        ; 03:7002
    ld   e,$06                      ; 03:7003
    ldh  a,[<$FF98]                 ; 03:7005
    cp   $10                        ; 03:7007
    jr   c,Code03700D               ; 03:7009
    ld   e,$07                      ; 03:700B
Code03700D:
    ld   a,e                        ; 03:700D
    ldh  [<SVBK],a                  ; 03:700E
    ldh  [<$FFA6],a                 ; 03:7010
    ldh  a,[<$FF98]                 ; 03:7012
    and  $0F                        ; 03:7014
    ld   d,a                        ; 03:7016
    ld   e,$00                      ; 03:7017
    ld   hl,W_SubLv16x16Tilemap     ; 03:7019
    add  hl,de                      ; 03:701C
    ld   d,$00                      ; 03:701D
    ldh  a,[<$FF99]                 ; 03:701F
    ld   e,a                        ; 03:7021
    add  hl,de                      ; 03:7022
    ld   d,$00                      ; 03:7023
    ldh  a,[<$FF97]                 ; 03:7025
    swap a                          ; 03:7027
    ld   e,a                        ; 03:7029
    ld   d,$00                      ; 03:702A
    add  hl,de                      ; 03:702C
    ld   a,[hl]                     ; 03:702D
    push af                         ; 03:702E
    ld   a,$00                      ; 03:702F
    ldh  [<SVBK],a                  ; 03:7031
    ld   a,l                        ; 03:7033
    ldh  [<$FFA0],a                 ; 03:7034
    ld   a,h                        ; 03:7036
    ldh  [<$FFA1],a                 ; 03:7037
    pop  af                         ; 03:7039
    ret                             ; 03:703A

Data03703B:                         ; 03:703B
.db $26,$27,$2A,$2D
Data03703F:                         ; 03:703F
.db $29,$34,$29,$34

Sub037043:
    ld   a,[W_PlayerState]          ; 03:7043
    cp   $11                        ; 03:7046
    ret  z                          ; 03:7048
    cp   $04                        ; 03:7049
    ret  z                          ; 03:704B
    cp   $0E                        ; 03:704C
    ret  z                          ; 03:704E
    cp   $12                        ; 03:704F
    ret  z                          ; 03:7051
    cp   $03                        ; 03:7052
    ret  z                          ; 03:7054
    call Sub0370C2                  ; 03:7055
    jr   nc,Code037065              ; 03:7058
    ldh  a,[<$FFAA]                 ; 03:705A
    cp   $01                        ; 03:705C
    ret  nz                         ; 03:705E
    ld   a,[$C1E6]                  ; 03:705F
    and  a                          ; 03:7062
    jr   nz,Code037078              ; 03:7063
Code037065:
    ld   a,$11                      ; 03:7065
    ld   [W_PlayerState],a          ; 03:7067
    ld   a,$D0                      ; 03:706A
    ld   [$C1CF],a                  ; 03:706C
    xor  a                          ; 03:706F
    ld   [$C181],a                  ; 03:7070
    inc  a                          ; 03:7073
    ld   [$C1F3],a                  ; 03:7074
    ret                             ; 03:7077

Code037078:
    ld   a,$12                      ; 03:7078
    ld   [W_PlayerState],a          ; 03:707A
    ld   a,$96                      ; 03:707D
    ld   [$C1D1],a                  ; 03:707F
    xor  a                          ; 03:7082
    ld   [$C181],a                  ; 03:7083
    ld   a,[$C283]                  ; 03:7086
    and  a                          ; 03:7089
    ret  z                          ; 03:708A
    ld   a,[W_SPFlag]               ; 03:708B
    and  a                          ; 03:708E
    ret  nz                         ; 03:708F
    ld   de,$0000                   ; 03:7090
Code037093:
    ld   hl,Data03703B              ; 03:7093
    add  hl,de                      ; 03:7096
    ld   a,[W_SublevelID]           ; 03:7097
    cp   [hl]                       ; 03:709A
    jr   z,Code0370A5               ; 03:709B
    inc  e                          ; 03:709D
    ld   a,e                        ; 03:709E
    cp   $04                        ; 03:709F
    jr   nz,Code037093              ; 03:70A1
    jr   Return0370C1               ; 03:70A3
Code0370A5:
    ld   hl,Data03703F              ; 03:70A5
    add  hl,de                      ; 03:70A8
    ld   a,[$C3A5]                  ; 03:70A9
    cp   [hl]                       ; 03:70AC
    jr   c,Return0370C1             ; 03:70AD
    ld   a,$67                      ; 03:70AF
    ldh  [<$FFF2],a                 ; 03:70B1
    nop                             ; 03:70B3
    nop                             ; 03:70B4
    nop                             ; 03:70B5
    nop                             ; 03:70B6
    nop                             ; 03:70B7
    nop                             ; 03:70B8
    nop                             ; 03:70B9
    nop                             ; 03:70BA
    ld   a,$03                      ; 03:70BB
    rst  $10                        ; 03:70BD
.dl SubL_0748E2                     ; 03:70BE
Return0370C1:
    ret                             ; 03:70C1

Sub0370C2:
    ldh  a,[<H_PlInitY_SubLvType]   ; 03:70C2
    and  $0F                        ; 03:70C4
    cp   $02                        ; 03:70C6
    jr   nz,Code0370E2              ; 03:70C8
    ld   a,[$C1C5]                  ; 03:70CA
    and  a                          ; 03:70CD
    jr   nz,Code0370D9              ; 03:70CE
    ldh  a,[<$FFA9]                 ; 03:70D0
    cp   $EE                        ; 03:70D2
    jr   c,Code0370E2               ; 03:70D4
    scf                             ; 03:70D6
    ccf                             ; 03:70D7
    ret                             ; 03:70D8

Code0370D9:
    ldh  a,[<$FFA9]                 ; 03:70D9
    cp   $FD                        ; 03:70DB
    jr   c,Code0370E2               ; 03:70DD
    scf                             ; 03:70DF
    ccf                             ; 03:70E0
    ret                             ; 03:70E1

Code0370E2:
    scf                             ; 03:70E2
    ret                             ; 03:70E3

SubL_0370E4:
    ld   a,[W_GameMode]             ; 03:70E4
    cp   $02                        ; 03:70E7
    jr   z,Code037122               ; 03:70E9
    xor  a                          ; 03:70EB
    ld   [$C1D4],a                  ; 03:70EC
    ld   a,$02                      ; 03:70EF
    ld   [$C1C4],a                  ; 03:70F1
    ld   a,$28                      ; 03:70F4
    ldh  [<$FFF3],a                 ; 03:70F6
    ld   a,[$C1C5]                  ; 03:70F8
    and  a                          ; 03:70FB
    jr   nz,Code037110              ; 03:70FC
    ld   a,[$C1C2]                  ; 03:70FE
    ld   [$C209],a                  ; 03:7101
    ld   a,[W_PlayerState]          ; 03:7104
    ld   [$C1D9],a                  ; 03:7107
    ld   a,$07                      ; 03:710A
    ld   [W_PlayerState],a          ; 03:710C
    rst  $18                        ; 03:710F

Code037110:
    ld   a,[$C1CE]                  ; 03:7110
    and  a                          ; 03:7113
    jr   nz,ReturnL_037121          ; 03:7114
    ld   a,[W_PlayerState]          ; 03:7116
    ld   [$C1D9],a                  ; 03:7119
    ld   a,$09                      ; 03:711C
    ld   [W_PlayerState],a          ; 03:711E
ReturnL_037121:
    rst  $18                        ; 03:7121

Code037122:
    ld   a,[$D2F5]                  ; 03:7122
    swap a                          ; 03:7125
    sla  a                          ; 03:7127
    sla  a                          ; 03:7129
    sla  a                          ; 03:712B
    ld   e,a                        ; 03:712D
    ld   d,$00                      ; 03:712E
    ld   hl,$C51C                   ; 03:7130
    add  hl,de                      ; 03:7133
    ld   [hl],$00                   ; 03:7134
    ld   hl,$C50C                   ; 03:7136
    add  hl,de                      ; 03:7139
    ld   [hl],$02                   ; 03:713A
    ld   a,$28                      ; 03:713C
    ldh  [<$FFF3],a                 ; 03:713E
    ld   hl,$C50D                   ; 03:7140
    add  hl,de                      ; 03:7143
    ld   a,[hl]                     ; 03:7144
    and  a                          ; 03:7145
    jr   nz,Code037161              ; 03:7146
    ld   hl,$C50A                   ; 03:7148
    add  hl,de                      ; 03:714B
    ld   a,[hl]                     ; 03:714C
    ld   hl,$C551                   ; 03:714D
    add  hl,de                      ; 03:7150
    ld   [hl],a                     ; 03:7151
    ld   hl,$C509                   ; 03:7152
    add  hl,de                      ; 03:7155
    push hl                         ; 03:7156
    ld   a,[hl]                     ; 03:7157
    ld   hl,$C521                   ; 03:7158
    add  hl,de                      ; 03:715B
    ld   [hl],a                     ; 03:715C
    pop  hl                         ; 03:715D
    ld   [hl],$07                   ; 03:715E
    rst  $18                        ; 03:7160

Code037161:
    ld   hl,$C516                   ; 03:7161
    add  hl,de                      ; 03:7164
    ld   a,[hl]                     ; 03:7165
    and  a                          ; 03:7166
    jr   nz,ReturnL_037177          ; 03:7167
    ld   hl,$C509                   ; 03:7169
    add  hl,de                      ; 03:716C
    push hl                         ; 03:716D
    ld   a,[hl]                     ; 03:716E
    ld   hl,$C521                   ; 03:716F
    add  hl,de                      ; 03:7172
    ld   [hl],a                     ; 03:7173
    pop  hl                         ; 03:7174
    ld   [hl],$09                   ; 03:7175
ReturnL_037177:
    rst  $18                        ; 03:7177

Sub037178:
    ld   hl,$FFA7                   ; 03:7178
    ld   a,[W_GameMode]             ; 03:717B
    cp   $02                        ; 03:717E
    jr   z,Code03719B               ; 03:7180
    ld   a,[W_SublevelID]           ; 03:7182
    cp   $20                        ; 03:7185
    jr   nc,Code03719B              ; 03:7187
    and  $03                        ; 03:7189
    cp   $03                        ; 03:718B
    jr   nz,Code03719B              ; 03:718D
    ld   a,$20                      ; 03:718F
    ldi  [hl],a                     ; 03:7191
    xor  a                          ; 03:7192
    ldi  [hl],a                     ; 03:7193
    ld   a,$70                      ; 03:7194
    ldi  [hl],a                     ; 03:7196
    ld   [hl],$00                   ; 03:7197
    jr   Code0371BF                 ; 03:7199
Code03719B:
    ld   a,$20                      ; 03:719B
    ldi  [hl],a                     ; 03:719D
    xor  a                          ; 03:719E
    ldi  [hl],a                     ; 03:719F
    ldh  a,[<H_PlInitY_SubLvType]   ; 03:71A0
    and  $F0                        ; 03:71A2
    ldi  [hl],a                     ; 03:71A4
    ld   [hl],$00                   ; 03:71A5
    jr   Code0371BF                 ; 03:71A7

Sub0371A9:
    ld   hl,$FFA9                   ; 03:71A9
    ldh  a,[<$FFA8]                 ; 03:71AC
    and  a                          ; 03:71AE
    jr   z,Code0371B8               ; 03:71AF
    ld   a,$D0                      ; 03:71B1
    ldi  [hl],a                     ; 03:71B3
    ld   [hl],$00                   ; 03:71B4
    jr   Code0371BF                 ; 03:71B6
Code0371B8:
    ldh  a,[<H_PlInitY_SubLvType]   ; 03:71B8
    and  $F0                        ; 03:71BA
    ldi  [hl],a                     ; 03:71BC
    ld   [hl],$00                   ; 03:71BD
Code0371BF:
    ld   a,$02                      ; 03:71BF
    ld   [$C1C3],a                  ; 03:71C1
    ret                             ; 03:71C4

Sub0371C5:
    xor  a                          ; 03:71C5
    ld   [$C167],a                  ; 03:71C6

Sub0371C9:
    xor  a                          ; 03:71C9
    ld   [$C1FE],a                  ; 03:71CA
    ld   [$C1FF],a                  ; 03:71CD
    ld   [$C1C9],a                  ; 03:71D0
    ld   [W_PlayerState],a          ; 03:71D3
    ld   [$C1C2],a                  ; 03:71D6
    ld   [$C1CF],a                  ; 03:71D9
    ld   [$C1D0],a                  ; 03:71DC
    ld   [$C1D4],a                  ; 03:71DF
    ld   [$C1D5],a                  ; 03:71E2
    ldh  [<$FFAB],a                 ; 03:71E5
    ldh  [<$FFAC],a                 ; 03:71E7
    ldh  [<$FFAD],a                 ; 03:71E9
    ldh  [<$FFAE],a                 ; 03:71EB
    ld   [$C200],a                  ; 03:71ED
    ld   [$C1D3],a                  ; 03:71F0
    ld   [$C1FD],a                  ; 03:71F3
    ld   [$C1D8],a                  ; 03:71F6
    ld   [$C1DA],a                  ; 03:71F9
    ld   [$C1DB],a                  ; 03:71FC
    ld   [$C1DC],a                  ; 03:71FF
    ld   [$C1DD],a                  ; 03:7202
    ld   [$C1EC],a                  ; 03:7205
    ld   [$C1E9],a                  ; 03:7208
    ld   [$C1EA],a                  ; 03:720B
    ld   [$C1E7],a                  ; 03:720E
    ld   [$C25F],a                  ; 03:7211
    ld   [$C260],a                  ; 03:7214
    ld   [$C261],a                  ; 03:7217
    ld   [$C264],a                  ; 03:721A
    ld   [$C26B],a                  ; 03:721D
    ld   [$C26C],a                  ; 03:7220
    ld   [$C26D],a                  ; 03:7223
    ld   [$C26E],a                  ; 03:7226
    ld   [$C26F],a                  ; 03:7229
    ld   [$C270],a                  ; 03:722C
    ld   [$C271],a                  ; 03:722F
    ld   [$C272],a                  ; 03:7232
    ld   [$C273],a                  ; 03:7235
    ld   [$C274],a                  ; 03:7238
    ld   [$C275],a                  ; 03:723B
    ld   [$C276],a                  ; 03:723E
    ld   [$C277],a                  ; 03:7241
    ld   [$C278],a                  ; 03:7244
    ld   [$C279],a                  ; 03:7247
    ld   [$C27A],a                  ; 03:724A
    ld   [$C1DE],a                  ; 03:724D
    ld   [$C1E3],a                  ; 03:7250
    ld   [$C1E4],a                  ; 03:7253
    ld   [$C1E6],a                  ; 03:7256
    ld   [$C1F5],a                  ; 03:7259
    ld   [$C1F6],a                  ; 03:725C
    ld   [$C1ED],a                  ; 03:725F
    ld   [$C1EE],a                  ; 03:7262
    ld   [$C1F7],a                  ; 03:7265
    ld   [$C28D],a                  ; 03:7268
    ld   [$C1F3],a                  ; 03:726B
    ld   [$C1E8],a                  ; 03:726E
    ld   [$C36A],a                  ; 03:7271
    ld   [$C375],a                  ; 03:7274
    ld   [$C3AB],a                  ; 03:7277
    ld   [$C1FA],a                  ; 03:727A
    ld   [$C207],a                  ; 03:727D
    ld   [$C20A],a                  ; 03:7280
    ld   [$C1C6],a                  ; 03:7283
    ld   [$C20D],a                  ; 03:7286
    ld   [$C3E9],a                  ; 03:7289
    ld   [$C3EA],a                  ; 03:728C
    ret                             ; 03:728F

Data037290:                         ; 03:7290
.dw $7C00,$7F00,$7DC0,$7C40,$7C80,$7E00,$7D80,$7E40,\
    $7CC0,$7D00,$7D40,$7C00,$7E80,$8200,$7EC0,$7700,\
    $7F40,$7D40
Data0372B4:                         ; 03:72B4
.dw $7000,$7400,$7380,$7080,$7100,$7A00,$7300,$7500,\
    $7180,$7200,$7280,$7480,$7580,$7600,$7680,$7700,\
    $7A00,$7A80
Data0372D8:                         ; 03:72D8
.dw $7600,$7600,$7900,$7780,$7800,$7A00,$7880,$7500,\
    $7600,$7980,$7980,$7480,$7580,$7600,$7980,$7700,\
    $7600,$7600
DataPtrs0372FC:                     ; 03:72FC
.dw Data037290, Data0372B4
Data037300:                         ; 03:7300
.db $10,$08,$00,$2C,$10,$00,$02,$2C,\
    $10,$00,$00,$0C,$10,$08,$02,$0C,\
    $10,$08,$08,$2B,$10,$00,$0A,$2B,\
    $10,$00,$08,$0B,$10,$08,$0A,$0B
Data037320:                         ; 03:7320
.db $00,$08,$00,$2C,$00,$00,$02,$2C,\
    $10,$08,$04,$2C,$10,$00,$06,$2C,\
    $00,$00,$00,$0C,$00,$08,$02,$0C,\
    $10,$00,$04,$0C,$10,$08,$06,$0C,\
    $00,$08,$08,$2B,$00,$00,$0A,$2B,\
    $10,$08,$0C,$2B,$10,$00,$0E,$2B,\
    $00,$00,$08,$0B,$00,$08,$0A,$0B,\
    $10,$00,$0C,$0B,$10,$08,$0E,$0B
DataPtrs037360:                     ; 03:7360
.dw Data037300, Data037320
Data037364:                         ; 03:7364
.db $08,$10
Data037366:                         ; 03:7366
.db $02,$04
Data037368:                         ; 03:7368
.dw $C018,$C028
Data03736C:                         ; 03:736C
.db $AF,$FF,$64,$C3

SubL_037370:
    ldh  a,[<$FF97]                 ; 03:7370
    call Sub037384                  ; 03:7372
    rst  $18                        ; 03:7375

Sub037376:
    xor  a                          ; 03:7376
    ld   [$C369],a                  ; 03:7377
    jr   Sub037384                  ; 03:737A

Sub03737C:
    push af                         ; 03:737C
    ld   a,[$C1E3]                  ; 03:737D
    ld   [$C369],a                  ; 03:7380
    pop  af                         ; 03:7383

Sub037384:
    ld   [$C363],a                  ; 03:7384
    ld   a,[$C1D5]                  ; 03:7387
    and  $01                        ; 03:738A
    jp   nz,Code037460              ; 03:738C
    ldh  a,[<$FFA9]                 ; 03:738F
    add  $11                        ; 03:7391
    ld   e,a                        ; 03:7393
    ldh  a,[<$FFAA]                 ; 03:7394
    adc  $00                        ; 03:7396
    ld   d,a                        ; 03:7398
    ld   hl,$FFBA                   ; 03:7399
    ld   a,e                        ; 03:739C
    sub  [hl]                       ; 03:739D
    ldh  [<$FF98],a                 ; 03:739E
    ld   hl,$FFBB                   ; 03:73A0
    ld   a,d                        ; 03:73A3
    sbc  [hl]                       ; 03:73A4
    cp   $00                        ; 03:73A5
    jr   z,Code0373B5               ; 03:73A7
    cp   $FF                        ; 03:73A9
    jp   nz,Code037460              ; 03:73AB
    ldh  a,[<$FF98]                 ; 03:73AE
    cp   $C0                        ; 03:73B0
    jp   c,Code037460               ; 03:73B2
Code0373B5:
    ld   hl,$FFB8                   ; 03:73B5
    ldh  a,[<$FFA7]                 ; 03:73B8
    sub  [hl]                       ; 03:73BA
    ldh  [<$FF99],a                 ; 03:73BB
    ld   hl,$FFB9                   ; 03:73BD
    ldh  a,[<$FFA8]                 ; 03:73C0
    sbc  [hl]                       ; 03:73C2
    ldh  [<$FF9A],a                 ; 03:73C3
    ldh  a,[<$FF99]                 ; 03:73C5
    add  $08                        ; 03:73C7
    ldh  [<$FF97],a                 ; 03:73C9
    ldh  a,[<$FF9A]                 ; 03:73CB
    adc  $00                        ; 03:73CD
    ld   d,a                        ; 03:73CF
    ldh  a,[<$FF97]                 ; 03:73D0
    add  $10                        ; 03:73D2
    ld   e,a                        ; 03:73D4
    ld   a,d                        ; 03:73D5
    adc  $00                        ; 03:73D6
    and  a                          ; 03:73D8
    jp   nz,Code037460              ; 03:73D9
    ld   a,e                        ; 03:73DC
    cp   $B8                        ; 03:73DD
    jp   nc,Code037460              ; 03:73DF
    ld   a,[$C363]                  ; 03:73E2
    swap a                          ; 03:73E5
    ld   c,a                        ; 03:73E7
    ld   b,$00                      ; 03:73E8
    ld   a,[$C1C3]                  ; 03:73EA
    ld   e,a                        ; 03:73ED
    sla  e                          ; 03:73EE
    sla  e                          ; 03:73F0
    ld   a,[$C1C5]                  ; 03:73F2
    and  a                          ; 03:73F5
    jp   z,Code0373FD               ; 03:73F6
    sla  e                          ; 03:73F9
    sla  c                          ; 03:73FB
Code0373FD:
    ld   l,e                        ; 03:73FD
    ld   h,$00                      ; 03:73FE
    add  hl,bc                      ; 03:7400
    push hl                         ; 03:7401
    ld   hl,Data037364              ; 03:7402
    ld   a,[$C1C5]                  ; 03:7405
    ld   e,a                        ; 03:7408
    ld   d,$00                      ; 03:7409
    add  hl,de                      ; 03:740B
    ld   b,[hl]                     ; 03:740C
    ld   hl,DataPtrs037360          ; 03:740D
    ld   d,$00                      ; 03:7410
    ld   a,[$C1C5]                  ; 03:7412
    sla  a                          ; 03:7415
    ld   e,a                        ; 03:7417
    add  hl,de                      ; 03:7418
    ldi  a,[hl]                     ; 03:7419
    ld   e,a                        ; 03:741A
    ld   d,[hl]                     ; 03:741B
    pop  hl                         ; 03:741C
    add  hl,de                      ; 03:741D
    push hl                         ; 03:741E
    ld   a,[$C369]                  ; 03:741F
    ld   e,a                        ; 03:7422
    sla  e                          ; 03:7423
    ld   d,$00                      ; 03:7425
    ld   hl,Data037368              ; 03:7427
    add  hl,de                      ; 03:742A
    ldi  a,[hl]                     ; 03:742B
    ld   e,a                        ; 03:742C
    ld   d,[hl]                     ; 03:742D
    pop  hl                         ; 03:742E
    push de                         ; 03:742F
Code037430:
    ldi  a,[hl]                     ; 03:7430
    ld   [de],a                     ; 03:7431
    inc  de                         ; 03:7432
    dec  b                          ; 03:7433
    jr   nz,Code037430              ; 03:7434
    ld   hl,Data037366              ; 03:7436
    ld   a,[$C1C5]                  ; 03:7439
    ld   d,$00                      ; 03:743C
    ld   e,a                        ; 03:743E
    add  hl,de                      ; 03:743F
    ld   d,[hl]                     ; 03:7440
    ld   e,$00                      ; 03:7441
    ld   a,[$C1E3]                  ; 03:7443
    and  a                          ; 03:7446
    jr   z,Code03744B               ; 03:7447
    ld   e,$80                      ; 03:7449
Code03744B:
    ldh  a,[<$FF98]                 ; 03:744B
    ld   b,a                        ; 03:744D
    ldh  a,[<$FF97]                 ; 03:744E
    ld   c,a                        ; 03:7450
    pop  hl                         ; 03:7451
Code037452:
    ld   a,[hl]                     ; 03:7452
    add  b                          ; 03:7453
    ldi  [hl],a                     ; 03:7454
    ld   a,[hl]                     ; 03:7455
    add  c                          ; 03:7456
    ldi  [hl],a                     ; 03:7457
    inc  hl                         ; 03:7458
    ld   a,[hl]                     ; 03:7459
    or   e                          ; 03:745A
    ldi  [hl],a                     ; 03:745B
    dec  d                          ; 03:745C
    jp   nz,Code037452              ; 03:745D
Code037460:
    ld   a,[$C1C5]                  ; 03:7460
    and  a                          ; 03:7463
    jr   z,Code037492               ; 03:7464
    ld   a,[$C1F7]                  ; 03:7466
    and  a                          ; 03:7469
    jr   z,Code037492               ; 03:746A
    ld   a,[$C1C2]                  ; 03:746C
    cp   $08                        ; 03:746F
    jr   z,Code037487               ; 03:7471
    cp   $10                        ; 03:7473
    jr   z,Code037487               ; 03:7475
    cp   $11                        ; 03:7477
    jr   z,Code037487               ; 03:7479
    cp   $09                        ; 03:747B
    jr   z,Code037487               ; 03:747D
    cp   $0A                        ; 03:747F
    jr   z,Code037487               ; 03:7481
    cp   $0E                        ; 03:7483
    jr   nz,Code03748D              ; 03:7485
Code037487:
    ldh  a,[<H_ButtonFlags]         ; 03:7487
    and  $30                        ; 03:7489
    jr   nz,Code037492              ; 03:748B
Code03748D:
    ld   hl,Data0372D8              ; 03:748D
    jr   Code0374A2                 ; 03:7490
Code037492:
    ld   hl,DataPtrs0372FC          ; 03:7492
    ld   a,[$C1C5]                  ; 03:7495
    sla  a                          ; 03:7498
    ld   e,a                        ; 03:749A
    ld   d,$00                      ; 03:749B
    add  hl,de                      ; 03:749D
    ldi  a,[hl]                     ; 03:749E
    ld   d,[hl]                     ; 03:749F
    ld   l,a                        ; 03:74A0
    ld   h,d                        ; 03:74A1
Code0374A2:
    ld   a,[$C1C2]                  ; 03:74A2
    sla  a                          ; 03:74A5
    ld   e,a                        ; 03:74A7
    ld   d,$00                      ; 03:74A8
    add  hl,de                      ; 03:74AA
    ldi  a,[hl]                     ; 03:74AB
    ldh  [<$FF97],a                 ; 03:74AC
    ld   a,[hl]                     ; 03:74AE
    ldh  [<$FF98],a                 ; 03:74AF
    ld   a,[$C363]                  ; 03:74B1
    ld   e,a                        ; 03:74B4
    sla  e                          ; 03:74B5
    ld   hl,Data03736C              ; 03:74B7
    add  hl,de                      ; 03:74BA
    ld   e,[hl]                     ; 03:74BB
    inc  hl                         ; 03:74BC
    ld   d,[hl]                     ; 03:74BD
    ld   l,e                        ; 03:74BE
    ld   h,d                        ; 03:74BF
    ldh  a,[<$FF97]                 ; 03:74C0
    ldi  [hl],a                     ; 03:74C2
    ldh  a,[<$FF98]                 ; 03:74C3
    ld   [hl],a                     ; 03:74C5
    ret                             ; 03:74C6

SubL_0374C7:
    call Sub035A3C                  ; 03:74C7
    rst  $18                        ; 03:74CA

Code0374CB:
    call Sub0374CF                  ; 03:74CB
    ret                             ; 03:74CE

Sub0374CF:
    ld   a,[$C1D3]                  ; 03:74CF
    rst  $00                        ; 03:74D2
.dw Code0374D7                      ; 03:74D3
.dw Code0375E4                      ; 03:74D5
Code0374D7:
    ld   a,$01                      ; 03:74D7
    ld   [$C1E3],a                  ; 03:74D9
    xor  a                          ; 03:74DC
    ldh  [<$FFAC],a                 ; 03:74DD
    ldh  [<$FFAE],a                 ; 03:74DF
    ld   [$C200],a                  ; 03:74E1
    ld   [$C1DD],a                  ; 03:74E4
    ld   a,$10                      ; 03:74E7
    ld   [$C25E],a                  ; 03:74E9
    call Sub035680                  ; 03:74EC
    call Sub0361DF                  ; 03:74EF
    call Sub035A14                  ; 03:74F2
    ld   hl,$C1E2                   ; 03:74F5
    ldh  a,[<$FFA8]                 ; 03:74F8
    cp   [hl]                       ; 03:74FA
    jr   nz,Return037553            ; 03:74FB
    ld   hl,$C1E1                   ; 03:74FD
    ldh  a,[<$FFA7]                 ; 03:7500
    cp   [hl]                       ; 03:7502
    jr   c,Return037553             ; 03:7503
    ld   hl,$C1D1                   ; 03:7505
    ld   [hl],$24                   ; 03:7508
    ld   a,[W_SublevelID]           ; 03:750A
    ld   d,a                        ; 03:750D
    ld   e,$34                      ; 03:750E
    ld   a,[W_SPFlag]               ; 03:7510
    and  a                          ; 03:7513
    jr   z,Code037518               ; 03:7514
    ld   e,$62                      ; 03:7516
Code037518:
    ld   a,d                        ; 03:7518
    cp   e                          ; 03:7519
    jr   nz,Code03751E              ; 03:751A
    ld   [hl],$96                   ; 03:751C
Code03751E:
    ld   a,$01                      ; 03:751E
    ld   [$C1D3],a                  ; 03:7520
    ret                             ; 03:7523

Code037524:
    call Sub037528                  ; 03:7524
    ret                             ; 03:7527

Sub037528:
    ld   a,[$C1D3]                  ; 03:7528
    rst  $00                        ; 03:752B
.dw Code037532                      ; 03:752C
.dw Code037554                      ; 03:752E
.dw Code0375E4                      ; 03:7530
Code037532:
    ld   a,$01                      ; 03:7532
    ld   [$C1E3],a                  ; 03:7534
    ld   a,$18                      ; 03:7537
    ldh  [<$FFAC],a                 ; 03:7539
    call Sub0359E4                  ; 03:753B
    call Sub035A14                  ; 03:753E
    ld   hl,$C1E1                   ; 03:7541
    ldh  a,[<$FFA9]                 ; 03:7544
    cp   [hl]                       ; 03:7546
    jr   c,Return037553             ; 03:7547
    ld   a,$24                      ; 03:7549
    ld   [$C1D1],a                  ; 03:754B
    ld   a,$02                      ; 03:754E
    ld   [$C1D3],a                  ; 03:7550
Return037553:
    ret                             ; 03:7553

Code037554:
    ld   a,$01                      ; 03:7554
    ld   [$C1E3],a                  ; 03:7556
    ld   a,[$C1D1]                  ; 03:7559
    cp   $00                        ; 03:755C
    jr   z,Code037576               ; 03:755E
    dec  a                          ; 03:7560
    ld   [$C1D1],a                  ; 03:7561
    cp   $01                        ; 03:7564
    jr   nz,Return0375AD            ; 03:7566
    ld   a,$25                      ; 03:7568
    ldh  [<$FFF3],a                 ; 03:756A
    ld   de,$0020                   ; 03:756C
    ld   a,$01                      ; 03:756F
    call Return0010B2               ; 03:7571
    jr   Return0375AD               ; 03:7574
Code037576:
    ld   a,$F0                      ; 03:7576
    ldh  [<$FFAC],a                 ; 03:7578
    call Sub0359E4                  ; 03:757A
    call Sub035A14                  ; 03:757D
    ld   hl,$C1E1                   ; 03:7580
    ldh  a,[<$FFA9]                 ; 03:7583
    cp   [hl]                       ; 03:7585
    jr   nc,Return0375AD            ; 03:7586
    xor  a                          ; 03:7588
    ld   [$C1F3],a                  ; 03:7589
    ld   [$C1D3],a                  ; 03:758C
    ld   [W_PlayerState],a          ; 03:758F
    ld   [$C1E3],a                  ; 03:7592
    ld   [$C1D1],a                  ; 03:7595
    ld   [$C170],a                  ; 03:7598
    ldh  [<$FFAC],a                 ; 03:759B
    ldh  [<$FFAE],a                 ; 03:759D
    ld   [$C200],a                  ; 03:759F
    ldh  [<$FFAB],a                 ; 03:75A2
    ldh  [<$FFAD],a                 ; 03:75A4
    ld   [$C1FD],a                  ; 03:75A6
    inc  a                          ; 03:75A9
    ld   [$C181],a                  ; 03:75AA
Return0375AD:
    ret                             ; 03:75AD

Data0375AE:                         ; 03:75AE
.db $01,$30,$0D
Data0375B1:                         ; 03:75B1
.dw $0B10,$0B48,$0B88,$0000,$0310,$0348,$0388,$0000,\
    $0D00
Data0375C3:                         ; 03:75C3
.db $0C,$08,$04,$00,$1C,$18,$14,$00,\
    $10
Data0375CC:                         ; 03:75CC
.db $01,$35,$36,$08,$43,$11,$44,$4D
Data0375D4:                         ; 03:75D4
.db $0D,$03,$05,$0F,$01,$0C,$03,$01
Data0375DC:                         ; 03:75DC
.db $04,$08,$0C,$00,$14,$18,$1C,$10
Code0375E4:
    ld   a,[$C1D1]                  ; 03:75E4
    dec  a                          ; 03:75E7
    ld   [$C1D1],a                  ; 03:75E8
    jp   nz,Return037688            ; 03:75EB
    ld   a,[$C283]                  ; 03:75EE
    and  a                          ; 03:75F1
    jr   nz,Code037613              ; 03:75F2
    ld   c,$03                      ; 03:75F4
    ld   hl,Data0375AE              ; 03:75F6
    ld   a,[W_SPFlag]               ; 03:75F9
    and  a                          ; 03:75FC
    jr   z,Code037604               ; 03:75FD
    ld   hl,Data0375CC              ; 03:75FF
    ld   c,$08                      ; 03:7602
Code037604:
    ld   de,$0000                   ; 03:7604
Code037607:
    ld   a,[W_SublevelID]           ; 03:7607
    cp   [hl]                       ; 03:760A
    jr   z,Code037633               ; 03:760B
    inc  hl                         ; 03:760D
    inc  e                          ; 03:760E
    ld   a,e                        ; 03:760F
    cp   c                          ; 03:7610
    jr   nz,Code037607              ; 03:7611
Code037613:
    ld   l,$34                      ; 03:7613
    ld   a,[W_SPFlag]               ; 03:7615
    and  a                          ; 03:7618
    jr   z,Code03761D               ; 03:7619
    ld   l,$62                      ; 03:761B
Code03761D:
    ld   a,[W_SublevelID]           ; 03:761D
    cp   l                          ; 03:7620
    jr   z,Code037628               ; 03:7621
    ld   a,$0D                      ; 03:7623
    ldh  [<H_GameState],a           ; 03:7625
    ret                             ; 03:7627

Code037628:
    ld   a,[W_LevelID]              ; 03:7628
    ld   [W_SublevelID],a           ; 03:762B
    ld   a,$09                      ; 03:762E
    ldh  [<H_GameState],a           ; 03:7630
    ret                             ; 03:7632

Code037633:
    ld   a,[W_SPFlag]               ; 03:7633
    and  a                          ; 03:7636
    jr   nz,Code037689              ; 03:7637
    sla  e                          ; 03:7639
    sla  e                          ; 03:763B
    sla  e                          ; 03:763D
    ld   hl,Data0375B1              ; 03:763F
    add  hl,de                      ; 03:7642
    inc  hl                         ; 03:7643
    ldi  a,[hl]                     ; 03:7644
    ld   c,a                        ; 03:7645
    ldh  a,[<$FFA8]                 ; 03:7646
    cp   c                          ; 03:7648
    jr   nz,Code037613              ; 03:7649
    cp   $0D                        ; 03:764B
    jr   z,Code037663               ; 03:764D
    ldh  a,[<$FFA7]                 ; 03:764F
    sub  [hl]                       ; 03:7651
    bit  7,a                        ; 03:7652
    jr   nz,Code037663              ; 03:7654
    inc  hl                         ; 03:7656
    inc  hl                         ; 03:7657
    inc  e                          ; 03:7658
    inc  e                          ; 03:7659
    ldh  a,[<$FFA7]                 ; 03:765A
    sub  [hl]                       ; 03:765C
    bit  7,a                        ; 03:765D
    jr   nz,Code037663              ; 03:765F
    inc  e                          ; 03:7661
    inc  e                          ; 03:7662
Code037663:
    srl  e                          ; 03:7663
    ld   hl,Data0375C3              ; 03:7665
    add  hl,de                      ; 03:7668
    ld   a,[hl]                     ; 03:7669
    ld   [W_LevelID],a              ; 03:766A
Code03766D:
    ld   a,$07                      ; 03:766D
    ldh  [<H_GameState],a           ; 03:766F
    ld   hl,$C164                   ; 03:7671
    ld   [hl],$FF                   ; 03:7674
    inc  hl                         ; 03:7676
    ld   [hl],$01                   ; 03:7677
    xor  a                          ; 03:7679
    ld   [$C28E],a                  ; 03:767A
    ld   [$C1B7],a                  ; 03:767D
    ld   [$C1EF],a                  ; 03:7680
    ld   a,$FF                      ; 03:7683
    ld   [$DE68],a                  ; 03:7685
Return037688:
    ret                             ; 03:7688

Code037689:
    ld   hl,Data0375D4              ; 03:7689
    add  hl,de                      ; 03:768C
    ld   a,[hl]                     ; 03:768D
    ld   c,a                        ; 03:768E
    ldh  a,[<$FFA8]                 ; 03:768F
    cp   c                          ; 03:7691
    jp   nz,Code037613              ; 03:7692
    ld   hl,Data0375DC              ; 03:7695
    add  hl,de                      ; 03:7698
    ld   a,[hl]                     ; 03:7699
    ld   [W_LevelID],a              ; 03:769A
    jr   Code03766D                 ; 03:769D

Sub03769F:
    ld   a,[W_SPFlag]               ; 03:769F
    and  a                          ; 03:76A2
    jr   z,Code0376AB               ; 03:76A3
    ldh  a,[<$FFA8]                 ; 03:76A5
    and  $F0                        ; 03:76A7
    jr   nz,Code0376ED              ; 03:76A9
Code0376AB:
    ld   de,$000C                   ; 03:76AB
Code0376AE:
    ld   hl,$D2FA                   ; 03:76AE
    add  hl,de                      ; 03:76B1
    ld   a,[hl]                     ; 03:76B2
    cp   $FF                        ; 03:76B3
    jr   z,Code0376C5               ; 03:76B5
    inc  hl                         ; 03:76B7
    inc  hl                         ; 03:76B8
    inc  hl                         ; 03:76B9
    ld   a,[hl]                     ; 03:76BA
    ld   hl,$FFA8                   ; 03:76BB
    and  $F0                        ; 03:76BE
    swap a                          ; 03:76C0
    cp   [hl]                       ; 03:76C2
    jr   z,Code0376F0               ; 03:76C3
Code0376C5:
    dec  e                          ; 03:76C5
    dec  e                          ; 03:76C6
    dec  e                          ; 03:76C7
    dec  e                          ; 03:76C8
    bit  7,e                        ; 03:76C9
    jr   z,Code0376AE               ; 03:76CB
    ld   de,$0000                   ; 03:76CD
    ld   a,[$C283]                  ; 03:76D0
    and  a                          ; 03:76D3
    jr   z,Code0376F0               ; 03:76D4
    ld   de,$0004                   ; 03:76D6
    ld   a,[W_SublevelID]           ; 03:76D9
    cp   $01                        ; 03:76DC
    jr   z,Code0376F0               ; 03:76DE
    ld   de,$0008                   ; 03:76E0
    cp   $0D                        ; 03:76E3
    jr   nz,Code0376ED              ; 03:76E5
    ldh  a,[<$FFA8]                 ; 03:76E7
    cp   $03                        ; 03:76E9
    jr   nz,Code0376F0              ; 03:76EB
Code0376ED:
    ld   de,$0000                   ; 03:76ED
Code0376F0:
    ld   hl,$D2FA                   ; 03:76F0
    add  hl,de                      ; 03:76F3
    ldi  a,[hl]                     ; 03:76F4
    ld   [W_SublevelID],a           ; 03:76F5
    ldi  a,[hl]                     ; 03:76F8
    ldh  [<$FFB9],a                 ; 03:76F9
    ldh  [<$FFA8],a                 ; 03:76FB
    ld   [$C1EE],a                  ; 03:76FD
    xor  a                          ; 03:7700
    ldh  [<$FFB8],a                 ; 03:7701
    ldh  [<$FFAA],a                 ; 03:7703
    ld   a,[hl]                     ; 03:7705
    and  $0F                        ; 03:7706
    swap a                          ; 03:7708
    ldh  [<$FFA7],a                 ; 03:770A
    ldi  a,[hl]                     ; 03:770C
    and  $F0                        ; 03:770D
    ldh  [<$FFA9],a                 ; 03:770F
    call Sub037725                  ; 03:7711
    ld   a,[$C1ED]                  ; 03:7714
    add  $60                        ; 03:7717
    ld   [$C1ED],a                  ; 03:7719
    ld   a,[$C1EE]                  ; 03:771C
    adc  $00                        ; 03:771F
    ld   [$C1EE],a                  ; 03:7721
    ret                             ; 03:7724

Sub037725:
    ld   a,[hl]                     ; 03:7725
    and  $0F                        ; 03:7726
    rst  $00                        ; 03:7728
.dw Code03772F                      ; 03:7729
.dw Code037740                      ; 03:772B
.dw Code037773                      ; 03:772D
Code03772F:
    ld   a,[W_SublevelID]           ; 03:772F
    cp   $15                        ; 03:7732
    jr   nz,Code03773A              ; 03:7734
    ld   a,$38                      ; 03:7736
    ldh  [<$FFBA],a                 ; 03:7738
Code03773A:
    ld   a,$01                      ; 03:773A
    ld   [$C181],a                  ; 03:773C
    ret                             ; 03:773F

Code037740:
    xor  a                          ; 03:7740
    ld   [$C181],a                  ; 03:7741
    inc  a                          ; 03:7744
    ld   [$C170],a                  ; 03:7745
    ld   [$C1E3],a                  ; 03:7748
    ld   [$C1D3],a                  ; 03:774B
    ld   [$C1F3],a                  ; 03:774E
    ld   a,$0B                      ; 03:7751
    ld   [W_PlayerState],a          ; 03:7753
    ldh  a,[<$FFA9]                 ; 03:7756
    sub  $1D                        ; 03:7758
    ld   [$C1E1],a                  ; 03:775A
    ld   a,$40                      ; 03:775D
    ld   [$C1D1],a                  ; 03:775F
    ldh  a,[<$FFA7]                 ; 03:7762
    add  $08                        ; 03:7764
    ldh  [<$FFA7],a                 ; 03:7766
    ldh  a,[<$FFA8]                 ; 03:7768
    adc  $00                        ; 03:776A
    ldh  [<$FFA8],a                 ; 03:776C
    ld   a,$70                      ; 03:776E
    ldh  [<$FFBA],a                 ; 03:7770
    ret                             ; 03:7772

Code037773:
    ld   a,[W_LevelID]              ; 03:7773
    ld   e,a                        ; 03:7776
    ld   d,$00                      ; 03:7777
    ld   a,[W_SPFlag]               ; 03:7779
    and  a                          ; 03:777C
    jr   z,Code037783               ; 03:777D
    ld   a,e                        ; 03:777F
    add  $20                        ; 03:7780
    ld   e,a                        ; 03:7782
Code037783:
    ld   hl,Data034A46              ; 03:7783
    add  hl,de                      ; 03:7786
    ld   a,[hl]                     ; 03:7787
    ld   [$C1EF],a                  ; 03:7788
    xor  a                          ; 03:778B
    ldh  [<$FFB8],a                 ; 03:778C
    ldh  [<$FFB9],a                 ; 03:778E
    ldh  [<$FFBB],a                 ; 03:7790
    ld   [$C3A5],a                  ; 03:7792
    ld   [$C181],a                  ; 03:7795
    ldh  [<$FFA9],a                 ; 03:7798
    inc  a                          ; 03:779A
    ld   [$C170],a                  ; 03:779B
    ld   [$C1D3],a                  ; 03:779E
    ld   [$C1E6],a                  ; 03:77A1
    ldh  [<$FFAA],a                 ; 03:77A4
    ld   a,$70                      ; 03:77A6
    ldh  [<$FFBA],a                 ; 03:77A8
    ld   a,$0E                      ; 03:77AA
    ld   [W_PlayerState],a          ; 03:77AC
    ldh  a,[<$FFA7]                 ; 03:77AF
    sub  $0A                        ; 03:77B1
    ldh  [<$FFA7],a                 ; 03:77B3
    ldh  a,[<$FFA8]                 ; 03:77B5
    sbc  $00                        ; 03:77B7
    ldh  [<$FFA8],a                 ; 03:77B9
    ld   a,$07                      ; 03:77BB
    ld   [$C1C2],a                  ; 03:77BD
    ld   a,$02                      ; 03:77C0
    ld   [$C1C3],a                  ; 03:77C2
    ld   a,[W_SPFlag]               ; 03:77C5
    and  a                          ; 03:77C8
    jr   z,Return0377DE             ; 03:77C9
    ld   a,[W_SublevelID]           ; 03:77CB
    cp   $4F                        ; 03:77CE
    jr   z,Code0377DA               ; 03:77D0
    cp   $44                        ; 03:77D2
    jr   z,Code0377DA               ; 03:77D4
    cp   $35                        ; 03:77D6
    jr   nz,Return0377DE            ; 03:77D8
Code0377DA:
    xor  a                          ; 03:77DA
    ld   [$C1E6],a                  ; 03:77DB
Return0377DE:
    ret                             ; 03:77DE

Sub0377DF:
    ld   hl,$C501                   ; 03:77DF
    jr   Code0377E7                 ; 03:77E2

Sub0377E4:
    ld   hl,$C581                   ; 03:77E4
Code0377E7:
    ldh  a,[<$FFA7]                 ; 03:77E7
    ldi  [hl],a                     ; 03:77E9
    ldh  a,[<$FFA8]                 ; 03:77EA
    ldi  [hl],a                     ; 03:77EC
    ldh  a,[<$FFA9]                 ; 03:77ED
    ldi  [hl],a                     ; 03:77EF
    ldh  a,[<$FFAA]                 ; 03:77F0
    ldi  [hl],a                     ; 03:77F2
    ldh  a,[<$FFAB]                 ; 03:77F3
    ldi  [hl],a                     ; 03:77F5
    ldh  a,[<$FFAC]                 ; 03:77F6
    ldi  [hl],a                     ; 03:77F8
    ldh  a,[<$FFAD]                 ; 03:77F9
    ldi  [hl],a                     ; 03:77FB
    ldh  a,[<$FFAE]                 ; 03:77FC
    ldi  [hl],a                     ; 03:77FE
    ld   de,$0000                   ; 03:77FF
Code037802:
    ld   c,l                        ; 03:7802
    ld   b,h                        ; 03:7803
    ld   hl,W_PlayerState           ; 03:7804
    add  hl,de                      ; 03:7807
    ld   a,[hl]                     ; 03:7808
    ld   l,c                        ; 03:7809
    ld   h,b                        ; 03:780A
    ldi  [hl],a                     ; 03:780B
    inc  e                          ; 03:780C
    ld   a,e                        ; 03:780D
    cp   $4D                        ; 03:780E
    jr   nz,Code037802              ; 03:7810
    ret                             ; 03:7812

SubL_037813:
    call Sub037817                  ; 03:7813
    rst  $18                        ; 03:7816

Sub037817:
    ld   hl,$C501                   ; 03:7817
    jr   Code03781F                 ; 03:781A

Sub03781C:
    ld   hl,$C581                   ; 03:781C
Code03781F:
    ldi  a,[hl]                     ; 03:781F
    ldh  [<$FFA7],a                 ; 03:7820
    ldi  a,[hl]                     ; 03:7822
    ldh  [<$FFA8],a                 ; 03:7823
    ldi  a,[hl]                     ; 03:7825
    ldh  [<$FFA9],a                 ; 03:7826
    ldi  a,[hl]                     ; 03:7828
    ldh  [<$FFAA],a                 ; 03:7829
    ldi  a,[hl]                     ; 03:782B
    ldh  [<$FFAB],a                 ; 03:782C
    ldi  a,[hl]                     ; 03:782E
    ldh  [<$FFAC],a                 ; 03:782F
    ldi  a,[hl]                     ; 03:7831
    ldh  [<$FFAD],a                 ; 03:7832
    ldi  a,[hl]                     ; 03:7834
    ldh  [<$FFAE],a                 ; 03:7835
    ld   de,$0000                   ; 03:7837
Code03783A:
    ldi  a,[hl]                     ; 03:783A
    ld   c,l                        ; 03:783B
    ld   b,h                        ; 03:783C
    ld   hl,W_PlayerState           ; 03:783D
    add  hl,de                      ; 03:7840
    ld   [hl],a                     ; 03:7841
    ld   l,c                        ; 03:7842
    ld   h,b                        ; 03:7843
    inc  e                          ; 03:7844
    ld   a,e                        ; 03:7845
    cp   $4D                        ; 03:7846
    jr   nz,Code03783A              ; 03:7848
    ret                             ; 03:784A

Data03784B:                         ; 03:784B
.db $00,$4B,$40,$4B,$80,$4B,$C0,$4B
Data037853:                         ; 03:7853
.db $40,$4C,$50,$4C,$60,$4C,$70,$4C
Data03785B:                         ; 03:785B
.db $00,$4C,$10,$4C,$20,$4C,$30,$4C

Sub037863:
    ld   a,[$C283]                  ; 03:7863
    and  a                          ; 03:7866
    jr   z,Code03788F               ; 03:7867
    ldh  a,[<$FFB7]                 ; 03:7869
    and  $03                        ; 03:786B
    and  a                          ; 03:786D
    jr   nz,Code03788F              ; 03:786E
    ld   a,[$C385]                  ; 03:7870
    inc  a                          ; 03:7873
    and  $03                        ; 03:7874
    ld   [$C385],a                  ; 03:7876
    sla  a                          ; 03:7879
    ld   e,a                        ; 03:787B
    ld   d,$00                      ; 03:787C
    ld   hl,Data03784B              ; 03:787E
    add  hl,de                      ; 03:7881
    ldi  a,[hl]                     ; 03:7882
    ld   [$C377],a                  ; 03:7883
    ld   a,[hl]                     ; 03:7886
    ld   [$C378],a                  ; 03:7887
    ld   a,$01                      ; 03:788A
    ld   [$C376],a                  ; 03:788C
Code03788F:
    ldh  a,[<$FFB7]                 ; 03:788F
    and  $0F                        ; 03:7891
    and  a                          ; 03:7893
    jr   nz,Code0378B5              ; 03:7894
    ld   a,[$C380]                  ; 03:7896
    inc  a                          ; 03:7899
    and  $03                        ; 03:789A
    ld   [$C380],a                  ; 03:789C
    sla  a                          ; 03:789F
    ld   e,a                        ; 03:78A1
    ld   d,$00                      ; 03:78A2
    ld   hl,Data03785B              ; 03:78A4
    add  hl,de                      ; 03:78A7
    ldi  a,[hl]                     ; 03:78A8
    ld   [$C37E],a                  ; 03:78A9
    ld   a,[hl]                     ; 03:78AC
    ld   [$C37F],a                  ; 03:78AD
    ld   a,$01                      ; 03:78B0
    ld   [$C37D],a                  ; 03:78B2
Code0378B5:
    ldh  a,[<$FFB7]                 ; 03:78B5
    and  $07                        ; 03:78B7
    and  a                          ; 03:78B9
    jr   nz,Return0378DB            ; 03:78BA
    ld   a,[$C37C]                  ; 03:78BC
    inc  a                          ; 03:78BF
    and  $03                        ; 03:78C0
    ld   [$C37C],a                  ; 03:78C2
    sla  a                          ; 03:78C5
    ld   e,a                        ; 03:78C7
    ld   d,$00                      ; 03:78C8
    ld   hl,Data037853              ; 03:78CA
    add  hl,de                      ; 03:78CD
    ldi  a,[hl]                     ; 03:78CE
    ld   [$C37A],a                  ; 03:78CF
    ld   a,[hl]                     ; 03:78D2
    ld   [$C37B],a                  ; 03:78D3
    ld   a,$01                      ; 03:78D6
    ld   [$C379],a                  ; 03:78D8
Return0378DB:
    ret                             ; 03:78DB

Data0378DC:                         ; 03:78DC
.db $00,$48,$40,$48,$80,$48,$C0,$48,\
    $00,$49,$40,$49,$80,$49,$C0,$49,\
    $00,$4A,$40,$4A,$80,$4A,$C0,$4A
Data0378F4:                         ; 03:78F4
.db $00,$06

Sub0378F6:
    ld   a,[$C3A2]                  ; 03:78F6
    bit  0,a                        ; 03:78F9
    ret  z                          ; 03:78FB
    ld   hl,$C38D                   ; 03:78FC
    ld   a,[hl]                     ; 03:78FF
    cp   $01                        ; 03:7900
    jr   z,Code037906               ; 03:7902
    jr   Code03790D                 ; 03:7904
Code037906:
    ld   hl,$C384                   ; 03:7906
    ld   a,[hl]                     ; 03:7909
    and  a                          ; 03:790A
    jr   z,Code03790F               ; 03:790B
Code03790D:
    dec  [hl]                       ; 03:790D
    ret                             ; 03:790E

Code03790F:
    ld   [hl],$3C                   ; 03:790F
    push hl                         ; 03:7911
    ld   a,[$C3E7]                  ; 03:7912
    ld   e,a                        ; 03:7915
    ld   d,$00                      ; 03:7916
    ld   hl,Data0378F4              ; 03:7918
    add  hl,de                      ; 03:791B
    ld   e,[hl]                     ; 03:791C
    pop  hl                         ; 03:791D
    ld   a,[$C385]                  ; 03:791E
    inc  a                          ; 03:7921
    cp   $0C                        ; 03:7922
    jr   c,Code037927               ; 03:7924
    xor  a                          ; 03:7926
Code037927:
    ld   [$C385],a                  ; 03:7927
    cp   $00                        ; 03:792A
    jr   z,Sub03794C                ; 03:792C
    cp   $01                        ; 03:792E
    jr   z,Code037946               ; 03:7930
    cp   $02                        ; 03:7932
    jr   z,Code037946               ; 03:7934
    cp   $06                        ; 03:7936
    jr   z,Sub03794C                ; 03:7938
    cp   $07                        ; 03:793A
    jr   z,Code037946               ; 03:793C
    cp   $08                        ; 03:793E
    jr   z,Code037946               ; 03:7940
    ld   [hl],$04                   ; 03:7942
    jr   Sub03794C                  ; 03:7944
Code037946:
    push af                         ; 03:7946
    ld   a,$47                      ; 03:7947
    ldh  [<$FFF2],a                 ; 03:7949
    pop  af                         ; 03:794B

Sub03794C:
    push af                         ; 03:794C
    add  e                          ; 03:794D
    cp   $0C                        ; 03:794E
    jr   c,Code037954               ; 03:7950
    sub  $0C                        ; 03:7952
Code037954:
    sla  a                          ; 03:7954
    ld   e,a                        ; 03:7956
    ld   d,$00                      ; 03:7957
    ld   hl,Data0378DC              ; 03:7959
    add  hl,de                      ; 03:795C
    ldi  a,[hl]                     ; 03:795D
    ld   [$C386],a                  ; 03:795E
    ld   a,[hl]                     ; 03:7961
    ld   [$C387],a                  ; 03:7962
    ld   a,$01                      ; 03:7965
    ld   [$C388],a                  ; 03:7967
    pop  af                         ; 03:796A
    cp   $03                        ; 03:796B
    jr   z,Code037972               ; 03:796D
    cp   $09                        ; 03:796F
    ret  nz                         ; 03:7971
Code037972:
    ld   a,$60                      ; 03:7972
    ldh  [<$FFF2],a                 ; 03:7974
    ld   a,$01                      ; 03:7976
    ldh  [<$FF9B],a                 ; 03:7978
    ld   a,$03                      ; 03:797A
    rst  $10                        ; 03:797C
.dl SubL_074022                     ; 03:797D
    ret                             ; 03:7980

Sub037981:
    ld   a,[$C3A2]                  ; 03:7981
    bit  0,a                        ; 03:7984
    jr   nz,Code037989              ; 03:7986
    ret                             ; 03:7988

Code037989:
    ld   a,$3C                      ; 03:7989
    ld   [$C384],a                  ; 03:798B
    ld   a,[$C3E7]                  ; 03:798E
    ld   e,a                        ; 03:7991
    ld   d,$00                      ; 03:7992
    ld   hl,Data0378F4              ; 03:7994
    add  hl,de                      ; 03:7997
    ld   e,[hl]                     ; 03:7998
    sla  e                          ; 03:7999
    ld   hl,Data0378DC              ; 03:799B
    add  hl,de                      ; 03:799E
    ldi  a,[hl]                     ; 03:799F
    ld   [$C386],a                  ; 03:79A0
    ld   a,[hl]                     ; 03:79A3
    ld   [$C387],a                  ; 03:79A4
    ld   a,$01                      ; 03:79A7
    ld   [$C388],a                  ; 03:79A9
    ret                             ; 03:79AC

Sub0379AD:
    ld   hl,$C1F8                   ; 03:79AD
    ld   a,[hl]                     ; 03:79B0
    and  a                          ; 03:79B1
    jr   z,Return0379CB             ; 03:79B2
    ld   a,[$C1F9]                  ; 03:79B4
    and  a                          ; 03:79B7
    jr   z,Code0379C2               ; 03:79B8
    ld   a,[$C1F9]                  ; 03:79BA
    dec  a                          ; 03:79BD
    ld   [$C1F9],a                  ; 03:79BE
    ret                             ; 03:79C1
Code0379C2:
    ld   a,$08                      ; 03:79C2
    ld   [$C1F9],a                  ; 03:79C4
    dec  [hl]                       ; 03:79C7
    call Sub002D66                  ; 03:79C8
Return0379CB:
    ret                             ; 03:79CB

SubL_0379CC:
    call Sub0359E4                  ; 03:79CC
    rst  $18                        ; 03:79CF
