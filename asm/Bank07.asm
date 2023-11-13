.bank $07 slot 1
.orga $4000

Sub074000:
    ldh  a,[<$FFF2]                 ; 07:4000
    and  a                          ; 07:4002
    jr   z,Code07400B               ; 07:4003
    ld   [$DE60],a                  ; 07:4005
    xor  a                          ; 07:4008
    ldh  [<$FFF2],a                 ; 07:4009
Code07400B:
    ldh  a,[<$FFF3]                 ; 07:400B
    and  a                          ; 07:400D
    jr   z,Code074016               ; 07:400E
    ld   [$DE70],a                  ; 07:4010
    xor  a                          ; 07:4013
    ldh  [<$FFF3],a                 ; 07:4014
Code074016:
    ldh  a,[<$FFF4]                 ; 07:4016
    and  a                          ; 07:4018
    jr   z,Return074021             ; 07:4019
    ld   [$DE78],a                  ; 07:401B
    xor  a                          ; 07:401E
    ldh  [<$FFF4],a                 ; 07:401F
Return074021:
    ret                             ; 07:4021

SubL_074022:
    call Sub074026                  ; 07:4022
    rst  $18                        ; 07:4025  Return from 24-bit call

Sub074026:
    ld   a,$41                      ; 07:4026
    call LoadSpriteAnySlot          ; 07:4028
    jr   c,Return074078             ; 07:402B
    ldh  a,[<$FF9B]                 ; 07:402D
    and  a                          ; 07:402F
    jr   nz,Code074069              ; 07:4030
    ld   bc,$0004                   ; 07:4032
    ld   hl,$C221                   ; 07:4035
    add  hl,bc                      ; 07:4038
    ld   a,[hl]                     ; 07:4039
    ld   hl,$D1B3                   ; 07:403A
    add  hl,de                      ; 07:403D
    ld   [hl],a                     ; 07:403E
    ld   hl,W_SpriteXLow            ; 07:403F
    add  hl,de                      ; 07:4042
    ldh  a,[<$FF97]                 ; 07:4043
    ld   [hl],a                     ; 07:4045
    ld   hl,W_SpriteXHigh           ; 07:4046
    add  hl,de                      ; 07:4049
    ldh  a,[<$FF98]                 ; 07:404A
    ld   [hl],a                     ; 07:404C
    ld   hl,W_SpriteYLow            ; 07:404D
    add  hl,de                      ; 07:4050
    ldh  a,[<$FF99]                 ; 07:4051
    ld   [hl],a                     ; 07:4053
    ld   hl,$D13B                   ; 07:4054
    add  hl,de                      ; 07:4057
    ldh  a,[<$FF9D]                 ; 07:4058
    ld   [hl],a                     ; 07:405A
    ld   hl,$D14A                   ; 07:405B
    add  hl,de                      ; 07:405E
    ldh  a,[<$FF9E]                 ; 07:405F
    ld   [hl],a                     ; 07:4061
    ld   hl,$D0FF                   ; 07:4062
    add  hl,de                      ; 07:4065
    ldh  a,[<$FF9F]                 ; 07:4066
    ld   [hl],a                     ; 07:4068
Code074069:
    ld   hl,$D0E1                   ; 07:4069
    add  hl,de                      ; 07:406C
    ldh  a,[<$FF9B]                 ; 07:406D
    ld   [hl],a                     ; 07:406F
    ld   a,[$C375]                  ; 07:4070
    or   $02                        ; 07:4073
    ld   [$C375],a                  ; 07:4075
Return074078:
    ret                             ; 07:4078

Code074079:
    ld   hl,$D096                   ; 07:4079
    add  hl,bc                      ; 07:407C
    ld   a,[hl]                     ; 07:407D
    and  a                          ; 07:407E
    jr   z,Code074084               ; 07:407F
    dec  [hl]                       ; 07:4081
    jr   Return0740D3               ; 07:4082
Code074084:
    ld   [hl],$04                   ; 07:4084
    ld   hl,$D0D2                   ; 07:4086
    add  hl,bc                      ; 07:4089
    inc  [hl]                       ; 07:408A
    ld   a,[hl]                     ; 07:408B
    cp   $04                        ; 07:408C
    jr   c,Code0740CF               ; 07:408E
    ld   a,$00                      ; 07:4090
    ld   hl,W_SpriteStatus          ; 07:4092
    add  hl,bc                      ; 07:4095
    ld   [hl],a                     ; 07:4096
    ld   hl,W_SpriteID              ; 07:4097
    add  hl,bc                      ; 07:409A
    ld   [hl],a                     ; 07:409B
    ld   hl,$D0E1                   ; 07:409C
    add  hl,bc                      ; 07:409F
    ld   a,[hl]                     ; 07:40A0
    and  a                          ; 07:40A1
    jr   nz,Code0740C3              ; 07:40A2
    ld   hl,$D0FF                   ; 07:40A4
    add  hl,bc                      ; 07:40A7
    ld   a,[hl]                     ; 07:40A8
    ldh  [<$FFA6],a                 ; 07:40A9
    ld   hl,$D13B                   ; 07:40AB
    add  hl,bc                      ; 07:40AE
    ld   a,[hl]                     ; 07:40AF
    ld   e,a                        ; 07:40B0
    ld   hl,$D14A                   ; 07:40B1
    add  hl,bc                      ; 07:40B4
    ld   a,[hl]                     ; 07:40B5
    ld   h,a                        ; 07:40B6
    ld   l,e                        ; 07:40B7
    ldh  a,[<$FFA6]                 ; 07:40B8
    ldh  [<SVBK],a                  ; 07:40BA
    ld   a,$84                      ; 07:40BC
    ld   [hl],a                     ; 07:40BE
    ld   a,$00                      ; 07:40BF
    ldh  [<SVBK],a                  ; 07:40C1
Code0740C3:
    ld   a,[$C375]                  ; 07:40C3
    and  $01                        ; 07:40C6
    xor  $01                        ; 07:40C8
    ld   [$C375],a                  ; 07:40CA
    ld   a,$00                      ; 07:40CD
Code0740CF:
    ld   d,a                        ; 07:40CF
    call Sub07411C                  ; 07:40D0
Return0740D3:
    ret                             ; 07:40D3

RaceBlockAnimPtrs:                  ; 07:40D4
.dw Gr_FaceSolidSpikedAnim,      Gr_FaceSolidSpikedAnim+$0C0,\
    Gr_FaceSolidSpikedAnim+$180, Gr_FaceSolidSpikedAnim+$240,\
    Gr_FaceSolidSpikedAnim+$300, Gr_FaceSolidSpikedAnim+$3C0,\
    Gr_FaceSolidSpikedAnim+$480, Gr_FaceSolidSpikedAnim+$540,\
    Gr_FaceSolidDottedAnim,      Gr_FaceSolidDottedAnim+$0C0,\
    Gr_FaceSolidDottedAnim+$180, Gr_FaceSolidDottedAnim+$240,\
    Gr_FaceSolidDottedAnim+$300, Gr_FaceSolidDottedAnim+$3C0,\
    Gr_FaceSolidDottedAnim+$480, Gr_FaceSolidDottedAnim+$540

Sub0740F4:
    ld   a,[W_GameMode]             ; 07:40F4
    cp   $07                        ; 07:40F7
    jr   nz,Code074104              ; 07:40F9
    xor  a                          ; 07:40FB
    ld   [$C375],a                  ; 07:40FC
    ld   [$C3E7],a                  ; 07:40FF
    jr   Sub07411C                  ; 07:4102
Code074104:
    ld   a,[$DA6A]                  ; 07:4104
    xor  $01                        ; 07:4107
    and  a                          ; 07:4109
    jr   nz,Code074114              ; 07:410A
    ld   a,[$C3E7]                  ; 07:410C
    ld   [$C375],a                  ; 07:410F
    jr   Sub07411C                  ; 07:4112
Code074114:
    ld   a,[$C3E7]                  ; 07:4114
    xor  $01                        ; 07:4117
    ld   [$C375],a                  ; 07:4119

Sub07411C:
    push bc                         ; 07:411C
    ld   bc,$0010                   ; 07:411D
    ld   a,[W_RaceHeaderFlags]      ; 07:4120
    bit  1,a                        ; 07:4123  test bit 1
    jr   nz,Code074129              ; 07:4125  if set, use solid/spiked blocks (offset 10)
    ld   c,$00                      ; 07:4127  if clear, use solid/dotted blocks (offset 00)
Code074129:
    ld   a,[$DA6A]                  ; 07:4129
    xor  $01                        ; 07:412C
    ld   e,a                        ; 07:412E
    ld   a,[$C375]                  ; 07:412F
    and  $01                        ; 07:4132
    xor  e                          ; 07:4134
    sla  a                          ; 07:4135
    sla  a                          ; 07:4137
    add  d                          ; 07:4139
    and  $07                        ; 07:413A
    sla  a                          ; 07:413C
    ld   e,a                        ; 07:413E
    ld   d,$00                      ; 07:413F
    ld   hl,RaceBlockAnimPtrs       ; 07:4141
    add  hl,bc                      ; 07:4144
    add  hl,de                      ; 07:4145
    ldi  a,[hl]                     ; 07:4146
    ld   [$C377],a                  ; 07:4147
    ld   a,[hl]                     ; 07:414A
    ld   [$C378],a                  ; 07:414B
    ld   a,$01                      ; 07:414E
    ld   [$C376],a                  ; 07:4150
    pop  bc                         ; 07:4153
    ret                             ; 07:4154

SubL_074155:
    ld   a,[W_GameMode]             ; 07:4155
    cp   $02                        ; 07:4158
    jp   nz,ReturnL_0741A3          ; 07:415A
    ld   e,$00                      ; 07:415D
    call Sub000FE5                  ; 07:415F
    ld   [$D2F5],a                  ; 07:4162
    ld   hl,$D0FF                   ; 07:4165
    add  hl,bc                      ; 07:4168
    cp   [hl]                       ; 07:4169
    jp   z,Code074180               ; 07:416A
    ld   e,a                        ; 07:416D
    ld   d,$00                      ; 07:416E
    ld   hl,Data001D1F              ; 07:4170
    add  hl,de                      ; 07:4173
    ld   e,[hl]                     ; 07:4174
    call Sub001F75                  ; 07:4175
    call Sub001D55                  ; 07:4178
    jr   nc,Code074180              ; 07:417B
    call Sub0741A4                  ; 07:417D
Code074180:
    ld   e,$01                      ; 07:4180
    call Sub000FE5                  ; 07:4182
    ld   [$D2F5],a                  ; 07:4185
    ld   hl,$D0FF                   ; 07:4188
    add  hl,bc                      ; 07:418B
    cp   [hl]                       ; 07:418C
    jp   z,ReturnL_0741A3           ; 07:418D
    ld   e,a                        ; 07:4190
    ld   d,$00                      ; 07:4191
    ld   hl,Data001D1F              ; 07:4193
    add  hl,de                      ; 07:4196
    ld   e,[hl]                     ; 07:4197
    call Sub001F75                  ; 07:4198
    call Sub001D55                  ; 07:419B
    jr   nc,ReturnL_0741A3          ; 07:419E
    call Sub0741A4                  ; 07:41A0
ReturnL_0741A3:
    rst  $18                        ; 07:41A3  Return from 24-bit call

Sub0741A4:
    ld   hl,$D0FF                   ; 07:41A4
    add  hl,bc                      ; 07:41A7
    ld   a,[$D2F5]                  ; 07:41A8
    swap a                          ; 07:41AB
    sla  a                          ; 07:41AD
    sla  a                          ; 07:41AF
    sla  a                          ; 07:41B1
    ld   e,a                        ; 07:41B3
    ld   d,$00                      ; 07:41B4
    ld   hl,$C509                   ; 07:41B6
    add  hl,de                      ; 07:41B9
    ld   a,[hl]                     ; 07:41BA
    cp   $03                        ; 07:41BB
    ret  z                          ; 07:41BD
    cp   $06                        ; 07:41BE
    ret  z                          ; 07:41C0
    cp   $07                        ; 07:41C1
    ret  z                          ; 07:41C3
    cp   $05                        ; 07:41C4
    ret  z                          ; 07:41C6
    cp   $0A                        ; 07:41C7
    ret  z                          ; 07:41C9
    cp   $09                        ; 07:41CA
    ret  z                          ; 07:41CC
    ldh  a,[<H_PlInitY_SubLvType]   ; 07:41CD
    and  $0F                        ; 07:41CF
    cp   $02                        ; 07:41D1
    jr   nz,Code074210              ; 07:41D3
    ld   hl,$C504                   ; 07:41D5
    add  hl,de                      ; 07:41D8
    ld   a,[hl]                     ; 07:41D9
    and  a                          ; 07:41DA
    jr   nz,Code0741F4              ; 07:41DB
    ld   hl,$C503                   ; 07:41DD
    add  hl,de                      ; 07:41E0
    ld   a,[hl]                     ; 07:41E1
    cp   $2C                        ; 07:41E2
    jr   nc,Code0741F4              ; 07:41E4
    ld   hl,$C506                   ; 07:41E6
    add  hl,de                      ; 07:41E9
    ld   a,[hl]                     ; 07:41EA
    bit  7,a                        ; 07:41EB
    jr   z,Code0741F4               ; 07:41ED
    cp   $F0                        ; 07:41EF
    jp   c,Return0742A1             ; 07:41F1
Code0741F4:
    ld   hl,$C506                   ; 07:41F4
    add  hl,de                      ; 07:41F7
    ld   a,[hl]                     ; 07:41F8
    bit  7,a                        ; 07:41F9
    jr   z,Code074208               ; 07:41FB
    add  $F0                        ; 07:41FD
    cp   $D0                        ; 07:41FF
    jr   nc,Code074205              ; 07:4201
    ld   a,$D0                      ; 07:4203
Code074205:
    ld   [hl],a                     ; 07:4205
    jr   Code07420A                 ; 07:4206
Code074208:
    ld   [hl],$F0                   ; 07:4208
Code07420A:
    ld   a,$08                      ; 07:420A
    ldh  [<$FF97],a                 ; 07:420C
    jr   Code074250                 ; 07:420E
Code074210:
    ld   [hl],$13                   ; 07:4210
    ld   hl,$C506                   ; 07:4212
    add  hl,de                      ; 07:4215
    ld   [hl],$B0                   ; 07:4216
    ld   hl,$C54B                   ; 07:4218
    add  hl,de                      ; 07:421B
    ld   [hl],$00                   ; 07:421C
    ld   hl,$C54C                   ; 07:421E
    add  hl,de                      ; 07:4221
    ld   [hl],$0A                   ; 07:4222
    ld   hl,$C54D                   ; 07:4224
    add  hl,de                      ; 07:4227
    ld   [hl],$00                   ; 07:4228
    ld   hl,$C54E                   ; 07:422A
    add  hl,de                      ; 07:422D
    ld   [hl],$0A                   ; 07:422E
    ld   hl,$C503                   ; 07:4230
    add  hl,de                      ; 07:4233
    ld   a,[hl]                     ; 07:4234
    ldh  [<$FF97],a                 ; 07:4235
    ld   hl,$C504                   ; 07:4237
    add  hl,de                      ; 07:423A
    ld   a,[hl]                     ; 07:423B
    ldh  [<$FF98],a                 ; 07:423C
    ld   hl,$C549                   ; 07:423E
    add  hl,de                      ; 07:4241
    ldh  a,[<$FF97]                 ; 07:4242
    ld   [hl],a                     ; 07:4244
    ld   hl,$C54A                   ; 07:4245
    add  hl,de                      ; 07:4248
    ldh  a,[<$FF98]                 ; 07:4249
    ld   [hl],a                     ; 07:424B
    ld   a,$04                      ; 07:424C
    ldh  [<$FF97],a                 ; 07:424E
Code074250:
    xor  a                          ; 07:4250
    ld   hl,$C508                   ; 07:4251
    add  hl,de                      ; 07:4254
    ld   [hl],a                     ; 07:4255
    ld   hl,$C50F                   ; 07:4256
    add  hl,de                      ; 07:4259
    ld   [hl],a                     ; 07:425A
    ld   hl,$C548                   ; 07:425B
    add  hl,de                      ; 07:425E
    ld   [hl],a                     ; 07:425F
    ld   hl,$C545                   ; 07:4260
    add  hl,de                      ; 07:4263
    ld   [hl],a                     ; 07:4264
    ld   hl,$C507                   ; 07:4265
    add  hl,de                      ; 07:4268
    ld   [hl],a                     ; 07:4269
    push de                         ; 07:426A
    ldh  a,[<$FF97]                 ; 07:426B
    ld   e,a                        ; 07:426D
    ld   hl,W_SpriteXSpeed          ; 07:426E
    add  hl,bc                      ; 07:4271
    ld   a,[hl]                     ; 07:4272
    bit  7,a                        ; 07:4273
    jr   z,Code07427B               ; 07:4275
    ld   a,e                        ; 07:4277
    cpl                             ; 07:4278
    inc  a                          ; 07:4279
    ld   e,a                        ; 07:427A
Code07427B:
    ld   a,e                        ; 07:427B
    pop  de                         ; 07:427C
    ld   hl,$C505                   ; 07:427D
    add  hl,de                      ; 07:4280
    add  [hl]                       ; 07:4281
    ldh  [<$FF97],a                 ; 07:4282
    add  $40                        ; 07:4284
    cp   $80                        ; 07:4286
    jr   nc,Code074292              ; 07:4288
    ldh  a,[<$FF97]                 ; 07:428A
    ld   [hl],a                     ; 07:428C
    ld   hl,$C538                   ; 07:428D
    add  hl,de                      ; 07:4290
    ld   [hl],a                     ; 07:4291
Code074292:
    xor  a                          ; 07:4292
    ld   hl,W_SpriteStatus          ; 07:4293
    add  hl,bc                      ; 07:4296
    ld   [hl],a                     ; 07:4297
    ld   hl,W_SpriteID              ; 07:4298
    add  hl,bc                      ; 07:429B
    ld   [hl],a                     ; 07:429C
    ld   a,$6C                      ; 07:429D
    ldh  [<$FFF2],a                 ; 07:429F
Return0742A1:
    ret                             ; 07:42A1

Code0742A2:
    ld   hl,W_SpriteXLow            ; 07:42A2
    add  hl,bc                      ; 07:42A5
    ld   [hl],$48                   ; 07:42A6
    ld   hl,W_SpriteYLow            ; 07:42A8
    add  hl,bc                      ; 07:42AB
    ldh  a,[<H_CameraY]             ; 07:42AC
    add  $20                        ; 07:42AE
    ld   [hl],a                     ; 07:42B0
    ld   hl,$D096                   ; 07:42B1
    add  hl,bc                      ; 07:42B4
    ld   [hl],$20                   ; 07:42B5
    ret                             ; 07:42B7

Data0742B8:                         ; 07:42B8
.db $A4,$0E,$A6,$0E,$A0,$0E,$A2,$0E,\
    $9C,$0E,$9E,$0E,$94,$0E,$96,$0E,\
    $98,$0E,$9A,$0E
RaceLevelMusicIDs:                  ; 07:42CC
.db $7E,$7E,$7E,$68,$7E,$7E,$7E,$68
Code0742D4:
    ld   hl,$D096                   ; 07:42D4
    add  hl,bc                      ; 07:42D7
    ld   a,[hl]                     ; 07:42D8
    and  a                          ; 07:42D9
    jr   z,Code0742DF               ; 07:42DA
    dec  [hl]                       ; 07:42DC
    jr   Code07432F                 ; 07:42DD
Code0742DF:
    ld   [hl],$30                   ; 07:42DF
    ld   hl,$D0D2                   ; 07:42E1
    add  hl,bc                      ; 07:42E4
    inc  [hl]                       ; 07:42E5
    ld   a,[hl]                     ; 07:42E6
    cp   $04                        ; 07:42E7
    jr   nz,Code074301              ; 07:42E9
    ld   a,$65                      ; 07:42EB
    ldh  [<$FFF2],a                 ; 07:42ED
    ld   a,$10                      ; 07:42EF
    ld   [$C38D],a                  ; 07:42F1
    ld   a,$01                      ; 07:42F4
    ld   [$C181],a                  ; 07:42F6
    ld   hl,$D096                   ; 07:42F9
    add  hl,bc                      ; 07:42FC
    ld   [hl],$18                   ; 07:42FD
    jr   Code07432F                 ; 07:42FF
Code074301:
    cp   $05                        ; 07:4301
    jr   nz,Code07432B              ; 07:4303
    ld   a,$00                      ; 07:4305
    ld   hl,W_SpriteStatus          ; 07:4307
    add  hl,bc                      ; 07:430A
    ld   [hl],a                     ; 07:430B
    ld   hl,W_SpriteID              ; 07:430C
    add  hl,bc                      ; 07:430F
    ld   [hl],a                     ; 07:4310
    ldh  a,[<H_GameState]           ; 07:4311
    cp   $3E                        ; 07:4313
    jr   z,Return07432A             ; 07:4315
    ld   a,[W_SublevelID]           ; 07:4317
    sub  $3A                        ; 07:431A
    ld   e,a                        ; 07:431C
    ld   d,$00                      ; 07:431D
    ld   hl,RaceLevelMusicIDs       ; 07:431F
    add  hl,de                      ; 07:4322
    ld   a,[hl]                     ; 07:4323
    ld   [$DE68],a                  ; 07:4324
    ld   [$C36F],a                  ; 07:4327
Return07432A:
    ret                             ; 07:432A

Code07432B:
    ld   a,$64                      ; 07:432B
    ldh  [<$FFF2],a                 ; 07:432D
Code07432F:
    ld   hl,$D0D2                   ; 07:432F
    add  hl,bc                      ; 07:4332
    ld   a,[hl]                     ; 07:4333
    cp   $00                        ; 07:4334
    jr   z,Return07437B             ; 07:4336
    dec  a                          ; 07:4338
    sla  a                          ; 07:4339
    sla  a                          ; 07:433B
    ld   e,a                        ; 07:433D
    ld   d,$00                      ; 07:433E
    ld   hl,Data0742B8              ; 07:4340
    add  hl,de                      ; 07:4343
    push hl                         ; 07:4344
    call Disp16x16Sprite            ; 07:4345
    ld   hl,$D0D2                   ; 07:4348
    add  hl,bc                      ; 07:434B
    ld   a,[hl]                     ; 07:434C
    cp   $04                        ; 07:434D
    jr   nz,Code07437C              ; 07:434F
    ld   hl,W_SpriteXHigh           ; 07:4351
    add  hl,bc                      ; 07:4354
    push hl                         ; 07:4355
    ld   hl,W_SpriteXLow            ; 07:4356
    add  hl,bc                      ; 07:4359
    ld   a,[hl]                     ; 07:435A
    add  $10                        ; 07:435B
    ldh  [<$FF98],a                 ; 07:435D
    pop  hl                         ; 07:435F
    ld   a,[hl]                     ; 07:4360
    adc  $00                        ; 07:4361
    ldh  [<$FF99],a                 ; 07:4363
    ld   hl,W_SpriteYLow            ; 07:4365
    add  hl,bc                      ; 07:4368
    ld   a,[hl]                     ; 07:4369
    ldh  [<$FF97],a                 ; 07:436A
    ld   hl,W_SpriteYHigh           ; 07:436C
    add  hl,bc                      ; 07:436F
    ld   a,[hl]                     ; 07:4370
    ldh  [<$FF9B],a                 ; 07:4371
    pop  hl                         ; 07:4373
    inc  hl                         ; 07:4374
    inc  hl                         ; 07:4375
    inc  hl                         ; 07:4376
    inc  hl                         ; 07:4377
    call Sub002769                  ; 07:4378
Return07437B:
    ret                             ; 07:437B

Code07437C:
    pop  hl                         ; 07:437C
    ret                             ; 07:437D

    rst  $18                        ; 07:437E  Return from 24-bit call

UnusedL_07437F:
    ld   de,$0000                   ; 07:437F
@Code074382:
    ld   hl,W_SpriteStatus          ; 07:4382
    add  hl,de                      ; 07:4385
    ld   a,[hl]                     ; 07:4386
    and  a                          ; 07:4387
    jr   z,@Code0743AF              ; 07:4388
    ld   hl,W_SpriteID              ; 07:438A
    add  hl,de                      ; 07:438D
    ld   a,[hl]                     ; 07:438E
    cp   $43                        ; 07:438F
    jr   nz,@Code0743AF             ; 07:4391
    ld   hl,$D11D                   ; 07:4393
    add  hl,de                      ; 07:4396
    ldh  a,[<$FF9D]                 ; 07:4397
    cp   [hl]                       ; 07:4399
    jr   nz,@Code0743AF             ; 07:439A
    ld   hl,$D12C                   ; 07:439C
    add  hl,de                      ; 07:439F
    ldh  a,[<$FF9E]                 ; 07:43A0
    cp   [hl]                       ; 07:43A2
    jr   nz,@Code0743AF             ; 07:43A3
    ld   hl,$D13B                   ; 07:43A5
    add  hl,de                      ; 07:43A8
    ldh  a,[<$FF9F]                 ; 07:43A9
    cp   [hl]                       ; 07:43AB
    jr   nz,@Code0743AF             ; 07:43AC
    rst  $18                        ; 07:43AE  Return from 24-bit call

