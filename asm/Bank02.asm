.bank $02 slot 1
.orga $4000

Return024000:
; sprite 01,0A-0E,1D-1E,20-21,23,25,2F-30,35,3D-41,43-45,48 init, 49-4C,4E-4F main
    ret                             ; 02:4000

Data024001:                         ; 02:4001
.db $00,$00,$06,$00
Data024005:                         ; 02:4005
.db $C0,$40

SubL_024007:
    xor  a                          ; 02:4007
    ldh  [<$FF97],a                 ; 02:4008
    ld   bc,$0000                   ; 02:400A
Code02400D:
    ld   hl,W_SpriteStatus          ; 02:400D
    add  hl,bc                      ; 02:4010
    ld   a,[hl]                     ; 02:4011
    and  a                          ; 02:4012
    jr   z,Code024023               ; 02:4013
    ld   hl,W_SpriteID              ; 02:4015
    add  hl,bc                      ; 02:4018
    ld   a,[hl]                     ; 02:4019
    cp   $0D                        ; 02:401A
    jr   nz,Code024023              ; 02:401C
    ldh  a,[<$FF97]                 ; 02:401E
    inc  a                          ; 02:4020
    ldh  [<$FF97],a                 ; 02:4021
Code024023:
    inc  c                          ; 02:4023
    ld   a,c                        ; 02:4024
    cp   $0F                        ; 02:4025
    jr   nz,Code02400D              ; 02:4027
    ldh  a,[<$FF97]                 ; 02:4029
    cp   $02                        ; 02:402B
    jp   nc,ReturnL_0240A5          ; 02:402D

SubL_024030:
    ld   a,$0D                      ; 02:4030
    call LoadSpriteAnySlot          ; 02:4032
    jr   c,ReturnL_0240A5           ; 02:4035
    ld   a,e                        ; 02:4037
    and  $01                        ; 02:4038
    ldh  [<$FF99],a                 ; 02:403A
    ld   a,[$C1C3]                  ; 02:403C
    ld   c,a                        ; 02:403F
    ld   b,$00                      ; 02:4040
    ld   hl,Data024001              ; 02:4042
    add  hl,bc                      ; 02:4045
    ldh  a,[<H_PlayerXLow]          ; 02:4046
    add  [hl]                       ; 02:4048
    ldh  [<$FF97],a                 ; 02:4049
    inc  hl                         ; 02:404B
    ldh  a,[<H_PlayerXHigh]         ; 02:404C
    adc  [hl]                       ; 02:404E
    ldh  [<$FF98],a                 ; 02:404F
    ld   hl,$FF97                   ; 02:4051
    ldh  a,[<$FF99]                 ; 02:4054
    add  [hl]                       ; 02:4056
    ld   [hl],a                     ; 02:4057
    ld   hl,$FF98                   ; 02:4058
    ld   a,$00                      ; 02:405B
    adc  [hl]                       ; 02:405D
    ld   [hl],a                     ; 02:405E
    ld   hl,W_SpriteXLow            ; 02:405F
    add  hl,de                      ; 02:4062
    ldh  a,[<$FF97]                 ; 02:4063
    ld   [hl],a                     ; 02:4065
    ld   hl,W_SpriteXHigh           ; 02:4066
    add  hl,de                      ; 02:4069
    ldh  a,[<$FF98]                 ; 02:406A
    ld   [hl],a                     ; 02:406C
    ld   hl,W_SpriteYHigh           ; 02:406D
    add  hl,de                      ; 02:4070
    push hl                         ; 02:4071
    ld   hl,W_SpriteYLow            ; 02:4072
    add  hl,de                      ; 02:4075
    ldh  a,[<H_PlayerYLow]          ; 02:4076
    add  $05                        ; 02:4078
    ld   [hl],a                     ; 02:407A
    pop  hl                         ; 02:407B
    ldh  a,[<H_PlayerYHigh]         ; 02:407C
    adc  $00                        ; 02:407E
    ld   [hl],a                     ; 02:4080
    ld   a,[$C1C3]                  ; 02:4081
    srl  a                          ; 02:4084
    ld   c,a                        ; 02:4086
    ld   b,$00                      ; 02:4087
    ld   hl,Data024005              ; 02:4089
    add  hl,bc                      ; 02:408C
    ld   a,[hl]                     ; 02:408D
    ld   hl,W_SpriteXSpeed          ; 02:408E
    add  hl,de                      ; 02:4091
    ld   [hl],a                     ; 02:4092
    ld   hl,W_SpriteYSpeed          ; 02:4093
    add  hl,de                      ; 02:4096
    ld   [hl],$40                   ; 02:4097
    ld   hl,$D0FF                   ; 02:4099
    add  hl,de                      ; 02:409C
    ld   a,[$C366]                  ; 02:409D
    ld   [hl],a                     ; 02:40A0
    ld   a,$48                      ; 02:40A1
    ldh  [<$FFF2],a                 ; 02:40A3
ReturnL_0240A5:
    rst  $18                        ; 02:40A5  Return from 24-bit call

MarioFireball_Main:
; sprite 0D main
    call Sub0025CB                  ; 02:40A6
    jp   c,Code0240C5               ; 02:40A9
    call Sub002920                  ; 02:40AC
    jp   c,Code0240C5               ; 02:40AF
    call Sub0029DA                  ; 02:40B2
    ld   hl,W_SpriteSubstate        ; 02:40B5
    add  hl,bc                      ; 02:40B8
    ld   a,[hl]                     ; 02:40B9
    and  a                          ; 02:40BA
    jr   z,Code0240C2               ; 02:40BB
    call Sub024359                  ; 02:40BD
    jr   Code0240C5                 ; 02:40C0
Code0240C2:
    call Sub024183                  ; 02:40C2
Code0240C5:
    ld   hl,W_SpriteSubstate        ; 02:40C5
    add  hl,bc                      ; 02:40C8
    ld   a,[hl]                     ; 02:40C9
    and  a                          ; 02:40CA
    jr   z,Code0240D2               ; 02:40CB
    call Sub0243EF                  ; 02:40CD
    jr   Return0240D5               ; 02:40D0
Code0240D2:
    call Sub024383                  ; 02:40D2
Return0240D5:
    ret                             ; 02:40D5

Sub0240D6:
    ld   hl,$D195                   ; 02:40D6
    add  hl,de                      ; 02:40D9
    ld   a,[hl]                     ; 02:40DA
    jr   nz,Code024127              ; 02:40DB
    ld   hl,$D285                   ; 02:40DD
    add  hl,de                      ; 02:40E0
    ld   [hl],$1E                   ; 02:40E1
    push de                         ; 02:40E3
    ld   a,[W_GameMode]             ; 02:40E4
    cp   $02                        ; 02:40E7
    jr   nz,Code0240F6              ; 02:40E9
    ld   hl,$D285                   ; 02:40EB
    add  hl,de                      ; 02:40EE
    ld   [hl],$22                   ; 02:40EF
    call Sub00243A                  ; 02:40F1
    jr   Code0240F9                 ; 02:40F4
Code0240F6:
    call Sub00218B                  ; 02:40F6
Code0240F9:
    pop  hl                         ; 02:40F9
    rl   a                          ; 02:40FA
    ldh  [<$FF97],a                 ; 02:40FC
    ld   a,l                        ; 02:40FE
    ldh  [<$FF98],a                 ; 02:40FF
    ldh  a,[<$FF97]                 ; 02:4101
    and  $01                        ; 02:4103
    jr   nz,Code02416F              ; 02:4105
    ld   a,[W_GameMode]             ; 02:4107
    cp   $02                        ; 02:410A
    jr   z,Code02416F               ; 02:410C
    ld   d,$00                      ; 02:410E
    ldh  a,[<$FF98]                 ; 02:4110
    ld   e,a                        ; 02:4112
    ld   hl,$D285                   ; 02:4113
    add  hl,de                      ; 02:4116
    ld   [hl],$0A                   ; 02:4117
    push de                         ; 02:4119
    call Sub00218B                  ; 02:411A
    pop  hl                         ; 02:411D
    rl   a                          ; 02:411E
    ldh  [<$FF97],a                 ; 02:4120
    ld   a,l                        ; 02:4122
    ldh  [<$FF98],a                 ; 02:4123
    jr   Code02416F                 ; 02:4125
Code024127:
    ld   hl,$D285                   ; 02:4127
    add  hl,de                      ; 02:412A
    ld   [hl],$1F                   ; 02:412B
    push de                         ; 02:412D
    ld   a,[W_GameMode]             ; 02:412E
    cp   $02                        ; 02:4131
    jr   nz,Code024140              ; 02:4133
    ld   hl,$D285                   ; 02:4135
    add  hl,de                      ; 02:4138
    ld   [hl],$22                   ; 02:4139
    call Sub00243A                  ; 02:413B
    jr   Code024143                 ; 02:413E
Code024140:
    call Sub00218B                  ; 02:4140
Code024143:
    pop  hl                         ; 02:4143
    rl   a                          ; 02:4144
    ldh  [<$FF97],a                 ; 02:4146
    ld   a,l                        ; 02:4148
    ldh  [<$FF98],a                 ; 02:4149
    ldh  a,[<$FF97]                 ; 02:414B
    and  $01                        ; 02:414D
    jr   nz,Code02416F              ; 02:414F
    ld   a,[W_GameMode]             ; 02:4151
    cp   $02                        ; 02:4154
    jr   z,Code02416F               ; 02:4156
    ld   d,$00                      ; 02:4158
    ldh  a,[<$FF98]                 ; 02:415A
    ld   e,a                        ; 02:415C
    ld   hl,$D285                   ; 02:415D
    add  hl,de                      ; 02:4160
    ld   [hl],$20                   ; 02:4161
    push de                         ; 02:4163
    call Sub00218B                  ; 02:4164
    pop  hl                         ; 02:4167
    rl   a                          ; 02:4168
    ldh  [<$FF97],a                 ; 02:416A
    ld   a,l                        ; 02:416C
    ldh  [<$FF98],a                 ; 02:416D
Code02416F:
    ldh  a,[<$FF98]                 ; 02:416F
    ld   c,a                        ; 02:4171
    ld   b,$00                      ; 02:4172
    ld   hl,$D285                   ; 02:4174
    add  hl,bc                      ; 02:4177
    ld   [hl],$0A                   ; 02:4178
    ld   a,[$C414]                  ; 02:417A
    ld   c,a                        ; 02:417D
    ldh  a,[<$FF97]                 ; 02:417E
    srl  a                          ; 02:4180
    ret                             ; 02:4182

Sub024183:
    call Sub001A3D                  ; 02:4183
    call Sub001A79                  ; 02:4186
    ld   hl,W_SpriteYSpeed          ; 02:4189
    add  hl,bc                      ; 02:418C
    ld   a,$05                      ; 02:418D
    add  [hl]                       ; 02:418F
    bit  7,a                        ; 02:4190
    jr   nz,Code02419B              ; 02:4192
    cp   $30                        ; 02:4194
    jp   c,Code02419B               ; 02:4196
    ld   a,$30                      ; 02:4199
Code02419B:
    ld   [hl],a                     ; 02:419B
    ld   a,$02                      ; 02:419C
    rst  $10                        ; 02:419E  24-bit call
.dl SubL_074155                     ; 02:419F
    ld   hl,W_SpriteYHigh           ; 02:41A2
    add  hl,bc                      ; 02:41A5
    ld   a,[hl]                     ; 02:41A6
    bit  7,a                        ; 02:41A7
    jp   nz,Code0242D6              ; 02:41A9
    ld   de,$0000                   ; 02:41AC
    ld   hl,W_SpriteID              ; 02:41AF
Code0241B2:
    ldi  a,[hl]                     ; 02:41B2
    cp   $1A                        ; 02:41B3
    jr   nz,Code0241BF              ; 02:41B5
    call Sub0240D6                  ; 02:41B7
    jp   nc,Code0242D6              ; 02:41BA
    jr   Code0241D7                 ; 02:41BD
Code0241BF:
    inc  e                          ; 02:41BF
    ld   a,e                        ; 02:41C0
    cp   $0F                        ; 02:41C1
    jr   nz,Code0241B2              ; 02:41C3
    ld   a,[W_GameMode]             ; 02:41C5
    cp   $02                        ; 02:41C8
    jr   nz,Code0241D1              ; 02:41CA
    call Sub00243A                  ; 02:41CC
    jr   Code0241D4                 ; 02:41CF
Code0241D1:
    call Sub00218B                  ; 02:41D1
Code0241D4:
    jp   nc,Code0242D6              ; 02:41D4
Code0241D7:
    ld   hl,W_SpriteYHigh           ; 02:41D7
    add  hl,de                      ; 02:41DA
    ld   a,[hl]                     ; 02:41DB
    and  a                          ; 02:41DC
    jp   nz,Code0242D6              ; 02:41DD
    ld   hl,$D1A4                   ; 02:41E0
    add  hl,de                      ; 02:41E3
    ld   a,[hl]                     ; 02:41E4
    and  a                          ; 02:41E5
    jp   nz,Code0242D6              ; 02:41E6
    xor  a                          ; 02:41E9
    ldh  [<$FFA6],a                 ; 02:41EA
    ld   hl,$D2A3                   ; 02:41EC
    add  hl,de                      ; 02:41EF
    ld   a,[hl]                     ; 02:41F0
    bit  1,a                        ; 02:41F1
    jp   nz,Code0242C4              ; 02:41F3
    bit  2,a                        ; 02:41F6
    jp   z,Code0242D6               ; 02:41F8
    bit  3,a                        ; 02:41FB
    jr   z,Code02420C               ; 02:41FD
    and  $F0                        ; 02:41FF
    swap a                          ; 02:4201
    ld   hl,W_SpriteSubstate        ; 02:4203
    add  hl,de                      ; 02:4206
    ld   [hl],a                     ; 02:4207
    ld   a,$01                      ; 02:4208
    ldh  [<$FFA6],a                 ; 02:420A
Code02420C:
    ld   hl,W_SpriteID              ; 02:420C
    add  hl,de                      ; 02:420F
    ld   a,[hl]                     ; 02:4210
    cp   $2E                        ; 02:4211
    jr   z,Code024225               ; 02:4213
    cp   $2C                        ; 02:4215
    jr   z,Code024225               ; 02:4217
    cp   $23                        ; 02:4219
    jr   z,Code024225               ; 02:421B
    cp   $05                        ; 02:421D
    jr   c,Code024228               ; 02:421F
    cp   $09                        ; 02:4221
    jr   nc,Code024228              ; 02:4223
Code024225:
    xor  a                          ; 02:4225
    jr   Code024237                 ; 02:4226
Code024228:
    ld   a,$12                      ; 02:4228
    ldh  [<$FF97],a                 ; 02:422A
    ld   hl,W_SpriteXSpeed          ; 02:422C
    add  hl,bc                      ; 02:422F
    ld   a,[hl]                     ; 02:4230
    bit  7,a                        ; 02:4231
    jr   z,Code024239               ; 02:4233
    ld   a,$EE                      ; 02:4235
Code024237:
    ldh  [<$FF97],a                 ; 02:4237
Code024239:
    ld   hl,W_SpriteXSpeed          ; 02:4239
    add  hl,de                      ; 02:423C
    ldh  a,[<$FF97]                 ; 02:423D
    ld   [hl],a                     ; 02:423F
    ldh  a,[<$FFA6]                 ; 02:4240
    and  a                          ; 02:4242
    jr   z,Code024256               ; 02:4243
    ld   hl,W_SpriteID              ; 02:4245
    add  hl,de                      ; 02:4248
    ld   a,[hl]                     ; 02:4249
    cp   $17                        ; 02:424A
    jr   nz,Code02427F              ; 02:424C
    ld   hl,W_SpriteYSpeed          ; 02:424E
    add  hl,de                      ; 02:4251
    ld   [hl],$CE                   ; 02:4252
    jr   Code02427F                 ; 02:4254
Code024256:
    push de                         ; 02:4256
    push bc                         ; 02:4257
    ld   c,e                        ; 02:4258
    ld   b,d                        ; 02:4259
    call Sub0019C1                  ; 02:425A
    pop  bc                         ; 02:425D
    pop  de                         ; 02:425E
    ld   hl,W_SpriteID              ; 02:425F
    add  hl,de                      ; 02:4262
    ld   a,[hl]                     ; 02:4263
    cp   $2C                        ; 02:4264
    jr   z,Code024274               ; 02:4266
    cp   $23                        ; 02:4268
    jr   z,Code024278               ; 02:426A
    cp   $05                        ; 02:426C
    jr   c,Code02427F               ; 02:426E
    cp   $09                        ; 02:4270
    jr   nc,Code02427F              ; 02:4272
Code024274:
    ld   a,$EC                      ; 02:4274
    jr   Code02427A                 ; 02:4276
Code024278:
    ld   a,$D4                      ; 02:4278
Code02427A:
    ld   hl,W_SpriteYSpeed          ; 02:427A
    add  hl,de                      ; 02:427D
    ld   [hl],a                     ; 02:427E
Code02427F:
    ld   hl,$D2B2                   ; 02:427F
    add  hl,de                      ; 02:4282
    ld   a,[hl]                     ; 02:4283
    and  $0F                        ; 02:4284
    cp   $00                        ; 02:4286
    jr   z,Code0242EC               ; 02:4288
    push bc                         ; 02:428A
    dec  a                          ; 02:428B
    ld   c,a                        ; 02:428C
    ld   b,$00                      ; 02:428D
    sla  c                          ; 02:428F
    sla  c                          ; 02:4291
    ld   hl,Data002F1E              ; 02:4293
    add  hl,bc                      ; 02:4296
    ld   bc,$0003                   ; 02:4297
    add  hl,bc                      ; 02:429A
    ld   a,[hl]                     ; 02:429B
    cp   $00                        ; 02:429C
    jr   z,Code0242C1               ; 02:429E
    dec  a                          ; 02:42A0
    ldh  [<$FF9B],a                 ; 02:42A1
    sla  a                          ; 02:42A3
    ld   c,a                        ; 02:42A5
    ld   b,$00                      ; 02:42A6
    ld   hl,ScoreSpriteValues       ; 02:42A8
    add  hl,bc                      ; 02:42AB
    ldi  a,[hl]                     ; 02:42AC
    ldh  [<$FF97],a                 ; 02:42AD
    ld   a,[hl]                     ; 02:42AF
    ldh  [<$FF98],a                 ; 02:42B0
    call GivePointsFF97             ; 02:42B2
    ld   c,e                        ; 02:42B5
    ld   b,d                        ; 02:42B6
    call SpawnScoreSprite           ; 02:42B7
    ld   a,$45                      ; 02:42BA
    ldh  [<$FFF2],a                 ; 02:42BC
    call Sub027C62                  ; 02:42BE
Code0242C1:
    pop  bc                         ; 02:42C1
    jr   Code0242EC                 ; 02:42C2
Code0242C4:
    ld   hl,W_SpriteID              ; 02:42C4
    add  hl,de                      ; 02:42C7
    ld   a,[hl]                     ; 02:42C8
    cp   $25                        ; 02:42C9
    jr   z,Code0242EC               ; 02:42CB
    cp   $31                        ; 02:42CD
    jr   z,Code0242EC               ; 02:42CF
    xor  a                          ; 02:42D1
    ldh  [<$FF97],a                 ; 02:42D2
    jr   Code0242F0                 ; 02:42D4
Code0242D6:
    ld   hl,W_SpriteYHigh           ; 02:42D6
    add  hl,bc                      ; 02:42D9
    ld   a,[hl]                     ; 02:42DA
    bit  7,a                        ; 02:42DB
    jr   nz,Code02432A              ; 02:42DD
    ld   a,$04                      ; 02:42DF
    ldh  [<$FFA3],a                 ; 02:42E1
    ld   a,$04                      ; 02:42E3
    ldh  [<$FFA4],a                 ; 02:42E5
    call Sub001C71                  ; 02:42E7
    jr   nc,Code02432A              ; 02:42EA
Code0242EC:
    ld   a,$01                      ; 02:42EC
    ldh  [<$FF97],a                 ; 02:42EE
Code0242F0:
    ld   hl,W_SpriteSubstate        ; 02:42F0
    add  hl,bc                      ; 02:42F3
    inc  [hl]                       ; 02:42F4
    ld   hl,$D177                   ; 02:42F5
    add  hl,bc                      ; 02:42F8
    ld   [hl],$00                   ; 02:42F9
    ld   hl,$D096                   ; 02:42FB
    add  hl,bc                      ; 02:42FE
    ld   [hl],$02                   ; 02:42FF
    ld   hl,W_SpriteXSpeed          ; 02:4301
    add  hl,bc                      ; 02:4304
    ld   a,[hl]                     ; 02:4305
    bit  7,a                        ; 02:4306
    jr   z,Code02431C               ; 02:4308
    ld   hl,W_SpriteXHigh           ; 02:430A
    add  hl,bc                      ; 02:430D
    push hl                         ; 02:430E
    ld   hl,W_SpriteXLow            ; 02:430F
    add  hl,bc                      ; 02:4312
    ld   a,[hl]                     ; 02:4313
    sub  $06                        ; 02:4314
    ld   [hl],a                     ; 02:4316
    pop  hl                         ; 02:4317
    ld   a,[hl]                     ; 02:4318
    sbc  $00                        ; 02:4319
    ld   [hl],a                     ; 02:431B
Code02431C:
    ldh  a,[<$FF97]                 ; 02:431C
    and  a                          ; 02:431E
    ret  z                          ; 02:431F
    ldh  a,[<$FFF2]                 ; 02:4320
    cp   $45                        ; 02:4322
    ret  z                          ; 02:4324
    ld   a,$43                      ; 02:4325
    ldh  [<$FFF2],a                 ; 02:4327
    ret                             ; 02:4329

Code02432A:
    call Sub001BCF                  ; 02:432A
    ldh  a,[<$FFA5]                 ; 02:432D
    and  $01                        ; 02:432F
    jr   z,Code02434A               ; 02:4331
    ld   hl,W_SpriteYLow            ; 02:4333
    add  hl,bc                      ; 02:4336
    ld   a,[hl]                     ; 02:4337
    and  $F8                        ; 02:4338
    ld   [hl],a                     ; 02:433A
    ld   hl,W_SpriteYSpeed          ; 02:433B
    add  hl,bc                      ; 02:433E
    ld   [hl],$D8                   ; 02:433F
    call Sub0010E4                  ; 02:4341
    and  $01                        ; 02:4344
    jr   z,Code02434A               ; 02:4346
    ld   [hl],$E0                   ; 02:4348
Code02434A:
    ldh  a,[<H_GlobalTimer]         ; 02:434A
    and  $03                        ; 02:434C
    ret  nz                         ; 02:434E
    ld   hl,$D177                   ; 02:434F
    add  hl,bc                      ; 02:4352
    ld   a,[hl]                     ; 02:4353
    inc  a                          ; 02:4354
    and  $03                        ; 02:4355
    ld   [hl],a                     ; 02:4357
    ret                             ; 02:4358

Sub024359:
    ld   hl,$D096                   ; 02:4359
    add  hl,bc                      ; 02:435C
    ld   a,[hl]                     ; 02:435D
    dec  a                          ; 02:435E
    ld   [hl],a                     ; 02:435F
    jr   nz,Return02437A            ; 02:4360
    ld   [hl],$02                   ; 02:4362
    ld   hl,$D177                   ; 02:4364
    add  hl,bc                      ; 02:4367
    ld   a,[hl]                     ; 02:4368
    inc  a                          ; 02:4369
    ld   [hl],a                     ; 02:436A
    cp   $03                        ; 02:436B
    jr   nz,Return02437A            ; 02:436D
    xor  a                          ; 02:436F
    ld   hl,W_SpriteStatus          ; 02:4370
    add  hl,bc                      ; 02:4373
    ld   [hl],a                     ; 02:4374
    ld   hl,W_SpriteID              ; 02:4375
    add  hl,bc                      ; 02:4378
    ld   [hl],a                     ; 02:4379
Return02437A:
    ret                             ; 02:437A

Data02437B:                         ; 02:437B
.db $5C,$06,$5E,$06,$5C,$66,$5E,$66

Sub024383:
    ld   hl,W_SpriteXLow            ; 02:4383
    add  hl,bc                      ; 02:4386
    ld   a,[hl]                     ; 02:4387
    ldh  [<$FF98],a                 ; 02:4388
    ld   hl,W_SpriteXHigh           ; 02:438A
    add  hl,bc                      ; 02:438D
    ld   a,[hl]                     ; 02:438E
    ldh  [<$FF99],a                 ; 02:438F
    ld   hl,W_SpriteYHigh           ; 02:4391
    add  hl,bc                      ; 02:4394
    push hl                         ; 02:4395
    ld   d,$00                      ; 02:4396
    ld   hl,$D177                   ; 02:4398
    add  hl,bc                      ; 02:439B
    ld   a,[hl]                     ; 02:439C
    ld   e,a                        ; 02:439D
    sla  e                          ; 02:439E
    and  $02                        ; 02:43A0
    jr   nz,Code0243B1              ; 02:43A2
    ld   hl,W_SpriteYLow            ; 02:43A4
    add  hl,bc                      ; 02:43A7
    ld   a,[hl]                     ; 02:43A8
    ldh  [<$FF97],a                 ; 02:43A9
    pop  hl                         ; 02:43AB
    ld   a,[hl]                     ; 02:43AC
    ldh  [<$FF9B],a                 ; 02:43AD
    jr   Code0243C0                 ; 02:43AF
Code0243B1:
    ld   hl,W_SpriteYLow            ; 02:43B1
    add  hl,bc                      ; 02:43B4
    ld   a,[hl]                     ; 02:43B5
    sub  $08                        ; 02:43B6
    ldh  [<$FF97],a                 ; 02:43B8
    pop  hl                         ; 02:43BA
    ld   a,[hl]                     ; 02:43BB
    sbc  $00                        ; 02:43BC
    ldh  [<$FF9B],a                 ; 02:43BE
Code0243C0:
    ldh  a,[<$FF97]                 ; 02:43C0
    add  $10                        ; 02:43C2
    ldh  [<$FFA5],a                 ; 02:43C4
    ldh  a,[<$FF9B]                 ; 02:43C6
    adc  $00                        ; 02:43C8
    ldh  [<$FFA6],a                 ; 02:43CA
    ld   hl,H_CameraY               ; 02:43CC
    ldh  a,[<$FFA5]                 ; 02:43CF
    sub  [hl]                       ; 02:43D1
    ld   hl,$FFBB                   ; 02:43D2
    ldh  a,[<$FFA6]                 ; 02:43D5
    sbc  [hl]                       ; 02:43D7
    bit  7,a                        ; 02:43D8
    ret  nz                         ; 02:43DA
    ld   hl,Data02437B              ; 02:43DB
    add  hl,de                      ; 02:43DE
    call Sub002861                  ; 02:43DF
    ret                             ; 02:43E2

Data0243E3:                         ; 02:43E3
.db $20,$06,$20,$26,$1E,$06,$1E,$26,\
    $1C,$06,$1C,$26

Sub0243EF:
    ld   hl,$D177                   ; 02:43EF
    add  hl,bc                      ; 02:43F2
    ld   a,[hl]                     ; 02:43F3
    cp   $03                        ; 02:43F4
    jr   z,Return024406             ; 02:43F6
    sla  a                          ; 02:43F8
    sla  a                          ; 02:43FA
    ld   e,a                        ; 02:43FC
    ld   d,$00                      ; 02:43FD
    ld   hl,Data0243E3              ; 02:43FF
    add  hl,de                      ; 02:4402
    call Disp16x16Sprite            ; 02:4403
Return024406:
    ret                             ; 02:4406

Data024407:                         ; 02:4407
.db $01,$26,$04,$25,$40,$3F,$41,$55,\
    $3E,$77,$78,$79,$7E,$7F,$76,$74,\
    $75,$96
Data024419:                         ; 02:4419
.db $00,$00,$04,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00

SubL_02442B:
    ld   a,$01                      ; 02:442B
    call LoadSpriteAnySlot          ; 02:442D
    jr   nc,Code02444E              ; 02:4430
    ld   de,$0000                   ; 02:4432
    ld   hl,W_SpriteID              ; 02:4435
Code024438:
    ldi  a,[hl]                     ; 02:4438
    cp   $1E                        ; 02:4439
    jr   nz,Code024446              ; 02:443B
    inc  e                          ; 02:443D
    ld   a,e                        ; 02:443E
    cp   $0F                        ; 02:443F
    jr   nz,Code024438              ; 02:4441
    jp   ReturnL_0244E6             ; 02:4443
Code024446:
    ld   hl,W_SpriteStatus          ; 02:4446
    add  hl,de                      ; 02:4449
    ld   [hl],$00                   ; 02:444A
    jr   SubL_02442B                ; 02:444C
Code02444E:
    ld   bc,$0004                   ; 02:444E
    ld   hl,$C221                   ; 02:4451
    add  hl,bc                      ; 02:4454
    ld   a,[hl]                     ; 02:4455
    ld   hl,$D1B3                   ; 02:4456
    add  hl,de                      ; 02:4459
    ld   [hl],a                     ; 02:445A
    ld   hl,W_SpriteXLow            ; 02:445B
    add  hl,de                      ; 02:445E
    ldh  a,[<$FF97]                 ; 02:445F
    ld   [hl],a                     ; 02:4461
    ld   hl,W_SpriteXHigh           ; 02:4462
    add  hl,de                      ; 02:4465
    ldh  a,[<$FF98]                 ; 02:4466
    ld   [hl],a                     ; 02:4468
    ld   hl,W_SpriteYLow            ; 02:4469
    add  hl,de                      ; 02:446C
    ldh  a,[<$FF99]                 ; 02:446D
    ld   [hl],a                     ; 02:446F
    ld   hl,$D12C                   ; 02:4470
    add  hl,de                      ; 02:4473
    ld   [hl],a                     ; 02:4474
    ld   hl,$D13B                   ; 02:4475
    add  hl,de                      ; 02:4478
    ldh  a,[<$FF9D]                 ; 02:4479
    ld   [hl],a                     ; 02:447B
    ld   hl,$D14A                   ; 02:447C
    add  hl,de                      ; 02:447F
    ldh  a,[<$FF9E]                 ; 02:4480
    ld   [hl],a                     ; 02:4482
    ld   hl,$D0FF                   ; 02:4483
    add  hl,de                      ; 02:4486
    ldh  a,[<$FF9F]                 ; 02:4487
    ld   [hl],a                     ; 02:4489
    ld   hl,W_SpriteYSpeed          ; 02:448A
    add  hl,de                      ; 02:448D
    ld   [hl],$E0                   ; 02:448E
    ld   hl,$D195                   ; 02:4490
    add  hl,de                      ; 02:4493
    ld   a,[$C366]                  ; 02:4494
    ld   [hl],a                     ; 02:4497
    ld   bc,$0000                   ; 02:4498
Code02449B:
    ld   hl,Data024407              ; 02:449B
    add  hl,bc                      ; 02:449E
    ldh  a,[<$FF9B]                 ; 02:449F
    cp   [hl]                       ; 02:44A1
    jr   z,Code0244AC               ; 02:44A2
    inc  c                          ; 02:44A4
    ld   a,c                        ; 02:44A5
    cp   $12                        ; 02:44A6
    jr   nz,Code02449B              ; 02:44A8
    ld   c,$00                      ; 02:44AA
Code0244AC:
    ld   hl,Data024419              ; 02:44AC
    add  hl,bc                      ; 02:44AF
    ld   a,[hl]                     ; 02:44B0
    ld   hl,$D177                   ; 02:44B1
    add  hl,de                      ; 02:44B4
    ld   [hl],a                     ; 02:44B5
    ld   hl,W_SpriteSubstate        ; 02:44B6
    add  hl,de                      ; 02:44B9
    ld   a,c                        ; 02:44BA
    ld   [hl],a                     ; 02:44BB
    ld   a,[hl]                     ; 02:44BC
    cp   $02                        ; 02:44BD
    jr   nz,Code0244C7              ; 02:44BF
    ld   a,$43                      ; 02:44C1
    ldh  [<$FFF2],a                 ; 02:44C3
    jr   ReturnL_0244E6             ; 02:44C5
Code0244C7:
    ld   a,[hl]                     ; 02:44C7
    cp   $08                        ; 02:44C8
    jr   z,Code0244DB               ; 02:44CA
    cp   $09                        ; 02:44CC
    jr   z,ReturnL_0244E6           ; 02:44CE
    cp   $0A                        ; 02:44D0
    jr   z,ReturnL_0244E6           ; 02:44D2
    cp   $0B                        ; 02:44D4
    jr   z,ReturnL_0244E6           ; 02:44D6
    and  a                          ; 02:44D8
    jr   nz,ReturnL_0244E6          ; 02:44D9
Code0244DB:
    xor  a                          ; 02:44DB
    ldh  [<$FF9B],a                 ; 02:44DC
    push de                         ; 02:44DE
    call Sub024797                  ; 02:44DF
    call GiveCoin                   ; 02:44E2
    pop  de                         ; 02:44E5
ReturnL_0244E6:
    rst  $18                        ; 02:44E6  Return from 24-bit call

Data0244E7:                         ; 02:44E7
.db $88,$01,$8A,$01,$80,$01,$82,$01,\
    $88,$07,$8A,$07
Data0244F3:                         ; 02:44F3
.db $F0,$10

BounceSpr01_Main:
; sprite 01 main
    call Sub0025CB                  ; 02:44F5
    jp   c,Code0245BD               ; 02:44F8
    call Sub0245DF                  ; 02:44FB
    call Sub024775                  ; 02:44FE
    jp   nc,Code0245BD              ; 02:4501
    xor  a                          ; 02:4504
    ld   hl,W_SpriteStatus          ; 02:4505
    add  hl,bc                      ; 02:4508
    ld   [hl],a                     ; 02:4509
    ld   hl,W_SpriteID              ; 02:450A
    add  hl,bc                      ; 02:450D
    ld   [hl],a                     ; 02:450E
    ld   hl,W_SpriteXLow            ; 02:450F
    add  hl,bc                      ; 02:4512
    ld   a,[hl]                     ; 02:4513
    ldh  [<$FF97],a                 ; 02:4514
    ld   hl,W_SpriteYLow            ; 02:4516
    add  hl,bc                      ; 02:4519
    ld   a,[hl]                     ; 02:451A
    ldh  [<$FF98],a                 ; 02:451B
    ld   hl,W_SpriteXHigh           ; 02:451D
    add  hl,bc                      ; 02:4520
    ld   a,[hl]                     ; 02:4521
    ldh  [<$FF99],a                 ; 02:4522
    ld   hl,$D13B                   ; 02:4524
    add  hl,bc                      ; 02:4527
    ld   a,[hl]                     ; 02:4528
    ld   [$D2E8],a                  ; 02:4529
    ld   hl,$D14A                   ; 02:452C
    add  hl,bc                      ; 02:452F
    ld   a,[hl]                     ; 02:4530
    ld   [$D2E9],a                  ; 02:4531
    ld   hl,$D0FF                   ; 02:4534
    add  hl,bc                      ; 02:4537
    ld   a,[hl]                     ; 02:4538
    ld   [$D2EA],a                  ; 02:4539
    ld   hl,W_SpriteSubstate        ; 02:453C
    add  hl,bc                      ; 02:453F
    ld   a,[hl]                     ; 02:4540
    push af                         ; 02:4541
    call Sub02470C                  ; 02:4542
    pop  af                         ; 02:4545
    ldh  [<$FFA6],a                 ; 02:4546
    ld   de,$0002                   ; 02:4548
    ldh  a,[<H_PlInitY_SubLvType]   ; 02:454B
    and  $0F                        ; 02:454D
    cp   $01                        ; 02:454F
    jr   z,Code024557               ; 02:4551
    cp   $04                        ; 02:4553
    jr   nz,Code024592              ; 02:4555
Code024557:
    ldh  a,[<$FFA6]                 ; 02:4557
    cp   $03                        ; 02:4559
    jr   z,Code02458D               ; 02:455B
    cp   $04                        ; 02:455D
    jr   z,Code02458D               ; 02:455F
    cp   $05                        ; 02:4561
    jr   z,Code02458D               ; 02:4563
    cp   $06                        ; 02:4565
    jr   z,Code02458D               ; 02:4567
    cp   $07                        ; 02:4569
    jr   z,Code02458D               ; 02:456B
    cp   $08                        ; 02:456D
    jr   z,Code02458D               ; 02:456F
    cp   $0A                        ; 02:4571
    jr   z,Code02458D               ; 02:4573
    cp   $0B                        ; 02:4575
    jr   z,Code02458D               ; 02:4577
    cp   $0C                        ; 02:4579
    jr   z,Code02458D               ; 02:457B
    cp   $0D                        ; 02:457D
    jr   z,Code02458D               ; 02:457F
    cp   $0F                        ; 02:4581
    jr   z,Code02458D               ; 02:4583
    cp   $11                        ; 02:4585
    jr   z,Code02458D               ; 02:4587
    cp   $10                        ; 02:4589
    jr   nz,Code024592              ; 02:458B
Code02458D:
    ld   de,$008C                   ; 02:458D
    jr   Code02459D                 ; 02:4590
Code024592:
    ld   hl,$D177                   ; 02:4592
    add  hl,bc                      ; 02:4595
    ld   a,[hl]                     ; 02:4596
    and  a                          ; 02:4597
    jr   z,Code0245B2               ; 02:4598
    ld   de,$0004                   ; 02:459A
Code02459D:
    ld   a,[$D2EA]                  ; 02:459D
    ldh  [<$FFA6],a                 ; 02:45A0
    ld   a,[$D2E8]                  ; 02:45A2
    ld   l,a                        ; 02:45A5
    ld   a,[$D2E9]                  ; 02:45A6
    ld   h,a                        ; 02:45A9
    ldh  a,[<$FFA6]                 ; 02:45AA
    ldh  [<SVBK],a                  ; 02:45AC
    ld   [hl],e                     ; 02:45AE
    xor  a                          ; 02:45AF
    ldh  [<SVBK],a                  ; 02:45B0
Code0245B2:
    call Sub0246D7                  ; 02:45B2
    jr   c,Return0245BC             ; 02:45B5
    ld   a,$02                      ; 02:45B7
    call Sub001124                  ; 02:45B9
Return0245BC:
    ret                             ; 02:45BC

Code0245BD:
    ld   hl,$D177                   ; 02:45BD
    add  hl,bc                      ; 02:45C0
    ld   a,[hl]                     ; 02:45C1
    ld   e,a                        ; 02:45C2
    ld   d,$00                      ; 02:45C3
    and  a                          ; 02:45C5
    jr   nz,Code0245D7              ; 02:45C6
    ldh  a,[<H_PlInitY_SubLvType]   ; 02:45C8
    and  $0F                        ; 02:45CA
    cp   $01                        ; 02:45CC
    jr   z,Code0245D4               ; 02:45CE
    cp   $04                        ; 02:45D0
    jr   nz,Code0245D7              ; 02:45D2
Code0245D4:
    ld   de,$0008                   ; 02:45D4
Code0245D7:
    ld   hl,Data0244E7              ; 02:45D7
    add  hl,de                      ; 02:45DA
    call Disp16x16Sprite            ; 02:45DB
    ret                             ; 02:45DE

Sub0245DF:
    call Sub00218B                  ; 02:45DF
    ret  nc                         ; 02:45E2
    ld   hl,W_SpriteID              ; 02:45E3
    add  hl,de                      ; 02:45E6
    ld   a,[hl]                     ; 02:45E7
    cp   $17                        ; 02:45E8
    jr   z,Code0245F7               ; 02:45EA
    cp   $04                        ; 02:45EC
    jr   nz,Code0245FC              ; 02:45EE
    ld   hl,W_AlbumUnlockFlags+1    ; 02:45F0
    set  1,[hl]                     ; 02:45F3
    jr   Code0245FC                 ; 02:45F5
Code0245F7:
    ld   hl,W_AlbumUnlockFlags+2    ; 02:45F7
    set  5,[hl]                     ; 02:45FA
Code0245FC:
    call Sub024686                  ; 02:45FC
    ret  c                          ; 02:45FF
    ld   hl,$D294                   ; 02:4600
    add  hl,de                      ; 02:4603
    ld   a,[hl]                     ; 02:4604
    bit  2,a                        ; 02:4605
    ret  z                          ; 02:4607
    push af                         ; 02:4608
    ld   hl,W_SpriteYSpeed          ; 02:4609
    add  hl,de                      ; 02:460C
    ld   [hl],$CC                   ; 02:460D
    push bc                         ; 02:460F
    ld   hl,W_SpriteXHigh           ; 02:4610
    add  hl,bc                      ; 02:4613
    push hl                         ; 02:4614
    ld   hl,W_SpriteXLow            ; 02:4615
    add  hl,bc                      ; 02:4618
    ld   a,[hl]                     ; 02:4619
    add  $08                        ; 02:461A
    ld   c,a                        ; 02:461C
    pop  hl                         ; 02:461D
    ld   a,$00                      ; 02:461E
    adc  [hl]                       ; 02:4620
    ld   b,a                        ; 02:4621
    ld   hl,W_SpriteXHigh           ; 02:4622
    add  hl,de                      ; 02:4625
    push hl                         ; 02:4626
    ld   hl,W_SpriteXLow            ; 02:4627
    add  hl,de                      ; 02:462A
    ld   a,[hl]                     ; 02:462B
    add  $08                        ; 02:462C
    ldh  [<$FF97],a                 ; 02:462E
    pop  hl                         ; 02:4630
    ld   a,$00                      ; 02:4631
    adc  [hl]                       ; 02:4633
    ldh  [<$FF98],a                 ; 02:4634
    ldh  a,[<$FF97]                 ; 02:4636
    sub  c                          ; 02:4638
    ldh  a,[<$FF98]                 ; 02:4639
    sbc  b                          ; 02:463B
    ld   c,$01                      ; 02:463C
    bit  7,a                        ; 02:463E
    jr   z,Code024643               ; 02:4640
    dec  c                          ; 02:4642
Code024643:
    ld   b,$00                      ; 02:4643
    ld   hl,Data0244F3              ; 02:4645
    add  hl,bc                      ; 02:4648
    ld   a,[hl]                     ; 02:4649
    ld   hl,W_SpriteXSpeed          ; 02:464A
    add  hl,de                      ; 02:464D
    ld   [hl],a                     ; 02:464E
    pop  bc                         ; 02:464F
    pop  af                         ; 02:4650
    bit  3,a                        ; 02:4651
    jr   nz,Code024663              ; 02:4653
    ld   hl,W_SpriteStatus          ; 02:4655
    add  hl,de                      ; 02:4658
    ld   [hl],$03                   ; 02:4659
    ld   hl,$D1A4                   ; 02:465B
    add  hl,de                      ; 02:465E
    ld   [hl],$01                   ; 02:465F
    jr   Code02467A                 ; 02:4661
Code024663:
    swap a                          ; 02:4663
    and  $0F                        ; 02:4665
    ld   hl,W_SpriteSubstate        ; 02:4667
    add  hl,de                      ; 02:466A
    ld   [hl],a                     ; 02:466B
    ld   hl,$D11D                   ; 02:466C
    add  hl,de                      ; 02:466F
    ld   [hl],a                     ; 02:4670
    ld   hl,W_SpriteID              ; 02:4671
    add  hl,de                      ; 02:4674
    ld   a,[hl]                     ; 02:4675
    cp   $30                        ; 02:4676
    jr   z,Code02467E               ; 02:4678
Code02467A:
    ld   a,$45                      ; 02:467A
    ldh  [<$FFF2],a                 ; 02:467C
Code02467E:
    push bc                         ; 02:467E
    ld   c,e                        ; 02:467F
    ld   b,d                        ; 02:4680
    call Sub002E73                  ; 02:4681
    pop  bc                         ; 02:4684
    ret                             ; 02:4685

Sub024686:
    ld   hl,W_SpriteID              ; 02:4686
    add  hl,de                      ; 02:4689
    ld   a,[hl]                     ; 02:468A
    cp   $30                        ; 02:468B
    jr   nz,Code02469A              ; 02:468D
    ld   hl,W_SpriteYSpeed          ; 02:468F
    add  hl,de                      ; 02:4692
    ld   a,[hl]                     ; 02:4693
    bit  7,a                        ; 02:4694
    jr   nz,Code0246D2              ; 02:4696
    jr   Code0246D4                 ; 02:4698
Code02469A:
    cp   $02                        ; 02:469A
    jr   z,Code0246B2               ; 02:469C
    cp   $03                        ; 02:469E
    jr   z,Code0246B2               ; 02:46A0
    cp   $31                        ; 02:46A2
    jr   nz,Code0246D4              ; 02:46A4
    ld   hl,W_AlbumUnlockFlags+2    ; 02:46A6
    set  1,[hl]                     ; 02:46A9
    ld   hl,W_SpriteSubstate        ; 02:46AB
    add  hl,de                      ; 02:46AE
    ld   a,[hl]                     ; 02:46AF
    jr   Code0246CE                 ; 02:46B0
Code0246B2:
    ld   hl,W_AlbumUnlockFlags+2    ; 02:46B2
    set  3,[hl]                     ; 02:46B5
    ld   hl,W_SpriteSubstate        ; 02:46B7
    add  hl,de                      ; 02:46BA
    ld   a,[hl]                     ; 02:46BB
    cp   $00                        ; 02:46BC
    jr   nz,Code0246CE              ; 02:46BE
    ld   hl,$D258                   ; 02:46C0
    add  hl,de                      ; 02:46C3
    ld   [hl],$01                   ; 02:46C4
    ld   hl,$D096                   ; 02:46C6
    add  hl,de                      ; 02:46C9
    ld   [hl],$07                   ; 02:46CA
    jr   Code0246D4                 ; 02:46CC
Code0246CE:
    cp   $03                        ; 02:46CE
    jr   nz,Code0246D4              ; 02:46D0
Code0246D2:
    scf                             ; 02:46D2
    ret                             ; 02:46D3

Code0246D4:
    scf                             ; 02:46D4
    ccf                             ; 02:46D5
    ret                             ; 02:46D6

Sub0246D7:
    ld   hl,W_SpriteXLow            ; 02:46D7
    add  hl,bc                      ; 02:46DA
    ld   a,[hl]                     ; 02:46DB
    ldh  [<$FF97],a                 ; 02:46DC
    ld   hl,W_SpriteYLow            ; 02:46DE
    add  hl,bc                      ; 02:46E1
    ld   a,[hl]                     ; 02:46E2
    ldh  [<$FF98],a                 ; 02:46E3
    ld   hl,W_SpriteXHigh           ; 02:46E5
    add  hl,bc                      ; 02:46E8
    ld   a,[hl]                     ; 02:46E9
    ldh  [<$FF99],a                 ; 02:46EA
    ld   hl,H_CameraXLow            ; 02:46EC
    ldh  a,[<$FF97]                 ; 02:46EF
    sub  [hl]                       ; 02:46F1
    ldh  [<$FF9D],a                 ; 02:46F2
    ld   hl,H_CameraXHigh           ; 02:46F4
    ldh  a,[<$FF99]                 ; 02:46F7
    sbc  [hl]                       ; 02:46F9
    ldh  [<$FF9E],a                 ; 02:46FA
    ldh  a,[<$FF9D]                 ; 02:46FC
    add  $28                        ; 02:46FE
    ldh  a,[<$FF9E]                 ; 02:4700
    adc  $00                        ; 02:4702
    and  a                          ; 02:4704
    jr   nz,Code02470A              ; 02:4705
    scf                             ; 02:4707
    ccf                             ; 02:4708
    ret                             ; 02:4709

Code02470A:
    scf                             ; 02:470A
    ret                             ; 02:470B

Sub02470C:
    ld   hl,W_SpriteSubstate        ; 02:470C
    add  hl,bc                      ; 02:470F
    ld   a,[hl]                     ; 02:4710
    cp   $01                        ; 02:4711
    jr   z,Code02471D               ; 02:4713
    cp   $03                        ; 02:4715
    jr   z,Code02471D               ; 02:4717
    cp   $04                        ; 02:4719
    jr   nz,Code02474B              ; 02:471B
Code02471D:
    ld   de,$0000                   ; 02:471D
Code024720:
    ld   hl,W_SpriteStatus          ; 02:4720
    add  hl,de                      ; 02:4723
    ld   a,[hl]                     ; 02:4724
    and  a                          ; 02:4725
    jr   z,Code024745               ; 02:4726
    ld   hl,W_SpriteID              ; 02:4728
    add  hl,de                      ; 02:472B
    ld   a,[hl]                     ; 02:472C
    cp   $0C                        ; 02:472D
    jr   nz,Code024745              ; 02:472F
    ld   hl,$D11D                   ; 02:4731
    add  hl,de                      ; 02:4734
    ld   a,[hl]                     ; 02:4735
    cp   $03                        ; 02:4736
    jr   nc,Code024745              ; 02:4738
    xor  a                          ; 02:473A
    ld   hl,W_SpriteStatus          ; 02:473B
    add  hl,de                      ; 02:473E
    ld   [hl],a                     ; 02:473F
    ld   hl,W_SpriteID              ; 02:4740
    add  hl,de                      ; 02:4743
    ld   [hl],a                     ; 02:4744
Code024745:
    inc  de                         ; 02:4745
    ld   a,e                        ; 02:4746
    cp   $0F                        ; 02:4747
    jr   nz,Code024720              ; 02:4749
Code02474B:
    ld   hl,W_SpriteSubstate        ; 02:474B
    add  hl,bc                      ; 02:474E
    ld   a,[hl]                     ; 02:474F
    rst  $00                        ; 02:4750  Execute from 16-bit pointer table
.dw Return024000                    ; 02:4751
.dw Sub0248B5                       ; 02:4753
.dw Return024000                    ; 02:4755
.dw Sub0248B5                       ; 02:4757
.dw Sub0248B5                       ; 02:4759
.dw Sub0248B5                       ; 02:475B
.dw Sub0248B5                       ; 02:475D
.dw Sub02779F                       ; 02:475F
.dw Return024000                    ; 02:4761
.dw Sub0248B5                       ; 02:4763
.dw Sub0248B5                       ; 02:4765
.dw Sub0248B5                       ; 02:4767
.dw Sub0248B5                       ; 02:4769
.dw Sub0248B5                       ; 02:476B
.dw Sub0248B5                       ; 02:476D
.dw Sub0248B5                       ; 02:476F
.dw Sub0248B5                       ; 02:4771
.dw Sub0248B5                       ; 02:4773

Sub024775:
    ld   hl,$D12C                   ; 02:4775
    add  hl,bc                      ; 02:4778
    ld   a,[hl]                     ; 02:4779
    ld   hl,W_SpriteYLow            ; 02:477A
    add  hl,bc                      ; 02:477D
    cp   [hl]                       ; 02:477E
    push af                         ; 02:477F
    ld   hl,W_SpriteYSpeed          ; 02:4780
    add  hl,bc                      ; 02:4783
    ld   a,$04                      ; 02:4784
    add  [hl]                       ; 02:4786
    bit  7,a                        ; 02:4787
    jr   nz,Code024791              ; 02:4789
    cp   $10                        ; 02:478B
    jr   nc,Code024791              ; 02:478D
    ld   a,$10                      ; 02:478F
Code024791:
    ld   [hl],a                     ; 02:4791
    call Sub001A79                  ; 02:4792
    pop  af                         ; 02:4795
    ret                             ; 02:4796

Sub024797:
    ld   a,$0B                      ; 02:4797
    call LoadSpriteAnySlot          ; 02:4799
    jr   c,Return0247F2             ; 02:479C
    ldh  a,[<$FF97]                 ; 02:479E
    add  $04                        ; 02:47A0
    push af                         ; 02:47A2
    ldh  a,[<$FF98]                 ; 02:47A3
    add  $00                        ; 02:47A5
    ld   hl,W_SpriteXHigh           ; 02:47A7
    add  hl,de                      ; 02:47AA
    ld   [hl],a                     ; 02:47AB
    pop  af                         ; 02:47AC
    ld   hl,W_SpriteXLow            ; 02:47AD
    add  hl,de                      ; 02:47B0
    ld   [hl],a                     ; 02:47B1
    ld   hl,W_SpriteYLow            ; 02:47B2
    add  hl,de                      ; 02:47B5
    ldh  a,[<$FF99]                 ; 02:47B6
    add  $F0                        ; 02:47B8
    ld   [hl],a                     ; 02:47BA
    ld   hl,$D1D1                   ; 02:47BB
    add  hl,de                      ; 02:47BE
    ld   [hl],a                     ; 02:47BF
    ld   hl,W_SpriteYSpeed          ; 02:47C0
    add  hl,de                      ; 02:47C3
    ld   [hl],$B8                   ; 02:47C4
    ld   hl,$D096                   ; 02:47C6
    add  hl,de                      ; 02:47C9
    ld   [hl],$01                   ; 02:47CA
    ld   hl,$D0A5                   ; 02:47CC
    add  hl,de                      ; 02:47CF
    ld   [hl],$1B                   ; 02:47D0
    ld   hl,$D11D                   ; 02:47D2
    add  hl,de                      ; 02:47D5
    ldh  a,[<$FF9B]                 ; 02:47D6
    ld   [hl],a                     ; 02:47D8
    cp   $02                        ; 02:47D9
    jr   z,Return0247F2             ; 02:47DB
    ld   a,[W_GameMode]             ; 02:47DD
    cp   $07                        ; 02:47E0
    jr   z,Return0247F2             ; 02:47E2
    cp   $02                        ; 02:47E4
    jr   z,Return0247F2             ; 02:47E6
    ld   a,$14                      ; 02:47E8
    ldh  [<$FF97],a                 ; 02:47EA
    xor  a                          ; 02:47EC
    ldh  [<$FF98],a                 ; 02:47ED
    call GivePointsFF97             ; 02:47EF
Return0247F2:
    ret                             ; 02:47F2

SubL_0247F3:
    call Sub024797                  ; 02:47F3
    rst  $18                        ; 02:47F6  Return from 24-bit call

Data0247F7:                         ; 02:47F7
.db $54,$06,$5A,$06,$58,$06,$56,$06,\
    $54,$05,$5A,$05,$58,$05,$56,$05,\
    $54,$05,$5A,$05,$58,$05,$56,$05

CoinFromBlock_Main:
; sprite 0B main
    ld   hl,W_SpriteYSpeed          ; 02:480F
    add  hl,bc                      ; 02:4812
    ld   a,[hl]                     ; 02:4813
    add  $05                        ; 02:4814
    bit  7,a                        ; 02:4816
    jr   nz,Code024820              ; 02:4818
    cp   $30                        ; 02:481A
    jr   c,Code024820               ; 02:481C
    ld   a,$30                      ; 02:481E
Code024820:
    ld   [hl],a                     ; 02:4820
    call Sub001A79                  ; 02:4821
    ld   hl,$D0A5                   ; 02:4824
    add  hl,bc                      ; 02:4827
    ld   a,[hl]                     ; 02:4828
    dec  [hl]                       ; 02:4829
    and  a                          ; 02:482A
    jr   nz,Sub02486B               ; 02:482B
    ld   hl,W_SpriteStatus          ; 02:482D
    add  hl,bc                      ; 02:4830
    ld   [hl],a                     ; 02:4831
    ld   hl,W_SpriteID              ; 02:4832
    add  hl,bc                      ; 02:4835
    ld   [hl],a                     ; 02:4836
    ld   hl,$D11D                   ; 02:4837
    add  hl,bc                      ; 02:483A
    ld   a,[hl]                     ; 02:483B
    cp   $02                        ; 02:483C
    jr   z,Return02486A             ; 02:483E
    ld   a,[W_GameMode]             ; 02:4840
    cp   $07                        ; 02:4843
    jr   z,Return02486A             ; 02:4845
    cp   $02                        ; 02:4847
    jr   z,Return02486A             ; 02:4849
    ld   hl,W_SpriteXLow            ; 02:484B
    add  hl,bc                      ; 02:484E
    ld   a,[hl]                     ; 02:484F
    ldh  [<$FF97],a                 ; 02:4850
    ld   hl,W_SpriteXHigh           ; 02:4852
    add  hl,bc                      ; 02:4855
    ld   a,[hl]                     ; 02:4856
    ldh  [<$FF98],a                 ; 02:4857
    ld   hl,$D1D1                   ; 02:4859
    add  hl,bc                      ; 02:485C
    ld   a,[hl]                     ; 02:485D
    ldh  [<$FF99],a                 ; 02:485E
    ld   a,$01                      ; 02:4860
    ldh  [<$FF9B],a                 ; 02:4862
    ld   a,$02                      ; 02:4864
    rst  $10                        ; 02:4866  24-bit call
.dl SubL_0276AF                     ; 02:4867
Return02486A:
    ret                             ; 02:486A

Sub02486B:
    ld   hl,$D096                   ; 02:486B
    add  hl,bc                      ; 02:486E
    ld   a,[hl]                     ; 02:486F
    dec  [hl]                       ; 02:4870
    and  a                          ; 02:4871
    jr   nz,Code02487F              ; 02:4872
    ld   [hl],$01                   ; 02:4874
    ld   hl,$D0D2                   ; 02:4876
    add  hl,bc                      ; 02:4879
    ld   a,[hl]                     ; 02:487A
    inc  a                          ; 02:487B
    and  $03                        ; 02:487C
    ld   [hl],a                     ; 02:487E
Code02487F:
    ld   hl,$D0D2                   ; 02:487F
    add  hl,bc                      ; 02:4882
    ld   e,[hl]                     ; 02:4883
    sla  e                          ; 02:4884
    ld   d,$00                      ; 02:4886
    ld   hl,$D11D                   ; 02:4888
    add  hl,bc                      ; 02:488B
    ld   a,[hl]                     ; 02:488C
    sla  a                          ; 02:488D
    sla  a                          ; 02:488F
    sla  a                          ; 02:4891
    ld   l,a                        ; 02:4893
    ld   h,$00                      ; 02:4894
    add  hl,de                      ; 02:4896
    ld   de,Data0247F7              ; 02:4897
    add  hl,de                      ; 02:489A
    call Sub002893                  ; 02:489B
    ret                             ; 02:489E

UnusedL_02489F:
    call Sub02486B                  ; 02:489F
    rst  $18                        ; 02:48A2  Return from 24-bit call

Data0248A3:                         ; 02:48A3
.db $00,$00,$00,$02,$00,$03,$03,$00,\
    $00,$06,$06,$06,$04,$04,$05,$00,\
    $05,$05

Sub0248B5:
    ld   hl,$D1B3                   ; 02:48B5
    add  hl,bc                      ; 02:48B8
    ld   a,[hl]                     ; 02:48B9
    ldh  [<$FF9B],a                 ; 02:48BA
    ld   hl,W_SpriteSubstate        ; 02:48BC
    add  hl,bc                      ; 02:48BF
    ld   a,[hl]                     ; 02:48C0
    ldh  [<$FF9C],a                 ; 02:48C1
    ld   hl,$D195                   ; 02:48C3
    add  hl,bc                      ; 02:48C6
    ld   a,[hl]                     ; 02:48C7
    ldh  [<$FF9D],a                 ; 02:48C8
    ld   hl,$D13B                   ; 02:48CA
    add  hl,bc                      ; 02:48CD
    ld   a,[hl]                     ; 02:48CE
    ld   [$D2E4],a                  ; 02:48CF
    ld   hl,$D14A                   ; 02:48D2
    add  hl,bc                      ; 02:48D5
    ld   a,[hl]                     ; 02:48D6
    ld   [$D2E5],a                  ; 02:48D7
    ld   hl,$D0FF                   ; 02:48DA
    add  hl,bc                      ; 02:48DD
    ld   a,[hl]                     ; 02:48DE
    ld   [$D2E6],a                  ; 02:48DF
    ld   a,$0C                      ; 02:48E2
    call LoadSpriteAnySlot          ; 02:48E4
    jp   c,Return024982             ; 02:48E7
    ld   a,$26                      ; 02:48EA
    ldh  [<$FFF3],a                 ; 02:48EC
    ld   hl,W_SpriteXLow            ; 02:48EE
    add  hl,de                      ; 02:48F1
    ldh  a,[<$FF97]                 ; 02:48F2
    ld   [hl],a                     ; 02:48F4
    ld   hl,W_SpriteXHigh           ; 02:48F5
    add  hl,de                      ; 02:48F8
    ldh  a,[<$FF99]                 ; 02:48F9
    ld   [hl],a                     ; 02:48FB
    ld   hl,W_SpriteYLow            ; 02:48FC
    add  hl,de                      ; 02:48FF
    ldh  a,[<$FF98]                 ; 02:4900
    sub  $05                        ; 02:4902
    ld   [hl],a                     ; 02:4904
    add  $EF                        ; 02:4905
    ld   hl,$D1D1                   ; 02:4907
    add  hl,de                      ; 02:490A
    ld   [hl],a                     ; 02:490B
    ld   hl,W_SpriteYSpeed          ; 02:490C
    add  hl,de                      ; 02:490F
    ld   [hl],$FC                   ; 02:4910
    ld   hl,$D12C                   ; 02:4912
    add  hl,de                      ; 02:4915
    ldh  a,[<$FF9B]                 ; 02:4916
    ld   [hl],a                     ; 02:4918
    ld   hl,$D13B                   ; 02:4919
    add  hl,de                      ; 02:491C
    ld   a,[$D2E4]                  ; 02:491D
    ld   [hl],a                     ; 02:4920
    ld   hl,$D14A                   ; 02:4921
    add  hl,de                      ; 02:4924
    ld   a,[$D2E5]                  ; 02:4925
    ld   [hl],a                     ; 02:4928
    ld   hl,$D0FF                   ; 02:4929
    add  hl,de                      ; 02:492C
    ld   a,[$D2E6]                  ; 02:492D
    ld   [hl],a                     ; 02:4930
    ld   a,[W_GameMode]             ; 02:4931
    cp   $02                        ; 02:4934
    jr   nz,Code02494E              ; 02:4936
    push de                         ; 02:4938
    ldh  a,[<$FF9D]                 ; 02:4939
    swap a                          ; 02:493B
    sla  a                          ; 02:493D
    sla  a                          ; 02:493F
    sla  a                          ; 02:4941
    ld   e,a                        ; 02:4943
    ld   d,$00                      ; 02:4944
    ld   hl,$C50D                   ; 02:4946
    add  hl,de                      ; 02:4949
    ld   a,[hl]                     ; 02:494A
    pop  de                         ; 02:494B
    jr   Code024951                 ; 02:494C
Code02494E:
    ld   a,[W_PlayerSize]           ; 02:494E
Code024951:
    ld   hl,$D11D                   ; 02:4951
    add  hl,de                      ; 02:4954
    ld   [hl],a                     ; 02:4955
    push de                         ; 02:4956
    ldh  a,[<$FF9C]                 ; 02:4957
    ld   e,a                        ; 02:4959
    ld   d,$00                      ; 02:495A
    ld   hl,Data0248A3              ; 02:495C
    add  hl,de                      ; 02:495F
    pop  de                         ; 02:4960
    ld   a,[hl]                     ; 02:4961
    cp   $00                        ; 02:4962
    jr   z,Return024982             ; 02:4964
    ld   hl,$D11D                   ; 02:4966
    add  hl,de                      ; 02:4969
    ld   [hl],a                     ; 02:496A
    cp   $02                        ; 02:496B
    jr   z,Code024978               ; 02:496D
    cp   $03                        ; 02:496F
    ret  nz                         ; 02:4971
    ld   hl,W_AlbumUnlockFlags      ; 02:4972
    set  1,[hl]                     ; 02:4975
    ret                             ; 02:4977

Code024978:
    ld   a,[W_GameMode]             ; 02:4978
    cp   $02                        ; 02:497B
    jr   nz,Return024982            ; 02:497D
    call Sub024983                  ; 02:497F
Return024982:
    ret                             ; 02:4982

Sub024983:
    push de                         ; 02:4983
    ldh  a,[<$FF9D]                 ; 02:4984
    swap a                          ; 02:4986
    sla  a                          ; 02:4988
    sla  a                          ; 02:498A
    sla  a                          ; 02:498C
    ld   e,a                        ; 02:498E
    ld   d,$00                      ; 02:498F
    ld   hl,$C501                   ; 02:4991
    add  hl,de                      ; 02:4994
    ld   a,[hl]                     ; 02:4995
    ldh  [<$FF97],a                 ; 02:4996
    ld   hl,$C502                   ; 02:4998
    add  hl,de                      ; 02:499B
    ld   a,[hl]                     ; 02:499C
    ldh  [<$FF98],a                 ; 02:499D
    ld   a,e                        ; 02:499F
    xor  $80                        ; 02:49A0
    ld   e,a                        ; 02:49A2
    ld   hl,$C501                   ; 02:49A3
    add  hl,de                      ; 02:49A6
    ld   a,[hl]                     ; 02:49A7
    ldh  [<$FF99],a                 ; 02:49A8
    ld   hl,$C502                   ; 02:49AA
    add  hl,de                      ; 02:49AD
    ld   a,[hl]                     ; 02:49AE
    ldh  [<$FF9A],a                 ; 02:49AF
    ld   hl,$FF99                   ; 02:49B1
    ldh  a,[<$FF97]                 ; 02:49B4
    sub  [hl]                       ; 02:49B6
    ldh  [<$FF97],a                 ; 02:49B7
    ld   hl,$FF9A                   ; 02:49B9
    ldh  a,[<$FF98]                 ; 02:49BC
    sbc  [hl]                       ; 02:49BE
    bit  7,a                        ; 02:49BF
    jr   nz,Code0249E3              ; 02:49C1
    and  a                          ; 02:49C3
    jr   nz,Code0249CC              ; 02:49C4
    ldh  a,[<$FF98]                 ; 02:49C6
    cp   $80                        ; 02:49C8
    jr   c,Code0249E3               ; 02:49CA
Code0249CC:
    ld   a,[$DA79]                  ; 02:49CC
    and  $03                        ; 02:49CF
    jr   z,Code0249E3               ; 02:49D1
    ld   a,e                        ; 02:49D3
    xor  $80                        ; 02:49D4
    ld   e,a                        ; 02:49D6
    ld   hl,$C50D                   ; 02:49D7
    add  hl,de                      ; 02:49DA
    ld   a,[hl]                     ; 02:49DB
    pop  de                         ; 02:49DC
    ld   hl,$D11D                   ; 02:49DD
    add  hl,de                      ; 02:49E0
    ld   [hl],a                     ; 02:49E1
    ret                             ; 02:49E2
Code0249E3:
    pop  de                         ; 02:49E3
    ret                             ; 02:49E4

ItemFromBlock_Tilemap:              ; 02:49E5
.db $2A,$86,$2C,$86,$2A,$06,$2C,$06 ; 00 Super Mushroom
.db $2E,$87,$2E,$A7,$2E,$07,$2E,$27 ; 01 Fire Flower
.db $64,$87,$64,$A7,$64,$07,$64,$27 ; 02 Starman
.db $2A,$87,$2C,$87,$2A,$07,$2C,$07 ; 03 1up Mushroom
.db $90,$88,$92,$88,$90,$08,$92,$08 ; 04 Yoshi egg
.db $24,$8A,$24,$AA,$24,$0A,$24,$2A ; 05 Poison Mushroom
.db $80,$8D,$82,$8D,$80,$0D,$82,$0D ; 06 Red Coin

ItemFromBlock_Main:
; sprite 0C main
    call Sub0025CB                  ; 02:4A1D
    jp   c,Code024A3D               ; 02:4A20
    call Sub002920                  ; 02:4A23
    jp   c,Return024A68             ; 02:4A26
    call Sub0029DA                  ; 02:4A29
    ld   hl,W_SpriteID              ; 02:4A2C
    add  hl,bc                      ; 02:4A2F
    ld   a,[hl]                     ; 02:4A30
    push af                         ; 02:4A31
    call Sub024A69                  ; 02:4A32
    pop  de                         ; 02:4A35
    ld   hl,W_SpriteID              ; 02:4A36
    add  hl,bc                      ; 02:4A39
    ld   a,[hl]                     ; 02:4A3A
    cp   d                          ; 02:4A3B
    ret  nz                         ; 02:4A3C
Code024A3D:
    ld   hl,$D11D                   ; 02:4A3D
    add  hl,bc                      ; 02:4A40
    ld   a,[hl]                     ; 02:4A41
    cp   $01                        ; 02:4A42
    jr   z,Code024AB7               ; 02:4A44
    cp   $02                        ; 02:4A46
    jr   z,Code024ABC               ; 02:4A48
    ldh  [<$FF97],a                 ; 02:4A4A
    ld   e,[hl]                     ; 02:4A4C
    sla  e                          ; 02:4A4D
    sla  e                          ; 02:4A4F
    sla  e                          ; 02:4A51
    ld   d,$00                      ; 02:4A53
    ld   hl,W_SpriteSubstate        ; 02:4A55
    add  hl,bc                      ; 02:4A58
    ld   a,[hl]                     ; 02:4A59
    and  a                          ; 02:4A5A
    jr   z,Code024A61               ; 02:4A5B
    ld   a,e                        ; 02:4A5D
    add  $04                        ; 02:4A5E
    ld   e,a                        ; 02:4A60
Code024A61:
    ld   hl,ItemFromBlock_Tilemap   ; 02:4A61
    add  hl,de                      ; 02:4A64
    call Disp16x16Sprite            ; 02:4A65
Return024A68:
    ret                             ; 02:4A68

Sub024A69:
    ld   hl,W_SpriteSubstate        ; 02:4A69
    add  hl,bc                      ; 02:4A6C
    ld   a,[hl]                     ; 02:4A6D
    rst  $00                        ; 02:4A6E  Execute from 16-bit pointer table
.dw Code024AE9                      ; 02:4A6F
.dw Code024B49                      ; 02:4A71
.dw Code024C2B                      ; 02:4A73
.dw Code024C2F                      ; 02:4A75

Data024A77:                         ; 02:4A77
.db $2E,$87,$2E,$A7,$2E,$82,$2E,$A2,\
    $72,$82,$72,$A2,$74,$82,$74,$A2,\
    $2E,$07,$2E,$27,$2E,$02,$2E,$22,\
    $72,$02,$72,$22,$74,$02,$74,$22
Data024A97:                         ; 02:4A97
.db $64,$86,$64,$A6,$64,$87,$64,$A7,\
    $64,$84,$64,$A4,$64,$81,$64,$A1,\
    $64,$06,$64,$26,$64,$07,$64,$27,\
    $64,$04,$64,$24,$64,$01,$64,$21

Code024AB7:
    ld   hl,Data024A77              ; 02:4AB7
    jr   Code024ABF                 ; 02:4ABA
Code024ABC:
    ld   hl,Data024A97              ; 02:4ABC
Code024ABF:
    push hl                         ; 02:4ABF
    ld   de,$0000                   ; 02:4AC0
    ld   hl,W_SpriteSubstate        ; 02:4AC3
    add  hl,bc                      ; 02:4AC6
    ld   a,[hl]                     ; 02:4AC7
    and  a                          ; 02:4AC8
    jr   z,Code024ACD               ; 02:4AC9
    ld   e,$10                      ; 02:4ACB
Code024ACD:
    pop  hl                         ; 02:4ACD
    add  hl,de                      ; 02:4ACE
    ldh  a,[<H_GlobalTimer]         ; 02:4ACF
    and  $06                        ; 02:4AD1
    sla  a                          ; 02:4AD3
    ld   e,a                        ; 02:4AD5
    add  hl,de                      ; 02:4AD6
    call Disp16x16Sprite            ; 02:4AD7
    ret                             ; 02:4ADA

Data024ADB:                         ; 02:4ADB
.db $F0,$10,$00,$00,$EF,$11,$F0,$10,\
    $F0,$10,$F0,$10,$00,$00
Code024AE9:
    call Sub001A79                  ; 02:4AE9
    call Sub024C87                  ; 02:4AEC
    ld   hl,$D1D1                   ; 02:4AEF
    add  hl,bc                      ; 02:4AF2
    ld   a,[hl]                     ; 02:4AF3
    ld   hl,W_SpriteYLow            ; 02:4AF4
    add  hl,bc                      ; 02:4AF7
    cp   [hl]                       ; 02:4AF8
    jr   c,Return024B48             ; 02:4AF9
    ld   [hl],a                     ; 02:4AFB
    ld   hl,$D11D                   ; 02:4AFC
    add  hl,bc                      ; 02:4AFF
    ld   a,[hl]                     ; 02:4B00
    cp   $01                        ; 02:4B01
    jr   z,Code024B42               ; 02:4B03
    cp   $04                        ; 02:4B05
    jr   z,Code024B42               ; 02:4B07
    cp   $06                        ; 02:4B09
    jr   z,Code024B42               ; 02:4B0B
    sla  a                          ; 02:4B0D
    ld   e,a                        ; 02:4B0F
    ld   d,$00                      ; 02:4B10
    inc  e                          ; 02:4B12
    ld   hl,Data024ADB              ; 02:4B13
    add  hl,de                      ; 02:4B16
    ld   a,[hl]                     ; 02:4B17
    ld   hl,W_SpriteXSpeed          ; 02:4B18
    add  hl,bc                      ; 02:4B1B
    ld   [hl],a                     ; 02:4B1C
    xor  a                          ; 02:4B1D
    ld   hl,W_SpriteYSpeed          ; 02:4B1E
    add  hl,bc                      ; 02:4B21
    ld   [hl],a                     ; 02:4B22
    ld   hl,$D087                   ; 02:4B23
    add  hl,bc                      ; 02:4B26
    ld   [hl],a                     ; 02:4B27
    ld   hl,$D11D                   ; 02:4B28
    add  hl,bc                      ; 02:4B2B
    ld   a,[hl]                     ; 02:4B2C
    cp   $03                        ; 02:4B2D
    jr   z,Code024B35               ; 02:4B2F
    cp   $02                        ; 02:4B31
    jr   z,Code024B3B               ; 02:4B33
Code024B35:
    ld   hl,W_SpriteSubstate        ; 02:4B35
    add  hl,bc                      ; 02:4B38
    jr   Code024B47                 ; 02:4B39
Code024B3B:
    ld   hl,W_SpriteSubstate        ; 02:4B3B
    add  hl,bc                      ; 02:4B3E
    inc  [hl]                       ; 02:4B3F
    jr   Code024B46                 ; 02:4B40
Code024B42:
    ld   hl,W_SpriteSubstate        ; 02:4B42
    add  hl,bc                      ; 02:4B45
Code024B46:
    inc  [hl]                       ; 02:4B46
Code024B47:
    inc  [hl]                       ; 02:4B47
Return024B48:
    ret                             ; 02:4B48

Code024B49:
    ld   e,$06                      ; 02:4B49
    ld   hl,$D14A                   ; 02:4B4B
    add  hl,bc                      ; 02:4B4E
    ld   a,[hl]                     ; 02:4B4F
    and  a                          ; 02:4B50
    jr   z,Code024B55               ; 02:4B51
    ld   e,$04                      ; 02:4B53
Code024B55:
    ld   hl,W_SpriteYSpeed          ; 02:4B55
    add  hl,bc                      ; 02:4B58
    ld   a,e                        ; 02:4B59
    add  [hl]                       ; 02:4B5A
    bit  7,a                        ; 02:4B5B
    jr   nz,Code024B65              ; 02:4B5D
    cp   $38                        ; 02:4B5F
    jr   c,Code024B65               ; 02:4B61
    ld   a,$38                      ; 02:4B63
Code024B65:
    ld   [hl],a                     ; 02:4B65
    call Sub001A3D                  ; 02:4B66
    call Sub001A79                  ; 02:4B69
    call Sub024C87                  ; 02:4B6C
    jr   nc,Code024B72              ; 02:4B6F
    ret                             ; 02:4B71

Code024B72:
    call Sub00218B                  ; 02:4B72
    jr   nc,Code024BDE              ; 02:4B75
    ld   hl,W_SpriteID              ; 02:4B77
    add  hl,de                      ; 02:4B7A
    ld   a,[hl]                     ; 02:4B7B
    cp   $2D                        ; 02:4B7C
    jr   z,Code024BD6               ; 02:4B7E
    cp   $01                        ; 02:4B80
    jr   nz,Code024BDE              ; 02:4B82
    ld   hl,W_SpriteYSpeed          ; 02:4B84
    add  hl,bc                      ; 02:4B87
    ld   a,[hl]                     ; 02:4B88
    bit  7,a                        ; 02:4B89
    jr   nz,Code024BDE              ; 02:4B8B
    ld   [hl],$CC                   ; 02:4B8D
    ld   hl,$D14A                   ; 02:4B8F
    add  hl,bc                      ; 02:4B92
    ld   [hl],$01                   ; 02:4B93
    ld   hl,W_SpriteXHigh           ; 02:4B95
    add  hl,de                      ; 02:4B98
    push hl                         ; 02:4B99
    ld   hl,W_SpriteXLow            ; 02:4B9A
    add  hl,de                      ; 02:4B9D
    ld   a,[hl]                     ; 02:4B9E
    add  $08                        ; 02:4B9F
    ld   e,a                        ; 02:4BA1
    pop  hl                         ; 02:4BA2
    ld   a,$00                      ; 02:4BA3
    adc  [hl]                       ; 02:4BA5
    ld   d,a                        ; 02:4BA6
    ld   hl,W_SpriteXHigh           ; 02:4BA7
    add  hl,bc                      ; 02:4BAA
    push hl                         ; 02:4BAB
    ld   hl,W_SpriteXLow            ; 02:4BAC
    add  hl,bc                      ; 02:4BAF
    ld   a,[hl]                     ; 02:4BB0
    add  $08                        ; 02:4BB1
    ldh  [<$FF97],a                 ; 02:4BB3
    pop  hl                         ; 02:4BB5
    ld   a,$00                      ; 02:4BB6
    adc  [hl]                       ; 02:4BB8
    ldh  [<$FF98],a                 ; 02:4BB9
    ldh  a,[<$FF97]                 ; 02:4BBB
    sub  e                          ; 02:4BBD
    ldh  a,[<$FF98]                 ; 02:4BBE
    sbc  d                          ; 02:4BC0
    ld   e,$01                      ; 02:4BC1
    bit  7,a                        ; 02:4BC3
    jr   z,Code024BC8               ; 02:4BC5
    dec  e                          ; 02:4BC7
Code024BC8:
    ld   d,$00                      ; 02:4BC8
    ld   hl,Data024ADB              ; 02:4BCA
    add  hl,de                      ; 02:4BCD
    ld   a,[hl]                     ; 02:4BCE
    ld   hl,W_SpriteXSpeed          ; 02:4BCF
    add  hl,bc                      ; 02:4BD2
    ld   [hl],a                     ; 02:4BD3
    jr   Code024BDE                 ; 02:4BD4
Code024BD6:
    ld   hl,W_SpriteXSpeed          ; 02:4BD6
    add  hl,bc                      ; 02:4BD9
    ld   a,[hl]                     ; 02:4BDA
    cpl                             ; 02:4BDB
    inc  a                          ; 02:4BDC
    ld   [hl],a                     ; 02:4BDD
Code024BDE:
    ld   hl,W_SpriteYSpeed          ; 02:4BDE
    add  hl,bc                      ; 02:4BE1
    ld   a,[hl]                     ; 02:4BE2
    bit  7,a                        ; 02:4BE3
    jr   nz,Code024BF6              ; 02:4BE5
    call Sub001BCF                  ; 02:4BE7
    ldh  a,[<$FFA5]                 ; 02:4BEA
    and  $03                        ; 02:4BEC
    jr   z,Code024BF6               ; 02:4BEE
    ld   hl,$D14A                   ; 02:4BF0
    add  hl,bc                      ; 02:4BF3
    ld   [hl],$00                   ; 02:4BF4
Code024BF6:
    ld   hl,W_SpriteXSpeed          ; 02:4BF6
    add  hl,bc                      ; 02:4BF9
    ld   a,[W_LevelID]              ; 02:4BFA
    cp   $01                        ; 02:4BFD
    jr   nz,Code024C0C              ; 02:4BFF
    ld   e,$00                      ; 02:4C01
    ld   a,[hl]                     ; 02:4C03
    bit  7,a                        ; 02:4C04
    jr   nz,Code024C15              ; 02:4C06
    ld   e,$0F                      ; 02:4C08
    jr   Code024C15                 ; 02:4C0A
Code024C0C:
    ld   e,$01                      ; 02:4C0C
    ld   a,[hl]                     ; 02:4C0E
    bit  7,a                        ; 02:4C0F
    jr   nz,Code024C15              ; 02:4C11
    ld   e,$0F                      ; 02:4C13
Code024C15:
    ld   a,e                        ; 02:4C15
    ldh  [<$FFA3],a                 ; 02:4C16
    ld   a,$0C                      ; 02:4C18
    ldh  [<$FFA4],a                 ; 02:4C1A
    call Sub001C71                  ; 02:4C1C
    jr   nc,Return024C2A            ; 02:4C1F
    ld   hl,W_SpriteXSpeed          ; 02:4C21
    add  hl,bc                      ; 02:4C24
    ld   a,[hl]                     ; 02:4C25
    xor  $FF                        ; 02:4C26
    inc  a                          ; 02:4C28
    ld   [hl],a                     ; 02:4C29
Return024C2A:
    ret                             ; 02:4C2A

Code024C2B:
    call Sub024C87                  ; 02:4C2B
    ret                             ; 02:4C2E

Code024C2F:
    ld   hl,$D087                   ; 02:4C2F
    add  hl,bc                      ; 02:4C32
    ld   a,[hl]                     ; 02:4C33
    add  $6B                        ; 02:4C34
    ld   [hl],a                     ; 02:4C36
    push af                         ; 02:4C37
    ld   hl,W_SpriteYSpeed          ; 02:4C38
    add  hl,bc                      ; 02:4C3B
    ld   a,[hl]                     ; 02:4C3C
    pop  af                         ; 02:4C3D
    ld   a,[hl]                     ; 02:4C3E
    adc  $01                        ; 02:4C3F
    cp   $10                        ; 02:4C41
    jp   nc,Code024C48              ; 02:4C43
    ld   a,$10                      ; 02:4C46
Code024C48:
    ld   [hl],a                     ; 02:4C48
    call Sub001A3D                  ; 02:4C49
    call Sub001A79                  ; 02:4C4C
    call Sub024C87                  ; 02:4C4F
    jr   nc,Code024C55              ; 02:4C52
    ret                             ; 02:4C54

Code024C55:
    ld   e,$00                      ; 02:4C55
    ld   hl,W_SpriteXSpeed          ; 02:4C57
    add  hl,bc                      ; 02:4C5A
    ld   a,[hl]                     ; 02:4C5B
    bit  7,a                        ; 02:4C5C
    jr   nz,Code024C62              ; 02:4C5E
    ld   e,$10                      ; 02:4C60
Code024C62:
    ld   a,e                        ; 02:4C62
    ldh  [<$FFA3],a                 ; 02:4C63
    ld   a,$08                      ; 02:4C65
    ldh  [<$FFA4],a                 ; 02:4C67
    call Sub001C71                  ; 02:4C69
    jr   nc,Code024C77              ; 02:4C6C
    ld   hl,W_SpriteXSpeed          ; 02:4C6E
    add  hl,bc                      ; 02:4C71
    ld   a,[hl]                     ; 02:4C72
    xor  $FF                        ; 02:4C73
    inc  a                          ; 02:4C75
    ld   [hl],a                     ; 02:4C76
Code024C77:
    call Sub001BCF                  ; 02:4C77
    ldh  a,[<$FFA5]                 ; 02:4C7A
    and  $03                        ; 02:4C7C
    jr   z,Return024C86             ; 02:4C7E
    ld   hl,W_SpriteYSpeed          ; 02:4C80
    add  hl,bc                      ; 02:4C83
    ld   [hl],$D4                   ; 02:4C84
Return024C86:
    ret                             ; 02:4C86

Sub024C87:
    ld   hl,W_SpriteSubstate        ; 02:4C87
    add  hl,bc                      ; 02:4C8A
    ld   a,[hl]                     ; 02:4C8B
    and  a                          ; 02:4C8C
    jr   nz,Code024C9D              ; 02:4C8D
    ld   hl,$D1D1                   ; 02:4C8F
    add  hl,bc                      ; 02:4C92
    ld   a,[hl]                     ; 02:4C93
    add  $0C                        ; 02:4C94
    ld   hl,W_SpriteYLow            ; 02:4C96
    add  hl,bc                      ; 02:4C99
    cp   [hl]                       ; 02:4C9A
    jr   c,Code024CB8               ; 02:4C9B
Code024C9D:
    call Sub001D21                  ; 02:4C9D
    jr   nc,Code024CB8              ; 02:4CA0
    call Sub024CBB                  ; 02:4CA2
    jr   c,Code024CB8               ; 02:4CA5
    ld   hl,W_SpriteStatus          ; 02:4CA7
    add  hl,bc                      ; 02:4CAA
    ld   [hl],$00                   ; 02:4CAB
    ld   hl,W_SpriteID              ; 02:4CAD
    add  hl,bc                      ; 02:4CB0
    ld   [hl],$00                   ; 02:4CB1
    call Sub024CE2                  ; 02:4CB3
    scf                             ; 02:4CB6
    ret                             ; 02:4CB7

Code024CB8:
    scf                             ; 02:4CB8
    ccf                             ; 02:4CB9
    ret                             ; 02:4CBA

Sub024CBB:
    ld   a,[W_GameMode]             ; 02:4CBB
    cp   $02                        ; 02:4CBE
    jr   nz,Code024CDF              ; 02:4CC0
    ld   a,[$D2F5]                  ; 02:4CC2
    swap a                          ; 02:4CC5
    sla  a                          ; 02:4CC7
    sla  a                          ; 02:4CC9
    sla  a                          ; 02:4CCB
    ld   e,a                        ; 02:4CCD
    ld   d,$00                      ; 02:4CCE
    ld   hl,$C509                   ; 02:4CD0
    add  hl,de                      ; 02:4CD3
    ld   a,[hl]                     ; 02:4CD4
    cp   $07                        ; 02:4CD5
    jr   z,Code024CDD               ; 02:4CD7
    cp   $09                        ; 02:4CD9
    jr   nz,Code024CDF              ; 02:4CDB
Code024CDD:
    scf                             ; 02:4CDD
    ret                             ; 02:4CDE

Code024CDF:
    scf                             ; 02:4CDF
    ccf                             ; 02:4CE0
    ret                             ; 02:4CE1

Sub024CE2:
    ld   hl,$D11D                   ; 02:4CE2
    add  hl,bc                      ; 02:4CE5
    ld   a,[hl]                     ; 02:4CE6
    rst  $00                        ; 02:4CE7  Execute from 16-bit pointer table
.dw Code024CF6                      ; 02:4CE8
.dw Code024CF6                      ; 02:4CEA
.dw Code024DA4                      ; 02:4CEC
.dw Code024E01                      ; 02:4CEE
.dw Code024E33                      ; 02:4CF0
.dw Code024E58                      ; 02:4CF2
.dw Code024E68                      ; 02:4CF4

Code024CF6:
    ld   a,$02                      ; 02:4CF6
    rst  $10                        ; 02:4CF8  24-bit call
.dl SubL_0370E4                     ; 02:4CF9
    ld   a,[W_GameMode]             ; 02:4CFC
    cp   $07                        ; 02:4CFF
    jr   z,Code024D2C               ; 02:4D01
    cp   $02                        ; 02:4D03
    jr   z,Code024D45               ; 02:4D05
    ld   de,$0040                   ; 02:4D07
    ld   a,$01                      ; 02:4D0A
    call Return0010B2               ; 02:4D0C
Code024D0F:
    ld   a,[W_GameMode]             ; 02:4D0F
    cp   $07                        ; 02:4D12
    jr   z,Return024D2B             ; 02:4D14
    cp   $02                        ; 02:4D16
    jr   z,Return024D2B             ; 02:4D18
    ld   a,$64                      ; 02:4D1A
    ldh  [<$FF97],a                 ; 02:4D1C
    xor  a                          ; 02:4D1E
    ldh  [<$FF98],a                 ; 02:4D1F
    call GivePointsFF97             ; 02:4D21
    ld   a,$05                      ; 02:4D24
    ldh  [<$FF9B],a                 ; 02:4D26
    call SpawnScoreSprite           ; 02:4D28
Return024D2B:
    ret                             ; 02:4D2B

Code024D2C:
    ld   a,[W_PlayerState]          ; 02:4D2C
    cp   $07                        ; 02:4D2F
    jr   z,Code024D0F               ; 02:4D31
    cp   $09                        ; 02:4D33
    jr   z,Code024D0F               ; 02:4D35
    ld   a,[$C1F8]                  ; 02:4D37
    add  $05                        ; 02:4D3A
    ld   [$C1F8],a                  ; 02:4D3C
    xor  a                          ; 02:4D3F
    ld   [$C1F9],a                  ; 02:4D40
    jr   Code024D7C                 ; 02:4D43
Code024D45:
    ld   a,[$D2F5]                  ; 02:4D45
    and  a                          ; 02:4D48
    jr   nz,Code024D53              ; 02:4D49
    ld   de,$0040                   ; 02:4D4B
    ld   a,$01                      ; 02:4D4E
    call Return0010B2               ; 02:4D50
Code024D53:
    ld   a,[$D2F5]                  ; 02:4D53
    swap a                          ; 02:4D56
    sla  a                          ; 02:4D58
    sla  a                          ; 02:4D5A
    sla  a                          ; 02:4D5C
    ld   e,a                        ; 02:4D5E
    ld   d,$00                      ; 02:4D5F
    ld   hl,$C509                   ; 02:4D61
    add  hl,de                      ; 02:4D64
    ld   a,[hl]                     ; 02:4D65
    cp   $07                        ; 02:4D66
    jr   z,Code024D0F               ; 02:4D68
    cp   $09                        ; 02:4D6A
    jr   z,Code024D0F               ; 02:4D6C
    ld   hl,$C541                   ; 02:4D6E
    add  hl,de                      ; 02:4D71
    ld   [hl],$00                   ; 02:4D72
    ld   hl,$C540                   ; 02:4D74
    add  hl,de                      ; 02:4D77
    ld   a,[hl]                     ; 02:4D78
    add  $05                        ; 02:4D79
    ld   [hl],a                     ; 02:4D7B
Code024D7C:
    ld   hl,W_SpriteXLow            ; 02:4D7C
    add  hl,bc                      ; 02:4D7F
    ld   a,[hl]                     ; 02:4D80
    ldh  [<$FF97],a                 ; 02:4D81
    ld   hl,W_SpriteXHigh           ; 02:4D83
    add  hl,bc                      ; 02:4D86
    ld   a,[hl]                     ; 02:4D87
    ldh  [<$FF98],a                 ; 02:4D88
    ld   hl,W_SpriteYLow            ; 02:4D8A
    add  hl,bc                      ; 02:4D8D
    ld   a,[hl]                     ; 02:4D8E
    ldh  [<$FF99],a                 ; 02:4D8F
    ld   a,$02                      ; 02:4D91
    ldh  [<$FF9B],a                 ; 02:4D93
    call Sub024797                  ; 02:4D95
    ld   hl,W_SpriteYLow            ; 02:4D98
    add  hl,de                      ; 02:4D9B
    ld   a,[hl]                     ; 02:4D9C
    dec  a                          ; 02:4D9D
    ld   hl,$D1D1                   ; 02:4D9E
    add  hl,de                      ; 02:4DA1
    ld   [hl],a                     ; 02:4DA2
    ret                             ; 02:4DA3

Code024DA4:
    ld   a,[W_GameMode]             ; 02:4DA4
    cp   $02                        ; 02:4DA7
    jr   z,Code024DD5               ; 02:4DA9
    xor  a                          ; 02:4DAB
    ld   [$C1DA],a                  ; 02:4DAC
    ld   a,$03                      ; 02:4DAF
    ld   [$C1DB],a                  ; 02:4DB1
    ld   a,$65                      ; 02:4DB4
    ld   [$DE68],a                  ; 02:4DB6
    ld   de,$0008                   ; 02:4DB9
    ld   a,$01                      ; 02:4DBC
    call Return0010B2               ; 02:4DBE
    ld   a,$64                      ; 02:4DC1
    ldh  [<$FF97],a                 ; 02:4DC3
    xor  a                          ; 02:4DC5
    ldh  [<$FF98],a                 ; 02:4DC6
    ld   a,$05                      ; 02:4DC8
    ldh  [<$FF9B],a                 ; 02:4DCA
    push bc                         ; 02:4DCC
    call GivePointsFF97             ; 02:4DCD
    call SpawnScoreSprite           ; 02:4DD0
    pop  bc                         ; 02:4DD3
    ret                             ; 02:4DD4

Code024DD5:
    ld   a,[$D2F5]                  ; 02:4DD5
    swap a                          ; 02:4DD8
    sla  a                          ; 02:4DDA
    sla  a                          ; 02:4DDC
    sla  a                          ; 02:4DDE
    ld   e,a                        ; 02:4DE0
    ld   d,$00                      ; 02:4DE1
    ld   hl,$C522                   ; 02:4DE3
    add  hl,de                      ; 02:4DE6
    ld   [hl],$00                   ; 02:4DE7
    ld   hl,$C523                   ; 02:4DE9
    add  hl,de                      ; 02:4DEC
    ld   [hl],$03                   ; 02:4DED
    ld   a,$65                      ; 02:4DEF
    ld   [$DE68],a                  ; 02:4DF1
    ld   a,e                        ; 02:4DF4
    and  a                          ; 02:4DF5
    jr   nz,Return024E00            ; 02:4DF6
    ld   de,$0008                   ; 02:4DF8
    ld   a,$01                      ; 02:4DFB
    call Return0010B2               ; 02:4DFD
Return024E00:
    ret                             ; 02:4E00

Code024E01:
    ld   a,[W_ChallengeFlag]        ; 02:4E01
    and  a                          ; 02:4E04
    jr   nz,Code024E13              ; 02:4E05
    call Give1up                    ; 02:4E07
    ld   a,$0A                      ; 02:4E0A
    ldh  [<$FF9B],a                 ; 02:4E0C
    call SpawnScoreSprite           ; 02:4E0E
    jr   Code024E2A                 ; 02:4E11
Code024E13:
    ld   a,$C8                      ; 02:4E13
    ldh  [<$FF97],a                 ; 02:4E15
    xor  a                          ; 02:4E17
    ldh  [<$FF98],a                 ; 02:4E18
    ld   a,$06                      ; 02:4E1A
    ldh  [<$FF9B],a                 ; 02:4E1C
    push bc                         ; 02:4E1E
    call GivePointsFF97             ; 02:4E1F
    call SpawnScoreSprite           ; 02:4E22
    pop  bc                         ; 02:4E25
    ld   a,$28                      ; 02:4E26
    ldh  [<$FFF3],a                 ; 02:4E28
Code024E2A:
    ld   de,$0008                   ; 02:4E2A
    ld   a,$01                      ; 02:4E2D
    call Return0010B2               ; 02:4E2F
    ret                             ; 02:4E32

Code024E33:
    ld   a,$01                      ; 02:4E33
    ld   [W_YoshiEggItemFlag],a     ; 02:4E35
    ld   a,$62                      ; 02:4E38
    ldh  [<$FFF2],a                 ; 02:4E3A
    ld   de,$0008                   ; 02:4E3C
    ld   a,$01                      ; 02:4E3F
    call Return0010B2               ; 02:4E41
    ld   a,$C8                      ; 02:4E44
    ldh  [<$FF97],a                 ; 02:4E46
    xor  a                          ; 02:4E48
    ldh  [<$FF98],a                 ; 02:4E49
    ld   a,$06                      ; 02:4E4B
    ldh  [<$FF9B],a                 ; 02:4E4D
    push bc                         ; 02:4E4F
    call GivePointsFF97             ; 02:4E50
    call SpawnScoreSprite           ; 02:4E53
    pop  bc                         ; 02:4E56
    ret                             ; 02:4E57

Code024E58:
    ld   a,[$C1DA]                  ; 02:4E58
    ld   hl,$C1DB                   ; 02:4E5B
    or   [hl]                       ; 02:4E5E
    and  a                          ; 02:4E5F
    ret  nz                         ; 02:4E60
    ld   a,$02                      ; 02:4E61
    rst  $10                        ; 02:4E63  24-bit call
.dl SubL_0B4074                     ; 02:4E64
    ret                             ; 02:4E67

Code024E68:
    ld   hl,W_SpriteXLow            ; 02:4E68
    add  hl,bc                      ; 02:4E6B
    ld   a,[hl]                     ; 02:4E6C
    ld   [$C221],a                  ; 02:4E6D
    ld   hl,W_SpriteXHigh           ; 02:4E70
    add  hl,bc                      ; 02:4E73
    ld   a,[hl]                     ; 02:4E74
    ld   [$C229],a                  ; 02:4E75
    ld   de,$0000                   ; 02:4E78
    call Sub002D9C                  ; 02:4E7B
    ld   a,$14                      ; 02:4E7E
    ldh  [<$FF97],a                 ; 02:4E80
    xor  a                          ; 02:4E82
    ldh  [<$FF98],a                 ; 02:4E83
    call GivePointsFF97             ; 02:4E85
    ret                             ; 02:4E88

SubL_KoopaBuzzy_Init:
    call KoopaBuzzy_Init            ; 02:4E89
    rst  $18                        ; 02:4E8C  Return from 24-bit call

KoopaBuzzy_Init:
; sprite 02-03,31 init
    ld   e,$01                      ; 02:4E8D
    ld   hl,W_SpriteID              ; 02:4E8F
    add  hl,bc                      ; 02:4E92
    ld   a,[hl]                     ; 02:4E93
    cp   $03                        ; 02:4E94
    jr   z,Code024E9D               ; 02:4E96
    cp   $31                        ; 02:4E98
    jr   nz,Code024EA3              ; 02:4E9A
    inc  e                          ; 02:4E9C
Code024E9D:
    ld   hl,$D0E1                   ; 02:4E9D
    add  hl,bc                      ; 02:4EA0
    ld   a,e                        ; 02:4EA1
    ld   [hl],a                     ; 02:4EA2
Code024EA3:
    ld   a,[W_HardFlag]             ; 02:4EA3
    sla  a                          ; 02:4EA6
    ld   e,a                        ; 02:4EA8
    ld   d,$00                      ; 02:4EA9
    ld   hl,Data024ED7              ; 02:4EAB
    add  hl,de                      ; 02:4EAE
    ld   a,[hl]                     ; 02:4EAF
    ld   hl,W_SpriteXSpeed          ; 02:4EB0
    add  hl,bc                      ; 02:4EB3
    ld   [hl],a                     ; 02:4EB4
    ld   hl,$D168                   ; 02:4EB5
    add  hl,bc                      ; 02:4EB8
    ld   [hl],$00                   ; 02:4EB9
    ld   hl,$D13B                   ; 02:4EBB
    add  hl,bc                      ; 02:4EBE
    ld   [hl],$02                   ; 02:4EBF
    ld   hl,$D10E                   ; 02:4EC1
    add  hl,bc                      ; 02:4EC4
    ld   a,[hl]                     ; 02:4EC5
    and  $80                        ; 02:4EC6
    or   $03                        ; 02:4EC8
    ld   [hl],a                     ; 02:4ECA
    ld   a,[W_GameMode]             ; 02:4ECB
    cp   $02                        ; 02:4ECE
    jr   nz,Return024ED6            ; 02:4ED0
    ld   a,[hl]                     ; 02:4ED2
    cpl                             ; 02:4ED3
    inc  a                          ; 02:4ED4
    ld   [hl],a                     ; 02:4ED5
Return024ED6:
    ret                             ; 02:4ED6

Data024ED7:                         ; 02:4ED7
.db $F8,$08,$F4,$0C
Data024EDB:                         ; 02:4EDB
.db $40,$40,$40,$40

KoopaBuzzy_Main:
; sprite 02-03,31 main
    call Sub0025CB                  ; 02:4EDF
    jp   c,Code024F26               ; 02:4EE2
    ld   a,[$C1D8]                  ; 02:4EE5
    and  a                          ; 02:4EE8
    jr   z,Code024EF1               ; 02:4EE9
    ld   hl,$D0FF                   ; 02:4EEB
    add  hl,bc                      ; 02:4EEE
    ld   [hl],$02                   ; 02:4EEF
Code024EF1:
    ld   hl,W_SpriteSubstate        ; 02:4EF1
    add  hl,bc                      ; 02:4EF4
    push hl                         ; 02:4EF5
    ld   e,[hl]                     ; 02:4EF6
    ld   d,$00                      ; 02:4EF7
    ld   hl,Data024EDB              ; 02:4EF9
    add  hl,de                      ; 02:4EFC
    ld   a,[hl]                     ; 02:4EFD
    ld   e,a                        ; 02:4EFE
    pop  hl                         ; 02:4EFF
    ld   a,[hl]                     ; 02:4F00
    cp   $02                        ; 02:4F01
    jr   nz,Code024F0C              ; 02:4F03
    ld   hl,W_SpriteYSpeed          ; 02:4F05
    add  hl,bc                      ; 02:4F08
    ld   a,e                        ; 02:4F09
    jr   Code024F1C                 ; 02:4F0A
Code024F0C:
    ld   hl,W_SpriteYSpeed          ; 02:4F0C
    add  hl,bc                      ; 02:4F0F
    ld   a,$04                      ; 02:4F10
    add  [hl]                       ; 02:4F12
    bit  7,a                        ; 02:4F13
    jr   nz,Code024F1C              ; 02:4F15
    cp   e                          ; 02:4F17
    jp   c,Code024F1C               ; 02:4F18
    ld   a,e                        ; 02:4F1B
Code024F1C:
    ld   [hl],a                     ; 02:4F1C
    call Sub001A3D                  ; 02:4F1D
    call Sub001A79                  ; 02:4F20
    call Sub024F2A                  ; 02:4F23
Code024F26:
    call Sub024F38                  ; 02:4F26
    ret                             ; 02:4F29

Sub024F2A:
    ld   hl,W_SpriteSubstate        ; 02:4F2A
    add  hl,bc                      ; 02:4F2D
    ld   a,[hl]                     ; 02:4F2E
    rst  $00                        ; 02:4F2F  Execute from 16-bit pointer table
.dw Code024F46                      ; 02:4F30
.dw Code0250F1                      ; 02:4F32
.dw Code02524E                      ; 02:4F34
.dw Code02546F                      ; 02:4F36

Sub024F38:
    ld   hl,W_SpriteSubstate        ; 02:4F38
    add  hl,bc                      ; 02:4F3B
    ld   a,[hl]                     ; 02:4F3C
    rst  $00                        ; 02:4F3D  Execute from 16-bit pointer table
.dw Code0255B3                      ; 02:4F3E
.dw Code0256B6                      ; 02:4F40
.dw Code0256CD                      ; 02:4F42
.dw Code0256CD                      ; 02:4F44

Code024F46:
    call Sub002920                  ; 02:4F46
    jp   c,Return0250E6             ; 02:4F49
    call Sub0029DA                  ; 02:4F4C
    call Sub001D21                  ; 02:4F4F
    jp   nc,Code024FF4              ; 02:4F52
    ld   e,a                        ; 02:4F55
    ld   a,[$C1DA]                  ; 02:4F56
    ld   hl,$C1DB                   ; 02:4F59
    or   [hl]                       ; 02:4F5C
    jr   nz,Code024FD5              ; 02:4F5D
    ldh  a,[<H_PlInitY_SubLvType]   ; 02:4F5F
    and  $0F                        ; 02:4F61
    cp   $02                        ; 02:4F63
    jr   z,Code024FCA               ; 02:4F65
    ld   a,e                        ; 02:4F67
    cp   $02                        ; 02:4F68
    jr   z,Code024FCA               ; 02:4F6A
    and  a                          ; 02:4F6C
    jr   z,Code024FCA               ; 02:4F6D
    call Sub002189                  ; 02:4F6F
    jr   nc,Code024FCA              ; 02:4F72
    ld   hl,$D20D                   ; 02:4F74
    add  hl,bc                      ; 02:4F77
    ld   [hl],$08                   ; 02:4F78
    ld   hl,W_SpriteSubstate        ; 02:4F7A
    add  hl,bc                      ; 02:4F7D
    inc  [hl]                       ; 02:4F7E
    ld   hl,$D0FF                   ; 02:4F7F
    add  hl,bc                      ; 02:4F82
    ld   [hl],$02                   ; 02:4F83
    xor  a                          ; 02:4F85
    ld   hl,$D177                   ; 02:4F86
    add  hl,bc                      ; 02:4F89
    ld   [hl],a                     ; 02:4F8A
    ld   hl,W_SpriteXSpeed          ; 02:4F8B
    add  hl,bc                      ; 02:4F8E
    ld   [hl],a                     ; 02:4F8F
    ld   hl,$D159                   ; 02:4F90
    add  hl,bc                      ; 02:4F93
    ld   [hl],a                     ; 02:4F94
    ld   hl,$D096                   ; 02:4F95
    add  hl,bc                      ; 02:4F98
    ld   [hl],$02                   ; 02:4F99
    ld   hl,$D0A5                   ; 02:4F9B
    add  hl,bc                      ; 02:4F9E
    ld   [hl],$4A                   ; 02:4F9F
    ld   hl,$D0B4                   ; 02:4FA1
    add  hl,bc                      ; 02:4FA4
    ld   [hl],$01                   ; 02:4FA5
    ld   hl,$D0C3                   ; 02:4FA7
    add  hl,bc                      ; 02:4FAA
    ld   [hl],$02                   ; 02:4FAB
    call Sub0025F8                  ; 02:4FAD
    call Sub002E64                  ; 02:4FB0
    ld   hl,W_SpriteID              ; 02:4FB3
    add  hl,bc                      ; 02:4FB6
    ld   a,[hl]                     ; 02:4FB7
    cp   $31                        ; 02:4FB8
    jr   z,Code024FC3               ; 02:4FBA
    ld   hl,W_AlbumUnlockFlags+2    ; 02:4FBC
    set  3,[hl]                     ; 02:4FBF
    jr   Code024FF4                 ; 02:4FC1
Code024FC3:
    ld   hl,W_AlbumUnlockFlags+2    ; 02:4FC3
    set  1,[hl]                     ; 02:4FC6
    jr   Code024FF4                 ; 02:4FC8
Code024FCA:
    ld   a,$02                      ; 02:4FCA
    rst  $10                        ; 02:4FCC  24-bit call
.dl SubL_0B4074                     ; 02:4FCD
    call Sub003000                  ; 02:4FD0
    jr   Code024FF4                 ; 02:4FD3
Code024FD5:
    ld   hl,W_SpriteStatus          ; 02:4FD5
    add  hl,bc                      ; 02:4FD8
    ld   a,$03                      ; 02:4FD9
    ld   [hl],a                     ; 02:4FDB
    call Sub001965                  ; 02:4FDC
    ld   hl,W_SpriteID              ; 02:4FDF
    add  hl,bc                      ; 02:4FE2
    ld   a,[hl]                     ; 02:4FE3
    cp   $31                        ; 02:4FE4
    jr   z,Code024FEE               ; 02:4FE6
    ld   hl,W_AlbumUnlockFlags+2    ; 02:4FE8
    set  3,[hl]                     ; 02:4FEB
    ret                             ; 02:4FED

Code024FEE:
    ld   hl,W_AlbumUnlockFlags+2    ; 02:4FEE
    set  1,[hl]                     ; 02:4FF1
    ret                             ; 02:4FF3

Code024FF4:
    call Sub00218B                  ; 02:4FF4
    jr   nc,Code025051              ; 02:4FF7
    ld   d,$00                      ; 02:4FF9
    ld   hl,W_SpriteID              ; 02:4FFB
    add  hl,de                      ; 02:4FFE
    ld   a,[hl]                     ; 02:4FFF
    cp   $23                        ; 02:5000
    jr   z,Code025051               ; 02:5002
    cp   $0D                        ; 02:5004
    jr   z,Code025051               ; 02:5006
    cp   $02                        ; 02:5008
    jr   z,Code025014               ; 02:500A
    cp   $03                        ; 02:500C
    jr   z,Code025014               ; 02:500E
    cp   $31                        ; 02:5010
    jr   nz,Code025049              ; 02:5012
Code025014:
    ld   hl,W_SpriteSubstate        ; 02:5014
    add  hl,de                      ; 02:5017
    ld   a,[hl]                     ; 02:5018
    cp   $02                        ; 02:5019
    jr   z,Code025051               ; 02:501B
    cp   $01                        ; 02:501D
    jr   nz,Code025049              ; 02:501F
    ld   hl,$D168                   ; 02:5021
    add  hl,bc                      ; 02:5024
    ld   a,[hl]                     ; 02:5025
    and  a                          ; 02:5026
    jr   nz,Code025051              ; 02:5027
    ld   hl,W_SpriteXLow            ; 02:5029
    add  hl,de                      ; 02:502C
    ld   e,l                        ; 02:502D
    ld   d,h                        ; 02:502E
    ld   hl,W_SpriteXLow            ; 02:502F
    add  hl,bc                      ; 02:5032
    ld   a,[de]                     ; 02:5033
    cp   [hl]                       ; 02:5034
    jr   nc,Code02503A              ; 02:5035
    ld   a,[hl]                     ; 02:5037
    ld   l,e                        ; 02:5038
    ld   h,d                        ; 02:5039
Code02503A:
    sub  [hl]                       ; 02:503A
    ld   hl,$D168                   ; 02:503B
    add  hl,bc                      ; 02:503E
    cp   $0C                        ; 02:503F
    jr   nc,Code025047              ; 02:5041
    ld   [hl],$01                   ; 02:5043
    jr   Code025049                 ; 02:5045
Code025047:
    ld   [hl],$00                   ; 02:5047
Code025049:
    ld   hl,W_SpriteXSpeed          ; 02:5049
    add  hl,bc                      ; 02:504C
    ld   a,[hl]                     ; 02:504D
    cpl                             ; 02:504E
    inc  a                          ; 02:504F
    ld   [hl],a                     ; 02:5050
Code025051:
    ld   e,$00                      ; 02:5051
    ld   hl,W_SpriteXSpeed          ; 02:5053
    add  hl,bc                      ; 02:5056
    ld   a,[hl]                     ; 02:5057
    bit  7,a                        ; 02:5058
    jr   nz,Code02505E              ; 02:505A
    ld   e,$10                      ; 02:505C
Code02505E:
    ld   a,e                        ; 02:505E
    ldh  [<$FFA3],a                 ; 02:505F
    ld   a,$08                      ; 02:5061
    ldh  [<$FFA4],a                 ; 02:5063
    call Sub001C71                  ; 02:5065
    jr   nc,Code025073              ; 02:5068
    ld   hl,W_SpriteXSpeed          ; 02:506A
    add  hl,bc                      ; 02:506D
    ld   a,[hl]                     ; 02:506E
    xor  $FF                        ; 02:506F
    inc  a                          ; 02:5071
    ld   [hl],a                     ; 02:5072
Code025073:
    call Sub001BCF                  ; 02:5073
    ld   hl,W_SpriteSubstate        ; 02:5076
    add  hl,bc                      ; 02:5079
    ld   a,[hl]                     ; 02:507A
    cp   $01                        ; 02:507B
    ret  z                          ; 02:507D
    ld   hl,$D1EF                   ; 02:507E
    add  hl,bc                      ; 02:5081
    ld   a,[hl]                     ; 02:5082
    cp   $01                        ; 02:5083
    jr   nz,Code0250A5              ; 02:5085
    call Sub002FEF                  ; 02:5087
    push af                         ; 02:508A
    ld   a,[W_HardFlag]             ; 02:508B
    sla  a                          ; 02:508E
    ld   e,a                        ; 02:5090
    ld   d,$00                      ; 02:5091
    ld   hl,Data024ED7              ; 02:5093
    add  hl,de                      ; 02:5096
    ld   e,[hl]                     ; 02:5097
    pop  af                         ; 02:5098
    ld   a,e                        ; 02:5099
    jr   c,Code02509E               ; 02:509A
    cpl                             ; 02:509C
    inc  a                          ; 02:509D
Code02509E:
    ld   hl,W_SpriteXSpeed          ; 02:509E
    add  hl,bc                      ; 02:50A1
    ld   [hl],a                     ; 02:50A2
    jr   Code0250D0                 ; 02:50A3
Code0250A5:
    ld   hl,$D0E1                   ; 02:50A5
    add  hl,bc                      ; 02:50A8
    ld   a,[hl]                     ; 02:50A9
    and  a                          ; 02:50AA
    jr   nz,Code0250CA              ; 02:50AB
    ldh  a,[<$FFA5]                 ; 02:50AD
    and  $03                        ; 02:50AF
    jr   z,Code0250CA               ; 02:50B1
    cp   $03                        ; 02:50B3
    jr   z,Code0250CA               ; 02:50B5
    ld   hl,$D12C                   ; 02:50B7
    add  hl,bc                      ; 02:50BA
    ld   a,[hl]                     ; 02:50BB
    ld   hl,W_SpriteXSpeed          ; 02:50BC
    add  hl,bc                      ; 02:50BF
    cp   [hl]                       ; 02:50C0
    jr   z,Code0250D0               ; 02:50C1
    ld   a,[hl]                     ; 02:50C3
    xor  $FF                        ; 02:50C4
    inc  a                          ; 02:50C6
    ld   [hl],a                     ; 02:50C7
    jr   Code0250CB                 ; 02:50C8
Code0250CA:
    xor  a                          ; 02:50CA
Code0250CB:
    ld   hl,$D12C                   ; 02:50CB
    add  hl,bc                      ; 02:50CE
    ld   [hl],a                     ; 02:50CF
Code0250D0:
    ld   hl,$D096                   ; 02:50D0
    add  hl,bc                      ; 02:50D3
    ld   a,[hl]                     ; 02:50D4
    dec  a                          ; 02:50D5
    ld   [hl],a                     ; 02:50D6
    bit  7,a                        ; 02:50D7
    jr   z,Return0250E6             ; 02:50D9
    ld   [hl],$07                   ; 02:50DB
    ld   hl,$D177                   ; 02:50DD
    add  hl,bc                      ; 02:50E0
    ld   a,[hl]                     ; 02:50E1
    inc  a                          ; 02:50E2
    and  $01                        ; 02:50E3
    ld   [hl],a                     ; 02:50E5
Return0250E6:
    ret                             ; 02:50E6

Data0250E7:                         ; 02:50E7
.db $30,$D0
Data0250E9:                         ; 02:50E9
.db $02,$02,$02,$03,$03,$05,$09,$09
Code0250F1:
    call Sub0029DA                  ; 02:50F1
    ld   hl,$D0C3                   ; 02:50F4
    add  hl,bc                      ; 02:50F7
    ld   a,[hl]                     ; 02:50F8
    and  a                          ; 02:50F9
    jr   z,Code0250FD               ; 02:50FA
    dec  [hl]                       ; 02:50FC
Code0250FD:
    ld   hl,$D0A5                   ; 02:50FD
    add  hl,bc                      ; 02:5100
    ld   a,[hl]                     ; 02:5101
    dec  [hl]                       ; 02:5102
    and  a                          ; 02:5103
    jr   nz,Code02515B              ; 02:5104
    ld   hl,$D0B4                   ; 02:5106
    add  hl,bc                      ; 02:5109
    ld   a,[hl]                     ; 02:510A
    dec  [hl]                       ; 02:510B
    and  a                          ; 02:510C
    jr   nz,Code02515B              ; 02:510D
    ld   [hl],$00                   ; 02:510F
    ld   hl,$D0A5                   ; 02:5111
    add  hl,bc                      ; 02:5114
    ld   [hl],$00                   ; 02:5115
    ld   hl,W_SpriteSubstate        ; 02:5117
    add  hl,bc                      ; 02:511A
    ld   [hl],$00                   ; 02:511B
    ld   hl,$D11D                   ; 02:511D
    add  hl,bc                      ; 02:5120
    ld   [hl],$00                   ; 02:5121
    ld   hl,$D13B                   ; 02:5123
    add  hl,bc                      ; 02:5126
    ld   [hl],$02                   ; 02:5127
    ld   hl,$D258                   ; 02:5129
    add  hl,bc                      ; 02:512C
    ld   [hl],$00                   ; 02:512D
    ld   e,$00                      ; 02:512F
    ld   hl,W_SpriteXHigh           ; 02:5131
    add  hl,bc                      ; 02:5134
    push hl                         ; 02:5135
    ld   hl,W_SpriteXLow            ; 02:5136
    add  hl,bc                      ; 02:5139
    ldh  a,[<H_PlayerXLow]          ; 02:513A
    sub  [hl]                       ; 02:513C
    pop  hl                         ; 02:513D
    ldh  a,[<H_PlayerXHigh]         ; 02:513E
    sbc  [hl]                       ; 02:5140
    bit  7,a                        ; 02:5141
    jr   nz,Code025146              ; 02:5143
    inc  e                          ; 02:5145
Code025146:
    ld   a,[W_HardFlag]             ; 02:5146
    sla  a                          ; 02:5149
    or   e                          ; 02:514B
    ld   e,a                        ; 02:514C
    ld   d,$00                      ; 02:514D
    ld   hl,Data024ED7              ; 02:514F
    add  hl,de                      ; 02:5152
    ld   a,[hl]                     ; 02:5153
    ld   hl,W_SpriteXSpeed          ; 02:5154
    add  hl,bc                      ; 02:5157
    ld   [hl],a                     ; 02:5158
    jr   Code02515B                 ; 02:5159
Code02515B:
    call Sub002920                  ; 02:515B
    jp   c,Return02524D             ; 02:515E
    call Sub001D21                  ; 02:5161
    jp   nc,Code02521A              ; 02:5164
    ld   e,a                        ; 02:5167
    ld   a,[$C1DA]                  ; 02:5168
    ld   hl,$C1DB                   ; 02:516B
    or   [hl]                       ; 02:516E
    jr   z,Code02517C               ; 02:516F
    call Sub001965                  ; 02:5171
    ld   hl,W_AlbumUnlockFlags+2    ; 02:5174
    set  3,[hl]                     ; 02:5177
    jp   Code02521A                 ; 02:5179
Code02517C:
    ld   hl,$D0C3                   ; 02:517C
    add  hl,bc                      ; 02:517F
    ld   a,[hl]                     ; 02:5180
    and  a                          ; 02:5181
    jp   nz,Code02521A              ; 02:5182
    call Sub002189                  ; 02:5185
    jp   nc,Code02521A              ; 02:5188
    ld   hl,$D1EF                   ; 02:518B
    add  hl,bc                      ; 02:518E
    ld   a,[hl]                     ; 02:518F
    and  a                          ; 02:5190
    jp   z,Code02521A               ; 02:5191
    call Sub025525                  ; 02:5194
    ld   a,[$C1D8]                  ; 02:5197
    and  a                          ; 02:519A
    jr   nz,Code0251B4              ; 02:519B
    ld   hl,$D10E                   ; 02:519D
    add  hl,bc                      ; 02:51A0
    ld   a,[hl]                     ; 02:51A1
    bit  7,a                        ; 02:51A2
    jp   nz,Code0251E3              ; 02:51A4
    ld   a,[$C1DE]                  ; 02:51A7
    inc  a                          ; 02:51AA
    inc  a                          ; 02:51AB
    cp   $0A                        ; 02:51AC
    jr   c,Code02520A               ; 02:51AE
    ld   a,$0A                      ; 02:51B0
    jr   Code02520A                 ; 02:51B2
Code0251B4:
    ld   hl,$D159                   ; 02:51B4
    add  hl,bc                      ; 02:51B7
    ld   a,[hl]                     ; 02:51B8
    and  a                          ; 02:51B9
    jr   z,Code0251D6               ; 02:51BA
    inc  a                          ; 02:51BC
    srl  a                          ; 02:51BD
    and  $07                        ; 02:51BF
    push bc                         ; 02:51C1
    ld   c,a                        ; 02:51C2
    ld   b,$00                      ; 02:51C3
    ld   hl,Data0250E9              ; 02:51C5
    add  hl,bc                      ; 02:51C8
    ld   a,[hl]                     ; 02:51C9
    pop  bc                         ; 02:51CA
    ld   hl,$D0FF                   ; 02:51CB
    add  hl,bc                      ; 02:51CE
    ld   [hl],a                     ; 02:51CF
    ld   hl,$D159                   ; 02:51D0
    add  hl,bc                      ; 02:51D3
    xor  a                          ; 02:51D4
    ld   [hl],a                     ; 02:51D5
Code0251D6:
    ld   hl,$D10E                   ; 02:51D6
    add  hl,bc                      ; 02:51D9
    ld   a,[hl]                     ; 02:51DA
    bit  7,a                        ; 02:51DB
    jr   z,Code025205               ; 02:51DD
    bit  6,a                        ; 02:51DF
    jr   z,Code025205               ; 02:51E1
Code0251E3:
    and  $BF                        ; 02:51E3
    ld   [hl],a                     ; 02:51E5
    and  $3F                        ; 02:51E6
    push af                         ; 02:51E8
    call Sub002E90                  ; 02:51E9
    pop  af                         ; 02:51EC
    cp   $09                        ; 02:51ED
    jr   c,Code02521A               ; 02:51EF
    ld   e,$04                      ; 02:51F1
    ld   hl,W_SpriteXSpeed          ; 02:51F3
    add  hl,bc                      ; 02:51F6
    ld   a,[hl]                     ; 02:51F7
    bit  7,a                        ; 02:51F8
    jr   z,Code0251FE               ; 02:51FA
    ld   e,$FC                      ; 02:51FC
Code0251FE:
    ld   a,e                        ; 02:51FE
    ldh  [<$FF97],a                 ; 02:51FF
    call Sub0019C1                  ; 02:5201
    ret                             ; 02:5204

Code025205:
    ld   hl,$D0FF                   ; 02:5205
    add  hl,bc                      ; 02:5208
    ld   a,[hl]                     ; 02:5209
Code02520A:
    call Sub002E90                  ; 02:520A
    ld   hl,$D0FF                   ; 02:520D
    add  hl,bc                      ; 02:5210
    ld   a,[hl]                     ; 02:5211
    inc  a                          ; 02:5212
    cp   $0A                        ; 02:5213
    jr   c,Code025219               ; 02:5215
    ld   a,$0A                      ; 02:5217
Code025219:
    ld   [hl],a                     ; 02:5219
Code02521A:
    call Sub001BCF                  ; 02:521A
    ld   hl,$D0B4                   ; 02:521D
    add  hl,bc                      ; 02:5220
    ld   a,[hl]                     ; 02:5221
    and  a                          ; 02:5222
    jr   nz,Return02524D            ; 02:5223
    ld   hl,$D0A5                   ; 02:5225
    add  hl,bc                      ; 02:5228
    ld   a,[hl]                     ; 02:5229
    cp   $53                        ; 02:522A
    jr   nc,Return02524D            ; 02:522C
    ld   hl,$D258                   ; 02:522E
    add  hl,bc                      ; 02:5231
    ld   [hl],$01                   ; 02:5232
    ld   hl,$D096                   ; 02:5234
    add  hl,bc                      ; 02:5237
    ld   a,[hl]                     ; 02:5238
    dec  [hl]                       ; 02:5239
    and  a                          ; 02:523A
    jr   nz,Return02524D            ; 02:523B
    ld   [hl],$07                   ; 02:523D
    ld   hl,$D159                   ; 02:523F
    add  hl,bc                      ; 02:5242
    inc  [hl]                       ; 02:5243
    ld   hl,$D177                   ; 02:5244
    add  hl,bc                      ; 02:5247
    ld   a,[hl]                     ; 02:5248
    inc  a                          ; 02:5249
    and  $01                        ; 02:524A
    ld   [hl],a                     ; 02:524C
Return02524D:
    ret                             ; 02:524D

Code02524E:
    call Sub002920                  ; 02:524E
    jp   c,Return02524D             ; 02:5251
    call Sub0029DA                  ; 02:5254
    ld   hl,$D14A                   ; 02:5257
    add  hl,bc                      ; 02:525A
    ld   a,[hl]                     ; 02:525B
    and  a                          ; 02:525C
    jr   z,Code025260               ; 02:525D
    dec  [hl]                       ; 02:525F
Code025260:
    ld   hl,$D0C3                   ; 02:5260
    add  hl,bc                      ; 02:5263
    ld   a,[hl]                     ; 02:5264
    bit  7,a                        ; 02:5265
    jr   nz,Code02526A              ; 02:5267
    inc  [hl]                       ; 02:5269
Code02526A:
    ld   hl,$D0A5                   ; 02:526A
    add  hl,bc                      ; 02:526D
    ld   a,[hl]                     ; 02:526E
    and  a                          ; 02:526F
    jr   z,Code025273               ; 02:5270
    dec  [hl]                       ; 02:5272
Code025273:
    call Sub001D21                  ; 02:5273
    jr   c,Code025281               ; 02:5276
    ld   hl,$D21C                   ; 02:5278
    add  hl,bc                      ; 02:527B
    ld   [hl],$00                   ; 02:527C
    jp   Code025353                 ; 02:527E
Code025281:
    ld   e,a                        ; 02:5281
    ld   hl,$D21C                   ; 02:5282
    add  hl,bc                      ; 02:5285
    ld   a,[hl]                     ; 02:5286
    and  a                          ; 02:5287
    jp   nz,Code025353              ; 02:5288
    ld   a,[$C1DA]                  ; 02:528B
    ld   hl,$C1DB                   ; 02:528E
    or   [hl]                       ; 02:5291
    jp   nz,Code025344              ; 02:5292
    ld   a,e                        ; 02:5295
    cp   $02                        ; 02:5296
    jp   z,Code02532E               ; 02:5298
    ld   a,[$C1D8]                  ; 02:529B
    and  a                          ; 02:529E
    jp   nz,Code02532E              ; 02:529F
    ld   hl,$D0A5                   ; 02:52A2
    add  hl,bc                      ; 02:52A5
    ld   a,[hl]                     ; 02:52A6
    and  a                          ; 02:52A7
    jp   nz,Code025353              ; 02:52A8
    ld   hl,$D0C3                   ; 02:52AB
    add  hl,bc                      ; 02:52AE
    ld   a,[hl]                     ; 02:52AF
    cp   $07                        ; 02:52B0
    jr   nc,Code0252D3              ; 02:52B2
    ld   hl,$D10E                   ; 02:52B4
    add  hl,bc                      ; 02:52B7
    ld   a,[hl]                     ; 02:52B8
    bit  7,a                        ; 02:52B9
    jr   z,Code0252D7               ; 02:52BB
    ld   e,a                        ; 02:52BD
    ld   hl,W_SpriteYLow            ; 02:52BE
    add  hl,bc                      ; 02:52C1
    ld   a,[hl]                     ; 02:52C2
    cp   $E0                        ; 02:52C3
    jr   nc,Code0252D7              ; 02:52C5
    ld   a,e                        ; 02:52C7
    inc  a                          ; 02:52C8
    ld   hl,$D10E                   ; 02:52C9
    add  hl,bc                      ; 02:52CC
    ld   [hl],a                     ; 02:52CD
    or   $40                        ; 02:52CE
    ld   [hl],a                     ; 02:52D0
    jr   Code0252D7                 ; 02:52D1
Code0252D3:
    ld   a,e                        ; 02:52D3
    and  a                          ; 02:52D4
    jr   z,Code02532E               ; 02:52D5
Code0252D7:
    ld   hl,$D0C3                   ; 02:52D7
    add  hl,bc                      ; 02:52DA
    ld   a,[hl]                     ; 02:52DB
    cp   $10                        ; 02:52DC
    jr   c,Code0252E4               ; 02:52DE
    xor  a                          ; 02:52E0
    call Sub002E90                  ; 02:52E1
Code0252E4:
    ld   hl,W_SpriteSubstate        ; 02:52E4
    add  hl,bc                      ; 02:52E7
    ld   [hl],$01                   ; 02:52E8
    ld   hl,$D0A5                   ; 02:52EA
    add  hl,bc                      ; 02:52ED
    ld   [hl],$4A                   ; 02:52EE
    ld   hl,$D0B4                   ; 02:52F0
    add  hl,bc                      ; 02:52F3
    ld   [hl],$01                   ; 02:52F4
    ld   hl,$D0C3                   ; 02:52F6
    add  hl,bc                      ; 02:52F9
    ld   [hl],$08                   ; 02:52FA
    ld   hl,$D177                   ; 02:52FC
    add  hl,bc                      ; 02:52FF
    ld   [hl],$00                   ; 02:5300
    ld   hl,W_SpriteXSpeed          ; 02:5302
    add  hl,bc                      ; 02:5305
    ld   [hl],$00                   ; 02:5306
    ld   hl,$D249                   ; 02:5308
    add  hl,bc                      ; 02:530B
    ld   [hl],$00                   ; 02:530C
    ld   a,$01                      ; 02:530E
    ld   [W_PlayerState],a          ; 02:5310
    xor  a                          ; 02:5313
    ld   [$C1C7],a                  ; 02:5314
    ld   a,$98                      ; 02:5317
    ldh  [<$FFAC],a                 ; 02:5319
    ld   a,$44                      ; 02:531B
    ldh  [<$FFF2],a                 ; 02:531D
    ld   a,[$C1DE]                  ; 02:531F
    inc  a                          ; 02:5322
    cp   $0A                        ; 02:5323
    jr   c,Code025329               ; 02:5325
    ld   a,$0A                      ; 02:5327
Code025329:
    ld   [$C1DE],a                  ; 02:5329
    jr   Code025353                 ; 02:532C
Code02532E:
    ld   hl,$D14A                   ; 02:532E
    add  hl,bc                      ; 02:5331
    ld   a,[hl]                     ; 02:5332
    and  a                          ; 02:5333
    jr   nz,Code025353              ; 02:5334
    ldh  a,[<H_GlobalTimer]         ; 02:5336
    srl  a                          ; 02:5338
    jr   nc,Code025353              ; 02:533A
    ld   a,$02                      ; 02:533C
    rst  $10                        ; 02:533E  24-bit call
.dl SubL_0B4074                     ; 02:533F
    jr   Code025353                 ; 02:5342
Code025344:
    ld   hl,W_SpriteStatus          ; 02:5344
    add  hl,bc                      ; 02:5347
    ld   a,$03                      ; 02:5348
    ld   [hl],a                     ; 02:534A
    call Sub001965                  ; 02:534B
    ld   hl,W_AlbumUnlockFlags+2    ; 02:534E
    set  3,[hl]                     ; 02:5351
Code025353:
    call Sub00218B                  ; 02:5353
    jp   nc,Code025446              ; 02:5356
    ld   hl,W_SpriteID              ; 02:5359
    add  hl,de                      ; 02:535C
    ld   a,[hl]                     ; 02:535D
    cp   $02                        ; 02:535E
    jr   z,Code02536A               ; 02:5360
    cp   $03                        ; 02:5362
    jr   z,Code02536A               ; 02:5364
    cp   $31                        ; 02:5366
    jr   nz,Code0253B5              ; 02:5368
Code02536A:
    ld   hl,W_SpriteSubstate        ; 02:536A
    add  hl,de                      ; 02:536D
    ld   a,[hl]                     ; 02:536E
    cp   $02                        ; 02:536F
    jr   nz,Code0253B5              ; 02:5371
    ld   hl,W_SpriteStatus          ; 02:5373
    add  hl,bc                      ; 02:5376
    ld   [hl],$03                   ; 02:5377
    ld   hl,W_SpriteStatus          ; 02:5379
    add  hl,de                      ; 02:537C
    ld   [hl],$03                   ; 02:537D
    ld   hl,$D1A4                   ; 02:537F
    add  hl,bc                      ; 02:5382
    ld   [hl],$01                   ; 02:5383
    ld   hl,W_SpriteYSpeed          ; 02:5385
    add  hl,bc                      ; 02:5388
    ld   [hl],$E8                   ; 02:5389
    ld   hl,W_SpriteXSpeed          ; 02:538B
    add  hl,bc                      ; 02:538E
    ld   a,[hl]                     ; 02:538F
    bit  7,a                        ; 02:5390
    ld   [hl],$10                   ; 02:5392
    jr   z,Code025398               ; 02:5394
    ld   [hl],$F0                   ; 02:5396
Code025398:
    push bc                         ; 02:5398
    ld   b,d                        ; 02:5399
    ld   c,e                        ; 02:539A
    ld   hl,$D13B                   ; 02:539B
    add  hl,bc                      ; 02:539E
    ld   a,[hl]                     ; 02:539F
    inc  a                          ; 02:53A0
    cp   $0A                        ; 02:53A1
    jr   c,Code0253A7               ; 02:53A3
    ld   a,$0A                      ; 02:53A5
Code0253A7:
    push de                         ; 02:53A7
    call Sub002E90                  ; 02:53A8
    pop  de                         ; 02:53AB
    pop  bc                         ; 02:53AC
    ld   hl,$D13B                   ; 02:53AD
    add  hl,bc                      ; 02:53B0
    ld   a,$01                      ; 02:53B1
    jr   Code0253F8                 ; 02:53B3
Code0253B5:
    ld   hl,$D294                   ; 02:53B5
    add  hl,de                      ; 02:53B8
    ld   a,[hl]                     ; 02:53B9
    bit  0,a                        ; 02:53BA
    jr   z,Code0253C8               ; 02:53BC
    ld   hl,W_SpriteXSpeed          ; 02:53BE
    add  hl,bc                      ; 02:53C1
    ld   a,[hl]                     ; 02:53C2
    cpl                             ; 02:53C3
    inc  a                          ; 02:53C4
    ld   [hl],a                     ; 02:53C5
    jr   Code025446                 ; 02:53C6
Code0253C8:
    ld   hl,$D2A3                   ; 02:53C8
    add  hl,de                      ; 02:53CB
    ld   a,[hl]                     ; 02:53CC
    bit  3,a                        ; 02:53CD
    jr   z,Code0253DC               ; 02:53CF
    and  $F0                        ; 02:53D1
    swap a                          ; 02:53D3
    ld   hl,W_SpriteSubstate        ; 02:53D5
    add  hl,de                      ; 02:53D8
    ld   [hl],a                     ; 02:53D9
    jr   Code0253E2                 ; 02:53DA
Code0253DC:
    ld   hl,W_SpriteStatus          ; 02:53DC
    add  hl,de                      ; 02:53DF
    ld   [hl],$03                   ; 02:53E0
Code0253E2:
    ld   hl,$D13B                   ; 02:53E2
    add  hl,bc                      ; 02:53E5
    ld   a,[hl]                     ; 02:53E6
    inc  a                          ; 02:53E7
    cp   $0A                        ; 02:53E8
    jr   c,Code0253F8               ; 02:53EA
    ld   a,[W_ChallengeFlag]        ; 02:53EC
    and  a                          ; 02:53EF
    jr   nz,Code0253F6              ; 02:53F0
    ld   a,$0A                      ; 02:53F2
    jr   Code0253F8                 ; 02:53F4
Code0253F6:
    ld   a,$0B                      ; 02:53F6
Code0253F8:
    ld   [hl],a                     ; 02:53F8
    push de                         ; 02:53F9
    call Sub002E90                  ; 02:53FA
    pop  de                         ; 02:53FD
    ld   hl,$D1A4                   ; 02:53FE
    add  hl,de                      ; 02:5401
    ld   [hl],$01                   ; 02:5402
    ld   hl,W_SpriteID              ; 02:5404
    add  hl,de                      ; 02:5407
    ld   a,[hl]                     ; 02:5408
    cp   $2E                        ; 02:5409
    jr   z,Code025411               ; 02:540B
    cp   $23                        ; 02:540D
    jr   nz,Code025420              ; 02:540F
Code025411:
    ld   a,$DC                      ; 02:5411
    ld   hl,W_SpriteYSpeed          ; 02:5413
    add  hl,de                      ; 02:5416
    ld   [hl],a                     ; 02:5417
    xor  a                          ; 02:5418
    ld   hl,W_SpriteXSpeed          ; 02:5419
    add  hl,de                      ; 02:541C
    ld   [hl],a                     ; 02:541D
    jr   Code02543F                 ; 02:541E
Code025420:
    ld   a,$CC                      ; 02:5420
    ld   hl,W_SpriteYSpeed          ; 02:5422
    add  hl,de                      ; 02:5425
    ld   [hl],a                     ; 02:5426
    ld   a,$45                      ; 02:5427
    ldh  [<$FFF2],a                 ; 02:5429
    ld   hl,W_SpriteXSpeed          ; 02:542B
    add  hl,bc                      ; 02:542E
    ld   a,[hl]                     ; 02:542F
    bit  7,a                        ; 02:5430
    jr   nz,Code025438              ; 02:5432
    ld   a,$12                      ; 02:5434
    jr   Code02543A                 ; 02:5436
Code025438:
    ld   a,$EE                      ; 02:5438
Code02543A:
    ld   hl,W_SpriteXSpeed          ; 02:543A
    add  hl,de                      ; 02:543D
    ld   [hl],a                     ; 02:543E
Code02543F:
    push bc                         ; 02:543F
    ld   b,d                        ; 02:5440
    ld   c,e                        ; 02:5441
    call Sub027C62                  ; 02:5442
    pop  bc                         ; 02:5445
Code025446:
    ld   e,$00                      ; 02:5446
    ld   hl,W_SpriteXSpeed          ; 02:5448
    add  hl,bc                      ; 02:544B
    ld   a,[hl]                     ; 02:544C
    bit  7,a                        ; 02:544D
    jr   nz,Code025453              ; 02:544F
    ld   e,$0F                      ; 02:5451
Code025453:
    ld   a,e                        ; 02:5453
    ldh  [<$FFA3],a                 ; 02:5454
    ld   a,$08                      ; 02:5456
    ldh  [<$FFA4],a                 ; 02:5458
    call Sub001C71                  ; 02:545A
    jr   nc,Code02546B              ; 02:545D
    ld   a,$43                      ; 02:545F
    ldh  [<$FFF2],a                 ; 02:5461
    ld   hl,W_SpriteXSpeed          ; 02:5463
    add  hl,bc                      ; 02:5466
    ld   a,[hl]                     ; 02:5467
    cpl                             ; 02:5468
    inc  a                          ; 02:5469
    ld   [hl],a                     ; 02:546A
Code02546B:
    call Sub001BCF                  ; 02:546B
    ret                             ; 02:546E

Code02546F:
    call Sub001D21                  ; 02:546F
    jr   nc,Code0254C0              ; 02:5472
    ld   e,a                        ; 02:5474
    ld   a,[$C1DA]                  ; 02:5475
    ld   hl,$C1DB                   ; 02:5478
    or   [hl]                       ; 02:547B
    jr   nz,Code0254BD              ; 02:547C
    call Sub025525                  ; 02:547E
    ld   hl,W_SpriteID              ; 02:5481
    add  hl,bc                      ; 02:5484
    ld   a,[hl]                     ; 02:5485
    cp   $02                        ; 02:5486
    jr   z,Code025492               ; 02:5488
    cp   $03                        ; 02:548A
    jr   z,Code025492               ; 02:548C
    cp   $31                        ; 02:548E
    jr   nz,Code0254A8              ; 02:5490
Code025492:
    ld   a,$09                      ; 02:5492
    ldh  [<$FF9B],a                 ; 02:5494
    ld   a,$20                      ; 02:5496
    ldh  [<$FF97],a                 ; 02:5498
    ld   a,$03                      ; 02:549A
    ldh  [<$FF98],a                 ; 02:549C
    push bc                         ; 02:549E
    call GivePointsFF97             ; 02:549F
    call SpawnScoreSprite           ; 02:54A2
    pop  bc                         ; 02:54A5
    jr   Code0254C0                 ; 02:54A6
Code0254A8:
    ld   hl,$D0FF                   ; 02:54A8
    add  hl,bc                      ; 02:54AB
    push hl                         ; 02:54AC
    ld   a,[hl]                     ; 02:54AD
    call Sub002E90                  ; 02:54AE
    pop  hl                         ; 02:54B1
    ld   a,[hl]                     ; 02:54B2
    inc  a                          ; 02:54B3
    cp   $0A                        ; 02:54B4
    jr   c,Code0254BA               ; 02:54B6
    ld   a,$0A                      ; 02:54B8
Code0254BA:
    ld   [hl],a                     ; 02:54BA
    jr   Code0254C0                 ; 02:54BB
Code0254BD:
    call Sub001965                  ; 02:54BD
Code0254C0:
    ld   e,$00                      ; 02:54C0
    ld   hl,W_SpriteXSpeed          ; 02:54C2
    add  hl,bc                      ; 02:54C5
    ld   a,[hl]                     ; 02:54C6
    bit  7,a                        ; 02:54C7
    jr   nz,Code0254CD              ; 02:54C9
    ld   e,$10                      ; 02:54CB
Code0254CD:
    ld   a,e                        ; 02:54CD
    ldh  [<$FFA3],a                 ; 02:54CE
    ld   a,$08                      ; 02:54D0
    ldh  [<$FFA4],a                 ; 02:54D2
    call Sub001C71                  ; 02:54D4
    jr   nc,Code0254E2              ; 02:54D7
    ld   hl,W_SpriteXSpeed          ; 02:54D9
    add  hl,bc                      ; 02:54DC
    ld   a,[hl]                     ; 02:54DD
    xor  $FF                        ; 02:54DE
    inc  a                          ; 02:54E0
    ld   [hl],a                     ; 02:54E1
Code0254E2:
    call Sub001BCF                  ; 02:54E2
    ldh  a,[<$FFA5]                 ; 02:54E5
    and  $03                        ; 02:54E7
    jr   z,Code02550C               ; 02:54E9
    xor  a                          ; 02:54EB
    ld   hl,W_SpriteXSpeed          ; 02:54EC
    add  hl,bc                      ; 02:54EF
    ld   [hl],a                     ; 02:54F0
    ld   hl,$D177                   ; 02:54F1
    add  hl,bc                      ; 02:54F4
    ld   [hl],a                     ; 02:54F5
    ld   hl,$D258                   ; 02:54F6
    add  hl,bc                      ; 02:54F9
    ld   [hl],a                     ; 02:54FA
    ld   hl,$D096                   ; 02:54FB
    ld   [hl],$02                   ; 02:54FE
    ld   hl,W_SpriteSubstate        ; 02:5500
    add  hl,bc                      ; 02:5503
    ld   [hl],$01                   ; 02:5504
    ld   hl,$D0A5                   ; 02:5506
    add  hl,bc                      ; 02:5509
    ld   [hl],$E0                   ; 02:550A
Code02550C:
    ld   hl,$D258                   ; 02:550C
    add  hl,bc                      ; 02:550F
    ld   a,[hl]                     ; 02:5510
    and  a                          ; 02:5511
    ret  z                          ; 02:5512
    ld   hl,$D096                   ; 02:5513
    add  hl,bc                      ; 02:5516
    dec  [hl]                       ; 02:5517
    ret  nz                         ; 02:5518
    ld   [hl],$07                   ; 02:5519
    ld   hl,$D177                   ; 02:551B
    add  hl,bc                      ; 02:551E
    ld   a,[hl]                     ; 02:551F
    inc  a                          ; 02:5520
    and  $01                        ; 02:5521
    ld   [hl],a                     ; 02:5523
    ret                             ; 02:5524

Sub025525:
    ld   hl,W_SpriteSubstate        ; 02:5525
    add  hl,bc                      ; 02:5528
    ld   [hl],$02                   ; 02:5529
    ld   hl,$D21C                   ; 02:552B
    add  hl,bc                      ; 02:552E
    ld   [hl],$01                   ; 02:552F
    ld   hl,$D249                   ; 02:5531
    add  hl,bc                      ; 02:5534
    ld   [hl],$01                   ; 02:5535
    ld   de,$0000                   ; 02:5537
    ld   hl,$FF9B                   ; 02:553A
    ld   a,[$D2D4]                  ; 02:553D
    sub  [hl]                       ; 02:5540
    ld   hl,$FF9C                   ; 02:5541
    ld   a,[$D2D5]                  ; 02:5544
    sbc  [hl]                       ; 02:5547
    bit  7,a                        ; 02:5548
    jr   z,Code02554D               ; 02:554A
    inc  e                          ; 02:554C
Code02554D:
    ld   hl,Data0250E7              ; 02:554D
    add  hl,de                      ; 02:5550
    ld   a,[hl]                     ; 02:5551
    ld   hl,W_SpriteXSpeed          ; 02:5552
    add  hl,bc                      ; 02:5555
    ld   [hl],a                     ; 02:5556
    xor  a                          ; 02:5557
    ld   hl,$D078                   ; 02:5558
    add  hl,bc                      ; 02:555B
    ld   [hl],a                     ; 02:555C
    ld   hl,$D0C3                   ; 02:555D
    add  hl,bc                      ; 02:5560
    ld   [hl],a                     ; 02:5561
    ld   hl,$D0A5                   ; 02:5562
    add  hl,bc                      ; 02:5565
    ld   [hl],$04                   ; 02:5566
    ld   hl,$D14A                   ; 02:5568
    add  hl,bc                      ; 02:556B
    ld   [hl],$08                   ; 02:556C
    ld   a,$45                      ; 02:556E
    ldh  [<$FFF2],a                 ; 02:5570
    ret                             ; 02:5572

Data025573:                         ; 02:5573
.db $3A,$26,$38,$26,$40,$26,$3E,$26,\
    $38,$06,$3A,$06,$3E,$06,$40,$06,\
    $3A,$27,$38,$27,$40,$27,$3E,$27,\
    $38,$07,$3A,$07,$3E,$07,$40,$07,\
    $38,$29,$36,$29,$3C,$29,$3A,$29,\
    $36,$09,$38,$09,$3A,$09,$3C,$09
Data0255A3:                         ; 02:55A3
.db $3C,$26,$42,$26,$3C,$06,$42,$06,\
    $3C,$27,$42,$27,$3C,$07,$42,$07
Code0255B3:
    ld   hl,$D177                   ; 02:55B3
    add  hl,bc                      ; 02:55B6
    ld   a,[hl]                     ; 02:55B7
    ldh  [<$FF97],a                 ; 02:55B8
    ld   hl,$D0E1                   ; 02:55BA
    add  hl,bc                      ; 02:55BD
    ld   a,[hl]                     ; 02:55BE
    swap a                          ; 02:55BF
    ldh  [<$FF98],a                 ; 02:55C1
    ld   hl,W_SpriteXSpeed          ; 02:55C3
    add  hl,bc                      ; 02:55C6
    ld   a,[hl]                     ; 02:55C7
    ld   hl,$0000                   ; 02:55C8
    bit  7,a                        ; 02:55CB
    jr   nz,Code0255D1              ; 02:55CD
    ld   l,$08                      ; 02:55CF
Code0255D1:
    push hl                         ; 02:55D1
    ldh  a,[<$FF97]                 ; 02:55D2
    ld   e,a                        ; 02:55D4
    sla  e                          ; 02:55D5
    sla  e                          ; 02:55D7
    ld   d,$00                      ; 02:55D9
    add  hl,de                      ; 02:55DB
    ldh  a,[<$FF98]                 ; 02:55DC
    ld   e,a                        ; 02:55DE
    add  hl,de                      ; 02:55DF
    ld   de,Data025573              ; 02:55E0
    add  hl,de                      ; 02:55E3
    call Disp16x16Sprite            ; 02:55E4
    ld   hl,$D0E1                   ; 02:55E7
    add  hl,bc                      ; 02:55EA
    ld   a,[hl]                     ; 02:55EB
    cp   $02                        ; 02:55EC
    jr   nz,Code0255F4              ; 02:55EE
    pop  hl                         ; 02:55F0
    jp   Return02567F               ; 02:55F1
Code0255F4:
    ldh  [<$FF98],a                 ; 02:55F4
    ld   hl,$D177                   ; 02:55F6
    add  hl,bc                      ; 02:55F9
    ld   a,[hl]                     ; 02:55FA
    ldh  [<$FF97],a                 ; 02:55FB
    pop  hl                         ; 02:55FD
    ld   a,l                        ; 02:55FE
    ldh  [<$FF9A],a                 ; 02:55FF
    srl  l                          ; 02:5601
    ldh  a,[<$FF97]                 ; 02:5603
    sla  a                          ; 02:5605
    ld   e,a                        ; 02:5607
    ld   d,$00                      ; 02:5608
    add  hl,de                      ; 02:560A
    ldh  a,[<$FF98]                 ; 02:560B
    swap a                          ; 02:560D
    srl  a                          ; 02:560F
    ld   e,a                        ; 02:5611
    add  hl,de                      ; 02:5612
    ld   de,Data0255A3              ; 02:5613
    add  hl,de                      ; 02:5616
    ldi  a,[hl]                     ; 02:5617
    ldh  [<$FF9F],a                 ; 02:5618
    ld   a,[hl]                     ; 02:561A
    ldh  [<$FFA0],a                 ; 02:561B
    ld   hl,W_SpriteYLow            ; 02:561D
    add  hl,bc                      ; 02:5620
    ld   a,[hl]                     ; 02:5621
    ld   hl,H_CameraY               ; 02:5622
    sub  [hl]                       ; 02:5625
    add  $01                        ; 02:5626
    ldh  [<$FF97],a                 ; 02:5628
    ld   hl,W_SpriteXHigh           ; 02:562A
    add  hl,bc                      ; 02:562D
    ld   a,[hl]                     ; 02:562E
    ld   d,a                        ; 02:562F
    ld   hl,W_SpriteXLow            ; 02:5630
    add  hl,bc                      ; 02:5633
    ld   a,[hl]                     ; 02:5634
    add  $08                        ; 02:5635
    ld   e,a                        ; 02:5637
    ld   a,$00                      ; 02:5638
    adc  d                          ; 02:563A
    ld   d,a                        ; 02:563B
    ld   a,e                        ; 02:563C
    ld   hl,H_CameraXLow            ; 02:563D
    sub  [hl]                       ; 02:5640
    ldh  [<$FF98],a                 ; 02:5641
    ld   hl,H_CameraXHigh           ; 02:5643
    ld   a,d                        ; 02:5646
    sbc  [hl]                       ; 02:5647
    ldh  [<$FF99],a                 ; 02:5648
    ld   hl,$FF99                   ; 02:564A
    ldh  a,[<$FF98]                 ; 02:564D
    add  $20                        ; 02:564F
    ld   e,a                        ; 02:5651
    ld   a,$00                      ; 02:5652
    adc  [hl]                       ; 02:5654
    and  a                          ; 02:5655
    jr   nz,Return02567F            ; 02:5656
    ld   hl,$FF9A                   ; 02:5658
    ldh  a,[<$FF98]                 ; 02:565B
    add  [hl]                       ; 02:565D
    ldh  [<$FF98],a                 ; 02:565E
    ld   hl,$FF99                   ; 02:5660
    ld   a,$00                      ; 02:5663
    adc  [hl]                       ; 02:5665
    ld   [hl],a                     ; 02:5666
    ld   hl,W_OAMBuffer             ; 02:5667
    ldh  a,[<$FFC1]                 ; 02:566A
    ld   e,a                        ; 02:566C
    ld   d,$00                      ; 02:566D
    add  hl,de                      ; 02:566F
    ldh  a,[<$FF97]                 ; 02:5670
    ldi  [hl],a                     ; 02:5672
    ldh  a,[<$FF98]                 ; 02:5673
    ldi  [hl],a                     ; 02:5675
    ldh  a,[<$FF9F]                 ; 02:5676
    ldi  [hl],a                     ; 02:5678
    ldh  a,[<$FFA0]                 ; 02:5679
    ld   [hl],a                     ; 02:567B
    call Sub0028FD                  ; 02:567C
Return02567F:
    ret                             ; 02:567F

Data025680:                         ; 02:5680
.db $44,$46,$44,$66,$44,$06,$44,$26,\
    $46,$46,$46,$66,$46,$06,$46,$26
Data025690:                         ; 02:5690
.db $44,$47,$44,$67,$44,$07,$44,$27,\
    $46,$47,$46,$67,$46,$07,$46,$27
Data0256A0:                         ; 02:56A0
.db $3E,$49,$3E,$69,$3E,$09,$3E,$29,\
    $3E,$49,$3E,$69,$3E,$09,$3E,$29
DataPtrs0256B0:                     ; 02:56B0
.dw Data025680, Data025690, Data0256A0
Code0256B6:
    ld   hl,$D177                   ; 02:56B6
    add  hl,bc                      ; 02:56B9
    ld   a,[hl]                     ; 02:56BA
    and  a                          ; 02:56BB
    jr   z,Code0256CD               ; 02:56BC
    ld   de,$0008                   ; 02:56BE
    ld   hl,$D11D                   ; 02:56C1
    add  hl,bc                      ; 02:56C4
    ld   a,[hl]                     ; 02:56C5
    and  a                          ; 02:56C6
    jr   z,Code0256DA               ; 02:56C7
    ld   e,$0C                      ; 02:56C9
    jr   Code0256DA                 ; 02:56CB
Code0256CD:
    ld   de,$0000                   ; 02:56CD
    ld   hl,$D11D                   ; 02:56D0
    add  hl,bc                      ; 02:56D3
    ld   a,[hl]                     ; 02:56D4
    and  a                          ; 02:56D5
    jr   z,Code0256DA               ; 02:56D6
    ld   e,$04                      ; 02:56D8
Code0256DA:
    ld   hl,W_SpriteID              ; 02:56DA
    add  hl,bc                      ; 02:56DD
    ld   a,[hl]                     ; 02:56DE
    cp   $31                        ; 02:56DF
    jr   z,Code0256E7               ; 02:56E1
    bit  2,e                        ; 02:56E3
    jr   nz,Code025721              ; 02:56E5
Code0256E7:
    push de                         ; 02:56E7
    ld   hl,W_SpriteXLow            ; 02:56E8
    add  hl,bc                      ; 02:56EB
    ld   a,[hl]                     ; 02:56EC
    ldh  [<$FF98],a                 ; 02:56ED
    ld   hl,W_SpriteXHigh           ; 02:56EF
    add  hl,bc                      ; 02:56F2
    ld   a,[hl]                     ; 02:56F3
    ldh  [<$FF99],a                 ; 02:56F4
    ld   hl,W_SpriteYLow            ; 02:56F6
    add  hl,bc                      ; 02:56F9
    ld   e,[hl]                     ; 02:56FA
    ld   hl,W_SpriteYHigh           ; 02:56FB
    add  hl,bc                      ; 02:56FE
    ld   d,[hl]                     ; 02:56FF
    ld   a,e                        ; 02:5700
    add  $02                        ; 02:5701
    ldh  [<$FF97],a                 ; 02:5703
    ld   a,d                        ; 02:5705
    adc  $00                        ; 02:5706
    ldh  [<$FF9B],a                 ; 02:5708
    ld   hl,$D0E1                   ; 02:570A
    add  hl,bc                      ; 02:570D
    ld   e,[hl]                     ; 02:570E
    sla  e                          ; 02:570F
    ld   d,$00                      ; 02:5711
    ld   hl,DataPtrs0256B0          ; 02:5713
    add  hl,de                      ; 02:5716
    ldi  a,[hl]                     ; 02:5717
    ld   d,[hl]                     ; 02:5718
    ld   l,a                        ; 02:5719
    ld   h,d                        ; 02:571A
    pop  de                         ; 02:571B
    add  hl,de                      ; 02:571C
    call Sub002769                  ; 02:571D
    ret                             ; 02:5720

Code025721:
    push de                         ; 02:5721
    ld   hl,$D0E1                   ; 02:5722
    add  hl,bc                      ; 02:5725
    ld   e,[hl]                     ; 02:5726
    sla  e                          ; 02:5727
    ld   d,$00                      ; 02:5729
    ld   hl,DataPtrs0256B0          ; 02:572B
    add  hl,de                      ; 02:572E
    ldi  a,[hl]                     ; 02:572F
    ld   d,[hl]                     ; 02:5730
    ld   l,a                        ; 02:5731
    ld   h,d                        ; 02:5732
    push hl                         ; 02:5733
    ld   hl,W_SpriteSubstate        ; 02:5734
    add  hl,bc                      ; 02:5737
    ld   a,[hl]                     ; 02:5738
    cp   $03                        ; 02:5739
    jr   nz,Code02574D              ; 02:573B
    ld   hl,$D177                   ; 02:573D
    add  hl,bc                      ; 02:5740
    ld   a,[hl]                     ; 02:5741
    sla  a                          ; 02:5742
    sla  a                          ; 02:5744
    sla  a                          ; 02:5746
    pop  hl                         ; 02:5748
    add  l                          ; 02:5749
    ld   l,a                        ; 02:574A
    jr   Code02574E                 ; 02:574B
Code02574D:
    pop  hl                         ; 02:574D
Code02574E:
    pop  de                         ; 02:574E
    add  hl,de                      ; 02:574F
    call Disp16x16Sprite            ; 02:5750
    ret                             ; 02:5753

SubL_Goomba_Init:
    call Goomba_Init                ; 02:5754
    rst  $18                        ; 02:5757  Return from 24-bit call

Goomba_Init:
; sprite 04 init
    ld   hl,W_SpriteXSpeed          ; 02:5758
    add  hl,bc                      ; 02:575B
    ld   [hl],$F8                   ; 02:575C
    xor  a                          ; 02:575E
    ld   hl,W_SpriteSubstate        ; 02:575F
    add  hl,bc                      ; 02:5762
    ld   [hl],a                     ; 02:5763
    ld   hl,$D195                   ; 02:5764
    add  hl,bc                      ; 02:5767
    ld   [hl],a                     ; 02:5768
    ld   a,$02                      ; 02:5769
    ld   hl,$D276                   ; 02:576B
    add  hl,bc                      ; 02:576E
    ld   [hl],a                     ; 02:576F
    inc  a                          ; 02:5770
    ld   hl,$D285                   ; 02:5771
    add  hl,bc                      ; 02:5774
    ld   [hl],a                     ; 02:5775
    ret                             ; 02:5776

Goomba_Main:
; sprite 04 main
    call Sub0025CB                  ; 02:5777
    jp   c,Code025798               ; 02:577A
    call Sub0029DA                  ; 02:577D
    ld   hl,W_SpriteYSpeed          ; 02:5780
    add  hl,bc                      ; 02:5783
    ld   a,$01                      ; 02:5784
    add  [hl]                       ; 02:5786
    cp   $20                        ; 02:5787
    jp   nc,Code02578E              ; 02:5789
    ld   a,$20                      ; 02:578C
Code02578E:
    ld   [hl],a                     ; 02:578E
    call Sub001A3D                  ; 02:578F
    call Sub001A79                  ; 02:5792
    call Sub02579C                  ; 02:5795
Code025798:
    call Sub0257A6                  ; 02:5798
    ret                             ; 02:579B

Sub02579C:
    ld   hl,W_SpriteSubstate        ; 02:579C
    add  hl,bc                      ; 02:579F
    ld   a,[hl]                     ; 02:57A0
    rst  $00                        ; 02:57A1  Execute from 16-bit pointer table
.dw Code0257B0                      ; 02:57A2
.dw Code02585C                      ; 02:57A4

Sub0257A6:
    ld   hl,W_SpriteSubstate        ; 02:57A6
    add  hl,bc                      ; 02:57A9
    ld   a,[hl]                     ; 02:57AA
    rst  $00                        ; 02:57AB  Execute from 16-bit pointer table
.dw Code025875                      ; 02:57AC
.dw Code02588D                      ; 02:57AE

Code0257B0:
    call Sub002920                  ; 02:57B0
    jp   c,Return02585B             ; 02:57B3
    call Sub001D21                  ; 02:57B6
    jr   nc,Code025812              ; 02:57B9
    ld   e,a                        ; 02:57BB
    ld   a,[$C1DA]                  ; 02:57BC
    ld   hl,$C1DB                   ; 02:57BF
    or   [hl]                       ; 02:57C2
    jr   nz,Code025802              ; 02:57C3
    ld   a,e                        ; 02:57C5
    cp   $02                        ; 02:57C6
    jr   z,Code0257F1               ; 02:57C8
    and  a                          ; 02:57CA
    jr   z,Code0257F1               ; 02:57CB
    call Sub002189                  ; 02:57CD
    jr   nc,Code0257F1              ; 02:57D0
    ld   hl,W_SpriteSubstate        ; 02:57D2
    add  hl,bc                      ; 02:57D5
    inc  [hl]                       ; 02:57D6
    ld   hl,$D1A4                   ; 02:57D7
    add  hl,bc                      ; 02:57DA
    ld   [hl],$02                   ; 02:57DB
    ld   hl,W_SpriteXSpeed          ; 02:57DD
    add  hl,bc                      ; 02:57E0
    ld   [hl],$00                   ; 02:57E1
    ld   hl,$D0A5                   ; 02:57E3
    add  hl,bc                      ; 02:57E6
    ld   [hl],$20                   ; 02:57E7
    call Sub0025F8                  ; 02:57E9
    call Sub002E64                  ; 02:57EC
    jr   Code02580C                 ; 02:57EF
Code0257F1:
    ldh  a,[<H_GlobalTimer]         ; 02:57F1
    srl  a                          ; 02:57F3
    jr   nc,Code025812              ; 02:57F5
    ld   a,$02                      ; 02:57F7
    rst  $10                        ; 02:57F9  24-bit call
.dl SubL_0B4074                     ; 02:57FA
    call Sub003000                  ; 02:57FD
    jr   Code025812                 ; 02:5800
Code025802:
    ld   hl,W_SpriteStatus          ; 02:5802
    add  hl,bc                      ; 02:5805
    ld   a,$03                      ; 02:5806
    ld   [hl],a                     ; 02:5808
    call Sub001965                  ; 02:5809
Code02580C:
    ld   hl,W_AlbumUnlockFlags+1    ; 02:580C
    set  1,[hl]                     ; 02:580F
    ret                             ; 02:5811

Code025812:
    call Sub00218B                  ; 02:5812
    jr   nc,Code025820              ; 02:5815
    ld   hl,W_SpriteXSpeed          ; 02:5817
    add  hl,bc                      ; 02:581A
    ld   a,[hl]                     ; 02:581B
    xor  $FF                        ; 02:581C
    inc  a                          ; 02:581E
    ld   [hl],a                     ; 02:581F
Code025820:
    ld   e,$00                      ; 02:5820
    ld   hl,W_SpriteXSpeed          ; 02:5822
    add  hl,bc                      ; 02:5825
    ld   a,[hl]                     ; 02:5826
    bit  7,a                        ; 02:5827
    jr   nz,Code02582D              ; 02:5829
    ld   e,$10                      ; 02:582B
Code02582D:
    ld   a,e                        ; 02:582D
    ldh  [<$FFA3],a                 ; 02:582E
    ld   a,$08                      ; 02:5830
    ldh  [<$FFA4],a                 ; 02:5832
    call Sub001C71                  ; 02:5834
    jr   nc,Code025842              ; 02:5837
    ld   hl,W_SpriteXSpeed          ; 02:5839
    add  hl,bc                      ; 02:583C
    ld   a,[hl]                     ; 02:583D
    xor  $FF                        ; 02:583E
    inc  a                          ; 02:5840
    ld   [hl],a                     ; 02:5841
Code025842:
    call Sub001BCF                  ; 02:5842
    ld   hl,$D096                   ; 02:5845
    add  hl,bc                      ; 02:5848
    ld   a,[hl]                     ; 02:5849
    dec  a                          ; 02:584A
    ld   [hl],a                     ; 02:584B
    bit  7,a                        ; 02:584C
    jr   z,Return02585B             ; 02:584E
    ld   [hl],$07                   ; 02:5850
    ld   hl,$D177                   ; 02:5852
    add  hl,bc                      ; 02:5855
    ld   a,[hl]                     ; 02:5856
    inc  a                          ; 02:5857
    and  $01                        ; 02:5858
    ld   [hl],a                     ; 02:585A
Return02585B:
    ret                             ; 02:585B

Code02585C:
    ld   hl,$D0A5                   ; 02:585C
    add  hl,bc                      ; 02:585F
    ld   a,[hl]                     ; 02:5860
    and  a                          ; 02:5861
    jr   z,Code025869               ; 02:5862
    dec  [hl]                       ; 02:5864
    call Sub001BCF                  ; 02:5865
    ret                             ; 02:5868

Code025869:
    call Sub0029EF                  ; 02:5869
    ret                             ; 02:586C

Data02586D:                         ; 02:586D
.db $34,$01,$36,$01,$36,$21,$34,$21
Code025875:
    ld   hl,$D177                   ; 02:5875
    add  hl,bc                      ; 02:5878
    ld   a,[hl]                     ; 02:5879
    ld   d,$00                      ; 02:587A
    ld   e,a                        ; 02:587C
    sla  e                          ; 02:587D
    sla  e                          ; 02:587F
    ld   hl,Data02586D              ; 02:5881
    add  hl,de                      ; 02:5884
    call Disp16x16Sprite            ; 02:5885
    ret                             ; 02:5888

Data025889:                         ; 02:5889
.db $48,$41,$48,$61
Code02588D:
    ld   hl,Data025889              ; 02:588D
    call Disp16x16Sprite            ; 02:5890
    ret                             ; 02:5893

SubL_025894:
    ld   a,$0E                      ; 02:5894
    call LoadSpriteAnySlot          ; 02:5896
    jr   nc,Code0258B6              ; 02:5899
    ld   de,$0000                   ; 02:589B
    ld   hl,W_SpriteID              ; 02:589E
Code0258A1:
    ldi  a,[hl]                     ; 02:58A1
    cp   $1E                        ; 02:58A2
    jr   nz,Code0258AE              ; 02:58A4
    inc  e                          ; 02:58A6
    ld   a,e                        ; 02:58A7
    cp   $0F                        ; 02:58A8
    jr   nz,Code0258A1              ; 02:58AA
    jr   ReturnL_0258FC             ; 02:58AC
Code0258AE:
    ld   hl,W_SpriteStatus          ; 02:58AE
    add  hl,de                      ; 02:58B1
    ld   [hl],$00                   ; 02:58B2
    jr   SubL_025894                ; 02:58B4
Code0258B6:
    ld   hl,$D1B3                   ; 02:58B6
    add  hl,de                      ; 02:58B9
    ldh  a,[<$FF97]                 ; 02:58BA
    add  $08                        ; 02:58BC
    ld   [hl],a                     ; 02:58BE
    ldh  a,[<$FF98]                 ; 02:58BF
    adc  $00                        ; 02:58C1
    ld   hl,$D1C2                   ; 02:58C3
    add  hl,de                      ; 02:58C6
    ld   [hl],a                     ; 02:58C7
    ld   hl,W_SpriteXLow            ; 02:58C8
    add  hl,de                      ; 02:58CB
    ldh  a,[<$FF97]                 ; 02:58CC
    ld   [hl],a                     ; 02:58CE
    ld   hl,W_SpriteXHigh           ; 02:58CF
    add  hl,de                      ; 02:58D2
    ldh  a,[<$FF98]                 ; 02:58D3
    ld   [hl],a                     ; 02:58D5
    ld   hl,W_SpriteYLow            ; 02:58D6
    add  hl,de                      ; 02:58D9
    ldh  a,[<$FF99]                 ; 02:58DA
    ld   [hl],a                     ; 02:58DC
    add  $08                        ; 02:58DD
    ld   hl,$D1D1                   ; 02:58DF
    add  hl,de                      ; 02:58E2
    ld   [hl],a                     ; 02:58E3
    ld   hl,W_SpriteXSpeed          ; 02:58E4
    add  hl,de                      ; 02:58E7
    ld   [hl],$F6                   ; 02:58E8
    ld   hl,W_SpriteYSpeed          ; 02:58EA
    add  hl,de                      ; 02:58ED
    ld   [hl],$D0                   ; 02:58EE
    ld   hl,$D11D                   ; 02:58F0
    add  hl,de                      ; 02:58F3
    ld   [hl],$D8                   ; 02:58F4
    ld   hl,$D0A5                   ; 02:58F6
    add  hl,de                      ; 02:58F9
    ld   [hl],$01                   ; 02:58FA
ReturnL_0258FC:
    rst  $18                        ; 02:58FC  Return from 24-bit call

Data0258FD:                         ; 02:58FD
.db $60,$01,$62,$01,$62,$21,$60,$21

BrokenBrick_Main:
; sprite 0E main
    call Sub0025CB                  ; 02:5905
    jp   c,Code0259DD               ; 02:5908
    ld   hl,W_SpriteYSpeed          ; 02:590B
    add  hl,bc                      ; 02:590E
    ld   a,$02                      ; 02:590F
    add  [hl]                       ; 02:5911
    cp   $30                        ; 02:5912
    jr   nc,Code025918              ; 02:5914
    ld   a,$30                      ; 02:5916
Code025918:
    ld   [hl],a                     ; 02:5918
    ld   hl,$D11D                   ; 02:5919
    add  hl,bc                      ; 02:591C
    ld   a,$02                      ; 02:591D
    add  [hl]                       ; 02:591F
    cp   $20                        ; 02:5920
    jr   nc,Code025926              ; 02:5922
    ld   a,$20                      ; 02:5924
Code025926:
    ld   [hl],a                     ; 02:5926
    ld   hl,$D0A5                   ; 02:5927
    add  hl,bc                      ; 02:592A
    ld   a,[hl]                     ; 02:592B
    and  a                          ; 02:592C
    jr   z,Code025940               ; 02:592D
    dec  [hl]                       ; 02:592F
    ld   hl,W_SpriteYLow            ; 02:5930
    add  hl,bc                      ; 02:5933
    ld   a,[hl]                     ; 02:5934
    push hl                         ; 02:5935
    push af                         ; 02:5936
    add  $FE                        ; 02:5937
    ld   [hl],a                     ; 02:5939
    call Sub0245DF                  ; 02:593A
    pop  af                         ; 02:593D
    pop  hl                         ; 02:593E
    ld   [hl],a                     ; 02:593F
Code025940:
    call Sub001A3D                  ; 02:5940
    call Sub001A79                  ; 02:5943
    call Sub0029FC                  ; 02:5946
    ld   hl,W_SpriteYSpeed          ; 02:5949
    add  hl,bc                      ; 02:594C
    ld   a,[hl]                     ; 02:594D
    ldh  [<$FF99],a                 ; 02:594E
    push hl                         ; 02:5950
    ld   hl,$D11D                   ; 02:5951
    add  hl,bc                      ; 02:5954
    ld   a,[hl]                     ; 02:5955
    pop  hl                         ; 02:5956
    ld   [hl],a                     ; 02:5957
    ld   hl,$D087                   ; 02:5958
    add  hl,bc                      ; 02:595B
    ld   a,[hl]                     ; 02:595C
    ldh  [<$FF9A],a                 ; 02:595D
    push hl                         ; 02:595F
    ld   hl,$D12C                   ; 02:5960
    add  hl,bc                      ; 02:5963
    ld   a,[hl]                     ; 02:5964
    pop  hl                         ; 02:5965
    ld   [hl],a                     ; 02:5966
    ld   hl,W_SpriteYLow            ; 02:5967
    add  hl,bc                      ; 02:596A
    ld   a,[hl]                     ; 02:596B
    ldh  [<$FF9B],a                 ; 02:596C
    push hl                         ; 02:596E
    ld   hl,$D1D1                   ; 02:596F
    add  hl,bc                      ; 02:5972
    ld   a,[hl]                     ; 02:5973
    pop  hl                         ; 02:5974
    ld   [hl],a                     ; 02:5975
    ld   hl,W_SpriteYHigh           ; 02:5976
    add  hl,bc                      ; 02:5979
    ld   a,[hl]                     ; 02:597A
    ldh  [<$FF9C],a                 ; 02:597B
    push hl                         ; 02:597D
    ld   hl,$D1E0                   ; 02:597E
    add  hl,bc                      ; 02:5981
    ld   a,[hl]                     ; 02:5982
    pop  hl                         ; 02:5983
    ld   [hl],a                     ; 02:5984
    call Sub001A79                  ; 02:5985
    ld   hl,W_SpriteYSpeed          ; 02:5988
    add  hl,bc                      ; 02:598B
    ld   a,[hl]                     ; 02:598C
    push hl                         ; 02:598D
    ld   hl,$D11D                   ; 02:598E
    add  hl,bc                      ; 02:5991
    ld   [hl],a                     ; 02:5992
    pop  hl                         ; 02:5993
    ldh  a,[<$FF99]                 ; 02:5994
    ld   [hl],a                     ; 02:5996
    ld   hl,$D087                   ; 02:5997
    add  hl,bc                      ; 02:599A
    ld   a,[hl]                     ; 02:599B
    push hl                         ; 02:599C
    ld   hl,$D12C                   ; 02:599D
    add  hl,bc                      ; 02:59A0
    ld   [hl],a                     ; 02:59A1
    pop  hl                         ; 02:59A2
    ldh  a,[<$FF9A]                 ; 02:59A3
    ld   [hl],a                     ; 02:59A5
    ld   hl,W_SpriteYLow            ; 02:59A6
    add  hl,bc                      ; 02:59A9
    ld   a,[hl]                     ; 02:59AA
    push hl                         ; 02:59AB
    ld   hl,$D1D1                   ; 02:59AC
    add  hl,bc                      ; 02:59AF
    ld   [hl],a                     ; 02:59B0
    pop  hl                         ; 02:59B1
    ldh  a,[<$FF9B]                 ; 02:59B2
    ld   [hl],a                     ; 02:59B4
    ld   hl,W_SpriteYHigh           ; 02:59B5
    add  hl,bc                      ; 02:59B8
    ld   a,[hl]                     ; 02:59B9
    push hl                         ; 02:59BA
    ld   hl,$D1E0                   ; 02:59BB
    add  hl,bc                      ; 02:59BE
    ld   [hl],a                     ; 02:59BF
    pop  hl                         ; 02:59C0
    ldh  a,[<$FF9C]                 ; 02:59C1
    ld   [hl],a                     ; 02:59C3
    ld   hl,$D096                   ; 02:59C4
    add  hl,bc                      ; 02:59C7
    ld   a,[hl]                     ; 02:59C8
    cp   $00                        ; 02:59C9
    jr   z,Code0259CE               ; 02:59CB
    dec  [hl]                       ; 02:59CD
Code0259CE:
    ld   a,[hl]                     ; 02:59CE
    and  a                          ; 02:59CF
    jr   nz,Code0259DD              ; 02:59D0
    ld   [hl],$02                   ; 02:59D2
    ld   hl,$D177                   ; 02:59D4
    add  hl,bc                      ; 02:59D7
    ld   a,[hl]                     ; 02:59D8
    inc  a                          ; 02:59D9
    and  $03                        ; 02:59DA
    ld   [hl],a                     ; 02:59DC
Code0259DD:
    ld   hl,$D177                   ; 02:59DD
    add  hl,bc                      ; 02:59E0
    ld   a,[hl]                     ; 02:59E1
    sla  a                          ; 02:59E2
    ld   e,a                        ; 02:59E4
    ld   d,$00                      ; 02:59E5
    ld   hl,Data0258FD              ; 02:59E7
    add  hl,de                      ; 02:59EA
    push hl                         ; 02:59EB
    call Sub002893                  ; 02:59EC
    ld   hl,$D1B3                   ; 02:59EF
    add  hl,bc                      ; 02:59F2
    ld   a,[hl]                     ; 02:59F3
    ld   e,a                        ; 02:59F4
    ld   hl,$D1C2                   ; 02:59F5
    add  hl,bc                      ; 02:59F8
    ld   a,[hl]                     ; 02:59F9
    ld   d,a                        ; 02:59FA
    ld   hl,W_SpriteXLow            ; 02:59FB
    add  hl,bc                      ; 02:59FE
    ld   a,e                        ; 02:59FF
    sub  [hl]                       ; 02:5A00
    ldh  [<$FF98],a                 ; 02:5A01
    push af                         ; 02:5A03
    ld   hl,W_SpriteXHigh           ; 02:5A04
    add  hl,bc                      ; 02:5A07
    pop  af                         ; 02:5A08
    ld   a,d                        ; 02:5A09
    sbc  [hl]                       ; 02:5A0A
    ldh  [<$FF99],a                 ; 02:5A0B
    ldh  a,[<$FF98]                 ; 02:5A0D
    add  e                          ; 02:5A0F
    ld   e,a                        ; 02:5A10
    ldh  a,[<$FF99]                 ; 02:5A11
    adc  d                          ; 02:5A13
    ld   d,a                        ; 02:5A14
    ld   a,e                        ; 02:5A15
    add  $F8                        ; 02:5A16
    ldh  [<$FF98],a                 ; 02:5A18
    ld   [$D2E4],a                  ; 02:5A1A
    ld   a,d                        ; 02:5A1D
    adc  $FF                        ; 02:5A1E
    ldh  [<$FF99],a                 ; 02:5A20
    ld   [$D2E5],a                  ; 02:5A22
    ld   hl,W_SpriteYLow            ; 02:5A25
    add  hl,bc                      ; 02:5A28
    ld   a,[hl]                     ; 02:5A29
    ldh  [<$FF97],a                 ; 02:5A2A
    ld   hl,W_SpriteYHigh           ; 02:5A2C
    add  hl,bc                      ; 02:5A2F
    ld   a,[hl]                     ; 02:5A30
    ldh  [<$FFA6],a                 ; 02:5A31
    pop  hl                         ; 02:5A33
    push hl                         ; 02:5A34
    call Sub002861                  ; 02:5A35
    ld   hl,W_SpriteXLow            ; 02:5A38
    add  hl,bc                      ; 02:5A3B
    ld   a,[hl]                     ; 02:5A3C
    ldh  [<$FF98],a                 ; 02:5A3D
    ld   hl,W_SpriteXHigh           ; 02:5A3F
    add  hl,bc                      ; 02:5A42
    ld   a,[hl]                     ; 02:5A43
    ldh  [<$FF99],a                 ; 02:5A44
    ld   hl,$D1D1                   ; 02:5A46
    add  hl,bc                      ; 02:5A49
    ld   a,[hl]                     ; 02:5A4A
    ldh  [<$FF97],a                 ; 02:5A4B
    ld   hl,$D1E0                   ; 02:5A4D
    add  hl,bc                      ; 02:5A50
    ld   a,[hl]                     ; 02:5A51
    ldh  [<$FFA6],a                 ; 02:5A52
    pop  hl                         ; 02:5A54
    push hl                         ; 02:5A55
    call Sub002861                  ; 02:5A56
    ld   a,[$D2E4]                  ; 02:5A59
    ldh  [<$FF98],a                 ; 02:5A5C
    ld   a,[$D2E5]                  ; 02:5A5E
    ldh  [<$FF99],a                 ; 02:5A61
    ld   hl,$D1D1                   ; 02:5A63
    add  hl,bc                      ; 02:5A66
    ld   a,[hl]                     ; 02:5A67
    ldh  [<$FF97],a                 ; 02:5A68
    ld   hl,$D1E0                   ; 02:5A6A
    add  hl,bc                      ; 02:5A6D
    ld   a,[hl]                     ; 02:5A6E
    ldh  [<$FFA6],a                 ; 02:5A6F
    pop  hl                         ; 02:5A71
    call Sub002861                  ; 02:5A72
    ret                             ; 02:5A75

Data025A76:                         ; 02:5A76
.db $80,$0A,$90,$06

HammerBro_Init:
; sprite 17 init
    ld   e,$00                      ; 02:5A7A
    ld   hl,W_SpriteYLow            ; 02:5A7C
    add  hl,bc                      ; 02:5A7F
    ld   a,[hl]                     ; 02:5A80
    add  $08                        ; 02:5A81
    ld   [hl],a                     ; 02:5A83
    cp   $60                        ; 02:5A84
    jr   c,Code025A8E               ; 02:5A86
    inc  e                          ; 02:5A88
    cp   $A0                        ; 02:5A89
    jr   c,Code025A8E               ; 02:5A8B
    inc  e                          ; 02:5A8D
Code025A8E:
    ld   hl,$D12C                   ; 02:5A8E
    add  hl,bc                      ; 02:5A91
    ld   a,e                        ; 02:5A92
    ld   [hl],a                     ; 02:5A93
    ld   hl,W_SpriteXLow            ; 02:5A94
    add  hl,bc                      ; 02:5A97
    ld   a,[hl]                     ; 02:5A98
    ld   hl,$D1B3                   ; 02:5A99
    add  hl,bc                      ; 02:5A9C
    ld   [hl],a                     ; 02:5A9D
    ld   hl,W_SpriteXHigh           ; 02:5A9E
    add  hl,bc                      ; 02:5AA1
    ld   a,[hl]                     ; 02:5AA2
    push hl                         ; 02:5AA3
    ld   hl,$D1C2                   ; 02:5AA4
    add  hl,bc                      ; 02:5AA7
    ld   [hl],a                     ; 02:5AA8
    ld   hl,W_SpriteXLow            ; 02:5AA9
    add  hl,bc                      ; 02:5AAC
    ld   a,[hl]                     ; 02:5AAD
    sub  $0C                        ; 02:5AAE
    ldh  [<$FF97],a                 ; 02:5AB0
    pop  hl                         ; 02:5AB2
    ld   a,[hl]                     ; 02:5AB3
    sbc  $00                        ; 02:5AB4
    ld   hl,$D1E0                   ; 02:5AB6
    add  hl,bc                      ; 02:5AB9
    ld   [hl],a                     ; 02:5ABA
    ldh  a,[<$FF97]                 ; 02:5ABB
    ld   hl,$D1D1                   ; 02:5ABD
    add  hl,bc                      ; 02:5AC0
    ld   [hl],a                     ; 02:5AC1
    ld   a,[W_SPFlag]               ; 02:5AC2
    and  a                          ; 02:5AC5
    jr   z,Code025ACF               ; 02:5AC6
    ld   a,[W_LevelID]              ; 02:5AC8
    cp   $18                        ; 02:5ACB
    jr   nc,Code025AEA              ; 02:5ACD
Code025ACF:
    ld   a,[$D2F8]                  ; 02:5ACF
    sla  a                          ; 02:5AD2
    ld   e,a                        ; 02:5AD4
    ld   d,$00                      ; 02:5AD5
    ld   hl,Data025A76              ; 02:5AD7
    add  hl,de                      ; 02:5ADA
    ldi  a,[hl]                     ; 02:5ADB
    push hl                         ; 02:5ADC
    ld   hl,$D0C3                   ; 02:5ADD
    add  hl,bc                      ; 02:5AE0
    ld   [hl],a                     ; 02:5AE1
    pop  hl                         ; 02:5AE2
    ld   a,[hl]                     ; 02:5AE3
    ld   hl,$D13B                   ; 02:5AE4
    add  hl,bc                      ; 02:5AE7
    ld   [hl],a                     ; 02:5AE8
    ret                             ; 02:5AE9

Code025AEA:
    ldh  a,[<H_GlobalTimer]         ; 02:5AEA
    and  $3C                        ; 02:5AEC
    add  $78                        ; 02:5AEE
    ld   hl,$D0B4                   ; 02:5AF0
    add  hl,bc                      ; 02:5AF3
    ld   [hl],a                     ; 02:5AF4
    ld   hl,W_SpriteSubstate        ; 02:5AF5
    add  hl,bc                      ; 02:5AF8
    ld   [hl],$02                   ; 02:5AF9
    ret                             ; 02:5AFB

Data025AFC:                         ; 02:5AFC
.db $02,$03,$02

HammerBro_Main:
; sprite 17 main
    call Sub0025CB                  ; 02:5AFF
    jp   c,Code025B2B               ; 02:5B02
    ld   hl,W_SpriteSubstate        ; 02:5B05
    add  hl,bc                      ; 02:5B08
    ld   e,[hl]                     ; 02:5B09
    ld   d,$00                      ; 02:5B0A
    ld   hl,Data025AFC              ; 02:5B0C
    add  hl,de                      ; 02:5B0F
    ld   a,[hl]                     ; 02:5B10
    ld   hl,W_SpriteYSpeed          ; 02:5B11
    add  hl,bc                      ; 02:5B14
    add  [hl]                       ; 02:5B15
    bit  7,a                        ; 02:5B16
    jr   nz,Code025B21              ; 02:5B18
    cp   $40                        ; 02:5B1A
    jp   c,Code025B21               ; 02:5B1C
    ld   a,$40                      ; 02:5B1F
Code025B21:
    ld   [hl],a                     ; 02:5B21
    call Sub001A3D                  ; 02:5B22
    call Sub001A79                  ; 02:5B25
    call Sub025B2F                  ; 02:5B28
Code025B2B:
    call Sub025D9F                  ; 02:5B2B
    ret                             ; 02:5B2E

Sub025B2F:
    ld   hl,W_SpriteSubstate        ; 02:5B2F
    add  hl,bc                      ; 02:5B32
    ld   a,[hl]                     ; 02:5B33
    rst  $00                        ; 02:5B34  Execute from 16-bit pointer table
.dw Code025B3F                      ; 02:5B35
.dw Code025D44                      ; 02:5B37
.dw Code025B3F                      ; 02:5B39

Data025B3B:                         ; 02:5B3B
.db $30,$1C
Data025B3D:                         ; 02:5B3D
.db $20,$37

Code025B3F:
    call Sub002920                  ; 02:5B3F
    jp   c,Return025D43             ; 02:5B42
    call Sub0029DA                  ; 02:5B45
    ld   hl,W_SpriteSubstate        ; 02:5B48
    add  hl,bc                      ; 02:5B4B
    ld   a,[hl]                     ; 02:5B4C
    cp   $02                        ; 02:5B4D
    jr   z,Code025B6D               ; 02:5B4F
    ld   hl,$D0C3                   ; 02:5B51
    add  hl,bc                      ; 02:5B54
    dec  [hl]                       ; 02:5B55
    jr   nz,Code025B6D              ; 02:5B56
    ld   hl,$D13B                   ; 02:5B58
    add  hl,bc                      ; 02:5B5B
    dec  [hl]                       ; 02:5B5C
    bit  7,[hl]                     ; 02:5B5D
    jr   z,Code025B6D               ; 02:5B5F
    ld   hl,W_SpriteSubstate        ; 02:5B61
    add  hl,bc                      ; 02:5B64
    ld   [hl],$02                   ; 02:5B65
    ld   hl,$D0E1                   ; 02:5B67
    add  hl,bc                      ; 02:5B6A
    ld   [hl],$00                   ; 02:5B6B
Code025B6D:
    ld   e,$FC                      ; 02:5B6D
    ldh  a,[<H_GlobalTimer]         ; 02:5B6F
    and  $40                        ; 02:5B71
    jr   nz,Code025B77              ; 02:5B73
    ld   e,$04                      ; 02:5B75
Code025B77:
    ld   hl,W_SpriteXSpeed          ; 02:5B77
    add  hl,bc                      ; 02:5B7A
    ld   [hl],e                     ; 02:5B7B
    ld   e,$01                      ; 02:5B7C
    call Sub002FEF                  ; 02:5B7E
    jr   nc,Code025B93              ; 02:5B81
    dec  e                          ; 02:5B83
    ld   hl,W_SpriteSubstate        ; 02:5B84
    add  hl,bc                      ; 02:5B87
    ld   a,[hl]                     ; 02:5B88
    cp   $02                        ; 02:5B89
    jr   nz,Code025B93              ; 02:5B8B
    ld   hl,W_SpriteXSpeed          ; 02:5B8D
    add  hl,bc                      ; 02:5B90
    ld   [hl],$F8                   ; 02:5B91
Code025B93:
    ld   hl,$D195                   ; 02:5B93
    add  hl,bc                      ; 02:5B96
    ld   [hl],e                     ; 02:5B97
    call Sub001D21                  ; 02:5B98
    jr   nc,Code025C01              ; 02:5B9B
    ld   e,a                        ; 02:5B9D
    ld   a,[$C1DA]                  ; 02:5B9E
    ld   hl,$C1DB                   ; 02:5BA1
    or   [hl]                       ; 02:5BA4
    jr   nz,Code025BE8              ; 02:5BA5
    ld   a,e                        ; 02:5BA7
    cp   $02                        ; 02:5BA8
    jr   z,Code025BE0               ; 02:5BAA
    and  a                          ; 02:5BAC
    jr   z,Code025BE0               ; 02:5BAD
    call Sub002189                  ; 02:5BAF
    jr   nc,Code025BE0              ; 02:5BB2
    xor  a                          ; 02:5BB4
    ld   hl,$D0E1                   ; 02:5BB5
    add  hl,bc                      ; 02:5BB8
    ld   [hl],a                     ; 02:5BB9
    ld   hl,W_SpriteXSpeed          ; 02:5BBA
    add  hl,bc                      ; 02:5BBD
    ld   [hl],a                     ; 02:5BBE
    ld   hl,W_SpriteYSpeed          ; 02:5BBF
    add  hl,bc                      ; 02:5BC2
    ld   [hl],a                     ; 02:5BC3
    ld   hl,W_SpriteSubstate        ; 02:5BC4
    add  hl,bc                      ; 02:5BC7
    ld   [hl],$01                   ; 02:5BC8
    ld   hl,$D195                   ; 02:5BCA
    add  hl,bc                      ; 02:5BCD
    ld   a,[hl]                     ; 02:5BCE
    xor  $01                        ; 02:5BCF
    ld   [hl],a                     ; 02:5BD1
    call Sub0025F8                  ; 02:5BD2
    ld   a,$05                      ; 02:5BD5
    call Sub002E90                  ; 02:5BD7
    ld   hl,W_AlbumUnlockFlags+2    ; 02:5BDA
    set  5,[hl]                     ; 02:5BDD
    ret                             ; 02:5BDF

Code025BE0:
    ld   a,$02                      ; 02:5BE0
    rst  $10                        ; 02:5BE2  24-bit call
.dl SubL_0B4074                     ; 02:5BE3
    jr   Code025C01                 ; 02:5BE6
Code025BE8:
    ld   hl,W_SpriteSubstate        ; 02:5BE8
    add  hl,bc                      ; 02:5BEB
    ld   [hl],$01                   ; 02:5BEC
    ld   hl,W_SpriteStatus          ; 02:5BEE
    add  hl,bc                      ; 02:5BF1
    ld   a,[hl]                     ; 02:5BF2
    push af                         ; 02:5BF3
    push hl                         ; 02:5BF4
    call Sub001965                  ; 02:5BF5
    pop  hl                         ; 02:5BF8
    pop  af                         ; 02:5BF9
    ld   [hl],a                     ; 02:5BFA
    ld   hl,W_AlbumUnlockFlags+2    ; 02:5BFB
    set  5,[hl]                     ; 02:5BFE
    ret                             ; 02:5C00

Code025C01:
    ld   hl,W_SpriteXSpeed          ; 02:5C01
    add  hl,bc                      ; 02:5C04
    ld   a,[hl]                     ; 02:5C05
    cp   $F8                        ; 02:5C06
    jr   nz,Code025C49              ; 02:5C08
    ld   hl,$D0E1                   ; 02:5C0A
    add  hl,bc                      ; 02:5C0D
    ld   a,[hl]                     ; 02:5C0E
    and  a                          ; 02:5C0F
    jr   nz,Code025C49              ; 02:5C10
    ld   hl,W_SpriteXHigh           ; 02:5C12
    add  hl,bc                      ; 02:5C15
    ld   a,[hl]                     ; 02:5C16
    push af                         ; 02:5C17
    ld   hl,W_SpriteXLow            ; 02:5C18
    add  hl,bc                      ; 02:5C1B
    ld   a,[hl]                     ; 02:5C1C
    push af                         ; 02:5C1D
    sub  $10                        ; 02:5C1E
    ld   [hl],a                     ; 02:5C20
    push af                         ; 02:5C21
    ld   hl,W_SpriteXHigh           ; 02:5C22
    add  hl,bc                      ; 02:5C25
    pop  af                         ; 02:5C26
    ld   a,[hl]                     ; 02:5C27
    sbc  $00                        ; 02:5C28
    ld   [hl],a                     ; 02:5C2A
    ld   hl,$FFA3                   ; 02:5C2B
    xor  a                          ; 02:5C2E
    ldi  [hl],a                     ; 02:5C2F
    ld   [hl],$08                   ; 02:5C30
    call Sub001C71                  ; 02:5C32
    jr   nc,Code025C3D              ; 02:5C35
    ld   hl,$D0B4                   ; 02:5C37
    add  hl,bc                      ; 02:5C3A
    ld   [hl],$00                   ; 02:5C3B
Code025C3D:
    pop  af                         ; 02:5C3D
    ld   hl,W_SpriteXLow            ; 02:5C3E
    add  hl,bc                      ; 02:5C41
    ld   [hl],a                     ; 02:5C42
    pop  af                         ; 02:5C43
    ld   hl,W_SpriteXHigh           ; 02:5C44
    add  hl,bc                      ; 02:5C47
    ld   [hl],a                     ; 02:5C48
Code025C49:
    ld   hl,$D0D2                   ; 02:5C49
    add  hl,bc                      ; 02:5C4C
    ld   a,[hl]                     ; 02:5C4D
    and  a                          ; 02:5C4E
    jr   z,Code025C55               ; 02:5C4F
    dec  [hl]                       ; 02:5C51
    jp   Code025D2E                 ; 02:5C52
Code025C55:
    call Sub001BCF                  ; 02:5C55
    ldh  a,[<$FFA5]                 ; 02:5C58
    and  $03                        ; 02:5C5A
    jr   z,Code025C64               ; 02:5C5C
    ld   hl,$D0E1                   ; 02:5C5E
    add  hl,bc                      ; 02:5C61
    ld   [hl],$00                   ; 02:5C62
Code025C64:
    ld   hl,$D0B4                   ; 02:5C64
    add  hl,bc                      ; 02:5C67
    ld   a,[hl]                     ; 02:5C68
    and  a                          ; 02:5C69
    jr   z,Code025CC2               ; 02:5C6A
    dec  [hl]                       ; 02:5C6C
    ld   hl,$D0A5                   ; 02:5C6D
    add  hl,bc                      ; 02:5C70
    ld   a,[hl]                     ; 02:5C71
    dec  [hl]                       ; 02:5C72
    cp   $0C                        ; 02:5C73
    jr   z,Code025C9B               ; 02:5C75
    and  a                          ; 02:5C77
    jp   nz,Code025D2E              ; 02:5C78
    ld   hl,$D11D                   ; 02:5C7B
    add  hl,bc                      ; 02:5C7E
    ld   a,[hl]                     ; 02:5C7F
    and  a                          ; 02:5C80
    jr   z,Code025C88               ; 02:5C81
    ld   [hl],$00                   ; 02:5C83
    call Hammer_Init                ; 02:5C85
Code025C88:
    ld   a,[$D2F8]                  ; 02:5C88
    ld   e,a                        ; 02:5C8B
    ld   d,$00                      ; 02:5C8C
    ld   hl,Data025B3B              ; 02:5C8E
    add  hl,de                      ; 02:5C91
    ld   a,[hl]                     ; 02:5C92
    ld   hl,$D0A5                   ; 02:5C93
    add  hl,bc                      ; 02:5C96
    ld   [hl],a                     ; 02:5C97
    jp   Code025D2E                 ; 02:5C98
Code025C9B:
    call Sub0010E4                  ; 02:5C9B
    bit  3,a                        ; 02:5C9E
    jr   nz,Code025CA6              ; 02:5CA0
    and  $07                        ; 02:5CA2
    jr   Code025CAD                 ; 02:5CA4
Code025CA6:
    and  $0B                        ; 02:5CA6
    cp   $0B                        ; 02:5CA8
    jr   nz,Code025CAD              ; 02:5CAA
    dec  a                          ; 02:5CAC
Code025CAD:
    ld   e,a                        ; 02:5CAD
    ld   d,$00                      ; 02:5CAE
    ld   hl,W_SpriteStatus          ; 02:5CB0
    add  hl,de                      ; 02:5CB3
    ld   a,[hl]                     ; 02:5CB4
    and  a                          ; 02:5CB5
    jr   nz,Code025D2E              ; 02:5CB6
    ld   hl,$D11D                   ; 02:5CB8
    add  hl,bc                      ; 02:5CBB
    ld   [hl],$01                   ; 02:5CBC
    jr   Code025D2E                 ; 02:5CBE
    jr   Code025D2E                 ; 02:5CC0
Code025CC2:
    ld   hl,$D1EF                   ; 02:5CC2
    add  hl,bc                      ; 02:5CC5
    ld   a,[hl]                     ; 02:5CC6
    and  a                          ; 02:5CC7
    jr   z,Code025D2E               ; 02:5CC8
    call Sub0010E4                  ; 02:5CCA
    xor  a                          ; 02:5CCD
    ldh  [<$FF97],a                 ; 02:5CCE
    ld   e,$BC                      ; 02:5CD0
    ld   hl,W_SpriteYLow            ; 02:5CD2
    add  hl,bc                      ; 02:5CD5
    ld   a,[hl]                     ; 02:5CD6
    cp   $A0                        ; 02:5CD7
    jr   nc,Code025CF2              ; 02:5CD9
    ld   d,a                        ; 02:5CDB
    ld   a,$01                      ; 02:5CDC
    ldh  [<$FF97],a                 ; 02:5CDE
    ld   e,$E8                      ; 02:5CE0
    ld   a,d                        ; 02:5CE2
    cp   $98                        ; 02:5CE3
    jr   c,Code025CF2               ; 02:5CE5
    xor  a                          ; 02:5CE7
    ldh  [<$FF97],a                 ; 02:5CE8
    ldh  a,[<$FFBC]                 ; 02:5CEA
    and  $01                        ; 02:5CEC
    jr   nz,Code025CF2              ; 02:5CEE
    ld   e,$BC                      ; 02:5CF0
Code025CF2:
    ld   hl,W_SpriteYSpeed          ; 02:5CF2
    add  hl,bc                      ; 02:5CF5
    ld   [hl],e                     ; 02:5CF6
    ldh  a,[<$FFBC]                 ; 02:5CF7
    and  $01                        ; 02:5CF9
    ld   hl,$FF97                   ; 02:5CFB
    and  [hl]                       ; 02:5CFE
    ld   e,a                        ; 02:5CFF
    ld   a,[$D2F8]                  ; 02:5D00
    and  a                          ; 02:5D03
    jr   nz,Code025D07              ; 02:5D04
    ld   e,a                        ; 02:5D06
Code025D07:
    ld   a,e                        ; 02:5D07
    and  a                          ; 02:5D08
    jr   z,Code025D10               ; 02:5D09
    call Sub0010E4                  ; 02:5D0B
    and  $01                        ; 02:5D0E
Code025D10:
    ld   e,a                        ; 02:5D10
    ld   d,$00                      ; 02:5D11
    ld   hl,Data025B3D              ; 02:5D13
    add  hl,de                      ; 02:5D16
    ld   a,[hl]                     ; 02:5D17
    ld   hl,$D0D2                   ; 02:5D18
    add  hl,bc                      ; 02:5D1B
    ld   [hl],a                     ; 02:5D1C
    ldh  a,[<$FFBC]                 ; 02:5D1D
    and  $1F                        ; 02:5D1F
    or   $C0                        ; 02:5D21
    ld   hl,$D0B4                   ; 02:5D23
    add  hl,bc                      ; 02:5D26
    ld   [hl],a                     ; 02:5D27
    ld   hl,$D0E1                   ; 02:5D28
    add  hl,bc                      ; 02:5D2B
    ld   [hl],$01                   ; 02:5D2C
Code025D2E:
    ld   hl,$D096                   ; 02:5D2E
    add  hl,bc                      ; 02:5D31
    dec  [hl]                       ; 02:5D32
    ld   a,[hl]                     ; 02:5D33
    bit  7,a                        ; 02:5D34
    jr   z,Return025D43             ; 02:5D36
    ld   [hl],$07                   ; 02:5D38
    ld   hl,$D177                   ; 02:5D3A
    add  hl,bc                      ; 02:5D3D
    ld   a,[hl]                     ; 02:5D3E
    inc  a                          ; 02:5D3F
    and  $01                        ; 02:5D40
    ld   [hl],a                     ; 02:5D42
Return025D43:
    ret                             ; 02:5D43

Code025D44:
    ld   hl,$D1A4                   ; 02:5D44
    add  hl,bc                      ; 02:5D47
    ld   [hl],$01                   ; 02:5D48
    ld   hl,$D0E1                   ; 02:5D4A
    add  hl,bc                      ; 02:5D4D
    ld   [hl],$00                   ; 02:5D4E
    call Sub0029DA                  ; 02:5D50
    call Sub002920                  ; 02:5D53
    ret                             ; 02:5D56

Data025D57:                         ; 02:5D57
.db $92,$27,$90,$27
Data025D5B:                         ; 02:5D5B
.db $96,$27,$94,$27,$9A,$27,$98,$27,\
    $9A,$27,$98,$27,$90,$07,$92,$07,\
    $94,$07,$96,$07,$98,$07,$9A,$07,\
    $98,$07,$9A,$07
Data025D77:                         ; 02:5D77
.db $A6,$27,$A4,$27,$A2,$27,$A0,$27,\
    $A4,$07,$A6,$07,$A0,$07,$A2,$07
Data025D87:                         ; 02:5D87
.db $A0,$47,$A2,$47,$A2,$67,$A0,$67
Data025D8F:                         ; 02:5D8F
.db $94,$47,$96,$47,$96,$67,$94,$67,\
    $08,$00
Data025D99:                         ; 02:5D99
.db $66,$41,$66,$61
Data025D9D:                         ; 02:5D9D
.db $05,$03

Sub025D9F:
    ld   hl,W_SpriteSubstate        ; 02:5D9F
    add  hl,bc                      ; 02:5DA2
    ld   a,[hl]                     ; 02:5DA3
    rst  $00                        ; 02:5DA4  Execute from 16-bit pointer table
.dw Code025DAB                      ; 02:5DA5
.dw Sub025EA0                       ; 02:5DA7
.dw Code025DAB                      ; 02:5DA9

Code025DAB:
    ld   d,$00                      ; 02:5DAB
    ld   hl,$D11D                   ; 02:5DAD
    add  hl,bc                      ; 02:5DB0
    ld   a,[hl]                     ; 02:5DB1
    and  a                          ; 02:5DB2
    jr   z,Code025DF3               ; 02:5DB3
    ld   hl,W_SpriteYLow            ; 02:5DB5
    add  hl,bc                      ; 02:5DB8
    ld   a,[hl]                     ; 02:5DB9
    sub  $09                        ; 02:5DBA
    ldh  [<$FF97],a                 ; 02:5DBC
    ld   hl,W_SpriteYHigh           ; 02:5DBE
    add  hl,bc                      ; 02:5DC1
    ld   a,[hl]                     ; 02:5DC2
    ldh  [<$FFA6],a                 ; 02:5DC3
    ld   hl,W_SpriteXLow            ; 02:5DC5
    add  hl,bc                      ; 02:5DC8
    ld   a,[hl]                     ; 02:5DC9
    ldh  [<$FF98],a                 ; 02:5DCA
    ld   hl,W_SpriteXHigh           ; 02:5DCC
    add  hl,bc                      ; 02:5DCF
    ld   a,[hl]                     ; 02:5DD0
    ldh  [<$FF99],a                 ; 02:5DD1
    ld   hl,$D195                   ; 02:5DD3
    add  hl,bc                      ; 02:5DD6
    ld   a,[hl]                     ; 02:5DD7
    ld   e,a                        ; 02:5DD8
    ld   hl,Data025D9D              ; 02:5DD9
    add  hl,de                      ; 02:5DDC
    ld   a,[hl]                     ; 02:5DDD
    ld   hl,$FF98                   ; 02:5DDE
    add  [hl]                       ; 02:5DE1
    ldh  [<$FF98],a                 ; 02:5DE2
    ldh  a,[<$FF99]                 ; 02:5DE4
    adc  $00                        ; 02:5DE6
    ldh  [<$FF99],a                 ; 02:5DE8
    sla  e                          ; 02:5DEA
    ld   hl,Data025D99              ; 02:5DEC
    add  hl,de                      ; 02:5DEF
    call Sub002861                  ; 02:5DF0
Code025DF3:
    ld   hl,W_SpriteYSpeed          ; 02:5DF3
    add  hl,bc                      ; 02:5DF6
    ld   a,[hl]                     ; 02:5DF7
    and  a                          ; 02:5DF8
    jr   z,Code025E3E               ; 02:5DF9
    ld   hl,$D11D                   ; 02:5DFB
    add  hl,bc                      ; 02:5DFE
    ld   a,[hl]                     ; 02:5DFF
    and  a                          ; 02:5E00
    jr   nz,Code025E43              ; 02:5E01
    ld   hl,$D195                   ; 02:5E03
    add  hl,bc                      ; 02:5E06
    ld   a,[hl]                     ; 02:5E07
    swap a                          ; 02:5E08
    ld   e,a                        ; 02:5E0A
    ld   d,$00                      ; 02:5E0B
    ld   hl,Data025D5B              ; 02:5E0D
    add  hl,de                      ; 02:5E10
    call Disp16x16Sprite            ; 02:5E11
    ld   hl,W_SpriteYLow            ; 02:5E14
    add  hl,bc                      ; 02:5E17
    ld   a,[hl]                     ; 02:5E18
    add  $10                        ; 02:5E19
    ldh  [<$FF97],a                 ; 02:5E1B
    xor  a                          ; 02:5E1D
    ldh  [<$FF9B],a                 ; 02:5E1E
    ld   hl,W_SpriteXLow            ; 02:5E20
    add  hl,bc                      ; 02:5E23
    ld   a,[hl]                     ; 02:5E24
    ldh  [<$FF98],a                 ; 02:5E25
    ld   hl,W_SpriteXHigh           ; 02:5E27
    add  hl,bc                      ; 02:5E2A
    ld   a,[hl]                     ; 02:5E2B
    ldh  [<$FF99],a                 ; 02:5E2C
    ld   hl,$D195                   ; 02:5E2E
    add  hl,bc                      ; 02:5E31
    ld   a,[hl]                     ; 02:5E32
    sla  a                          ; 02:5E33
    sla  a                          ; 02:5E35
    sla  a                          ; 02:5E37
    add  $04                        ; 02:5E39
    ld   e,a                        ; 02:5E3B
    jr   Code025E96                 ; 02:5E3C
Code025E3E:
    ld   hl,$D11D                   ; 02:5E3E
    add  hl,bc                      ; 02:5E41
    ld   a,[hl]                     ; 02:5E42
Code025E43:
    sla  a                          ; 02:5E43
    sla  a                          ; 02:5E45
    sla  a                          ; 02:5E47
    ld   e,a                        ; 02:5E49
    ld   hl,$D195                   ; 02:5E4A
    add  hl,bc                      ; 02:5E4D
    ld   a,[hl]                     ; 02:5E4E
    swap a                          ; 02:5E4F
    add  e                          ; 02:5E51
    ld   e,a                        ; 02:5E52
    ld   hl,$D177                   ; 02:5E53
    add  hl,bc                      ; 02:5E56
    ld   a,[hl]                     ; 02:5E57
    sla  a                          ; 02:5E58
    sla  a                          ; 02:5E5A
    add  e                          ; 02:5E5C
    ld   e,a                        ; 02:5E5D
    ld   hl,Data025D57              ; 02:5E5E
    add  hl,de                      ; 02:5E61
    call Disp16x16Sprite            ; 02:5E62
    ld   hl,W_SpriteYLow            ; 02:5E65
    add  hl,bc                      ; 02:5E68
    ld   a,[hl]                     ; 02:5E69
    add  $10                        ; 02:5E6A
    ldh  [<$FF97],a                 ; 02:5E6C
    xor  a                          ; 02:5E6E
    ldh  [<$FF9B],a                 ; 02:5E6F
    ld   hl,W_SpriteXLow            ; 02:5E71
    add  hl,bc                      ; 02:5E74
    ld   a,[hl]                     ; 02:5E75
    ldh  [<$FF98],a                 ; 02:5E76
    ld   hl,W_SpriteXHigh           ; 02:5E78
    add  hl,bc                      ; 02:5E7B
    ld   a,[hl]                     ; 02:5E7C
    ldh  [<$FF99],a                 ; 02:5E7D
    ld   hl,$D195                   ; 02:5E7F
    add  hl,bc                      ; 02:5E82
    ld   a,[hl]                     ; 02:5E83
    sla  a                          ; 02:5E84
    sla  a                          ; 02:5E86
    sla  a                          ; 02:5E88
    ld   e,a                        ; 02:5E8A
    ld   hl,$D177                   ; 02:5E8B
    add  hl,bc                      ; 02:5E8E
    ld   a,[hl]                     ; 02:5E8F
    sla  a                          ; 02:5E90
    sla  a                          ; 02:5E92
    add  e                          ; 02:5E94
    ld   e,a                        ; 02:5E95
Code025E96:
    ld   d,$00                      ; 02:5E96
    ld   hl,Data025D77              ; 02:5E98
    add  hl,de                      ; 02:5E9B
    call Sub002769                  ; 02:5E9C
    ret                             ; 02:5E9F

Sub025EA0:
    ld   hl,W_SpriteYLow            ; 02:5EA0
    add  hl,bc                      ; 02:5EA3
    ld   a,[hl]                     ; 02:5EA4
    sub  $08                        ; 02:5EA5
    ldh  [<$FF97],a                 ; 02:5EA7
    xor  a                          ; 02:5EA9
    ldh  [<$FF9B],a                 ; 02:5EAA
    ld   hl,W_SpriteXLow            ; 02:5EAC
    add  hl,bc                      ; 02:5EAF
    add  [hl]                       ; 02:5EB0
    ldh  [<$FF98],a                 ; 02:5EB1
    ld   hl,W_SpriteXHigh           ; 02:5EB3
    add  hl,bc                      ; 02:5EB6
    ld   a,[hl]                     ; 02:5EB7
    ldh  [<$FF99],a                 ; 02:5EB8
    ld   d,$00                      ; 02:5EBA
    ld   hl,$D195                   ; 02:5EBC
    add  hl,bc                      ; 02:5EBF
    ld   a,[hl]                     ; 02:5EC0
    sla  a                          ; 02:5EC1
    sla  a                          ; 02:5EC3
    ld   e,a                        ; 02:5EC5
    ld   hl,Data025D87              ; 02:5EC6
    add  hl,de                      ; 02:5EC9
    call Sub002769                  ; 02:5ECA
    ld   hl,W_SpriteYLow            ; 02:5ECD
    add  hl,bc                      ; 02:5ED0
    ld   a,[hl]                     ; 02:5ED1
    push af                         ; 02:5ED2
    add  $08                        ; 02:5ED3
    ld   [hl],a                     ; 02:5ED5
    ld   d,$00                      ; 02:5ED6
    ld   hl,$D195                   ; 02:5ED8
    add  hl,bc                      ; 02:5EDB
    ld   a,[hl]                     ; 02:5EDC
    sla  a                          ; 02:5EDD
    sla  a                          ; 02:5EDF
    ld   e,a                        ; 02:5EE1
    ld   hl,Data025D8F              ; 02:5EE2
    add  hl,de                      ; 02:5EE5
    call Disp16x16Sprite            ; 02:5EE6
    pop  af                         ; 02:5EE9
    ld   hl,W_SpriteYLow            ; 02:5EEA
    add  hl,bc                      ; 02:5EED
    ld   [hl],a                     ; 02:5EEE
    ret                             ; 02:5EEF

Data025EF0:                         ; 02:5EF0
.db $F0,$10
Data025EF2:                         ; 02:5EF2
.db $E0,$E8

Hammer_Init:
; sprite 18 init
    push bc                         ; 02:5EF4
    ld   a,$18                      ; 02:5EF5
    call LoadSpriteAnySlot          ; 02:5EF7
    jr   c,Code025F64               ; 02:5EFA
    pop  bc                         ; 02:5EFC
    push de                         ; 02:5EFD
    ld   hl,$D195                   ; 02:5EFE
    add  hl,bc                      ; 02:5F01
    ld   a,[hl]                     ; 02:5F02
    ld   hl,$D195                   ; 02:5F03
    add  hl,de                      ; 02:5F06
    ld   [hl],a                     ; 02:5F07
    ld   e,a                        ; 02:5F08
    ld   d,$00                      ; 02:5F09
    ld   hl,Data025EF0              ; 02:5F0B
    add  hl,de                      ; 02:5F0E
    ld   a,[hl]                     ; 02:5F0F
    pop  de                         ; 02:5F10
    ld   hl,W_SpriteXSpeed          ; 02:5F11
    add  hl,de                      ; 02:5F14
    ld   [hl],a                     ; 02:5F15
    push de                         ; 02:5F16
    ld   de,$0000                   ; 02:5F17
    ldh  a,[<H_GlobalTimer]         ; 02:5F1A
    and  $03                        ; 02:5F1C
    jr   nz,Code025F21              ; 02:5F1E
    inc  e                          ; 02:5F20
Code025F21:
    ld   hl,Data025EF2              ; 02:5F21
    add  hl,de                      ; 02:5F24
    ld   a,[hl]                     ; 02:5F25
    pop  de                         ; 02:5F26
    ld   hl,W_SpriteYSpeed          ; 02:5F27
    add  hl,de                      ; 02:5F2A
    ld   [hl],a                     ; 02:5F2B
    ld   hl,W_SpriteYLow            ; 02:5F2C
    add  hl,bc                      ; 02:5F2F
    ld   a,[hl]                     ; 02:5F30
    sub  $06                        ; 02:5F31
    ld   hl,W_SpriteYLow            ; 02:5F33
    add  hl,de                      ; 02:5F36
    ld   [hl],a                     ; 02:5F37
    push de                         ; 02:5F38
    ld   hl,$D195                   ; 02:5F39
    add  hl,bc                      ; 02:5F3C
    ld   a,[hl]                     ; 02:5F3D
    ld   e,a                        ; 02:5F3E
    ld   d,$00                      ; 02:5F3F
    ld   hl,Data025D9D              ; 02:5F41
    add  hl,de                      ; 02:5F44
    ld   a,[hl]                     ; 02:5F45
    pop  de                         ; 02:5F46
    ld   hl,W_SpriteXHigh           ; 02:5F47
    add  hl,bc                      ; 02:5F4A
    push hl                         ; 02:5F4B
    ld   hl,W_SpriteXLow            ; 02:5F4C
    add  hl,bc                      ; 02:5F4F
    add  [hl]                       ; 02:5F50
    ldh  [<$FF97],a                 ; 02:5F51
    pop  hl                         ; 02:5F53
    ld   a,$00                      ; 02:5F54
    adc  [hl]                       ; 02:5F56
    ld   hl,W_SpriteXHigh           ; 02:5F57
    add  hl,de                      ; 02:5F5A
    ld   [hl],a                     ; 02:5F5B
    ld   hl,W_SpriteXLow            ; 02:5F5C
    add  hl,de                      ; 02:5F5F
    ldh  a,[<$FF97]                 ; 02:5F60
    ld   [hl],a                     ; 02:5F62
    ret                             ; 02:5F63

Code025F64:
    pop  bc                         ; 02:5F64
    ret                             ; 02:5F65

Hammer_Main:
; sprite 18 main
    call Sub0025CB                  ; 02:5F66
    jp   c,Code025F97               ; 02:5F69
    ld   hl,$D0C3                   ; 02:5F6C
    add  hl,bc                      ; 02:5F6F
    ld   a,[hl]                     ; 02:5F70
    dec  [hl]                       ; 02:5F71
    and  a                          ; 02:5F72
    jr   z,Code025F7A               ; 02:5F73
    call Sub02695E                  ; 02:5F75
    jr   Code025F97                 ; 02:5F78
Code025F7A:
    ld   [hl],$00                   ; 02:5F7A
    ld   hl,W_SpriteYSpeed          ; 02:5F7C
    add  hl,bc                      ; 02:5F7F
    ld   a,$01                      ; 02:5F80
    add  [hl]                       ; 02:5F82
    bit  7,a                        ; 02:5F83
    jr   nz,Code025F8D              ; 02:5F85
    cp   $30                        ; 02:5F87
    jr   c,Code025F8D               ; 02:5F89
    ld   a,$30                      ; 02:5F8B
Code025F8D:
    ld   [hl],a                     ; 02:5F8D
    call Sub001A3D                  ; 02:5F8E
    call Sub001A79                  ; 02:5F91
    call Sub025F9B                  ; 02:5F94
Code025F97:
    call Sub025FFD                  ; 02:5F97
    ret                             ; 02:5F9A

Sub025F9B:
    call Sub002920                  ; 02:5F9B
    jr   c,Return025FDC             ; 02:5F9E
    call Sub0029FC                  ; 02:5FA0
    call Sub001D21                  ; 02:5FA3
    jr   nc,Code025FC8              ; 02:5FA6
    ld   a,[$C1DA]                  ; 02:5FA8
    ld   hl,$C1DB                   ; 02:5FAB
    or   [hl]                       ; 02:5FAE
    jr   z,Code025FBB               ; 02:5FAF
    ld   hl,W_SpriteXSpeed          ; 02:5FB1
    add  hl,bc                      ; 02:5FB4
    ld   a,[hl]                     ; 02:5FB5
    cpl                             ; 02:5FB6
    inc  a                          ; 02:5FB7
    ld   [hl],a                     ; 02:5FB8
    jr   Code025FC8                 ; 02:5FB9
Code025FBB:
    ldh  a,[<H_GlobalTimer]         ; 02:5FBB
    srl  a                          ; 02:5FBD
    jr   nc,Code025FC8              ; 02:5FBF
    ld   a,$02                      ; 02:5FC1
    rst  $10                        ; 02:5FC3  24-bit call
.dl SubL_0B4074                     ; 02:5FC4
    ret                             ; 02:5FC7

Code025FC8:
    ld   hl,$D096                   ; 02:5FC8
    add  hl,bc                      ; 02:5FCB
    ld   a,[hl]                     ; 02:5FCC
    dec  [hl]                       ; 02:5FCD
    and  a                          ; 02:5FCE
    jr   nz,Return025FDC            ; 02:5FCF
    ld   [hl],$03                   ; 02:5FD1
    ld   hl,$D177                   ; 02:5FD3
    add  hl,bc                      ; 02:5FD6
    ld   a,[hl]                     ; 02:5FD7
    inc  a                          ; 02:5FD8
    and  $03                        ; 02:5FD9
    ld   [hl],a                     ; 02:5FDB
Return025FDC:
    ret                             ; 02:5FDC

Data025FDD:                         ; 02:5FDD
.db $66,$41,$66,$21,$66,$61,$66,$01
Data025FE5:                         ; 02:5FE5
.db $68,$01,$6A,$01,$6A,$61,$68,$61,\
    $6A,$21,$68,$21,$68,$41,$6A,$41
Data025FF5:                         ; 02:5FF5
.db $04,$00,$FC,$FF,$04,$00,$FC,$FF

Sub025FFD:
    ld   hl,$D177                   ; 02:5FFD
    add  hl,bc                      ; 02:6000
    ld   a,[hl]                     ; 02:6001
    bit  0,a                        ; 02:6002
    jr   nz,Code026045              ; 02:6004
    ld   hl,W_SpriteXHigh           ; 02:6006
    add  hl,bc                      ; 02:6009
    push hl                         ; 02:600A
    ld   hl,W_SpriteXLow            ; 02:600B
    add  hl,bc                      ; 02:600E
    ld   a,$04                      ; 02:600F
    add  [hl]                       ; 02:6011
    ldh  [<$FF98],a                 ; 02:6012
    pop  hl                         ; 02:6014
    ld   a,$00                      ; 02:6015
    adc  [hl]                       ; 02:6017
    ldh  [<$FF99],a                 ; 02:6018
    ld   hl,W_SpriteYLow            ; 02:601A
    add  hl,bc                      ; 02:601D
    ld   a,[hl]                     ; 02:601E
    ldh  [<$FF97],a                 ; 02:601F
    ld   hl,W_SpriteYHigh           ; 02:6021
    add  hl,bc                      ; 02:6024
    ld   a,[hl]                     ; 02:6025
    ldh  [<$FFA6],a                 ; 02:6026
    ld   hl,$D177                   ; 02:6028
    add  hl,bc                      ; 02:602B
    ld   a,[hl]                     ; 02:602C
    and  $02                        ; 02:602D
    ld   e,a                        ; 02:602F
    ld   d,$00                      ; 02:6030
    ld   hl,$D195                   ; 02:6032
    add  hl,bc                      ; 02:6035
    ld   a,[hl]                     ; 02:6036
    sla  a                          ; 02:6037
    sla  a                          ; 02:6039
    add  e                          ; 02:603B
    ld   e,a                        ; 02:603C
    ld   hl,Data025FDD              ; 02:603D
    add  hl,de                      ; 02:6040
    call Sub002861                  ; 02:6041
    ret                             ; 02:6044

Code026045:
    ld   hl,W_SpriteYHigh           ; 02:6045
    add  hl,bc                      ; 02:6048
    ld   a,[hl]                     ; 02:6049
    ld   [$D2E5],a                  ; 02:604A
    push hl                         ; 02:604D
    ld   hl,W_SpriteYLow            ; 02:604E
    add  hl,bc                      ; 02:6051
    ld   a,[hl]                     ; 02:6052
    ld   [$D2E4],a                  ; 02:6053
    push hl                         ; 02:6056
    ld   hl,$D177                   ; 02:6057
    add  hl,bc                      ; 02:605A
    ld   a,[hl]                     ; 02:605B
    and  $FE                        ; 02:605C
    ld   e,a                        ; 02:605E
    ld   d,$00                      ; 02:605F
    ld   hl,$D195                   ; 02:6061
    add  hl,bc                      ; 02:6064
    ld   a,[hl]                     ; 02:6065
    sla  a                          ; 02:6066
    sla  a                          ; 02:6068
    add  e                          ; 02:606A
    ld   e,a                        ; 02:606B
    ld   hl,Data025FF5              ; 02:606C
    add  hl,de                      ; 02:606F
    ldi  a,[hl]                     ; 02:6070
    ldh  [<$FF97],a                 ; 02:6071
    ld   a,[hl]                     ; 02:6073
    ldh  [<$FF98],a                 ; 02:6074
    ld   hl,W_SpriteYHigh           ; 02:6076
    add  hl,bc                      ; 02:6079
    push hl                         ; 02:607A
    ld   hl,W_SpriteYLow            ; 02:607B
    add  hl,bc                      ; 02:607E
    ldh  a,[<$FF97]                 ; 02:607F
    add  [hl]                       ; 02:6081
    ld   [hl],a                     ; 02:6082
    ldh  a,[<$FF98]                 ; 02:6083
    pop  hl                         ; 02:6085
    adc  [hl]                       ; 02:6086
    ld   [hl],a                     ; 02:6087
    sla  e                          ; 02:6088
    ld   hl,Data025FE5              ; 02:608A
    add  hl,de                      ; 02:608D
    call Disp16x16Sprite            ; 02:608E
    pop  hl                         ; 02:6091
    ld   a,[$D2E4]                  ; 02:6092
    ld   [hl],a                     ; 02:6095
    pop  hl                         ; 02:6096
    ld   a,[$D2E5]                  ; 02:6097
    ld   [hl],a                     ; 02:609A
    ret                             ; 02:609B

PiranhaUp_WarpZoneScreens:          ; 02:609C
.db $0B,$0D,$03

PiranhaUp_Init:
; sprite 19 init
    ld   a,[W_GameMode]             ; 02:609F
    cp   $07                        ; 02:60A2
    jr   z,@Code026115              ; 02:60A4
    cp   $02                        ; 02:60A6
    jr   z,@Code026115              ; 02:60A8
    ld   a,[W_ChallengeFlag]        ; 02:60AA
    and  a                          ; 02:60AD
    jr   z,@Code0260DC              ; 02:60AE
    ld   de,$0000                   ; 02:60B0 \ runs if challenge mode
    ld   a,[W_SublevelID]           ; 02:60B3
    cp   $01                        ; 02:60B6  01: 1-2 main
    jr   z,@WarpZoneSublevel        ; 02:60B8
    inc  e                          ; 02:60BA
    cp   $0D                        ; 02:60BB  0D: 4-2 main
    jr   z,@WarpZoneSublevel        ; 02:60BD
    inc  e                          ; 02:60BF
    cp   $30                        ; 02:60C0  30: 4-2 vine bonus
    jr   nz,@Code0260DC             ; 02:60C2
@WarpZoneSublevel:
    ld   hl,PiranhaUp_WarpZoneScreens; 02:60C4
    add  hl,de                      ; 02:60C7  index with 0/1/2 for sublevel 01/0D/30
    ld   a,[hl]                     ; 02:60C8
    ld   hl,W_SpriteXHigh           ; 02:60C9
    add  hl,bc                      ; 02:60CC
    cp   [hl]                       ; 02:60CD  check if X position > threshold
    jr   nz,@Code0260DC             ; 02:60CE
    xor  a                          ; 02:60D0 \ despawn sprite
    ld   hl,W_SpriteStatus          ; 02:60D1
    add  hl,bc                      ; 02:60D4
    ld   [hl],a                     ; 02:60D5
    ld   hl,W_SpriteID              ; 02:60D6
    add  hl,bc                      ; 02:60D9
    ld   [hl],a                     ; 02:60DA
    ret                             ; 02:60DB //
@Code0260DC:
    ld   hl,W_SpriteXHigh           ; 02:60DC
    add  hl,bc                      ; 02:60DF
    push hl                         ; 02:60E0
    ld   hl,W_SpriteXLow            ; 02:60E1
    add  hl,bc                      ; 02:60E4
    ld   a,[hl]                     ; 02:60E5
    add  $08                        ; 02:60E6
    ld   [hl],a                     ; 02:60E8
    pop  hl                         ; 02:60E9
    ld   a,[hl]                     ; 02:60EA
    adc  $00                        ; 02:60EB
    ld   [hl],a                     ; 02:60ED
    ld   hl,W_SpriteYLow            ; 02:60EE
    add  hl,bc                      ; 02:60F1
    ld   a,[hl]                     ; 02:60F2
    ld   hl,$D1B3                   ; 02:60F3
    add  hl,bc                      ; 02:60F6
    ld   [hl],a                     ; 02:60F7
    add  $E8                        ; 02:60F8
    ld   hl,$D1D1                   ; 02:60FA
    add  hl,bc                      ; 02:60FD
    ld   [hl],a                     ; 02:60FE
    ld   a,[W_SPFlag]               ; 02:60FF
    and  a                          ; 02:6102
    jr   z,@Code026111              ; 02:6103
    ld   a,[W_LevelID]              ; 02:6105
    cp   $0C                        ; 02:6108  0C: 4-1
    jr   c,@Code026110              ; 02:610A
    ld   a,$08                      ; 02:610C  if SP and level >= 4-1, $D2F7 = 8 (red plants)
    jr   @Code026111                ; 02:610E
@Code026110:
    xor  a                          ; 02:6110  else, $D2F7 = 0 (green plants)
@Code026111:
    ld   [$D2F7],a                  ; 02:6111
    ret                             ; 02:6114
@Code026115:
    ld   a,[$C36B]                  ; 02:6115
    ld   d,a                        ; 02:6118
    and  $F0                        ; 02:6119
    ld   e,a                        ; 02:611B
    ld   a,d                        ; 02:611C
    and  $0F                        ; 02:611D
    sla  a                          ; 02:611F
    sla  a                          ; 02:6121
    add  e                          ; 02:6123
    ld   e,a                        ; 02:6124
    ld   d,$00                      ; 02:6125
    ld   hl,Data02614E              ; 02:6127
    add  hl,de                      ; 02:612A
    push hl                         ; 02:612B
    ld   hl,W_SpriteXLow            ; 02:612C
    add  hl,bc                      ; 02:612F
    ld   a,[hl]                     ; 02:6130
    swap a                          ; 02:6131
    and  $0F                        ; 02:6133
    sub  $06                        ; 02:6135
    ld   e,a                        ; 02:6137
    ld   d,$00                      ; 02:6138
    sla  e                          ; 02:613A
    pop  hl                         ; 02:613C
    add  hl,de                      ; 02:613D
    ldi  a,[hl]                     ; 02:613E
    ld   e,a                        ; 02:613F
    ld   a,[hl]                     ; 02:6140
    ld   d,a                        ; 02:6141
    ld   hl,W_SpriteXLow            ; 02:6142
    add  hl,bc                      ; 02:6145
    ld   [hl],e                     ; 02:6146
    ld   hl,W_SpriteXHigh           ; 02:6147
    add  hl,bc                      ; 02:614A
    ld   [hl],d                     ; 02:614B
    jr   @Code0260DC                ; 02:614C

Data02614E:                         ; 02:614E
.db $00,$0D,$00,$00,$00,$07,$00,$00,\
    $D0,$06,$40,$08,$00,$00,$00,$00,\
    $D0,$09,$10,$0A,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00

PiranhaUp_Main:
; sprite 19 main
    call Sub0025CB                  ; 02:616E
    jp   c,Code0261DC               ; 02:6171
    call Sub002920                  ; 02:6174
    jp   c,Code0261DC               ; 02:6177
    call Sub001A79                  ; 02:617A
    ld   hl,W_SpriteSubstate        ; 02:617D
    add  hl,bc                      ; 02:6180
    ld   a,[hl]                     ; 02:6181
    and  a                          ; 02:6182
    jr   z,Code0261C5               ; 02:6183
    ld   a,[W_GameMode]             ; 02:6185
    cp   $02                        ; 02:6188
    jr   z,Code02619D               ; 02:618A
    call Sub001D21                  ; 02:618C
    jr   nc,Code0261C5              ; 02:618F
    ld   a,[$C1DA]                  ; 02:6191
    ld   hl,$C1DB                   ; 02:6194
    or   [hl]                       ; 02:6197
    and  a                          ; 02:6198
    jr   nz,Code0261B2              ; 02:6199
    jr   Code0261A4                 ; 02:619B
Code02619D:
    call Sub0261E0                  ; 02:619D
    jr   c,Code0261B2               ; 02:61A0
    jr   Code0261C5                 ; 02:61A2
Code0261A4:
    ldh  a,[<H_GlobalTimer]         ; 02:61A4
    srl  a                          ; 02:61A6
    jr   nc,Code0261C5              ; 02:61A8
    ld   a,$02                      ; 02:61AA
    rst  $10                        ; 02:61AC  24-bit call
.dl SubL_0B4074                     ; 02:61AD
    jr   Code0261C5                 ; 02:61B0
Code0261B2:
    ld   a,$45                      ; 02:61B2
    ldh  [<$FFF2],a                 ; 02:61B4
    call Sub00192C                  ; 02:61B6
    ld   hl,W_SpriteStatus          ; 02:61B9
    add  hl,bc                      ; 02:61BC
    ld   [hl],$00                   ; 02:61BD
    ld   hl,W_SpriteID              ; 02:61BF
    add  hl,bc                      ; 02:61C2
    ld   [hl],$00                   ; 02:61C3
Code0261C5:
    call Sub026259                  ; 02:61C5
    ld   hl,$D096                   ; 02:61C8
    add  hl,bc                      ; 02:61CB
    ld   a,[hl]                     ; 02:61CC
    dec  [hl]                       ; 02:61CD
    and  a                          ; 02:61CE
    jr   nz,Code0261DC              ; 02:61CF
    ld   [hl],$07                   ; 02:61D1
    ld   hl,$D177                   ; 02:61D3
    add  hl,bc                      ; 02:61D6
    ld   a,[hl]                     ; 02:61D7
    inc  a                          ; 02:61D8
    and  $01                        ; 02:61D9
    ld   [hl],a                     ; 02:61DB
Code0261DC:
    call Sub0263B9                  ; 02:61DC
    ret                             ; 02:61DF

Sub0261E0:
    xor  a                          ; 02:61E0
    ld   [$D2E7],a                  ; 02:61E1
    ld   e,a                        ; 02:61E4
    call Sub000FE5                  ; 02:61E5
    ld   [$D2F5],a                  ; 02:61E8
    ld   e,a                        ; 02:61EB
    ld   d,$00                      ; 02:61EC
    ld   hl,Data001D1F              ; 02:61EE
    add  hl,de                      ; 02:61F1
    ld   e,[hl]                     ; 02:61F2
    call Sub001F75                  ; 02:61F3
    call Sub001D55                  ; 02:61F6
    jr   nc,Code02620D              ; 02:61F9
    call Sub026244                  ; 02:61FB
    and  a                          ; 02:61FE
    jr   nz,Code026209              ; 02:61FF
    ld   a,$02                      ; 02:6201
    rst  $10                        ; 02:6203  24-bit call
.dl SubL_0B4074                     ; 02:6204
    jr   Code02620D                 ; 02:6207
Code026209:
    ld   hl,$D2E7                   ; 02:6209
    inc  [hl]                       ; 02:620C
Code02620D:
    ld   e,$01                      ; 02:620D
    call Sub000FE5                  ; 02:620F
    ld   [$D2F5],a                  ; 02:6212
    ld   e,a                        ; 02:6215
    ld   d,$00                      ; 02:6216
    ld   hl,Data001D1F              ; 02:6218
    add  hl,de                      ; 02:621B
    ld   e,[hl]                     ; 02:621C
    call Sub001F75                  ; 02:621D
    call Sub001D55                  ; 02:6220
    jr   nc,Code026238              ; 02:6223
    call Sub026244                  ; 02:6225
    cp   $00                        ; 02:6228
    jr   nz,Code026234              ; 02:622A
    ld   a,$02                      ; 02:622C
    rst  $10                        ; 02:622E  24-bit call
.dl SubL_0B4074                     ; 02:622F
    jr   Code026238                 ; 02:6232
Code026234:
    ld   hl,$D2E7                   ; 02:6234
    inc  [hl]                       ; 02:6237
Code026238:
    ld   hl,$D2E7                   ; 02:6238
    ld   a,[hl]                     ; 02:623B
    and  a                          ; 02:623C
    jr   z,Code026241               ; 02:623D
    scf                             ; 02:623F
    ret                             ; 02:6240

Code026241:
    scf                             ; 02:6241
    ccf                             ; 02:6242
    ret                             ; 02:6243

Sub026244:
    ld   a,[$D2F5]                  ; 02:6244
    swap a                          ; 02:6247
    sla  a                          ; 02:6249
    sla  a                          ; 02:624B
    sla  a                          ; 02:624D
    ld   e,a                        ; 02:624F
    ld   d,$00                      ; 02:6250
    ld   hl,$C522                   ; 02:6252
    add  hl,de                      ; 02:6255
    ldi  a,[hl]                     ; 02:6256
    or   [hl]                       ; 02:6257
    ret                             ; 02:6258

Sub026259:
    ld   hl,W_SpriteSubstate        ; 02:6259
    add  hl,bc                      ; 02:625C
    ld   a,[hl]                     ; 02:625D
    rst  $00                        ; 02:625E  Execute from 16-bit pointer table
.dw Code026269                      ; 02:625F
.dw Code026336                      ; 02:6261
.dw Code02635B                      ; 02:6263
.dw Code026379                      ; 02:6265
.dw Code02639D                      ; 02:6267

Code026269:
    ld   hl,$D0A5                   ; 02:6269
    add  hl,bc                      ; 02:626C
    ld   a,[hl]                     ; 02:626D
    dec  [hl]                       ; 02:626E
    and  a                          ; 02:626F
    ret  nz                         ; 02:6270
    ld   hl,$FFA6                   ; 02:6271
    ld   e,$19                      ; 02:6274
    ld   a,[$D2F7]                  ; 02:6276
    and  a                          ; 02:6279
    jr   z,Code02627E               ; 02:627A
    ld   e,$13                      ; 02:627C
Code02627E:
    ld   [hl],e                     ; 02:627E
    ld   a,[W_GameMode]             ; 02:627F
    cp   $02                        ; 02:6282
    jr   z,Code026299               ; 02:6284
    ldh  a,[<H_PlayerXLow]          ; 02:6286
    add  $08                        ; 02:6288
    ldh  [<$FF97],a                 ; 02:628A
    ldh  a,[<H_PlayerXHigh]         ; 02:628C
    adc  $00                        ; 02:628E
    ldh  [<$FF98],a                 ; 02:6290
    call Sub0262EF                  ; 02:6292
    jr   nc,Code0262B4              ; 02:6295
    jr   Code0262AD                 ; 02:6297
Code026299:
    ld   e,$00                      ; 02:6299
    call Sub0262C9                  ; 02:629B
    call Sub0262EF                  ; 02:629E
    jr   c,Code0262AD               ; 02:62A1
    ld   e,$01                      ; 02:62A3
    call Sub0262C9                  ; 02:62A5
    call Sub0262EF                  ; 02:62A8
    jr   nc,Code0262B4              ; 02:62AB
Code0262AD:
    ld   hl,$D0A5                   ; 02:62AD
    add  hl,bc                      ; 02:62B0
    inc  [hl]                       ; 02:62B1
    jr   Return0262C8               ; 02:62B2
Code0262B4:
    ld   hl,W_SpriteSubstate        ; 02:62B4
    add  hl,bc                      ; 02:62B7
    inc  [hl]                       ; 02:62B8
    ld   e,$F8                      ; 02:62B9
    ld   hl,W_SpriteYSpeed          ; 02:62BB
    add  hl,bc                      ; 02:62BE
    ld   a,[$D2F7]                  ; 02:62BF
    and  a                          ; 02:62C2
    jr   z,Code0262C7               ; 02:62C3
    ld   e,$F0                      ; 02:62C5
Code0262C7:
    ld   [hl],e                     ; 02:62C7
Return0262C8:
    ret                             ; 02:62C8

Sub0262C9:
    call Sub000FE5                  ; 02:62C9
    ld   [$D2F5],a                  ; 02:62CC
    swap a                          ; 02:62CF
    sla  a                          ; 02:62D1
    sla  a                          ; 02:62D3
    sla  a                          ; 02:62D5
    ld   e,a                        ; 02:62D7
    ld   d,$00                      ; 02:62D8
    ld   hl,$C502                   ; 02:62DA
    add  hl,de                      ; 02:62DD
    push hl                         ; 02:62DE
    ld   hl,$C501                   ; 02:62DF
    add  hl,de                      ; 02:62E2
    ld   a,[hl]                     ; 02:62E3
    add  $08                        ; 02:62E4
    ldh  [<$FF97],a                 ; 02:62E6
    pop  hl                         ; 02:62E8
    ld   a,[hl]                     ; 02:62E9
    adc  $00                        ; 02:62EA
    ldh  [<$FF98],a                 ; 02:62EC
    ret                             ; 02:62EE

Sub0262EF:
    ld   hl,W_SpriteXHigh           ; 02:62EF
    add  hl,bc                      ; 02:62F2
    push hl                         ; 02:62F3
    ld   hl,W_SpriteXLow            ; 02:62F4
    add  hl,bc                      ; 02:62F7
    ld   a,[hl]                     ; 02:62F8
    add  $08                        ; 02:62F9
    ldh  [<$FF99],a                 ; 02:62FB
    pop  hl                         ; 02:62FD
    ld   a,[hl]                     ; 02:62FE
    adc  $00                        ; 02:62FF
    ldh  [<$FF9A],a                 ; 02:6301
    ld   hl,$FF99                   ; 02:6303
    ldh  a,[<$FF97]                 ; 02:6306
    sub  [hl]                       ; 02:6308
    ldh  [<$FF97],a                 ; 02:6309
    ld   hl,$FF9A                   ; 02:630B
    ldh  a,[<$FF98]                 ; 02:630E
    sbc  [hl]                       ; 02:6310
    ldh  [<$FF98],a                 ; 02:6311
    bit  7,a                        ; 02:6313
    jr   z,Code026324               ; 02:6315
    ldh  a,[<$FF97]                 ; 02:6317
    xor  $FF                        ; 02:6319
    inc  a                          ; 02:631B
    ldh  [<$FF97],a                 ; 02:631C
    ldh  a,[<$FF98]                 ; 02:631E
    xor  $FF                        ; 02:6320
    ldh  [<$FF98],a                 ; 02:6322
Code026324:
    ldh  a,[<$FF98]                 ; 02:6324
    and  a                          ; 02:6326
    jr   nz,Code026333              ; 02:6327
    ld   hl,$FFA6                   ; 02:6329
    ldh  a,[<$FF97]                 ; 02:632C
    cp   [hl]                       ; 02:632E
    jr   nc,Code026333              ; 02:632F
    scf                             ; 02:6331
    ret                             ; 02:6332

Code026333:
    scf                             ; 02:6333
    ccf                             ; 02:6334
    ret                             ; 02:6335

Code026336:
    ld   hl,W_SpriteYLow            ; 02:6336
    add  hl,bc                      ; 02:6339
    ld   a,[hl]                     ; 02:633A
    ld   hl,$D1D1                   ; 02:633B
    add  hl,bc                      ; 02:633E
    cp   [hl]                       ; 02:633F
    jr   nc,Return02635A            ; 02:6340
    ld   a,[hl]                     ; 02:6342
    ld   hl,W_SpriteYLow            ; 02:6343
    add  hl,bc                      ; 02:6346
    ld   [hl],a                     ; 02:6347
    ld   hl,W_SpriteYSpeed          ; 02:6348
    add  hl,bc                      ; 02:634B
    ld   [hl],$00                   ; 02:634C
    ld   hl,W_SpriteSubstate        ; 02:634E
    add  hl,bc                      ; 02:6351
    inc  [hl]                       ; 02:6352
    ld   hl,$D0A5                   ; 02:6353
    add  hl,bc                      ; 02:6356
    ld   a,$40                      ; 02:6357
    ld   [hl],a                     ; 02:6359
Return02635A:
    ret                             ; 02:635A

Code02635B:
    ld   hl,$D0A5                   ; 02:635B
    add  hl,bc                      ; 02:635E
    ld   a,[hl]                     ; 02:635F
    dec  [hl]                       ; 02:6360
    and  a                          ; 02:6361
    jr   nz,Return026378            ; 02:6362
    ld   e,$08                      ; 02:6364
    ld   hl,W_SpriteYSpeed          ; 02:6366
    add  hl,bc                      ; 02:6369
    ld   a,[$D2F7]                  ; 02:636A
    and  a                          ; 02:636D
    jr   z,Code026372               ; 02:636E
    ld   e,$10                      ; 02:6370
Code026372:
    ld   [hl],e                     ; 02:6372
    ld   hl,W_SpriteSubstate        ; 02:6373
    add  hl,bc                      ; 02:6376
    inc  [hl]                       ; 02:6377
Return026378:
    ret                             ; 02:6378

Code026379:
    ld   hl,W_SpriteYLow            ; 02:6379
    add  hl,bc                      ; 02:637C
    ld   a,[hl]                     ; 02:637D
    ld   hl,$D1B3                   ; 02:637E
    add  hl,bc                      ; 02:6381
    cp   [hl]                       ; 02:6382
    jr   c,Return02639C             ; 02:6383
    ld   a,[hl]                     ; 02:6385
    ld   hl,W_SpriteYLow            ; 02:6386
    add  hl,bc                      ; 02:6389
    ld   [hl],a                     ; 02:638A
    xor  a                          ; 02:638B
    ld   hl,W_SpriteYSpeed          ; 02:638C
    add  hl,bc                      ; 02:638F
    ld   [hl],a                     ; 02:6390
    ld   hl,W_SpriteSubstate        ; 02:6391
    add  hl,bc                      ; 02:6394
    ld   [hl],a                     ; 02:6395
    ld   hl,$D0A5                   ; 02:6396
    add  hl,bc                      ; 02:6399
    ld   [hl],$40                   ; 02:639A
Return02639C:
    ret                             ; 02:639C

Code02639D:
    call Sub0029EF                  ; 02:639D
    ret                             ; 02:63A0

Data0263A1:                         ; 02:63A1
.db $7E,$87,$7E,$A7,$7C,$87,$7C,$A7,\
    $7E,$86,$7E,$A6,$7C,$86,$7C,$A6
Data0263B1:                         ; 02:63B1
.db $22,$87,$22,$A7,$22,$86,$22,$A6

Sub0263B9:
    ld   hl,W_SpriteSubstate        ; 02:63B9
    add  hl,bc                      ; 02:63BC
    ld   a,[hl]                     ; 02:63BD
    and  a                          ; 02:63BE
    jr   z,Return0263F4             ; 02:63BF
    ld   hl,$D177                   ; 02:63C1
    add  hl,bc                      ; 02:63C4
    ld   a,[hl]                     ; 02:63C5
    sla  a                          ; 02:63C6
    sla  a                          ; 02:63C8
    ld   hl,$D2F7                   ; 02:63CA
    add  [hl]                       ; 02:63CD
    ld   e,a                        ; 02:63CE
    ld   d,$00                      ; 02:63CF
    ld   hl,Data0263A1              ; 02:63D1
    add  hl,de                      ; 02:63D4
    call Disp16x16Sprite            ; 02:63D5
    ld   hl,W_SpriteYLow            ; 02:63D8
    add  hl,bc                      ; 02:63DB
    ld   a,[hl]                     ; 02:63DC
    push hl                         ; 02:63DD
    push af                         ; 02:63DE
    add  $10                        ; 02:63DF
    ld   [hl],a                     ; 02:63E1
    ld   a,[$D2F7]                  ; 02:63E2
    srl  a                          ; 02:63E5
    ld   e,a                        ; 02:63E7
    ld   d,$00                      ; 02:63E8
    ld   hl,Data0263B1              ; 02:63EA
    add  hl,de                      ; 02:63ED
    call Disp16x16Sprite            ; 02:63EE
    pop  af                         ; 02:63F1
    pop  hl                         ; 02:63F2
    ld   [hl],a                     ; 02:63F3
Return0263F4:
    ret                             ; 02:63F4

Data0263F5:                         ; 02:63F5
.db $00,$00,$00,$00,$00,$00,$90,$0D,\
    $00,$00,$00,$00,$00,$00,$90,$0E

Bowser_Init:
; sprite 1A init
    ld   a,$02                      ; 02:6405
    rst  $10                        ; 02:6407  24-bit call
.dl SubL_0B536D                     ; 02:6408
    ld   a,[W_GameMode]             ; 02:640B
    cp   $07                        ; 02:640E
    jr   z,@Race                    ; 02:6410
    cp   $02                        ; 02:6412
    jr   nz,@Code026430             ; 02:6414
@Race:
    ld   a,[W_SublevelID]           ; 02:6416
    sub  $3A                        ; 02:6419
    sla  a                          ; 02:641B
    ld   e,a                        ; 02:641D
    ld   d,$00                      ; 02:641E
    ld   hl,Data0263F5              ; 02:6420
    add  hl,de                      ; 02:6423
    ldi  a,[hl]                     ; 02:6424
    ld   e,[hl]                     ; 02:6425
    ld   hl,W_SpriteXLow            ; 02:6426
    add  hl,bc                      ; 02:6429
    ld   [hl],a                     ; 02:642A
    ld   hl,W_SpriteXHigh           ; 02:642B
    add  hl,bc                      ; 02:642E
    ld   [hl],e                     ; 02:642F
@Code026430:
    ld   hl,W_SpriteXSpeed          ; 02:6430
    add  hl,bc                      ; 02:6433
    ld   [hl],$FC                   ; 02:6434
    ld   hl,$D13B                   ; 02:6436
    add  hl,bc                      ; 02:6439
    ld   [hl],$00                   ; 02:643A
    ld   hl,$D0C3                   ; 02:643C
    add  hl,bc                      ; 02:643F
    ld   [hl],$DF                   ; 02:6440
    ld   hl,W_SpriteXHigh           ; 02:6442
    add  hl,bc                      ; 02:6445
    push hl                         ; 02:6446
    ld   hl,W_SpriteXLow            ; 02:6447
    add  hl,bc                      ; 02:644A
    ld   a,[hl]                     ; 02:644B
    ldh  [<$FF99],a                 ; 02:644C
    add  $B0                        ; 02:644E
    ldh  [<$FF97],a                 ; 02:6450
    pop  hl                         ; 02:6452
    ld   a,[hl]                     ; 02:6453
    ldh  [<$FF9A],a                 ; 02:6454
    adc  $FF                        ; 02:6456
    ldh  [<$FF98],a                 ; 02:6458
    ld   hl,$D1B3                   ; 02:645A
    add  hl,bc                      ; 02:645D
    ldh  a,[<$FF97]                 ; 02:645E
    ld   [hl],a                     ; 02:6460
    ld   hl,$D1C2                   ; 02:6461
    add  hl,bc                      ; 02:6464
    ldh  a,[<$FF98]                 ; 02:6465
    ld   [hl],a                     ; 02:6467
    ld   hl,$D1D1                   ; 02:6468
    add  hl,bc                      ; 02:646B
    ldh  a,[<$FF99]                 ; 02:646C
    ld   [hl],a                     ; 02:646E
    ld   hl,$D1E0                   ; 02:646F
    add  hl,bc                      ; 02:6472
    ldh  a,[<$FF9A]                 ; 02:6473
    ld   [hl],a                     ; 02:6475
    ld   hl,W_SpriteYLow            ; 02:6476
    add  hl,bc                      ; 02:6479
    ld   a,[hl]                     ; 02:647A
    ld   hl,$D0F0                   ; 02:647B
    add  hl,bc                      ; 02:647E
    ld   [hl],a                     ; 02:647F
    call Sub0010E4                  ; 02:6480
    and  $03                        ; 02:6483
    ld   e,a                        ; 02:6485
    ld   d,$00                      ; 02:6486
    ld   hl,Data026524              ; 02:6488
    add  hl,de                      ; 02:648B
    ld   a,[hl]                     ; 02:648C
    ld   hl,$D0B4                   ; 02:648D
    add  hl,bc                      ; 02:6490
    ld   [hl],a                     ; 02:6491
    xor  a                          ; 02:6492
    ld   [$C268],a                  ; 02:6493
    ld   [$D2F6],a                  ; 02:6496
    ld   hl,$D168                   ; 02:6499
    add  hl,bc                      ; 02:649C
    ld   [hl],a                     ; 02:649D
    ld   a,$14                      ; 02:649E
    ld   hl,$D159                   ; 02:64A0
    add  hl,bc                      ; 02:64A3
    ld   [hl],a                     ; 02:64A4
    ld   hl,$D0D2                   ; 02:64A5
    add  hl,bc                      ; 02:64A8
    ld   [hl],$01                   ; 02:64A9
    ret                             ; 02:64AB

Bowser_Main:
; sprite 1A main
    call Sub0025CB                  ; 02:64AC
    jp   c,Code0264F0               ; 02:64AF
    ld   a,[$C268]                  ; 02:64B2
    and  a                          ; 02:64B5
    jr   z,Code0264BD               ; 02:64B6
    call Sub0264F7                  ; 02:64B8
    jr   Code0264F0                 ; 02:64BB
Code0264BD:
    call Sub0029DA                  ; 02:64BD
    call Sub002920                  ; 02:64C0
    jp   c,Code0264F0               ; 02:64C3
    ld   hl,W_SpriteYSpeed          ; 02:64C6
    add  hl,bc                      ; 02:64C9
    ld   a,[hl]                     ; 02:64CA
    inc  a                          ; 02:64CB
    bit  7,a                        ; 02:64CC
    jr   nz,Code0264D6              ; 02:64CE
    cp   $20                        ; 02:64D0
    jr   c,Code0264D6               ; 02:64D2
    ld   a,$20                      ; 02:64D4
Code0264D6:
    ld   [hl],a                     ; 02:64D6
    ld   hl,$D195                   ; 02:64D7
    add  hl,bc                      ; 02:64DA
    ld   a,[hl]                     ; 02:64DB
    and  a                          ; 02:64DC
    jr   nz,Code0264E7              ; 02:64DD
    ld   hl,$D0D2                   ; 02:64DF
    add  hl,bc                      ; 02:64E2
    ld   a,[hl]                     ; 02:64E3
    and  a                          ; 02:64E4
    jr   z,Code0264EA               ; 02:64E5
Code0264E7:
    call Sub001A3D                  ; 02:64E7
Code0264EA:
    call Sub001A79                  ; 02:64EA
    call Sub026500                  ; 02:64ED
Code0264F0:
    call Sub02650E                  ; 02:64F0
    ret                             ; 02:64F3

.db $02,$01,$06

Sub0264F7:
    ldh  a,[<H_GlobalTimer]         ; 02:64F7
    and  $03                        ; 02:64F9
    ret  nz                         ; 02:64FB
    call Sub02679E                  ; 02:64FC
    ret                             ; 02:64FF

Sub026500:
    ld   hl,W_SpriteSubstate        ; 02:6500
    add  hl,bc                      ; 02:6503
    ld   a,[hl]                     ; 02:6504
    rst  $00                        ; 02:6505  Execute from 16-bit pointer table
.dw Code026528                      ; 02:6506
.dw Return024000                    ; 02:6508
.dw Code0269AE                      ; 02:650A
.dw Return024000                    ; 02:650C

Sub02650E:
    ld   hl,W_SpriteSubstate        ; 02:650E
    add  hl,bc                      ; 02:6511
    ld   a,[hl]                     ; 02:6512
    rst  $00                        ; 02:6513  Execute from 16-bit pointer table
.dw Code026A69                      ; 02:6514
.dw Code026A69                      ; 02:6516
.dw Code026A69                      ; 02:6518
.dw Bowser_DeathState               ; 02:651A

Data02651C:                         ; 02:651C
.db $DF,$60,$DF,$DF,$DF,$60,$60,$DF
Data026524:                         ; 02:6524
.db $21,$41,$11,$31

Code026528:
    call Sub02682F                  ; 02:6528
    ld   hl,$D195                   ; 02:652B
    add  hl,bc                      ; 02:652E
    ld   a,[hl]                     ; 02:652F
    and  a                          ; 02:6530
    jp   nz,Code026626              ; 02:6531
    ld   hl,W_SpriteXLow            ; 02:6534
    add  hl,bc                      ; 02:6537
    ld   a,[hl]                     ; 02:6538
    ldh  [<$FF97],a                 ; 02:6539
    ld   hl,W_SpriteXHigh           ; 02:653B
    add  hl,bc                      ; 02:653E
    ld   a,[hl]                     ; 02:653F
    ldh  [<$FF98],a                 ; 02:6540
    ld   hl,$D168                   ; 02:6542
    add  hl,bc                      ; 02:6545
    ld   a,[hl]                     ; 02:6546
    ld   e,a                        ; 02:6547
    ld   d,$00                      ; 02:6548
    ld   hl,W_SpriteXSpeed          ; 02:654A
    add  hl,bc                      ; 02:654D
    ld   a,[hl]                     ; 02:654E
    bit  7,a                        ; 02:654F
    jr   z,Code02656F               ; 02:6551
    ld   hl,$D1C2                   ; 02:6553
    add  hl,bc                      ; 02:6556
    push hl                         ; 02:6557
    ld   hl,$D1B3                   ; 02:6558
    add  hl,bc                      ; 02:655B
    ld   a,[hl]                     ; 02:655C
    add  e                          ; 02:655D
    ld   e,a                        ; 02:655E
    pop  hl                         ; 02:655F
    ld   a,[hl]                     ; 02:6560
    adc  d                          ; 02:6561
    ld   d,a                        ; 02:6562
    ldh  a,[<$FF97]                 ; 02:6563
    sub  e                          ; 02:6565
    ldh  a,[<$FF98]                 ; 02:6566
    sbc  d                          ; 02:6568
    bit  7,a                        ; 02:6569
    jr   z,Code0265A3               ; 02:656B
    jr   Code026589                 ; 02:656D
Code02656F:
    ld   hl,$D1E0                   ; 02:656F
    add  hl,bc                      ; 02:6572
    push hl                         ; 02:6573
    ld   hl,$D1D1                   ; 02:6574
    add  hl,bc                      ; 02:6577
    ld   a,[hl]                     ; 02:6578
    sub  e                          ; 02:6579
    ld   e,a                        ; 02:657A
    pop  hl                         ; 02:657B
    ld   a,[hl]                     ; 02:657C
    sbc  d                          ; 02:657D
    ld   d,a                        ; 02:657E
    ldh  a,[<$FF97]                 ; 02:657F
    sub  e                          ; 02:6581
    ldh  a,[<$FF98]                 ; 02:6582
    sbc  d                          ; 02:6584
    bit  7,a                        ; 02:6585
    jr   nz,Code0265A3              ; 02:6587
Code026589:
    ld   hl,W_SpriteXSpeed          ; 02:6589
    add  hl,bc                      ; 02:658C
    ld   a,[hl]                     ; 02:658D
    bit  7,a                        ; 02:658E
    jr   nz,Code026596              ; 02:6590
    ld   a,$FC                      ; 02:6592
    jr   Code026598                 ; 02:6594
Code026596:
    ld   a,$04                      ; 02:6596
Code026598:
    ld   [hl],a                     ; 02:6598
    call Sub0010E4                  ; 02:6599
    and  $30                        ; 02:659C
    ld   hl,$D168                   ; 02:659E
    add  hl,bc                      ; 02:65A1
    ld   [hl],a                     ; 02:65A2
Code0265A3:
    ld   a,[W_GameMode]             ; 02:65A3
    cp   $02                        ; 02:65A6
    jr   z,Code0265B5               ; 02:65A8
    cp   $07                        ; 02:65AA
    jr   nz,Code0265BC              ; 02:65AC
    call Sub0268A2                  ; 02:65AE
    jr   nc,Code026626              ; 02:65B1
    jr   Code0265CB                 ; 02:65B3
Code0265B5:
    call Sub0268C6                  ; 02:65B5
    jr   nc,Code026626              ; 02:65B8
    jr   Code0265CB                 ; 02:65BA
Code0265BC:
    ld   a,[W_LevelID]              ; 02:65BC
    srl  a                          ; 02:65BF
    srl  a                          ; 02:65C1
    cp   $07                        ; 02:65C3
    jr   z,Code0265CB               ; 02:65C5
    cp   $05                        ; 02:65C7
    jr   nc,Code026614              ; 02:65C9
Code0265CB:
    ld   hl,$D0C3                   ; 02:65CB
    add  hl,bc                      ; 02:65CE
    ld   a,[hl]                     ; 02:65CF
    dec  [hl]                       ; 02:65D0
    cp   $20                        ; 02:65D1
    jr   z,Code026600               ; 02:65D3
    and  a                          ; 02:65D5
    jr   nz,Code026606              ; 02:65D6
    push hl                         ; 02:65D8
    ld   hl,$D159                   ; 02:65D9
    add  hl,bc                      ; 02:65DC
    ld   a,[hl]                     ; 02:65DD
    inc  a                          ; 02:65DE
    and  $07                        ; 02:65DF
    ld   [hl],a                     ; 02:65E1
    ld   e,a                        ; 02:65E2
    ld   d,$00                      ; 02:65E3
    ld   hl,Data02651C              ; 02:65E5
    add  hl,de                      ; 02:65E8
    ld   a,[W_LevelID]              ; 02:65E9
    cp   $10                        ; 02:65EC
    ld   a,[hl]                     ; 02:65EE
    jr   c,Code0265F3               ; 02:65EF
    sub  $10                        ; 02:65F1
Code0265F3:
    pop  hl                         ; 02:65F3
    ld   [hl],a                     ; 02:65F4
    ld   hl,$D0D2                   ; 02:65F5
    add  hl,bc                      ; 02:65F8
    ld   [hl],$01                   ; 02:65F9
    call Sub026CBA                  ; 02:65FB
    jr   Code026606                 ; 02:65FE
Code026600:
    ld   hl,$D0D2                   ; 02:6600
    add  hl,bc                      ; 02:6603
    ld   [hl],$00                   ; 02:6604
Code026606:
    ld   a,[W_GameMode]             ; 02:6606
    cp   $02                        ; 02:6609
    jr   z,Code026626               ; 02:660B
    ld   a,[W_LevelID]              ; 02:660D
    cp   $1C                        ; 02:6610
    jr   c,Code026626               ; 02:6612
Code026614:
    ld   hl,$D14A                   ; 02:6614
    add  hl,bc                      ; 02:6617
    ld   a,[hl]                     ; 02:6618
    and  a                          ; 02:6619
    jr   z,Code026626               ; 02:661A
    dec  [hl]                       ; 02:661C
    ldh  a,[<H_GlobalTimer]         ; 02:661D
    and  $03                        ; 02:661F
    jr   nz,Code026626              ; 02:6621
    call Sub0268FD                  ; 02:6623
Code026626:
    ld   hl,$D195                   ; 02:6626
    add  hl,bc                      ; 02:6629
    ld   a,[hl]                     ; 02:662A
    and  a                          ; 02:662B
    jp   nz,Code02663B              ; 02:662C
    ld   hl,W_SpriteXSpeed          ; 02:662F
    add  hl,bc                      ; 02:6632
    ld   a,[hl]                     ; 02:6633
    bit  7,a                        ; 02:6634
    jr   nz,Code02664A              ; 02:6636
    ld   a,$04                      ; 02:6638
    ld   [hl],a                     ; 02:663A
Code02663B:
    ld   hl,W_SpriteXLow            ; 02:663B
    add  hl,bc                      ; 02:663E
    ld   a,[hl]                     ; 02:663F
    cp   $B0                        ; 02:6640
    jr   c,Code02664A               ; 02:6642
    ld   hl,W_SpriteXSpeed          ; 02:6644
    add  hl,bc                      ; 02:6647
    ld   [hl],$00                   ; 02:6648
Code02664A:
    ld   a,[W_GameMode]             ; 02:664A
    cp   $02                        ; 02:664D
    jr   nz,Code026657              ; 02:664F
    call Sub0267B8                  ; 02:6651
    jp   Code0266ED                 ; 02:6654
Code026657:
    ld   hl,W_SpriteXLow            ; 02:6657
    add  hl,bc                      ; 02:665A
    ld   a,[hl]                     ; 02:665B
    push af                         ; 02:665C
    ld   hl,W_SpriteXHigh           ; 02:665D
    add  hl,bc                      ; 02:6660
    ld   a,[hl]                     ; 02:6661
    push af                         ; 02:6662
    ld   hl,W_SpriteYLow            ; 02:6663
    add  hl,bc                      ; 02:6666
    ld   a,[hl]                     ; 02:6667
    push af                         ; 02:6668
    ld   hl,$D195                   ; 02:6669
    add  hl,bc                      ; 02:666C
    ld   a,[hl]                     ; 02:666D
    and  a                          ; 02:666E
    jr   nz,Code02669B              ; 02:666F
    call Sub001D21                  ; 02:6671
    rl   e                          ; 02:6674
    bit  0,e                        ; 02:6676
    jr   nz,Code0266CB              ; 02:6678
    ld   hl,W_SpriteXLow            ; 02:667A
    add  hl,bc                      ; 02:667D
    ld   a,[hl]                     ; 02:667E
    add  $08                        ; 02:667F
    ld   [hl],a                     ; 02:6681
    push af                         ; 02:6682
    ld   hl,W_SpriteXHigh           ; 02:6683
    add  hl,bc                      ; 02:6686
    pop  af                         ; 02:6687
    ld   a,[hl]                     ; 02:6688
    adc  $00                        ; 02:6689
    ld   [hl],a                     ; 02:668B
    ld   hl,W_SpriteYLow            ; 02:668C
    add  hl,bc                      ; 02:668F
    ld   a,[hl]                     ; 02:6690
    add  $08                        ; 02:6691
    ld   [hl],a                     ; 02:6693
    call Sub001D21                  ; 02:6694
    rl   e                          ; 02:6697
    jr   Code0266CB                 ; 02:6699
Code02669B:
    ld   hl,W_SpriteYLow            ; 02:669B
    add  hl,bc                      ; 02:669E
    ld   a,[hl]                     ; 02:669F
    sub  $08                        ; 02:66A0
    ld   [hl],a                     ; 02:66A2
    call Sub001D21                  ; 02:66A3
    rl   e                          ; 02:66A6
    bit  0,e                        ; 02:66A8
    jr   nz,Code0266CB              ; 02:66AA
    ld   hl,W_SpriteXLow            ; 02:66AC
    add  hl,bc                      ; 02:66AF
    ld   a,[hl]                     ; 02:66B0
    add  $08                        ; 02:66B1
    ld   [hl],a                     ; 02:66B3
    push af                         ; 02:66B4
    ld   hl,W_SpriteXHigh           ; 02:66B5
    add  hl,bc                      ; 02:66B8
    pop  af                         ; 02:66B9
    ld   a,[hl]                     ; 02:66BA
    adc  $00                        ; 02:66BB
    ld   [hl],a                     ; 02:66BD
    ld   hl,W_SpriteYLow            ; 02:66BE
    add  hl,bc                      ; 02:66C1
    ld   a,[hl]                     ; 02:66C2
    add  $10                        ; 02:66C3
    ld   [hl],a                     ; 02:66C5
    call Sub001D21                  ; 02:66C6
    rl   e                          ; 02:66C9
Code0266CB:
    ld   hl,W_SpriteYLow            ; 02:66CB
    add  hl,bc                      ; 02:66CE
    pop  af                         ; 02:66CF
    ld   [hl],a                     ; 02:66D0
    ld   hl,W_SpriteXHigh           ; 02:66D1
    add  hl,bc                      ; 02:66D4
    pop  af                         ; 02:66D5
    ld   [hl],a                     ; 02:66D6
    ld   hl,W_SpriteXLow            ; 02:66D7
    add  hl,bc                      ; 02:66DA
    pop  af                         ; 02:66DB
    ld   [hl],a                     ; 02:66DC
    bit  0,e                        ; 02:66DD
    jr   z,Code0266ED               ; 02:66DF
    ldh  a,[<H_GlobalTimer]         ; 02:66E1
    srl  a                          ; 02:66E3
    jr   nc,Code0266ED              ; 02:66E5
    ld   a,$02                      ; 02:66E7
    rst  $10                        ; 02:66E9  24-bit call
.dl SubL_0B4074                     ; 02:66EA
Code0266ED:
    ld   hl,W_SpriteYSpeed          ; 02:66ED
    add  hl,bc                      ; 02:66F0
    ld   a,[hl]                     ; 02:66F1
    bit  7,a                        ; 02:66F2
    jp   nz,Code026777              ; 02:66F4
    ld   hl,W_SpriteYLow            ; 02:66F7
    add  hl,bc                      ; 02:66FA
    ld   a,[hl]                     ; 02:66FB
    cp   $A0                        ; 02:66FC
    jr   c,Code026777               ; 02:66FE
    call Sub001BCF                  ; 02:6700
    ldh  a,[<$FFA5]                 ; 02:6703
    and  $03                        ; 02:6705
    jr   z,Code026777               ; 02:6707
    ld   hl,$D13B                   ; 02:6709
    add  hl,bc                      ; 02:670C
    ld   a,[hl]                     ; 02:670D
    and  a                          ; 02:670E
    jr   nz,Code026734              ; 02:670F
    ld   [hl],$01                   ; 02:6711
    ld   hl,W_SpriteXHigh           ; 02:6713
    add  hl,bc                      ; 02:6716
    ld   a,[hl]                     ; 02:6717
    ldh  [<$FF98],a                 ; 02:6718
    ld   hl,W_SpriteXLow            ; 02:671A
    add  hl,bc                      ; 02:671D
    ld   a,[hl]                     ; 02:671E
    ld   hl,H_CameraXLow            ; 02:671F
    sub  [hl]                       ; 02:6722
    ldh  a,[<$FF98]                 ; 02:6723
    ld   hl,H_CameraXHigh           ; 02:6725
    sbc  [hl]                       ; 02:6728
    and  a                          ; 02:6729
    jr   nz,Code026734              ; 02:672A
    ld   de,$000C                   ; 02:672C
    ld   a,$01                      ; 02:672F
    call Return0010B2               ; 02:6731
Code026734:
    ld   hl,$D195                   ; 02:6734
    add  hl,bc                      ; 02:6737
    ld   a,[hl]                     ; 02:6738
    and  a                          ; 02:6739
    jr   nz,Code026777              ; 02:673A
    ld   hl,$D0B4                   ; 02:673C
    add  hl,bc                      ; 02:673F
    ld   a,[hl]                     ; 02:6740
    dec  [hl]                       ; 02:6741
    and  a                          ; 02:6742
    jr   nz,Code026777              ; 02:6743
    ld   a,[W_GameMode]             ; 02:6745
    cp   $02                        ; 02:6748
    jr   nz,Code026755              ; 02:674A
    ld   a,[$DA79]                  ; 02:674C
    and  $1F                        ; 02:674F
    add  $20                        ; 02:6751
    jr   Code026764                 ; 02:6753
Code026755:
    call Sub0010E4                  ; 02:6755
    and  $03                        ; 02:6758
    ld   e,a                        ; 02:675A
    ld   d,$00                      ; 02:675B
    push hl                         ; 02:675D
    ld   hl,Data026524              ; 02:675E
    add  hl,de                      ; 02:6761
    ld   a,[hl]                     ; 02:6762
    pop  hl                         ; 02:6763
Code026764:
    ld   [hl],a                     ; 02:6764
    ld   hl,W_SpriteYSpeed          ; 02:6765
    add  hl,bc                      ; 02:6768
    ld   [hl],$DE                   ; 02:6769
    ld   hl,$D14A                   ; 02:676B
    add  hl,bc                      ; 02:676E
    ld   [hl],$40                   ; 02:676F
    ld   hl,$D13B                   ; 02:6771
    add  hl,bc                      ; 02:6774
    ld   [hl],$00                   ; 02:6775
Code026777:
    ld   hl,$D0D2                   ; 02:6777
    add  hl,bc                      ; 02:677A
    ld   a,[hl]                     ; 02:677B
    and  a                          ; 02:677C
    jr   nz,Code026788              ; 02:677D
    ld   hl,$D177                   ; 02:677F
    add  hl,bc                      ; 02:6782
    ld   a,[hl]                     ; 02:6783
    and  a                          ; 02:6784
    jr   z,Sub02679E                ; 02:6785
    ret                             ; 02:6787

Code026788:
    ld   hl,$D0A5                   ; 02:6788
    add  hl,bc                      ; 02:678B
    ld   a,[hl]                     ; 02:678C
    dec  [hl]                       ; 02:678D
    and  a                          ; 02:678E
    ret  nz                         ; 02:678F
    ld   [hl],$20                   ; 02:6790
    push hl                         ; 02:6792
    ld   hl,$D195                   ; 02:6793
    add  hl,bc                      ; 02:6796
    ld   a,[hl]                     ; 02:6797
    pop  hl                         ; 02:6798
    and  a                          ; 02:6799
    jr   z,Sub02679E                ; 02:679A
    ld   [hl],$10                   ; 02:679C

Sub02679E:
    ld   hl,$D177                   ; 02:679E
    add  hl,bc                      ; 02:67A1
    ld   a,[hl]                     ; 02:67A2
    inc  a                          ; 02:67A3
    and  $01                        ; 02:67A4
    ld   [hl],a                     ; 02:67A6
    ret                             ; 02:67A7

.db $00,$00,$00,$00,$00,$00,$00,$00
Data0267B0:                         ; 02:67B0
.db $08,$00,$F8,$FF
Data0267B4:                         ; 02:67B4
.db $08,$00,$08,$00

Sub0267B8:
    ld   hl,W_SpriteXLow            ; 02:67B8
    add  hl,bc                      ; 02:67BB
    ld   a,[hl]                     ; 02:67BC
    push af                         ; 02:67BD
    ld   hl,W_SpriteXHigh           ; 02:67BE
    add  hl,bc                      ; 02:67C1
    ld   a,[hl]                     ; 02:67C2
    push af                         ; 02:67C3
    ld   hl,W_SpriteYLow            ; 02:67C4
    add  hl,bc                      ; 02:67C7
    ld   a,[hl]                     ; 02:67C8
    push af                         ; 02:67C9
    ld   hl,$D195                   ; 02:67CA
    add  hl,bc                      ; 02:67CD
    ld   e,[hl]                     ; 02:67CE
    sla  e                          ; 02:67CF
    ld   d,$00                      ; 02:67D1
    ld   hl,Data0267B0              ; 02:67D3
    add  hl,de                      ; 02:67D6
    ldi  a,[hl]                     ; 02:67D7
    ldh  [<$FF97],a                 ; 02:67D8
    ld   a,[hl]                     ; 02:67DA
    ldh  [<$FF98],a                 ; 02:67DB
    ld   hl,Data0267B4              ; 02:67DD
    add  hl,de                      ; 02:67E0
    ldi  a,[hl]                     ; 02:67E1
    ldh  [<$FF99],a                 ; 02:67E2
    ld   a,[hl]                     ; 02:67E4
    ldh  [<$FF9A],a                 ; 02:67E5
    ld   hl,$D285                   ; 02:67E7
    add  hl,bc                      ; 02:67EA
    ld   [hl],$22                   ; 02:67EB
    call Sub026806                  ; 02:67ED
    call Sub0261E0                  ; 02:67F0
    ld   hl,W_SpriteYLow            ; 02:67F3
    add  hl,bc                      ; 02:67F6
    pop  af                         ; 02:67F7
    ld   [hl],a                     ; 02:67F8
    ld   hl,W_SpriteXHigh           ; 02:67F9
    add  hl,bc                      ; 02:67FC
    pop  af                         ; 02:67FD
    ld   [hl],a                     ; 02:67FE
    ld   hl,W_SpriteXLow            ; 02:67FF
    add  hl,bc                      ; 02:6802
    pop  af                         ; 02:6803
    ld   [hl],a                     ; 02:6804
    ret                             ; 02:6805

Sub026806:
    ld   hl,W_SpriteXHigh           ; 02:6806
    add  hl,bc                      ; 02:6809
    ld   e,l                        ; 02:680A
    ld   d,h                        ; 02:680B
    ld   hl,W_SpriteXLow            ; 02:680C
    add  hl,bc                      ; 02:680F
    ldh  a,[<$FF97]                 ; 02:6810
    add  [hl]                       ; 02:6812
    ld   [hl],a                     ; 02:6813
    ld   l,e                        ; 02:6814
    ld   h,d                        ; 02:6815
    ldh  a,[<$FF98]                 ; 02:6816
    adc  [hl]                       ; 02:6818
    ld   [hl],a                     ; 02:6819
    ld   hl,W_SpriteYHigh           ; 02:681A
    add  hl,bc                      ; 02:681D
    ld   e,l                        ; 02:681E
    ld   d,h                        ; 02:681F
    ld   hl,W_SpriteYLow            ; 02:6820
    add  hl,bc                      ; 02:6823
    ldh  a,[<$FF99]                 ; 02:6824
    add  [hl]                       ; 02:6826
    ld   [hl],a                     ; 02:6827
    ld   l,e                        ; 02:6828
    ld   h,d                        ; 02:6829
    ldh  a,[<$FF9A]                 ; 02:682A
    adc  [hl]                       ; 02:682C
    ld   [hl],a                     ; 02:682D
    ret                             ; 02:682E

Sub02682F:
    ld   a,[W_GameMode]             ; 02:682F
    cp   $02                        ; 02:6832
    ret  z                          ; 02:6834
    ld   d,$00                      ; 02:6835
    ld   hl,$D195                   ; 02:6837
    add  hl,bc                      ; 02:683A
    ld   a,[hl]                     ; 02:683B
    and  a                          ; 02:683C
    jr   z,Code026841               ; 02:683D
    ld   d,$08                      ; 02:683F
Code026841:
    ld   e,$00                      ; 02:6841
    ld   hl,W_SpriteXHigh           ; 02:6843
    add  hl,bc                      ; 02:6846
    push hl                         ; 02:6847
    ld   hl,W_SpriteXLow            ; 02:6848
    add  hl,bc                      ; 02:684B
    ldh  a,[<H_PlayerXLow]          ; 02:684C
    add  d                          ; 02:684E
    sub  [hl]                       ; 02:684F
    pop  hl                         ; 02:6850
    ldh  a,[<H_PlayerXHigh]         ; 02:6851
    sbc  [hl]                       ; 02:6853
    bit  7,a                        ; 02:6854
    jr   nz,Code026867              ; 02:6856
    ld   hl,W_SpriteYLow            ; 02:6858
    add  hl,bc                      ; 02:685B
    ld   a,[hl]                     ; 02:685C
    cp   $A0                        ; 02:685D
    ret  c                          ; 02:685F
    inc  e                          ; 02:6860
    ld   hl,$D0D2                   ; 02:6861
    add  hl,bc                      ; 02:6864
    ld   [hl],$01                   ; 02:6865
Code026867:
    ld   hl,$D195                   ; 02:6867
    add  hl,bc                      ; 02:686A
    ld   a,[hl]                     ; 02:686B
    cp   e                          ; 02:686C
    jr   z,Code02688D               ; 02:686D
    ld   a,e                        ; 02:686F
    ld   [hl],a                     ; 02:6870
    ld   hl,$D0C3                   ; 02:6871
    add  hl,bc                      ; 02:6874
    ld   [hl],$40                   ; 02:6875
    and  a                          ; 02:6877
    jr   z,Code02688D               ; 02:6878
    ld   hl,W_SpriteXHigh           ; 02:687A
    add  hl,bc                      ; 02:687D
    push hl                         ; 02:687E
    ld   hl,W_SpriteXLow            ; 02:687F
    add  hl,bc                      ; 02:6882
    ld   a,[hl]                     ; 02:6883
    sub  $10                        ; 02:6884
    ld   [hl],a                     ; 02:6886
    pop  hl                         ; 02:6887
    ld   a,[hl]                     ; 02:6888
    sbc  $00                        ; 02:6889
    ld   [hl],a                     ; 02:688B
    ld   a,e                        ; 02:688C
Code02688D:
    and  a                          ; 02:688D
    jr   z,Return0268A1             ; 02:688E
    ld   hl,W_SpriteXSpeed          ; 02:6890
    add  hl,bc                      ; 02:6893
    ld   a,$08                      ; 02:6894
    ld   [hl],a                     ; 02:6896
    call Sub0010E4                  ; 02:6897
    and  $30                        ; 02:689A
    ld   hl,$D168                   ; 02:689C
    add  hl,bc                      ; 02:689F
    ld   [hl],a                     ; 02:68A0
Return0268A1:
    ret                             ; 02:68A1

Sub0268A2:
    ld   hl,W_SpriteXHigh           ; 02:68A2
    add  hl,bc                      ; 02:68A5
    ld   a,[hl]                     ; 02:68A6
    ldh  [<$FF98],a                 ; 02:68A7
    ld   hl,W_SpriteXLow            ; 02:68A9
    add  hl,bc                      ; 02:68AC
    ld   a,[hl]                     ; 02:68AD
    ldh  [<$FF97],a                 ; 02:68AE
    ld   hl,H_PlayerXLow            ; 02:68B0
    sub  [hl]                       ; 02:68B3
    ldh  a,[<$FF98]                 ; 02:68B4
    ld   hl,H_PlayerXHigh           ; 02:68B6
    sbc  [hl]                       ; 02:68B9
    bit  7,a                        ; 02:68BA
    jr   nz,Code0268C1              ; 02:68BC
    and  a                          ; 02:68BE
    jr   nz,Code0268C3              ; 02:68BF
Code0268C1:
    scf                             ; 02:68C1
    ret                             ; 02:68C2

Code0268C3:
    scf                             ; 02:68C3
    ccf                             ; 02:68C4
    ret                             ; 02:68C5

Sub0268C6:
    ld   hl,W_SpriteXHigh           ; 02:68C6
    add  hl,bc                      ; 02:68C9
    ld   a,[hl]                     ; 02:68CA
    ldh  [<$FF98],a                 ; 02:68CB
    ld   hl,W_SpriteXLow            ; 02:68CD
    add  hl,bc                      ; 02:68D0
    ld   a,[hl]                     ; 02:68D1
    ldh  [<$FF97],a                 ; 02:68D2
    ld   hl,$C501                   ; 02:68D4
    sub  [hl]                       ; 02:68D7
    ldh  a,[<$FF98]                 ; 02:68D8
    ld   hl,$C502                   ; 02:68DA
    sbc  [hl]                       ; 02:68DD
    bit  7,a                        ; 02:68DE
    jr   nz,Code0268F8              ; 02:68E0
    and  a                          ; 02:68E2
    jr   z,Code0268F8               ; 02:68E3
    ld   hl,$C581                   ; 02:68E5
    ldh  a,[<$FF97]                 ; 02:68E8
    sub  [hl]                       ; 02:68EA
    ld   hl,$C582                   ; 02:68EB
    ldh  a,[<$FF98]                 ; 02:68EE
    sbc  [hl]                       ; 02:68F0
    bit  7,a                        ; 02:68F1
    jr   nz,Code0268F8              ; 02:68F3
    and  a                          ; 02:68F5
    jr   nz,Code0268FA              ; 02:68F6
Code0268F8:
    scf                             ; 02:68F8
    ret                             ; 02:68F9

Code0268FA:
    scf                             ; 02:68FA
    ccf                             ; 02:68FB
    ret                             ; 02:68FC

Sub0268FD:
    call Sub0010E4                  ; 02:68FD
    bit  3,a                        ; 02:6900
    jr   nz,Code026908              ; 02:6902
    and  $07                        ; 02:6904
    jr   Code02690F                 ; 02:6906
Code026908:
    and  $0B                        ; 02:6908
    cp   $0B                        ; 02:690A
    jr   nz,Code02690F              ; 02:690C
    dec  a                          ; 02:690E
Code02690F:
    ld   e,a                        ; 02:690F
    ld   d,$00                      ; 02:6910
    ld   hl,W_SpriteStatus          ; 02:6912
    add  hl,de                      ; 02:6915
    ld   a,[hl]                     ; 02:6916
    and  a                          ; 02:6917
    ret  nz                         ; 02:6918
    call Sub026981                  ; 02:6919
    ld   a,$18                      ; 02:691C
    call LoadSpriteFixedSlot        ; 02:691E
    ld   hl,Data025EF0              ; 02:6921
    ld   a,[hl]                     ; 02:6924
    ld   hl,W_SpriteXSpeed          ; 02:6925
    add  hl,de                      ; 02:6928
    ld   [hl],a                     ; 02:6929
    ld   hl,W_SpriteYSpeed          ; 02:692A
    add  hl,de                      ; 02:692D
    ld   [hl],$E0                   ; 02:692E
    ld   hl,W_SpriteXLow            ; 02:6930
    add  hl,de                      ; 02:6933
    ldh  a,[<$FF97]                 ; 02:6934
    ld   [hl],a                     ; 02:6936
    ld   hl,W_SpriteXHigh           ; 02:6937
    add  hl,de                      ; 02:693A
    ldh  a,[<$FF98]                 ; 02:693B
    ld   [hl],a                     ; 02:693D
    ld   hl,W_SpriteYLow            ; 02:693E
    add  hl,de                      ; 02:6941
    ldh  a,[<$FF99]                 ; 02:6942
    ld   [hl],a                     ; 02:6944
    ld   hl,W_SpriteYHigh           ; 02:6945
    add  hl,de                      ; 02:6948
    ld   [hl],$00                   ; 02:6949
    ld   hl,$D0C3                   ; 02:694B
    add  hl,de                      ; 02:694E
    ld   [hl],$08                   ; 02:694F
    ld   hl,$D14A                   ; 02:6951
    add  hl,de                      ; 02:6954
    ld   a,c                        ; 02:6955
    ld   [hl],a                     ; 02:6956
    ld   hl,$D11D                   ; 02:6957
    add  hl,de                      ; 02:695A
    ld   [hl],$01                   ; 02:695B
    ret                             ; 02:695D

Sub02695E:
    push bc                         ; 02:695E
    ld   hl,$D14A                   ; 02:695F
    add  hl,bc                      ; 02:6962
    ld   a,[hl]                     ; 02:6963
    ld   c,a                        ; 02:6964
    ld   b,$00                      ; 02:6965
    call Sub026981                  ; 02:6967
    pop  bc                         ; 02:696A
    ld   hl,W_SpriteXLow            ; 02:696B
    add  hl,bc                      ; 02:696E
    ldh  a,[<$FF97]                 ; 02:696F
    ld   [hl],a                     ; 02:6971
    ld   hl,W_SpriteXHigh           ; 02:6972
    add  hl,bc                      ; 02:6975
    ldh  a,[<$FF98]                 ; 02:6976
    ld   [hl],a                     ; 02:6978
    ld   hl,W_SpriteYLow            ; 02:6979
    add  hl,bc                      ; 02:697C
    ldh  a,[<$FF99]                 ; 02:697D
    ld   [hl],a                     ; 02:697F
    ret                             ; 02:6980

Sub026981:
    ld   hl,W_SpriteXHigh           ; 02:6981
    add  hl,bc                      ; 02:6984
    push hl                         ; 02:6985
    ld   hl,W_SpriteXLow            ; 02:6986
    add  hl,bc                      ; 02:6989
    ld   a,$04                      ; 02:698A
    add  [hl]                       ; 02:698C
    ldh  [<$FF97],a                 ; 02:698D
    pop  hl                         ; 02:698F
    ld   a,$00                      ; 02:6990
    adc  [hl]                       ; 02:6992
    ldh  [<$FF98],a                 ; 02:6993
    ld   hl,W_SpriteYLow            ; 02:6995
    add  hl,bc                      ; 02:6998
    ld   a,[hl]                     ; 02:6999
    sub  $08                        ; 02:699A
    ldh  [<$FF99],a                 ; 02:699C
    ret                             ; 02:699E

Data02699F:                         ; 02:699F
.db $F0,$F0,$F0,$F0,$EE,$E4,$F0,$E0
Data0269A7:                         ; 02:69A7
.db $80,$40,$20,$10,$08,$04,$02
Code0269AE:
    ld   hl,$D0FF                   ; 02:69AE
    add  hl,bc                      ; 02:69B1
    inc  [hl]                       ; 02:69B2
    ld   a,[hl]                     ; 02:69B3
    cp   $05                        ; 02:69B4
    jr   nz,Code026A28              ; 02:69B6
    ld   e,$F0                      ; 02:69B8
    ld   a,[W_GameMode]             ; 02:69BA
    cp   $07                        ; 02:69BD
    jr   z,Code0269D4               ; 02:69BF
    cp   $02                        ; 02:69C1
    jr   z,Code0269D4               ; 02:69C3
    ld   a,[W_LevelID]              ; 02:69C5
    srl  a                          ; 02:69C8
    srl  a                          ; 02:69CA
    ld   e,a                        ; 02:69CC
    ld   d,$00                      ; 02:69CD
    ld   hl,Data02699F              ; 02:69CF
    add  hl,de                      ; 02:69D2
    ld   e,[hl]                     ; 02:69D3
Code0269D4:
    ld   a,[W_SPFlag]               ; 02:69D4
    and  a                          ; 02:69D7
    jr   z,Code0269E7               ; 02:69D8
    ld   a,[W_SublevelID]           ; 02:69DA
    cp   $54                        ; 02:69DD
    jr   nz,Code0269E7              ; 02:69DF
    ldh  a,[<H_CameraXHigh]         ; 02:69E1
    cp   $04                        ; 02:69E3
    jr   c,Code026A08               ; 02:69E5
Code0269E7:
    ld   a,[W_LevelID]              ; 02:69E7
    and  $FC                        ; 02:69EA
    jr   nz,Code0269F5              ; 02:69EC
    ld   hl,W_AlbumUnlockFlags+2    ; 02:69EE
    set  0,[hl]                     ; 02:69F1
    jr   Code026A08                 ; 02:69F3
Code0269F5:
    srl  a                          ; 02:69F5
    srl  a                          ; 02:69F7
    dec  a                          ; 02:69F9
    ld   e,a                        ; 02:69FA
    ld   d,$00                      ; 02:69FB
    ld   hl,Data0269A7              ; 02:69FD
    add  hl,de                      ; 02:6A00
    ld   a,[W_AlbumUnlockFlags+3]   ; 02:6A01
    or   [hl]                       ; 02:6A04
    ld   [W_AlbumUnlockFlags+3],a   ; 02:6A05
Code026A08:
    ld   hl,W_SpriteSubstate        ; 02:6A08
    add  hl,bc                      ; 02:6A0B
    inc  [hl]                       ; 02:6A0C
    ld   hl,W_SpriteXSpeed          ; 02:6A0D
    add  hl,bc                      ; 02:6A10
    ld   [hl],$00                   ; 02:6A11
    ld   hl,W_SpriteYSpeed          ; 02:6A13
    add  hl,bc                      ; 02:6A16
    ld   [hl],e                     ; 02:6A17
    ld   hl,$D1A4                   ; 02:6A18
    add  hl,bc                      ; 02:6A1B
    ld   [hl],$01                   ; 02:6A1C
    ld   a,$4A                      ; 02:6A1E
    ldh  [<$FFF2],a                 ; 02:6A20
    ld   a,$08                      ; 02:6A22
    call Sub002E90                  ; 02:6A24
    ret                             ; 02:6A27

Code026A28:
    ld   hl,W_SpriteSubstate        ; 02:6A28
    add  hl,bc                      ; 02:6A2B
    ld   [hl],$00                   ; 02:6A2C
    jp   Code026528                 ; 02:6A2E

Data026A31:                         ; 02:6A31
.db $70,$0F,$72,$0F,$74,$0F,$76,$0F,\
    $7E,$0F,$10,$0F,$12,$0F,$14,$0F,\
    $76,$2F,$74,$2F,$72,$2F,$70,$2F,\
    $14,$2F,$12,$2F,$10,$2F,$7E,$2F
Data026A51:                         ; 02:6A51
.db $78,$0F,$78,$2F
Data026A55:                         ; 02:6A55
.db $7A,$0F,$7C,$0F,$16,$0F,$18,$0F,\
    $7C,$2F,$7A,$2F,$18,$2F,$16,$2F
Data026A65:                         ; 02:6A65
.db $08,$10
Data026A67:                         ; 02:6A67
.db $10,$00

Code026A69:
    ld   hl,$D195                   ; 02:6A69
    add  hl,bc                      ; 02:6A6C
    ld   a,[hl]                     ; 02:6A6D
    swap a                          ; 02:6A6E
    ld   e,a                        ; 02:6A70
    ld   d,$00                      ; 02:6A71
    ld   hl,$D0D2                   ; 02:6A73
    add  hl,bc                      ; 02:6A76
    ld   a,[hl]                     ; 02:6A77
    sla  a                          ; 02:6A78
    sla  a                          ; 02:6A7A
    sla  a                          ; 02:6A7C
    ld   l,a                        ; 02:6A7E
    ld   h,$00                      ; 02:6A7F
    add  hl,de                      ; 02:6A81
    ld   e,l                        ; 02:6A82
    ld   d,h                        ; 02:6A83
    push de                         ; 02:6A84
    ld   hl,Data026A31              ; 02:6A85
    add  hl,de                      ; 02:6A88
    call Disp16x16Sprite            ; 02:6A89
    ld   hl,W_SpriteYLow            ; 02:6A8C
    add  hl,bc                      ; 02:6A8F
    ld   a,[hl]                     ; 02:6A90
    ldh  [<$FF97],a                 ; 02:6A91
    xor  a                          ; 02:6A93
    ldh  [<$FF9B],a                 ; 02:6A94
    ld   hl,W_SpriteXHigh           ; 02:6A96
    add  hl,bc                      ; 02:6A99
    push hl                         ; 02:6A9A
    ld   hl,W_SpriteXLow            ; 02:6A9B
    add  hl,bc                      ; 02:6A9E
    ld   a,[hl]                     ; 02:6A9F
    add  $10                        ; 02:6AA0
    ldh  [<$FF98],a                 ; 02:6AA2
    pop  hl                         ; 02:6AA4
    ld   a,[hl]                     ; 02:6AA5
    add  $00                        ; 02:6AA6
    ldh  [<$FF99],a                 ; 02:6AA8
    pop  de                         ; 02:6AAA
    ld   hl,$0004                   ; 02:6AAB
    add  hl,de                      ; 02:6AAE
    ld   e,l                        ; 02:6AAF
    ld   d,h                        ; 02:6AB0
    ld   hl,Data026A31              ; 02:6AB1
    add  hl,de                      ; 02:6AB4
    call Sub002769                  ; 02:6AB5
    ld   hl,W_SpriteYLow            ; 02:6AB8
    add  hl,bc                      ; 02:6ABB
    ld   a,[hl]                     ; 02:6ABC
    add  $10                        ; 02:6ABD
    ldh  [<$FF97],a                 ; 02:6ABF
    ld   hl,$D195                   ; 02:6AC1
    add  hl,bc                      ; 02:6AC4
    ld   a,[hl]                     ; 02:6AC5
    ld   e,a                        ; 02:6AC6
    ld   d,$00                      ; 02:6AC7
    ld   hl,Data026A65              ; 02:6AC9
    add  hl,de                      ; 02:6ACC
    ld   a,[hl]                     ; 02:6ACD
    ld   hl,W_SpriteXHigh           ; 02:6ACE
    add  hl,bc                      ; 02:6AD1
    push hl                         ; 02:6AD2
    ld   hl,W_SpriteXLow            ; 02:6AD3
    add  hl,bc                      ; 02:6AD6
    add  [hl]                       ; 02:6AD7
    ldh  [<$FF98],a                 ; 02:6AD8
    pop  hl                         ; 02:6ADA
    ld   a,[hl]                     ; 02:6ADB
    add  $00                        ; 02:6ADC
    ldh  [<$FF99],a                 ; 02:6ADE
    ld   hl,$D195                   ; 02:6AE0
    add  hl,bc                      ; 02:6AE3
    ld   a,[hl]                     ; 02:6AE4
    sla  a                          ; 02:6AE5
    ld   e,a                        ; 02:6AE7
    ld   d,$00                      ; 02:6AE8
    ld   hl,Data026A51              ; 02:6AEA
    add  hl,de                      ; 02:6AED
    call Sub002861                  ; 02:6AEE
    ld   hl,W_SpriteYLow            ; 02:6AF1
    add  hl,bc                      ; 02:6AF4
    ld   a,[hl]                     ; 02:6AF5
    add  $10                        ; 02:6AF6
    ldh  [<$FF97],a                 ; 02:6AF8
    xor  a                          ; 02:6AFA
    ldh  [<$FF9B],a                 ; 02:6AFB
    ld   hl,$D195                   ; 02:6AFD
    add  hl,bc                      ; 02:6B00
    ld   a,[hl]                     ; 02:6B01
    ld   e,a                        ; 02:6B02
    ld   d,$00                      ; 02:6B03
    ld   hl,Data026A67              ; 02:6B05
    add  hl,de                      ; 02:6B08
    ld   a,[hl]                     ; 02:6B09
    ld   hl,W_SpriteXHigh           ; 02:6B0A
    add  hl,bc                      ; 02:6B0D
    push hl                         ; 02:6B0E
    ld   hl,W_SpriteXLow            ; 02:6B0F
    add  hl,bc                      ; 02:6B12
    add  [hl]                       ; 02:6B13
    ldh  [<$FF98],a                 ; 02:6B14
    pop  hl                         ; 02:6B16
    ld   a,[hl]                     ; 02:6B17
    add  $00                        ; 02:6B18
    ldh  [<$FF99],a                 ; 02:6B1A
    ld   hl,$D195                   ; 02:6B1C
    add  hl,bc                      ; 02:6B1F
    ld   a,[hl]                     ; 02:6B20
    sla  a                          ; 02:6B21
    sla  a                          ; 02:6B23
    sla  a                          ; 02:6B25
    ld   e,a                        ; 02:6B27
    ld   d,$00                      ; 02:6B28
    ld   hl,$D177                   ; 02:6B2A
    add  hl,bc                      ; 02:6B2D
    ld   a,[hl]                     ; 02:6B2E
    sla  a                          ; 02:6B2F
    sla  a                          ; 02:6B31
    ld   l,a                        ; 02:6B33
    ld   h,$00                      ; 02:6B34
    add  hl,de                      ; 02:6B36
    ld   de,Data026A55              ; 02:6B37
    add  hl,de                      ; 02:6B3A
    call Sub002769                  ; 02:6B3B
    ret                             ; 02:6B3E

Bowser_DeathTilemaps16x16:          ; 02:6B3F
; Bowser 16x16 death sprite tilemaps (tile number, PYX0VCCC)
; All have been rotated and recolored as needed
.db $36,$61,$34,$61,\               ;          1-4: Goomba
    $44,$07,$44,$27,\               ;          2-4: Green Koopa shell
    $3E,$09,$3E,$29,\               ;          3-4: Buzzy shell
    $4A,$6E,$48,$6E,\               ;          4-4: Spiny
    $00,$00,$00,$00,\
    $2A,$49,$2A,$69,\               ;          6-4: Blooper
    $00,$00,$00,$00,\
    $00,$00,$00,$00,\
    $4A,$47,$4C,$47,\               ;          Race 1-4: Cheep-Cheep
    $58,$69,$56,$69                 ;          Race 2-4: Bullet Bill
Bowser_DeathTilemapW5:              ; 02:6B67
.db $44,$4F,$44,$6F                 ;          5-4: Lakitu
Data026B6B:                         ; 02:6B6B
.db $42,$6F,$40,$6F
Data026B6F:                         ; 02:6B6F
.db $78,$4F,$78,$6F
Data026B73:                         ; 02:6B73
.db $7A,$4F,$7C,$4F,$7C,$6F,$7A,$6F
Data026B7B:                         ; 02:6B7B
.db $70,$4F,$72,$4F,$76,$6F,$74,$6F
Data026B83:                         ; 02:6B83
.db $74,$4F,$76,$4F,$72,$6F,$70,$6F

Bowser_DeathState:
; determine which Bowser death sprite to use
    ld   a,[W_GameMode]             ; 02:6B8B
    cp   $07                        ; 02:6B8E
    jr   z,@Race                    ; 02:6B90
    cp   $02                        ; 02:6B92
    jr   nz,@NotRace                ; 02:6B94
@Race:
    ld   e,$20                      ; 02:6B96  if race 1-4, use index 20 (Cheep-Cheep)
    ld   a,[W_SublevelID]           ; 02:6B98
    cp   $3D                        ; 02:6B9B  3D: race 1-4
    jr   z,@Load16x16Tilemap        ; 02:6B9D
    ld   e,$24                      ; 02:6B9F  else, use index 24 (Bullet Bill)
    jr   @Load16x16Tilemap          ; 02:6BA1
@NotRace:
    ld   a,[W_LevelID]              ; 02:6BA3
    and  $FC                        ; 02:6BA6  clear lowest 2 bits (filter out world number)
    cp   $10                        ; 02:6BA8  10: W5
    jr   z,@W5                      ; 02:6BAA
    cp   $18                        ; 02:6BAC  18: W7
    jr   z,@W7                      ; 02:6BAE
    cp   $1C                        ; 02:6BB0  1C: W8
    jr   z,@W8                      ; 02:6BB2
    ld   e,a                        ; 02:6BB4  use world as offset
@Load16x16Tilemap:
    ld   d,$00                      ; 02:6BB5
    ld   hl,Bowser_DeathTilemaps16x16; 02:6BB7
    add  hl,de                      ; 02:6BBA
    call Disp16x16Sprite            ; 02:6BBB
    ret                             ; 02:6BBE

@W5:
; special handling for world 5 Lakitu death sprite
    ld   hl,Bowser_DeathTilemapW5   ; 02:6BBF
    call Disp16x16Sprite            ; 02:6BC2
    ld   hl,W_SpriteXLow            ; 02:6BC5
    add  hl,bc                      ; 02:6BC8
    ld   a,[hl]                     ; 02:6BC9
    ldh  [<$FF98],a                 ; 02:6BCA
    ld   hl,W_SpriteXHigh           ; 02:6BCC
    add  hl,bc                      ; 02:6BCF
    ld   a,[hl]                     ; 02:6BD0
    ldh  [<$FF99],a                 ; 02:6BD1
    ld   hl,W_SpriteYHigh           ; 02:6BD3
    add  hl,bc                      ; 02:6BD6
    push hl                         ; 02:6BD7
    ld   hl,W_SpriteYLow            ; 02:6BD8
    add  hl,bc                      ; 02:6BDB
    ld   a,[hl]                     ; 02:6BDC
    add  $10                        ; 02:6BDD
    ldh  [<$FF97],a                 ; 02:6BDF
    pop  hl                         ; 02:6BE1
    ld   a,[hl]                     ; 02:6BE2
    adc  $00                        ; 02:6BE3
    ldh  [<$FF9B],a                 ; 02:6BE5
    ld   hl,Data026B6B              ; 02:6BE7
    call Sub002769                  ; 02:6BEA
    ret                             ; 02:6BED

@W7:
; special handling for world 7 Hammer Bro death sprite?
    ld   hl,$D195                   ; 02:6BEE
    add  hl,bc                      ; 02:6BF1
    ld   [hl],$01                   ; 02:6BF2
    call Sub025EA0                  ; 02:6BF4
    ret                             ; 02:6BF7

@W8:
; special handling for world 8 Bowser death sprite?
    ld   hl,W_SpriteXLow            ; 02:6BF8
    add  hl,bc                      ; 02:6BFB
    ld   a,[hl]                     ; 02:6BFC
    ld   [$D2E4],a                  ; 02:6BFD
    ld   hl,W_SpriteXHigh           ; 02:6C00
    add  hl,bc                      ; 02:6C03
    ld   a,[hl]                     ; 02:6C04
    ld   [$D2E5],a                  ; 02:6C05
    ld   hl,W_SpriteYLow            ; 02:6C08
    add  hl,bc                      ; 02:6C0B
    ld   a,[hl]                     ; 02:6C0C
    ld   [$D2E6],a                  ; 02:6C0D
    ld   hl,W_SpriteYHigh           ; 02:6C10
    add  hl,bc                      ; 02:6C13
    ld   a,[hl]                     ; 02:6C14
    ld   [$D2E7],a                  ; 02:6C15
    ld   hl,$D195                   ; 02:6C18
    add  hl,bc                      ; 02:6C1B
    ld   e,[hl]                     ; 02:6C1C
    ld   d,$00                      ; 02:6C1D
    push de                         ; 02:6C1F
    ld   hl,Data026A65              ; 02:6C20
    add  hl,de                      ; 02:6C23
    ld   a,[$D2E4]                  ; 02:6C24
    add  [hl]                       ; 02:6C27
    ldh  [<$FF98],a                 ; 02:6C28
    ld   a,[$D2E5]                  ; 02:6C2A
    adc  $00                        ; 02:6C2D
    ldh  [<$FF99],a                 ; 02:6C2F
    ld   a,[$D2E6]                  ; 02:6C31
    ldh  [<$FF97],a                 ; 02:6C34
    ld   a,[$D2E7]                  ; 02:6C36
    ldh  [<$FFA6],a                 ; 02:6C39
    sla  e                          ; 02:6C3B
    ld   hl,Data026B6F              ; 02:6C3D
    add  hl,de                      ; 02:6C40
    call Sub002861                  ; 02:6C41
    pop  de                         ; 02:6C44
    ld   hl,Data026A67              ; 02:6C45
    add  hl,de                      ; 02:6C48
    ld   a,[$D2E4]                  ; 02:6C49
    add  [hl]                       ; 02:6C4C
    ldh  [<$FF98],a                 ; 02:6C4D
    ld   a,[$D2E5]                  ; 02:6C4F
    adc  $00                        ; 02:6C52
    ldh  [<$FF99],a                 ; 02:6C54
    ld   a,[$D2E6]                  ; 02:6C56
    ldh  [<$FF97],a                 ; 02:6C59
    ld   a,[$D2E7]                  ; 02:6C5B
    ldh  [<$FF9B],a                 ; 02:6C5E
    sla  e                          ; 02:6C60
    sla  e                          ; 02:6C62
    push de                         ; 02:6C64
    ld   hl,Data026B73              ; 02:6C65
    add  hl,de                      ; 02:6C68
    call Sub002769                  ; 02:6C69
    ld   a,[$D2E4]                  ; 02:6C6C
    ldh  [<$FF98],a                 ; 02:6C6F
    ld   a,[$D2E5]                  ; 02:6C71
    ldh  [<$FF99],a                 ; 02:6C74
    ld   a,[$D2E6]                  ; 02:6C76
    add  $10                        ; 02:6C79
    ldh  [<$FF97],a                 ; 02:6C7B
    ld   a,[$D2E7]                  ; 02:6C7D
    adc  $00                        ; 02:6C80
    ldh  [<$FF9B],a                 ; 02:6C82
    pop  de                         ; 02:6C84
    push de                         ; 02:6C85
    ld   hl,Data026B7B              ; 02:6C86
    add  hl,de                      ; 02:6C89
    call Sub002769                  ; 02:6C8A
    ld   a,[$D2E4]                  ; 02:6C8D
    add  $10                        ; 02:6C90
    ldh  [<$FF98],a                 ; 02:6C92
    ld   a,[$D2E5]                  ; 02:6C94
    adc  $00                        ; 02:6C97
    ldh  [<$FF99],a                 ; 02:6C99
    ld   a,[$D2E6]                  ; 02:6C9B
    add  $10                        ; 02:6C9E
    ldh  [<$FF97],a                 ; 02:6CA0
    ld   a,[$D2E7]                  ; 02:6CA2
    adc  $00                        ; 02:6CA5
    ldh  [<$FF9B],a                 ; 02:6CA7
    pop  de                         ; 02:6CA9
    ld   hl,Data026B83              ; 02:6CAA
    add  hl,de                      ; 02:6CAD
    call Sub002769                  ; 02:6CAE
    ret                             ; 02:6CB1

Data026CB2:                         ; 02:6CB2
.db $14,$00,$F0,$14,$00,$F0,$14,$00

Sub026CBA:
    call Sub026D4B                  ; 02:6CBA
    ret  nc                         ; 02:6CBD
    ld   a,$1B                      ; 02:6CBE
    call LoadSpriteAnySlot          ; 02:6CC0
    jr   c,Return026D37             ; 02:6CC3
    ld   hl,W_SpriteXHigh           ; 02:6CC5
    add  hl,bc                      ; 02:6CC8
    push hl                         ; 02:6CC9
    ld   hl,W_SpriteXLow            ; 02:6CCA
    add  hl,bc                      ; 02:6CCD
    ld   a,[hl]                     ; 02:6CCE
    add  $E8                        ; 02:6CCF
    ldh  [<$FF97],a                 ; 02:6CD1
    pop  hl                         ; 02:6CD3
    ld   a,$FF                      ; 02:6CD4
    adc  [hl]                       ; 02:6CD6
    ldh  [<$FF98],a                 ; 02:6CD7
    ld   hl,W_SpriteYLow            ; 02:6CD9
    add  hl,bc                      ; 02:6CDC
    ld   a,[hl]                     ; 02:6CDD
    add  $08                        ; 02:6CDE
    ld   hl,W_SpriteYLow            ; 02:6CE0
    add  hl,de                      ; 02:6CE3
    ld   [hl],a                     ; 02:6CE4
    ld   hl,W_SpriteXLow            ; 02:6CE5
    add  hl,de                      ; 02:6CE8
    ldh  a,[<$FF97]                 ; 02:6CE9
    ld   [hl],a                     ; 02:6CEB
    ld   hl,$D1B3                   ; 02:6CEC
    add  hl,de                      ; 02:6CEF
    ld   [hl],a                     ; 02:6CF0
    ld   hl,W_SpriteXHigh           ; 02:6CF1
    add  hl,de                      ; 02:6CF4
    ldh  a,[<$FF98]                 ; 02:6CF5
    ld   [hl],a                     ; 02:6CF7
    ld   hl,$D1C2                   ; 02:6CF8
    add  hl,de                      ; 02:6CFB
    ld   [hl],a                     ; 02:6CFC
    ld   hl,$D0F0                   ; 02:6CFD
    add  hl,bc                      ; 02:6D00
    ld   a,[hl]                     ; 02:6D01
    ld   [$D2E4],a                  ; 02:6D02
    push bc                         ; 02:6D05
    ldh  a,[<H_GlobalTimer]         ; 02:6D06
    and  $07                        ; 02:6D08
    ld   c,a                        ; 02:6D0A
    ld   b,$00                      ; 02:6D0B
    ld   hl,Data026CB2              ; 02:6D0D
    add  hl,bc                      ; 02:6D10
    ld   a,[$D2E4]                  ; 02:6D11
    add  [hl]                       ; 02:6D14
    ld   hl,$D1D1                   ; 02:6D15
    add  hl,de                      ; 02:6D18
    ld   [hl],a                     ; 02:6D19
    pop  bc                         ; 02:6D1A
    ld   hl,W_SpriteYLow            ; 02:6D1B
    add  hl,de                      ; 02:6D1E
    cp   [hl]                       ; 02:6D1F
    jr   c,Code026D26               ; 02:6D20
    ld   a,$10                      ; 02:6D22
    jr   Code026D28                 ; 02:6D24
Code026D26:
    ld   a,$F0                      ; 02:6D26
Code026D28:
    ld   hl,W_SpriteYSpeed          ; 02:6D28
    add  hl,de                      ; 02:6D2B
    ld   [hl],a                     ; 02:6D2C
    ld   hl,W_SpriteXSpeed          ; 02:6D2D
    add  hl,de                      ; 02:6D30
    ld   [hl],$EC                   ; 02:6D31
    ld   a,$42                      ; 02:6D33
    ldh  [<$FFF4],a                 ; 02:6D35
Return026D37:
    ret                             ; 02:6D37

BowserFire_Init:
; sprite 1B init
    ld   hl,W_SpriteXSpeed          ; 02:6D38
    add  hl,bc                      ; 02:6D3B
    ld   [hl],$F0                   ; 02:6D3C
    ld   a,$42                      ; 02:6D3E
    ldh  [<$FFF4],a                 ; 02:6D40
    ld   de,$0008                   ; 02:6D42
    ld   a,$01                      ; 02:6D45
    call Return0010B2               ; 02:6D47
    ret                             ; 02:6D4A

Sub026D4B:
    ld   d,$0F                      ; 02:6D4B
    ld   e,$00                      ; 02:6D4D
    ld   hl,W_SpriteID              ; 02:6D4F
Code026D52:
    ldi  a,[hl]                     ; 02:6D52
    cp   $1B                        ; 02:6D53
    jr   nz,Code026D58              ; 02:6D55
    inc  e                          ; 02:6D57
Code026D58:
    dec  d                          ; 02:6D58
    jr   nz,Code026D52              ; 02:6D59
    ld   a,[W_GameMode]             ; 02:6D5B
    cp   $02                        ; 02:6D5E
    jr   nz,Code026D66              ; 02:6D60
    ld   a,e                        ; 02:6D62
    cp   $01                        ; 02:6D63
    ret                             ; 02:6D65

Code026D66:
    ld   a,e                        ; 02:6D66
    cp   $02                        ; 02:6D67
    ret                             ; 02:6D69

BowserFire_Main:
; sprite 1B main
    call Sub0025CB                  ; 02:6D6A
    jp   c,Code026D83               ; 02:6D6D
    call Sub002920                  ; 02:6D70
    jr   c,Code026D97               ; 02:6D73
    call Sub026DF9                  ; 02:6D75
    jr   c,Code026D97               ; 02:6D78
    call Sub001A3D                  ; 02:6D7A
    call Sub001A79                  ; 02:6D7D
    call Sub026D9B                  ; 02:6D80
Code026D83:
    ld   hl,$D096                   ; 02:6D83
    add  hl,bc                      ; 02:6D86
    ld   a,[hl]                     ; 02:6D87
    dec  [hl]                       ; 02:6D88
    and  a                          ; 02:6D89
    jr   nz,Code026D97              ; 02:6D8A
    ld   [hl],$02                   ; 02:6D8C
    ld   hl,$D177                   ; 02:6D8E
    add  hl,bc                      ; 02:6D91
    ld   a,[hl]                     ; 02:6D92
    inc  a                          ; 02:6D93
    and  $01                        ; 02:6D94
    ld   [hl],a                     ; 02:6D96
Code026D97:
    call Sub026E55                  ; 02:6D97
    ret                             ; 02:6D9A

Sub026D9B:
    ld   a,[W_GameMode]             ; 02:6D9B
    cp   $02                        ; 02:6D9E
    jr   z,Code026DBE               ; 02:6DA0
    call Sub001D21                  ; 02:6DA2
    jr   nc,Code026DC1              ; 02:6DA5
    ld   a,[$C1DA]                  ; 02:6DA7
    ld   hl,$C1DB                   ; 02:6DAA
    or   [hl]                       ; 02:6DAD
    jr   nz,Code026DC1              ; 02:6DAE
    ldh  a,[<H_GlobalTimer]         ; 02:6DB0
    srl  a                          ; 02:6DB2
    jr   nc,Code026DC1              ; 02:6DB4
    ld   a,$02                      ; 02:6DB6
    rst  $10                        ; 02:6DB8  24-bit call
.dl SubL_0B4074                     ; 02:6DB9
    jr   Code026DC1                 ; 02:6DBC
Code026DBE:
    call Sub0261E0                  ; 02:6DBE
Code026DC1:
    ld   hl,$D1D1                   ; 02:6DC1
    add  hl,bc                      ; 02:6DC4
    ld   a,[hl]                     ; 02:6DC5
    ldh  [<$FF97],a                 ; 02:6DC6
    ld   hl,W_SpriteYLow            ; 02:6DC8
    add  hl,bc                      ; 02:6DCB
    ld   a,[hl]                     ; 02:6DCC
    ldh  [<$FF98],a                 ; 02:6DCD
    ld   hl,W_SpriteYSpeed          ; 02:6DCF
    add  hl,bc                      ; 02:6DD2
    ld   a,[hl]                     ; 02:6DD3
    and  a                          ; 02:6DD4
    ret  z                          ; 02:6DD5
    ld   a,[hl]                     ; 02:6DD6
    bit  7,a                        ; 02:6DD7
    jr   nz,Code026DE4              ; 02:6DD9
    ld   hl,$FF98                   ; 02:6DDB
    ldh  a,[<$FF97]                 ; 02:6DDE
    cp   [hl]                       ; 02:6DE0
    ret  nc                         ; 02:6DE1
    jr   Code026DEB                 ; 02:6DE2
Code026DE4:
    ld   hl,$FF98                   ; 02:6DE4
    ldh  a,[<$FF97]                 ; 02:6DE7
    cp   [hl]                       ; 02:6DE9
    ret  c                          ; 02:6DEA
Code026DEB:
    ld   hl,W_SpriteYLow            ; 02:6DEB
    add  hl,bc                      ; 02:6DEE
    ldh  a,[<$FF97]                 ; 02:6DEF
    ld   [hl],a                     ; 02:6DF1
    ld   hl,W_SpriteYSpeed          ; 02:6DF2
    add  hl,bc                      ; 02:6DF5
    ld   [hl],$00                   ; 02:6DF6
    ret                             ; 02:6DF8

Sub026DF9:
    ld   a,[W_GameMode]             ; 02:6DF9
    cp   $07                        ; 02:6DFC
    jr   z,Code026E04               ; 02:6DFE
    cp   $02                        ; 02:6E00
    jr   nz,Code026E2E              ; 02:6E02
Code026E04:
    ld   hl,W_SpriteXLow            ; 02:6E04
    add  hl,bc                      ; 02:6E07
    ld   e,[hl]                     ; 02:6E08
    ld   hl,W_SpriteXHigh           ; 02:6E09
    add  hl,bc                      ; 02:6E0C
    ld   d,[hl]                     ; 02:6E0D
    ld   hl,$D1C2                   ; 02:6E0E
    add  hl,bc                      ; 02:6E11
    push hl                         ; 02:6E12
    ld   hl,$D1B3                   ; 02:6E13
    add  hl,bc                      ; 02:6E16
    ld   a,[hl]                     ; 02:6E17
    sub  e                          ; 02:6E18
    ld   e,a                        ; 02:6E19
    pop  hl                         ; 02:6E1A
    ld   a,[hl]                     ; 02:6E1B
    sbc  d                          ; 02:6E1C
    ld   d,a                        ; 02:6E1D
    and  a                          ; 02:6E1E
    jr   z,Code026E2E               ; 02:6E1F
    xor  a                          ; 02:6E21
    ld   hl,W_SpriteStatus          ; 02:6E22
    add  hl,bc                      ; 02:6E25
    ld   [hl],a                     ; 02:6E26
    ld   hl,W_SpriteID              ; 02:6E27
    add  hl,bc                      ; 02:6E2A
    ld   [hl],a                     ; 02:6E2B
    scf                             ; 02:6E2C
    ret                             ; 02:6E2D

Code026E2E:
    scf                             ; 02:6E2E
    ccf                             ; 02:6E2F
    ret                             ; 02:6E30

Data026E31:                         ; 02:6E31
.db $6C,$06,$6E,$06,$70,$06,$00,$00,\
    $6C,$46,$6E,$46,$70,$46,$00,$00,\
    $70,$26,$6E,$26,$6C,$26,$00,$00,\
    $70,$66,$6E,$66,$6C,$66,$00,$00
Data026E51:                         ; 02:6E51
.db $00,$00,$F8,$FF

Sub026E55:
    ld   hl,W_SpriteXLow            ; 02:6E55
    add  hl,bc                      ; 02:6E58
    ld   a,[hl]                     ; 02:6E59
    ld   [$D2E0],a                  ; 02:6E5A
    ldh  [<$FF98],a                 ; 02:6E5D
    ld   hl,W_SpriteXHigh           ; 02:6E5F
    add  hl,bc                      ; 02:6E62
    ld   a,[hl]                     ; 02:6E63
    ld   [$D2E1],a                  ; 02:6E64
    ldh  [<$FF99],a                 ; 02:6E67
    ld   hl,$D177                   ; 02:6E69
    add  hl,bc                      ; 02:6E6C
    ld   a,[hl]                     ; 02:6E6D
    sla  a                          ; 02:6E6E
    ld   e,a                        ; 02:6E70
    ld   d,$00                      ; 02:6E71
    ld   hl,Data026E51              ; 02:6E73
    add  hl,de                      ; 02:6E76
    ldi  a,[hl]                     ; 02:6E77
    ldh  [<$FF97],a                 ; 02:6E78
    ld   a,[hl]                     ; 02:6E7A
    ldh  [<$FFA6],a                 ; 02:6E7B
    ld   hl,W_SpriteYHigh           ; 02:6E7D
    add  hl,bc                      ; 02:6E80
    ld   e,[hl]                     ; 02:6E81
    ld   hl,W_SpriteYLow            ; 02:6E82
    add  hl,bc                      ; 02:6E85
    ldh  a,[<$FF97]                 ; 02:6E86
    add  [hl]                       ; 02:6E88
    ldh  [<$FF97],a                 ; 02:6E89
    ld   [$D2E2],a                  ; 02:6E8B
    ldh  a,[<$FFA6]                 ; 02:6E8E
    adc  e                          ; 02:6E90
    ldh  [<$FFA6],a                 ; 02:6E91
    ld   [$D2E3],a                  ; 02:6E93
    ld   d,$00                      ; 02:6E96
    ld   hl,$D195                   ; 02:6E98
    add  hl,bc                      ; 02:6E9B
    ld   a,[hl]                     ; 02:6E9C
    swap a                          ; 02:6E9D
    ld   e,a                        ; 02:6E9F
    ld   hl,$D177                   ; 02:6EA0
    add  hl,bc                      ; 02:6EA3
    ld   a,[hl]                     ; 02:6EA4
    sla  a                          ; 02:6EA5
    sla  a                          ; 02:6EA7
    sla  a                          ; 02:6EA9
    ld   l,a                        ; 02:6EAB
    ld   h,$00                      ; 02:6EAC
    add  hl,de                      ; 02:6EAE
    ld   de,Data026E31              ; 02:6EAF
    add  hl,de                      ; 02:6EB2
    push hl                         ; 02:6EB3
    call Sub002861                  ; 02:6EB4
    ld   a,[$D2E0]                  ; 02:6EB7
    add  $08                        ; 02:6EBA
    ldh  [<$FF98],a                 ; 02:6EBC
    ld   [$D2E0],a                  ; 02:6EBE
    ld   a,[$D2E1]                  ; 02:6EC1
    adc  $00                        ; 02:6EC4
    ldh  [<$FF99],a                 ; 02:6EC6
    ld   [$D2E1],a                  ; 02:6EC8
    ld   a,[$D2E2]                  ; 02:6ECB
    ldh  [<$FF97],a                 ; 02:6ECE
    ld   a,[$D2E3]                  ; 02:6ED0
    ldh  [<$FFA6],a                 ; 02:6ED3
    pop  hl                         ; 02:6ED5
    inc  hl                         ; 02:6ED6
    inc  hl                         ; 02:6ED7
    push hl                         ; 02:6ED8
    call Sub002861                  ; 02:6ED9
    ld   a,[$D2E0]                  ; 02:6EDC
    add  $08                        ; 02:6EDF
    ldh  [<$FF98],a                 ; 02:6EE1
    ld   a,[$D2E1]                  ; 02:6EE3
    adc  $00                        ; 02:6EE6
    ldh  [<$FF99],a                 ; 02:6EE8
    ld   a,[$D2E2]                  ; 02:6EEA
    ldh  [<$FF97],a                 ; 02:6EED
    ld   a,[$D2E3]                  ; 02:6EEF
    ldh  [<$FFA6],a                 ; 02:6EF2
    pop  hl                         ; 02:6EF4
    inc  hl                         ; 02:6EF5
    inc  hl                         ; 02:6EF6
    call Sub002861                  ; 02:6EF7
    ret                             ; 02:6EFA

Data026EFB:                         ; 02:6EFB
.db $70,$80
Data026EFD:                         ; 02:6EFD
.db $08,$08,$0C,$0C,$08,$08

ElevatorGen_Init:
; sprite 50-55 init
    ld   hl,W_SpriteID              ; 02:6F03
    add  hl,bc                      ; 02:6F06
    ld   a,[hl]                     ; 02:6F07
    sub  $50                        ; 02:6F08
    ld   hl,$D11D                   ; 02:6F0A
    add  hl,bc                      ; 02:6F0D
    ld   [hl],a                     ; 02:6F0E
    ld   e,a                        ; 02:6F0F
    ld   d,$00                      ; 02:6F10
    ld   hl,Data026EFD              ; 02:6F12
    add  hl,de                      ; 02:6F15
    ld   a,[hl]                     ; 02:6F16
    ldh  [<$FF97],a                 ; 02:6F17
    ld   hl,W_SpriteXHigh           ; 02:6F19
    add  hl,bc                      ; 02:6F1C
    push hl                         ; 02:6F1D
    ld   hl,W_SpriteXLow            ; 02:6F1E
    add  hl,bc                      ; 02:6F21
    ldh  a,[<$FF97]                 ; 02:6F22
    add  [hl]                       ; 02:6F24
    ld   [hl],a                     ; 02:6F25
    pop  hl                         ; 02:6F26
    ld   a,[hl]                     ; 02:6F27
    adc  $00                        ; 02:6F28
    ld   [hl],a                     ; 02:6F2A
    ld   hl,$D11D                   ; 02:6F2B
    add  hl,bc                      ; 02:6F2E
    ld   a,[hl]                     ; 02:6F2F
    and  $01                        ; 02:6F30
    ld   e,a                        ; 02:6F32
    ld   d,$00                      ; 02:6F33
    push de                         ; 02:6F35
    ld   hl,Data026EFB              ; 02:6F36
    add  hl,de                      ; 02:6F39
    ld   a,[hl]                     ; 02:6F3A
    ldh  [<$FF97],a                 ; 02:6F3B
    xor  a                          ; 02:6F3D
    ldh  [<$FF9B],a                 ; 02:6F3E
    ld   hl,W_SpriteXLow            ; 02:6F40
    add  hl,bc                      ; 02:6F43
    ld   a,[hl]                     ; 02:6F44
    ldh  [<$FF98],a                 ; 02:6F45
    ld   hl,W_SpriteXHigh           ; 02:6F47
    add  hl,bc                      ; 02:6F4A
    ld   a,[hl]                     ; 02:6F4B
    ldh  [<$FF99],a                 ; 02:6F4C
    pop  de                         ; 02:6F4E
    ld   hl,Data026F5C              ; 02:6F4F
    add  hl,de                      ; 02:6F52
    ld   a,[hl]                     ; 02:6F53
    ldh  [<$FF9A],a                 ; 02:6F54
    jr   Code026FB1                 ; 02:6F56

Data026F58:                         ; 02:6F58
.db $00,$01,$F0,$FF
Data026F5C:                         ; 02:6F5C
.db $F0,$10

ElevatorGen_Main:
; sprite 50-55 main
    call Sub0025CB                  ; 02:6F5E
    jp   c,Return026FE7             ; 02:6F61
    call Sub002920                  ; 02:6F64
    jp   c,Return026FE7             ; 02:6F67
    ld   hl,$D096                   ; 02:6F6A
    add  hl,bc                      ; 02:6F6D
    ld   a,[hl]                     ; 02:6F6E
    dec  [hl]                       ; 02:6F6F
    and  a                          ; 02:6F70
    jr   nz,Return026FE7            ; 02:6F71
    ld   [hl],$80                   ; 02:6F73
    ld   a,[W_SublevelID]           ; 02:6F75
    cp   $31                        ; 02:6F78
    jr   z,Code026F80               ; 02:6F7A
    cp   $32                        ; 02:6F7C
    jr   nz,Code026F82              ; 02:6F7E
Code026F80:
    ld   [hl],$E0                   ; 02:6F80
Code026F82:
    ld   hl,$D11D                   ; 02:6F82
    add  hl,bc                      ; 02:6F85
    ld   a,[hl]                     ; 02:6F86
    and  $01                        ; 02:6F87
    sla  a                          ; 02:6F89
    ld   e,a                        ; 02:6F8B
    ld   d,$00                      ; 02:6F8C
    push de                         ; 02:6F8E
    ld   hl,Data026F58              ; 02:6F8F
    add  hl,de                      ; 02:6F92
    ldi  a,[hl]                     ; 02:6F93
    ldh  [<$FF97],a                 ; 02:6F94
    ld   a,[hl]                     ; 02:6F96
    ldh  [<$FF9B],a                 ; 02:6F97
    ld   hl,W_SpriteXLow            ; 02:6F99
    add  hl,bc                      ; 02:6F9C
    ld   a,[hl]                     ; 02:6F9D
    ldh  [<$FF98],a                 ; 02:6F9E
    ld   hl,W_SpriteXHigh           ; 02:6FA0
    add  hl,bc                      ; 02:6FA3
    ld   a,[hl]                     ; 02:6FA4
    ldh  [<$FF99],a                 ; 02:6FA5
    pop  de                         ; 02:6FA7
    srl  e                          ; 02:6FA8
    ld   hl,Data026F5C              ; 02:6FAA
    add  hl,de                      ; 02:6FAD
    ld   a,[hl]                     ; 02:6FAE
    ldh  [<$FF9A],a                 ; 02:6FAF
Code026FB1:
    ld   hl,$D11D                   ; 02:6FB1
    add  hl,bc                      ; 02:6FB4
    ld   a,[hl]                     ; 02:6FB5
    bit  2,a                        ; 02:6FB6
    jr   nz,Code026FD7              ; 02:6FB8
    bit  1,a                        ; 02:6FBA
    jr   nz,Code026FC5              ; 02:6FBC
    ld   a,$56                      ; 02:6FBE
    call Sub026FE8                  ; 02:6FC0
    jr   Return026FE7               ; 02:6FC3
Code026FC5:
    ld   a,$57                      ; 02:6FC5
    call Sub026FE8                  ; 02:6FC7
    ld   a,e                        ; 02:6FCA
    cp   $0F                        ; 02:6FCB
    jr   z,Return026FE7             ; 02:6FCD
    ld   hl,W_SpriteSubstate        ; 02:6FCF
    add  hl,de                      ; 02:6FD2
    ld   [hl],$01                   ; 02:6FD3
    jr   Return026FE7               ; 02:6FD5
Code026FD7:
    ld   a,$64                      ; 02:6FD7
    call Sub026FE8                  ; 02:6FD9
    ld   a,e                        ; 02:6FDC
    cp   $0F                        ; 02:6FDD
    jr   z,Return026FE7             ; 02:6FDF
    ld   hl,W_SpriteSubstate        ; 02:6FE1
    add  hl,de                      ; 02:6FE4
    ld   [hl],$0A                   ; 02:6FE5
Return026FE7:
    ret                             ; 02:6FE7

Sub026FE8:
    push bc                         ; 02:6FE8
    call LoadSpriteAnySlot          ; 02:6FE9
    pop  bc                         ; 02:6FEC
    jr   c,Return026FE7             ; 02:6FED
    ld   hl,W_SpriteYLow            ; 02:6FEF
    add  hl,de                      ; 02:6FF2
    ldh  a,[<$FF97]                 ; 02:6FF3
    ld   [hl],a                     ; 02:6FF5
    ld   hl,W_SpriteYHigh           ; 02:6FF6
    add  hl,de                      ; 02:6FF9
    ldh  a,[<$FF9B]                 ; 02:6FFA
    ld   [hl],a                     ; 02:6FFC
    ld   hl,W_SpriteXLow            ; 02:6FFD
    add  hl,de                      ; 02:7000
    ldh  a,[<$FF98]                 ; 02:7001
    ld   [hl],a                     ; 02:7003
    ld   hl,W_SpriteXHigh           ; 02:7004
    add  hl,de                      ; 02:7007
    ldh  a,[<$FF99]                 ; 02:7008
    ld   [hl],a                     ; 02:700A
    ld   hl,W_SpriteYSpeed          ; 02:700B
    add  hl,de                      ; 02:700E
    ldh  a,[<$FF9A]                 ; 02:700F
    ld   [hl],a                     ; 02:7011
    ret                             ; 02:7012

Data027013:                         ; 02:7013
.db $00,$00,$00,$00,$10,$00,$00,$00,\
    $00,$00,$00,$00,$10,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00
Data027029:                         ; 02:7029
.db $00,$00,$00,$00,$00,$00,$08,$00,\
    $05,$00,$08,$00,$00,$00,$08,$00,\
    $08,$00,$05,$00,$00,$00
Data02703F:                         ; 02:703F
.db $01,$01,$01,$01,$01,$01,$01,$01,\
    $01,$01,$01
MovingPlatform_Init:
; sprite 56-5F,64 init
    ld   hl,W_SpriteID              ; 02:704A
    add  hl,bc                      ; 02:704D
    ld   a,[hl]                     ; 02:704E
    sub  $56                        ; 02:704F
    ld   hl,W_SpriteSubstate        ; 02:7051
    add  hl,bc                      ; 02:7054
    ld   [hl],a                     ; 02:7055
    ld   e,a                        ; 02:7056
    ld   d,$00                      ; 02:7057
    ld   hl,Data02703F              ; 02:7059
    add  hl,de                      ; 02:705C
    ld   a,[hl]                     ; 02:705D
    ld   hl,$D11D                   ; 02:705E
    add  hl,bc                      ; 02:7061
    ld   [hl],a                     ; 02:7062
    sla  e                          ; 02:7063
    ld   hl,Data027013              ; 02:7065
    add  hl,de                      ; 02:7068
    ldi  a,[hl]                     ; 02:7069
    ldh  [<$FF97],a                 ; 02:706A
    ld   a,[hl]                     ; 02:706C
    ldh  [<$FF98],a                 ; 02:706D
    ld   hl,Data027029              ; 02:706F
    add  hl,de                      ; 02:7072
    ldi  a,[hl]                     ; 02:7073
    ldh  [<$FF99],a                 ; 02:7074
    ld   a,[hl]                     ; 02:7076
    ldh  [<$FF9A],a                 ; 02:7077
    ld   a,[W_SPFlag]               ; 02:7079
    and  a                          ; 02:707C
    jr   z,Code02708E               ; 02:707D
    ld   a,e                        ; 02:707F
    cp   $08                        ; 02:7080
    jr   z,Code027088               ; 02:7082
    cp   $12                        ; 02:7084
    jr   nz,Code02708E              ; 02:7086
Code027088:
    ldh  a,[<$FF99]                 ; 02:7088
    add  $03                        ; 02:708A
    ldh  [<$FF99],a                 ; 02:708C
Code02708E:
    ld   hl,W_SpriteXHigh           ; 02:708E
    add  hl,bc                      ; 02:7091
    push hl                         ; 02:7092
    ld   hl,W_SpriteXLow            ; 02:7093
    add  hl,bc                      ; 02:7096
    ldh  a,[<$FF97]                 ; 02:7097
    add  [hl]                       ; 02:7099
    ld   [hl],a                     ; 02:709A
    pop  hl                         ; 02:709B
    ldh  a,[<$FF98]                 ; 02:709C
    adc  [hl]                       ; 02:709E
    ld   [hl],a                     ; 02:709F
    ld   hl,W_SpriteYHigh           ; 02:70A0
    add  hl,bc                      ; 02:70A3
    push hl                         ; 02:70A4
    ld   hl,W_SpriteYLow            ; 02:70A5
    add  hl,bc                      ; 02:70A8
    ldh  a,[<$FF99]                 ; 02:70A9
    add  [hl]                       ; 02:70AB
    ld   [hl],a                     ; 02:70AC
    pop  hl                         ; 02:70AD
    ldh  a,[<$FF9A]                 ; 02:70AE
    adc  [hl]                       ; 02:70B0
    ld   [hl],a                     ; 02:70B1
    ld   hl,W_SpriteYLow            ; 02:70B2
    add  hl,bc                      ; 02:70B5
    ld   a,[hl]                     ; 02:70B6
    ld   hl,$D1D1                   ; 02:70B7
    add  hl,bc                      ; 02:70BA
    ld   [hl],a                     ; 02:70BB
    ld   hl,W_SpriteXLow            ; 02:70BC
    add  hl,bc                      ; 02:70BF
    ld   a,[hl]                     ; 02:70C0
    ld   hl,$D1B3                   ; 02:70C1
    add  hl,bc                      ; 02:70C4
    ld   [hl],a                     ; 02:70C5
    ld   hl,W_SpriteXHigh           ; 02:70C6
    add  hl,bc                      ; 02:70C9
    ld   a,[hl]                     ; 02:70CA
    ld   hl,$D1C2                   ; 02:70CB
    add  hl,bc                      ; 02:70CE
    ld   [hl],a                     ; 02:70CF
    ret                             ; 02:70D0

MovingPlatform_Main:
; sprite 56-5F,64 main
    call Sub0025CB                  ; 02:70D1
    jp   c,Code02713D               ; 02:70D4
    ld   hl,$D13B                   ; 02:70D7
    add  hl,bc                      ; 02:70DA
    ld   a,[hl]                     ; 02:70DB
    ld   [$D2E5],a                  ; 02:70DC
    ld   hl,W_SpriteSubstate        ; 02:70DF
    add  hl,bc                      ; 02:70E2
    ld   a,[hl]                     ; 02:70E3
    cp   $00                        ; 02:70E4
    jr   z,Code0270F4               ; 02:70E6
    cp   $03                        ; 02:70E8
    jr   z,Code0270FA               ; 02:70EA
    call Sub002920                  ; 02:70EC
    jp   c,Code02713D               ; 02:70EF
    jr   Code0270FA                 ; 02:70F2
Code0270F4:
    call Sub002920                  ; 02:70F4
    jp   c,Code02713D               ; 02:70F7
Code0270FA:
    xor  a                          ; 02:70FA
    ld   [$D2E4],a                  ; 02:70FB
    ld   hl,W_SpriteXLow            ; 02:70FE
    add  hl,bc                      ; 02:7101
    ld   a,[hl]                     ; 02:7102
    ld   [$D2E0],a                  ; 02:7103
    ld   hl,W_SpriteYLow            ; 02:7106
    add  hl,bc                      ; 02:7109
    ld   a,[hl]                     ; 02:710A
    ld   [$D2E2],a                  ; 02:710B
    ld   hl,W_SpriteYSpeed          ; 02:710E
    add  hl,bc                      ; 02:7111
    ld   a,[hl]                     ; 02:7112
    bit  7,a                        ; 02:7113
    jr   z,Code02711A               ; 02:7115
    call Sub02745C                  ; 02:7117
Code02711A:
    call Sub001A3D                  ; 02:711A
    call Sub001A79                  ; 02:711D
    call Sub027141                  ; 02:7120
    ldh  a,[<$FFAC]                 ; 02:7123
    bit  7,a                        ; 02:7125
    jr   nz,Code02713D              ; 02:7127
    ld   a,[$D2E4]                  ; 02:7129
    and  a                          ; 02:712C
    jr   nz,Code02713D              ; 02:712D
    ld   a,[$D2E5]                  ; 02:712F
    and  a                          ; 02:7132
    jr   z,Code02713D               ; 02:7133
    xor  a                          ; 02:7135
    ldh  [<$FFAC],a                 ; 02:7136
    ldh  [<$FFAE],a                 ; 02:7138
    ld   [$C200],a                  ; 02:713A
Code02713D:
    call Sub02715D                  ; 02:713D
    ret                             ; 02:7140

Sub027141:
    ld   hl,W_SpriteSubstate        ; 02:7141
    add  hl,bc                      ; 02:7144
    ld   a,[hl]                     ; 02:7145
    rst  $00                        ; 02:7146  Execute from 16-bit pointer table
.dw Code027256                      ; 02:7147
.dw Code027256                      ; 02:7149
.dw Code0272BA                      ; 02:714B
.dw Code027311                      ; 02:714D
.dw Code0273A8                      ; 02:714F
.dw Code0273D6                      ; 02:7151
.dw Code0272BA                      ; 02:7153
.dw Code027311                      ; 02:7155
.dw Code0273D6                      ; 02:7157
.dw Code0273A8                      ; 02:7159
.dw Code027256                      ; 02:715B

Sub02715D:
    ld   hl,W_SpriteSubstate        ; 02:715D
    add  hl,bc                      ; 02:7160
    ld   a,[hl]                     ; 02:7161
    cp   $01                        ; 02:7162
    jp   z,Code02722E               ; 02:7164
    cp   $06                        ; 02:7167
    jp   nc,Sub0271EF               ; 02:7169
    jr   Sub027181                  ; 02:716C

Data02716E:                         ; 02:716E
.db $2C,$0E,$2C,$0E,$28,$06,$28,$06
Data027176:                         ; 02:7176
.db $00,$00,$00,$00,$04,$00,$00,$00,\
    $00,$04,$00

Sub027181:
    ld   hl,W_SpriteSubstate        ; 02:7181
    add  hl,bc                      ; 02:7184
    ld   a,[hl]                     ; 02:7185
    ld   e,a                        ; 02:7186
    ld   d,$00                      ; 02:7187
    ld   hl,Data027176              ; 02:7189
    add  hl,de                      ; 02:718C
    ld   a,[hl]                     ; 02:718D
    ld   e,a                        ; 02:718E
    push de                         ; 02:718F
    ld   hl,Data02716E              ; 02:7190
    add  hl,de                      ; 02:7193
    call Disp16x16Sprite            ; 02:7194
    ld   hl,W_SpriteYLow            ; 02:7197
    add  hl,bc                      ; 02:719A
    ld   a,[hl]                     ; 02:719B
    ldh  [<$FF97],a                 ; 02:719C
    ld   [$D2E2],a                  ; 02:719E
    ld   hl,W_SpriteYHigh           ; 02:71A1
    add  hl,bc                      ; 02:71A4
    ld   a,[hl]                     ; 02:71A5
    ldh  [<$FF9B],a                 ; 02:71A6
    ld   [$D2E3],a                  ; 02:71A8
    ld   hl,W_SpriteXHigh           ; 02:71AB
    add  hl,bc                      ; 02:71AE
    push hl                         ; 02:71AF
    ld   hl,W_SpriteXLow            ; 02:71B0
    add  hl,bc                      ; 02:71B3
    ld   a,[hl]                     ; 02:71B4
    add  $10                        ; 02:71B5
    ldh  [<$FF98],a                 ; 02:71B7
    ld   [$D2E0],a                  ; 02:71B9
    pop  hl                         ; 02:71BC
    ld   a,[hl]                     ; 02:71BD
    adc  $00                        ; 02:71BE
    ldh  [<$FF99],a                 ; 02:71C0
    ld   [$D2E1],a                  ; 02:71C2
    pop  de                         ; 02:71C5
    push de                         ; 02:71C6
    ld   hl,Data02716E              ; 02:71C7
    add  hl,de                      ; 02:71CA
    call Sub002769                  ; 02:71CB
    ld   a,[$D2E2]                  ; 02:71CE
    ldh  [<$FF97],a                 ; 02:71D1
    ld   a,[$D2E3]                  ; 02:71D3
    ldh  [<$FF9B],a                 ; 02:71D6
    ld   a,[$D2E0]                  ; 02:71D8
    add  $10                        ; 02:71DB
    ldh  [<$FF98],a                 ; 02:71DD
    ld   a,[$D2E1]                  ; 02:71DF
    adc  $00                        ; 02:71E2
    ldh  [<$FF99],a                 ; 02:71E4
    pop  de                         ; 02:71E6
    ld   hl,Data02716E              ; 02:71E7
    add  hl,de                      ; 02:71EA
    call Sub002769                  ; 02:71EB
    ret                             ; 02:71EE

Sub0271EF:
    ld   hl,W_SpriteSubstate        ; 02:71EF
    add  hl,bc                      ; 02:71F2
    ld   e,[hl]                     ; 02:71F3
    ld   d,$00                      ; 02:71F4
    ld   hl,Data027176              ; 02:71F6
    add  hl,de                      ; 02:71F9
    ld   e,[hl]                     ; 02:71FA
    push de                         ; 02:71FB
    ld   hl,Data02716E              ; 02:71FC
    add  hl,de                      ; 02:71FF
    call Disp16x16Sprite            ; 02:7200
    ld   hl,W_SpriteYLow            ; 02:7203
    add  hl,bc                      ; 02:7206
    ld   a,[hl]                     ; 02:7207
    ldh  [<$FF97],a                 ; 02:7208
    ld   hl,W_SpriteYHigh           ; 02:720A
    add  hl,bc                      ; 02:720D
    ld   a,[hl]                     ; 02:720E
    ldh  [<$FF9B],a                 ; 02:720F
    ld   hl,W_SpriteXHigh           ; 02:7211
    add  hl,bc                      ; 02:7214
    push hl                         ; 02:7215
    ld   hl,W_SpriteXLow            ; 02:7216
    add  hl,bc                      ; 02:7219
    ld   a,[hl]                     ; 02:721A
    add  $10                        ; 02:721B
    ldh  [<$FF98],a                 ; 02:721D
    pop  hl                         ; 02:721F
    ld   a,[hl]                     ; 02:7220
    adc  $00                        ; 02:7221
    ldh  [<$FF99],a                 ; 02:7223
    pop  de                         ; 02:7225
    ld   hl,Data02716E              ; 02:7226
    add  hl,de                      ; 02:7229
    call Sub002769                  ; 02:722A
    ret                             ; 02:722D

Code02722E:
    ld   hl,Data02716E              ; 02:722E
    call Disp16x16Sprite            ; 02:7231
    ld   hl,W_SpriteYLow            ; 02:7234
    add  hl,bc                      ; 02:7237
    ld   a,[hl]                     ; 02:7238
    ldh  [<$FF97],a                 ; 02:7239
    ld   hl,W_SpriteXHigh           ; 02:723B
    add  hl,bc                      ; 02:723E
    ld   d,[hl]                     ; 02:723F
    ld   hl,W_SpriteXLow            ; 02:7240
    add  hl,bc                      ; 02:7243
    ld   e,[hl]                     ; 02:7244
    ld   hl,$0010                   ; 02:7245
    add  hl,de                      ; 02:7248
    ld   a,l                        ; 02:7249
    ldh  [<$FF98],a                 ; 02:724A
    ld   a,h                        ; 02:724C
    ldh  [<$FF99],a                 ; 02:724D
    ld   hl,Data02716E              ; 02:724F
    call Sub002861                  ; 02:7252
    ret                             ; 02:7255

Code027256:
    ld   hl,W_SpriteYHigh           ; 02:7256
    add  hl,bc                      ; 02:7259
    push hl                         ; 02:725A
    ld   hl,W_SpriteYSpeed          ; 02:725B
    add  hl,bc                      ; 02:725E
    ld   a,[hl]                     ; 02:725F
    pop  hl                         ; 02:7260
    bit  7,a                        ; 02:7261
    jr   nz,Code027275              ; 02:7263
    ld   a,[hl]                     ; 02:7265
    cp   $01                        ; 02:7266
    jr   nz,Sub027290               ; 02:7268
    ld   hl,W_SpriteYLow            ; 02:726A
    add  hl,bc                      ; 02:726D
    ld   a,[hl]                     ; 02:726E
    cp   $08                        ; 02:726F
    jr   c,Sub027290                ; 02:7271
    jr   Code027283                 ; 02:7273
Code027275:
    ld   a,[hl]                     ; 02:7275
    cp   $FF                        ; 02:7276
    jr   z,Code027283               ; 02:7278
    ld   hl,W_SpriteYLow            ; 02:727A
    add  hl,bc                      ; 02:727D
    ld   a,[hl]                     ; 02:727E
    cp   $20                        ; 02:727F
    jr   nc,Sub027290               ; 02:7281
Code027283:
    ld   hl,W_SpriteStatus          ; 02:7283
    add  hl,bc                      ; 02:7286
    ld   [hl],$00                   ; 02:7287
    ld   hl,W_SpriteID              ; 02:7289
    add  hl,bc                      ; 02:728C
    ld   [hl],$00                   ; 02:728D
    ret                             ; 02:728F

Sub027290:
    call Sub02745C                  ; 02:7290
    ld   a,[$D2E4]                  ; 02:7293
    and  a                          ; 02:7296
    jr   z,Return0272B9             ; 02:7297
    ld   hl,W_SpriteXLow            ; 02:7299
    add  hl,bc                      ; 02:729C
    ld   a,[hl]                     ; 02:729D
    ld   hl,$D2E0                   ; 02:729E
    sub  [hl]                       ; 02:72A1
    ld   [$C1D6],a                  ; 02:72A2
    ld   hl,W_SpriteYLow            ; 02:72A5
    add  hl,bc                      ; 02:72A8
    ld   a,[hl]                     ; 02:72A9
    ld   hl,$D2E2                   ; 02:72AA
    sub  [hl]                       ; 02:72AD
    ld   [$C1D7],a                  ; 02:72AE
    push bc                         ; 02:72B1
    ld   a,$02                      ; 02:72B2
    rst  $10                        ; 02:72B4  24-bit call
.dl SubL_0374C7                     ; 02:72B5
    pop  bc                         ; 02:72B8
Return0272B9:
    ret                             ; 02:72B9

Code0272BA:
    ld   hl,$D195                   ; 02:72BA
    add  hl,bc                      ; 02:72BD
    ld   a,[hl]                     ; 02:72BE
    ld   hl,W_SpriteYSpeed          ; 02:72BF
    add  hl,bc                      ; 02:72C2
    and  a                          ; 02:72C3
    jr   nz,Code0272EC              ; 02:72C4
    ldh  a,[<H_GlobalTimer]         ; 02:72C6
    and  $03                        ; 02:72C8
    jr   nz,Code0272CD              ; 02:72CA
    inc  [hl]                       ; 02:72CC
Code0272CD:
    ld   a,[hl]                     ; 02:72CD
    bit  7,a                        ; 02:72CE
    jr   nz,Code0272E9              ; 02:72D0
    cp   $10                        ; 02:72D2
    jr   c,Code0272D9               ; 02:72D4
    ld   a,$10                      ; 02:72D6
    ld   [hl],a                     ; 02:72D8
Code0272D9:
    ld   hl,W_SpriteYLow            ; 02:72D9
    add  hl,bc                      ; 02:72DC
    ld   a,[hl]                     ; 02:72DD
    cp   $D0                        ; 02:72DE
    jr   c,Code0272E9               ; 02:72E0
    ld   hl,$D195                   ; 02:72E2
    add  hl,bc                      ; 02:72E5
    ld   a,$01                      ; 02:72E6
    ld   [hl],a                     ; 02:72E8
Code0272E9:
    jp   Sub027290                  ; 02:72E9
Code0272EC:
    ldh  a,[<H_GlobalTimer]         ; 02:72EC
    and  $03                        ; 02:72EE
    jr   nz,Code0272F3              ; 02:72F0
    dec  [hl]                       ; 02:72F2
Code0272F3:
    ld   a,[hl]                     ; 02:72F3
    bit  7,a                        ; 02:72F4
    jr   z,Code02730E               ; 02:72F6
    cp   $F0                        ; 02:72F8
    jr   nc,Code0272FF              ; 02:72FA
    ld   a,$F0                      ; 02:72FC
    ld   [hl],a                     ; 02:72FE
Code0272FF:
    ld   hl,W_SpriteYLow            ; 02:72FF
    add  hl,bc                      ; 02:7302
    ld   a,[hl]                     ; 02:7303
    cp   $A0                        ; 02:7304
    jr   nc,Code02730E              ; 02:7306
    ld   hl,$D195                   ; 02:7308
    add  hl,bc                      ; 02:730B
    xor  a                          ; 02:730C
    ld   [hl],a                     ; 02:730D
Code02730E:
    jp   Sub027290                  ; 02:730E
Code027311:
    ld   hl,$D11D                   ; 02:7311
    add  hl,bc                      ; 02:7314
    ld   a,[hl]                     ; 02:7315
    bit  7,a                        ; 02:7316
    jr   nz,Code027355              ; 02:7318
    ld   hl,W_SpriteXSpeed          ; 02:731A
    add  hl,bc                      ; 02:731D
    add  [hl]                       ; 02:731E
    bit  7,a                        ; 02:731F
    jr   nz,Code027353              ; 02:7321
    cp   $0E                        ; 02:7323
    jr   c,Code027353               ; 02:7325
    ld   hl,$D1C2                   ; 02:7327
    add  hl,bc                      ; 02:732A
    ld   a,[hl]                     ; 02:732B
    ldh  [<$FF98],a                 ; 02:732C
    ld   hl,$D1B3                   ; 02:732E
    add  hl,bc                      ; 02:7331
    ld   a,[hl]                     ; 02:7332
    add  $18                        ; 02:7333
    ldh  [<$FF97],a                 ; 02:7335
    ldh  a,[<$FF98]                 ; 02:7337
    adc  $00                        ; 02:7339
    ldh  [<$FF98],a                 ; 02:733B
    ld   hl,W_SpriteXHigh           ; 02:733D
    add  hl,bc                      ; 02:7340
    push hl                         ; 02:7341
    ld   hl,W_SpriteXLow            ; 02:7342
    add  hl,bc                      ; 02:7345
    ldh  a,[<$FF97]                 ; 02:7346
    sub  [hl]                       ; 02:7348
    pop  hl                         ; 02:7349
    ldh  a,[<$FF98]                 ; 02:734A
    sbc  [hl]                       ; 02:734C
    bit  7,a                        ; 02:734D
    ld   a,$0E                      ; 02:734F
    jr   nz,Code02738E              ; 02:7351
Code027353:
    jr   Code027399                 ; 02:7353
Code027355:
    ld   hl,W_SpriteXSpeed          ; 02:7355
    add  hl,bc                      ; 02:7358
    add  [hl]                       ; 02:7359
    bit  7,a                        ; 02:735A
    jr   z,Code027399               ; 02:735C
    cp   $F2                        ; 02:735E
    jr   nc,Code027399              ; 02:7360
    ld   hl,$D1C2                   ; 02:7362
    add  hl,bc                      ; 02:7365
    ld   a,[hl]                     ; 02:7366
    ldh  [<$FF98],a                 ; 02:7367
    ld   hl,$D1B3                   ; 02:7369
    add  hl,bc                      ; 02:736C
    ld   a,[hl]                     ; 02:736D
    add  $10                        ; 02:736E
    ldh  [<$FF97],a                 ; 02:7370
    ldh  a,[<$FF98]                 ; 02:7372
    adc  $00                        ; 02:7374
    ldh  [<$FF98],a                 ; 02:7376
    ld   hl,W_SpriteXHigh           ; 02:7378
    add  hl,bc                      ; 02:737B
    push hl                         ; 02:737C
    ld   hl,W_SpriteXLow            ; 02:737D
    add  hl,bc                      ; 02:7380
    ldh  a,[<$FF97]                 ; 02:7381
    sub  [hl]                       ; 02:7383
    pop  hl                         ; 02:7384
    ldh  a,[<$FF98]                 ; 02:7385
    sbc  [hl]                       ; 02:7387
    bit  7,a                        ; 02:7388
    ld   a,$F2                      ; 02:738A
    jr   nz,Code027399              ; 02:738C
Code02738E:
    push af                         ; 02:738E
    ld   hl,$D11D                   ; 02:738F
    add  hl,bc                      ; 02:7392
    ld   a,[hl]                     ; 02:7393
    xor  $FF                        ; 02:7394
    inc  a                          ; 02:7396
    ld   [hl],a                     ; 02:7397
    pop  af                         ; 02:7398
Code027399:
    ld   e,a                        ; 02:7399
    ldh  a,[<H_GlobalTimer]         ; 02:739A
    and  $03                        ; 02:739C
    jr   nz,Code0273A5              ; 02:739E
    ld   hl,W_SpriteXSpeed          ; 02:73A0
    add  hl,bc                      ; 02:73A3
    ld   [hl],e                     ; 02:73A4
Code0273A5:
    jp   Sub027290                  ; 02:73A5
Code0273A8:
    call Sub027290                  ; 02:73A8
    ld   hl,W_SpriteXHigh           ; 02:73AB
    ld   a,[W_SubLvScreenCount]     ; 02:73AE
    cp   [hl]                       ; 02:73B1
    jr   nz,Code0273B7              ; 02:73B2
    call Sub0029EF                  ; 02:73B4
Code0273B7:
    ld   hl,$D12C                   ; 02:73B7
    add  hl,bc                      ; 02:73BA
    ld   a,[hl]                     ; 02:73BB
    and  a                          ; 02:73BC
    jr   nz,Code0273C7              ; 02:73BD
    ld   a,[$C26B]                  ; 02:73BF
    and  a                          ; 02:73C2
    jr   z,Return0273D5             ; 02:73C3
    ld   [hl],$01                   ; 02:73C5
Code0273C7:
    ld   hl,W_SpriteXSpeed          ; 02:73C7
    add  hl,bc                      ; 02:73CA
    ld   a,[hl]                     ; 02:73CB
    add  $01                        ; 02:73CC
    cp   $10                        ; 02:73CE
    jr   c,Code0273D4               ; 02:73D0
    ld   a,$10                      ; 02:73D2
Code0273D4:
    ld   [hl],a                     ; 02:73D4
Return0273D5:
    ret                             ; 02:73D5

Code0273D6:
    ldh  a,[<$FFAC]                 ; 02:73D6
    push af                         ; 02:73D8
    call Sub027290                  ; 02:73D9
    pop  af                         ; 02:73DC
    ld   l,a                        ; 02:73DD
    ldh  a,[<$FFAC]                 ; 02:73DE
    cp   $20                        ; 02:73E0
    jr   z,Code0273E7               ; 02:73E2
    ld   a,l                        ; 02:73E4
    ldh  [<$FFAC],a                 ; 02:73E5
Code0273E7:
    ld   hl,$D13B                   ; 02:73E7
    add  hl,bc                      ; 02:73EA
    ld   a,[hl]                     ; 02:73EB
    ld   hl,$D096                   ; 02:73EC
    add  hl,bc                      ; 02:73EF
    and  a                          ; 02:73F0
    jr   nz,Code02740F              ; 02:73F1
    ld   a,[hl]                     ; 02:73F3
    dec  [hl]                       ; 02:73F4
    and  a                          ; 02:73F5
    jr   z,Code0273FF               ; 02:73F6
    ld   a,$01                      ; 02:73F8
    ld   [$C26B],a                  ; 02:73FA
    jr   Code027411                 ; 02:73FD
Code0273FF:
    ld   [hl],$00                   ; 02:73FF
    ld   hl,W_SpriteYSpeed          ; 02:7401
    add  hl,bc                      ; 02:7404
    ld   [hl],$00                   ; 02:7405
    ld   hl,$D087                   ; 02:7407
    add  hl,bc                      ; 02:740A
    ld   [hl],$00                   ; 02:740B
    jr   Return02741D               ; 02:740D
Code02740F:
    ld   [hl],$04                   ; 02:740F
Code027411:
    ld   hl,W_SpriteYSpeed          ; 02:7411
    add  hl,bc                      ; 02:7414
    ld   a,[hl]                     ; 02:7415
    cp   $20                        ; 02:7416
    jr   nc,Return02741D            ; 02:7418
    add  $04                        ; 02:741A
    ld   [hl],a                     ; 02:741C
Return02741D:
    ret                             ; 02:741D

Sub02741E:
    ld   e,$00                      ; 02:741E
    ld   hl,W_SpriteID              ; 02:7420
    add  hl,bc                      ; 02:7423
    ld   a,[hl]                     ; 02:7424
    cp   $5A                        ; 02:7425
    jr   z,Code02742D               ; 02:7427
    cp   $5F                        ; 02:7429
    jr   nz,Code027440              ; 02:742B
Code02742D:
    ld   a,[W_PlayerSize]           ; 02:742D
    and  a                          ; 02:7430
    jr   z,Code027440               ; 02:7431
    ldh  a,[<$FFAB]                 ; 02:7433
    bit  7,a                        ; 02:7435
    jr   z,Code02743B               ; 02:7437
    cpl                             ; 02:7439
    inc  a                          ; 02:743A
Code02743B:
    cp   $24                        ; 02:743B
    jr   c,Code027440               ; 02:743D
    inc  e                          ; 02:743F
Code027440:
    push de                         ; 02:7440
    call Sub001FC9                  ; 02:7441
    pop  de                         ; 02:7444
    ret                             ; 02:7445

Data027446:                         ; 02:7446
.db $18,$19,$18,$18,$18,$18,$18,$18,\
    $18,$18,$18,$18,$18,$18,$18,$18,\
    $18,$18,$18,$18,$18,$18

Sub02745C:
    ld   a,[$D2E4]                  ; 02:745C
    and  a                          ; 02:745F
    jp   nz,Code0274D8              ; 02:7460
    ld   hl,$D13B                   ; 02:7463
    add  hl,bc                      ; 02:7466
    ld   [hl],$00                   ; 02:7467
    call Sub02741E                  ; 02:7469
    jp   nc,Return02755F            ; 02:746C
    cp   $01                        ; 02:746F
    jr   z,Code0274D8               ; 02:7471
    cp   $02                        ; 02:7473
    jr   z,Code0274A4               ; 02:7475
    ld   a,e                        ; 02:7477
    and  a                          ; 02:7478
    jr   z,Code02748C               ; 02:7479
    ld   hl,W_SpriteXLow            ; 02:747B
    add  hl,bc                      ; 02:747E
    ldh  a,[<H_PlayerXLow]          ; 02:747F
    sub  [hl]                       ; 02:7481
    cp   $2C                        ; 02:7482
    jp   c,Return02755F             ; 02:7484
    cp   $F4                        ; 02:7487
    jp   c,Return02755F             ; 02:7489
Code02748C:
    nop                             ; 02:748C
    ld   a,[$C1CA]                  ; 02:748D
    ldh  [<H_PlayerXLow],a          ; 02:7490
    ld   a,[$C1CB]                  ; 02:7492
    ldh  [<H_PlayerXHigh],a         ; 02:7495
    ld   a,[$C27B]                  ; 02:7497
    ldh  [<H_CameraXLow],a          ; 02:749A
    ld   a,[$C27C]                  ; 02:749C
    ldh  [<H_CameraXHigh],a         ; 02:749F
    jp   Return02755F               ; 02:74A1
Code0274A4:
    ld   a,e                        ; 02:74A4
    and  a                          ; 02:74A5
    jp   nz,Return02755F            ; 02:74A6
    ldh  a,[<$FFAC]                 ; 02:74A9
    bit  7,a                        ; 02:74AB
    jp   z,Return02755F             ; 02:74AD
    ld   a,$20                      ; 02:74B0
    ldh  [<$FFAC],a                 ; 02:74B2
    ld   a,[$C27D]                  ; 02:74B4
    ldh  [<H_CameraY],a             ; 02:74B7
    ld   a,[$C27E]                  ; 02:74B9
    ldh  [<$FFBB],a                 ; 02:74BC
    ld   a,[$C1CC]                  ; 02:74BE
    ldh  [<H_PlayerYLow],a          ; 02:74C1
    ld   a,[$C1CD]                  ; 02:74C3
    ldh  [<H_PlayerYHigh],a         ; 02:74C6
    ldh  a,[<H_PlInitY_SubLvType]   ; 02:74C8
    and  $0F                        ; 02:74CA
    cp   $02                        ; 02:74CC
    jp   nz,Return02755F            ; 02:74CE
    ld   a,$10                      ; 02:74D1
    ldh  [<$FFAC],a                 ; 02:74D3
    jp   Return02755F               ; 02:74D5
Code0274D8:
    ldh  a,[<$FFAC]                 ; 02:74D8
    bit  7,a                        ; 02:74DA
    jp   nz,Return02755F            ; 02:74DC
    xor  a                          ; 02:74DF
    ld   [$C1FA],a                  ; 02:74E0
    ld   a,$01                      ; 02:74E3
    ld   [$C26B],a                  ; 02:74E5
    ld   [$D2E4],a                  ; 02:74E8
    ld   hl,$D13B                   ; 02:74EB
    add  hl,bc                      ; 02:74EE
    ld   [hl],a                     ; 02:74EF
    ld   a,[W_PlayerState]          ; 02:74F0
    cp   $16                        ; 02:74F3
    jr   z,Code0274FB               ; 02:74F5
    cp   $0F                        ; 02:74F7
    jr   nz,Code027500              ; 02:74F9
Code0274FB:
    ld   a,$00                      ; 02:74FB
    ld   [W_PlayerState],a          ; 02:74FD
Code027500:
    ld   a,[$C27D]                  ; 02:7500
    ldh  [<H_CameraY],a             ; 02:7503
    ld   a,[$C27E]                  ; 02:7505
    ldh  [<$FFBB],a                 ; 02:7508
    ld   hl,W_SpriteSubstate        ; 02:750A
    add  hl,bc                      ; 02:750D
    ld   a,[hl]                     ; 02:750E
    sla  a                          ; 02:750F
    ld   e,a                        ; 02:7511
    ld   d,$00                      ; 02:7512
    ld   hl,W_SpriteYSpeed          ; 02:7514
    add  hl,bc                      ; 02:7517
    ld   a,[hl]                     ; 02:7518
    bit  7,a                        ; 02:7519
    jr   z,Code02751E               ; 02:751B
    inc  e                          ; 02:751D
Code02751E:
    ld   hl,Data027446              ; 02:751E
    add  hl,de                      ; 02:7521
    ld   a,[hl]                     ; 02:7522
    ldh  [<$FF97],a                 ; 02:7523
    ld   hl,W_SpriteYHigh           ; 02:7525
    add  hl,bc                      ; 02:7528
    push hl                         ; 02:7529
    ld   hl,W_SpriteYLow            ; 02:752A
    add  hl,bc                      ; 02:752D
    ld   a,[hl]                     ; 02:752E
    ld   hl,$FF97                   ; 02:752F
    sub  [hl]                       ; 02:7532
    ldh  [<H_PlayerYLow],a          ; 02:7533
    pop  hl                         ; 02:7535
    ld   a,[hl]                     ; 02:7536
    sbc  $00                        ; 02:7537
    ldh  [<H_PlayerYHigh],a         ; 02:7539
    xor  a                          ; 02:753B
    ldh  [<$FF98],a                 ; 02:753C
    ld   hl,W_SpriteXLow            ; 02:753E
    add  hl,bc                      ; 02:7541
    ld   a,[hl]                     ; 02:7542
    ld   hl,$D2E0                   ; 02:7543
    sub  [hl]                       ; 02:7546
    ldh  [<$FF97],a                 ; 02:7547
    bit  7,a                        ; 02:7549
    jr   z,Code027551               ; 02:754B
    ld   a,$FF                      ; 02:754D
    ldh  [<$FF98],a                 ; 02:754F
Code027551:
    ld   hl,H_PlayerXLow            ; 02:7551
    ldh  a,[<$FF97]                 ; 02:7554
    add  [hl]                       ; 02:7556
    ld   [hl],a                     ; 02:7557
    ld   hl,H_PlayerXHigh           ; 02:7558
    ldh  a,[<$FF98]                 ; 02:755B
    adc  [hl]                       ; 02:755D
    ld   [hl],a                     ; 02:755E
Return02755F:
    ret                             ; 02:755F

SubL_027560:
    ld   a,$1D                      ; 02:7560
    call LoadSpriteAnySlot          ; 02:7562
    jr   c,ReturnL_0275D1           ; 02:7565
    ld   bc,$0004                   ; 02:7567
    ld   hl,$C221                   ; 02:756A
    add  hl,bc                      ; 02:756D
    ld   a,[hl]                     ; 02:756E
    ld   hl,$D1B3                   ; 02:756F
    add  hl,de                      ; 02:7572
    ld   [hl],a                     ; 02:7573
    ld   hl,W_SpriteXLow            ; 02:7574
    add  hl,de                      ; 02:7577
    ldh  a,[<$FF97]                 ; 02:7578
    ld   [hl],a                     ; 02:757A
    ld   hl,W_SpriteXHigh           ; 02:757B
    add  hl,de                      ; 02:757E
    ldh  a,[<$FF98]                 ; 02:757F
    ld   [hl],a                     ; 02:7581
    ld   hl,W_SpriteYLow            ; 02:7582
    add  hl,de                      ; 02:7585
    ldh  a,[<$FF99]                 ; 02:7586
    ld   [hl],a                     ; 02:7588
    ld   hl,$D12C                   ; 02:7589
    add  hl,de                      ; 02:758C
    ld   [hl],a                     ; 02:758D
    ld   hl,$D0FF                   ; 02:758E
    add  hl,de                      ; 02:7591
    ldh  a,[<$FF9F]                 ; 02:7592
    ld   [hl],a                     ; 02:7594
    ld   hl,$D13B                   ; 02:7595
    add  hl,de                      ; 02:7598
    ldh  a,[<$FF9D]                 ; 02:7599
    ld   [hl],a                     ; 02:759B
    ld   hl,$D14A                   ; 02:759C
    add  hl,de                      ; 02:759F
    ldh  a,[<$FF9E]                 ; 02:75A0
    ld   [hl],a                     ; 02:75A2
    ld   hl,W_SpriteYSpeed          ; 02:75A3
    add  hl,de                      ; 02:75A6
    ld   [hl],$E0                   ; 02:75A7
    ld   hl,$D177                   ; 02:75A9
    add  hl,de                      ; 02:75AC
    ldh  a,[<$FFA3]                 ; 02:75AD
    sla  a                          ; 02:75AF
    sla  a                          ; 02:75B1
    ld   [hl],a                     ; 02:75B3
    ld   hl,$D159                   ; 02:75B4
    add  hl,de                      ; 02:75B7
    ld   a,[$D2E4]                  ; 02:75B8
    ld   [hl],a                     ; 02:75BB
    ld   hl,W_SpriteSubstate        ; 02:75BC
    add  hl,de                      ; 02:75BF
    ld   a,[$D2E5]                  ; 02:75C0
    ld   [hl],a                     ; 02:75C3
    ld   a,[$D2E4]                  ; 02:75C4
    ldh  [<$FF9B],a                 ; 02:75C7
    and  a                          ; 02:75C9
    jr   nz,ReturnL_0275D1          ; 02:75CA
    push de                         ; 02:75CC
    call Sub024797                  ; 02:75CD
    pop  de                         ; 02:75D0
ReturnL_0275D1:
    rst  $18                        ; 02:75D1  Return from 24-bit call

Data0275D2:                         ; 02:75D2
.db $80,$01,$82,$01,$88,$01,$8A,$01,\
    $80,$01,$82,$01,$88,$07,$8A,$07
Data0275E2:                         ; 02:75E2
.db $24,$7A

Spr1D_Main:
; sprite 1D main
    call Sub0025CB                  ; 02:75E4
    jp   c,Code027696               ; 02:75E7
    call Sub0245DF                  ; 02:75EA
    call Sub024775                  ; 02:75ED
    jp   nc,Code027696              ; 02:75F0
    ld   hl,$D159                   ; 02:75F3
    add  hl,bc                      ; 02:75F6
    ld   a,[hl]                     ; 02:75F7
    and  a                          ; 02:75F8
    jr   z,Code02761F               ; 02:75F9
    ld   hl,W_SpriteXLow            ; 02:75FB
    add  hl,bc                      ; 02:75FE
    ld   a,[hl]                     ; 02:75FF
    ldh  [<$FF97],a                 ; 02:7600
    ld   hl,W_SpriteXHigh           ; 02:7602
    add  hl,bc                      ; 02:7605
    ld   a,[hl]                     ; 02:7606
    ldh  [<$FF99],a                 ; 02:7607
    ld   hl,W_SpriteYLow            ; 02:7609
    add  hl,bc                      ; 02:760C
    ld   a,[hl]                     ; 02:760D
    ldh  [<$FF98],a                 ; 02:760E
    ld   hl,W_SpriteSubstate        ; 02:7610
    add  hl,bc                      ; 02:7613
    ld   a,[hl]                     ; 02:7614
    push af                         ; 02:7615
    push hl                         ; 02:7616
    ld   [hl],$09                   ; 02:7617
    call Sub0248B5                  ; 02:7619
    pop  hl                         ; 02:761C
    pop  af                         ; 02:761D
    ld   [hl],a                     ; 02:761E
Code02761F:
    xor  a                          ; 02:761F
    ld   hl,W_SpriteStatus          ; 02:7620
    add  hl,bc                      ; 02:7623
    ld   [hl],a                     ; 02:7624
    ld   hl,W_SpriteID              ; 02:7625
    add  hl,bc                      ; 02:7628
    ld   [hl],a                     ; 02:7629
    ld   hl,W_SpriteXLow            ; 02:762A
    add  hl,bc                      ; 02:762D
    ld   a,[hl]                     ; 02:762E
    ldh  [<$FF97],a                 ; 02:762F
    ld   hl,W_SpriteYLow            ; 02:7631
    add  hl,bc                      ; 02:7634
    ld   a,[hl]                     ; 02:7635
    ldh  [<$FF98],a                 ; 02:7636
    ld   hl,W_SpriteXHigh           ; 02:7638
    add  hl,bc                      ; 02:763B
    ld   a,[hl]                     ; 02:763C
    ldh  [<$FF99],a                 ; 02:763D
    ld   de,$0002                   ; 02:763F
    ldh  a,[<H_PlInitY_SubLvType]   ; 02:7642
    and  $0F                        ; 02:7644
    cp   $01                        ; 02:7646
    jr   nz,Code027657              ; 02:7648
    ld   de,$008C                   ; 02:764A
    ld   hl,$D177                   ; 02:764D
    add  hl,bc                      ; 02:7650
    ld   a,[hl]                     ; 02:7651
    and  a                          ; 02:7652
    jr   nz,Code02766D              ; 02:7653
    jr   Code02765F                 ; 02:7655
Code027657:
    ld   hl,$D177                   ; 02:7657
    add  hl,bc                      ; 02:765A
    ld   a,[hl]                     ; 02:765B
    and  a                          ; 02:765C
    jr   nz,Code02768B              ; 02:765D
Code02765F:
    ld   hl,W_SpriteSubstate        ; 02:765F
    add  hl,bc                      ; 02:7662
    ld   e,[hl]                     ; 02:7663
    ld   d,$00                      ; 02:7664
    ld   hl,Data0275E2              ; 02:7666
    add  hl,de                      ; 02:7669
    ld   e,[hl]                     ; 02:766A
    ld   d,$00                      ; 02:766B
Code02766D:
    push de                         ; 02:766D
    ld   hl,$D0FF                   ; 02:766E
    add  hl,bc                      ; 02:7671
    ld   a,[hl]                     ; 02:7672
    ldh  [<$FFA6],a                 ; 02:7673
    ld   hl,$D13B                   ; 02:7675
    add  hl,bc                      ; 02:7678
    ld   a,[hl]                     ; 02:7679
    ld   e,a                        ; 02:767A
    ld   hl,$D14A                   ; 02:767B
    add  hl,bc                      ; 02:767E
    ld   a,[hl]                     ; 02:767F
    ld   h,a                        ; 02:7680
    ld   l,e                        ; 02:7681
    pop  de                         ; 02:7682
    ldh  a,[<$FFA6]                 ; 02:7683
    ldh  [<SVBK],a                  ; 02:7685
    ld   [hl],e                     ; 02:7687
    xor  a                          ; 02:7688
    ldh  [<SVBK],a                  ; 02:7689
Code02768B:
    call Sub0246D7                  ; 02:768B
    jr   c,Return027695             ; 02:768E
    ld   a,$02                      ; 02:7690
    call Sub001124                  ; 02:7692
Return027695:
    ret                             ; 02:7695

Code027696:
    ld   hl,$D177                   ; 02:7696
    add  hl,bc                      ; 02:7699
    ld   e,[hl]                     ; 02:769A
    ld   d,$00                      ; 02:769B
    ldh  a,[<H_PlInitY_SubLvType]   ; 02:769D
    and  $0F                        ; 02:769F
    cp   $01                        ; 02:76A1
    jr   nz,Code0276A7              ; 02:76A3
    set  3,e                        ; 02:76A5
Code0276A7:
    ld   hl,Data0275D2              ; 02:76A7
    add  hl,de                      ; 02:76AA
    call Disp16x16Sprite            ; 02:76AB
    ret                             ; 02:76AE

SubL_0276AF:
    call Sub0276B3                  ; 02:76AF
    rst  $18                        ; 02:76B2  Return from 24-bit call

Sub0276B3:
; subroutine: Spawn score sprite into free sprite slot
; $FF97: sprite X position (16-bit)
; $FF99: sprite Y position (8-bit)
; $FF9B: score sprite type
    ld   a,[W_GameMode]             ; 02:76B3
    cp   $07                        ; 02:76B6
    jr   z,@Return                  ; 02:76B8
    cp   $02                        ; 02:76BA
    jr   z,@Return                  ; 02:76BC
    ld   a,$1E                      ; 02:76BE  1E: score sprite
    call LoadSpriteAnySlot          ; 02:76C0
    jr   c,@Return                  ; 02:76C3  if no slot found, return
    ld   hl,W_SpriteXLow            ; 02:76C5
    add  hl,de                      ; 02:76C8
    push hl                         ; 02:76C9
    ld   hl,H_CameraXLow            ; 02:76CA
    ldh  a,[<$FF97]                 ; 02:76CD
    sub  [hl]                       ; 02:76CF
    pop  hl                         ; 02:76D0
    ld   [hl],a                     ; 02:76D1
    ld   hl,H_CameraXHigh           ; 02:76D2
    ldh  a,[<$FF98]                 ; 02:76D5
    sbc  [hl]                       ; 02:76D7
    ld   hl,W_SpriteXHigh           ; 02:76D8
    add  hl,de                      ; 02:76DB
    ld   [hl],a                     ; 02:76DC
    ld   hl,W_SpriteYLow            ; 02:76DD
    add  hl,de                      ; 02:76E0
    ldh  a,[<$FF99]                 ; 02:76E1
    sub  $18                        ; 02:76E3
    ld   [hl],a                     ; 02:76E5  set sprite Y to $FF99, -18
    ld   hl,$D177                   ; 02:76E6
    add  hl,de                      ; 02:76E9
    ldh  a,[<$FF9B]                 ; 02:76EA
    ld   [hl],a                     ; 02:76EC  set score sprite type to $FF9B
    ld   hl,W_SpriteYSpeed          ; 02:76ED
    add  hl,de                      ; 02:76F0
    ld   [hl],$F0                   ; 02:76F1  set sprite Y velocity to F0
    ld   hl,$D096                   ; 02:76F3
    add  hl,de                      ; 02:76F6
    ld   [hl],$30                   ; 02:76F7  set sprite ??? to 30
@Return:
    ret                             ; 02:76F9

ScoreSpr_Tilemap:                   ; 02:76FA
.db $B0,$00,$BA,$00,\               ;          100
    $B2,$00,$BA,$00,\               ;          200
    $B4,$00,$BA,$00,\               ;          400
    $B6,$00,$BA,$00,\               ;          500
    $B8,$00,$BA,$00,\               ;          800
    $B0,$00,$BC,$00,\               ;          1000
    $B2,$00,$BC,$00,\               ;          2000
    $B4,$00,$BC,$00,\               ;          4000
    $B6,$00,$BC,$00,\               ;          5000
    $B8,$00,$BC,$00,\               ;          8000
    $BE,$00,$C0,$00,\               ;          1UP
    $B0,$00,$BC,$00                 ;          10000
ScoreSpr_10000ExtraTile:            ; 02:772A
.db $BA,$00

Spr1E_Main:
; sprite 1E main
    call Sub001A79                  ; 02:772C
    ld   hl,$D096                   ; 02:772F
    add  hl,bc                      ; 02:7732
    ld   a,[hl]                     ; 02:7733
    sub  $01                        ; 02:7734
    ld   [hl],a                     ; 02:7736
    jr   nz,Code027746              ; 02:7737
    ld   hl,W_SpriteStatus          ; 02:7739
    add  hl,bc                      ; 02:773C
    ld   [hl],$00                   ; 02:773D
    ld   hl,W_SpriteID              ; 02:773F
    add  hl,bc                      ; 02:7742
    ld   [hl],$00                   ; 02:7743
    ret                             ; 02:7745

Code027746:
    ld   hl,W_SpriteYLow            ; 02:7746
    add  hl,bc                      ; 02:7749
    ld   a,[hl]                     ; 02:774A
    push af                         ; 02:774B
    ld   hl,H_CameraY               ; 02:774C
    cp   [hl]                       ; 02:774F
    jr   nc,Code027759              ; 02:7750
    ldh  a,[<H_CameraY]             ; 02:7752
    ld   hl,W_SpriteYLow            ; 02:7754
    add  hl,bc                      ; 02:7757
    ld   [hl],a                     ; 02:7758
Code027759:
    ld   hl,$D177                   ; 02:7759
    add  hl,bc                      ; 02:775C
    ld   a,[hl]                     ; 02:775D  score sprite type
    push af                         ; 02:775E
    sla  a                          ; 02:775F
    sla  a                          ; 02:7761
    ld   e,a                        ; 02:7763
    ld   d,$00                      ; 02:7764  de = score sprite type *4
    ld   hl,ScoreSpr_Tilemap        ; 02:7766
    add  hl,de                      ; 02:7769  hl = pointer to OAM attributes
    call Disp16x16Sprite            ; 02:776A
    pop  af                         ; 02:776D  a = score sprite type
    cp   $0B                        ; 02:776E
    jr   nz,Code027798              ; 02:7770
    ld   hl,W_SpriteXHigh           ; 02:7772
    add  hl,bc                      ; 02:7775
    push hl                         ; 02:7776
    ld   a,[hl]                     ; 02:7777
    push af                         ; 02:7778
    ld   e,a                        ; 02:7779
    ld   hl,W_SpriteXLow            ; 02:777A
    add  hl,bc                      ; 02:777D
    push hl                         ; 02:777E
    ld   a,[hl]                     ; 02:777F
    push af                         ; 02:7780
    add  $10                        ; 02:7781
    ld   [hl],a                     ; 02:7783
    ld   a,$00                      ; 02:7784
    adc  e                          ; 02:7786
    ld   hl,W_SpriteXHigh           ; 02:7787
    add  hl,bc                      ; 02:778A
    ld   [hl],a                     ; 02:778B
    ld   hl,ScoreSpr_10000ExtraTile ; 02:778C
    call Sub002893                  ; 02:778F
    pop  af                         ; 02:7792
    pop  hl                         ; 02:7793
    ld   [hl],a                     ; 02:7794
    pop  af                         ; 02:7795
    pop  hl                         ; 02:7796
    ld   [hl],a                     ; 02:7797
Code027798:
    pop  af                         ; 02:7798
    ld   hl,W_SpriteYLow            ; 02:7799
    add  hl,bc                      ; 02:779C
    ld   [hl],a                     ; 02:779D
    ret                             ; 02:779E

Sub02779F:
    push bc                         ; 02:779F
    ld   a,$20                      ; 02:77A0
    call LoadSpriteAnySlot          ; 02:77A2
    jr   c,Code027804               ; 02:77A5
    ld   a,$27                      ; 02:77A7
    ldh  [<$FFF3],a                 ; 02:77A9
    ld   hl,W_SpriteXLow            ; 02:77AB
    add  hl,de                      ; 02:77AE
    ldh  a,[<$FF97]                 ; 02:77AF
    ld   [hl],a                     ; 02:77B1
    ld   hl,W_SpriteXHigh           ; 02:77B2
    add  hl,de                      ; 02:77B5
    ldh  a,[<$FF99]                 ; 02:77B6
    ld   [hl],a                     ; 02:77B8
    ld   hl,W_SpriteYLow            ; 02:77B9
    add  hl,de                      ; 02:77BC
    ldh  a,[<$FF98]                 ; 02:77BD
    and  a                          ; 02:77BF
    jr   z,Code0277C4               ; 02:77C0
    sub  $05                        ; 02:77C2
Code0277C4:
    ld   [hl],a                     ; 02:77C4
    ld   hl,$D1D1                   ; 02:77C5
    add  hl,de                      ; 02:77C8
    ld   [hl],a                     ; 02:77C9
    ld   hl,W_SpriteYSpeed          ; 02:77CA
    add  hl,de                      ; 02:77CD
    ld   [hl],$F8                   ; 02:77CE
    ld   hl,W_AlbumUnlockFlags      ; 02:77D0
    set  0,[hl]                     ; 02:77D3
    ld   a,[$C28D]                  ; 02:77D5
    and  a                          ; 02:77D8
    jr   nz,Code027804              ; 02:77D9
    ld   a,[$C25F]                  ; 02:77DB
    and  a                          ; 02:77DE
    jr   nz,Code027804              ; 02:77DF
    ld   hl,H_CameraY               ; 02:77E1
    ld   a,[hl]                     ; 02:77E4
    cp   $38                        ; 02:77E5
    jr   c,Code027804               ; 02:77E7
    cp   $70                        ; 02:77E9
    jr   nc,Code027804              ; 02:77EB
    ldh  a,[<H_PlayerYLow]          ; 02:77ED
    sub  [hl]                       ; 02:77EF
    ld   e,a                        ; 02:77F0
    ld   hl,$FFBB                   ; 02:77F1
    ldh  a,[<H_PlayerYHigh]         ; 02:77F4
    sbc  [hl]                       ; 02:77F6
    and  a                          ; 02:77F7
    jr   z,Code0277FF               ; 02:77F8
    ld   a,e                        ; 02:77FA
    cp   $EE                        ; 02:77FB
    jr   c,Code027804               ; 02:77FD
Code0277FF:
    ld   a,$01                      ; 02:77FF
    ld   [$C28D],a                  ; 02:7801
Code027804:
    pop  bc                         ; 02:7804
    ret                             ; 02:7805

SubL_027806:
    ldh  a,[<H_PlayerXLow]          ; 02:7806
    add  $0A                        ; 02:7808
    ldh  [<$FF97],a                 ; 02:780A
    ldh  a,[<H_PlayerXHigh]         ; 02:780C
    adc  $00                        ; 02:780E
    ldh  [<$FF99],a                 ; 02:7810
    ldh  a,[<H_PlayerYLow]          ; 02:7812
    ldh  [<$FF98],a                 ; 02:7814
    call Sub02779F                  ; 02:7816
    ldh  a,[<H_PlayerYHigh]         ; 02:7819
    ld   hl,W_SpriteYHigh           ; 02:781B
    add  hl,de                      ; 02:781E
    ld   [hl],a                     ; 02:781F
    ld   hl,$D1E0                   ; 02:7820
    add  hl,de                      ; 02:7823
    ld   [hl],a                     ; 02:7824
    ld   hl,W_SpriteSubstate        ; 02:7825
    add  hl,de                      ; 02:7828
    ld   a,$02                      ; 02:7829
    ld   [hl],a                     ; 02:782B
    rst  $18                        ; 02:782C  Return from 24-bit call

Data02782D:                         ; 02:782D
.db $2E,$8F,$30,$8F
Data027831:                         ; 02:7831
.db $32,$8F,$34,$8F

VineSpr_Main:
; sprite 20 main
    call Sub0025CB                  ; 02:7835
    jp   c,Code02783E               ; 02:7838
    call Sub0278AC                  ; 02:783B
Code02783E:
    ld   hl,Data02782D              ; 02:783E
    call Disp16x16Sprite            ; 02:7841
    ld   hl,$D1E0                   ; 02:7844
    add  hl,bc                      ; 02:7847
    ld   a,[hl]                     ; 02:7848
    ld   e,a                        ; 02:7849
    ld   hl,W_SpriteYHigh           ; 02:784A
    add  hl,bc                      ; 02:784D
    ld   a,[hl]                     ; 02:784E
    ld   [$D2E3],a                  ; 02:784F
    ld   hl,W_SpriteYLow            ; 02:7852
    add  hl,bc                      ; 02:7855
    ld   a,[hl]                     ; 02:7856
    ld   [$D2E2],a                  ; 02:7857
    push hl                         ; 02:785A
    ld   hl,$D1D1                   ; 02:785B
    add  hl,bc                      ; 02:785E
    ld   a,[hl]                     ; 02:785F
    pop  hl                         ; 02:7860
    sub  [hl]                       ; 02:7861
    ld   [$D2E4],a                  ; 02:7862
    ld   hl,$D2E3                   ; 02:7865
    ld   a,e                        ; 02:7868
    sbc  [hl]                       ; 02:7869
    ld   [$D2E5],a                  ; 02:786A
Code02786D:
    ld   a,[$D2E4]                  ; 02:786D
    sub  $10                        ; 02:7870
    ld   [$D2E4],a                  ; 02:7872
    ld   a,[$D2E5]                  ; 02:7875
    sbc  $00                        ; 02:7878
    ld   [$D2E5],a                  ; 02:787A
    bit  7,a                        ; 02:787D
    jr   nz,Return0278AB            ; 02:787F
    ld   a,[$D2E2]                  ; 02:7881
    add  $10                        ; 02:7884
    ld   [$D2E2],a                  ; 02:7886
    ldh  [<$FF97],a                 ; 02:7889
    ld   a,[$D2E3]                  ; 02:788B
    adc  $00                        ; 02:788E
    ld   [$D2E3],a                  ; 02:7890
    ldh  [<$FF9B],a                 ; 02:7893
    ld   hl,W_SpriteXLow            ; 02:7895
    add  hl,bc                      ; 02:7898
    ld   a,[hl]                     ; 02:7899
    ldh  [<$FF98],a                 ; 02:789A
    ld   hl,W_SpriteXHigh           ; 02:789C
    add  hl,bc                      ; 02:789F
    ld   a,[hl]                     ; 02:78A0
    ldh  [<$FF99],a                 ; 02:78A1
    ld   hl,Data027831              ; 02:78A3
    call Sub002769                  ; 02:78A6
    jr   Code02786D                 ; 02:78A9
Return0278AB:
    ret                             ; 02:78AB

Sub0278AC:
    ld   hl,W_SpriteSubstate        ; 02:78AC
    add  hl,bc                      ; 02:78AF
    ld   a,[hl]                     ; 02:78B0
    rst  $00                        ; 02:78B1  Execute from 16-bit pointer table
.dw Code0278BA                      ; 02:78B2
.dw Code0278F5                      ; 02:78B4
.dw Code0278BA                      ; 02:78B6
.dw Code0279DA                      ; 02:78B8

Code0278BA:
    call Sub001A79                  ; 02:78BA
    ld   hl,W_SpriteSubstate        ; 02:78BD
    add  hl,bc                      ; 02:78C0
    ld   a,[hl]                     ; 02:78C1
    and  a                          ; 02:78C2
    jr   z,Code0278DF               ; 02:78C3
    ld   hl,W_SpriteYHigh           ; 02:78C5
    add  hl,bc                      ; 02:78C8
    ld   a,[hl]                     ; 02:78C9
    and  a                          ; 02:78CA
    ret  nz                         ; 02:78CB
    ld   hl,W_SpriteYLow            ; 02:78CC
    add  hl,bc                      ; 02:78CF
    ld   a,[hl]                     ; 02:78D0
    cp   $B0                        ; 02:78D1
    jr   nc,Return0278DE            ; 02:78D3
    ld   hl,W_SpriteSubstate        ; 02:78D5
    add  hl,bc                      ; 02:78D8
    inc  [hl]                       ; 02:78D9
    ld   hl,W_PlayerWarpSubstate    ; 02:78DA
    inc  [hl]                       ; 02:78DD
Return0278DE:
    ret                             ; 02:78DE

Code0278DF:
    ld   hl,W_SpriteYHigh           ; 02:78DF
    add  hl,bc                      ; 02:78E2
    ld   a,[hl]                     ; 02:78E3
    and  a                          ; 02:78E4
    jr   z,Code0278F5               ; 02:78E5
    ld   hl,W_SpriteYLow            ; 02:78E7
    add  hl,bc                      ; 02:78EA
    ld   a,[hl]                     ; 02:78EB
    cp   $F8                        ; 02:78EC
    jr   nc,Code0278F5              ; 02:78EE
    ld   hl,W_SpriteSubstate        ; 02:78F0
    add  hl,bc                      ; 02:78F3
    inc  [hl]                       ; 02:78F4
Code0278F5:
    ld   hl,W_SpriteYHigh           ; 02:78F5
    add  hl,bc                      ; 02:78F8
    ld   a,[hl]                     ; 02:78F9
    ld   [$D2E3],a                  ; 02:78FA
    push hl                         ; 02:78FD
    ld   hl,W_SpriteYLow            ; 02:78FE
    add  hl,bc                      ; 02:7901
    ld   a,[hl]                     ; 02:7902
    ld   [$D2E2],a                  ; 02:7903
    add  $10                        ; 02:7906
    ld   [hl],a                     ; 02:7908
    pop  hl                         ; 02:7909
    ld   a,[hl]                     ; 02:790A
    adc  $00                        ; 02:790B
    ld   [hl],a                     ; 02:790D
    ld   hl,W_SpriteYLow            ; 02:790E
    add  hl,bc                      ; 02:7911
    push hl                         ; 02:7912
    ld   hl,$D1D1                   ; 02:7913
    add  hl,bc                      ; 02:7916
    ld   a,[hl]                     ; 02:7917
    pop  hl                         ; 02:7918
    sub  [hl]                       ; 02:7919
    cp   $E0                        ; 02:791A
    jr   nc,Code02792F              ; 02:791C
    srl  a                          ; 02:791E
    ldh  [<$FF98],a                 ; 02:7920
    ldh  [<$FF9A],a                 ; 02:7922
    ld   a,$07                      ; 02:7924
    ldh  [<$FF97],a                 ; 02:7926
    ld   a,$02                      ; 02:7928
    ldh  [<$FF99],a                 ; 02:792A
    call Sub001D9F                  ; 02:792C
Code02792F:
    push af                         ; 02:792F
    ld   hl,W_SpriteYLow            ; 02:7930
    add  hl,bc                      ; 02:7933
    ld   a,[$D2E2]                  ; 02:7934
    ld   [hl],a                     ; 02:7937
    ld   hl,W_SpriteYHigh           ; 02:7938
    add  hl,bc                      ; 02:793B
    ld   a,[$D2E3]                  ; 02:793C
    ld   [hl],a                     ; 02:793F
    pop  af                         ; 02:7940
    jr   c,Code027953               ; 02:7941
    ld   a,[$C1E4]                  ; 02:7943
    and  a                          ; 02:7946
    jr   z,Code02794E               ; 02:7947
    ld   a,$02                      ; 02:7949
    ld   [$C1C2],a                  ; 02:794B
Code02794E:
    xor  a                          ; 02:794E
    ld   [$C1E4],a                  ; 02:794F
    ret                             ; 02:7952

Code027953:
    ld   a,[$C1E4]                  ; 02:7953
    and  a                          ; 02:7956
    ret  nz                         ; 02:7957
    ld   a,[W_PlayerState]          ; 02:7958
    cp   $0C                        ; 02:795B
    ret  z                          ; 02:795D
    ld   a,$0C                      ; 02:795E
    ld   [W_PlayerState],a          ; 02:7960
    ld   a,$07                      ; 02:7963
    ld   [$C1C2],a                  ; 02:7965
    ldh  a,[<$FFAB]                 ; 02:7968
    ld   e,a                        ; 02:796A
    xor  a                          ; 02:796B
    ldh  [<$FFAB],a                 ; 02:796C
    inc  a                          ; 02:796E
    ld   [$C1E4],a                  ; 02:796F
    ld   a,e                        ; 02:7972
    and  a                          ; 02:7973
    jr   z,Code02797C               ; 02:7974
    bit  7,e                        ; 02:7976
    jr   z,Code0279A1               ; 02:7978
    jr   Code027983                 ; 02:797A
Code02797C:
    ld   a,[$C1FD]                  ; 02:797C
    bit  7,a                        ; 02:797F
    jr   z,Code0279A1               ; 02:7981
Code027983:
    ld   hl,H_CameraXLow            ; 02:7983
    ldh  a,[<H_PlayerXLow]          ; 02:7986
    sub  [hl]                       ; 02:7988
    cp   $18                        ; 02:7989
    jr   nc,Code0279A1              ; 02:798B
    ld   hl,W_SpriteXHigh           ; 02:798D
    add  hl,bc                      ; 02:7990
    push hl                         ; 02:7991
    ld   hl,W_SpriteXLow            ; 02:7992
    add  hl,bc                      ; 02:7995
    ld   a,[hl]                     ; 02:7996
    adc  $07                        ; 02:7997
    ldh  [<H_PlayerXLow],a          ; 02:7999
    pop  hl                         ; 02:799B
    ld   a,[hl]                     ; 02:799C
    adc  $00                        ; 02:799D
    ldh  [<H_PlayerXHigh],a         ; 02:799F
Code0279A1:
    ld   hl,W_SpriteXHigh           ; 02:79A1
    add  hl,bc                      ; 02:79A4
    push hl                         ; 02:79A5
    ld   hl,W_SpriteXLow            ; 02:79A6
    add  hl,bc                      ; 02:79A9
    ld   a,[hl]                     ; 02:79AA
    add  $08                        ; 02:79AB
    ldh  [<$FF97],a                 ; 02:79AD
    pop  hl                         ; 02:79AF
    ld   a,[hl]                     ; 02:79B0
    adc  $00                        ; 02:79B1
    ldh  [<$FF98],a                 ; 02:79B3
    ldh  a,[<H_PlayerXLow]          ; 02:79B5
    add  $08                        ; 02:79B7
    ldh  [<$FF99],a                 ; 02:79B9
    ldh  a,[<H_PlayerXHigh]         ; 02:79BB
    adc  $00                        ; 02:79BD
    ldh  [<$FF9A],a                 ; 02:79BF
    ld   e,$00                      ; 02:79C1
    ld   hl,$FF99                   ; 02:79C3
    ldh  a,[<$FF97]                 ; 02:79C6
    sub  [hl]                       ; 02:79C8
    ld   hl,$FF9A                   ; 02:79C9
    ldh  a,[<$FF98]                 ; 02:79CC
    sbc  [hl]                       ; 02:79CE
    bit  7,a                        ; 02:79CF
    jr   nz,Code0279D5              ; 02:79D1
    inc  e                          ; 02:79D3
    inc  e                          ; 02:79D4
Code0279D5:
    ld   a,e                        ; 02:79D5
    ld   [$C1C3],a                  ; 02:79D6
    ret                             ; 02:79D9

Code0279DA:
    ld   a,[W_PlayerState]          ; 02:79DA
    cp   $0E                        ; 02:79DD
    jr   z,Return0279E8             ; 02:79DF
    ld   a,$01                      ; 02:79E1
    ld   hl,W_SpriteSubstate        ; 02:79E3
    add  hl,bc                      ; 02:79E6
    ld   [hl],a                     ; 02:79E7
Return0279E8:
    ret                             ; 02:79E8

Return0279E9:
; sprite 32 init
    ret                             ; 02:79E9

Data0279EA:                         ; 02:79EA
.db $A0,$80,$A0,$90

BowserFireGen_Main:
; sprite 32 main
    call Sub0025CB                  ; 02:79EE
    jp   c,Return027A73             ; 02:79F1
    ld   de,$0000                   ; 02:79F4
Code0279F7:
    ld   a,e                        ; 02:79F7
    cp   c                          ; 02:79F8
    jr   z,Code027A19               ; 02:79F9
    ld   hl,W_SpriteStatus          ; 02:79FB
    add  hl,de                      ; 02:79FE
    ld   a,[hl]                     ; 02:79FF
    and  a                          ; 02:7A00
    jr   z,Code027A19               ; 02:7A01
    ld   hl,W_SpriteID              ; 02:7A03
    add  hl,de                      ; 02:7A06
    ld   a,[hl]                     ; 02:7A07
    cp   $1A                        ; 02:7A08
    jr   nz,Code027A19              ; 02:7A0A
    ld   hl,W_SpriteStatus          ; 02:7A0C
    add  hl,bc                      ; 02:7A0F
    ld   [hl],$00                   ; 02:7A10
    ld   hl,W_SpriteID              ; 02:7A12
    add  hl,bc                      ; 02:7A15
    ld   [hl],$00                   ; 02:7A16
    ret                             ; 02:7A18

Code027A19:
    inc  e                          ; 02:7A19
    ld   a,e                        ; 02:7A1A
    cp   $0F                        ; 02:7A1B
    jr   nz,Code0279F7              ; 02:7A1D
    ld   hl,$D096                   ; 02:7A1F
    add  hl,bc                      ; 02:7A22
    ld   a,[hl]                     ; 02:7A23
    dec  [hl]                       ; 02:7A24
    and  a                          ; 02:7A25
    jr   nz,Return027A73            ; 02:7A26
    ld   [hl],$F0                   ; 02:7A28
    ld   a,$1B                      ; 02:7A2A
    call LoadSpriteAnySlot          ; 02:7A2C
    jr   c,Return027A73             ; 02:7A2F
    push de                         ; 02:7A31
    ld   de,$0008                   ; 02:7A32
    ld   a,$01                      ; 02:7A35
    call Return0010B2               ; 02:7A37
    pop  de                         ; 02:7A3A
    ld   hl,W_SpriteXSpeed          ; 02:7A3B
    add  hl,de                      ; 02:7A3E
    ld   [hl],$F0                   ; 02:7A3F
    ld   hl,W_SpriteXHigh           ; 02:7A41
    add  hl,de                      ; 02:7A44
    push hl                         ; 02:7A45
    ld   hl,W_SpriteXLow            ; 02:7A46
    add  hl,de                      ; 02:7A49
    ldh  a,[<H_CameraXLow]          ; 02:7A4A
    add  $A0                        ; 02:7A4C
    ld   [hl],a                     ; 02:7A4E
    pop  hl                         ; 02:7A4F
    ldh  a,[<H_CameraXHigh]         ; 02:7A50
    adc  $00                        ; 02:7A52
    ld   [hl],a                     ; 02:7A54
    push de                         ; 02:7A55
    call Sub0010E4                  ; 02:7A56
    and  $03                        ; 02:7A59
    ld   e,a                        ; 02:7A5B
    ld   d,$00                      ; 02:7A5C
    ld   hl,Data0279EA              ; 02:7A5E
    add  hl,de                      ; 02:7A61
    ld   a,[hl]                     ; 02:7A62
    pop  de                         ; 02:7A63
    ld   hl,W_SpriteYLow            ; 02:7A64
    add  hl,de                      ; 02:7A67
    ld   [hl],a                     ; 02:7A68
    ld   hl,W_SpriteYHigh           ; 02:7A69
    add  hl,de                      ; 02:7A6C
    ld   [hl],$00                   ; 02:7A6D
    ld   a,$42                      ; 02:7A6F
    ldh  [<$FFF4],a                 ; 02:7A71
Return027A73:
    ret                             ; 02:7A73

    rst  $18                        ; 02:7A74  Return from 24-bit call

Return027A75:
    ret                             ; 02:7A75

UnusedL_027A76:
    call Sub027A82                  ; 02:7A76
    rst  $18                        ; 02:7A79  Return from 24-bit call

Data027A7A:                         ; 02:7A7A
.db $00,$40,$40,$40,$80,$40,$C0,$40

Sub027A82:
    ld   a,[$DA6A]                  ; 02:7A82
    xor  $01                        ; 02:7A85
    sla  a                          ; 02:7A87
    sla  a                          ; 02:7A89
    ld   e,a                        ; 02:7A8B
    ld   a,[$C375]                  ; 02:7A8C
    sla  a                          ; 02:7A8F
    add  e                          ; 02:7A91
    ld   e,a                        ; 02:7A92
    ld   d,$00                      ; 02:7A93
    ld   hl,Data027A7A              ; 02:7A95
    add  hl,de                      ; 02:7A98
    ldi  a,[hl]                     ; 02:7A99
    ldh  [<$FF97],a                 ; 02:7A9A
    ld   a,[hl]                     ; 02:7A9C
    ldh  [<$FF98],a                 ; 02:7A9D
    ld   hl,$C377                   ; 02:7A9F
    ldh  a,[<$FF97]                 ; 02:7AA2
    ldi  [hl],a                     ; 02:7AA4
    ldh  a,[<$FF98]                 ; 02:7AA5
    ld   [hl],a                     ; 02:7AA7
    ld   a,$01                      ; 02:7AA8
    ld   [$C376],a                  ; 02:7AAA
    ret                             ; 02:7AAD

SubL_027AAE:
    ld   a,$3E                      ; 02:7AAE
    call LoadSpriteAnySlot          ; 02:7AB0
    jp   c,ReturnL_027AF8           ; 02:7AB3
    ld   bc,$0004                   ; 02:7AB6
    ld   hl,$C221                   ; 02:7AB9
    add  hl,bc                      ; 02:7ABC
    ld   a,[hl]                     ; 02:7ABD
    ld   hl,$D1B3                   ; 02:7ABE
    add  hl,de                      ; 02:7AC1
    ld   [hl],a                     ; 02:7AC2
    ld   hl,W_SpriteXLow            ; 02:7AC3
    add  hl,de                      ; 02:7AC6
    ldh  a,[<$FF97]                 ; 02:7AC7
    ld   [hl],a                     ; 02:7AC9
    ld   hl,W_SpriteXHigh           ; 02:7ACA
    add  hl,de                      ; 02:7ACD
    ldh  a,[<$FF98]                 ; 02:7ACE
    ld   [hl],a                     ; 02:7AD0
    ld   hl,W_SpriteYLow            ; 02:7AD1
    add  hl,de                      ; 02:7AD4
    ldh  a,[<$FF99]                 ; 02:7AD5
    ld   [hl],a                     ; 02:7AD7
    ld   hl,$D12C                   ; 02:7AD8
    add  hl,de                      ; 02:7ADB
    ld   [hl],a                     ; 02:7ADC
    ld   hl,W_SpriteYSpeed          ; 02:7ADD
    add  hl,de                      ; 02:7AE0
    ld   [hl],$EA                   ; 02:7AE1
    ld   hl,$D13B                   ; 02:7AE3
    add  hl,de                      ; 02:7AE6
    ldh  a,[<$FF9D]                 ; 02:7AE7
    ld   [hl],a                     ; 02:7AE9
    ld   hl,$D14A                   ; 02:7AEA
    add  hl,de                      ; 02:7AED
    ldh  a,[<$FF9E]                 ; 02:7AEE
    ld   [hl],a                     ; 02:7AF0
    ld   hl,$D0FF                   ; 02:7AF1
    add  hl,de                      ; 02:7AF4
    ldh  a,[<$FF9F]                 ; 02:7AF5
    ld   [hl],a                     ; 02:7AF7
ReturnL_027AF8:
    rst  $18                        ; 02:7AF8  Return from 24-bit call

Data027AF9:                         ; 02:7AF9
.db $84,$01,$86,$01

Spr3E_Main:
; sprite 3E main
    call Sub0025CB                  ; 02:7AFD
    jp   c,Code027B69               ; 02:7B00
    call Sub0245DF                  ; 02:7B03
    call Sub024775                  ; 02:7B06
    jr   nc,Code027B69              ; 02:7B09
    xor  a                          ; 02:7B0B
    ld   hl,W_SpriteStatus          ; 02:7B0C
    add  hl,bc                      ; 02:7B0F
    ld   [hl],a                     ; 02:7B10
    ld   hl,W_SpriteID              ; 02:7B11
    add  hl,bc                      ; 02:7B14
    ld   [hl],a                     ; 02:7B15
    ld   hl,W_SpriteXLow            ; 02:7B16
    add  hl,bc                      ; 02:7B19
    ld   a,[hl]                     ; 02:7B1A
    ldh  [<$FF97],a                 ; 02:7B1B
    ld   hl,W_SpriteYLow            ; 02:7B1D
    add  hl,bc                      ; 02:7B20
    ld   a,[hl]                     ; 02:7B21
    ldh  [<$FF98],a                 ; 02:7B22
    ld   hl,W_SpriteXHigh           ; 02:7B24
    add  hl,bc                      ; 02:7B27
    ld   a,[hl]                     ; 02:7B28
    ldh  [<$FF99],a                 ; 02:7B29
    call Sub027B7C                  ; 02:7B2B
    jr   c,Code027B30               ; 02:7B2E
Code027B30:
    ld   hl,$D0FF                   ; 02:7B30
    add  hl,bc                      ; 02:7B33
    ld   a,[hl]                     ; 02:7B34
    ldh  [<$FFA6],a                 ; 02:7B35
    ld   hl,$D13B                   ; 02:7B37
    add  hl,bc                      ; 02:7B3A
    ld   a,[hl]                     ; 02:7B3B
    ld   e,a                        ; 02:7B3C
    ld   hl,$D14A                   ; 02:7B3D
    add  hl,bc                      ; 02:7B40
    ld   a,[hl]                     ; 02:7B41
    ld   h,a                        ; 02:7B42
    ld   l,e                        ; 02:7B43
    ldh  a,[<$FFA6]                 ; 02:7B44
    ldh  [<SVBK],a                  ; 02:7B46
    ld   a,$81                      ; 02:7B48
    ld   [hl],a                     ; 02:7B4A
    ld   a,$00                      ; 02:7B4B
    ldh  [<SVBK],a                  ; 02:7B4D
    ld   hl,H_CameraXLow            ; 02:7B4F
    ldh  a,[<$FF97]                 ; 02:7B52
    sub  [hl]                       ; 02:7B54
    ldh  [<$FF9D],a                 ; 02:7B55
    ld   hl,H_CameraXHigh           ; 02:7B57
    ldh  a,[<$FF99]                 ; 02:7B5A
    sbc  [hl]                       ; 02:7B5C
    and  a                          ; 02:7B5D
    jr   nz,Return027B68            ; 02:7B5E
    ld   de,$0081                   ; 02:7B60
    ld   a,$02                      ; 02:7B63
    call Sub001124                  ; 02:7B65
Return027B68:
    ret                             ; 02:7B68

Code027B69:
    ld   hl,$D177                   ; 02:7B69
    add  hl,bc                      ; 02:7B6C
    ld   e,[hl]                     ; 02:7B6D
    sla  e                          ; 02:7B6E
    sla  e                          ; 02:7B70
    ld   d,$00                      ; 02:7B72
    ld   hl,Data027AF9              ; 02:7B74
    add  hl,de                      ; 02:7B77
    call Disp16x16Sprite            ; 02:7B78
    ret                             ; 02:7B7B

Sub027B7C:
    ld   de,$0000                   ; 02:7B7C
Code027B7F:
    ld   hl,W_SpriteStatus          ; 02:7B7F
    add  hl,de                      ; 02:7B82
    ld   a,[hl]                     ; 02:7B83
    and  a                          ; 02:7B84
    jr   z,Code027B90               ; 02:7B85
    ld   hl,W_SpriteID              ; 02:7B87
    add  hl,de                      ; 02:7B8A
    ld   a,[hl]                     ; 02:7B8B
    cp   $3F                        ; 02:7B8C
    jr   z,Code027B9C               ; 02:7B8E
Code027B90:
    inc  e                          ; 02:7B90
    ld   a,e                        ; 02:7B91
    cp   $0F                        ; 02:7B92
    jr   nz,Code027B7F              ; 02:7B94
    xor  a                          ; 02:7B96
    ldh  [<$FF9B],a                 ; 02:7B97
    scf                             ; 02:7B99
    ccf                             ; 02:7B9A
    ret                             ; 02:7B9B

Code027B9C:
    scf                             ; 02:7B9C
    ret                             ; 02:7B9D

Unused027B9E:
    ld   a,$3F                      ; 02:7B9E
    call LoadSpriteAnySlot          ; 02:7BA0
    jp   c,Return027BD3             ; 02:7BA3
    ld   a,$26                      ; 02:7BA6
    ldh  [<$FFF3],a                 ; 02:7BA8
    ld   hl,W_SpriteXLow            ; 02:7BAA
    add  hl,de                      ; 02:7BAD
    ldh  a,[<$FF97]                 ; 02:7BAE
    ld   [hl],a                     ; 02:7BB0
    ld   hl,W_SpriteXHigh           ; 02:7BB1
    add  hl,de                      ; 02:7BB4
    ldh  a,[<$FF99]                 ; 02:7BB5
    ld   [hl],a                     ; 02:7BB7
    ld   hl,W_SpriteYLow            ; 02:7BB8
    add  hl,de                      ; 02:7BBB
    ldh  a,[<$FF98]                 ; 02:7BBC
    ld   [hl],a                     ; 02:7BBE
    add  $F0                        ; 02:7BBF
    ld   hl,$D1D1                   ; 02:7BC1
    add  hl,de                      ; 02:7BC4
    ld   [hl],a                     ; 02:7BC5
    ld   hl,W_SpriteYSpeed          ; 02:7BC6
    add  hl,de                      ; 02:7BC9
    ld   [hl],$FC                   ; 02:7BCA
    ld   hl,$D11D                   ; 02:7BCC
    add  hl,de                      ; 02:7BCF
    ldh  a,[<$FF9B]                 ; 02:7BD0
    ld   [hl],a                     ; 02:7BD2
Return027BD3:
    ret                             ; 02:7BD3

Spr3F_Main:
; sprite 3F main
    call Sub0025CB                  ; 02:7BD4
    jp   c,Code027BE3               ; 02:7BD7
    call Sub002920                  ; 02:7BDA
    jp   c,Return027C06             ; 02:7BDD
    call Sub027C07                  ; 02:7BE0
Code027BE3:
    ld   hl,$D11D                   ; 02:7BE3
    add  hl,bc                      ; 02:7BE6
    ld   a,[hl]                     ; 02:7BE7
    ldh  [<$FF97],a                 ; 02:7BE8
    ld   e,[hl]                     ; 02:7BEA
    sla  e                          ; 02:7BEB
    sla  e                          ; 02:7BED
    sla  e                          ; 02:7BEF
    ld   d,$00                      ; 02:7BF1
    ld   hl,W_SpriteSubstate        ; 02:7BF3
    add  hl,bc                      ; 02:7BF6
    ld   a,[hl]                     ; 02:7BF7
    and  a                          ; 02:7BF8
    jr   z,Code027BFF               ; 02:7BF9
    ld   a,e                        ; 02:7BFB
    add  $04                        ; 02:7BFC
    ld   e,a                        ; 02:7BFE
Code027BFF:
    ld   hl,ItemFromBlock_Tilemap   ; 02:7BFF
    add  hl,de                      ; 02:7C02
    call Disp16x16Sprite            ; 02:7C03
Return027C06:
    ret                             ; 02:7C06

Sub027C07:
    ld   hl,W_SpriteSubstate        ; 02:7C07
    add  hl,bc                      ; 02:7C0A
    ld   a,[hl]                     ; 02:7C0B
    rst  $00                        ; 02:7C0C  Execute from 16-bit pointer table
.dw Code027C11                      ; 02:7C0D
.dw Code027C2A                      ; 02:7C0F

Code027C11:
    call Sub001A79                  ; 02:7C11
    call Sub024C87                  ; 02:7C14
    ld   hl,$D1D1                   ; 02:7C17
    add  hl,bc                      ; 02:7C1A
    ld   a,[hl]                     ; 02:7C1B
    ld   hl,W_SpriteYLow            ; 02:7C1C
    add  hl,bc                      ; 02:7C1F
    cp   [hl]                       ; 02:7C20
    jr   c,Return027C29             ; 02:7C21
    ld   [hl],a                     ; 02:7C23
    ld   hl,W_SpriteSubstate        ; 02:7C24
    add  hl,bc                      ; 02:7C27
    inc  [hl]                       ; 02:7C28
Return027C29:
    ret                             ; 02:7C29

Code027C2A:
    call Sub024C87                  ; 02:7C2A
    ret                             ; 02:7C2D

Data027C2E:                         ; 02:7C2E
.db $2C,$2E,$05,$06,$07,$08,$02,$03,\
    $30,$04,$31,$17,$23
Data027C3B:                         ; 02:7C3B
.db $2A,$C4,$2B,$C4,$2B,$C4,$2B,$C4,\
    $2B,$C4,$2B,$C4,$2B,$C4,$2B,$C4,\
    $2B,$C4,$2A,$C4,$2B,$C4,$2B,$C4,\
    $2B,$C4
Data027C55:                         ; 02:7C55
.db $01,$80,$40,$40,$40,$40,$08,$08,\
    $04,$02,$02,$20,$40

Sub027C62:
    push bc                         ; 02:7C62
    push de                         ; 02:7C63
    ld   de,$0000                   ; 02:7C64
    ld   hl,W_SpriteID              ; 02:7C67
    add  hl,bc                      ; 02:7C6A
    ld   a,[hl]                     ; 02:7C6B
    ld   hl,Data027C2E              ; 02:7C6C
Code027C6F:
    cp   [hl]                       ; 02:7C6F
    jr   z,Code027C7D               ; 02:7C70
    ld   c,a                        ; 02:7C72
    inc  hl                         ; 02:7C73
    inc  e                          ; 02:7C74
    ld   a,e                        ; 02:7C75
    cp   $0D                        ; 02:7C76
    ld   a,c                        ; 02:7C78
    jr   nz,Code027C6F              ; 02:7C79
    jr   Code027C8F                 ; 02:7C7B
Code027C7D:
    ld   hl,Data027C55              ; 02:7C7D
    add  hl,de                      ; 02:7C80
    ld   c,[hl]                     ; 02:7C81
    sla  e                          ; 02:7C82
    ld   hl,Data027C3B              ; 02:7C84
    add  hl,de                      ; 02:7C87
    ldi  a,[hl]                     ; 02:7C88
    ld   e,a                        ; 02:7C89
    ld   h,[hl]                     ; 02:7C8A
    ld   l,e                        ; 02:7C8B
    ld   a,[hl]                     ; 02:7C8C
    or   c                          ; 02:7C8D
    ld   [hl],a                     ; 02:7C8E
Code027C8F:
    pop  de                         ; 02:7C8F
    pop  bc                         ; 02:7C90
    ret                             ; 02:7C91

Data027C92:                         ; 02:7C92
.db $00,$00,$08,$08
Data027C96:                         ; 02:7C96
.db $00,$00,$06,$06
ScaleLift_Init:
; sprite 60-63 init
    ld   hl,W_SpriteYHigh           ; 02:7C9A
    add  hl,bc                      ; 02:7C9D
    push hl                         ; 02:7C9E
    ld   hl,W_SpriteYLow            ; 02:7C9F
    add  hl,bc                      ; 02:7CA2
    ld   a,[hl]                     ; 02:7CA3
    add  $08                        ; 02:7CA4
    ld   [hl],a                     ; 02:7CA6
    ld   e,a                        ; 02:7CA7
    pop  hl                         ; 02:7CA8
    ld   a,[hl]                     ; 02:7CA9
    adc  $00                        ; 02:7CAA
    ld   [hl],a                     ; 02:7CAC
    ld   hl,$D1D1                   ; 02:7CAD
    add  hl,bc                      ; 02:7CB0
    ld   [hl],e                     ; 02:7CB1
    ld   hl,$D1E0                   ; 02:7CB2
    add  hl,bc                      ; 02:7CB5
    ld   [hl],e                     ; 02:7CB6
    ld   hl,W_SpriteID              ; 02:7CB7
    add  hl,bc                      ; 02:7CBA
    ld   a,[hl]                     ; 02:7CBB
    sub  $60                        ; 02:7CBC
    ld   hl,$D0FF                   ; 02:7CBE
    add  hl,bc                      ; 02:7CC1
    ld   [hl],a                     ; 02:7CC2
    ld   e,a                        ; 02:7CC3
    ld   d,$00                      ; 02:7CC4
    ld   hl,Data027C96              ; 02:7CC6
    add  hl,de                      ; 02:7CC9
    ld   a,[hl]                     ; 02:7CCA
    ld   hl,W_SpriteSubstate        ; 02:7CCB
    add  hl,bc                      ; 02:7CCE
    ld   [hl],a                     ; 02:7CCF
    ld   hl,Data027C92              ; 02:7CD0
    add  hl,de                      ; 02:7CD3
    ld   a,[hl]                     ; 02:7CD4
    ld   hl,W_SpriteXHigh           ; 02:7CD5
    add  hl,bc                      ; 02:7CD8
    push hl                         ; 02:7CD9
    ld   hl,W_SpriteXLow            ; 02:7CDA
    add  hl,bc                      ; 02:7CDD
    add  [hl]                       ; 02:7CDE
    ld   [hl],a                     ; 02:7CDF
    pop  hl                         ; 02:7CE0
    ld   a,$00                      ; 02:7CE1
    adc  [hl]                       ; 02:7CE3
    ld   [hl],a                     ; 02:7CE4
    ld   hl,$D10E                   ; 02:7CE5
    add  hl,bc                      ; 02:7CE8
    ld   a,[$C3AB]                  ; 02:7CE9
    ld   [hl],a                     ; 02:7CEC
    inc  a                          ; 02:7CED
    ld   [$C3AB],a                  ; 02:7CEE
    ret                             ; 02:7CF1

Data027CF2:                         ; 02:7CF2
.db $18,$10,$10,$08
ScaleLift_Main:
; sprite 60-63 main
    call Sub0025CB                  ; 02:7CF6
    jp   c,Code027DE0               ; 02:7CF9
    call Sub027FC0                  ; 02:7CFC
    jp   c,Code027DE0               ; 02:7CFF
    call Sub0029DA                  ; 02:7D02
    xor  a                          ; 02:7D05
    ld   [$D2E4],a                  ; 02:7D06
    ld   hl,W_SpriteXLow            ; 02:7D09
    add  hl,bc                      ; 02:7D0C
    ld   a,[hl]                     ; 02:7D0D
    ld   [$D2E0],a                  ; 02:7D0E
    ld   hl,W_SpriteYLow            ; 02:7D11
    add  hl,bc                      ; 02:7D14
    ld   a,[hl]                     ; 02:7D15
    ld   [$D2E2],a                  ; 02:7D16
    ld   hl,W_SpriteYSpeed          ; 02:7D19
    add  hl,bc                      ; 02:7D1C
    ld   a,[hl]                     ; 02:7D1D
    bit  7,a                        ; 02:7D1E
    jr   z,Code027D25               ; 02:7D20
    call Sub02745C                  ; 02:7D22
Code027D25:
    call Sub001A79                  ; 02:7D25
    call Sub027E03                  ; 02:7D28
    ld   hl,$D195                   ; 02:7D2B
    add  hl,bc                      ; 02:7D2E
    ld   a,[hl]                     ; 02:7D2F
    and  a                          ; 02:7D30
    jp   nz,Code027DE0              ; 02:7D31
    ld   hl,$D0FF                   ; 02:7D34
    add  hl,bc                      ; 02:7D37
    ld   e,[hl]                     ; 02:7D38
    ld   d,$00                      ; 02:7D39
    ld   hl,Data027CF2              ; 02:7D3B
    add  hl,de                      ; 02:7D3E
    ld   a,[hl]                     ; 02:7D3F
    ld   hl,W_SpriteXHigh           ; 02:7D40
    add  hl,bc                      ; 02:7D43
    push hl                         ; 02:7D44
    ld   hl,W_SpriteXLow            ; 02:7D45
    add  hl,bc                      ; 02:7D48
    add  [hl]                       ; 02:7D49
    ldh  [<$FF97],a                 ; 02:7D4A
    pop  hl                         ; 02:7D4C
    ld   a,$00                      ; 02:7D4D
    adc  [hl]                       ; 02:7D4F
    ldh  [<$FF9B],a                 ; 02:7D50
    ld   hl,W_SpriteYSpeed          ; 02:7D52
    add  hl,bc                      ; 02:7D55
    ld   a,[hl]                     ; 02:7D56
    cp   $00                        ; 02:7D57
    jp   z,Code027DE0               ; 02:7D59
    bit  7,a                        ; 02:7D5C
    jr   z,Code027DA3               ; 02:7D5E
    ld   hl,$D1D1                   ; 02:7D60
    add  hl,bc                      ; 02:7D63
    ld   a,[hl]                     ; 02:7D64
    sub  $08                        ; 02:7D65
    ldh  [<$FFA6],a                 ; 02:7D67
    ld   hl,W_SpriteYLow            ; 02:7D69
    add  hl,bc                      ; 02:7D6C
    sub  [hl]                       ; 02:7D6D
    and  a                          ; 02:7D6E
    jp   z,Code027DE0               ; 02:7D6F
    bit  7,a                        ; 02:7D72
    jp   nz,Code027DE0              ; 02:7D74
    ld   hl,$D1D1                   ; 02:7D77
    add  hl,bc                      ; 02:7D7A
    ld   a,[hl]                     ; 02:7D7B
    ldh  [<$FF98],a                 ; 02:7D7C
    ldh  a,[<$FFA6]                 ; 02:7D7E
    ld   [hl],a                     ; 02:7D80
    ld   hl,$D1E0                   ; 02:7D81
    add  hl,bc                      ; 02:7D84
    ld   a,[hl]                     ; 02:7D85
    sub  $08                        ; 02:7D86
    ld   [hl],a                     ; 02:7D88
    ld   a,$00                      ; 02:7D89
    ldh  [<$FF99],a                 ; 02:7D8B
    ld   a,$F4                      ; 02:7D8D
    ldh  [<$FF9A],a                 ; 02:7D8F
    ldh  [<$FF9D],a                 ; 02:7D91
    ld   a,$03                      ; 02:7D93
    ldh  [<$FF9C],a                 ; 02:7D95
    ldh  a,[<$FF98]                 ; 02:7D97
    and  $08                        ; 02:7D99
    jr   z,Code027DDD               ; 02:7D9B
    ld   a,$72                      ; 02:7D9D
    ldh  [<$FF9C],a                 ; 02:7D9F
    jr   Code027DDD                 ; 02:7DA1
Code027DA3:
    ld   hl,$D1E0                   ; 02:7DA3
    add  hl,bc                      ; 02:7DA6
    ld   a,[hl]                     ; 02:7DA7
    ld   hl,W_SpriteYLow            ; 02:7DA8
    add  hl,bc                      ; 02:7DAB
    sub  [hl]                       ; 02:7DAC
    and  a                          ; 02:7DAD
    jr   z,Code027DB4               ; 02:7DAE
    bit  7,a                        ; 02:7DB0
    jr   z,Code027DE0               ; 02:7DB2
Code027DB4:
    ld   hl,$D1E0                   ; 02:7DB4
    add  hl,bc                      ; 02:7DB7
    ld   a,[hl]                     ; 02:7DB8
    add  $08                        ; 02:7DB9
    ld   [hl],a                     ; 02:7DBB
    ldh  [<$FF98],a                 ; 02:7DBC
    ld   hl,$D1D1                   ; 02:7DBE
    add  hl,bc                      ; 02:7DC1
    add  $08                        ; 02:7DC2
    ld   [hl],a                     ; 02:7DC4
    ld   a,$03                      ; 02:7DC5
    ldh  [<$FF99],a                 ; 02:7DC7
    ld   a,$16                      ; 02:7DC9
    ldh  [<$FF9A],a                 ; 02:7DCB
    inc  a                          ; 02:7DCD
    ldh  [<$FF9D],a                 ; 02:7DCE
    ld   e,$72                      ; 02:7DD0
    ldh  a,[<$FF98]                 ; 02:7DD2
    and  $08                        ; 02:7DD4
    jr   z,Code027DDA               ; 02:7DD6
    ld   e,$5B                      ; 02:7DD8
Code027DDA:
    ld   a,e                        ; 02:7DDA
    ldh  [<$FF9C],a                 ; 02:7DDB
Code027DDD:
    call Sub027F2E                  ; 02:7DDD
Code027DE0:
    ld   hl,W_SpriteYHigh           ; 02:7DE0
    add  hl,bc                      ; 02:7DE3
    ld   a,[hl]                     ; 02:7DE4
    and  a                          ; 02:7DE5
    jr   nz,Code027DF3              ; 02:7DE6
    ld   hl,W_SpriteYLow            ; 02:7DE8
    add  hl,bc                      ; 02:7DEB
    ld   a,[hl]                     ; 02:7DEC
    cp   $49                        ; 02:7DED
    jr   nc,Code027DF3              ; 02:7DEF
    ld   [hl],$49                   ; 02:7DF1
Code027DF3:
    ld   hl,W_SpriteSubstate        ; 02:7DF3
    add  hl,bc                      ; 02:7DF6
    ld   a,[hl]                     ; 02:7DF7
    and  a                          ; 02:7DF8
    jr   nz,Code027DFF              ; 02:7DF9
    call Sub027181                  ; 02:7DFB
    ret                             ; 02:7DFE

Code027DFF:
    call Sub0271EF                  ; 02:7DFF
    ret                             ; 02:7E02

Sub027E03:
    ld   hl,$D195                   ; 02:7E03
    add  hl,bc                      ; 02:7E06
    ld   a,[hl]                     ; 02:7E07
    rst  $00                        ; 02:7E08  Execute from 16-bit pointer table
.dw Code027E0D                      ; 02:7E09
.dw Code027EBC                      ; 02:7E0B

Code027E0D:
    call Sub027290                  ; 02:7E0D
    ld   hl,$D13B                   ; 02:7E10
    add  hl,bc                      ; 02:7E13
    ld   a,[hl]                     ; 02:7E14
    and  a                          ; 02:7E15
    jr   nz,Code027E50              ; 02:7E16
    ld   hl,$D0C3                   ; 02:7E18
    add  hl,bc                      ; 02:7E1B
    ld   [hl],$00                   ; 02:7E1C
    call Sub027ED2                  ; 02:7E1E
    jp   c,Return027EBB             ; 02:7E21
    ld   hl,$D14A                   ; 02:7E24
    add  hl,bc                      ; 02:7E27
    ld   e,[hl]                     ; 02:7E28
    ld   d,$00                      ; 02:7E29
    ld   hl,$D13B                   ; 02:7E2B
    add  hl,de                      ; 02:7E2E
    ld   a,[hl]                     ; 02:7E2F
    and  a                          ; 02:7E30
    jr   nz,Code027E43              ; 02:7E31
    ld   hl,W_SpriteYSpeed          ; 02:7E33
    add  hl,bc                      ; 02:7E36
    ld   a,[hl]                     ; 02:7E37
    bit  7,a                        ; 02:7E38
    jr   nz,Code027E50              ; 02:7E3A
    and  a                          ; 02:7E3C
    jp   z,Return027EBB             ; 02:7E3D
    add  $FF                        ; 02:7E40
    ld   [hl],a                     ; 02:7E42
Code027E43:
    ld   hl,W_SpriteYLow            ; 02:7E43
    add  hl,de                      ; 02:7E46
    ld   a,[hl]                     ; 02:7E47
    cp   $49                        ; 02:7E48
    jr   nc,Return027EBB            ; 02:7E4A
    ld   [hl],$49                   ; 02:7E4C
    jr   Return027EBB               ; 02:7E4E
Code027E50:
    call Sub027ED2                  ; 02:7E50
    ld   hl,$D14A                   ; 02:7E53
    add  hl,bc                      ; 02:7E56
    ld   e,[hl]                     ; 02:7E57
    ld   d,$00                      ; 02:7E58
    ldh  a,[<H_GlobalTimer]         ; 02:7E5A
    and  $03                        ; 02:7E5C
    jr   nz,Code027E79              ; 02:7E5E
    ld   hl,W_SpriteYSpeed          ; 02:7E60
    add  hl,bc                      ; 02:7E63
    ld   a,[hl]                     ; 02:7E64
    add  $01                        ; 02:7E65
    bit  7,a                        ; 02:7E67
    jr   nz,Code027E71              ; 02:7E69
    cp   $10                        ; 02:7E6B
    jr   c,Code027E71               ; 02:7E6D
    ld   a,$10                      ; 02:7E6F
Code027E71:
    ld   [hl],a                     ; 02:7E71
    cpl                             ; 02:7E72
    inc  a                          ; 02:7E73
    ld   hl,W_SpriteYSpeed          ; 02:7E74
    add  hl,de                      ; 02:7E77
    ld   [hl],a                     ; 02:7E78
Code027E79:
    ld   hl,W_SpriteYLow            ; 02:7E79
    add  hl,de                      ; 02:7E7C
    ld   a,[hl]                     ; 02:7E7D
    cp   $49                        ; 02:7E7E
    jr   z,Code027E84               ; 02:7E80
    jr   nc,Return027EBB            ; 02:7E82
Code027E84:
    ld   [hl],$49                   ; 02:7E84
    ld   hl,W_SpriteYSpeed          ; 02:7E86
    add  hl,bc                      ; 02:7E89
    ld   [hl],$00                   ; 02:7E8A
    ld   hl,W_SpriteYSpeed          ; 02:7E8C
    add  hl,de                      ; 02:7E8F
    ld   [hl],$00                   ; 02:7E90
    ld   hl,$D087                   ; 02:7E92
    add  hl,bc                      ; 02:7E95
    ld   [hl],$00                   ; 02:7E96
    ld   hl,$D087                   ; 02:7E98
    add  hl,de                      ; 02:7E9B
    ld   [hl],$00                   ; 02:7E9C
    ld   hl,$D0C3                   ; 02:7E9E
    add  hl,bc                      ; 02:7EA1
    inc  [hl]                       ; 02:7EA2
    ld   a,[hl]                     ; 02:7EA3
    cp   $02                        ; 02:7EA4
    jr   c,Return027EBB             ; 02:7EA6
    ld   [hl],$00                   ; 02:7EA8
    ld   hl,$D195                   ; 02:7EAA
    add  hl,bc                      ; 02:7EAD
    ld   [hl],$01                   ; 02:7EAE
    ld   hl,$D195                   ; 02:7EB0
    add  hl,de                      ; 02:7EB3
    ld   [hl],$01                   ; 02:7EB4
    ld   a,$05                      ; 02:7EB6
    call Sub002E90                  ; 02:7EB8
Return027EBB:
    ret                             ; 02:7EBB

Code027EBC:
    call Sub027290                  ; 02:7EBC
    ld   hl,W_SpriteYSpeed          ; 02:7EBF
    add  hl,bc                      ; 02:7EC2
    ld   a,[hl]                     ; 02:7EC3
    add  $01                        ; 02:7EC4
    bit  7,a                        ; 02:7EC6
    jr   nz,Code027ED0              ; 02:7EC8
    cp   $20                        ; 02:7ECA
    jr   c,Code027ED0               ; 02:7ECC
    ld   a,$20                      ; 02:7ECE
Code027ED0:
    ld   [hl],a                     ; 02:7ED0
    ret                             ; 02:7ED1

Sub027ED2:
    ld   hl,$D10E                   ; 02:7ED2
    add  hl,bc                      ; 02:7ED5
    ld   a,[hl]                     ; 02:7ED6
    and  $FE                        ; 02:7ED7
    ld   [$D2E6],a                  ; 02:7ED9
    ld   de,$0000                   ; 02:7EDC
Code027EDF:
    ld   a,c                        ; 02:7EDF
    cp   e                          ; 02:7EE0
    jr   z,Code027F22               ; 02:7EE1
    ld   hl,W_SpriteStatus          ; 02:7EE3
    add  hl,de                      ; 02:7EE6
    ld   a,[hl]                     ; 02:7EE7
    and  a                          ; 02:7EE8
    jp   z,Code027F22               ; 02:7EE9
    ld   hl,W_SpriteID              ; 02:7EEC
    add  hl,de                      ; 02:7EEF
    ld   a,[hl]                     ; 02:7EF0
    cp   $61                        ; 02:7EF1
    jr   z,Code027F01               ; 02:7EF3
    cp   $60                        ; 02:7EF5
    jr   z,Code027F01               ; 02:7EF7
    cp   $63                        ; 02:7EF9
    jr   z,Code027F01               ; 02:7EFB
    cp   $62                        ; 02:7EFD
    jr   nz,Code027F22              ; 02:7EFF
Code027F01:
    ld   hl,$D10E                   ; 02:7F01
    add  hl,de                      ; 02:7F04
    ld   a,[hl]                     ; 02:7F05
    and  $FE                        ; 02:7F06
    ld   hl,$D2E6                   ; 02:7F08
    cp   [hl]                       ; 02:7F0B
    jr   nz,Code027F22              ; 02:7F0C
    ld   hl,W_SpriteYSpeed          ; 02:7F0E
    add  hl,bc                      ; 02:7F11
    ld   a,[hl]                     ; 02:7F12
    ld   hl,W_SpriteYSpeed          ; 02:7F13
    add  hl,de                      ; 02:7F16
    xor  $FF                        ; 02:7F17
    inc  a                          ; 02:7F19
    ld   [hl],a                     ; 02:7F1A
    ld   hl,$D14A                   ; 02:7F1B
    add  hl,bc                      ; 02:7F1E
    ld   [hl],e                     ; 02:7F1F
    jr   Code027F2B                 ; 02:7F20
Code027F22:
    inc  e                          ; 02:7F22
    ld   a,e                        ; 02:7F23
    cp   $0F                        ; 02:7F24
    jp   nz,Code027EDF              ; 02:7F26
    scf                             ; 02:7F29
    ret                             ; 02:7F2A

Code027F2B:
    scf                             ; 02:7F2B
    ccf                             ; 02:7F2C
    ret                             ; 02:7F2D

Sub027F2E:
    push bc                         ; 02:7F2E
    ld   hl,H_CameraXLow            ; 02:7F2F
    ldh  a,[<$FF97]                 ; 02:7F32
    sub  [hl]                       ; 02:7F34
    ld   e,a                        ; 02:7F35
    ld   hl,H_CameraXHigh           ; 02:7F36
    ldh  a,[<$FF9B]                 ; 02:7F39
    sbc  [hl]                       ; 02:7F3B
    ld   d,a                        ; 02:7F3C
    ld   a,e                        ; 02:7F3D
    add  $30                        ; 02:7F3E
    ld   e,a                        ; 02:7F40
    ld   a,d                        ; 02:7F41
    adc  $00                        ; 02:7F42
    cp   $00                        ; 02:7F44
    jr   z,Code027F51               ; 02:7F46
    cp   $01                        ; 02:7F48
    jr   nz,Code027F98              ; 02:7F4A
    ld   a,e                        ; 02:7F4C
    cp   $11                        ; 02:7F4D
    jr   nc,Code027F98              ; 02:7F4F
Code027F51:
    ld   bc,$9800                   ; 02:7F51
    xor  a                          ; 02:7F54
    ld   h,a                        ; 02:7F55
    ld   d,a                        ; 02:7F56
    ldh  a,[<$FF98]                 ; 02:7F57
    and  $F8                        ; 02:7F59
    ld   l,a                        ; 02:7F5B
    sla  l                          ; 02:7F5C
    rl   h                          ; 02:7F5E
    sla  l                          ; 02:7F60
    rl   h                          ; 02:7F62
    ldh  a,[<$FF97]                 ; 02:7F64
    and  $F0                        ; 02:7F66
    ld   e,a                        ; 02:7F68
    srl  e                          ; 02:7F69
    srl  e                          ; 02:7F6B
    srl  e                          ; 02:7F6D
    add  hl,de                      ; 02:7F6F
    add  hl,bc                      ; 02:7F70
    ld   b,h                        ; 02:7F71
    ld   c,l                        ; 02:7F72
    ld   hl,$DF00                   ; 02:7F73
    ld   a,[hl]                     ; 02:7F76
    inc  a                          ; 02:7F77
    ld   e,a                        ; 02:7F78
    ld   d,$00                      ; 02:7F79
    add  hl,de                      ; 02:7F7B
    ld   a,b                        ; 02:7F7C
    ldi  [hl],a                     ; 02:7F7D
    ld   a,c                        ; 02:7F7E
    ldi  [hl],a                     ; 02:7F7F
    ld   a,$02                      ; 02:7F80
    ldi  [hl],a                     ; 02:7F82
    ldh  a,[<$FF99]                 ; 02:7F83
    ldi  [hl],a                     ; 02:7F85
    ldh  a,[<$FF9A]                 ; 02:7F86
    ldi  [hl],a                     ; 02:7F88
    ldh  a,[<$FF99]                 ; 02:7F89
    ldi  [hl],a                     ; 02:7F8B
    ldh  a,[<$FF9D]                 ; 02:7F8C
    ldi  [hl],a                     ; 02:7F8E
    ld   [hl],$00                   ; 02:7F8F
    ld   hl,$DF00                   ; 02:7F91
    ld   a,$07                      ; 02:7F94
    add  [hl]                       ; 02:7F96
    ld   [hl],a                     ; 02:7F97
Code027F98:
    ld   a,$06                      ; 02:7F98
    ldh  [<SVBK],a                  ; 02:7F9A
    ldh  a,[<$FF9B]                 ; 02:7F9C
    and  $0F                        ; 02:7F9E
    ld   b,a                        ; 02:7FA0
    ld   c,$00                      ; 02:7FA1
    ld   hl,W_SubLv16x16Tilemap     ; 02:7FA3
    add  hl,bc                      ; 02:7FA6
    ldh  a,[<$FF98]                 ; 02:7FA7
    and  $F0                        ; 02:7FA9
    ld   c,a                        ; 02:7FAB
    ld   b,$00                      ; 02:7FAC
    add  hl,bc                      ; 02:7FAE
    ldh  a,[<$FF97]                 ; 02:7FAF
    and  $F0                        ; 02:7FB1
    swap a                          ; 02:7FB3
    ld   c,a                        ; 02:7FB5
    add  hl,bc                      ; 02:7FB6
    ldh  a,[<$FF9C]                 ; 02:7FB7
    ld   [hl],a                     ; 02:7FB9
    ld   a,$00                      ; 02:7FBA
    ldh  [<SVBK],a                  ; 02:7FBC
    pop  bc                         ; 02:7FBE
    ret                             ; 02:7FBF

Sub027FC0:
    ld   hl,W_SpriteXHigh           ; 02:7FC0
    add  hl,bc                      ; 02:7FC3
    ld   d,[hl]                     ; 02:7FC4
    ld   hl,W_SpriteXLow            ; 02:7FC5
    add  hl,bc                      ; 02:7FC8
    ld   a,[hl]                     ; 02:7FC9
    add  $08                        ; 02:7FCA
    ld   e,a                        ; 02:7FCC
    ld   a,$00                      ; 02:7FCD
    adc  d                          ; 02:7FCF
    ld   d,a                        ; 02:7FD0
    ld   a,[$C1ED]                  ; 02:7FD1
    sub  $F0                        ; 02:7FD4
    ldh  [<$FF98],a                 ; 02:7FD6
    ld   a,[$C1EE]                  ; 02:7FD8
    sbc  $00                        ; 02:7FDB
    ldh  [<$FF99],a                 ; 02:7FDD
    ld   hl,$FF98                   ; 02:7FDF
    ld   a,e                        ; 02:7FE2
    sub  [hl]                       ; 02:7FE3
    ld   e,a                        ; 02:7FE4
    ld   hl,$FF99                   ; 02:7FE5
    ld   a,d                        ; 02:7FE8
    sbc  [hl]                       ; 02:7FE9
    bit  7,a                        ; 02:7FEA
    jr   nz,Code027FF7              ; 02:7FEC
    cp   $01                        ; 02:7FEE
    jr   c,Code027FFC               ; 02:7FF0
    ld   a,e                        ; 02:7FF2
    cp   $F0                        ; 02:7FF3
    jr   c,Code027FFC               ; 02:7FF5
Code027FF7:
    call Sub0029EF                  ; 02:7FF7
    scf                             ; 02:7FFA
    ret                             ; 02:7FFB

Code027FFC:
    scf                             ; 02:7FFC
    ccf                             ; 02:7FFD
    ret                             ; 02:7FFE