@Code0743AF:
    inc  e                          ; 07:43AF
    ld   a,e                        ; 07:43B0
    cp   $0F                        ; 07:43B1
    jr   nz,@Code074382             ; 07:43B3
    ld   a,$43                      ; 07:43B5
    call LoadSpriteAnySlot          ; 07:43B7
    jr   c,@ReturnL                 ; 07:43BA
    ld   hl,W_SpriteXLow            ; 07:43BC
    add  hl,de                      ; 07:43BF
    ldh  a,[<$FF97]                 ; 07:43C0
    ld   [hl],a                     ; 07:43C2
    ld   hl,W_SpriteXHigh           ; 07:43C3
    add  hl,de                      ; 07:43C6
    ldh  a,[<$FF98]                 ; 07:43C7
    ld   [hl],a                     ; 07:43C9
    ld   hl,W_SpriteYLow            ; 07:43CA
    add  hl,de                      ; 07:43CD
    ldh  a,[<$FF99]                 ; 07:43CE
    ld   [hl],a                     ; 07:43D0
    ld   hl,W_SpriteYHigh           ; 07:43D1
    add  hl,de                      ; 07:43D4
    ld   [hl],$00                   ; 07:43D5
    ld   hl,$D11D                   ; 07:43D7
    add  hl,de                      ; 07:43DA
    ldh  a,[<$FF9D]                 ; 07:43DB
    ld   [hl],a                     ; 07:43DD
    ld   hl,$D12C                   ; 07:43DE
    add  hl,de                      ; 07:43E1
    ldh  a,[<$FF9E]                 ; 07:43E2
    ld   [hl],a                     ; 07:43E4
    ld   hl,$D13B                   ; 07:43E5
    add  hl,de                      ; 07:43E8
    ldh  a,[<$FF9F]                 ; 07:43E9
    ld   [hl],a                     ; 07:43EB
    ld   hl,$D096                   ; 07:43EC
    add  hl,de                      ; 07:43EF
    ld   [hl],$40                   ; 07:43F0
@ReturnL:
    rst  $18                        ; 07:43F2  Return from 24-bit call

Code0743F3:
    call Sub0025CB                  ; 07:43F3
    jr   c,Return0743FE             ; 07:43F6
    call Sub0029DA                  ; 07:43F8
    call Sub0743FF                  ; 07:43FB
Return0743FE:
    ret                             ; 07:43FE

Sub0743FF:
    ld   hl,W_SpriteSubstate        ; 07:43FF
    add  hl,bc                      ; 07:4402
    ld   a,[hl]                     ; 07:4403
    rst  $00                        ; 07:4404  Execute from 16-bit pointer table
.dw Code074407                      ; 07:4405
Code074407:
    ld   hl,$D096                   ; 07:4407
    add  hl,bc                      ; 07:440A
    ld   a,[hl]                     ; 07:440B
    and  a                          ; 07:440C
    jr   z,Return074411             ; 07:440D
    dec  [hl]                       ; 07:440F
    ret                             ; 07:4410

Return074411:
    ret                             ; 07:4411

SubL_074412:
    ld   a,$44                      ; 07:4412
    call LoadSpriteAnySlot          ; 07:4414
    jr   c,ReturnL_074449           ; 07:4417
    ld   hl,W_SpriteXLow            ; 07:4419
    add  hl,de                      ; 07:441C
    ldh  a,[<$FF97]                 ; 07:441D
    ld   [hl],a                     ; 07:441F
    ld   hl,W_SpriteXHigh           ; 07:4420
    add  hl,de                      ; 07:4423
    ldh  a,[<$FF98]                 ; 07:4424
    ld   [hl],a                     ; 07:4426
    ld   hl,W_SpriteYLow            ; 07:4427
    add  hl,de                      ; 07:442A
    ldh  a,[<$FF99]                 ; 07:442B
    ld   [hl],a                     ; 07:442D
    ld   hl,W_SpriteYHigh           ; 07:442E
    add  hl,de                      ; 07:4431
    ld   [hl],$00                   ; 07:4432
    ld   hl,$D13B                   ; 07:4434
    add  hl,de                      ; 07:4437
    ldh  a,[<$FF9D]                 ; 07:4438
    ld   [hl],a                     ; 07:443A
    ld   hl,$D14A                   ; 07:443B
    add  hl,de                      ; 07:443E
    ldh  a,[<$FF9E]                 ; 07:443F
    ld   [hl],a                     ; 07:4441
    ld   hl,$D0FF                   ; 07:4442
    add  hl,de                      ; 07:4445
    ldh  a,[<$FF9F]                 ; 07:4446
    ld   [hl],a                     ; 07:4448
ReturnL_074449:
    rst  $18                        ; 07:4449  Return from 24-bit call

Data07444A:                         ; 07:444A
.db $B8,$08,$BA,$08
Code07444E:
    call Sub0025CB                  ; 07:444E
    jr   c,Code074456               ; 07:4451
    call Sub07445D                  ; 07:4453
Code074456:
    ld   hl,Data07444A              ; 07:4456
    call Disp16x16Sprite            ; 07:4459
    ret                             ; 07:445C

Sub07445D:
    ld   hl,$D0D2                   ; 07:445D
    add  hl,bc                      ; 07:4460
    inc  [hl]                       ; 07:4461
    ld   a,[hl]                     ; 07:4462
    cp   $03                        ; 07:4463
    jr   nz,Code074477              ; 07:4465
    xor  a                          ; 07:4467
    ld   hl,W_SpriteStatus          ; 07:4468
    add  hl,bc                      ; 07:446B
    ld   [hl],a                     ; 07:446C
    ld   hl,W_SpriteID              ; 07:446D
    add  hl,bc                      ; 07:4470
    ld   [hl],a                     ; 07:4471
    push bc                         ; 07:4472
    call Sub0745A7                  ; 07:4473
    pop  bc                         ; 07:4476
Code074477:
    ld   a,[W_GameMode]             ; 07:4477
    cp   $07                        ; 07:447A
    jr   nz,Code07448A              ; 07:447C
    call Sub001D55                  ; 07:447E
    jr   nc,Return074489            ; 07:4481
    and  a                          ; 07:4483
    jr   z,Return074489             ; 07:4484
    call Sub07455A                  ; 07:4486
Return074489:
    ret                             ; 07:4489

Code07448A:
    ld   e,$00                      ; 07:448A
    call Sub000FE5                  ; 07:448C
    ld   [$D2F5],a                  ; 07:448F
    ld   e,a                        ; 07:4492
    ld   d,$00                      ; 07:4493
    ld   hl,Data001D1F              ; 07:4495
    add  hl,de                      ; 07:4498
    ld   e,[hl]                     ; 07:4499
    call Sub001F75                  ; 07:449A
    call Sub001D55                  ; 07:449D
    jr   nc,Code0744A5              ; 07:44A0
    call Sub0744C1                  ; 07:44A2
Code0744A5:
    ld   e,$01                      ; 07:44A5
    call Sub000FE5                  ; 07:44A7
    ld   [$D2F5],a                  ; 07:44AA
    ld   e,a                        ; 07:44AD
    ld   d,$00                      ; 07:44AE
    ld   hl,Data001D1F              ; 07:44B0
    add  hl,de                      ; 07:44B3
    ld   e,[hl]                     ; 07:44B4
    call Sub001F75                  ; 07:44B5
    call Sub001D55                  ; 07:44B8
    jr   nc,Return0744C0            ; 07:44BB
    call Sub0744C1                  ; 07:44BD
Return0744C0:
    ret                             ; 07:44C0

Sub0744C1:
    push af                         ; 07:44C1
    ld   a,[$D2F5]                  ; 07:44C2
    swap a                          ; 07:44C5
    sla  a                          ; 07:44C7
    sla  a                          ; 07:44C9
    sla  a                          ; 07:44CB
    ld   e,a                        ; 07:44CD
    ld   d,$00                      ; 07:44CE
    pop  af                         ; 07:44D0
    cp   $01                        ; 07:44D1
    jr   z,Code0744E6               ; 07:44D3
    ld   hl,$C514                   ; 07:44D5
    add  hl,de                      ; 07:44D8
    ld   a,[hl]                     ; 07:44D9
    ld   hl,$C503                   ; 07:44DA
    add  hl,de                      ; 07:44DD
    ld   [hl],a                     ; 07:44DE
    ld   hl,$C506                   ; 07:44DF
    add  hl,de                      ; 07:44E2
    ld   [hl],$00                   ; 07:44E3
    ret                             ; 07:44E5

Code0744E6:
    ld   hl,$C506                   ; 07:44E6
    add  hl,de                      ; 07:44E9
    ld   a,[hl]                     ; 07:44EA
    bit  7,a                        ; 07:44EB
    jr   nz,Code07450C              ; 07:44ED
    ld   hl,$C503                   ; 07:44EF
    add  hl,de                      ; 07:44F2
    ld   a,$18                      ; 07:44F3
    add  [hl]                       ; 07:44F5
    ldh  [<$FF97],a                 ; 07:44F6
    ld   hl,W_SpriteYLow            ; 07:44F8
    add  hl,bc                      ; 07:44FB
    ld   a,$04                      ; 07:44FC
    add  [hl]                       ; 07:44FE
    ld   hl,$FF97                   ; 07:44FF
    cp   [hl]                       ; 07:4502
    jr   nc,Code07450C              ; 07:4503
    ld   hl,$C503                   ; 07:4505
    add  hl,de                      ; 07:4508
    sub  $18                        ; 07:4509
    ld   [hl],a                     ; 07:450B
Code07450C:
    ld   hl,$D0D2                   ; 07:450C
    add  hl,bc                      ; 07:450F
    ld   a,[hl]                     ; 07:4510
    cp   $03                        ; 07:4511
    jr   nz,Return074559            ; 07:4513
    ld   hl,$C509                   ; 07:4515
    add  hl,de                      ; 07:4518
    ld   a,[hl]                     ; 07:4519
    cp   $07                        ; 07:451A
    jr   z,Return074559             ; 07:451C
    cp   $09                        ; 07:451E
    jr   z,Return074559             ; 07:4520
    ld   [hl],$14                   ; 07:4522
    ld   hl,$C542                   ; 07:4524
    add  hl,de                      ; 07:4527
    xor  a                          ; 07:4528
    ld   [hl],a                     ; 07:4529
    ld   hl,$C506                   ; 07:452A
    add  hl,de                      ; 07:452D
    ld   [hl],$C6                   ; 07:452E
    ld   hl,$C50F                   ; 07:4530
    add  hl,de                      ; 07:4533
    ld   [hl],$10                   ; 07:4534
    ld   hl,$C505                   ; 07:4536
    add  hl,de                      ; 07:4539
    ld   a,[hl]                     ; 07:453A
    ld   hl,$C538                   ; 07:453B
    add  hl,de                      ; 07:453E
    ld   [hl],a                     ; 07:453F
    ld   a,$00                      ; 07:4540
    ld   hl,$C508                   ; 07:4542
    add  hl,de                      ; 07:4545
    ld   [hl],a                     ; 07:4546
    ld   a,[$D2F5]                  ; 07:4547
    and  a                          ; 07:454A
    jr   nz,Return074559            ; 07:454B
    ld   a,$6C                      ; 07:454D
    ldh  [<$FFF2],a                 ; 07:454F
    ld   de,$0008                   ; 07:4551
    ld   a,$01                      ; 07:4554
    call Return0010B2               ; 07:4556
Return074559:
    ret                             ; 07:4559

Sub07455A:
    ldh  a,[<$FFAC]                 ; 07:455A
    bit  7,a                        ; 07:455C
    jr   nz,Code074577              ; 07:455E
    ldh  a,[<H_PlayerYLow]          ; 07:4560
    add  $18                        ; 07:4562
    ldh  [<$FF97],a                 ; 07:4564
    ld   hl,W_SpriteYLow            ; 07:4566
    add  hl,bc                      ; 07:4569
    ld   a,$04                      ; 07:456A
    add  [hl]                       ; 07:456C
    ld   hl,$FF97                   ; 07:456D
    cp   [hl]                       ; 07:4570
    jr   nc,Code074577              ; 07:4571
    sub  $18                        ; 07:4573
    ldh  [<H_PlayerYLow],a          ; 07:4575
Code074577:
    ld   hl,$D0D2                   ; 07:4577
    add  hl,bc                      ; 07:457A
    ld   a,[hl]                     ; 07:457B
    cp   $03                        ; 07:457C
    jr   nz,Return0745A6            ; 07:457E
    xor  a                          ; 07:4580
    ld   [$C1FA],a                  ; 07:4581
    ld   a,$14                      ; 07:4584
    ld   [W_PlayerState],a          ; 07:4586
    ld   a,$C6                      ; 07:4589
    ldh  [<$FFAC],a                 ; 07:458B
    ld   a,$10                      ; 07:458D
    ld   [$C1C7],a                  ; 07:458F
    ldh  a,[<$FFAB]                 ; 07:4592
    ld   [$C1F0],a                  ; 07:4594
    xor  a                          ; 07:4597
    ldh  [<$FFAE],a                 ; 07:4598
    ld   a,$6C                      ; 07:459A
    ldh  [<$FFF2],a                 ; 07:459C
    ld   de,$0008                   ; 07:459E
    ld   a,$01                      ; 07:45A1
    call Return0010B2               ; 07:45A3
Return0745A6:
    ret                             ; 07:45A6

Sub0745A7:
    ld   hl,$D0FF                   ; 07:45A7
    add  hl,bc                      ; 07:45AA
    ld   a,[hl]                     ; 07:45AB
    ldh  [<$FFA6],a                 ; 07:45AC
    ld   hl,$D13B                   ; 07:45AE
    add  hl,bc                      ; 07:45B1
    ld   a,[hl]                     ; 07:45B2
    ld   e,a                        ; 07:45B3
    ld   hl,$D14A                   ; 07:45B4
    add  hl,bc                      ; 07:45B7
    ld   a,[hl]                     ; 07:45B8
    ld   h,a                        ; 07:45B9
    ld   l,e                        ; 07:45BA
    ldh  a,[<$FFA6]                 ; 07:45BB
    ldh  [<SVBK],a                  ; 07:45BD
    ld   [hl],$8A                   ; 07:45BF
    xor  a                          ; 07:45C1
    ldh  [<SVBK],a                  ; 07:45C2
    ld   hl,W_SpriteXLow            ; 07:45C4
    add  hl,bc                      ; 07:45C7
    ld   a,[hl]                     ; 07:45C8
    ldh  [<$FF97],a                 ; 07:45C9
    ld   hl,W_SpriteXHigh           ; 07:45CB
    add  hl,bc                      ; 07:45CE
    ld   a,[hl]                     ; 07:45CF
    ldh  [<$FF99],a                 ; 07:45D0
    ld   hl,W_SpriteYLow            ; 07:45D2
    add  hl,bc                      ; 07:45D5
    ld   a,[hl]                     ; 07:45D6
    ldh  [<$FF98],a                 ; 07:45D7
    ld   hl,H_CameraXLow            ; 07:45D9
    ldh  a,[<$FF97]                 ; 07:45DC
    sub  [hl]                       ; 07:45DE
    ldh  [<$FF9D],a                 ; 07:45DF
    ld   hl,H_CameraXHigh           ; 07:45E1
    ldh  a,[<$FF99]                 ; 07:45E4
    sbc  [hl]                       ; 07:45E6
    ldh  [<$FF9E],a                 ; 07:45E7
    ldh  a,[<$FF9D]                 ; 07:45E9
    add  $30                        ; 07:45EB
    ldh  a,[<$FF9E]                 ; 07:45ED
    adc  $00                        ; 07:45EF
    and  a                          ; 07:45F1
    jr   nz,Return0745FC            ; 07:45F2
    ld   de,$008A                   ; 07:45F4
    ld   a,$07                      ; 07:45F7
    call Sub001124                  ; 07:45F9
Return0745FC:
    ret                             ; 07:45FC

Data0745FD:                         ; 07:45FD
.dw $0420,$0850,$09E0
Data074603:                         ; 07:4603
.dw $0150,$01B0,$0260,$0280
Data07460B:                         ; 07:460B
.dw $0240,$0350
Data07460F:                         ; 07:460F
.dw $0160,$0210,$0380,$0520,$0590,$0760,$08F0,$0980,\
    $09E0,$0A90
Data074623:                         ; 07:4623
.dw $0220,$0320,$0390,$03E0,$0470,$0590,$05C0,$06A0,\
    $07B0,$0850,$0950,$0A70,$0B00,$0B40
Data07463F:                         ; 07:463F
.dw $0430
Data074641:                         ; 07:4641
.dw $0210,$0460
DataPtrs074645:                     ; 07:4645
.dw Data0745FD, Data074603, Data07460B, Data07460F,\
    Data074623, Data07463F, Data074641
Data074653:                         ; 07:4653
.db $06,$00,$08,$00,$04,$00,$14,$00,\
    $1C,$00,$02,$00,$04,$00
Data074661:                         ; 07:4661
.db $05,$19,$11,$15,$3F,$3F,$49,$49,\
    $55,$55,$7E,$7E,$87,$8C
Data07466F:                         ; 07:466F
.dw $FFD8,$0038,H_CameraXLow,$0058,$FFC8,$0048,$FFE8,$0038,\
    $FFE8,$0038,$FFE8,$0008,$FFF8,$0018,H_CameraXLow,$0058,\
    H_PlayerXHigh,$0068,$FFE8,$0028,$FFE8,$0028,$FFC8,$0038,\
    $FFD8,$0028,$FFC8,$0028,$FF98,$0058,H_CameraXLow,$0048,\
    $FFE8,$0018,$FFE8,$0018,$FF88,$0078,$FFE8,$0028,\
    H_CameraXLow,$0038,$FFE8,$0018,$FFD8,$0028,$FFD8,$0038,\
    $FFE8,$0018,$FFE8,$0018,$FFD8,$0028,$FFE8,$0028,\
    $FFE8,$0018,$FFF8,$0008,$FFD8,$0038,H_PlayerXHigh,$0028,\
    $FFE8,$0018,$FFC8,$0028,$FFE8,$0028,$FFE8,$0028
Data0746FF:                         ; 07:46FF
.db $00,$0C,$1C,$24,$4C,$84,$88
Code074706:
    ld   a,[W_LevelID]              ; 07:4706
    ld   e,a                        ; 07:4709
    ld   a,[W_SPFlag]               ; 07:470A
    and  a                          ; 07:470D
    jr   z,Code074716               ; 07:470E
    ld   a,[W_SublevelID]           ; 07:4710
    add  $40                        ; 07:4713
    ld   e,a                        ; 07:4715
Code074716:
    ld   a,[W_GameMode]             ; 07:4716
    cp   $07                        ; 07:4719
    jr   z,Code074721               ; 07:471B
    cp   $02                        ; 07:471D
    jr   nz,Code074746              ; 07:471F
Code074721:
    ld   hl,W_SpriteXLow            ; 07:4721
    add  hl,bc                      ; 07:4724
    ld   a,[hl]                     ; 07:4725
    swap a                          ; 07:4726
    and  $0F                        ; 07:4728
    sub  $05                        ; 07:472A
    sla  a                          ; 07:472C
    ld   e,a                        ; 07:472E
    ld   d,$00                      ; 07:472F
    ld   hl,Data07460B              ; 07:4731
    add  hl,de                      ; 07:4734
    ld   e,[hl]                     ; 07:4735
    inc  hl                         ; 07:4736
    ld   d,[hl]                     ; 07:4737
    ld   hl,W_SpriteXLow            ; 07:4738
    add  hl,bc                      ; 07:473B
    ld   [hl],e                     ; 07:473C
    ld   hl,W_SpriteXHigh           ; 07:473D
    add  hl,bc                      ; 07:4740
    ld   [hl],d                     ; 07:4741
    ld   a,[W_SublevelID]           ; 07:4742
    ld   e,a                        ; 07:4745
Code074746:
    ld   a,e                        ; 07:4746
    ldh  [<$FF97],a                 ; 07:4747
    ld   de,$0000                   ; 07:4749
Code07474C:
    ld   hl,Data074661              ; 07:474C
    add  hl,de                      ; 07:474F
    ldh  a,[<$FF97]                 ; 07:4750
    cp   [hl]                       ; 07:4752
    jr   z,Code074767               ; 07:4753
    inc  e                          ; 07:4755
    ld   a,e                        ; 07:4756
    cp   $0E                        ; 07:4757
    jr   nz,Code07474C              ; 07:4759
Code07475B:
    xor  a                          ; 07:475B
    ld   hl,W_SpriteStatus          ; 07:475C
    add  hl,bc                      ; 07:475F
    ld   [hl],a                     ; 07:4760
    ld   hl,W_SpriteID              ; 07:4761
    add  hl,bc                      ; 07:4764
    ld   [hl],a                     ; 07:4765
    ret                             ; 07:4766

Code074767:
    ld   hl,W_SpriteXLow            ; 07:4767
    add  hl,bc                      ; 07:476A
    ld   a,[hl]                     ; 07:476B
    ldh  [<$FF97],a                 ; 07:476C
    ld   hl,W_SpriteXHigh           ; 07:476E
    add  hl,bc                      ; 07:4771
    ld   a,[hl]                     ; 07:4772
    ldh  [<$FF98],a                 ; 07:4773
    ld   a,e                        ; 07:4775
    and  $FE                        ; 07:4776
    ld   e,a                        ; 07:4778
    ld   hl,$D11D                   ; 07:4779
    add  hl,bc                      ; 07:477C
    ld   [hl],a                     ; 07:477D
    ld   hl,Data074653              ; 07:477E
    add  hl,de                      ; 07:4781
    ld   a,[hl]                     ; 07:4782
    ldh  [<$FF99],a                 ; 07:4783
    ld   hl,DataPtrs074645          ; 07:4785
    add  hl,de                      ; 07:4788
    ldi  a,[hl]                     ; 07:4789
    ld   e,a                        ; 07:478A
    ld   a,[hl]                     ; 07:478B
    ld   h,a                        ; 07:478C
    ld   l,e                        ; 07:478D
    ld   de,$0000                   ; 07:478E
Code074791:
    ldh  a,[<$FF97]                 ; 07:4791
    cp   [hl]                       ; 07:4793
    jr   nz,Code07479E              ; 07:4794
    inc  hl                         ; 07:4796
    ldh  a,[<$FF98]                 ; 07:4797
    cp   [hl]                       ; 07:4799
    jr   z,Code0747A9               ; 07:479A
    jr   Code07479F                 ; 07:479C
Code07479E:
    inc  hl                         ; 07:479E
Code07479F:
    inc  hl                         ; 07:479F
    inc  e                          ; 07:47A0
    inc  e                          ; 07:47A1
    ldh  a,[<$FF99]                 ; 07:47A2
    cp   e                          ; 07:47A4
    jr   nz,Code074791              ; 07:47A5
    jr   Code07475B                 ; 07:47A7
Code0747A9:
    ld   a,e                        ; 07:47A9
    srl  a                          ; 07:47AA
    ld   hl,$D12C                   ; 07:47AC
    add  hl,bc                      ; 07:47AF
    ld   [hl],a                     ; 07:47B0
    ret                             ; 07:47B1

Data0747B2:                         ; 07:47B2
.db $08,$F8
Code0747B4:
    call Sub0025CB                  ; 07:47B4
    jp   c,Return07483E             ; 07:47B7
    ld   a,[W_GameMode]             ; 07:47BA
    cp   $02                        ; 07:47BD
    jr   nz,Code074829              ; 07:47BF
    ld   e,$00                      ; 07:47C1
    call Sub07483F                  ; 07:47C3
    ld   hl,$C502                   ; 07:47C6
    add  hl,de                      ; 07:47C9
    push hl                         ; 07:47CA
    ld   hl,$C501                   ; 07:47CB
    add  hl,de                      ; 07:47CE
    ld   a,[hl]                     ; 07:47CF
    add  $08                        ; 07:47D0
    ldh  [<$FF9D],a                 ; 07:47D2
    pop  hl                         ; 07:47D4
    ld   a,[hl]                     ; 07:47D5
    adc  $00                        ; 07:47D6
    ldh  [<$FF9E],a                 ; 07:47D8
    call Sub07485F                  ; 07:47DA
    jr   nc,Code0747F4              ; 07:47DD
    ld   hl,Data0747B2              ; 07:47DF
    add  hl,de                      ; 07:47E2
    ld   a,[hl]                     ; 07:47E3
    push af                         ; 07:47E4
    call Sub074847                  ; 07:47E5
    pop  af                         ; 07:47E8
    ld   hl,$C53D                   ; 07:47E9
    add  hl,de                      ; 07:47EC
    ld   [hl],a                     ; 07:47ED
    ld   hl,$C53E                   ; 07:47EE
    add  hl,de                      ; 07:47F1
    ld   [hl],$0C                   ; 07:47F2
Code0747F4:
    ld   e,$01                      ; 07:47F4
    call Sub07483F                  ; 07:47F6
    ld   hl,$C502                   ; 07:47F9
    add  hl,de                      ; 07:47FC
    push hl                         ; 07:47FD
    ld   hl,$C501                   ; 07:47FE
    add  hl,de                      ; 07:4801
    ld   a,[hl]                     ; 07:4802
    add  $08                        ; 07:4803
    ldh  [<$FF9D],a                 ; 07:4805
    pop  hl                         ; 07:4807
    ld   a,[hl]                     ; 07:4808
    adc  $00                        ; 07:4809
    ldh  [<$FF9E],a                 ; 07:480B
    call Sub07485F                  ; 07:480D
    jr   nc,Return07483E            ; 07:4810
    ld   hl,Data0747B2              ; 07:4812
    add  hl,de                      ; 07:4815
    ld   a,[hl]                     ; 07:4816
    push af                         ; 07:4817
    call Sub074847                  ; 07:4818
    pop  af                         ; 07:481B
    ld   hl,$C53D                   ; 07:481C
    add  hl,de                      ; 07:481F
    ld   [hl],a                     ; 07:4820
    ld   hl,$C53E                   ; 07:4821
    add  hl,de                      ; 07:4824
    ld   [hl],$08                   ; 07:4825
    jr   Return07483E               ; 07:4827
Code074829:
    call Sub002920                  ; 07:4829
    call Sub074853                  ; 07:482C
    jr   nc,Return07483E            ; 07:482F
    ld   hl,Data0747B2              ; 07:4831
    add  hl,de                      ; 07:4834
    ld   a,[hl]                     ; 07:4835
    ld   [$C1F5],a                  ; 07:4836
    ld   a,$08                      ; 07:4839
    ld   [$C1F6],a                  ; 07:483B
Return07483E:
    ret                             ; 07:483E

Sub07483F:
    call Sub000FE5                  ; 07:483F
    ld   [$D2F5],a                  ; 07:4842
    jr   Code07484A                 ; 07:4845

Sub074847:
    ld   a,[$D2F5]                  ; 07:4847
Code07484A:
    ld   e,a                        ; 07:484A
    ld   d,$00                      ; 07:484B
    ld   hl,Data001D1F              ; 07:484D
    add  hl,de                      ; 07:4850
    ld   e,[hl]                     ; 07:4851
    ret                             ; 07:4852

Sub074853:
    ldh  a,[<H_PlayerXLow]          ; 07:4853
    add  $08                        ; 07:4855
    ldh  [<$FF9D],a                 ; 07:4857
    ldh  a,[<H_PlayerXHigh]         ; 07:4859
    adc  $00                        ; 07:485B
    ldh  [<$FF9E],a                 ; 07:485D

Sub07485F:
    ld   hl,$D11D                   ; 07:485F
    add  hl,bc                      ; 07:4862
    ld   e,[hl]                     ; 07:4863
    srl  e                          ; 07:4864
    ld   d,$00                      ; 07:4866
    ld   hl,Data0746FF              ; 07:4868
    add  hl,de                      ; 07:486B
    ld   e,[hl]                     ; 07:486C
    ld   hl,$D12C                   ; 07:486D
    add  hl,bc                      ; 07:4870
    ld   a,[hl]                     ; 07:4871
    sla  a                          ; 07:4872
    sla  a                          ; 07:4874
    add  e                          ; 07:4876
    ld   e,a                        ; 07:4877
    ld   hl,Data07466F              ; 07:4878
    add  hl,de                      ; 07:487B
    ldi  a,[hl]                     ; 07:487C
    ldh  [<$FF97],a                 ; 07:487D
    ldi  a,[hl]                     ; 07:487F
    ldh  [<$FF98],a                 ; 07:4880
    ldi  a,[hl]                     ; 07:4882
    ldh  [<$FF99],a                 ; 07:4883
    ld   a,[hl]                     ; 07:4885
    ldh  [<$FF9A],a                 ; 07:4886
    ld   hl,W_SpriteXLow            ; 07:4888
    add  hl,bc                      ; 07:488B
    ld   a,[hl]                     ; 07:488C
    ldh  [<$FF9B],a                 ; 07:488D
    ld   hl,W_SpriteXHigh           ; 07:488F
    add  hl,bc                      ; 07:4892
    ld   a,[hl]                     ; 07:4893
    ldh  [<$FF9C],a                 ; 07:4894
    ld   hl,$FF97                   ; 07:4896
    ldh  a,[<$FF9B]                 ; 07:4899
    add  [hl]                       ; 07:489B
    ldi  [hl],a                     ; 07:489C
    ldh  a,[<$FF9C]                 ; 07:489D
    adc  [hl]                       ; 07:489F
    ldi  [hl],a                     ; 07:48A0
    ldh  a,[<$FF9B]                 ; 07:48A1
    add  [hl]                       ; 07:48A3
    ldi  [hl],a                     ; 07:48A4
    ldh  a,[<$FF9C]                 ; 07:48A5
    adc  [hl]                       ; 07:48A7
    ld   [hl],a                     ; 07:48A8
    ld   hl,$FF9D                   ; 07:48A9
    ldh  a,[<$FF97]                 ; 07:48AC
    sub  [hl]                       ; 07:48AE
    ld   hl,$FF9E                   ; 07:48AF
    ldh  a,[<$FF98]                 ; 07:48B2
    sbc  [hl]                       ; 07:48B4
    bit  7,a                        ; 07:48B5
    jr   z,Code0748DF               ; 07:48B7
    ld   hl,$FF9D                   ; 07:48B9
    ldh  a,[<$FF99]                 ; 07:48BC
    sub  [hl]                       ; 07:48BE
    ld   hl,$FF9E                   ; 07:48BF
    ldh  a,[<$FF9A]                 ; 07:48C2
    sbc  [hl]                       ; 07:48C4
    bit  7,a                        ; 07:48C5
    jr   nz,Code0748DF              ; 07:48C7
    ld   de,$0000                   ; 07:48C9
    ld   hl,$FF9B                   ; 07:48CC
    ldh  a,[<$FF9D]                 ; 07:48CF
    sub  [hl]                       ; 07:48D1
    ld   hl,$FF9C                   ; 07:48D2
    ldh  a,[<$FF9E]                 ; 07:48D5
    sbc  [hl]                       ; 07:48D7
    bit  7,a                        ; 07:48D8
    jr   nz,Code0748DD              ; 07:48DA
    inc  e                          ; 07:48DC
Code0748DD:
    scf                             ; 07:48DD
    ret                             ; 07:48DE

Code0748DF:
    scf                             ; 07:48DF
    ccf                             ; 07:48E0
    ret                             ; 07:48E1

SubL_0748E2:
    ld   a,$45                      ; 07:48E2
    call LoadSpriteAnySlot          ; 07:48E4
    jr   c,ReturnL_0748FB           ; 07:48E7
    ld   hl,$D11D                   ; 07:48E9
    add  hl,de                      ; 07:48EC
    ld   [hl],$E8                   ; 07:48ED
    ld   hl,$D12C                   ; 07:48EF
    add  hl,de                      ; 07:48F2
    ld   [hl],$03                   ; 07:48F3
    ld   hl,$D096                   ; 07:48F5
    add  hl,de                      ; 07:48F8
    ld   [hl],$40                   ; 07:48F9
ReturnL_0748FB:
    rst  $18                        ; 07:48FB  Return from 24-bit call

Data0748FC:                         ; 07:48FC
.db $18,$30,$D2,$09,$18,$38,$D0,$09,\
    $18,$40,$D0,$09,$18,$48,$D0,$09,\
    $18,$50,$D0,$09,$00,$10,$C0,$09,\
    $00,$18,$EC,$09,$00,$20,$FC,$09,\
    $00,$28,$EE,$09,$00,$30,$EC,$09,\
    $00,$38,$E8,$09,$00,$40,$C2,$09,\
    $00,$48,$C6,$09,$18,$00,$E6,$09,\
    $18,$08,$D0,$09,$18,$10,$C4,$09,\
    $18,$18,$C6,$01,$18,$20,$C8,$01,\
    $D0,$D2,$D4,$D6,$D8,$DA,$DC,$DE,\
    $E0,$E2
Code07494E:
    call Sub0749E4                  ; 07:494E
    ld   hl,$D11D                   ; 07:4951
    add  hl,bc                      ; 07:4954
    ld   e,[hl]                     ; 07:4955
    ld   hl,$D12C                   ; 07:4956
    add  hl,bc                      ; 07:4959
    ld   d,[hl]                     ; 07:495A
    call Sub074A45                  ; 07:495B
    ld   a,$28                      ; 07:495E
    ldh  [<$FF9F],a                 ; 07:4960
    ld   a,$38                      ; 07:4962
    ldh  [<$FFA1],a                 ; 07:4964
    xor  a                          ; 07:4966
    ld   [$D2E4],a                  ; 07:4967
    push bc                         ; 07:496A
    ld   de,$0000                   ; 07:496B
Code07496E:
    ld   hl,Data0748FC              ; 07:496E
    add  hl,de                      ; 07:4971
    ldi  a,[hl]                     ; 07:4972
    ldh  [<$FFA3],a                 ; 07:4973
    ldi  a,[hl]                     ; 07:4975
    ldh  [<$FFA4],a                 ; 07:4976
    ldi  a,[hl]                     ; 07:4978
    ldh  [<$FFA5],a                 ; 07:4979
    ldi  a,[hl]                     ; 07:497B
    ldh  [<$FFA6],a                 ; 07:497C
    ld   hl,$FFA3                   ; 07:497E
    ldh  a,[<$FFA1]                 ; 07:4981
    add  [hl]                       ; 07:4983
    ldh  [<$FFA3],a                 ; 07:4984
    ld   hl,$FFA4                   ; 07:4986
    ldh  a,[<$FF9F]                 ; 07:4989
    add  [hl]                       ; 07:498B
    ldh  [<$FFA4],a                 ; 07:498C
    ld   a,e                        ; 07:498E
    cp   $0D                        ; 07:498F
    jr   nc,Code0749BE              ; 07:4991
    push de                         ; 07:4993
    srl  e                          ; 07:4994
    ld   hl,$FF97                   ; 07:4996
    add  hl,de                      ; 07:4999
    ld   a,[hl]                     ; 07:499A
    and  a                          ; 07:499B
    jr   nz,Code0749AD              ; 07:499C
    ld   a,[$D2E4]                  ; 07:499E
    and  a                          ; 07:49A1
    jr   nz,Code0749AD              ; 07:49A2
    ld   a,$F4                      ; 07:49A4
    ldh  [<$FFA3],a                 ; 07:49A6
    xor  a                          ; 07:49A8
    ldh  [<$FFA4],a                 ; 07:49A9
    jr   Code0749B2                 ; 07:49AB
Code0749AD:
    ld   a,$01                      ; 07:49AD
    ld   [$D2E4],a                  ; 07:49AF
Code0749B2:
    ld   hl,$FF97                   ; 07:49B2
    add  hl,de                      ; 07:49B5
    ld   a,[hl]                     ; 07:49B6
    sla  a                          ; 07:49B7
    or   $D0                        ; 07:49B9
    ldh  [<$FFA5],a                 ; 07:49BB
    pop  de                         ; 07:49BD
Code0749BE:
    ld   hl,$C000                   ; 07:49BE
    ldh  a,[<$FFC1]                 ; 07:49C1
    ld   c,a                        ; 07:49C3
    ld   b,$00                      ; 07:49C4
    add  hl,bc                      ; 07:49C6
    ldh  a,[<$FFA3]                 ; 07:49C7
    ldi  [hl],a                     ; 07:49C9
    ldh  a,[<$FFA4]                 ; 07:49CA
    ldi  [hl],a                     ; 07:49CC
    ldh  a,[<$FFA5]                 ; 07:49CD
    ldi  [hl],a                     ; 07:49CF
    ldh  a,[<$FFA6]                 ; 07:49D0
    ldi  [hl],a                     ; 07:49D2
    push de                         ; 07:49D3
    call Sub0028FD                  ; 07:49D4
    pop  de                         ; 07:49D7
    inc  de                         ; 07:49D8
    inc  de                         ; 07:49D9
    inc  de                         ; 07:49DA
    inc  de                         ; 07:49DB
    ld   a,e                        ; 07:49DC
    cp   $48                        ; 07:49DD
    jp   nz,Code07496E              ; 07:49DF
    pop  bc                         ; 07:49E2
    ret                             ; 07:49E3

Sub0749E4:
    ld   hl,W_SpriteSubstate        ; 07:49E4
    add  hl,bc                      ; 07:49E7
    ld   a,[hl]                     ; 07:49E8
    rst  $00                        ; 07:49E9  Execute from 16-bit pointer table
.dw Code0749F0                      ; 07:49EA
.dw Code0749FF                      ; 07:49EC
.dw Return074A3E                    ; 07:49EE
Code0749F0:
    ld   hl,$D096                   ; 07:49F0
    add  hl,bc                      ; 07:49F3
    ld   a,[hl]                     ; 07:49F4
    dec  [hl]                       ; 07:49F5
    and  a                          ; 07:49F6
    jr   nz,Return0749FE            ; 07:49F7
    ld   hl,W_SpriteSubstate        ; 07:49F9
    add  hl,bc                      ; 07:49FC
    inc  [hl]                       ; 07:49FD
Return0749FE:
    ret                             ; 07:49FE

Code0749FF:
    ld   hl,$D0A5                   ; 07:49FF
    add  hl,bc                      ; 07:4A02
    ld   a,[hl]                     ; 07:4A03
    dec  [hl]                       ; 07:4A04
    and  a                          ; 07:4A05
    jr   nz,Code074A0E              ; 07:4A06
    ld   [hl],$02                   ; 07:4A08
    ld   a,$47                      ; 07:4A0A
    ldh  [<$FFF2],a                 ; 07:4A0C
Code074A0E:
    ld   a,$14                      ; 07:4A0E
    ldh  [<$FF97],a                 ; 07:4A10
    xor  a                          ; 07:4A12
    ldh  [<$FF98],a                 ; 07:4A13
    call GivePointsFF97             ; 07:4A15
    ld   hl,$D11D                   ; 07:4A18
    add  hl,bc                      ; 07:4A1B
    ld   e,[hl]                     ; 07:4A1C
    ld   hl,$D12C                   ; 07:4A1D
    add  hl,bc                      ; 07:4A20
    ld   d,[hl]                     ; 07:4A21
    ld   a,e                        ; 07:4A22
    sub  $14                        ; 07:4A23
    ld   e,a                        ; 07:4A25
    ld   a,d                        ; 07:4A26
    sbc  $00                        ; 07:4A27
    ld   d,a                        ; 07:4A29
    ld   hl,$D11D                   ; 07:4A2A
    add  hl,bc                      ; 07:4A2D
    ld   [hl],e                     ; 07:4A2E
    ld   hl,$D12C                   ; 07:4A2F
    add  hl,bc                      ; 07:4A32
    ld   [hl],d                     ; 07:4A33
    ld   a,e                        ; 07:4A34
    or   d                          ; 07:4A35
    and  a                          ; 07:4A36
    jr   nz,Return074A3E            ; 07:4A37
    ld   hl,W_SpriteSubstate        ; 07:4A39
    add  hl,bc                      ; 07:4A3C
    inc  [hl]                       ; 07:4A3D
Return074A3E:
    ret                             ; 07:4A3E

Data074A3F:                         ; 07:4A3F
.db $E8,$03,$64,$00,$0A,$00

Sub074A45:
    push bc                         ; 07:4A45
    xor  a                          ; 07:4A46
    ldh  [<$FF97],a                 ; 07:4A47
    ldh  [<$FF99],a                 ; 07:4A49
    ldh  [<$FF9B],a                 ; 07:4A4B
    ld   bc,$0000                   ; 07:4A4D
Code074A50:
    ld   hl,Data074A3F              ; 07:4A50
    add  hl,bc                      ; 07:4A53
    ld   a,e                        ; 07:4A54
    sub  [hl]                       ; 07:4A55
    inc  hl                         ; 07:4A56
    ld   a,d                        ; 07:4A57
    sbc  [hl]                       ; 07:4A58
    bit  7,a                        ; 07:4A59
    jr   nz,Code074A6C              ; 07:4A5B
    dec  hl                         ; 07:4A5D
    ld   a,e                        ; 07:4A5E
    sub  [hl]                       ; 07:4A5F
    ld   e,a                        ; 07:4A60
    inc  hl                         ; 07:4A61
    ld   a,d                        ; 07:4A62
    sbc  [hl]                       ; 07:4A63
    ld   d,a                        ; 07:4A64
    ld   hl,$FF97                   ; 07:4A65
    add  hl,bc                      ; 07:4A68
    inc  [hl]                       ; 07:4A69
    jr   Code074A50                 ; 07:4A6A
Code074A6C:
    inc  c                          ; 07:4A6C
    inc  c                          ; 07:4A6D
    ld   a,c                        ; 07:4A6E
    cp   $06                        ; 07:4A6F
    jr   nz,Code074A50              ; 07:4A71
    ld   a,e                        ; 07:4A73
    ldh  [<$FF9D],a                 ; 07:4A74
    pop  bc                         ; 07:4A76
    ret                             ; 07:4A77

Data074A78:                         ; 07:4A78
.db $40,$12,$40,$0F,$20,$0F,$00,$00,\
    $60,$0F,$90,$0F,$60,$0F,$00,$00
Code074A88:
    ld   a,[W_GameMode]             ; 07:4A88
    cp   $07                        ; 07:4A8B
    jr   z,Code074A93               ; 07:4A8D
    cp   $02                        ; 07:4A8F
    jr   nz,Code074AAF              ; 07:4A91
Code074A93:
    ld   a,[W_SublevelID]           ; 07:4A93
    sub  $3A                        ; 07:4A96
    sla  a                          ; 07:4A98
    ld   e,a                        ; 07:4A9A
    ld   d,$00                      ; 07:4A9B
    ld   hl,Data074A78              ; 07:4A9D
    add  hl,de                      ; 07:4AA0
    ldi  a,[hl]                     ; 07:4AA1
    push af                         ; 07:4AA2
    ld   a,[hl]                     ; 07:4AA3
    ld   hl,W_SpriteXHigh           ; 07:4AA4
    add  hl,bc                      ; 07:4AA7
    ld   [hl],a                     ; 07:4AA8
    pop  af                         ; 07:4AA9
    ld   hl,W_SpriteXLow            ; 07:4AAA
    add  hl,bc                      ; 07:4AAD
    ld   [hl],a                     ; 07:4AAE
Code074AAF:
    ld   hl,W_SpriteXHigh           ; 07:4AAF
    add  hl,bc                      ; 07:4AB2
    push hl                         ; 07:4AB3
    ld   a,[hl]                     ; 07:4AB4
    ld   d,a                        ; 07:4AB5
    ld   hl,W_SpriteXLow            ; 07:4AB6
    add  hl,bc                      ; 07:4AB9
    ld   a,[hl]                     ; 07:4ABA
    add  $09                        ; 07:4ABB
    ld   [hl],a                     ; 07:4ABD
    pop  hl                         ; 07:4ABE
    ld   a,$00                      ; 07:4ABF
    adc  [hl]                       ; 07:4AC1
    ld   [hl],a                     ; 07:4AC2
    ld   hl,W_SpriteYLow            ; 07:4AC3
    add  hl,bc                      ; 07:4AC6
    ld   a,[hl]                     ; 07:4AC7
    add  $80                        ; 07:4AC8
    ld   hl,$D1D1                   ; 07:4ACA
    add  hl,bc                      ; 07:4ACD
    ld   [hl],a                     ; 07:4ACE
    ret                             ; 07:4ACF

Data074AD0:                         ; 07:4AD0
.db $52,$27,$50,$27
Data074AD4:                         ; 07:4AD4
.db $84,$01,$84,$01
Data074AD8:                         ; 07:4AD8
.db $A8,$01,$AA,$01
Data074ADC:                         ; 07:4ADC
.db $67,$67,$77,$00,$67,$67,$77,$00,\
    $67,$67,$77,$00,$67,$67,$77,$00,\
    $67,$67,$77,$00,$67,$67,$77,$00,\
    $67,$67,$77,$00,$67,$67,$A7,$00
Data074AFC:                         ; 07:4AFC
.db $67,$67,$67,$00,$57,$67,$77,$00,\
    $67,$67,$77,$00,$67,$67,$77,$00,\
    $67,$67,$77,$00,$67,$67,$67,$00,\
    $67,$47,$77,$00,$67,$57,$67,$00
Code074B1C:
    xor  a                          ; 07:4B1C
    ld   [$C1FA],a                  ; 07:4B1D
    ld   [$C542],a                  ; 07:4B20
    call Sub074BED                  ; 07:4B23
    call Sub074BFC                  ; 07:4B26
    ld   hl,W_SpriteXHigh           ; 07:4B29
    add  hl,bc                      ; 07:4B2C
    ld   a,[hl]                     ; 07:4B2D
    ld   [$D2E5],a                  ; 07:4B2E
    push hl                         ; 07:4B31
    ld   hl,W_SpriteXLow            ; 07:4B32
    add  hl,bc                      ; 07:4B35
    ld   a,[hl]                     ; 07:4B36
    ld   [$D2E4],a                  ; 07:4B37
    add  $EF                        ; 07:4B3A
    ld   [hl],a                     ; 07:4B3C
    pop  hl                         ; 07:4B3D
    ld   a,$FF                      ; 07:4B3E
    adc  [hl]                       ; 07:4B40
    ld   [hl],a                     ; 07:4B41
    ld   hl,Data074AD0              ; 07:4B42
    call Disp16x16Sprite            ; 07:4B45
    ld   hl,W_SpriteXLow            ; 07:4B48
    add  hl,bc                      ; 07:4B4B
    ld   a,[$D2E4]                  ; 07:4B4C
    ld   [hl],a                     ; 07:4B4F
    ld   hl,W_SpriteXHigh           ; 07:4B50
    add  hl,bc                      ; 07:4B53
    ld   a,[$D2E5]                  ; 07:4B54
    ld   [hl],a                     ; 07:4B57
    ld   a,[W_GameMode]             ; 07:4B58
    cp   $07                        ; 07:4B5B
    ret  z                          ; 07:4B5D
    cp   $02                        ; 07:4B5E
    ret  z                          ; 07:4B60
    ldh  a,[<$FFC1]                 ; 07:4B61
    push af                         ; 07:4B63
    ld   a,$00                      ; 07:4B64
    ldh  [<$FFC1],a                 ; 07:4B66
    ld   a,[W_LevelID]              ; 07:4B68
    ld   e,a                        ; 07:4B6B
    ld   d,$00                      ; 07:4B6C
    ld   hl,Data074ADC              ; 07:4B6E
    ld   a,[W_SPFlag]               ; 07:4B71
    and  a                          ; 07:4B74
    jr   z,Code074B7A               ; 07:4B75
    ld   hl,Data074AFC              ; 07:4B77
Code074B7A:
    add  hl,de                      ; 07:4B7A
    ld   a,[hl]                     ; 07:4B7B
    ldh  [<$FF97],a                 ; 07:4B7C
    ld   hl,W_SpriteYLow            ; 07:4B7E
    add  hl,bc                      ; 07:4B81
    ld   a,[hl]                     ; 07:4B82
    ld   [$D2E2],a                  ; 07:4B83
    ld   hl,W_SpriteXLow            ; 07:4B86
    add  hl,bc                      ; 07:4B89
    ld   a,[hl]                     ; 07:4B8A
    ld   [$D2E0],a                  ; 07:4B8B
    ld   hl,W_SpriteXHigh           ; 07:4B8E
    add  hl,bc                      ; 07:4B91
    ld   a,[hl]                     ; 07:4B92
    ld   [$D2E1],a                  ; 07:4B93
    ld   d,a                        ; 07:4B96
    push hl                         ; 07:4B97
    ld   hl,W_SpriteXLow            ; 07:4B98
    add  hl,bc                      ; 07:4B9B
    ldh  a,[<$FF97]                 ; 07:4B9C
    add  [hl]                       ; 07:4B9E
    ld   [hl],a                     ; 07:4B9F
    ld   a,$00                      ; 07:4BA0
    adc  d                          ; 07:4BA2
    pop  hl                         ; 07:4BA3
    ld   [hl],a                     ; 07:4BA4
    ld   hl,$D1D1                   ; 07:4BA5
    add  hl,bc                      ; 07:4BA8
    ld   a,[hl]                     ; 07:4BA9
    ld   hl,W_SpriteYLow            ; 07:4BAA
    add  hl,bc                      ; 07:4BAD
    ld   [hl],a                     ; 07:4BAE
    ld   hl,Data074AD4              ; 07:4BAF
    call Disp16x16Sprite            ; 07:4BB2
    ld   hl,W_SpriteYLow            ; 07:4BB5
    add  hl,bc                      ; 07:4BB8
    ld   a,[hl]                     ; 07:4BB9
    add  $10                        ; 07:4BBA
    ld   [hl],a                     ; 07:4BBC
    ld   hl,Data074AD4              ; 07:4BBD
    call Disp16x16Sprite            ; 07:4BC0
    ld   hl,W_SpriteYLow            ; 07:4BC3
    add  hl,bc                      ; 07:4BC6
    ld   a,[hl]                     ; 07:4BC7
    add  $10                        ; 07:4BC8
    ld   [hl],a                     ; 07:4BCA
    ld   hl,Data074AD8              ; 07:4BCB
    call Disp16x16Sprite            ; 07:4BCE
    ld   hl,W_SpriteXLow            ; 07:4BD1
    add  hl,bc                      ; 07:4BD4
    ld   a,[$D2E0]                  ; 07:4BD5
    ld   [hl],a                     ; 07:4BD8
    ld   hl,W_SpriteXHigh           ; 07:4BD9
    add  hl,bc                      ; 07:4BDC
    ld   a,[$D2E1]                  ; 07:4BDD
    ld   [hl],a                     ; 07:4BE0
    ld   hl,W_SpriteYLow            ; 07:4BE1
    add  hl,bc                      ; 07:4BE4
    ld   a,[$D2E2]                  ; 07:4BE5
    ld   [hl],a                     ; 07:4BE8
    pop  af                         ; 07:4BE9
    ldh  [<$FFC1],a                 ; 07:4BEA
    ret                             ; 07:4BEC

Sub074BED:
    ld   hl,W_SpriteSubstate        ; 07:4BED
    add  hl,bc                      ; 07:4BF0
    ld   a,[hl]                     ; 07:4BF1
    rst  $00                        ; 07:4BF2  Execute from 16-bit pointer table
.dw Code074CA7                      ; 07:4BF3
.dw Code074EA9                      ; 07:4BF5
.dw Code075057                      ; 07:4BF7
.dw Return074BFB                    ; 07:4BF9
Return074BFB:
    ret                             ; 07:4BFB

Sub074BFC:
    ld   a,[W_GameMode]             ; 07:4BFC
    cp   $07                        ; 07:4BFF
    jp   z,Code074C66               ; 07:4C01
    cp   $02                        ; 07:4C04
    ret  nz                         ; 07:4C06
    ld   hl,W_SpriteSubstate        ; 07:4C07
    add  hl,bc                      ; 07:4C0A
    ld   a,[hl]                     ; 07:4C0B
    and  a                          ; 07:4C0C
    ret  z                          ; 07:4C0D
    push bc                         ; 07:4C0E
    ld   hl,$D12C                   ; 07:4C0F
    add  hl,bc                      ; 07:4C12
    ld   a,[hl]                     ; 07:4C13
    xor  $80                        ; 07:4C14
    ld   e,a                        ; 07:4C16
    ld   d,$00                      ; 07:4C17
    ld   hl,W_SpriteXHigh           ; 07:4C19
    add  hl,bc                      ; 07:4C1C
    ld   a,[hl]                     ; 07:4C1D
    ld   hl,W_SpriteXLow            ; 07:4C1E
    add  hl,bc                      ; 07:4C21
    ld   c,[hl]                     ; 07:4C22
    ld   b,a                        ; 07:4C23
    ld   hl,$C502                   ; 07:4C24
    add  hl,de                      ; 07:4C27
    push hl                         ; 07:4C28
    ld   hl,$C501                   ; 07:4C29
    add  hl,de                      ; 07:4C2C
    ld   a,[hl]                     ; 07:4C2D
    add  $10                        ; 07:4C2E
    ldh  [<$FF97],a                 ; 07:4C30
    pop  hl                         ; 07:4C32
    ld   a,[hl]                     ; 07:4C33
    adc  $00                        ; 07:4C34
    ldh  [<$FF98],a                 ; 07:4C36
    ld   hl,$FF97                   ; 07:4C38
    ld   a,c                        ; 07:4C3B
    sub  [hl]                       ; 07:4C3C
    ld   hl,$FF98                   ; 07:4C3D
    ld   a,b                        ; 07:4C40
    sbc  [hl]                       ; 07:4C41
    bit  7,a                        ; 07:4C42
    jr   z,Code074C64               ; 07:4C44
    ld   hl,$C512                   ; 07:4C46
    add  hl,de                      ; 07:4C49
    ld   a,[hl]                     ; 07:4C4A
    ldh  [<$FF97],a                 ; 07:4C4B
    ld   hl,$C513                   ; 07:4C4D
    add  hl,de                      ; 07:4C50
    ld   a,[hl]                     ; 07:4C51
    ldh  [<$FF98],a                 ; 07:4C52
    ld   hl,$C502                   ; 07:4C54
    add  hl,de                      ; 07:4C57
    push hl                         ; 07:4C58
    ld   hl,$C501                   ; 07:4C59
    add  hl,de                      ; 07:4C5C
    ldh  a,[<$FF97]                 ; 07:4C5D
    ld   [hl],a                     ; 07:4C5F
    pop  hl                         ; 07:4C60
    ldh  a,[<$FF98]                 ; 07:4C61
    ld   [hl],a                     ; 07:4C63
Code074C64:
    pop  bc                         ; 07:4C64
    ret                             ; 07:4C65

Code074C66:
    ld   hl,W_SpriteSubstate        ; 07:4C66
    add  hl,bc                      ; 07:4C69
    ld   a,[hl]                     ; 07:4C6A
    and  a                          ; 07:4C6B
    ret  z                          ; 07:4C6C
    ld   a,[W_PlayerState]          ; 07:4C6D
    cp   $05                        ; 07:4C70
    ret  z                          ; 07:4C72
    cp   $11                        ; 07:4C73
    ret  z                          ; 07:4C75
    cp   $04                        ; 07:4C76
    ret  z                          ; 07:4C78
    ld   hl,W_SpriteXHigh           ; 07:4C79
    add  hl,bc                      ; 07:4C7C
    ld   d,[hl]                     ; 07:4C7D
    ld   hl,W_SpriteXLow            ; 07:4C7E
    add  hl,bc                      ; 07:4C81
    ld   e,[hl]                     ; 07:4C82
    ldh  a,[<H_PlayerXLow]          ; 07:4C83
    add  $10                        ; 07:4C85
    ldh  [<$FF97],a                 ; 07:4C87
    ldh  a,[<H_PlayerXHigh]         ; 07:4C89
    adc  $00                        ; 07:4C8B
    ldh  [<$FF98],a                 ; 07:4C8D
    ld   hl,$FF97                   ; 07:4C8F
    ld   a,e                        ; 07:4C92
    sub  [hl]                       ; 07:4C93
    ld   hl,$FF98                   ; 07:4C94
    ld   a,d                        ; 07:4C97
    sbc  [hl]                       ; 07:4C98
    bit  7,a                        ; 07:4C99
    ret  z                          ; 07:4C9B
    ld   a,[$C1CA]                  ; 07:4C9C
    ldh  [<H_PlayerXLow],a          ; 07:4C9F
    ld   a,[$C1CB]                  ; 07:4CA1
    ldh  [<H_PlayerXHigh],a         ; 07:4CA4
    ret                             ; 07:4CA6

Code074CA7:
    ld   a,[W_GameMode]             ; 07:4CA7
    cp   $02                        ; 07:4CAA
    jp   z,Code074D44               ; 07:4CAC
    cp   $07                        ; 07:4CAF
    jp   z,Code074DCC               ; 07:4CB1

Sub074CB4:
    ld   hl,W_SpriteXHigh           ; 07:4CB4
    add  hl,bc                      ; 07:4CB7
    ld   d,[hl]                     ; 07:4CB8
    ld   hl,W_SpriteXLow            ; 07:4CB9
    add  hl,bc                      ; 07:4CBC
    ld   e,[hl]                     ; 07:4CBD
    ldh  a,[<H_PlayerYHigh]         ; 07:4CBE
    bit  7,a                        ; 07:4CC0
    jr   nz,Code074CCC              ; 07:4CC2
    cp   $01                        ; 07:4CC4
    ret  z                          ; 07:4CC6
    ldh  a,[<H_PlayerYLow]          ; 07:4CC7
    cp   $F0                        ; 07:4CC9
    ret  nc                         ; 07:4CCB
Code074CCC:
    ldh  a,[<H_PlayerXLow]          ; 07:4CCC
    add  $11                        ; 07:4CCE
    ldh  [<$FF97],a                 ; 07:4CD0
    ldh  a,[<H_PlayerXHigh]         ; 07:4CD2
    adc  $00                        ; 07:4CD4
    ldh  [<$FF98],a                 ; 07:4CD6
    ld   hl,$FF97                   ; 07:4CD8
    ld   a,e                        ; 07:4CDB
    sub  [hl]                       ; 07:4CDC
    ld   hl,$FF98                   ; 07:4CDD
    ld   a,d                        ; 07:4CE0
    sbc  [hl]                       ; 07:4CE1
    bit  7,a                        ; 07:4CE2
    ret  z                          ; 07:4CE4
    ld   hl,W_SpriteSubstate        ; 07:4CE5
    add  hl,bc                      ; 07:4CE8
    inc  [hl]                       ; 07:4CE9
    ld   a,$05                      ; 07:4CEA
    ld   [W_PlayerState],a          ; 07:4CEC
    ld   a,$07                      ; 07:4CEF
    ld   [$C1C2],a                  ; 07:4CF1
    ld   a,$00                      ; 07:4CF4
    ld   [$C1D3],a                  ; 07:4CF6
    ld   [$C1DD],a                  ; 07:4CF9
    ld   [$C1E7],a                  ; 07:4CFC
    inc  a                          ; 07:4CFF
    ld   [$C1F3],a                  ; 07:4D00
    ld   a,$02                      ; 07:4D03
    ld   [$C1C3],a                  ; 07:4D05
    ld   a,e                        ; 07:4D08
    add  $F0                        ; 07:4D09
    ldh  [<H_PlayerXLow],a          ; 07:4D0B
    ld   a,d                        ; 07:4D0D
    adc  $FF                        ; 07:4D0E
    ldh  [<H_PlayerXHigh],a         ; 07:4D10
    ld   a,$46                      ; 07:4D12
    ldh  [<$FFF2],a                 ; 07:4D14
    ld   a,$00                      ; 07:4D16
    ld   [$C181],a                  ; 07:4D18
    ldh  a,[<H_PlayerYHigh]         ; 07:4D1B
    bit  7,a                        ; 07:4D1D
    jr   nz,Code074D27              ; 07:4D1F
    ldh  a,[<H_PlayerYLow]          ; 07:4D21
    cp   $20                        ; 07:4D23
    jr   nc,Code074D2E              ; 07:4D25
Code074D27:
    ld   a,$20                      ; 07:4D27
    ldh  [<H_PlayerYLow],a          ; 07:4D29
    xor  a                          ; 07:4D2B
    ldh  [<H_PlayerYHigh],a         ; 07:4D2C
Code074D2E:
    ld   hl,$D11D                   ; 07:4D2E
    add  hl,bc                      ; 07:4D31
    ldh  a,[<H_PlayerYLow]          ; 07:4D32
    ld   [hl],a                     ; 07:4D34
    call Sub074E79                  ; 07:4D35
    ld   a,[W_GameMode]             ; 07:4D38
    cp   $07                        ; 07:4D3B
    ret  nz                         ; 07:4D3D
    ld   a,$01                      ; 07:4D3E
    ld   [$C36A],a                  ; 07:4D40
    ret                             ; 07:4D43

Code074D44:
    ld   e,$00                      ; 07:4D44
    call Sub074E41                  ; 07:4D46
    jr   nc,Code074D52              ; 07:4D49
    ld   e,$01                      ; 07:4D4B
    call Sub074E41                  ; 07:4D4D
    jr   c,Return074DCB             ; 07:4D50
Code074D52:
    ld   a,e                        ; 07:4D52
    sla  a                          ; 07:4D53
    rl   a                          ; 07:4D55
    xor  $01                        ; 07:4D57
    ld   [$C36A],a                  ; 07:4D59
    ld   a,$46                      ; 07:4D5C
    ldh  [<$FFF2],a                 ; 07:4D5E
    xor  a                          ; 07:4D60
    ld   [$C181],a                  ; 07:4D61
    ld   hl,$C509                   ; 07:4D64
    add  hl,de                      ; 07:4D67
    ld   [hl],$05                   ; 07:4D68
    ld   hl,$C50A                   ; 07:4D6A
    add  hl,de                      ; 07:4D6D
    ld   [hl],$07                   ; 07:4D6E
    xor  a                          ; 07:4D70
    ld   hl,$C51B                   ; 07:4D71
    add  hl,de                      ; 07:4D74
    ld   [hl],a                     ; 07:4D75
    ld   hl,$C525                   ; 07:4D76
    add  hl,de                      ; 07:4D79
    ld   [hl],a                     ; 07:4D7A
    ld   hl,$C52F                   ; 07:4D7B
    add  hl,de                      ; 07:4D7E
    ld   [hl],a                     ; 07:4D7F
    inc  a                          ; 07:4D80
    ld   hl,$C53B                   ; 07:4D81
    add  hl,de                      ; 07:4D84
    ld   [hl],a                     ; 07:4D85
    inc  a                          ; 07:4D86
    ld   hl,$C50B                   ; 07:4D87
    add  hl,de                      ; 07:4D8A
    ld   [hl],a                     ; 07:4D8B
    push de                         ; 07:4D8C
    ld   hl,W_SpriteXHigh           ; 07:4D8D
    add  hl,bc                      ; 07:4D90
    ld   d,[hl]                     ; 07:4D91
    ld   hl,W_SpriteXLow            ; 07:4D92
    add  hl,bc                      ; 07:4D95
    ld   e,[hl]                     ; 07:4D96
    ld   a,e                        ; 07:4D97
    add  $F0                        ; 07:4D98
    ldh  [<$FF97],a                 ; 07:4D9A
    ld   a,d                        ; 07:4D9C
    adc  $FF                        ; 07:4D9D
    ldh  [<$FF98],a                 ; 07:4D9F
    pop  de                         ; 07:4DA1
    ld   hl,$C501                   ; 07:4DA2
    add  hl,de                      ; 07:4DA5
    ldh  a,[<$FF97]                 ; 07:4DA6
    ld   [hl],a                     ; 07:4DA8
    ld   hl,$C502                   ; 07:4DA9
    add  hl,de                      ; 07:4DAC
    ldh  a,[<$FF98]                 ; 07:4DAD
    ld   [hl],a                     ; 07:4DAF
    ld   hl,$C503                   ; 07:4DB0
    add  hl,de                      ; 07:4DB3
    ld   a,[hl]                     ; 07:4DB4
    cp   $20                        ; 07:4DB5
    jr   nc,Code074DBB              ; 07:4DB7
    ld   a,$20                      ; 07:4DB9
Code074DBB:
    ld   [hl],a                     ; 07:4DBB
    ld   hl,$D11D                   ; 07:4DBC
    add  hl,bc                      ; 07:4DBF
    ld   [hl],a                     ; 07:4DC0
    ld   hl,$D12C                   ; 07:4DC1
    add  hl,bc                      ; 07:4DC4
    ld   [hl],e                     ; 07:4DC5
    ld   hl,W_SpriteSubstate        ; 07:4DC6
    add  hl,bc                      ; 07:4DC9
    inc  [hl]                       ; 07:4DCA
Return074DCB:
    ret                             ; 07:4DCB

Code074DCC:
    ld   a,[W_GameMode]             ; 07:4DCC
    cp   $07                        ; 07:4DCF
    jr   nz,Return074E40            ; 07:4DD1
    call Sub074CB4                  ; 07:4DD3
    ld   a,[W_PlayerState]          ; 07:4DD6
    cp   $05                        ; 07:4DD9
    jr   nz,Code074DE4              ; 07:4DDB
    ld   a,$02                      ; 07:4DDD
    ld   [W_SpriteSubstate],a       ; 07:4DDF
    jr   Return074E40               ; 07:4DE2
Code074DE4:
    ld   hl,W_SpriteXHigh           ; 07:4DE4
    add  hl,bc                      ; 07:4DE7
    ld   d,[hl]                     ; 07:4DE8
    ld   hl,W_SpriteXLow            ; 07:4DE9
    add  hl,bc                      ; 07:4DEC
    ld   e,[hl]                     ; 07:4DED
    ld   a,[$C3B0]                  ; 07:4DEE
    add  $10                        ; 07:4DF1
    ldh  [<$FF97],a                 ; 07:4DF3
    ld   a,[$C3B1]                  ; 07:4DF5
    adc  $00                        ; 07:4DF8
    ldh  [<$FF98],a                 ; 07:4DFA
    ld   hl,$FF97                   ; 07:4DFC
    ld   a,e                        ; 07:4DFF
    sub  [hl]                       ; 07:4E00
    ld   hl,$FF98                   ; 07:4E01
    ld   a,d                        ; 07:4E04
    sbc  [hl]                       ; 07:4E05
    bit  7,a                        ; 07:4E06
    jr   z,Return074E40             ; 07:4E08
    ld   hl,W_SpriteSubstate        ; 07:4E0A
    add  hl,bc                      ; 07:4E0D
    inc  [hl]                       ; 07:4E0E
    ld   a,e                        ; 07:4E0F
    add  $F0                        ; 07:4E10
    ld   [W_SpriteXLow],a           ; 07:4E12
    ld   a,d                        ; 07:4E15
    adc  $FF                        ; 07:4E16
    ld   [W_SpriteXHigh],a          ; 07:4E18
    ld   a,$46                      ; 07:4E1B
    ldh  [<$FFF2],a                 ; 07:4E1D
    ld   a,$00                      ; 07:4E1F
    ld   [$C181],a                  ; 07:4E21
    ld   a,[W_SpriteYLow]           ; 07:4E24
    cp   $20                        ; 07:4E27
    jr   nc,Code074E30              ; 07:4E29
    ld   a,$20                      ; 07:4E2B
    ld   [W_SpriteYLow],a           ; 07:4E2D
Code074E30:
    ld   hl,$D11D                   ; 07:4E30
    add  hl,bc                      ; 07:4E33
    ld   a,[W_SpriteYLow]           ; 07:4E34
    ld   [hl],a                     ; 07:4E37
    xor  a                          ; 07:4E38
    ld   [$C36A],a                  ; 07:4E39
    inc  a                          ; 07:4E3C
    ld   [W_SpriteSubstate],a       ; 07:4E3D
Return074E40:
    ret                             ; 07:4E40

Sub074E41:
    push bc                         ; 07:4E41
    ld   hl,W_SpriteXHigh           ; 07:4E42
    add  hl,bc                      ; 07:4E45
    ld   a,[hl]                     ; 07:4E46
    ld   hl,W_SpriteXLow            ; 07:4E47
    add  hl,bc                      ; 07:4E4A
    ld   c,[hl]                     ; 07:4E4B
    ld   b,a                        ; 07:4E4C
    call Sub07483F                  ; 07:4E4D
    ld   hl,$C502                   ; 07:4E50
    add  hl,de                      ; 07:4E53
    push hl                         ; 07:4E54
    ld   hl,$C501                   ; 07:4E55
    add  hl,de                      ; 07:4E58
    ld   a,[hl]                     ; 07:4E59
    add  $10                        ; 07:4E5A
    ldh  [<$FF97],a                 ; 07:4E5C
    pop  hl                         ; 07:4E5E
    ld   a,[hl]                     ; 07:4E5F
    adc  $00                        ; 07:4E60
    ldh  [<$FF98],a                 ; 07:4E62
    ld   hl,$FF97                   ; 07:4E64
    ld   a,c                        ; 07:4E67
    sub  [hl]                       ; 07:4E68
    ld   hl,$FF98                   ; 07:4E69
    ld   a,b                        ; 07:4E6C
    sbc  [hl]                       ; 07:4E6D
    bit  7,a                        ; 07:4E6E
    jr   nz,Code074E75              ; 07:4E70
    pop  bc                         ; 07:4E72
    scf                             ; 07:4E73
    ret                             ; 07:4E74

Code074E75:
    pop  bc                         ; 07:4E75
    scf                             ; 07:4E76
    ccf                             ; 07:4E77
    ret                             ; 07:4E78

Sub074E79:
    ld   de,$000E                   ; 07:4E79
Code074E7C:
    ld   hl,W_SpriteID              ; 07:4E7C
    add  hl,de                      ; 07:4E7F
    ld   a,[hl]                     ; 07:4E80
    cp   $46                        ; 07:4E81
    jr   z,Code074E94               ; 07:4E83
    cp   $09                        ; 07:4E85
    jr   z,Code074E94               ; 07:4E87
    xor  a                          ; 07:4E89
    ld   hl,W_SpriteStatus          ; 07:4E8A
    add  hl,de                      ; 07:4E8D
    ld   [hl],a                     ; 07:4E8E
    ld   hl,W_SpriteID              ; 07:4E8F
    add  hl,de                      ; 07:4E92
    ld   [hl],a                     ; 07:4E93
Code074E94:
    dec  e                          ; 07:4E94
    bit  7,e                        ; 07:4E95
    jr   z,Code074E7C               ; 07:4E97
    ret                             ; 07:4E99

Data074E9A:                         ; 07:4E9A
.db $F4,$01,$C8,$00,$50,$00,$28,$00,\
    $0A,$00
Data074EA4:                         ; 07:4EA4
.db $08,$06,$04,$02,$00
Code074EA9:
    ld   hl,W_SpriteYSpeed          ; 07:4EA9
    add  hl,bc                      ; 07:4EAC
    ld   [hl],$20                   ; 07:4EAD
    ld   hl,W_SpriteYLow            ; 07:4EAF
    add  hl,bc                      ; 07:4EB2
    ld   a,[hl]                     ; 07:4EB3
    ldh  [<$FF99],a                 ; 07:4EB4
    push hl                         ; 07:4EB6
    call Sub001A79                  ; 07:4EB7
    pop  hl                         ; 07:4EBA
    ld   e,$00                      ; 07:4EBB
    ld   a,[W_GameMode]             ; 07:4EBD
    cp   $02                        ; 07:4EC0
    jp   z,Code074FB3               ; 07:4EC2
    cp   $07                        ; 07:4EC5
    jp   z,Code074F7F               ; 07:4EC7
Code074ECA:
    ld   a,[hl]                     ; 07:4ECA
    cp   $CC                        ; 07:4ECB
    jr   c,Code074ED4               ; 07:4ECD
    inc  e                          ; 07:4ECF
    ld   [hl],$CC                   ; 07:4ED0
    jr   Code074EF4                 ; 07:4ED2
Code074ED4:
    push af                         ; 07:4ED4
    ldh  a,[<H_PlayerYLow]          ; 07:4ED5
    cp   $C0                        ; 07:4ED7
    jr   z,Code074EF3               ; 07:4ED9
    ldh  a,[<H_GlobalTimer]         ; 07:4EDB
    and  $03                        ; 07:4EDD
    jr   nz,Code074EF3              ; 07:4EDF
    ld   d,$07                      ; 07:4EE1
    ld   a,[$C1C6]                  ; 07:4EE3
    cp   $07                        ; 07:4EE6
    jr   nz,Code074EEC              ; 07:4EE8
    ld   d,$0C                      ; 07:4EEA
Code074EEC:
    ld   a,d                        ; 07:4EEC
    ld   [$C1C2],a                  ; 07:4EED
    ld   [$C1C6],a                  ; 07:4EF0
Code074EF3:
    pop  af                         ; 07:4EF3
Code074EF4:
    ld   hl,$FF99                   ; 07:4EF4
    sub  [hl]                       ; 07:4EF7
    ld   [hl],a                     ; 07:4EF8
    ldh  a,[<H_PlayerYLow]          ; 07:4EF9
    ld   [$C1CC],a                  ; 07:4EFB
    add  [hl]                       ; 07:4EFE
    cp   $C0                        ; 07:4EFF
    jr   c,Code074F06               ; 07:4F01
    inc  e                          ; 07:4F03
    ld   a,$C0                      ; 07:4F04
Code074F06:
    ldh  [<H_PlayerYLow],a          ; 07:4F06
    ld   hl,$C1CC                   ; 07:4F08
    sub  [hl]                       ; 07:4F0B
    ld   [$C1D7],a                  ; 07:4F0C
    ld   a,[$C27D]                  ; 07:4F0F
    ldh  [<H_CameraY],a             ; 07:4F12
    ld   a,[$C27E]                  ; 07:4F14
    ldh  [<$FFBB],a                 ; 07:4F17
    push bc                         ; 07:4F19
    push de                         ; 07:4F1A
    ld   a,$07                      ; 07:4F1B
    rst  $10                        ; 07:4F1D  24-bit call
.dl SubL_0374C7                     ; 07:4F1E
    pop  de                         ; 07:4F21
    pop  bc                         ; 07:4F22
    ld   a,e                        ; 07:4F23
    cp   $02                        ; 07:4F24
    jr   nz,Return074F75            ; 07:4F26
    ld   hl,W_SpriteSubstate        ; 07:4F28
    add  hl,bc                      ; 07:4F2B
    inc  [hl]                       ; 07:4F2C
    ld   hl,$D0A5                   ; 07:4F2D
    add  hl,bc                      ; 07:4F30
    ld   [hl],$30                   ; 07:4F31
    ld   a,[W_GameMode]             ; 07:4F33
    cp   $07                        ; 07:4F36
    jr   z,Code074F76               ; 07:4F38
    ld   de,$0000                   ; 07:4F3A
    ld   hl,$D11D                   ; 07:4F3D
    add  hl,bc                      ; 07:4F40
    ld   a,[hl]                     ; 07:4F41
    cp   $48                        ; 07:4F42
    jr   c,Code074F5A               ; 07:4F44
    inc  de                         ; 07:4F46
    inc  de                         ; 07:4F47
    cp   $70                        ; 07:4F48
    jr   c,Code074F5A               ; 07:4F4A
    inc  de                         ; 07:4F4C
    inc  de                         ; 07:4F4D
    cp   $88                        ; 07:4F4E
    jr   c,Code074F5A               ; 07:4F50
    inc  de                         ; 07:4F52
    inc  de                         ; 07:4F53
    cp   $B0                        ; 07:4F54
    jr   c,Code074F5A               ; 07:4F56
    inc  de                         ; 07:4F58
    inc  de                         ; 07:4F59
Code074F5A:
    push de                         ; 07:4F5A
    srl  e                          ; 07:4F5B
    ld   hl,Data074EA4              ; 07:4F5D
    add  hl,de                      ; 07:4F60
    ld   a,[hl]                     ; 07:4F61
    ldh  [<$FF9B],a                 ; 07:4F62
    pop  de                         ; 07:4F64
    ld   hl,Data074E9A              ; 07:4F65
    add  hl,de                      ; 07:4F68
    ldi  a,[hl]                     ; 07:4F69
    ldh  [<$FF97],a                 ; 07:4F6A
    ld   a,[hl]                     ; 07:4F6C
    ldh  [<$FF98],a                 ; 07:4F6D
    call GivePointsFF97             ; 07:4F6F
    call SpawnScoreSprite           ; 07:4F72
Return074F75:
    ret                             ; 07:4F75

Code074F76:
    push bc                         ; 07:4F76
    ld   a,$07                      ; 07:4F77
    rst  $10                        ; 07:4F79  24-bit call
.dl SubL_075D06                     ; 07:4F7A
    pop  bc                         ; 07:4F7D
    ret                             ; 07:4F7E

Code074F7F:
    ld   a,[W_PlayerState]          ; 07:4F7F
    cp   $05                        ; 07:4F82
    jp   z,Code074ECA               ; 07:4F84
    ld   a,[hl]                     ; 07:4F87
    cp   $D0                        ; 07:4F88
    jr   c,Code074F8F               ; 07:4F8A
    inc  e                          ; 07:4F8C
    ld   [hl],$D0                   ; 07:4F8D
Code074F8F:
    ld   hl,$FF99                   ; 07:4F8F
    sub  [hl]                       ; 07:4F92
    ld   [hl],a                     ; 07:4F93
    ld   a,[W_SpriteYLow]           ; 07:4F94
    add  [hl]                       ; 07:4F97
    cp   $D0                        ; 07:4F98
    jr   c,Code074F9F               ; 07:4F9A
    inc  e                          ; 07:4F9C
    ld   a,$D0                      ; 07:4F9D
Code074F9F:
    ld   [W_SpriteYLow],a           ; 07:4F9F
    ld   a,e                        ; 07:4FA2
    cp   $02                        ; 07:4FA3
    jr   nz,Return074FB2            ; 07:4FA5
    ld   hl,W_SpriteSubstate        ; 07:4FA7
    add  hl,bc                      ; 07:4FAA
    inc  [hl]                       ; 07:4FAB
    ld   hl,$D0A5                   ; 07:4FAC
    add  hl,bc                      ; 07:4FAF
    ld   [hl],$30                   ; 07:4FB0
Return074FB2:
    ret                             ; 07:4FB2

Code074FB3:
    push hl                         ; 07:4FB3
    ld   hl,$D12C                   ; 07:4FB4
    add  hl,bc                      ; 07:4FB7
    ld   c,[hl]                     ; 07:4FB8
    ld   b,$00                      ; 07:4FB9
    pop  hl                         ; 07:4FBB
    ld   a,[hl]                     ; 07:4FBC
    cp   $D0                        ; 07:4FBD
    jr   c,Code074FC6               ; 07:4FBF
    inc  e                          ; 07:4FC1
    ld   [hl],$D0                   ; 07:4FC2
    jr   Code074FEE                 ; 07:4FC4
Code074FC6:
    push af                         ; 07:4FC6
    ld   hl,$C503                   ; 07:4FC7
    add  hl,bc                      ; 07:4FCA
    ld   a,[hl]                     ; 07:4FCB
    cp   $C0                        ; 07:4FCC
    jr   z,Code074FED               ; 07:4FCE
    ldh  a,[<H_GlobalTimer]         ; 07:4FD0
    and  $03                        ; 07:4FD2
    jr   nz,Code074FED              ; 07:4FD4
    ld   d,$07                      ; 07:4FD6
    ld   hl,$C50E                   ; 07:4FD8
    add  hl,bc                      ; 07:4FDB
    ld   a,[hl]                     ; 07:4FDC
    cp   $07                        ; 07:4FDD
    jr   nz,Code074FE3              ; 07:4FDF
    ld   d,$0C                      ; 07:4FE1
Code074FE3:
    ld   hl,$C50A                   ; 07:4FE3
    add  hl,bc                      ; 07:4FE6
    ld   [hl],d                     ; 07:4FE7
    ld   hl,$C50E                   ; 07:4FE8
    add  hl,bc                      ; 07:4FEB
    ld   [hl],d                     ; 07:4FEC
Code074FED:
    pop  af                         ; 07:4FED
Code074FEE:
    ld   hl,$FF99                   ; 07:4FEE
    sub  [hl]                       ; 07:4FF1
    ld   [hl],a                     ; 07:4FF2
    push hl                         ; 07:4FF3
    ld   hl,$C503                   ; 07:4FF4
    add  hl,bc                      ; 07:4FF7
    ld   a,[hl]                     ; 07:4FF8
    ld   hl,$C514                   ; 07:4FF9
    add  hl,bc                      ; 07:4FFC
    ld   [hl],a                     ; 07:4FFD
    pop  hl                         ; 07:4FFE
    add  [hl]                       ; 07:4FFF
    cp   $C0                        ; 07:5000
    jr   c,Code075007               ; 07:5002
    inc  e                          ; 07:5004
    ld   a,$C0                      ; 07:5005
Code075007:
    ld   hl,$C503                   ; 07:5007
    add  hl,bc                      ; 07:500A
    ld   [hl],a                     ; 07:500B
    ld   hl,$C514                   ; 07:500C
    add  hl,bc                      ; 07:500F
    sub  [hl]                       ; 07:5010
    ld   hl,$C51F                   ; 07:5011
    add  hl,bc                      ; 07:5014
    ld   [hl],a                     ; 07:5015
    bit  7,c                        ; 07:5016
    jr   nz,Code075038              ; 07:5018
    xor  a                          ; 07:501A
    ld   [$C366],a                  ; 07:501B
    ld   a,[$C27D]                  ; 07:501E
    ldh  [<H_CameraY],a             ; 07:5021
    ld   a,[$C27E]                  ; 07:5023
    ldh  [<$FFBB],a                 ; 07:5026
    push bc                         ; 07:5028
    push de                         ; 07:5029
    ld   a,$07                      ; 07:502A
    rst  $10                        ; 07:502C  24-bit call
.dl SubL_037813                     ; 07:502D
    ld   a,$07                      ; 07:5030
    rst  $10                        ; 07:5032  24-bit call
.dl SubL_0374C7                     ; 07:5033
    pop  de                         ; 07:5036
    pop  bc                         ; 07:5037
Code075038:
    ld   a,e                        ; 07:5038
    cp   $02                        ; 07:5039
    jr   nz,Code075050              ; 07:503B
    ld   a,[$C414]                  ; 07:503D
    ld   c,a                        ; 07:5040
    ld   b,$00                      ; 07:5041
    ld   a,$00                      ; 07:5043
    ld   [$C168],a                  ; 07:5045
    inc  a                          ; 07:5048
    ld   [$C0C3],a                  ; 07:5049
    ld   a,$25                      ; 07:504C
    ldh  [<H_GameState],a           ; 07:504E
Code075050:
    ld   a,[$C414]                  ; 07:5050
    ld   c,a                        ; 07:5053
    ld   b,$00                      ; 07:5054
    ret                             ; 07:5056

Code075057:
    ld   hl,$D0A5                   ; 07:5057
    add  hl,bc                      ; 07:505A
    ld   a,[hl]                     ; 07:505B
    and  a                          ; 07:505C
    jr   z,Code075061               ; 07:505D
    dec  [hl]                       ; 07:505F
    ret                             ; 07:5060

Code075061:
    ld   a,[W_GameMode]             ; 07:5061
    cp   $07                        ; 07:5064
    jr   z,Code075079               ; 07:5066
    cp   $02                        ; 07:5068
    jr   nz,Code075083              ; 07:506A
    xor  a                          ; 07:506C
    ld   [$C168],a                  ; 07:506D
    inc  a                          ; 07:5070
    ld   [$C0C3],a                  ; 07:5071
    ld   a,$25                      ; 07:5074
    ldh  [<H_GameState],a           ; 07:5076
    ret                             ; 07:5078

Code075079:
    ld   a,$01                      ; 07:5079
    ld   [$C168],a                  ; 07:507B
    ld   a,$25                      ; 07:507E
    ldh  [<H_GameState],a           ; 07:5080
    ret                             ; 07:5082

Code075083:
    ld   a,$00                      ; 07:5083
    ld   [$C1C3],a                  ; 07:5085
    ldh  a,[<H_PlayerXLow]          ; 07:5088
    add  $10                        ; 07:508A
    ldh  [<H_PlayerXLow],a          ; 07:508C
    ldh  a,[<H_PlayerXHigh]         ; 07:508E
    adc  $00                        ; 07:5090
    ldh  [<H_PlayerXHigh],a         ; 07:5092
    ld   hl,W_SpriteSubstate        ; 07:5094
    add  hl,bc                      ; 07:5097
    inc  [hl]                       ; 07:5098
    ld   hl,$C1D3                   ; 07:5099
    inc  [hl]                       ; 07:509C
    ld   a,$00                      ; 07:509D
    ldh  [<$FFAC],a                 ; 07:509F
    ld   a,$08                      ; 07:50A1
    ldh  [<$FFAB],a                 ; 07:50A3
    ld   a,$10                      ; 07:50A5
    ld   [$C1D1],a                  ; 07:50A7
    ld   a,$64                      ; 07:50AA
    ld   [$DE68],a                  ; 07:50AC
    ret                             ; 07:50AF

Sub0750B0:
    ld   a,$46                      ; 07:50B0
    call LoadSpriteAnySlot          ; 07:50B2
    jr   c,Return075119             ; 07:50B5
    ld   a,$20                      ; 07:50B7
    ld   [$C3B0],a                  ; 07:50B9
    ld   hl,W_SpriteXLow            ; 07:50BC
    add  hl,de                      ; 07:50BF
    ld   [hl],a                     ; 07:50C0
    push bc                         ; 07:50C1
    ld   c,$80                      ; 07:50C2
    ld   a,[W_SublevelID]           ; 07:50C4
    cp   $3D                        ; 07:50C7
    jr   z,Code0750D0               ; 07:50C9
    cp   $41                        ; 07:50CB
    jp   nz,Code0750D2              ; 07:50CD
Code0750D0:
    ld   c,$90                      ; 07:50D0
Code0750D2:
    ld   a,c                        ; 07:50D2
    pop  bc                         ; 07:50D3
    ld   hl,W_SpriteYLow            ; 07:50D4
    add  hl,de                      ; 07:50D7
    ld   [hl],a                     ; 07:50D8
    ld   hl,$D13B                   ; 07:50D9
    add  hl,de                      ; 07:50DC
    ld   [hl],a                     ; 07:50DD
    ld   hl,$D0B4                   ; 07:50DE
    add  hl,de                      ; 07:50E1
    ld   [hl],$A0                   ; 07:50E2
    ld   hl,$D0C3                   ; 07:50E4
    add  hl,de                      ; 07:50E7
    ld   [hl],$00                   ; 07:50E8
    xor  a                          ; 07:50EA
    ld   [$C3B1],a                  ; 07:50EB
    ld   [$C3E6],a                  ; 07:50EE
    ld   hl,W_SpriteXHigh           ; 07:50F1
    add  hl,de                      ; 07:50F4
    ld   [hl],a                     ; 07:50F5
    ld   hl,W_SpriteYHigh           ; 07:50F6
    ld   [hl],a                     ; 07:50F9
    ld   hl,$D11D                   ; 07:50FA
    add  hl,de                      ; 07:50FD
    ld   [hl],a                     ; 07:50FE
    inc  a                          ; 07:50FF
    ld   hl,$D195                   ; 07:5100
    add  hl,de                      ; 07:5103
    ld   [hl],a                     ; 07:5104
    ld   hl,$D14A                   ; 07:5105
    add  hl,de                      ; 07:5108
    ld   [hl],a                     ; 07:5109
    ld   hl,$D177                   ; 07:510A
    add  hl,de                      ; 07:510D
    ld   [hl],a                     ; 07:510E
    ld   a,$07                      ; 07:510F
    ld   hl,W_SpriteYSpeed          ; 07:5111
    add  hl,de                      ; 07:5114
    ld   [hl],a                     ; 07:5115
    call Sub07532F                  ; 07:5116
Return075119:
    ret                             ; 07:5119

Return07511A:
    ret                             ; 07:511A

Boo_Tilemap:                        ; 07:511B
.db $76,$03,$78,$03,$78,$23,$76,$23,\
    $8E,$23,$7A,$23,$7A,$03,$8E,$03
Code07512B:
    ld   a,[$C38D]                  ; 07:512B
    and  a                          ; 07:512E
    jr   z,Code07513A               ; 07:512F
    xor  a                          ; 07:5131
    ld   hl,$D177                   ; 07:5132
    add  hl,bc                      ; 07:5135
    ld   [hl],a                     ; 07:5136
    call Sub07513E                  ; 07:5137
Code07513A:
    call Sub07530B                  ; 07:513A
    ret                             ; 07:513D

Sub07513E:
    ld   hl,W_SpriteSubstate        ; 07:513E
    add  hl,bc                      ; 07:5141
    ld   a,[hl]                     ; 07:5142
    rst  $00                        ; 07:5143  Execute from 16-bit pointer table
.dw Code075154                      ; 07:5144
.dw Return07530A                    ; 07:5146
.dw Code075304                      ; 07:5148

Data07514A:                         ; 07:514A
.db $D0,$0D,$D0,$0E,$18,$00,$20,$00,\
    $FF,$01

Code075154:
    push bc                         ; 07:5154
    call Sub0752B8                  ; 07:5155
    pop  bc                         ; 07:5158
    ld   a,[W_SublevelID]           ; 07:5159
    cp   $3D                        ; 07:515C
    jr   z,Code075165               ; 07:515E
    cp   $41                        ; 07:5160
    jp   nz,Code0751A0              ; 07:5162
Code075165:
    sub  $3A                        ; 07:5165
    srl  a                          ; 07:5167
    srl  a                          ; 07:5169
    ld   e,a                        ; 07:516B
    ld   d,$00                      ; 07:516C
    sla  e                          ; 07:516E
    ld   hl,Data07514A              ; 07:5170
    add  hl,de                      ; 07:5173
    ldi  a,[hl]                     ; 07:5174
    ldh  [<$FF97],a                 ; 07:5175
    ld   a,[hl]                     ; 07:5177
    ldh  [<$FF98],a                 ; 07:5178
    ld   hl,W_SpriteXHigh           ; 07:517A
    add  hl,bc                      ; 07:517D
    push hl                         ; 07:517E
    ld   hl,W_SpriteXLow            ; 07:517F
    add  hl,bc                      ; 07:5182
    ldh  a,[<$FF97]                 ; 07:5183
    sub  [hl]                       ; 07:5185
    pop  hl                         ; 07:5186
    ldh  a,[<$FF98]                 ; 07:5187
    sbc  [hl]                       ; 07:5189
    bit  7,a                        ; 07:518A
    jr   z,Code0751A0               ; 07:518C
    ld   hl,W_SpriteSubstate        ; 07:518E
    add  hl,bc                      ; 07:5191
    ld   [hl],$01                   ; 07:5192
    xor  a                          ; 07:5194
    ld   [$C168],a                  ; 07:5195
    ld   [$C36A],a                  ; 07:5198
    ld   a,$25                      ; 07:519B
    ldh  [<H_GameState],a           ; 07:519D
    ret                             ; 07:519F

Code0751A0:
    ldh  a,[<H_GlobalTimer]         ; 07:51A0
    bit  0,a                        ; 07:51A2
    jp   nz,Code0751F2              ; 07:51A4
    ld   hl,$D14A                   ; 07:51A7
    add  hl,bc                      ; 07:51AA
    ld   a,[hl]                     ; 07:51AB
    and  a                          ; 07:51AC
    jr   nz,Code0751D4              ; 07:51AD
Code0751AF:
    ld   hl,W_SpriteYSpeed          ; 07:51AF
    add  hl,bc                      ; 07:51B2
    ld   a,[hl]                     ; 07:51B3
    add  $01                        ; 07:51B4
    bit  7,a                        ; 07:51B6
    jr   nz,Code0751D2              ; 07:51B8
    cp   $07                        ; 07:51BA
    jr   c,Code0751D2               ; 07:51BC
    ld   hl,$D14A                   ; 07:51BE
    add  hl,bc                      ; 07:51C1
    ld   a,[hl]                     ; 07:51C2
    xor  $01                        ; 07:51C3
    ld   [hl],a                     ; 07:51C5
    ld   hl,$D13B                   ; 07:51C6
    add  hl,bc                      ; 07:51C9
    ld   a,[hl]                     ; 07:51CA
    ld   hl,W_SpriteYLow            ; 07:51CB
    add  hl,bc                      ; 07:51CE
    ld   [hl],a                     ; 07:51CF
    jr   Code0751D4                 ; 07:51D0
Code0751D2:
    jr   Code0751ED                 ; 07:51D2
Code0751D4:
    ld   hl,W_SpriteYSpeed          ; 07:51D4
    add  hl,bc                      ; 07:51D7
    ld   a,[hl]                     ; 07:51D8
    add  $FF                        ; 07:51D9
    bit  7,a                        ; 07:51DB
    jr   z,Code0751ED               ; 07:51DD
    cp   $FA                        ; 07:51DF
    jr   nc,Code0751ED              ; 07:51E1
    ld   hl,$D14A                   ; 07:51E3
    add  hl,bc                      ; 07:51E6
    ld   a,[hl]                     ; 07:51E7
    xor  $01                        ; 07:51E8
    ld   [hl],a                     ; 07:51EA
    jr   Code0751AF                 ; 07:51EB
Code0751ED:
    ld   hl,W_SpriteYSpeed          ; 07:51ED
    add  hl,bc                      ; 07:51F0
    ld   [hl],a                     ; 07:51F1
Code0751F2:
    ld   a,[$C3B4]                  ; 07:51F2
    ldh  [<$FF97],a                 ; 07:51F5
    ld   a,[$C3B5]                  ; 07:51F7
    ldh  [<$FF98],a                 ; 07:51FA
    ld   hl,$D0F0                   ; 07:51FC
    add  hl,bc                      ; 07:51FF
    ld   e,[hl]                     ; 07:5200
    push hl                         ; 07:5201
    ld   hl,$D0FF                   ; 07:5202
    add  hl,bc                      ; 07:5205
    ld   d,[hl]                     ; 07:5206
    inc  de                         ; 07:5207
    ld   [hl],d                     ; 07:5208
    pop  hl                         ; 07:5209
    ld   [hl],e                     ; 07:520A
    ld   hl,$C3B2                   ; 07:520B
    ld   a,[$C3AC]                  ; 07:520E
    sub  [hl]                       ; 07:5211
    ldh  [<$FF99],a                 ; 07:5212
    inc  hl                         ; 07:5214
    ld   a,[$C3AD]                  ; 07:5215
    sbc  [hl]                       ; 07:5218
    ldh  [<$FF9A],a                 ; 07:5219
    cp   d                          ; 07:521B
    jr   z,Code075222               ; 07:521C
    jr   c,Code075229               ; 07:521E
    jr   Code07523A                 ; 07:5220
Code075222:
    ldh  a,[<$FF99]                 ; 07:5222
    cp   e                          ; 07:5224
    jr   c,Code075229               ; 07:5225
    jr   Code07523A                 ; 07:5227
Code075229:
    ld   a,[$C3E6]                  ; 07:5229
    and  a                          ; 07:522C
    jr   nz,Code07523F              ; 07:522D
    ld   a,$01                      ; 07:522F
    ld   [$C3E6],a                  ; 07:5231
    ld   a,$73                      ; 07:5234
    ldh  [<$FFF2],a                 ; 07:5236
    jr   Code07523F                 ; 07:5238
Code07523A:
    call Sub075292                  ; 07:523A
    jr   nc,Code07526C              ; 07:523D
Code07523F:
    ld   hl,$C3B3                   ; 07:523F
    ld   a,[$C3B2]                  ; 07:5242
    or   [hl]                       ; 07:5245
    and  a                          ; 07:5246
    jr   nz,Code075254              ; 07:5247
    ld   hl,$FF98                   ; 07:5249
    ldh  a,[<$FF97]                 ; 07:524C
    or   [hl]                       ; 07:524E
    and  a                          ; 07:524F
    jr   nz,Code07526C              ; 07:5250
    jr   Code075260                 ; 07:5252
Code075254:
    ld   a,[$C3B2]                  ; 07:5254
    sub  $01                        ; 07:5257
    ld   [$C3B2],a                  ; 07:5259
    ld   a,[hl]                     ; 07:525C
    sbc  $00                        ; 07:525D
    ld   [hl],a                     ; 07:525F
Code075260:
    ldh  a,[<$FF97]                 ; 07:5260
    add  $01                        ; 07:5262
    ldh  [<$FF97],a                 ; 07:5264
    ldh  a,[<$FF98]                 ; 07:5266
    adc  $00                        ; 07:5268
    ldh  [<$FF98],a                 ; 07:526A
Code07526C:
    ld   hl,W_SpriteXHigh           ; 07:526C
    add  hl,bc                      ; 07:526F
    push hl                         ; 07:5270
    ld   hl,W_SpriteXLow            ; 07:5271
    add  hl,bc                      ; 07:5274
    ldh  a,[<$FF97]                 ; 07:5275
    add  [hl]                       ; 07:5277
    ld   [hl],a                     ; 07:5278
    pop  hl                         ; 07:5279
    ldh  a,[<$FF98]                 ; 07:527A
    adc  [hl]                       ; 07:527C
    ld   [hl],a                     ; 07:527D
    call Sub001A79                  ; 07:527E
    ld   hl,W_SpriteXLow            ; 07:5281
    add  hl,bc                      ; 07:5284
    ld   a,[hl]                     ; 07:5285
    ld   [$C3B0],a                  ; 07:5286
    ld   hl,W_SpriteXHigh           ; 07:5289
    add  hl,bc                      ; 07:528C
    ld   a,[hl]                     ; 07:528D
    ld   [$C3B1],a                  ; 07:528E
    ret                             ; 07:5291

Sub075292:
    ld   hl,W_SpriteXLow            ; 07:5292
    add  hl,bc                      ; 07:5295
    ld   e,[hl]                     ; 07:5296
    ld   hl,W_SpriteXHigh           ; 07:5297
    add  hl,bc                      ; 07:529A
    ld   d,[hl]                     ; 07:529B
    ld   a,$10                      ; 07:529C
    add  e                          ; 07:529E
    ld   e,a                        ; 07:529F
    ld   a,$00                      ; 07:52A0
    adc  d                          ; 07:52A2
    ld   d,a                        ; 07:52A3
    ld   hl,H_CameraXLow            ; 07:52A4
    ld   a,e                        ; 07:52A7
    sub  [hl]                       ; 07:52A8
    ld   e,a                        ; 07:52A9
    ld   hl,H_CameraXHigh           ; 07:52AA
    ld   a,d                        ; 07:52AD
    sbc  [hl]                       ; 07:52AE
    bit  7,a                        ; 07:52AF
    jr   z,Code0752B5               ; 07:52B1
    scf                             ; 07:52B3
    ret                             ; 07:52B4

Code0752B5:
    scf                             ; 07:52B5
    ccf                             ; 07:52B6
    ret                             ; 07:52B7

Sub0752B8:
    ld   a,[W_RaceHeaderFlags]      ; 07:52B8
    bit  0,a                        ; 07:52BB
    ret  nz                         ; 07:52BD
    ld   hl,$D0B4                   ; 07:52BE
    add  hl,bc                      ; 07:52C1
    ld   e,[hl]                     ; 07:52C2
    ld   hl,$D0C3                   ; 07:52C3
    add  hl,bc                      ; 07:52C6
    ld   d,[hl]                     ; 07:52C7
    dec  de                         ; 07:52C8
    ld   [hl],d                     ; 07:52C9
    ld   hl,$D0B4                   ; 07:52CA
    add  hl,bc                      ; 07:52CD
    ld   [hl],e                     ; 07:52CE
    ld   a,d                        ; 07:52CF
    and  a                          ; 07:52D0
    jr   nz,Code0752E2              ; 07:52D1
    ld   a,e                        ; 07:52D3
    cp   $40                        ; 07:52D4
    jr   nz,Code0752E2              ; 07:52D6
    ld   a,[$C375]                  ; 07:52D8
    and  a                          ; 07:52DB
    jr   nz,Code0752E2              ; 07:52DC
    ld   a,$73                      ; 07:52DE
    ldh  [<$FFF2],a                 ; 07:52E0
Code0752E2:
    bit  7,d                        ; 07:52E2
    jr   z,Return075303             ; 07:52E4
    ld   hl,$D0B4                   ; 07:52E6
    add  hl,bc                      ; 07:52E9
    ld   [hl],$F0                   ; 07:52EA
    ld   hl,$D0C3                   ; 07:52EC
    add  hl,bc                      ; 07:52EF
    ld   [hl],$00                   ; 07:52F0
    ld   a,[$C375]                  ; 07:52F2
    and  a                          ; 07:52F5
    jr   nz,Return075303            ; 07:52F6
    ld   a,$60                      ; 07:52F8
    ldh  [<$FFF2],a                 ; 07:52FA
    ld   a,$01                      ; 07:52FC
    ldh  [<$FF9B],a                 ; 07:52FE
    call Sub074026                  ; 07:5300
Return075303:
    ret                             ; 07:5303

Code075304:
    ld   hl,$D177                   ; 07:5304
    add  hl,bc                      ; 07:5307
    ld   [hl],$01                   ; 07:5308
Return07530A:
    ret                             ; 07:530A

Sub07530B:
    ld   hl,$D195                   ; 07:530B
    add  hl,bc                      ; 07:530E
    ld   e,[hl]                     ; 07:530F
    sla  e                          ; 07:5310
    sla  e                          ; 07:5312
    ld   d,$00                      ; 07:5314
    push de                         ; 07:5316
    ld   hl,$D177                   ; 07:5317
    add  hl,bc                      ; 07:531A
    ld   a,[hl]                     ; 07:531B
    sla  a                          ; 07:531C
    sla  a                          ; 07:531E
    sla  a                          ; 07:5320
    ld   l,a                        ; 07:5322
    ld   h,$00                      ; 07:5323
    ld   de,Boo_Tilemap             ; 07:5325
    add  hl,de                      ; 07:5328
    pop  de                         ; 07:5329
    add  hl,de                      ; 07:532A
    call Disp16x16Sprite            ; 07:532B
    ret                             ; 07:532E

Sub07532F:
    ld   a,[$C36B]                  ; 07:532F
    push af                         ; 07:5332
    and  $03                        ; 07:5333
    ld   e,a                        ; 07:5335
    pop  af                         ; 07:5336
    and  $F0                        ; 07:5337
    swap a                          ; 07:5339
    sla  a                          ; 07:533B
    sla  a                          ; 07:533D
    add  e                          ; 07:533F
    sla  a                          ; 07:5340
    ld   e,a                        ; 07:5342
    ld   d,$00                      ; 07:5343
    ld   hl,$C3B6                   ; 07:5345
    add  hl,de                      ; 07:5348
    ldi  a,[hl]                     ; 07:5349
    sub  $20                        ; 07:534A
    ldh  [<$FF97],a                 ; 07:534C
    ld   a,[hl]                     ; 07:534E
    sbc  $00                        ; 07:534F
    ldh  [<$FF98],a                 ; 07:5351
    ld   hl,$C3C6                   ; 07:5353
    add  hl,de                      ; 07:5356
    ldi  a,[hl]                     ; 07:5357
    ldh  [<$FF99],a                 ; 07:5358
    ld   [$C3AC],a                  ; 07:535A
    ld   a,[hl]                     ; 07:535D
    ldh  [<$FF9A],a                 ; 07:535E
    ld   [$C3AD],a                  ; 07:5360
    ld   de,$0000                   ; 07:5363
Code075366:
    ld   hl,$FF99                   ; 07:5366
    ldh  a,[<$FF97]                 ; 07:5369
    sub  [hl]                       ; 07:536B
    ld   hl,$FF9A                   ; 07:536C
    ldh  a,[<$FF98]                 ; 07:536F
    sbc  [hl]                       ; 07:5371
    bit  7,a                        ; 07:5372
    jr   nz,Code075389              ; 07:5374
    inc  de                         ; 07:5376
    ld   hl,$FF99                   ; 07:5377
    ldh  a,[<$FF97]                 ; 07:537A
    sub  [hl]                       ; 07:537C
    ldh  [<$FF97],a                 ; 07:537D
    ld   hl,$FF9A                   ; 07:537F
    ldh  a,[<$FF98]                 ; 07:5382
    sbc  [hl]                       ; 07:5384
    ldh  [<$FF98],a                 ; 07:5385
    jr   Code075366                 ; 07:5387
Code075389:
    ld   a,e                        ; 07:5389
    ld   [$C3B4],a                  ; 07:538A
    ld   a,d                        ; 07:538D
    ld   [$C3B5],a                  ; 07:538E
    ldh  a,[<$FF97]                 ; 07:5391
    ld   [$C3B2],a                  ; 07:5393
    ldh  a,[<$FF98]                 ; 07:5396
    ld   [$C3B3],a                  ; 07:5398
    ret                             ; 07:539B

SubL_07539C:
    ld   hl,SRAMENABLE              ; 07:539C
    ld   [hl],$0A                   ; 07:539F
    ld   de,$0324                   ; 07:53A1
Code0753A4:
    ld   hl,$A100                   ; 07:53A4
    add  hl,de                      ; 07:53A7
    ld   [hl],$00                   ; 07:53A8
    dec  de                         ; 07:53AA
    ld   a,e                        ; 07:53AB
    or   d                          ; 07:53AC
    jr   nz,Code0753A4              ; 07:53AD
    ld   hl,$A100                   ; 07:53AF
    add  hl,de                      ; 07:53B2
    ld   [hl],$00                   ; 07:53B3
    ld   hl,SRAMENABLE              ; 07:53B5
    ld   [hl],$FF                   ; 07:53B8
    rst  $18                        ; 07:53BA  Return from 24-bit call

SubL_0753BB:
    ld   hl,SRAMENABLE              ; 07:53BB
    ld   [hl],$0A                   ; 07:53BE
    ld   a,$00                      ; 07:53C0
    ld   [$C16B],a                  ; 07:53C2
    call Sub000FF6                  ; 07:53C5
    jr   c,Code0753D8               ; 07:53C8
    ld   e,$00                      ; 07:53CA
    ld   hl,$A100                   ; 07:53CC
Code0753CF:
    ld   [hl],$00                   ; 07:53CF
    inc  hl                         ; 07:53D1
    inc  e                          ; 07:53D2
    ld   a,e                        ; 07:53D3
    cp   $40                        ; 07:53D4
    jr   nz,Code0753CF              ; 07:53D6
Code0753D8:
    ld   a,$01                      ; 07:53D8
    ld   [$C16B],a                  ; 07:53DA
    call Sub000FF6                  ; 07:53DD
    jr   c,Code0753F0               ; 07:53E0
    ld   e,$00                      ; 07:53E2
    ld   hl,$A140                   ; 07:53E4
Code0753E7:
    ld   [hl],$00                   ; 07:53E7
    inc  hl                         ; 07:53E9
    inc  e                          ; 07:53EA
    ld   a,e                        ; 07:53EB
    cp   $40                        ; 07:53EC
    jr   nz,Code0753E7              ; 07:53EE
Code0753F0:
    ld   a,$02                      ; 07:53F0
    ld   [$C16B],a                  ; 07:53F2
    call Sub000FF6                  ; 07:53F5
    jr   c,Code075408               ; 07:53F8
    ld   e,$00                      ; 07:53FA
    ld   hl,$A180                   ; 07:53FC
Code0753FF:
    ld   [hl],$00                   ; 07:53FF
    inc  hl                         ; 07:5401
    inc  e                          ; 07:5402
    ld   a,e                        ; 07:5403
    cp   $40                        ; 07:5404
    jr   nz,Code0753FF              ; 07:5406
Code075408:
    ld   a,$03                      ; 07:5408
    ld   [$C16B],a                  ; 07:540A
    call Sub000FF6                  ; 07:540D
    jr   c,Code075420               ; 07:5410
    ld   e,$00                      ; 07:5412
    ld   hl,$A1C0                   ; 07:5414
Code075417:
    ld   [hl],$00                   ; 07:5417
    inc  hl                         ; 07:5419
    inc  e                          ; 07:541A
    ld   a,e                        ; 07:541B
    cp   $40                        ; 07:541C
    jr   nz,Code075417              ; 07:541E
Code075420:
    call Sub0757CD                  ; 07:5420
    jp   c,Code075434               ; 07:5423
    ld   e,$00                      ; 07:5426
    ld   hl,$A370                   ; 07:5428
Code07542B:
    ld   [hl],$00                   ; 07:542B
    inc  hl                         ; 07:542D
    inc  e                          ; 07:542E
    ld   a,e                        ; 07:542F
    cp   $52                        ; 07:5430
    jr   nz,Code07542B              ; 07:5432
Code075434:
    ld   hl,$A3F2                   ; 07:5434
    ld   a,$31                      ; 07:5437
    call Sub001027                  ; 07:5439
    ld   hl,$A423                   ; 07:543C
    ldh  a,[<$FF97]                 ; 07:543F
    cp   [hl]                       ; 07:5441
    jr   nz,Code075451              ; 07:5442
    inc  hl                         ; 07:5444
    ldh  a,[<$FF98]                 ; 07:5445
    cp   [hl]                       ; 07:5447
    jr   nz,Code075451              ; 07:5448
    ld   a,[$A422]                  ; 07:544A
    cp   $01                        ; 07:544D
    jr   z,Code07545F               ; 07:544F
Code075451:
    ld   e,$00                      ; 07:5451
    ld   hl,$A3F2                   ; 07:5453
Code075456:
    ld   [hl],$00                   ; 07:5456
    inc  hl                         ; 07:5458
    inc  e                          ; 07:5459
    ld   a,e                        ; 07:545A
    cp   $33                        ; 07:545B
    jr   nz,Code075456              ; 07:545D
Code07545F:
    call Sub0758B4                  ; 07:545F
    jr   c,Code07546E               ; 07:5462
    ld   hl,$A200                   ; 07:5464
    ld   b,$AD                      ; 07:5467
Code075469:
    xor  a                          ; 07:5469
    ldi  [hl],a                     ; 07:546A
    dec  b                          ; 07:546B
    jr   nz,Code075469              ; 07:546C
Code07546E:
    call Sub075B61                  ; 07:546E
    jr   c,Code07547D               ; 07:5471
    ld   hl,$A2AD                   ; 07:5473
    ld   b,$C3                      ; 07:5476
Code075478:
    xor  a                          ; 07:5478
    ldi  [hl],a                     ; 07:5479
    dec  b                          ; 07:547A
    jr   nz,Code075478              ; 07:547B
Code07547D:
    ld   hl,SRAMENABLE              ; 07:547D
    ld   [hl],$FF                   ; 07:5480
    rst  $18                        ; 07:5482  Return from 24-bit call

Original_InitialLives:              ; 07:5483
.db $05,$0A

SubL_075485:
    ld   hl,SRAMENABLE              ; 07:5485
    ld   [hl],$0A                   ; 07:5488
    ld   a,[$C16B]                  ; 07:548A
    call Sub000FF6                  ; 07:548D
    jr   c,Code0754FC               ; 07:5490
    xor  a                          ; 07:5492
    ld   [W_LevelID],a              ; 07:5493
    ld   [W_SublevelID],a           ; 07:5496
    ld   [W_HardFlag],a             ; 07:5499
    ld   [$C169],a                  ; 07:549C
    ld   [$C16A],a                  ; 07:549F
    ld   [$C1EF],a                  ; 07:54A2
    ld   [$C182],a                  ; 07:54A5
    ld   [$C183],a                  ; 07:54A8
    ld   [$C184],a                  ; 07:54AB
    ld   [$C185],a                  ; 07:54AE
    ld   [$C186],a                  ; 07:54B1
    ld   [$C17A],a                  ; 07:54B4
    ld   [$C17B],a                  ; 07:54B7
    ld   [$C17C],a                  ; 07:54BA
    ld   [W_PlayerCoins],a          ; 07:54BD
    ld   [W_PlayerSize],a           ; 07:54C0
    ld   [W_PlayerFireFlag],a       ; 07:54C3
    ld   [$C287],a                  ; 07:54C6
    ld   [$C288],a                  ; 07:54C9
    ld   [$C289],a                  ; 07:54CC
    ld   [$C28A],a                  ; 07:54CF
    ld   [$C1A9],a                  ; 07:54D2
    ld   [$C1AA],a                  ; 07:54D5
    ld   [$C1AB],a                  ; 07:54D8
    ld   [$C1AC],a                  ; 07:54DB
    ld   [$C16F],a                  ; 07:54DE
    ld   a,$D0                      ; 07:54E1
    ld   [$C16D],a                  ; 07:54E3
    ld   a,$07                      ; 07:54E6
    ld   [$C16E],a                  ; 07:54E8
    ld   a,[$C1B2]                  ; 07:54EB
    ld   e,a                        ; 07:54EE
    ld   d,$00                      ; 07:54EF
    ld   hl,Original_InitialLives   ; 07:54F1  if "Extremely Lucky" fortune, start with 10 lives
    add  hl,de                      ; 07:54F4
    ld   a,[hl]                     ; 07:54F5
    ld   [W_PlayerLives],a          ; 07:54F6
    jp   Code07557E                 ; 07:54F9
Code0754FC:
    ld   a,[$C16B]                  ; 07:54FC
    swap a                          ; 07:54FF
    sla  a                          ; 07:5501
    sla  a                          ; 07:5503
    ld   e,a                        ; 07:5505
    ld   d,$00                      ; 07:5506
    ld   hl,$A100                   ; 07:5508
    add  hl,de                      ; 07:550B
    ld   a,[hl]                     ; 07:550C
    ld   [W_LevelID],a              ; 07:550D
    ld   [W_SublevelID],a           ; 07:5510
    ld   hl,$A101                   ; 07:5513
    add  hl,de                      ; 07:5516
    ld   a,[hl]                     ; 07:5517
    ld   [W_HardFlag],a             ; 07:5518
    xor  a                          ; 07:551B
    ld   [W_PlayerSize],a           ; 07:551C
    ld   [W_PlayerFireFlag],a       ; 07:551F
    xor  a                          ; 07:5522
    ld   [$C17A],a                  ; 07:5523
    ld   [$C17B],a                  ; 07:5526
    ld   [$C17C],a                  ; 07:5529
    ld   [W_PlayerCoins],a          ; 07:552C
    ld   hl,$A106                   ; 07:552F
    add  hl,de                      ; 07:5532
    ld   a,[hl]                     ; 07:5533
    ld   [W_PlayerLives],a          ; 07:5534
    ld   hl,$A107                   ; 07:5537
    add  hl,de                      ; 07:553A
    ld   a,[hl]                     ; 07:553B
    ld   [$C169],a                  ; 07:553C
    ld   hl,$A108                   ; 07:553F
    add  hl,de                      ; 07:5542
    ld   a,[hl]                     ; 07:5543
    ld   [$C16A],a                  ; 07:5544
    xor  a                          ; 07:5547
    ld   [$C1EF],a                  ; 07:5548
    ld   [$C182],a                  ; 07:554B
    ld   [$C183],a                  ; 07:554E
    ld   [$C184],a                  ; 07:5551
    ld   [$C185],a                  ; 07:5554
    ld   [$C186],a                  ; 07:5557
    ld   hl,$A111                   ; 07:555A
    add  hl,de                      ; 07:555D
    ldi  a,[hl]                     ; 07:555E
    ld   [$C1A9],a                  ; 07:555F
    ldi  a,[hl]                     ; 07:5562
    ld   [$C1AA],a                  ; 07:5563
    ldi  a,[hl]                     ; 07:5566
    ld   [$C1AB],a                  ; 07:5567
    ld   a,[hl]                     ; 07:556A
    ld   [$C1AC],a                  ; 07:556B
    ld   hl,$A115                   ; 07:556E
    add  hl,de                      ; 07:5571
    ldi  a,[hl]                     ; 07:5572
    ld   [$C16D],a                  ; 07:5573
    ldi  a,[hl]                     ; 07:5576
    ld   [$C16E],a                  ; 07:5577
    ldi  a,[hl]                     ; 07:557A
    ld   [$C16F],a                  ; 07:557B
Code07557E:
    ld   hl,SRAMENABLE              ; 07:557E
    ld   [hl],$FF                   ; 07:5581
    rst  $18                        ; 07:5583  Return from 24-bit call

SubL_075584:
    call Sub075588                  ; 07:5584
    rst  $18                        ; 07:5587  Return from 24-bit call

Sub075588:
    ld   a,[W_HardFlag]             ; 07:5588
    and  a                          ; 07:558B
    jr   z,Code07559B               ; 07:558C
    ld   a,[$C16A]                  ; 07:558E
    ld   b,a                        ; 07:5591
    ld   a,[W_LevelID]              ; 07:5592
    cp   b                          ; 07:5595
    jr   c,Code07559B               ; 07:5596
    ld   [$C16A],a                  ; 07:5598
Code07559B:
    ld   hl,SRAMENABLE              ; 07:559B
    ld   [hl],$0A                   ; 07:559E
    ld   a,[$C16B]                  ; 07:55A0
    swap a                          ; 07:55A3
    sla  a                          ; 07:55A5
    sla  a                          ; 07:55A7
    ld   e,a                        ; 07:55A9
    ld   d,$00                      ; 07:55AA
    ld   hl,$A100                   ; 07:55AC
    add  hl,de                      ; 07:55AF
    ld   a,[W_LevelID]              ; 07:55B0
    ld   [hl],a                     ; 07:55B3
    ld   hl,$A101                   ; 07:55B4
    add  hl,de                      ; 07:55B7
    ld   a,[W_HardFlag]             ; 07:55B8
    ld   [hl],a                     ; 07:55BB
    ld   hl,$A10F                   ; 07:55BC
    add  hl,de                      ; 07:55BF
    ld   a,[W_PlayerSize]           ; 07:55C0
    ld   [hl],a                     ; 07:55C3
    ld   hl,$A110                   ; 07:55C4
    add  hl,de                      ; 07:55C7
    ld   a,[W_PlayerFireFlag]       ; 07:55C8
    ld   [hl],a                     ; 07:55CB
    ld   hl,$A102                   ; 07:55CC
    add  hl,de                      ; 07:55CF
    ld   a,[$C17A]                  ; 07:55D0
    ld   [hl],a                     ; 07:55D3
    ld   hl,$A103                   ; 07:55D4
    add  hl,de                      ; 07:55D7
    ld   a,[$C17B]                  ; 07:55D8
    ld   [hl],a                     ; 07:55DB
    ld   hl,$A104                   ; 07:55DC
    add  hl,de                      ; 07:55DF
    ld   a,[$C17C]                  ; 07:55E0
    ld   [hl],a                     ; 07:55E3
    ld   hl,$A105                   ; 07:55E4
    add  hl,de                      ; 07:55E7
    ld   a,[W_PlayerCoins]          ; 07:55E8
    ld   [hl],a                     ; 07:55EB
    ld   hl,$A106                   ; 07:55EC
    add  hl,de                      ; 07:55EF
    ld   a,[W_PlayerLives]          ; 07:55F0
    ld   [hl],a                     ; 07:55F3
    ld   hl,$A107                   ; 07:55F4
    add  hl,de                      ; 07:55F7
    ld   a,[$C169]                  ; 07:55F8
    ld   [hl],a                     ; 07:55FB
    ld   hl,$A108                   ; 07:55FC
    add  hl,de                      ; 07:55FF
    ld   a,[$C16A]                  ; 07:5600
    ld   [hl],a                     ; 07:5603
    ld   hl,$A109                   ; 07:5604
    add  hl,de                      ; 07:5607
    ld   a,[$C1EF]                  ; 07:5608
    ld   [hl],a                     ; 07:560B
    ld   hl,$A10A                   ; 07:560C
    add  hl,de                      ; 07:560F
    ld   a,[$C182]                  ; 07:5610
    ld   [hl],a                     ; 07:5613
    ld   hl,$A10B                   ; 07:5614
    add  hl,de                      ; 07:5617
    ld   a,[$C183]                  ; 07:5618
    ldi  [hl],a                     ; 07:561B
    ld   a,[$C184]                  ; 07:561C
    ldi  [hl],a                     ; 07:561F
    ld   a,[$C185]                  ; 07:5620
    ldi  [hl],a                     ; 07:5623
    ld   a,[$C186]                  ; 07:5624
    ld   [hl],a                     ; 07:5627
    ld   hl,$A111                   ; 07:5628
    add  hl,de                      ; 07:562B
    ld   a,[$C1A9]                  ; 07:562C
    ldi  [hl],a                     ; 07:562F
    ld   a,[$C1AA]                  ; 07:5630
    ldi  [hl],a                     ; 07:5633
    ld   a,[$C1AB]                  ; 07:5634
    ldi  [hl],a                     ; 07:5637
    ld   a,[$C1AC]                  ; 07:5638
    ld   [hl],a                     ; 07:563B
    ld   hl,$A115                   ; 07:563C
    add  hl,de                      ; 07:563F
    ld   a,[$C16D]                  ; 07:5640
    ldi  [hl],a                     ; 07:5643
    ld   a,[$C16E]                  ; 07:5644
    ldi  [hl],a                     ; 07:5647
    ld   a,[$C16F]                  ; 07:5648
    ld   [hl],a                     ; 07:564B
    ld   hl,$A118                   ; 07:564C
    add  hl,de                      ; 07:564F
    ld   [hl],$01                   ; 07:5650
    ld   hl,$A100                   ; 07:5652
    add  hl,de                      ; 07:5655
    call Sub001025                  ; 07:5656
    ld   hl,$A119                   ; 07:5659
    add  hl,de                      ; 07:565C
    ldh  a,[<$FF97]                 ; 07:565D
    ldi  [hl],a                     ; 07:565F
    ldh  a,[<$FF98]                 ; 07:5660
    ld   [hl],a                     ; 07:5662
    ld   hl,SRAMENABLE              ; 07:5663
    ld   [hl],$FF                   ; 07:5666
    ret                             ; 07:5668

SubL_075669:
    ld   hl,SRAMENABLE              ; 07:5669
    ld   [hl],$0A                   ; 07:566C
    ld   a,[$C16B]                  ; 07:566E
    swap a                          ; 07:5671
    sla  a                          ; 07:5673
    sla  a                          ; 07:5675
    ld   e,a                        ; 07:5677
    ld   d,$00                      ; 07:5678
    ld   hl,$A115                   ; 07:567A
    add  hl,de                      ; 07:567D
    ld   a,[$C16D]                  ; 07:567E
    ldi  [hl],a                     ; 07:5681
    ld   a,[$C16E]                  ; 07:5682
    ldi  [hl],a                     ; 07:5685
    ld   a,[$C16F]                  ; 07:5686
    ld   [hl],a                     ; 07:5689
    ld   hl,$A100                   ; 07:568A
    add  hl,de                      ; 07:568D
    call Sub001025                  ; 07:568E
    ld   hl,$A119                   ; 07:5691
    add  hl,de                      ; 07:5694
    ldh  a,[<$FF97]                 ; 07:5695
    ldi  [hl],a                     ; 07:5697
    ldh  a,[<$FF98]                 ; 07:5698
    ld   [hl],a                     ; 07:569A
    ld   hl,SRAMENABLE              ; 07:569B
    ld   [hl],$FF                   ; 07:569E
    rst  $18                        ; 07:56A0  Return from 24-bit call

Data0756A1:                         ; 07:56A1
.db $07,$BF,$07,$0F,$07,$C5,$04,$15,\
    $07,$C1,$09,$0D,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00

SubL_0756D9:
    ld   hl,SRAMENABLE              ; 07:56D9
    ld   [hl],$0A                   ; 07:56DC
    call Sub0757CD                  ; 07:56DE
    jp   c,Code07575D               ; 07:56E1
    xor  a                          ; 07:56E4
    ld   [W_ChalUnlockFlags],a      ; 07:56E5
    ld   [W_ChalUnlockFlags_x_2],a  ; 07:56E8
    ld   [W_ChalUnlockFlags_x_3],a  ; 07:56EB
    ld   [W_ChalUnlockFlags_x_4],a  ; 07:56EE
    ld   [W_ChalTotalScoreLow],a    ; 07:56F1
    ld   [W_ChalTotalScoreMid],a    ; 07:56F4
    ld   [W_ChalTotalScoreHigh],a   ; 07:56F7
    ld   [$C192],a                  ; 07:56FA
    ld   [$C42D],a                  ; 07:56FD
    ld   [$C42E],a                  ; 07:5700
    ld   [$C42F],a                  ; 07:5703
    ld   [$C430],a                  ; 07:5706
    ld   [$C4FB],a                  ; 07:5709
    ld   [$C429],a                  ; 07:570C
    ld   [$C42A],a                  ; 07:570F
    ld   [$C42B],a                  ; 07:5712
    ld   [$C42C],a                  ; 07:5715
    ld   a,$00                      ; 07:5718
    and  a                          ; 07:571A
    jr   z,Code075731               ; 07:571B
    ld   a,$FF                      ; 07:571D
    ld   [$C429],a                  ; 07:571F
    ld   a,$FF                      ; 07:5722
    ld   [$C42A],a                  ; 07:5724
    ld   a,$FF                      ; 07:5727
    ld   [$C42B],a                  ; 07:5729
    ld   a,$FE                      ; 07:572C
    ld   [$C42C],a                  ; 07:572E
Code075731:
    ld   hl,Data0756A1              ; 07:5731
    ld   de,$C439                   ; 07:5734
    ld   c,$38                      ; 07:5737
Code075739:
    ldi  a,[hl]                     ; 07:5739
    ld   [de],a                     ; 07:573A
    inc  de                         ; 07:573B
    dec  c                          ; 07:573C
    jr   nz,Code075739              ; 07:573D
    ld   hl,$D960                   ; 07:573F
    ld   c,$09                      ; 07:5742
    xor  a                          ; 07:5744
Code075745:
    ldi  [hl],a                     ; 07:5745
    dec  c                          ; 07:5746
    jr   nz,Code075745              ; 07:5747
    ldi  [hl],a                     ; 07:5749
    ldi  [hl],a                     ; 07:574A
    ldi  [hl],a                     ; 07:574B
    ldi  [hl],a                     ; 07:574C
    ldi  [hl],a                     ; 07:574D
    ldi  [hl],a                     ; 07:574E
    ld   hl,$D960                   ; 07:574F
    ld   [hl],$00                   ; 07:5752
    inc  hl                         ; 07:5754
    ld   [hl],$01                   ; 07:5755
    inc  hl                         ; 07:5757
    ld   [hl],$05                   ; 07:5758
    jp   Code0757F4                 ; 07:575A
Code07575D:
    ld   hl,$A370                   ; 07:575D \ load level unlock flags ($A370 to $C18E)
    ldi  a,[hl]                     ; 07:5760
    ld   [W_ChalUnlockFlags],a      ; 07:5761
    ldi  a,[hl]                     ; 07:5764
    ld   [W_ChalUnlockFlags_x_2],a  ; 07:5765
    ldi  a,[hl]                     ; 07:5768
    ld   [W_ChalUnlockFlags_x_3],a  ; 07:5769
    ldi  a,[hl]                     ; 07:576C
    ld   [W_ChalUnlockFlags_x_4],a  ; 07:576D /
    ldi  a,[hl]                     ; 07:5770 \ load total high score ($A374 to $C1A1)
    ld   [W_ChalTotalScoreLow],a    ; 07:5771
    ldi  a,[hl]                     ; 07:5774
    ld   [W_ChalTotalScoreMid],a    ; 07:5775
    ld   a,[hl]                     ; 07:5778
    ld   [W_ChalTotalScoreHigh],a   ; 07:5779 /
    ld   a,[$A37B]                  ; 07:577C
    ld   [$C192],a                  ; 07:577F
    ld   a,[$A3BF]                  ; 07:5782
    ld   [$C4FB],a                  ; 07:5785
    ld   hl,$A37C                   ; 07:5788
    ldi  a,[hl]                     ; 07:578B
    ld   [$C429],a                  ; 07:578C
    ldi  a,[hl]                     ; 07:578F
    ld   [$C42A],a                  ; 07:5790
    ldi  a,[hl]                     ; 07:5793
    ld   [$C42B],a                  ; 07:5794
    ldi  a,[hl]                     ; 07:5797
    ld   [$C42C],a                  ; 07:5798
    ldi  a,[hl]                     ; 07:579B
    ld   [$C42D],a                  ; 07:579C
    ldi  a,[hl]                     ; 07:579F
    ld   [$C42E],a                  ; 07:57A0
    ldi  a,[hl]                     ; 07:57A3
    ld   [$C42F],a                  ; 07:57A4
    ld   a,[hl]                     ; 07:57A7
    ld   [$C430],a                  ; 07:57A8
    ld   hl,$A384                   ; 07:57AB
    ld   de,$C439                   ; 07:57AE
    ld   c,$38                      ; 07:57B1
Code0757B3:
    ldi  a,[hl]                     ; 07:57B3
    ld   [de],a                     ; 07:57B4
    inc  de                         ; 07:57B5
    dec  c                          ; 07:57B6
    jr   nz,Code0757B3              ; 07:57B7
    ld   hl,$B6B7                   ; 07:57B9
    ld   de,$D960                   ; 07:57BC
    ld   c,$0E                      ; 07:57BF
Code0757C1:
    ldi  a,[hl]                     ; 07:57C1
    ld   [de],a                     ; 07:57C2
    inc  de                         ; 07:57C3
    dec  c                          ; 07:57C4
    jr   nz,Code0757C1              ; 07:57C5
    ld   hl,SRAMENABLE              ; 07:57C7
    ld   [hl],$FF                   ; 07:57CA
    rst  $18                        ; 07:57CC  Return from 24-bit call

Sub0757CD:
    ld   hl,$A370                   ; 07:57CD
    ld   a,$50                      ; 07:57D0
    call Sub001027                  ; 07:57D2
    ld   hl,$A3C0                   ; 07:57D5
    ldh  a,[<$FF97]                 ; 07:57D8
    cp   [hl]                       ; 07:57DA
    jr   nz,Code0757EC              ; 07:57DB
    inc  hl                         ; 07:57DD
    ldh  a,[<$FF98]                 ; 07:57DE
    cp   [hl]                       ; 07:57E0
    jr   nz,Code0757EC              ; 07:57E1
    ld   a,[$A3BE]                  ; 07:57E3
    cp   $01                        ; 07:57E6
    jr   nz,Code0757EC              ; 07:57E8
    scf                             ; 07:57EA
    ret                             ; 07:57EB

Code0757EC:
    scf                             ; 07:57EC
    ccf                             ; 07:57ED
    ret                             ; 07:57EE

SubL_0757EF:
    ld   hl,SRAMENABLE              ; 07:57EF
    ld   [hl],$0A                   ; 07:57F2
Code0757F4:
    ld   hl,$A370                   ; 07:57F4
    ld   a,[W_ChalUnlockFlags]      ; 07:57F7
    ldi  [hl],a                     ; 07:57FA
    ld   a,[W_ChalUnlockFlags_x_2]  ; 07:57FB
    ldi  [hl],a                     ; 07:57FE
    ld   a,[W_ChalUnlockFlags_x_3]  ; 07:57FF
    ldi  [hl],a                     ; 07:5802
    ld   a,[W_ChalUnlockFlags_x_4]  ; 07:5803
    ldi  [hl],a                     ; 07:5806
    ld   a,[W_ChalTotalScoreLow]    ; 07:5807
    ldi  [hl],a                     ; 07:580A
    ld   a,[W_ChalTotalScoreMid]    ; 07:580B
    ldi  [hl],a                     ; 07:580E
    ld   a,[W_ChalTotalScoreHigh]   ; 07:580F
    ld   [hl],a                     ; 07:5812
    ld   a,[$C192]                  ; 07:5813
    ld   [$A37B],a                  ; 07:5816
    ld   a,[$C4FB]                  ; 07:5819
    ld   [$A3BF],a                  ; 07:581C
    ld   hl,$A37C                   ; 07:581F
    ld   a,[$C429]                  ; 07:5822
    ldi  [hl],a                     ; 07:5825
    ld   a,[$C42A]                  ; 07:5826
    ldi  [hl],a                     ; 07:5829
    ld   a,[$C42B]                  ; 07:582A
    ldi  [hl],a                     ; 07:582D
    ld   a,[$C42C]                  ; 07:582E
    ldi  [hl],a                     ; 07:5831
    ld   a,[$C42D]                  ; 07:5832
    ldi  [hl],a                     ; 07:5835
    ld   a,[$C42E]                  ; 07:5836
    ldi  [hl],a                     ; 07:5839
    ld   a,[$C42F]                  ; 07:583A
    ldi  [hl],a                     ; 07:583D
    ld   a,[$C430]                  ; 07:583E
    ld   [hl],a                     ; 07:5841
    ld   hl,$A384                   ; 07:5842
    ld   de,$C439                   ; 07:5845
    ld   c,$38                      ; 07:5848
Code07584A:
    ld   a,[de]                     ; 07:584A
    ldi  [hl],a                     ; 07:584B
    inc  de                         ; 07:584C
    dec  c                          ; 07:584D
    jr   nz,Code07584A              ; 07:584E
    ld   hl,$B6B7                   ; 07:5850
    ld   de,$D960                   ; 07:5853
    ld   c,$0E                      ; 07:5856
Code075858:
    ld   a,[de]                     ; 07:5858
    ldi  [hl],a                     ; 07:5859
    inc  de                         ; 07:585A
    dec  c                          ; 07:585B
    jr   nz,Code075858              ; 07:585C
    call Sub075875                  ; 07:585E
    ld   hl,SRAMENABLE              ; 07:5861
    ld   [hl],$FF                   ; 07:5864
    rst  $18                        ; 07:5866  Return from 24-bit call

UnusedL_075867:
    ld   hl,SRAMENABLE              ; 07:5867
    ld   [hl],$0A                   ; 07:586A
    call Sub075875                  ; 07:586C
    ld   hl,SRAMENABLE              ; 07:586F
    ld   [hl],$FF                   ; 07:5872
    rst  $18                        ; 07:5874  Return from 24-bit call

Sub075875:
    ld   hl,$A3BE                   ; 07:5875
    ld   [hl],$01                   ; 07:5878
    ld   a,$50                      ; 07:587A
    ld   hl,$A370                   ; 07:587C
    call Sub001027                  ; 07:587F
    ld   hl,$A3C0                   ; 07:5882
    ldh  a,[<$FF97]                 ; 07:5885
    ldi  [hl],a                     ; 07:5887
    ldh  a,[<$FF98]                 ; 07:5888
    ld   [hl],a                     ; 07:588A
    ret                             ; 07:588B

SubL_07588C:
    ld   hl,SRAMENABLE              ; 07:588C
    ld   [hl],$0A                   ; 07:588F
    call Sub0758B4                  ; 07:5891
    jr   c,Code075899               ; 07:5894
    call Sub075997                  ; 07:5896
Code075899:
    ld   a,$07                      ; 07:5899
    ldh  [<SVBK],a                  ; 07:589B
    ld   hl,$D800                   ; 07:589D
    ld   de,$A200                   ; 07:58A0
    ld   b,$AA                      ; 07:58A3
Code0758A5:
    ld   a,[de]                     ; 07:58A5
    ldi  [hl],a                     ; 07:58A6
    inc  de                         ; 07:58A7
    dec  b                          ; 07:58A8
    jr   nz,Code0758A5              ; 07:58A9
    xor  a                          ; 07:58AB
    ldh  [<SVBK],a                  ; 07:58AC
    ld   hl,SRAMENABLE              ; 07:58AE
    ld   [hl],$FF                   ; 07:58B1
    rst  $18                        ; 07:58B3  Return from 24-bit call

Sub0758B4:
    call Sub0758D1                  ; 07:58B4
    ld   a,[$A2AA]                  ; 07:58B7
    cp   $01                        ; 07:58BA
    jr   nz,Code0758CE              ; 07:58BC
    ldh  a,[<$FF97]                 ; 07:58BE
    ld   hl,$A2AB                   ; 07:58C0
    cp   [hl]                       ; 07:58C3
    jr   nz,Code0758CE              ; 07:58C4
    inc  hl                         ; 07:58C6
    ldh  a,[<$FF98]                 ; 07:58C7
    cp   [hl]                       ; 07:58C9
    jr   nz,Code0758CE              ; 07:58CA
    scf                             ; 07:58CC
    ret                             ; 07:58CD

Code0758CE:
    scf                             ; 07:58CE
    ccf                             ; 07:58CF
    ret                             ; 07:58D0

Sub0758D1:
    ld   a,$AB                      ; 07:58D1
    ld   b,a                        ; 07:58D3
    ld   hl,$A200                   ; 07:58D4
    ld   a,$00                      ; 07:58D7
    ldh  [<$FF97],a                 ; 07:58D9
    ldh  [<$FF98],a                 ; 07:58DB
Code0758DD:
    ldh  a,[<$FF97]                 ; 07:58DD
    add  [hl]                       ; 07:58DF
    ldh  [<$FF97],a                 ; 07:58E0
    ldh  a,[<$FF98]                 ; 07:58E2
    adc  $00                        ; 07:58E4
    ldh  [<$FF98],a                 ; 07:58E6
    inc  hl                         ; 07:58E8
    dec  b                          ; 07:58E9
    jr   nz,Code0758DD              ; 07:58EA
    ret                             ; 07:58EC

Data0758ED:                         ; 07:58ED
.db $06,$E5,$06,$EE,$06,$E2,$06,$E0,\
    $06,$E2,$06,$F4,$04,$E9,$04,$DE,\
    $04,$DA,$04,$DC,$04,$E1,$04,$F4,\
    $05,$E6,$05,$DA,$05,$EB,$05,$E2,\
    $05,$E8,$05,$F4,$07,$DB,$07,$E8,\
    $07,$F0,$07,$EC,$07,$DE,$07,$EB,\
    $04,$DB,$04,$E8,$04,$E8,$04,$F4,\
    $04,$F4,$04,$F4,$06,$F2,$06,$E8,\
    $06,$EC,$06,$E1,$06,$E2,$04,$F4,\
    $04,$E5,$04,$DA,$04,$E4,$04,$E2,\
    $04,$ED,$04,$EE,$06,$ED,$06,$EB,\
    $06,$E8,$06,$E8,$06,$E9,$06,$DA,\
    $05,$ED,$05,$E8,$05,$DA,$05,$DD,\
    $04,$F4,$04,$F4,$04,$E0,$04,$E8,\
    $04,$E8,$04,$E6,$04,$DB,$04,$DA,\
    $30,$75,$00,$A8,$61,$00,$20,$4E,\
    $00,$98,$3A,$00,$10,$27,$00,$40,\
    $1F,$00,$58,$1B,$00,$88,$13,$00,\
    $A0,$0F,$00,$B8,$0B,$00,$13,$0F,\
    $0B,$08,$05,$04,$03,$02,$02,$01,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00

Sub075997:
    ld   de,Data0758ED              ; 07:5997
    ld   hl,$A200                   ; 07:599A
    ld   b,$AA                      ; 07:599D
Code07599F:
    ld   a,[de]                     ; 07:599F
    ldi  [hl],a                     ; 07:59A0
    inc  de                         ; 07:59A1
    dec  b                          ; 07:59A2
    jr   nz,Code07599F              ; 07:59A3
    ld   a,$00                      ; 07:59A5
    and  a                          ; 07:59A7
    jr   z,Code0759D8               ; 07:59A8
    ld   hl,$A201                   ; 07:59AA
    ld   [hl],$EF                   ; 07:59AD
    inc  hl                         ; 07:59AF
    inc  hl                         ; 07:59B0
    ld   a,$27                      ; 07:59B1
    and  $F0                        ; 07:59B3
    swap a                          ; 07:59B5
    add  $D0                        ; 07:59B7
    ldi  [hl],a                     ; 07:59B9
    inc  hl                         ; 07:59BA
    ld   a,$27                      ; 07:59BB
    and  $0F                        ; 07:59BD
    add  $D0                        ; 07:59BF
    ldi  [hl],a                     ; 07:59C1
    inc  hl                         ; 07:59C2
    ld   a,$17                      ; 07:59C3
    and  $F0                        ; 07:59C5
    swap a                          ; 07:59C7
    add  $D0                        ; 07:59C9
    ldi  [hl],a                     ; 07:59CB
    inc  hl                         ; 07:59CC
    ld   a,$17                      ; 07:59CD
    and  $0F                        ; 07:59CF
    add  $D0                        ; 07:59D1
    ldi  [hl],a                     ; 07:59D3
    inc  hl                         ; 07:59D4
    ld   a,$F4                      ; 07:59D5
    ld   [hl],a                     ; 07:59D7
Code0759D8:
    ld   a,$01                      ; 07:59D8
    ld   [$A2AA],a                  ; 07:59DA
    call Sub0758D1                  ; 07:59DD
    ld   hl,$A2AB                   ; 07:59E0
    ldh  a,[<$FF97]                 ; 07:59E3
    ldi  [hl],a                     ; 07:59E5
    ldh  a,[<$FF98]                 ; 07:59E6
    ld   [hl],a                     ; 07:59E8
    ret                             ; 07:59E9

SubL_0759EA:
    ld   hl,SRAMENABLE              ; 07:59EA
    ld   [hl],$0A                   ; 07:59ED
    ld   a,$07                      ; 07:59EF
    ldh  [<SVBK],a                  ; 07:59F1
    ld   hl,$D800                   ; 07:59F3
    ld   de,$A200                   ; 07:59F6
    ld   b,$AA                      ; 07:59F9
Code0759FB:
    ldi  a,[hl]                     ; 07:59FB
    ld   [de],a                     ; 07:59FC
    inc  de                         ; 07:59FD
    dec  b                          ; 07:59FE
    jr   nz,Code0759FB              ; 07:59FF
    jp   Code075AFB                 ; 07:5A01

SubL_075A04:
    ld   hl,SRAMENABLE              ; 07:5A04
    ld   [hl],$0A                   ; 07:5A07
    ld   de,$C291                   ; 07:5A09
    ld   a,[$C356]                  ; 07:5A0C
    sla  a                          ; 07:5A0F
    sla  a                          ; 07:5A11
    ld   c,a                        ; 07:5A13
    sla  a                          ; 07:5A14
    add  c                          ; 07:5A16
    ld   c,a                        ; 07:5A17
    ld   b,$00                      ; 07:5A18
    ld   hl,$A200                   ; 07:5A1A
    add  hl,bc                      ; 07:5A1D
    ld   b,$0C                      ; 07:5A1E
Code075A20:
    ld   a,[de]                     ; 07:5A20
    ldi  [hl],a                     ; 07:5A21
    inc  de                         ; 07:5A22
    dec  b                          ; 07:5A23
    jr   nz,Code075A20              ; 07:5A24
    ld   de,$C17A                   ; 07:5A26
    ld   a,[$C356]                  ; 07:5A29
    ld   c,a                        ; 07:5A2C
    sla  a                          ; 07:5A2D
    add  c                          ; 07:5A2F
    ld   c,a                        ; 07:5A30
    ld   b,$00                      ; 07:5A31
    ld   hl,$A278                   ; 07:5A33
    add  hl,bc                      ; 07:5A36
    ld   b,$03                      ; 07:5A37
Code075A39:
    ld   a,[de]                     ; 07:5A39
    ldi  [hl],a                     ; 07:5A3A
    inc  de                         ; 07:5A3B
    dec  b                          ; 07:5A3C
    jr   nz,Code075A39              ; 07:5A3D
    ld   a,[$C356]                  ; 07:5A3F
    ld   c,a                        ; 07:5A42
    ld   b,$00                      ; 07:5A43
    ld   hl,$A296                   ; 07:5A45
    add  hl,bc                      ; 07:5A48
    ld   a,[W_LevelID]              ; 07:5A49
    ld   [hl],a                     ; 07:5A4C
    ld   a,[$C356]                  ; 07:5A4D
    ld   c,a                        ; 07:5A50
    ld   b,$00                      ; 07:5A51
    ld   hl,$A2A0                   ; 07:5A53
    add  hl,bc                      ; 07:5A56
    ld   a,[W_HardFlag]             ; 07:5A57
    ld   [hl],a                     ; 07:5A5A
    ld   a,$07                      ; 07:5A5B
    ldh  [<SVBK],a                  ; 07:5A5D
    ld   a,[$C356]                  ; 07:5A5F
    sla  a                          ; 07:5A62
    sla  a                          ; 07:5A64
    ld   c,a                        ; 07:5A66
    sla  a                          ; 07:5A67
    add  c                          ; 07:5A69
    ld   c,a                        ; 07:5A6A
    ld   b,$00                      ; 07:5A6B
    ld   hl,$D800                   ; 07:5A6D
    add  hl,bc                      ; 07:5A70
    ld   e,l                        ; 07:5A71
    ld   d,h                        ; 07:5A72
    ld   a,c                        ; 07:5A73
    add  $0C                        ; 07:5A74
    ld   c,a                        ; 07:5A76
    ld   hl,$A200                   ; 07:5A77
    add  hl,bc                      ; 07:5A7A
    ld   a,[$C356]                  ; 07:5A7B
    ld   c,a                        ; 07:5A7E
Code075A7F:
    ld   a,c                        ; 07:5A7F
    cp   $09                        ; 07:5A80
    jr   nc,Code075A8F              ; 07:5A82
    ld   b,$0C                      ; 07:5A84
Code075A86:
    ld   a,[de]                     ; 07:5A86
    ldi  [hl],a                     ; 07:5A87
    inc  de                         ; 07:5A88
    dec  b                          ; 07:5A89
    jr   nz,Code075A86              ; 07:5A8A
    inc  c                          ; 07:5A8C
    jr   Code075A7F                 ; 07:5A8D
Code075A8F:
    ld   a,[$C356]                  ; 07:5A8F
    ld   c,a                        ; 07:5A92
    sla  a                          ; 07:5A93
    add  c                          ; 07:5A95
    ld   c,a                        ; 07:5A96
    ld   b,$00                      ; 07:5A97
    ld   hl,$D878                   ; 07:5A99
    add  hl,bc                      ; 07:5A9C
    ld   e,l                        ; 07:5A9D
    ld   d,h                        ; 07:5A9E
    ld   a,c                        ; 07:5A9F
    add  $03                        ; 07:5AA0
    ld   c,a                        ; 07:5AA2
    ld   hl,$A278                   ; 07:5AA3
    add  hl,bc                      ; 07:5AA6
    ld   a,[$C356]                  ; 07:5AA7
    ld   c,a                        ; 07:5AAA
Code075AAB:
    ld   a,c                        ; 07:5AAB
    cp   $09                        ; 07:5AAC
    jr   nc,Code075ABB              ; 07:5AAE
    ld   b,$03                      ; 07:5AB0
Code075AB2:
    ld   a,[de]                     ; 07:5AB2
    ldi  [hl],a                     ; 07:5AB3
    inc  de                         ; 07:5AB4
    dec  b                          ; 07:5AB5
    jr   nz,Code075AB2              ; 07:5AB6
    inc  c                          ; 07:5AB8
    jr   Code075AAB                 ; 07:5AB9
Code075ABB:
    ld   a,[$C356]                  ; 07:5ABB
    ld   c,a                        ; 07:5ABE
    ld   b,$00                      ; 07:5ABF
    ld   hl,$D896                   ; 07:5AC1
    add  hl,bc                      ; 07:5AC4
    ld   e,l                        ; 07:5AC5
    ld   d,h                        ; 07:5AC6
    inc  c                          ; 07:5AC7
    ld   hl,$A296                   ; 07:5AC8
    add  hl,bc                      ; 07:5ACB
    ld   a,[$C356]                  ; 07:5ACC
    ld   c,a                        ; 07:5ACF
Code075AD0:
    ld   a,c                        ; 07:5AD0
    cp   $09                        ; 07:5AD1
    jr   nc,Code075ADB              ; 07:5AD3
    ld   a,[de]                     ; 07:5AD5
    ldi  [hl],a                     ; 07:5AD6
    inc  de                         ; 07:5AD7
    inc  c                          ; 07:5AD8
    jr   Code075AD0                 ; 07:5AD9
Code075ADB:
    ld   a,[$C356]                  ; 07:5ADB
    ld   c,a                        ; 07:5ADE
    ld   b,$00                      ; 07:5ADF
    ld   hl,$D8A0                   ; 07:5AE1
    add  hl,bc                      ; 07:5AE4
    ld   e,l                        ; 07:5AE5
    ld   d,h                        ; 07:5AE6
    inc  c                          ; 07:5AE7
    ld   hl,$A2A0                   ; 07:5AE8
    add  hl,bc                      ; 07:5AEB
    ld   a,[$C356]                  ; 07:5AEC
    ld   c,a                        ; 07:5AEF
Code075AF0:
    ld   a,c                        ; 07:5AF0
    cp   $09                        ; 07:5AF1
    jr   nc,Code075AFB              ; 07:5AF3
    ld   a,[de]                     ; 07:5AF5
    ldi  [hl],a                     ; 07:5AF6
    inc  de                         ; 07:5AF7
    inc  c                          ; 07:5AF8
    jr   Code075AF0                 ; 07:5AF9
Code075AFB:
    call Sub0758D1                  ; 07:5AFB
    ld   hl,$A2AB                   ; 07:5AFE
    ldh  a,[<$FF97]                 ; 07:5B01
    ldi  [hl],a                     ; 07:5B03
    ldh  a,[<$FF98]                 ; 07:5B04
    ld   [hl],a                     ; 07:5B06
    xor  a                          ; 07:5B07
    ldh  [<SVBK],a                  ; 07:5B08
    ld   hl,SRAMENABLE              ; 07:5B0A
    ld   [hl],$FF                   ; 07:5B0D
    rst  $18                        ; 07:5B0F  Return from 24-bit call

SubL_LoadChalLevelSaveData:
; subroutine (24-bit): Load current level's challenge mode save data
    ld   hl,SRAMENABLE              ; 07:5B10
    ld   [hl],$0A                   ; 07:5B13
    call Sub075B61                  ; 07:5B15
    jr   c,Code075B1D               ; 07:5B18
    call Sub075B9B                  ; 07:5B1A
Code075B1D:
    ld   a,[W_LevelID]              ; 07:5B1D
    ld   e,a                        ; 07:5B20
    ld   d,$00                      ; 07:5B21  de = levelID
    ld   hl,$A30D                   ; 07:5B23  SRAM red coin table
    add  hl,de                      ; 07:5B26
    ld   a,[hl]                     ; 07:5B27  red coin count
    cp   $05                        ; 07:5B28
    jr   c,Code075B2E               ; 07:5B2A \ if red coins > 5, set to 5
    ld   a,$05                      ; 07:5B2C /
Code075B2E:
    ld   [$C189],a                  ; 07:5B2E  set current level's best red coin count
    ld   hl,$A32D                   ; 07:5B31  SRAM Yoshi egg table
    add  hl,de                      ; 07:5B34
    ld   a,[hl]                     ; 07:5B35
    ld   [$C194],a                  ; 07:5B36  set current level's Yoshi egg flag
    ld   hl,$A34D                   ; 07:5B39  SRAM high score medal table
    add  hl,de                      ; 07:5B3C
    ld   a,[hl]                     ; 07:5B3D
    ld   [$C18D],a                  ; 07:5B3E  set current level's high score medal flag
    ld   a,[W_LevelID]              ; 07:5B41
    ld   e,a                        ; 07:5B44 \
    sla  a                          ; 07:5B45 |
    add  e                          ; 07:5B47 | de = levelID * 3
    ld   e,a                        ; 07:5B48 |  (capped to 8-bit)
    ld   d,$00                      ; 07:5B49 /
    ld   hl,$A2AD                   ; 07:5B4B  SRAM high score table
    add  hl,de                      ; 07:5B4E
    ldi  a,[hl]                     ; 07:5B4F \
    ld   [$C18A],a                  ; 07:5B50 | set current level's high score
    ldi  a,[hl]                     ; 07:5B53 |
    ld   [$C18B],a                  ; 07:5B54 |
    ld   a,[hl]                     ; 07:5B57 |
    ld   [$C18C],a                  ; 07:5B58 /
    ld   hl,SRAMENABLE              ; 07:5B5B
    ld   [hl],$FF                   ; 07:5B5E
    rst  $18                        ; 07:5B60  Return from 24-bit call

Sub075B61:
    call Sub075B7F                  ; 07:5B61
    ld   hl,$A36D                   ; 07:5B64
    ld   a,[hl]                     ; 07:5B67
    cp   $01                        ; 07:5B68
    jr   nz,Code075B7C              ; 07:5B6A
    ld   hl,$A36E                   ; 07:5B6C
    ldh  a,[<$FF97]                 ; 07:5B6F
    cp   [hl]                       ; 07:5B71
    jr   nz,Code075B7C              ; 07:5B72
    inc  hl                         ; 07:5B74
    ldh  a,[<$FF98]                 ; 07:5B75
    cp   [hl]                       ; 07:5B77
    jr   nz,Code075B7C              ; 07:5B78
    scf                             ; 07:5B7A
    ret                             ; 07:5B7B
Code075B7C:
    scf                             ; 07:5B7C
    ccf                             ; 07:5B7D
    ret                             ; 07:5B7E

Sub075B7F:
    ld   a,$C1                      ; 07:5B7F
    ld   b,a                        ; 07:5B81
    ld   hl,$A2AD                   ; 07:5B82
    ld   a,$00                      ; 07:5B85
    ldh  [<$FF97],a                 ; 07:5B87
    ldh  [<$FF98],a                 ; 07:5B89
Code075B8B:
    ldh  a,[<$FF97]                 ; 07:5B8B
    add  [hl]                       ; 07:5B8D
    ldh  [<$FF97],a                 ; 07:5B8E
    ldh  a,[<$FF98]                 ; 07:5B90
    adc  $00                        ; 07:5B92
    ldh  [<$FF98],a                 ; 07:5B94
    inc  hl                         ; 07:5B96
    dec  b                          ; 07:5B97
    jr   nz,Code075B8B              ; 07:5B98
    ret                             ; 07:5B9A

Sub075B9B:
    ld   hl,$A2AD                   ; 07:5B9B
    ld   b,$C0                      ; 07:5B9E
Code075BA0:
    xor  a                          ; 07:5BA0
    ldi  [hl],a                     ; 07:5BA1
    dec  b                          ; 07:5BA2
    jr   nz,Code075BA0              ; 07:5BA3
    ld   hl,$A36D                   ; 07:5BA5
    ld   [hl],$01                   ; 07:5BA8
    call Sub075B7F                  ; 07:5BAA
    ld   hl,$A36E                   ; 07:5BAD
    ldh  a,[<$FF97]                 ; 07:5BB0
    ldi  [hl],a                     ; 07:5BB2
    ldh  a,[<$FF98]                 ; 07:5BB3
    ld   [hl],a                     ; 07:5BB5
    ret                             ; 07:5BB6

SubL_075BB7:
    ld   a,[$C194]                  ; 07:5BB7
    ld   b,a                        ; 07:5BBA
    ld   a,[$C193]                  ; 07:5BBB
    or   b                          ; 07:5BBE
    ld   [$C194],a                  ; 07:5BBF
    ld   hl,SRAMENABLE              ; 07:5BC2
    ld   [hl],$0A                   ; 07:5BC5
    ld   a,[W_LevelID]              ; 07:5BC7
    ld   e,a                        ; 07:5BCA
    ld   d,$00                      ; 07:5BCB
    ld   hl,$A30D                   ; 07:5BCD
    add  hl,de                      ; 07:5BD0
    ld   a,[$C189]                  ; 07:5BD1
    ld   [hl],a                     ; 07:5BD4
    ld   hl,$A32D                   ; 07:5BD5
    add  hl,de                      ; 07:5BD8
    ld   a,[$C194]                  ; 07:5BD9
    ld   [hl],a                     ; 07:5BDC
    ld   hl,$A34D                   ; 07:5BDD
    add  hl,de                      ; 07:5BE0
    ld   a,[$C18D]                  ; 07:5BE1
    ld   [hl],a                     ; 07:5BE4
    ld   a,[W_LevelID]              ; 07:5BE5
    ld   e,a                        ; 07:5BE8
    sla  a                          ; 07:5BE9
    add  e                          ; 07:5BEB
    ld   e,a                        ; 07:5BEC
    ld   d,$00                      ; 07:5BED
    ld   hl,$A2AD                   ; 07:5BEF
    add  hl,de                      ; 07:5BF2
    ld   a,[$C18A]                  ; 07:5BF3
    ldi  [hl],a                     ; 07:5BF6
    ld   a,[$C18B]                  ; 07:5BF7
    ldi  [hl],a                     ; 07:5BFA
    ld   a,[$C18C]                  ; 07:5BFB
    ld   [hl],a                     ; 07:5BFE
    ld   hl,$A36D                   ; 07:5BFF
    ld   [hl],$01                   ; 07:5C02
    call Sub075B7F                  ; 07:5C04
    ld   hl,$A36E                   ; 07:5C07
    ldh  a,[<$FF97]                 ; 07:5C0A
    ldi  [hl],a                     ; 07:5C0C
    ldh  a,[<$FF98]                 ; 07:5C0D
    ld   [hl],a                     ; 07:5C0F
    ld   hl,SRAMENABLE              ; 07:5C10
    ld   [hl],$FF                   ; 07:5C13
    rst  $18                        ; 07:5C15  Return from 24-bit call

Data075C16:                         ; 07:5C16
.dw $1239,$0F39,$0F19,$0DC4,$0F59,$0F89,$0F59,$0ECC
YouVsBoo_InitialBestTimes:          ; 07:5C26
.dw $0C9A,$0BCE,$0BA8,$0D93,$0D2A,$0D80,$0D01,$0E11

Sub075C36:
    ld   hl,SRAMENABLE              ; 07:5C36
    ld   [hl],$0A                   ; 07:5C39
    ld   hl,$A3F2                   ; 07:5C3B
    ld   a,$31                      ; 07:5C3E
    call Sub001027                  ; 07:5C40
    ld   hl,$A423                   ; 07:5C43
    ldh  a,[<$FF97]                 ; 07:5C46
    cp   [hl]                       ; 07:5C48
    jr   nz,Code075C58              ; 07:5C49
    inc  hl                         ; 07:5C4B
    ldh  a,[<$FF98]                 ; 07:5C4C
    cp   [hl]                       ; 07:5C4E
    jr   nz,Code075C58              ; 07:5C4F
    ld   a,[$A422]                  ; 07:5C51
    cp   $01                        ; 07:5C54
    jr   z,Code075C8F               ; 07:5C56
Code075C58:
    ld   de,$0000                   ; 07:5C58
Code075C5B:
    ld   hl,Data075C16              ; 07:5C5B
    add  hl,de                      ; 07:5C5E
    ld   a,[hl]                     ; 07:5C5F
    ld   hl,$C3B6                   ; 07:5C60
    add  hl,de                      ; 07:5C63
    ld   [hl],a                     ; 07:5C64
    inc  e                          ; 07:5C65
    ld   a,e                        ; 07:5C66
    cp   $10                        ; 07:5C67
    jr   nz,Code075C5B              ; 07:5C69
    ld   de,$0000                   ; 07:5C6B
Code075C6E:
    ld   hl,YouVsBoo_InitialBestTimes; 07:5C6E
    add  hl,de                      ; 07:5C71
    ld   a,[hl]                     ; 07:5C72
    ld   hl,$C3C6                   ; 07:5C73
    add  hl,de                      ; 07:5C76
    ld   [hl],a                     ; 07:5C77
    inc  e                          ; 07:5C78
    ld   a,e                        ; 07:5C79
    cp   $10                        ; 07:5C7A
    jr   nz,Code075C6E              ; 07:5C7C
    ld   de,$0000                   ; 07:5C7E
Code075C81:
    xor  a                          ; 07:5C81
    ld   hl,$C3D6                   ; 07:5C82
    add  hl,de                      ; 07:5C85
    ld   [hl],a                     ; 07:5C86
    inc  e                          ; 07:5C87
    ld   a,e                        ; 07:5C88
    cp   $10                        ; 07:5C89
    jr   nz,Code075C81              ; 07:5C8B
    jr   Code075CC8                 ; 07:5C8D
Code075C8F:
    ld   de,$0000                   ; 07:5C8F
Code075C92:
    ld   hl,$A3F2                   ; 07:5C92
    add  hl,de                      ; 07:5C95
    ld   a,[hl]                     ; 07:5C96
    ld   hl,$C3B6                   ; 07:5C97
    add  hl,de                      ; 07:5C9A
    ld   [hl],a                     ; 07:5C9B
    inc  e                          ; 07:5C9C
    ld   a,e                        ; 07:5C9D
    cp   $10                        ; 07:5C9E
    jr   nz,Code075C92              ; 07:5CA0
    ld   de,$0000                   ; 07:5CA2
Code075CA5:
    ld   hl,$A402                   ; 07:5CA5
    add  hl,de                      ; 07:5CA8
    ld   a,[hl]                     ; 07:5CA9
    ld   hl,$C3C6                   ; 07:5CAA
    add  hl,de                      ; 07:5CAD
    ld   [hl],a                     ; 07:5CAE
    inc  e                          ; 07:5CAF
    ld   a,e                        ; 07:5CB0
    cp   $10                        ; 07:5CB1
    jr   nz,Code075CA5              ; 07:5CB3
    ld   de,$0000                   ; 07:5CB5
Code075CB8:
    ld   hl,$A412                   ; 07:5CB8
    add  hl,de                      ; 07:5CBB
    ld   a,[hl]                     ; 07:5CBC
    ld   hl,$C3D6                   ; 07:5CBD
    add  hl,de                      ; 07:5CC0
    ld   [hl],a                     ; 07:5CC1
    inc  e                          ; 07:5CC2
    ld   a,e                        ; 07:5CC3
    cp   $10                        ; 07:5CC4
    jr   nz,Code075CB8              ; 07:5CC6
Code075CC8:
    ld   hl,SRAMENABLE              ; 07:5CC8
    ld   [hl],$FF                   ; 07:5CCB
    ret                             ; 07:5CCD

SubL_075CCE:
    ld   a,[$C36B]                  ; 07:5CCE
    and  $03                        ; 07:5CD1
    ld   e,a                        ; 07:5CD3
    ld   a,[$C36B]                  ; 07:5CD4
    and  $10                        ; 07:5CD7
    srl  a                          ; 07:5CD9
    srl  a                          ; 07:5CDB
    add  e                          ; 07:5CDD
    sla  a                          ; 07:5CDE
    ld   e,a                        ; 07:5CE0
    ld   d,$00                      ; 07:5CE1
    ld   hl,Data075C16              ; 07:5CE3
    add  hl,de                      ; 07:5CE6
    ldi  a,[hl]                     ; 07:5CE7
    ld   b,[hl]                     ; 07:5CE8
    ld   hl,$C3B6                   ; 07:5CE9
    add  hl,de                      ; 07:5CEC
    ldi  [hl],a                     ; 07:5CED
    ld   [hl],b                     ; 07:5CEE
    ld   hl,YouVsBoo_InitialBestTimes; 07:5CEF
    add  hl,de                      ; 07:5CF2
    ldi  a,[hl]                     ; 07:5CF3
    ld   b,[hl]                     ; 07:5CF4
    ld   hl,$C3C6                   ; 07:5CF5
    add  hl,de                      ; 07:5CF8
    ldi  [hl],a                     ; 07:5CF9
    ld   [hl],b                     ; 07:5CFA
    ld   hl,$C3D6                   ; 07:5CFB
    add  hl,de                      ; 07:5CFE
    xor  a                          ; 07:5CFF
    ldi  [hl],a                     ; 07:5D00
    ld   [hl],a                     ; 07:5D01
    call Sub075D36                  ; 07:5D02
    rst  $18                        ; 07:5D05  Return from 24-bit call

SubL_075D06:
    ld   a,[$C36B]                  ; 07:5D06
    push af                         ; 07:5D09
    and  $03                        ; 07:5D0A
    ld   e,a                        ; 07:5D0C
    pop  af                         ; 07:5D0D
    and  $F0                        ; 07:5D0E
    swap a                          ; 07:5D10
    sla  a                          ; 07:5D12
    sla  a                          ; 07:5D14
    add  e                          ; 07:5D16
    sla  a                          ; 07:5D17
    ld   e,a                        ; 07:5D19
    ld   d,$00                      ; 07:5D1A
    ld   hl,$C3B6                   ; 07:5D1C
    add  hl,de                      ; 07:5D1F
    ldh  a,[<H_PlayerXLow]          ; 07:5D20
    ldi  [hl],a                     ; 07:5D22
    ldh  a,[<H_PlayerXHigh]         ; 07:5D23
    ld   [hl],a                     ; 07:5D25
    ld   hl,$C3C6                   ; 07:5D26
    add  hl,de                      ; 07:5D29
    ld   a,[$C3AE]                  ; 07:5D2A
    ldi  [hl],a                     ; 07:5D2D
    ld   a,[$C3AF]                  ; 07:5D2E
    ld   [hl],a                     ; 07:5D31
    call Sub075D36                  ; 07:5D32
    rst  $18                        ; 07:5D35  Return from 24-bit call

Sub075D36:
    ld   hl,SRAMENABLE              ; 07:5D36
    ld   [hl],$0A                   ; 07:5D39
    ld   de,$0000                   ; 07:5D3B
Code075D3E:
    ld   hl,$C3B6                   ; 07:5D3E
    add  hl,de                      ; 07:5D41
    ld   a,[hl]                     ; 07:5D42
    ld   hl,$A3F2                   ; 07:5D43
    add  hl,de                      ; 07:5D46
    ld   [hl],a                     ; 07:5D47
    inc  e                          ; 07:5D48
    ld   a,e                        ; 07:5D49
    cp   $10                        ; 07:5D4A
    jr   nz,Code075D3E              ; 07:5D4C
    ld   de,$0000                   ; 07:5D4E
Code075D51:
    ld   hl,$C3C6                   ; 07:5D51
    add  hl,de                      ; 07:5D54
    ld   a,[hl]                     ; 07:5D55
    ld   hl,$A402                   ; 07:5D56
    add  hl,de                      ; 07:5D59
    ld   [hl],a                     ; 07:5D5A
    inc  e                          ; 07:5D5B
    ld   a,e                        ; 07:5D5C
    cp   $10                        ; 07:5D5D
    jr   nz,Code075D51              ; 07:5D5F
    ld   de,$0000                   ; 07:5D61
Code075D64:
    ld   hl,$C3D6                   ; 07:5D64
    add  hl,de                      ; 07:5D67
    ld   a,[hl]                     ; 07:5D68
    ld   hl,$A412                   ; 07:5D69
    add  hl,de                      ; 07:5D6C
    ld   [hl],a                     ; 07:5D6D
    inc  e                          ; 07:5D6E
    ld   a,e                        ; 07:5D6F
    cp   $10                        ; 07:5D70
    jr   nz,Code075D64              ; 07:5D72
    ld   hl,$A422                   ; 07:5D74
    ld   [hl],$01                   ; 07:5D77
    ld   hl,$A3F2                   ; 07:5D79
    ld   a,$31                      ; 07:5D7C
    call Sub001027                  ; 07:5D7E
    ld   hl,$A423                   ; 07:5D81
    ldh  a,[<$FF97]                 ; 07:5D84
    ldi  [hl],a                     ; 07:5D86
    ldh  a,[<$FF98]                 ; 07:5D87
    ld   [hl],a                     ; 07:5D89
    ld   hl,SRAMENABLE              ; 07:5D8A
    ld   [hl],$FF                   ; 07:5D8D
    ret                             ; 07:5D8F

SubL_075D90:
    ld   hl,SRAMENABLE              ; 07:5D90
    ld   [hl],$0A                   ; 07:5D93
    ld   a,[$D900]                  ; 07:5D95
    cp   $03                        ; 07:5D98
    jr   c,Code075DB7               ; 07:5D9A
    sub  $03                        ; 07:5D9C
    ld   c,a                        ; 07:5D9E
    sla  a                          ; 07:5D9F
    add  c                          ; 07:5DA1
    sla  a                          ; 07:5DA2
    sla  a                          ; 07:5DA4
    add  c                          ; 07:5DA6
    sla  a                          ; 07:5DA7
    add  c                          ; 07:5DA9
    sla  a                          ; 07:5DAA
    sla  a                          ; 07:5DAC
    ld   c,a                        ; 07:5DAE
    ld   b,$00                      ; 07:5DAF
    ld   hl,$ADD9                   ; 07:5DB1
    add  hl,bc                      ; 07:5DB4
    jr   Code075DED                 ; 07:5DB5
Code075DB7:
    ld   b,$00                      ; 07:5DB7
    ld   a,[$D90F]                  ; 07:5DB9
    ld   e,a                        ; 07:5DBC
    sla  a                          ; 07:5DBD
    rl   b                          ; 07:5DBF
    add  e                          ; 07:5DC1
    ld   c,a                        ; 07:5DC2
    ld   a,b                        ; 07:5DC3
    adc  $00                        ; 07:5DC4
    ld   b,a                        ; 07:5DC6
    sla  c                          ; 07:5DC7
    rl   b                          ; 07:5DC9
    sla  c                          ; 07:5DCB
    rl   b                          ; 07:5DCD
    ld   a,c                        ; 07:5DCF
    add  e                          ; 07:5DD0
    ld   c,a                        ; 07:5DD1
    ld   a,b                        ; 07:5DD2
    adc  $00                        ; 07:5DD3
    ld   b,a                        ; 07:5DD5
    sla  c                          ; 07:5DD6
    rl   b                          ; 07:5DD8
    ld   a,c                        ; 07:5DDA
    add  e                          ; 07:5DDB
    ld   c,a                        ; 07:5DDC
    ld   a,b                        ; 07:5DDD
    adc  $00                        ; 07:5DDE
    ld   b,a                        ; 07:5DE0
    sla  c                          ; 07:5DE1
    rl   b                          ; 07:5DE3
    sla  c                          ; 07:5DE5
    rl   b                          ; 07:5DE7
    ld   hl,$A425                   ; 07:5DE9
    add  hl,bc                      ; 07:5DEC
Code075DED:
    ld   de,$C471                   ; 07:5DED
    ld   bc,$006C                   ; 07:5DF0
    call CopyBytes                  ; 07:5DF3
    ld   hl,SRAMENABLE              ; 07:5DF6
    ld   [hl],$FF                   ; 07:5DF9
    rst  $18                        ; 07:5DFB  Return from 24-bit call

SubL_075DFC:
    ld   hl,SRAMENABLE              ; 07:5DFC
    ld   [hl],$0A                   ; 07:5DFF
    ld   a,[$D900]                  ; 07:5E01
    cp   $03                        ; 07:5E04
    jr   c,Code075E24               ; 07:5E06
    sub  $03                        ; 07:5E08
    ld   c,a                        ; 07:5E0A
    sla  a                          ; 07:5E0B
    add  c                          ; 07:5E0D
    sla  a                          ; 07:5E0E
    sla  a                          ; 07:5E10
    add  c                          ; 07:5E12
    sla  a                          ; 07:5E13
    add  c                          ; 07:5E15
    sla  a                          ; 07:5E16
    sla  a                          ; 07:5E18
    add  $D9                        ; 07:5E1A
    ld   e,a                        ; 07:5E1C
    ld   a,$AD                      ; 07:5E1D
    adc  $00                        ; 07:5E1F
    ld   d,a                        ; 07:5E21
    jr   Code075E5E                 ; 07:5E22
Code075E24:
    ld   b,$00                      ; 07:5E24
    ld   a,[$D90F]                  ; 07:5E26
    ld   e,a                        ; 07:5E29
    sla  a                          ; 07:5E2A
    rl   b                          ; 07:5E2C
    add  e                          ; 07:5E2E
    ld   c,a                        ; 07:5E2F
    ld   a,b                        ; 07:5E30
    adc  $00                        ; 07:5E31
    ld   b,a                        ; 07:5E33
    sla  c                          ; 07:5E34
    rl   b                          ; 07:5E36
    sla  c                          ; 07:5E38
    rl   b                          ; 07:5E3A
    ld   a,c                        ; 07:5E3C
    add  e                          ; 07:5E3D
    ld   c,a                        ; 07:5E3E
    ld   a,b                        ; 07:5E3F
    adc  $00                        ; 07:5E40
    ld   b,a                        ; 07:5E42
    sla  c                          ; 07:5E43
    rl   b                          ; 07:5E45
    ld   a,c                        ; 07:5E47
    add  e                          ; 07:5E48
    ld   c,a                        ; 07:5E49
    ld   a,b                        ; 07:5E4A
    adc  $00                        ; 07:5E4B
    ld   b,a                        ; 07:5E4D
    sla  c                          ; 07:5E4E
    rl   b                          ; 07:5E50
    sla  c                          ; 07:5E52
    rl   b                          ; 07:5E54
    ld   a,c                        ; 07:5E56
    add  $25                        ; 07:5E57
    ld   e,a                        ; 07:5E59
    ld   a,$A4                      ; 07:5E5A
    adc  b                          ; 07:5E5C
    ld   d,a                        ; 07:5E5D
Code075E5E:
    ld   hl,$C471                   ; 07:5E5E
    ld   bc,$006C                   ; 07:5E61
    call CopyBytes                  ; 07:5E64
    ld   hl,SRAMENABLE              ; 07:5E67
    ld   [hl],$FF                   ; 07:5E6A
    rst  $18                        ; 07:5E6C  Return from 24-bit call

SubL_075E6D:
    ld   hl,SRAMENABLE              ; 07:5E6D
    ld   [hl],$0A                   ; 07:5E70
    ld   b,$00                      ; 07:5E72
    ld   a,[$D928]                  ; 07:5E74
    ld   e,a                        ; 07:5E77
    sla  a                          ; 07:5E78
    rl   b                          ; 07:5E7A
    add  e                          ; 07:5E7C
    ld   c,a                        ; 07:5E7D
    ld   a,b                        ; 07:5E7E
    adc  $00                        ; 07:5E7F
    ld   b,a                        ; 07:5E81
    sla  c                          ; 07:5E82
    rl   b                          ; 07:5E84
    sla  c                          ; 07:5E86
    rl   b                          ; 07:5E88
    ld   a,c                        ; 07:5E8A
    add  e                          ; 07:5E8B
    ld   c,a                        ; 07:5E8C
    ld   a,b                        ; 07:5E8D
    adc  $00                        ; 07:5E8E
    ld   b,a                        ; 07:5E90
    sla  c                          ; 07:5E91
    rl   b                          ; 07:5E93
    ld   a,c                        ; 07:5E95
    add  e                          ; 07:5E96
    ld   c,a                        ; 07:5E97
    ld   a,b                        ; 07:5E98
    adc  $00                        ; 07:5E99
    ld   b,a                        ; 07:5E9B
    sla  c                          ; 07:5E9C
    rl   b                          ; 07:5E9E
    sla  c                          ; 07:5EA0
    rl   b                          ; 07:5EA2
    ld   hl,$B0CD                   ; 07:5EA4
    add  hl,bc                      ; 07:5EA7
    ld   de,$C471                   ; 07:5EA8
    ld   bc,$006C                   ; 07:5EAB
    call CopyBytes                  ; 07:5EAE
    ld   hl,SRAMENABLE              ; 07:5EB1
    ld   [hl],$FF                   ; 07:5EB4
    rst  $18                        ; 07:5EB6  Return from 24-bit call

SubL_075EB7:
    ld   hl,SRAMENABLE              ; 07:5EB7
    ld   [hl],$0A                   ; 07:5EBA
    ld   b,$00                      ; 07:5EBC
    ld   a,[$D928]                  ; 07:5EBE
    ld   e,a                        ; 07:5EC1
    sla  a                          ; 07:5EC2
    rl   b                          ; 07:5EC4
    add  e                          ; 07:5EC6
    ld   c,a                        ; 07:5EC7
    ld   a,b                        ; 07:5EC8
    adc  $00                        ; 07:5EC9
    ld   b,a                        ; 07:5ECB
    sla  c                          ; 07:5ECC
    rl   b                          ; 07:5ECE
    sla  c                          ; 07:5ED0
    rl   b                          ; 07:5ED2
    ld   a,c                        ; 07:5ED4
    add  e                          ; 07:5ED5
    ld   c,a                        ; 07:5ED6
    ld   a,b                        ; 07:5ED7
    adc  $00                        ; 07:5ED8
    ld   b,a                        ; 07:5EDA
    sla  c                          ; 07:5EDB
    rl   b                          ; 07:5EDD
    ld   a,c                        ; 07:5EDF
    add  e                          ; 07:5EE0
    ld   c,a                        ; 07:5EE1
    ld   a,b                        ; 07:5EE2
    adc  $00                        ; 07:5EE3
    ld   b,a                        ; 07:5EE5
    sla  c                          ; 07:5EE6
    rl   b                          ; 07:5EE8
    sla  c                          ; 07:5EEA
    rl   b                          ; 07:5EEC
    ld   a,c                        ; 07:5EEE
    add  $CD                        ; 07:5EEF
    ld   e,a                        ; 07:5EF1
    ld   a,$B0                      ; 07:5EF2
    adc  b                          ; 07:5EF4
    ld   d,a                        ; 07:5EF5
    ld   hl,$C471                   ; 07:5EF6
    ld   bc,$006C                   ; 07:5EF9
    call CopyBytes                  ; 07:5EFC
    ld   hl,SRAMENABLE              ; 07:5EFF
    ld   [hl],$FF                   ; 07:5F02
    rst  $18                        ; 07:5F04  Return from 24-bit call

SRAMPtrs075F05:                     ; 07:5F05
.dw $AF1D,$AF1D,$AF1D,$AF89,$AF89,$AFF5,$AFF5,$B061

SubL_075F15:
    ld   a,$0A                      ; 07:5F15
    ld   [SRAMENABLE],a             ; 07:5F17
    ld   b,$00                      ; 07:5F1A
    ld   a,[$C500]                  ; 07:5F1C
    sla  a                          ; 07:5F1F
    ld   c,a                        ; 07:5F21
    ld   hl,SRAMPtrs075F05          ; 07:5F22
    add  hl,bc                      ; 07:5F25
    ldi  a,[hl]                     ; 07:5F26
    ld   h,[hl]                     ; 07:5F27
    ld   l,a                        ; 07:5F28
    ld   bc,$006C                   ; 07:5F29
    ld   de,$C471                   ; 07:5F2C
    call CopyBytes                  ; 07:5F2F
    ld   a,$FF                      ; 07:5F32
    ld   [SRAMENABLE],a             ; 07:5F34
    rst  $18                        ; 07:5F37  Return from 24-bit call

SubL_075F38:
    ld   a,$0A                      ; 07:5F38
    ld   [SRAMENABLE],a             ; 07:5F3A
    ld   b,$00                      ; 07:5F3D
    ld   a,[$C500]                  ; 07:5F3F
    sla  a                          ; 07:5F42
    ld   c,a                        ; 07:5F44
    ld   hl,SRAMPtrs075F05          ; 07:5F45
    add  hl,bc                      ; 07:5F48
    ldi  a,[hl]                     ; 07:5F49
    ld   e,a                        ; 07:5F4A
    ld   d,[hl]                     ; 07:5F4B
    ld   bc,$006C                   ; 07:5F4C
    ld   hl,$C471                   ; 07:5F4F
    call CopyBytes                  ; 07:5F52
    ld   hl,SRAMENABLE              ; 07:5F55
    ld   [hl],$FF                   ; 07:5F58
    rst  $18                        ; 07:5F5A  Return from 24-bit call
