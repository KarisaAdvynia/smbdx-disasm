.bank $06 slot 1
.orga $4000

Code064000:
    ld   de,$0000                   ; 06:4000
    ld   a,e                        ; 06:4003
    ld   hl,$D12C                   ; 06:4004
    add  hl,bc                      ; 06:4007
    ld   [hl],a                     ; 06:4008
Code064009:
    ld   a,e                        ; 06:4009
    cp   c                          ; 06:400A
    jr   nc,Code064024              ; 06:400B
    ld   hl,W_SpriteStatus          ; 06:400D
    add  hl,de                      ; 06:4010
    ld   a,[hl]                     ; 06:4011
    and  a                          ; 06:4012
    jr   z,Code064024               ; 06:4013
    ld   hl,W_SpriteID              ; 06:4015
    add  hl,de                      ; 06:4018
    ld   a,[hl]                     ; 06:4019
    cp   $38                        ; 06:401A
    jr   nz,Code064024              ; 06:401C
    ld   hl,$D12C                   ; 06:401E
    add  hl,bc                      ; 06:4021
    ld   [hl],$01                   ; 06:4022
Code064024:
    inc  e                          ; 06:4024
    ld   a,e                        ; 06:4025
    cp   $0F                        ; 06:4026
    jr   nz,Code064009              ; 06:4028
    ld   hl,$D096                   ; 06:402A
    add  hl,bc                      ; 06:402D
    ld   [hl],$20                   ; 06:402E
    ld   hl,$D11D                   ; 06:4030
    add  hl,bc                      ; 06:4033
    ld   [hl],$00                   ; 06:4034
    ld   a,[$C182]                  ; 06:4036
    or   $08                        ; 06:4039
    ld   [$C182],a                  ; 06:403B
    ld   a,[W_SublevelID]           ; 06:403E
    ld   [$C186],a                  ; 06:4041
    ret                             ; 06:4044

Code064045:
    ld   hl,$D12C                   ; 06:4045
    add  hl,bc                      ; 06:4048
    ld   a,[hl]                     ; 06:4049
    and  a                          ; 06:404A
    jr   z,Code064096               ; 06:404B
    ld   de,$0000                   ; 06:404D
Code064050:
    ld   a,e                        ; 06:4050
    cp   c                          ; 06:4051
    jr   nc,Code06408F              ; 06:4052
    ld   hl,W_SpriteStatus          ; 06:4054
    add  hl,de                      ; 06:4057
    ld   a,[hl]                     ; 06:4058
    and  a                          ; 06:4059
    jr   z,Code06408F               ; 06:405A
    ld   hl,W_SpriteID              ; 06:405C
    add  hl,de                      ; 06:405F
    ld   a,[hl]                     ; 06:4060
    cp   $38                        ; 06:4061
    jr   nz,Code06408F              ; 06:4063
    ld   hl,W_SpriteXHigh           ; 06:4065
    add  hl,de                      ; 06:4068
    push hl                         ; 06:4069
    ld   hl,W_SpriteXLow            ; 06:406A
    add  hl,de                      ; 06:406D
    ldh  a,[<H_PlayerXLow]          ; 06:406E
    sub  [hl]                       ; 06:4070
    pop  hl                         ; 06:4071
    ldh  a,[<H_PlayerXHigh]         ; 06:4072
    sbc  [hl]                       ; 06:4074
    bit  7,a                        ; 06:4075
    jr   nz,Code06408F              ; 06:4077
    ld   a,$00                      ; 06:4079
    ld   hl,W_SpriteStatus          ; 06:407B
    add  hl,de                      ; 06:407E
    ld   [hl],a                     ; 06:407F
    ld   hl,W_SpriteID              ; 06:4080
    add  hl,de                      ; 06:4083
    ld   [hl],a                     ; 06:4084
    ld   hl,W_SpriteStatus          ; 06:4085
    add  hl,bc                      ; 06:4088
    ld   [hl],a                     ; 06:4089
    ld   hl,W_SpriteID              ; 06:408A
    add  hl,bc                      ; 06:408D
    ld   [hl],a                     ; 06:408E
Code06408F:
    inc  e                          ; 06:408F
    ld   a,e                        ; 06:4090
    cp   $0F                        ; 06:4091
    jr   nz,Code064050              ; 06:4093
    ret                             ; 06:4095

Code064096:
    ld   hl,$D096                   ; 06:4096
    add  hl,bc                      ; 06:4099
    ld   a,[hl]                     ; 06:409A
    dec  [hl]                       ; 06:409B
    and  a                          ; 06:409C
    jr   nz,Return0640D8            ; 06:409D
    ld   [hl],$20                   ; 06:409F
    ld   de,$0000                   ; 06:40A1
    ld   a,e                        ; 06:40A4
    ldh  [<$FFA5],a                 ; 06:40A5
Code0640A7:
    ld   hl,W_SpriteStatus          ; 06:40A7
    add  hl,de                      ; 06:40AA
    ld   a,[hl]                     ; 06:40AB
    and  a                          ; 06:40AC
    jr   z,Code0640C9               ; 06:40AD
    ld   hl,W_SpriteID              ; 06:40AF
    add  hl,de                      ; 06:40B2
    ld   a,[hl]                     ; 06:40B3
    cp   $51                        ; 06:40B4
    jr   z,Code0640C4               ; 06:40B6
    cp   $05                        ; 06:40B8
    jr   c,Code0640C9               ; 06:40BA
    cp   $08                        ; 06:40BC
    jr   c,Code0640C4               ; 06:40BE
    jr   z,Code0640C4               ; 06:40C0
    jr   Code0640C9                 ; 06:40C2
Code0640C4:
    ldh  a,[<$FFA5]                 ; 06:40C4
    inc  a                          ; 06:40C6
    ldh  [<$FFA5],a                 ; 06:40C7
Code0640C9:
    inc  e                          ; 06:40C9
    ld   a,e                        ; 06:40CA
    cp   $0F                        ; 06:40CB
    jr   nz,Code0640A7              ; 06:40CD
    ldh  a,[<$FFA5]                 ; 06:40CF
    cp   $03                        ; 06:40D1
    jr   nc,Return0640D8            ; 06:40D3
    call Sub0640E9                  ; 06:40D5
Return0640D8:
    ret                             ; 06:40D8

Data0640D9:                         ; 06:40D9
.db $70,$60,$C0,$80,$50,$90,$D0,$A0
BitTable8Asc_0640E1:                ; 06:40E1
.db $01,$02,$04,$08,$10,$20,$40,$80

Sub0640E9:
    ld   a,$05                      ; 06:40E9
    call LoadSpriteAnySlot          ; 06:40EB
    jp   c,Return064196             ; 06:40EE
    ldh  a,[<H_CameraXLow]          ; 06:40F1
    add  $A0                        ; 06:40F3
    ldh  [<$FF97],a                 ; 06:40F5
    ldh  a,[<H_CameraXHigh]         ; 06:40F7
    adc  $00                        ; 06:40F9
    ld   hl,W_SpriteXHigh           ; 06:40FB
    add  hl,de                      ; 06:40FE
    ld   [hl],a                     ; 06:40FF
    ld   hl,W_SpriteXLow            ; 06:4100
    add  hl,de                      ; 06:4103
    ldh  a,[<$FF97]                 ; 06:4104
    ld   [hl],a                     ; 06:4106
    push de                         ; 06:4107
    call Sub0010E4                  ; 06:4108
    ldh  a,[<$FFBC]                 ; 06:410B
    ld   e,a                        ; 06:410D
Code06410E:
    ld   a,e                        ; 06:410E
    inc  a                          ; 06:410F
    and  $07                        ; 06:4110
    ld   e,a                        ; 06:4112
    ld   d,$00                      ; 06:4113
    ld   hl,BitTable8Asc_0640E1     ; 06:4115
    add  hl,de                      ; 06:4118
    ld   d,[hl]                     ; 06:4119
    ld   hl,$D11D                   ; 06:411A
    add  hl,bc                      ; 06:411D
    ld   a,[hl]                     ; 06:411E
    and  d                          ; 06:411F
    jr   nz,Code06410E              ; 06:4120
    ld   a,[hl]                     ; 06:4122
    or   d                          ; 06:4123
    ld   [hl],a                     ; 06:4124
    cp   $FF                        ; 06:4125
    jr   nz,Code06412B              ; 06:4127
    ld   [hl],$00                   ; 06:4129
Code06412B:
    ld   d,$00                      ; 06:412B
    ld   hl,Data0640D9              ; 06:412D
    add  hl,de                      ; 06:4130
    ld   a,[hl]                     ; 06:4131
    pop  de                         ; 06:4132
    ld   hl,W_SpriteYLow            ; 06:4133
    add  hl,de                      ; 06:4136
    ld   [hl],a                     ; 06:4137
    ld   hl,W_SpriteYHigh           ; 06:4138
    add  hl,de                      ; 06:413B
    ld   [hl],$00                   ; 06:413C
    push bc                         ; 06:413E
    ld   c,$00                      ; 06:413F
    ld   b,$00                      ; 06:4141
    call Sub0010E4                  ; 06:4143
    ldh  a,[<$FFBC]                 ; 06:4146
    cp   $AA                        ; 06:4148
    jr   nc,Code06414E              ; 06:414A
    ld   c,$01                      ; 06:414C
Code06414E:
    ld   a,[W_LevelID]              ; 06:414E
    and  $1C                        ; 06:4151
    cp   $04                        ; 06:4153
    jr   z,Code06415C               ; 06:4155
    ld   a,c                        ; 06:4157
    cpl                             ; 06:4158
    and  $01                        ; 06:4159
    ld   c,a                        ; 06:415B
Code06415C:
    ld   hl,$D0E1                   ; 06:415C
    add  hl,de                      ; 06:415F
    ld   [hl],c                     ; 06:4160
    ld   hl,W_SpriteID              ; 06:4161
    add  hl,de                      ; 06:4164
    ld   a,[hl]                     ; 06:4165
    add  c                          ; 06:4166
    ld   [hl],a                     ; 06:4167
    ld   hl,Data064197              ; 06:4168
    add  hl,bc                      ; 06:416B
    ld   a,[hl]                     ; 06:416C
    pop  bc                         ; 06:416D
    ld   hl,W_SpriteXSpeed          ; 06:416E
    add  hl,de                      ; 06:4171
    ld   [hl],a                     ; 06:4172
    ld   hl,W_SpriteYSpeed          ; 06:4173
    add  hl,de                      ; 06:4176
    ld   [hl],$00                   ; 06:4177
    ld   a,e                        ; 06:4179
    and  $01                        ; 06:417A
    ldh  [<$FFA6],a                 ; 06:417C
    swap a                          ; 06:417E
    ld   hl,W_SpriteYLow            ; 06:4180
    add  hl,de                      ; 06:4183
    add  [hl]                       ; 06:4184
    ld   [hl],a                     ; 06:4185
    ldh  a,[<$FFA6]                 ; 06:4186
    sla  a                          ; 06:4188
    ld   hl,W_SpriteID              ; 06:418A
    add  hl,de                      ; 06:418D
    add  [hl]                       ; 06:418E
    ld   [hl],a                     ; 06:418F
    ld   hl,$D12C                   ; 06:4190
    add  hl,de                      ; 06:4193
    ld   [hl],$FF                   ; 06:4194
Return064196:
    ret                             ; 06:4196

Data064197:                         ; 06:4197
.db $F8,$FC
Code064199:
    call Sub0025CB                  ; 06:4199
    jp   c,Code0641A8               ; 06:419C
    call Sub001A3D                  ; 06:419F
    call Sub001A79                  ; 06:41A2
    call Sub0641AC                  ; 06:41A5
Code0641A8:
    call Sub0641B4                  ; 06:41A8
    ret                             ; 06:41AB

Sub0641AC:
    ld   hl,W_SpriteSubstate        ; 06:41AC
    add  hl,bc                      ; 06:41AF
    ld   a,[hl]                     ; 06:41B0
    rst  $00                        ; 06:41B1  Execute from 16-bit pointer table
.dw Code0641BC                      ; 06:41B2

Sub0641B4:
    ld   hl,W_SpriteSubstate        ; 06:41B4
    add  hl,bc                      ; 06:41B7
    ld   a,[hl]                     ; 06:41B8
    rst  $00                        ; 06:41B9  Execute from 16-bit pointer table
.dw Code06422A                      ; 06:41BA
Code0641BC:
    call Sub002920                  ; 06:41BC
    jp   c,Return064219             ; 06:41BF
    call Sub001D21                  ; 06:41C2
    jr   nc,Code0641D3              ; 06:41C5
    ldh  a,[<H_GlobalTimer]         ; 06:41C7
    srl  a                          ; 06:41C9
    jr   nc,Code0641D3              ; 06:41CB
    ld   a,$06                      ; 06:41CD
    rst  $10                        ; 06:41CF  24-bit call
.dl SubL_0B4074                     ; 06:41D0
Code0641D3:
    ld   hl,$D096                   ; 06:41D3
    add  hl,bc                      ; 06:41D6
    ld   a,[hl]                     ; 06:41D7
    dec  a                          ; 06:41D8
    ld   [hl],a                     ; 06:41D9
    bit  7,a                        ; 06:41DA
    jr   z,Code0641E9               ; 06:41DC
    ld   [hl],$07                   ; 06:41DE
    ld   hl,$D177                   ; 06:41E0
    add  hl,bc                      ; 06:41E3
    ld   a,[hl]                     ; 06:41E4
    inc  a                          ; 06:41E5
    and  $01                        ; 06:41E6
    ld   [hl],a                     ; 06:41E8
Code0641E9:
    ld   hl,W_SpriteID              ; 06:41E9
    add  hl,bc                      ; 06:41EC
    ld   a,[hl]                     ; 06:41ED
    cp   $07                        ; 06:41EE
    jr   c,Return064219             ; 06:41F0
    ld   hl,$D0A5                   ; 06:41F2
    add  hl,bc                      ; 06:41F5
    dec  [hl]                       ; 06:41F6
    ld   a,[hl]                     ; 06:41F7
    bit  7,a                        ; 06:41F8
    jr   z,Return064219             ; 06:41FA
    ld   [hl],$38                   ; 06:41FC
    ld   hl,$D12C                   ; 06:41FE
    add  hl,bc                      ; 06:4201
    ld   a,[hl]                     ; 06:4202
    ld   hl,W_SpriteYSpeed          ; 06:4203
    add  hl,bc                      ; 06:4206
    add  [hl]                       ; 06:4207
    ld   [hl],a                     ; 06:4208
    cp   $FE                        ; 06:4209
    jr   nc,Return064219            ; 06:420B
    cp   $03                        ; 06:420D
    jr   c,Return064219             ; 06:420F
    ld   hl,$D12C                   ; 06:4211
    add  hl,bc                      ; 06:4214
    ld   a,[hl]                     ; 06:4215
    cpl                             ; 06:4216
    inc  a                          ; 06:4217
    ld   [hl],a                     ; 06:4218
Return064219:
    ret                             ; 06:4219

Data06421A:                         ; 06:421A
.db $4C,$26,$4A,$26,$4C,$26,$4E,$26,\
    $4C,$27,$4A,$27,$4C,$27,$4E,$27
Code06422A:
    ld   hl,$D177                   ; 06:422A
    add  hl,bc                      ; 06:422D
    ld   a,[hl]                     ; 06:422E
    ldh  [<$FF97],a                 ; 06:422F
    ld   hl,$D0E1                   ; 06:4231
    add  hl,bc                      ; 06:4234
    ld   a,[hl]                     ; 06:4235
    ldh  [<$FF98],a                 ; 06:4236
    ld   hl,$0000                   ; 06:4238
    ldh  a,[<$FF97]                 ; 06:423B
    ld   e,a                        ; 06:423D
    sla  e                          ; 06:423E
    sla  e                          ; 06:4240
    ld   d,$00                      ; 06:4242
    add  hl,de                      ; 06:4244
    ldh  a,[<$FF98]                 ; 06:4245
    ld   e,a                        ; 06:4247
    sla  e                          ; 06:4248
    sla  e                          ; 06:424A
    sla  e                          ; 06:424C
    add  hl,de                      ; 06:424E
    ld   de,Data06421A              ; 06:424F
    add  hl,de                      ; 06:4252
    call Disp16x16Sprite            ; 06:4253
    ret                             ; 06:4256

    ret                             ; 06:4257

Code064258:
    ld   hl,W_SpriteYSpeed          ; 06:4258
    add  hl,bc                      ; 06:425B
    ld   [hl],$C2                   ; 06:425C
    ld   hl,W_SpriteYLow            ; 06:425E
    add  hl,bc                      ; 06:4261
    ld   a,[hl]                     ; 06:4262
    ld   hl,$D1D1                   ; 06:4263
    add  hl,bc                      ; 06:4266
    ld   [hl],a                     ; 06:4267
    ld   hl,W_SpriteYHigh           ; 06:4268
    add  hl,bc                      ; 06:426B
    ld   a,[hl]                     ; 06:426C
    ld   hl,$D1E0                   ; 06:426D
    add  hl,bc                      ; 06:4270
    ld   [hl],a                     ; 06:4271
    ret                             ; 06:4272

Code064273:
    call Sub0025CB                  ; 06:4273
    jp   c,Code064282               ; 06:4276
    call Sub001A3D                  ; 06:4279
    call Sub001A79                  ; 06:427C
    call Sub06429B                  ; 06:427F
Code064282:
    ld   hl,$D096                   ; 06:4282
    add  hl,bc                      ; 06:4285
    dec  [hl]                       ; 06:4286
    ld   a,[hl]                     ; 06:4287
    bit  7,a                        ; 06:4288
    jr   z,Code064297               ; 06:428A
    ld   [hl],$08                   ; 06:428C
    ld   hl,$D177                   ; 06:428E
    add  hl,bc                      ; 06:4291
    ld   a,[hl]                     ; 06:4292
    inc  a                          ; 06:4293
    and  $01                        ; 06:4294
    ld   [hl],a                     ; 06:4296
Code064297:
    call Sub0642A5                  ; 06:4297
    ret                             ; 06:429A

Sub06429B:
    ld   hl,W_SpriteSubstate        ; 06:429B
    add  hl,bc                      ; 06:429E
    ld   a,[hl]                     ; 06:429F
    rst  $00                        ; 06:42A0  Execute from 16-bit pointer table
.dw Code0642AF                      ; 06:42A1
.dw Code0642E4                      ; 06:42A3

Sub0642A5:
    ld   hl,W_SpriteSubstate        ; 06:42A5
    add  hl,bc                      ; 06:42A8
    ld   a,[hl]                     ; 06:42A9
    rst  $00                        ; 06:42AA  Execute from 16-bit pointer table
.dw Code064324                      ; 06:42AB
.dw Return06434B                    ; 06:42AD
Code0642AF:
    call Sub002920                  ; 06:42AF
    jp   c,Return0642E3             ; 06:42B2
    call Sub001D21                  ; 06:42B5
    jr   nc,Code0642C6              ; 06:42B8
    ldh  a,[<H_GlobalTimer]         ; 06:42BA
    srl  a                          ; 06:42BC
    jr   nc,Code0642C6              ; 06:42BE
    ld   a,$06                      ; 06:42C0
    rst  $10                        ; 06:42C2  24-bit call
.dl SubL_0B4074                     ; 06:42C3
Code0642C6:
    ld   hl,W_SpriteYSpeed          ; 06:42C6
    add  hl,bc                      ; 06:42C9
    inc  [hl]                       ; 06:42CA
    ld   hl,W_SpriteYHigh           ; 06:42CB
    add  hl,bc                      ; 06:42CE
    ld   a,[hl]                     ; 06:42CF
    cp   $01                        ; 06:42D0
    jr   c,Return0642E3             ; 06:42D2
    ld   hl,W_SpriteSubstate        ; 06:42D4
    add  hl,bc                      ; 06:42D7
    inc  [hl]                       ; 06:42D8
    call Sub0010E4                  ; 06:42D9
    ldh  a,[<$FFBC]                 ; 06:42DC
    ld   hl,$D0A5                   ; 06:42DE
    add  hl,bc                      ; 06:42E1
    ld   [hl],a                     ; 06:42E2
Return0642E3:
    ret                             ; 06:42E3

Code0642E4:
    ld   hl,$D0A5                   ; 06:42E4
    add  hl,bc                      ; 06:42E7
    dec  [hl]                       ; 06:42E8
    jr   nz,Return064313            ; 06:42E9
    ld   hl,W_SpriteSubstate        ; 06:42EB
    add  hl,bc                      ; 06:42EE
    ld   [hl],$00                   ; 06:42EF
    call Sub0010E4                  ; 06:42F1
    ldh  a,[<$FFBC]                 ; 06:42F4
    and  $0F                        ; 06:42F6
    add  $C0                        ; 06:42F8
    ld   hl,W_SpriteYSpeed          ; 06:42FA
    add  hl,bc                      ; 06:42FD
    ld   [hl],a                     ; 06:42FE
    ld   hl,$D1D1                   ; 06:42FF
    add  hl,bc                      ; 06:4302
    ld   a,[hl]                     ; 06:4303
    ld   hl,W_SpriteYLow            ; 06:4304
    add  hl,bc                      ; 06:4307
    ld   [hl],a                     ; 06:4308
    ld   hl,$D1E0                   ; 06:4309
    add  hl,bc                      ; 06:430C
    ld   a,[hl]                     ; 06:430D
    ld   hl,W_SpriteYHigh           ; 06:430E
    add  hl,bc                      ; 06:4311
    ld   [hl],a                     ; 06:4312
Return064313:
    ret                             ; 06:4313

Data064314:                         ; 06:4314
.db $1A,$06,$1B,$26,$1A,$05,$1B,$25,\
    $1A,$46,$1B,$66,$1A,$45,$1B,$65
Code064324:
    ld   hl,$D177                   ; 06:4324
    add  hl,bc                      ; 06:4327
    ld   a,[hl]                     ; 06:4328
    ldh  [<$FF97],a                 ; 06:4329
    ld   hl,W_SpriteYSpeed          ; 06:432B
    add  hl,bc                      ; 06:432E
    ld   a,[hl]                     ; 06:432F
    ld   hl,$0000                   ; 06:4330
    bit  7,a                        ; 06:4333
    jr   nz,Code064339              ; 06:4335
    ld   l,$08                      ; 06:4337
Code064339:
    ldh  a,[<$FF97]                 ; 06:4339
    ld   e,a                        ; 06:433B
    sla  e                          ; 06:433C
    sla  e                          ; 06:433E
    ld   d,$00                      ; 06:4340
    add  hl,de                      ; 06:4342
    ld   de,Data064314              ; 06:4343
    add  hl,de                      ; 06:4346
    call Disp16x16Sprite            ; 06:4347
    ret                             ; 06:434A

Return06434B:
    ret                             ; 06:434B

Code06434C:
    ld   hl,W_SpriteXHigh           ; 06:434C
    add  hl,bc                      ; 06:434F
    push hl                         ; 06:4350
    ld   hl,W_SpriteXLow            ; 06:4351
    add  hl,bc                      ; 06:4354
    ld   a,[hl]                     ; 06:4355
    add  $08                        ; 06:4356
    ld   [hl],a                     ; 06:4358
    pop  hl                         ; 06:4359
    ld   a,[hl]                     ; 06:435A
    adc  $00                        ; 06:435B
    ld   [hl],a                     ; 06:435D
    ld   hl,W_SpriteYLow            ; 06:435E
    add  hl,bc                      ; 06:4361
    ld   a,[hl]                     ; 06:4362
    ld   hl,$D1B3                   ; 06:4363
    add  hl,bc                      ; 06:4366
    ld   [hl],a                     ; 06:4367
    add  $18                        ; 06:4368
    ld   hl,$D1D1                   ; 06:436A
    add  hl,bc                      ; 06:436D
    ld   [hl],a                     ; 06:436E
    ld   hl,$D0A5                   ; 06:436F
    add  hl,bc                      ; 06:4372
    ld   a,$10                      ; 06:4373
    ld   [hl],a                     ; 06:4375
    ret                             ; 06:4376

Code064377:
    call Sub0025CB                  ; 06:4377
    jp   c,Code0643D3               ; 06:437A
    call Sub002920                  ; 06:437D
    jp   c,Code0643D3               ; 06:4380
    call Sub001A79                  ; 06:4383
    ld   hl,W_SpriteSubstate        ; 06:4386
    add  hl,bc                      ; 06:4389
    ld   a,[hl]                     ; 06:438A
    and  a                          ; 06:438B
    jr   z,Code0643BC               ; 06:438C
    call Sub001D21                  ; 06:438E
    jr   nc,Code0643BC              ; 06:4391
    ld   a,[$C1DA]                  ; 06:4393
    ld   hl,$C1DB                   ; 06:4396
    or   [hl]                       ; 06:4399
    jr   nz,Code0643AA              ; 06:439A
    ldh  a,[<H_GlobalTimer]         ; 06:439C
    srl  a                          ; 06:439E
    jr   nc,Code0643BC              ; 06:43A0
    ld   a,$06                      ; 06:43A2
    rst  $10                        ; 06:43A4  24-bit call
.dl SubL_0B4074                     ; 06:43A5
    jr   Code0643BC                 ; 06:43A8
Code0643AA:
    ld   a,$45                      ; 06:43AA
    ldh  [<$FFF2],a                 ; 06:43AC
    call Sub00192C                  ; 06:43AE
    xor  a                          ; 06:43B1
    ld   hl,W_SpriteStatus          ; 06:43B2
    add  hl,bc                      ; 06:43B5
    ld   [hl],a                     ; 06:43B6
    ld   hl,W_SpriteID              ; 06:43B7
    add  hl,bc                      ; 06:43BA
    ld   [hl],a                     ; 06:43BB
Code0643BC:
    call Sub0643D7                  ; 06:43BC
    ld   hl,$D096                   ; 06:43BF
    add  hl,bc                      ; 06:43C2
    ld   a,[hl]                     ; 06:43C3
    dec  [hl]                       ; 06:43C4
    and  a                          ; 06:43C5
    jr   nz,Code0643D3              ; 06:43C6
    ld   [hl],$07                   ; 06:43C8
    ld   hl,$D177                   ; 06:43CA
    add  hl,bc                      ; 06:43CD
    ld   a,[hl]                     ; 06:43CE
    inc  a                          ; 06:43CF
    and  $01                        ; 06:43D0
    ld   [hl],a                     ; 06:43D2
Code0643D3:
    call Sub064475                  ; 06:43D3
    ret                             ; 06:43D6

Sub0643D7:
    ld   hl,W_SpriteSubstate        ; 06:43D7
    add  hl,bc                      ; 06:43DA
    ld   a,[hl]                     ; 06:43DB
    rst  $00                        ; 06:43DC  Execute from 16-bit pointer table
.dw Code0643E7                      ; 06:43DD
.dw Code0643FD                      ; 06:43DF
.dw Code064422                      ; 06:43E1
.dw Code064438                      ; 06:43E3
.dw Code06445D                      ; 06:43E5
Code0643E7:
    ld   hl,$D0A5                   ; 06:43E7
    add  hl,bc                      ; 06:43EA
    ld   a,[hl]                     ; 06:43EB
    dec  [hl]                       ; 06:43EC
    and  a                          ; 06:43ED
    jr   nz,Return0643FC            ; 06:43EE
    ld   hl,W_SpriteYSpeed          ; 06:43F0
    add  hl,bc                      ; 06:43F3
    ld   a,$10                      ; 06:43F4
    ld   [hl],a                     ; 06:43F6
    ld   hl,W_SpriteSubstate        ; 06:43F7
    add  hl,bc                      ; 06:43FA
    inc  [hl]                       ; 06:43FB
Return0643FC:
    ret                             ; 06:43FC

Code0643FD:
    ld   hl,W_SpriteYLow            ; 06:43FD
    add  hl,bc                      ; 06:4400
    ld   a,[hl]                     ; 06:4401
    ld   hl,$D1D1                   ; 06:4402
    add  hl,bc                      ; 06:4405
    cp   [hl]                       ; 06:4406
    jr   c,Return064421             ; 06:4407
    ld   a,[hl]                     ; 06:4409
    ld   hl,W_SpriteYLow            ; 06:440A
    add  hl,bc                      ; 06:440D
    ld   [hl],a                     ; 06:440E
    ld   hl,W_SpriteYSpeed          ; 06:440F
    add  hl,bc                      ; 06:4412
    ld   [hl],$00                   ; 06:4413
    ld   hl,W_SpriteSubstate        ; 06:4415
    add  hl,bc                      ; 06:4418
    inc  [hl]                       ; 06:4419
    ld   hl,$D0A5                   ; 06:441A
    add  hl,bc                      ; 06:441D
    ld   a,$20                      ; 06:441E
    ld   [hl],a                     ; 06:4420
Return064421:
    ret                             ; 06:4421

Code064422:
    ld   hl,$D0A5                   ; 06:4422
    add  hl,bc                      ; 06:4425
    ld   a,[hl]                     ; 06:4426
    dec  [hl]                       ; 06:4427
    and  a                          ; 06:4428
    jr   nz,Return064437            ; 06:4429
    ld   hl,W_SpriteYSpeed          ; 06:442B
    add  hl,bc                      ; 06:442E
    ld   a,$F0                      ; 06:442F
    ld   [hl],a                     ; 06:4431
    ld   hl,W_SpriteSubstate        ; 06:4432
    add  hl,bc                      ; 06:4435
    inc  [hl]                       ; 06:4436
Return064437:
    ret                             ; 06:4437

Code064438:
    ld   hl,W_SpriteYLow            ; 06:4438
    add  hl,bc                      ; 06:443B
    ld   a,[hl]                     ; 06:443C
    ld   hl,$D1B3                   ; 06:443D
    add  hl,bc                      ; 06:4440
    cp   [hl]                       ; 06:4441
    jr   nc,Return06445C            ; 06:4442
    ld   a,[hl]                     ; 06:4444
    ld   hl,W_SpriteYLow            ; 06:4445
    add  hl,bc                      ; 06:4448
    ld   [hl],a                     ; 06:4449
    ld   a,$00                      ; 06:444A
    ld   hl,W_SpriteYSpeed          ; 06:444C
    add  hl,bc                      ; 06:444F
    ld   [hl],a                     ; 06:4450
    ld   hl,W_SpriteSubstate        ; 06:4451
    add  hl,bc                      ; 06:4454
    ld   [hl],a                     ; 06:4455
    ld   hl,$D0A5                   ; 06:4456
    add  hl,bc                      ; 06:4459
    ld   [hl],$20                   ; 06:445A
Return06445C:
    ret                             ; 06:445C

Code06445D:
    call Sub0029EF                  ; 06:445D
    ret                             ; 06:4460

Data064461:                         ; 06:4461
.db $7E,$C6,$7E,$E6,$7C,$C6,$7C,$E6,\
    $7E,$46,$7E,$66,$7C,$46,$7C,$66
Data064471:                         ; 06:4471
.db $22,$C6,$22,$E6

Sub064475:
    ld   hl,W_SpriteSubstate        ; 06:4475
    add  hl,bc                      ; 06:4478
    ld   a,[hl]                     ; 06:4479
    and  a                          ; 06:447A
    jr   z,Return0644B5             ; 06:447B
    ld   hl,Data064471              ; 06:447D
    call Disp16x16Sprite            ; 06:4480
    ld   hl,W_SpriteYLow            ; 06:4483
    add  hl,bc                      ; 06:4486
    ld   a,[hl]                     ; 06:4487
    push hl                         ; 06:4488
    push af                         ; 06:4489
    add  $10                        ; 06:448A
    ld   [hl],a                     ; 06:448C
    ld   hl,$D177                   ; 06:448D
    add  hl,bc                      ; 06:4490
    ld   a,[hl]                     ; 06:4491
    sla  a                          ; 06:4492
    sla  a                          ; 06:4494
    ld   e,a                        ; 06:4496
    ld   d,$00                      ; 06:4497
    ld   hl,$D1D1                   ; 06:4499
    add  hl,bc                      ; 06:449C
    ld   a,[hl]                     ; 06:449D
    add  $08                        ; 06:449E
    ld   hl,$D1D1                   ; 06:44A0
    add  hl,bc                      ; 06:44A3
    sub  [hl]                       ; 06:44A4
    jr   nc,Code0644AB              ; 06:44A5
    ld   a,e                        ; 06:44A7
    add  $08                        ; 06:44A8
    ld   e,a                        ; 06:44AA
Code0644AB:
    ld   hl,Data064461              ; 06:44AB
    add  hl,de                      ; 06:44AE
    call Disp16x16Sprite            ; 06:44AF
    pop  af                         ; 06:44B2
    pop  hl                         ; 06:44B3
    ld   [hl],a                     ; 06:44B4
Return0644B5:
    ret                             ; 06:44B5

Data0644B6:                         ; 06:44B6
.dsb $10, $00
Code0644C6:
    ld   a,[W_ChallengeFlag]        ; 06:44C6
    and  a                          ; 06:44C9
    jr   nz,Code06451F              ; 06:44CA
    ld   a,[W_LevelID]              ; 06:44CC
    cp   $1F                        ; 06:44CF
    jr   z,Code0644EC               ; 06:44D1
    ld   hl,W_SpriteXLow            ; 06:44D3
    add  hl,bc                      ; 06:44D6
    ld   a,[hl]                     ; 06:44D7
    add  $04                        ; 06:44D8
    ld   [hl],a                     ; 06:44DA
    push af                         ; 06:44DB
    ld   hl,W_SpriteYHigh           ; 06:44DC
    add  hl,bc                      ; 06:44DF
    pop  af                         ; 06:44E0
    ld   a,[hl]                     ; 06:44E1
    adc  $00                        ; 06:44E2
    ld   [hl],a                     ; 06:44E4
    ld   hl,$D096                   ; 06:44E5
    add  hl,bc                      ; 06:44E8
    ld   [hl],$0A                   ; 06:44E9
    ret                             ; 06:44EB

Code0644EC:
    ld   hl,W_SpriteXLow            ; 06:44EC
    add  hl,bc                      ; 06:44EF
    ld   a,[$C265]                  ; 06:44F0
    add  $20                        ; 06:44F3
    ld   [hl],a                     ; 06:44F5
    push af                         ; 06:44F6
    ld   hl,W_SpriteXHigh           ; 06:44F7
    add  hl,bc                      ; 06:44FA
    pop  af                         ; 06:44FB
    ld   a,[$C267]                  ; 06:44FC
    adc  $00                        ; 06:44FF
    ld   [hl],a                     ; 06:4501
    ld   hl,$D1B3                   ; 06:4502
    add  hl,bc                      ; 06:4505
    ld   a,[$C265]                  ; 06:4506
    add  $10                        ; 06:4509
    ld   [hl],a                     ; 06:450B
    push af                         ; 06:450C
    ld   hl,$D1C2                   ; 06:450D
    add  hl,bc                      ; 06:4510
    pop  af                         ; 06:4511
    ld   a,[$C267]                  ; 06:4512
    adc  $00                        ; 06:4515
    ld   [hl],a                     ; 06:4517
    ld   hl,$D096                   ; 06:4518
    add  hl,bc                      ; 06:451B
    ld   [hl],$17                   ; 06:451C
    ret                             ; 06:451E

Code06451F:
    ld   a,[W_LevelID]              ; 06:451F
    and  $FC                        ; 06:4522
    srl  a                          ; 06:4524
    ld   e,a                        ; 06:4526
    ld   d,$00                      ; 06:4527
    ld   hl,Data0644B6              ; 06:4529
    add  hl,de                      ; 06:452C
    ldi  a,[hl]                     ; 06:452D
    ld   e,a                        ; 06:452E
    ld   d,[hl]                     ; 06:452F
    ld   hl,W_SpriteXHigh           ; 06:4530
    add  hl,bc                      ; 06:4533
    push hl                         ; 06:4534
    ld   hl,W_SpriteXLow            ; 06:4535
    add  hl,bc                      ; 06:4538
    ld   a,e                        ; 06:4539
    add  [hl]                       ; 06:453A
    ld   [hl],a                     ; 06:453B
    pop  hl                         ; 06:453C
    ld   a,d                        ; 06:453D
    adc  [hl]                       ; 06:453E
    ld   [hl],a                     ; 06:453F
    ret                             ; 06:4540

Data064541:                         ; 06:4541
.db $1A,$0E,$1A,$2E,$1C,$0E,$1C,$2E,\
    $6C,$0E,$6C,$2E,$6E,$0E,$6E,$2E,\
    $64,$0E,$66,$0E,$68,$0E,$68,$2E
Data064559:                         ; 06:4559
.db $86,$00,$86,$00,$86,$00,$86,$00,\
    $8C,$01,$8C,$01
Code064565:
    ld   a,[W_ChallengeFlag]        ; 06:4565
    and  a                          ; 06:4568
    jr   nz,Code0645BE              ; 06:4569
    ld   a,[W_LevelID]              ; 06:456B
    cp   $1F                        ; 06:456E
    jp   z,Code064662               ; 06:4570
    ldh  a,[<H_GameState]           ; 06:4573
    cp   $3A                        ; 06:4575
    jp   z,Code064662               ; 06:4577
    ld   de,$0000                   ; 06:457A
    ld   a,[$C1D3]                  ; 06:457D
    cp   $06                        ; 06:4580
    jr   c,Code06458E               ; 06:4582
    call Sub064618                  ; 06:4584
    ld   d,$00                      ; 06:4587
    ldh  a,[<H_GlobalTimer]         ; 06:4589
    and  $08                        ; 06:458B
    ld   e,a                        ; 06:458D
Code06458E:
    push de                         ; 06:458E
    ld   hl,Data064541              ; 06:458F
    add  hl,de                      ; 06:4592
    call Disp16x16Sprite            ; 06:4593
    pop  de                         ; 06:4596
    ld   hl,W_SpriteYLow            ; 06:4597
    add  hl,bc                      ; 06:459A
    ld   a,[hl]                     ; 06:459B
    add  $10                        ; 06:459C
    ldh  [<$FF97],a                 ; 06:459E
    ld   a,$00                      ; 06:45A0
    ldh  [<$FF9B],a                 ; 06:45A2
    ld   hl,W_SpriteXLow            ; 06:45A4
    add  hl,bc                      ; 06:45A7
    ld   a,[hl]                     ; 06:45A8
    ldh  [<$FF98],a                 ; 06:45A9
    ld   hl,W_SpriteXHigh           ; 06:45AB
    add  hl,bc                      ; 06:45AE
    ld   a,[hl]                     ; 06:45AF
    ldh  [<$FF99],a                 ; 06:45B0
    ld   a,$04                      ; 06:45B2
    add  e                          ; 06:45B4
    ld   e,a                        ; 06:45B5
    ld   hl,Data064541              ; 06:45B6
    add  hl,de                      ; 06:45B9
    call Sub002769                  ; 06:45BA
    ret                             ; 06:45BD

Code0645BE:
    ldh  a,[<$FFC1]                 ; 06:45BE
    push af                         ; 06:45C0
    xor  a                          ; 06:45C1
    ldh  [<$FFC1],a                 ; 06:45C2
    ld   hl,Data064559              ; 06:45C4
    call Disp16x16Sprite            ; 06:45C7
    ld   hl,W_SpriteYLow            ; 06:45CA
    add  hl,bc                      ; 06:45CD
    ld   a,[hl]                     ; 06:45CE
    add  $0F                        ; 06:45CF
    ldh  [<$FF97],a                 ; 06:45D1
    ld   a,$00                      ; 06:45D3
    ldh  [<$FF9B],a                 ; 06:45D5
    ld   hl,W_SpriteXLow            ; 06:45D7
    add  hl,bc                      ; 06:45DA
    ld   a,[hl]                     ; 06:45DB
    ldh  [<$FF98],a                 ; 06:45DC
    ld   hl,W_SpriteXHigh           ; 06:45DE
    add  hl,bc                      ; 06:45E1
    ld   a,[hl]                     ; 06:45E2
    ldh  [<$FF99],a                 ; 06:45E3
    ld   de,$0004                   ; 06:45E5
    ld   hl,Data064559              ; 06:45E8
    add  hl,de                      ; 06:45EB
    call Sub002769                  ; 06:45EC
    ld   hl,W_SpriteYLow            ; 06:45EF
    add  hl,bc                      ; 06:45F2
    ld   a,[hl]                     ; 06:45F3
    add  $1F                        ; 06:45F4
    ldh  [<$FF97],a                 ; 06:45F6
    ld   a,$00                      ; 06:45F8
    ldh  [<$FF9B],a                 ; 06:45FA
    ld   hl,W_SpriteXLow            ; 06:45FC
    add  hl,bc                      ; 06:45FF
    ld   a,[hl]                     ; 06:4600
    ldh  [<$FF98],a                 ; 06:4601
    ld   hl,W_SpriteXHigh           ; 06:4603
    add  hl,bc                      ; 06:4606
    ld   a,[hl]                     ; 06:4607
    ldh  [<$FF99],a                 ; 06:4608
    ld   de,$0008                   ; 06:460A
    ld   hl,Data064559              ; 06:460D
    add  hl,de                      ; 06:4610
    call Sub002769                  ; 06:4611
    pop  af                         ; 06:4614
    ldh  [<$FFC1],a                 ; 06:4615
    ret                             ; 06:4617

Sub064618:
    ld   hl,W_SpriteSubstate        ; 06:4618
    add  hl,bc                      ; 06:461B
    ld   a,[hl]                     ; 06:461C
    rst  $00                        ; 06:461D  Execute from 16-bit pointer table
.dw Code064622                      ; 06:461E
.dw Code064634                      ; 06:4620
Code064622:
    ld   hl,$D096                   ; 06:4622
    add  hl,bc                      ; 06:4625
    dec  [hl]                       ; 06:4626
    ret  nz                         ; 06:4627
    ld   hl,W_SpriteYSpeed          ; 06:4628
    add  hl,bc                      ; 06:462B
    ld   [hl],$D0                   ; 06:462C
    ld   hl,W_SpriteSubstate        ; 06:462E
    add  hl,bc                      ; 06:4631
    inc  [hl]                       ; 06:4632
    ret                             ; 06:4633

Code064634:
    call Sub001A79                  ; 06:4634
    ld   hl,W_SpriteYLow            ; 06:4637
    add  hl,bc                      ; 06:463A
    ld   a,[hl]                     ; 06:463B
    cp   $D0                        ; 06:463C
    jr   c,Code06464C               ; 06:463E
    ld   [hl],$D0                   ; 06:4640
    call Sub064655                  ; 06:4642
    ld   hl,W_SpriteSubstate        ; 06:4645
    add  hl,bc                      ; 06:4648
    ld   [hl],$00                   ; 06:4649
    ret                             ; 06:464B

Code06464C:
    ld   hl,W_SpriteYSpeed          ; 06:464C
    add  hl,bc                      ; 06:464F
    ld   a,[hl]                     ; 06:4650
    add  $03                        ; 06:4651
    ld   [hl],a                     ; 06:4653
    ret                             ; 06:4654

Sub064655:
    call Sub0010E4                  ; 06:4655
    and  $1F                        ; 06:4658
    ld   hl,$D096                   ; 06:465A
    add  hl,bc                      ; 06:465D
    add  $20                        ; 06:465E
    ld   [hl],a                     ; 06:4660
    ret                             ; 06:4661

Code064662:
    call Sub001A3D                  ; 06:4662
    call Sub06466C                  ; 06:4665
    call Sub0647BA                  ; 06:4668
    ret                             ; 06:466B

Sub06466C:
    ld   hl,W_SpriteSubstate        ; 06:466C
    add  hl,bc                      ; 06:466F
    ld   a,[hl]                     ; 06:4670
    rst  $00                        ; 06:4671  Execute from 16-bit pointer table
.dw Code06467E                      ; 06:4672
.dw Code064694                      ; 06:4674
.dw Code0646B6                      ; 06:4676
.dw Code0646CA                      ; 06:4678
.dw Code06472E                      ; 06:467A
.dw Return064769                    ; 06:467C
Code06467E:
    ld   a,[$C1D3]                  ; 06:467E
    cp   $06                        ; 06:4681
    ret  c                          ; 06:4683
    ld   hl,$D096                   ; 06:4684
    add  hl,bc                      ; 06:4687
    dec  [hl]                       ; 06:4688
    ret  nz                         ; 06:4689
    ld   [hl],$C0                   ; 06:468A
Code06468C:
    ld   hl,W_SpriteSubstate        ; 06:468C
    add  hl,bc                      ; 06:468F
    inc  [hl]                       ; 06:4690
    ret                             ; 06:4691

Data064692:                         ; 06:4692
.db $00,$01
Code064694:
    ld   hl,$D096                   ; 06:4694
    add  hl,bc                      ; 06:4697
    dec  [hl]                       ; 06:4698
    jr   nz,Code06469F              ; 06:4699
    ld   [hl],$10                   ; 06:469B
    jr   Code06468C                 ; 06:469D
Code06469F:
    ld   a,[hl]                     ; 06:469F
    and  $08                        ; 06:46A0
    srl  a                          ; 06:46A2
    srl  a                          ; 06:46A4
    srl  a                          ; 06:46A6
    ld   e,a                        ; 06:46A8
    ld   d,$00                      ; 06:46A9
    ld   hl,Data064692              ; 06:46AB
    add  hl,de                      ; 06:46AE
    ld   a,[hl]                     ; 06:46AF
    ld   hl,$D177                   ; 06:46B0
    add  hl,bc                      ; 06:46B3
    ld   [hl],a                     ; 06:46B4
    ret                             ; 06:46B5

Code0646B6:
    ld   hl,$D096                   ; 06:46B6
    add  hl,bc                      ; 06:46B9
    dec  [hl]                       ; 06:46BA
    ret  nz                         ; 06:46BB
    ld   [hl],$0A                   ; 06:46BC
    ld   hl,W_SpriteXSpeed          ; 06:46BE
    add  hl,bc                      ; 06:46C1
    ld   [hl],$F6                   ; 06:46C2
    jr   Code06468C                 ; 06:46C4

Data0646C6:                         ; 06:46C6
.db $00,$06,$00,$07

Code0646CA:
    ld   hl,$D1C2                   ; 06:46CA
    add  hl,bc                      ; 06:46CD
    ld   e,[hl]                     ; 06:46CE
    ld   hl,W_SpriteXHigh           ; 06:46CF
    add  hl,bc                      ; 06:46D2
    ld   a,[hl]                     ; 06:46D3
    cp   e                          ; 06:46D4
    jr   nz,Code064709              ; 06:46D5
    ld   hl,$D1B3                   ; 06:46D7
    add  hl,bc                      ; 06:46DA
    ld   e,[hl]                     ; 06:46DB
    ld   hl,W_SpriteXLow            ; 06:46DC
    add  hl,bc                      ; 06:46DF
    ld   a,[hl]                     ; 06:46E0
    cp   e                          ; 06:46E1
    jr   nc,Code064709              ; 06:46E2
    xor  a                          ; 06:46E4
    ld   hl,W_SpriteXSpeed          ; 06:46E5
    add  hl,bc                      ; 06:46E8
    ld   [hl],a                     ; 06:46E9
    ld   hl,$D0D2                   ; 06:46EA
    add  hl,bc                      ; 06:46ED
    ld   [hl],a                     ; 06:46EE
    ld   hl,Data064728              ; 06:46EF
    ld   a,[W_PlayerSize]           ; 06:46F2
    and  a                          ; 06:46F5
    jr   z,Code0646FB               ; 06:46F6
    ld   hl,Data06472B              ; 06:46F8
Code0646FB:
    ld   a,[hl]                     ; 06:46FB
    ld   hl,$D177                   ; 06:46FC
    add  hl,bc                      ; 06:46FF
    ld   [hl],a                     ; 06:4700
    ld   hl,$D096                   ; 06:4701
    add  hl,bc                      ; 06:4704
    ld   [hl],$28                   ; 06:4705
    jr   Code06468C                 ; 06:4707
Code064709:
    ld   hl,$D096                   ; 06:4709
    add  hl,bc                      ; 06:470C
    dec  [hl]                       ; 06:470D
    ret  nz                         ; 06:470E
    ld   [hl],$0A                   ; 06:470F
    ld   hl,$D0D2                   ; 06:4711
    add  hl,bc                      ; 06:4714
    ld   a,[hl]                     ; 06:4715
    inc  a                          ; 06:4716
    and  $03                        ; 06:4717
    ld   [hl],a                     ; 06:4719
    ld   e,a                        ; 06:471A
    ld   d,$00                      ; 06:471B
    ld   hl,Data0646C6              ; 06:471D
    add  hl,de                      ; 06:4720
    ld   a,[hl]                     ; 06:4721
    ld   hl,$D177                   ; 06:4722
    add  hl,bc                      ; 06:4725
    ld   [hl],a                     ; 06:4726
    ret                             ; 06:4727

Data064728:                         ; 06:4728
.db $00,$04,$05
Data06472B:                         ; 06:472B
.db $00,$02,$03
Code06472E:
    ld   hl,$D096                   ; 06:472E
    add  hl,bc                      ; 06:4731
    dec  [hl]                       ; 06:4732
    ret  nz                         ; 06:4733
    ld   [hl],$28                   ; 06:4734
    ld   hl,$D0D2                   ; 06:4736
    add  hl,bc                      ; 06:4739
    inc  [hl]                       ; 06:473A
    ld   a,[hl]                     ; 06:473B
    push af                         ; 06:473C
    cp   $02                        ; 06:473D
    jr   nz,Code064744              ; 06:473F
    call Sub06482C                  ; 06:4741
Code064744:
    pop  af                         ; 06:4744
    cp   $03                        ; 06:4745
    jr   z,Code064760               ; 06:4747
    ld   e,a                        ; 06:4749
    ld   d,$00                      ; 06:474A
    ld   hl,Data064728              ; 06:474C
    ld   a,[W_PlayerSize]           ; 06:474F
    and  a                          ; 06:4752
    jr   z,Code064758               ; 06:4753
    ld   hl,Data06472B              ; 06:4755
Code064758:
    add  hl,de                      ; 06:4758
    ld   a,[hl]                     ; 06:4759
    ld   hl,$D177                   ; 06:475A
    add  hl,bc                      ; 06:475D
    ld   [hl],a                     ; 06:475E
    ret                             ; 06:475F

Code064760:
    ld   hl,$D177                   ; 06:4760
    add  hl,bc                      ; 06:4763
    ld   [hl],$00                   ; 06:4764
    jp   Code06468C                 ; 06:4766
Return064769:
    ret                             ; 06:4769

Data06476A:                         ; 06:476A
.db $64,$0E,$66,$0E,$54,$0E,$6A,$0E,\
    $54,$0E,$6A,$0E,$54,$0E,$6A,$0E,\
    $54,$0E,$6A,$0E,$54,$0E,$6A,$0E,\
    $64,$0E,$66,$0E,$64,$0E,$66,$0E
Data06478A:                         ; 06:478A
.db $68,$0E,$68,$2E,$68,$0E,$68,$2E,\
    $CC,$0E,$CE,$0E,$CC,$0E,$CE,$0E,\
    $C8,$0E,$CA,$0E,$C8,$0E,$CA,$0E,\
    $BC,$0E,$BE,$0E,$BE,$2E,$BC,$2E
Data0647AA:                         ; 06:47AA
.db $00,$00,$00,$01,$00,$01,$00,$00
Data0647B2:                         ; 06:47B2
.db $08,$08,$01,$01,$0A,$0A,$08,$08

Sub0647BA:
    ld   hl,$D177                   ; 06:47BA
    add  hl,bc                      ; 06:47BD
    ld   a,[hl]                     ; 06:47BE
    ld   e,a                        ; 06:47BF
    ld   d,$00                      ; 06:47C0
    push de                         ; 06:47C2
    ld   hl,Data0647B2              ; 06:47C3
    add  hl,de                      ; 06:47C6
    ld   e,[hl]                     ; 06:47C7
    ld   hl,W_SpriteYLow            ; 06:47C8
    add  hl,bc                      ; 06:47CB
    ld   a,[hl]                     ; 06:47CC
    add  e                          ; 06:47CD
    ldh  [<$FF97],a                 ; 06:47CE
    ld   [$D2E4],a                  ; 06:47D0
    xor  a                          ; 06:47D3
    ldh  [<$FF9B],a                 ; 06:47D4
    pop  de                         ; 06:47D6
    ld   hl,Data0647AA              ; 06:47D7
    add  hl,de                      ; 06:47DA
    ld   e,[hl]                     ; 06:47DB
    ld   hl,W_SpriteXLow            ; 06:47DC
    add  hl,bc                      ; 06:47DF
    ld   a,[hl]                     ; 06:47E0
    sub  e                          ; 06:47E1
    ldh  [<$FF98],a                 ; 06:47E2
    ld   [$D2E5],a                  ; 06:47E4
    push af                         ; 06:47E7
    ld   hl,W_SpriteXHigh           ; 06:47E8
    add  hl,bc                      ; 06:47EB
    pop  af                         ; 06:47EC
    ld   a,[hl]                     ; 06:47ED
    sbc  $00                        ; 06:47EE
    ldh  [<$FF99],a                 ; 06:47F0
    ld   [$D2E6],a                  ; 06:47F2
    ld   hl,$D177                   ; 06:47F5
    add  hl,bc                      ; 06:47F8
    ld   a,[hl]                     ; 06:47F9
    sla  a                          ; 06:47FA
    sla  a                          ; 06:47FC
    ld   e,a                        ; 06:47FE
    ld   d,$00                      ; 06:47FF
    push de                         ; 06:4801
    ld   hl,Data06476A              ; 06:4802
    add  hl,de                      ; 06:4805
    call Sub002769                  ; 06:4806
    ld   a,[$D2E4]                  ; 06:4809
    add  $10                        ; 06:480C
    ldh  [<$FF97],a                 ; 06:480E
    xor  a                          ; 06:4810
    ldh  [<$FF9B],a                 ; 06:4811
    ld   hl,W_SpriteXLow            ; 06:4813
    add  hl,bc                      ; 06:4816
    ld   a,[hl]                     ; 06:4817
    ldh  [<$FF98],a                 ; 06:4818
    ld   hl,W_SpriteXHigh           ; 06:481A
    add  hl,bc                      ; 06:481D
    ld   a,[hl]                     ; 06:481E
    ldh  [<$FF99],a                 ; 06:481F
    pop  de                         ; 06:4821
    ld   hl,Data06478A              ; 06:4822
    add  hl,de                      ; 06:4825
    call Sub002769                  ; 06:4826
    ret                             ; 06:4829

Data06482A:                         ; 06:482A
.db $D4,$CC

Sub06482C:
    ld   a,$48                      ; 06:482C
    call LoadSpriteAnySlot          ; 06:482E
    ret  c                          ; 06:4831
    ld   hl,Data06482A              ; 06:4832
    ld   a,[W_PlayerSize]           ; 06:4835
    and  a                          ; 06:4838
    jr   z,Code06483C               ; 06:4839
    inc  hl                         ; 06:483B
Code06483C:
    ld   a,[hl]                     ; 06:483C
    ld   hl,W_SpriteYLow            ; 06:483D
    add  hl,de                      ; 06:4840
    ld   [hl],a                     ; 06:4841
    ld   hl,W_SpriteYHigh           ; 06:4842
    add  hl,de                      ; 06:4845
    ld   [hl],$00                   ; 06:4846
    ldh  a,[<H_PlayerXLow]          ; 06:4848
    add  $0A                        ; 06:484A
    push af                         ; 06:484C
    ld   hl,W_SpriteXLow            ; 06:484D
    add  hl,de                      ; 06:4850
    ld   [hl],a                     ; 06:4851
    ld   hl,$D1B3                   ; 06:4852
    add  hl,de                      ; 06:4855
    ld   [hl],a                     ; 06:4856
    ld   hl,H_PlayerXHigh           ; 06:4857
    pop  af                         ; 06:485A
    ld   a,[hl]                     ; 06:485B
    adc  $00                        ; 06:485C
    ld   hl,W_SpriteXHigh           ; 06:485E
    add  hl,de                      ; 06:4861
    ld   [hl],a                     ; 06:4862
    ld   hl,$D1C2                   ; 06:4863
    add  hl,bc                      ; 06:4866
    ld   [hl],a                     ; 06:4867
    ld   hl,W_SpriteYSpeed          ; 06:4868
    add  hl,de                      ; 06:486B
    ld   [hl],$FE                   ; 06:486C
    ld   hl,$D11D                   ; 06:486E
    add  hl,de                      ; 06:4871
    ld   [hl],$04                   ; 06:4872
    ld   hl,$D096                   ; 06:4874
    add  hl,de                      ; 06:4877
    ld   [hl],$78                   ; 06:4878
    ret                             ; 06:487A

Code06487B:
    call Sub001A3D                  ; 06:487B
    call Sub001A79                  ; 06:487E
    call Sub064888                  ; 06:4881
    call Sub0648D8                  ; 06:4884
    ret                             ; 06:4887

Sub064888:
    ld   hl,$D096                   ; 06:4888
    add  hl,bc                      ; 06:488B
    dec  [hl]                       ; 06:488C
    jr   nz,Code064897              ; 06:488D
    call Sub0029EF                  ; 06:488F
    ld   hl,$C1D3                   ; 06:4892
    inc  [hl]                       ; 06:4895
    ret                             ; 06:4896

Code064897:
    ld   hl,$D11D                   ; 06:4897
    add  hl,bc                      ; 06:489A
    ld   a,[hl]                     ; 06:489B
    bit  7,a                        ; 06:489C
    jr   nz,Code0648B2              ; 06:489E
    ld   hl,$D1B3                   ; 06:48A0
    add  hl,bc                      ; 06:48A3
    ld   a,[hl]                     ; 06:48A4
    add  $04                        ; 06:48A5
    ld   e,a                        ; 06:48A7
    ld   hl,W_SpriteXLow            ; 06:48A8
    add  hl,bc                      ; 06:48AB
    ld   a,[hl]                     ; 06:48AC
    cp   e                          ; 06:48AD
    jr   c,Code0648CB               ; 06:48AE
    jr   Code0648C2                 ; 06:48B0
Code0648B2:
    ld   hl,$D1B3                   ; 06:48B2
    add  hl,bc                      ; 06:48B5
    ld   a,[hl]                     ; 06:48B6
    sub  $03                        ; 06:48B7
    ld   e,a                        ; 06:48B9
    ld   hl,W_SpriteXLow            ; 06:48BA
    add  hl,bc                      ; 06:48BD
    ld   a,[hl]                     ; 06:48BE
    cp   e                          ; 06:48BF
    jr   nc,Code0648CB              ; 06:48C0
Code0648C2:
    ld   hl,$D11D                   ; 06:48C2
    add  hl,bc                      ; 06:48C5
    ld   a,[hl]                     ; 06:48C6
    xor  $FF                        ; 06:48C7
    inc  a                          ; 06:48C9
    ld   [hl],a                     ; 06:48CA
Code0648CB:
    ld   hl,$D11D                   ; 06:48CB
    add  hl,bc                      ; 06:48CE
    ld   a,[hl]                     ; 06:48CF
    ld   hl,W_SpriteXSpeed          ; 06:48D0
    add  hl,bc                      ; 06:48D3
    ld   [hl],a                     ; 06:48D4
    ret                             ; 06:48D5

Data0648D6:                         ; 06:48D6
.db $24,$06

Sub0648D8:
    ld   hl,W_SpriteYLow            ; 06:48D8
    add  hl,bc                      ; 06:48DB
    ld   a,[hl]                     ; 06:48DC
    ldh  [<$FF97],a                 ; 06:48DD
    ld   hl,W_SpriteXLow            ; 06:48DF
    add  hl,bc                      ; 06:48E2
    ld   a,[hl]                     ; 06:48E3
    ldh  [<$FF98],a                 ; 06:48E4
    ld   hl,W_SpriteXHigh           ; 06:48E6
    add  hl,bc                      ; 06:48E9
    ld   a,[hl]                     ; 06:48EA
    ldh  [<$FF99],a                 ; 06:48EB
    ld   hl,Data0648D6              ; 06:48ED
    call Sub002861                  ; 06:48F0
    ret                             ; 06:48F3

Code0648F4:
    xor  a                          ; 06:48F4
    ldh  [<$FF98],a                 ; 06:48F5
    ld   de,$000E                   ; 06:48F7
Code0648FA:
    ld   hl,W_SpriteID              ; 06:48FA
    add  hl,de                      ; 06:48FD
    ld   a,[hl]                     ; 06:48FE
    and  a                          ; 06:48FF
    jr   z,Code064912               ; 06:4900
    cp   $1E                        ; 06:4902
    jr   z,Code064912               ; 06:4904
    cp   $49                        ; 06:4906
    jr   c,Code06490E               ; 06:4908
    cp   $4D                        ; 06:490A
    jr   c,Code064912               ; 06:490C
Code06490E:
    ld   hl,$FF98                   ; 06:490E
    inc  [hl]                       ; 06:4911
Code064912:
    dec  e                          ; 06:4912
    jr   nz,Code0648FA              ; 06:4913
    ld   hl,$FF98                   ; 06:4915
    ld   a,[hl]                     ; 06:4918
    cp   $05                        ; 06:4919
    ret  nc                         ; 06:491B
    ld   a,$05                      ; 06:491C
    sub  [hl]                       ; 06:491E
    ld   [hl],a                     ; 06:491F
    ld   hl,W_SpriteID              ; 06:4920
    add  hl,bc                      ; 06:4923
    ld   a,[hl]                     ; 06:4924
    sub  $49                        ; 06:4925
    ld   e,a                        ; 06:4927
    and  $01                        ; 06:4928
    add  $03                        ; 06:492A
    ldh  [<$FF97],a                 ; 06:492C
    ld   a,e                        ; 06:492E
    and  $02                        ; 06:492F
    srl  a                          ; 06:4931
    or   $02                        ; 06:4933
    ld   e,a                        ; 06:4935
    ld   hl,$FF98                   ; 06:4936
    ld   a,[hl]                     ; 06:4939
    sub  e                          ; 06:493A
    jr   nc,Code06493E              ; 06:493B
    ld   e,[hl]                     ; 06:493D
Code06493E:
    ld   d,$00                      ; 06:493E
Code064940:
    push de                         ; 06:4940
    ldh  a,[<$FF97]                 ; 06:4941
    call LoadSpriteAnySlot          ; 06:4943
    jr   c,Code06499A               ; 06:4946
    push bc                         ; 06:4948
    push de                         ; 06:4949
    ld   b,d                        ; 06:494A
    ld   c,e                        ; 06:494B
    ld   hl,W_SpriteID              ; 06:494C
    add  hl,bc                      ; 06:494F
    ld   a,[hl]                     ; 06:4950
    cp   $03                        ; 06:4951
    jr   nz,Code06495D              ; 06:4953
    ld   a,$06                      ; 06:4955
    rst  $10                        ; 06:4957  24-bit call
.dl SubL_024E89                     ; 06:4958
    jr   Code064963                 ; 06:495B
Code06495D:
    ld   a,$06                      ; 06:495D
    rst  $10                        ; 06:495F  24-bit call
.dl SubL_025754                     ; 06:4960
Code064963:
    pop  de                         ; 06:4963
    pop  bc                         ; 06:4964
    ld   hl,W_SpriteXHigh           ; 06:4965
    add  hl,bc                      ; 06:4968
    ld   a,[hl]                     ; 06:4969
    ld   hl,W_SpriteXHigh           ; 06:496A
    add  hl,de                      ; 06:496D
    ld   [hl],a                     ; 06:496E
    ld   hl,W_SpriteXLow            ; 06:496F
    add  hl,bc                      ; 06:4972
    ld   a,[hl]                     ; 06:4973
    ld   hl,W_SpriteXLow            ; 06:4974
    add  hl,de                      ; 06:4977
    ld   [hl],a                     ; 06:4978
    add  $18                        ; 06:4979
    push af                         ; 06:497B
    ld   hl,W_SpriteXLow            ; 06:497C
    add  hl,bc                      ; 06:497F
    ld   [hl],a                     ; 06:4980
    ld   hl,W_SpriteXHigh           ; 06:4981
    add  hl,bc                      ; 06:4984
    pop  af                         ; 06:4985
    ld   a,[hl]                     ; 06:4986
    adc  $00                        ; 06:4987
    ld   [hl],a                     ; 06:4989
    ld   hl,W_SpriteYLow            ; 06:498A
    add  hl,bc                      ; 06:498D
    ld   a,[hl]                     ; 06:498E
    ld   hl,W_SpriteYLow            ; 06:498F
    add  hl,de                      ; 06:4992
    ld   [hl],a                     ; 06:4993
    pop  de                         ; 06:4994
    dec  e                          ; 06:4995
    jr   nz,Code064940              ; 06:4996
    jr   Code06499B                 ; 06:4998
Code06499A:
    pop  de                         ; 06:499A
Code06499B:
    call Sub0029EF                  ; 06:499B
    ret                             ; 06:499E

SubL_06499F:
    ld   a,$0A                      ; 06:499F
    call LoadSpriteAnySlot          ; 06:49A1
    jr   c,ReturnL_0649DB           ; 06:49A4
    ldh  a,[<H_PlayerXLow]          ; 06:49A6
    add  $F0                        ; 06:49A8
    ldh  [<$FF97],a                 ; 06:49AA
    ldh  a,[<H_PlayerXHigh]         ; 06:49AC
    adc  $FF                        ; 06:49AE
    ldh  [<$FF98],a                 ; 06:49B0
    ldh  a,[<H_PlayerYLow]          ; 06:49B2
    add  $D8                        ; 06:49B4
    ldh  [<$FF99],a                 ; 06:49B6
    ld   hl,W_SpriteXLow            ; 06:49B8
    add  hl,de                      ; 06:49BB
    ldh  a,[<$FF97]                 ; 06:49BC
    ld   [hl],a                     ; 06:49BE
    ld   hl,W_SpriteXHigh           ; 06:49BF
    add  hl,de                      ; 06:49C2
    ldh  a,[<$FF98]                 ; 06:49C3
    ld   [hl],a                     ; 06:49C5
    ld   hl,W_SpriteYLow            ; 06:49C6
    add  hl,de                      ; 06:49C9
    ldh  a,[<$FF99]                 ; 06:49CA
    ld   [hl],a                     ; 06:49CC
    add  $E8                        ; 06:49CD
    ld   hl,$D1D1                   ; 06:49CF
    add  hl,de                      ; 06:49D2
    ld   [hl],a                     ; 06:49D3
    ld   hl,W_SpriteYSpeed          ; 06:49D4
    add  hl,de                      ; 06:49D7
    ld   a,$F8                      ; 06:49D8
    ld   [hl],a                     ; 06:49DA
ReturnL_0649DB:
    rst  $18                        ; 06:49DB  Return from 24-bit call

Data0649DC:                         ; 06:49DC
.db $30,$86,$32,$86
Code0649E0:
    call Sub0649EA                  ; 06:49E0
    ld   hl,Data0649DC              ; 06:49E3
    call Disp16x16Sprite            ; 06:49E6
    ret                             ; 06:49E9

Sub0649EA:
    ld   hl,W_SpriteSubstate        ; 06:49EA
    add  hl,bc                      ; 06:49ED
    ld   a,[hl]                     ; 06:49EE
    rst  $00                        ; 06:49EF  Execute from 16-bit pointer table
.dw Code0649F4                      ; 06:49F0
.dw Code064000                      ; 06:49F2
Code0649F4:
    call Sub001A79                  ; 06:49F4
    ld   hl,W_SpriteYLow            ; 06:49F7
    add  hl,bc                      ; 06:49FA
    ld   a,[hl]                     ; 06:49FB
    ld   d,h                        ; 06:49FC
    ld   e,l                        ; 06:49FD
    ld   hl,$D1D1                   ; 06:49FE
    add  hl,bc                      ; 06:4A01
    cp   [hl]                       ; 06:4A02
    jr   nc,Return064A0E            ; 06:4A03
    ld   a,[hl]                     ; 06:4A05
    ld   h,d                        ; 06:4A06
    ld   l,e                        ; 06:4A07
    ld   [hl],a                     ; 06:4A08
    ld   hl,W_SpriteSubstate        ; 06:4A09
    add  hl,bc                      ; 06:4A0C
    inc  [hl]                       ; 06:4A0D
Return064A0E:
    ret                             ; 06:4A0E

SubL_064A0F:
    push bc                         ; 06:4A0F
    ld   a,$21                      ; 06:4A10
    call LoadSpriteAnySlot          ; 06:4A12
    jr   c,Code064A36               ; 06:4A15
    ld   hl,W_SpriteXLow            ; 06:4A17
    add  hl,de                      ; 06:4A1A
    ldh  a,[<$FF97]                 ; 06:4A1B
    ld   [hl],a                     ; 06:4A1D
    ld   hl,W_SpriteXHigh           ; 06:4A1E
    add  hl,de                      ; 06:4A21
    ldh  a,[<$FF98]                 ; 06:4A22
    ld   [hl],a                     ; 06:4A24
    ld   hl,W_SpriteYLow            ; 06:4A25
    add  hl,de                      ; 06:4A28
    ldh  a,[<$FF99]                 ; 06:4A29
    ld   [hl],a                     ; 06:4A2B
    ld   hl,$D096                   ; 06:4A2C
    add  hl,de                      ; 06:4A2F
    ld   [hl],$04                   ; 06:4A30
    ld   a,$4B                      ; 06:4A32
    ldh  [<$FFF2],a                 ; 06:4A34
Code064A36:
    pop  bc                         ; 06:4A36
    rst  $18                        ; 06:4A37  Return from 24-bit call

Data064A38:                         ; 06:4A38
.db $20,$06,$20,$26,$1E,$06,$1E,$26,\
    $1C,$06,$1C,$26
Code064A44:
    ld   hl,$D096                   ; 06:4A44
    add  hl,bc                      ; 06:4A47
    dec  [hl]                       ; 06:4A48
    ld   a,[hl]                     ; 06:4A49
    and  a                          ; 06:4A4A
    jr   nz,Code064A66              ; 06:4A4B
    ld   [hl],$04                   ; 06:4A4D
    ld   hl,$D177                   ; 06:4A4F
    add  hl,bc                      ; 06:4A52
    inc  [hl]                       ; 06:4A53
    ld   a,[hl]                     ; 06:4A54
    cp   $03                        ; 06:4A55
    jr   nz,Code064A66              ; 06:4A57
    ld   a,$00                      ; 06:4A59
    ld   hl,W_SpriteStatus          ; 06:4A5B
    add  hl,bc                      ; 06:4A5E
    ld   [hl],a                     ; 06:4A5F
    ld   hl,W_SpriteID              ; 06:4A60
    add  hl,bc                      ; 06:4A63
    ld   [hl],a                     ; 06:4A64
    ret                             ; 06:4A65

Code064A66:
    ld   hl,$D177                   ; 06:4A66
    add  hl,bc                      ; 06:4A69
    ld   e,[hl]                     ; 06:4A6A
    ld   d,$00                      ; 06:4A6B
    sla  e                          ; 06:4A6D
    sla  e                          ; 06:4A6F
    ld   hl,Data064A38              ; 06:4A71
    add  hl,de                      ; 06:4A74
    call Disp16x16Sprite            ; 06:4A75
    ret                             ; 06:4A78

Data064A79:                         ; 06:4A79
.db $9A,$A8,$05,$00,$DE,$00,$EB,$00,\
    $EB,$00,$E8,$00,$EB,$9A,$EA,$02,\
    $00,$F4,$00,$F4,$9B,$28,$04,$00,\
    $E6,$00,$E8,$00,$DD,$00,$DE,$9B,\
    $6A,$02,$00,$F4,$00,$F4,$00

Sub064AA0:
    call Sub00126D                  ; 06:4AA0
    ld   a,$00                      ; 06:4AA3
    ldh  [<IE],a                    ; 06:4AA5
    ldh  [<$FF93],a                 ; 06:4AA7
    ld   a,:Gr_NormalGameplay       ; 06:4AA9
    ld   b,$06                      ; 06:4AAB
    call LoadGraphicsBank           ; 06:4AAD
    call Sub00128D                  ; 06:4AB0
    ld   a,$00                      ; 06:4AB3
    ldh  [<H_CameraXLow],a          ; 06:4AB5
    ldh  [<H_CameraXHigh],a         ; 06:4AB7
    ldh  [<$FFBB],a                 ; 06:4AB9
    ld   a,$70                      ; 06:4ABB
    ldh  [<H_CameraY],a             ; 06:4ABD
    call Sub064AD1                  ; 06:4ABF
    ld   a,$01                      ; 06:4AC2
    ldh  [<IE],a                    ; 06:4AC4
    ldh  [<$FF93],a                 ; 06:4AC6
    ld   a,$87                      ; 06:4AC8
    ldh  [<LCDC],a                  ; 06:4ACA
    ld   hl,H_GameState             ; 06:4ACC
    inc  [hl]                       ; 06:4ACF
    ret                             ; 06:4AD0

Sub064AD1:
    ld   a,$00                      ; 06:4AD1
    ld   hl,W_PaletteBuffer         ; 06:4AD3
    ldi  [hl],a                     ; 06:4AD6
    ld   [hl],a                     ; 06:4AD7
    inc  a                          ; 06:4AD8
    ldh  [<$FFC0],a                 ; 06:4AD9
    ld   de,W_TilemapUploadBuffer   ; 06:4ADB
    ld   hl,Data064A79              ; 06:4ADE
    ld   bc,$0027                   ; 06:4AE1
    call CopyBytes                  ; 06:4AE4
    ld   a,[$DA70]                  ; 06:4AE7
    cp   $01                        ; 06:4AEA
    jp   nz,Code064AF8              ; 06:4AEC
    ld   a,[$DA68]                  ; 06:4AEF
    inc  a                          ; 06:4AF2
    add  $10                        ; 06:4AF3
    ld   [$DA70],a                  ; 06:4AF5
Code064AF8:
    ld   a,[$DA70]                  ; 06:4AF8
    ld   b,a                        ; 06:4AFB
    and  $F0                        ; 06:4AFC
    swap a                          ; 06:4AFE
    add  $D0                        ; 06:4B00
    ld   hl,$DF12                   ; 06:4B02
    ldi  [hl],a                     ; 06:4B05
    ld   a,b                        ; 06:4B06
    and  $0F                        ; 06:4B07
    add  $D0                        ; 06:4B09
    inc  hl                         ; 06:4B0B
    ld   [hl],a                     ; 06:4B0C
    ld   a,[$DA71]                  ; 06:4B0D
    ld   b,a                        ; 06:4B10
    and  $F0                        ; 06:4B11
    swap a                          ; 06:4B13
    add  $D0                        ; 06:4B15
    ld   hl,$DF24                   ; 06:4B17
    ldi  [hl],a                     ; 06:4B1A
    ld   a,b                        ; 06:4B1B
    and  $0F                        ; 06:4B1C
    add  $D0                        ; 06:4B1E
    inc  hl                         ; 06:4B20
    ld   [hl],a                     ; 06:4B21
    ld   a,$06                      ; 06:4B22
    call Sub001480                  ; 06:4B24
    ret                             ; 06:4B27

Sub064B28:
; Game state 2A
    ldh  a,[<H_ButtonsPressed]      ; 06:4B28
    and  $08                        ; 06:4B2A
    jr   z,Return064B32             ; 06:4B2C
    ld   a,$27                      ; 06:4B2E
    ldh  [<H_GameState],a           ; 06:4B30
Return064B32:
    ret                             ; 06:4B32

Sub064B33:
    ld   a,$01                      ; 06:4B33
    ldh  [<SB],a                    ; 06:4B35
    ld   a,$00                      ; 06:4B37
    ldh  [<SC],a                    ; 06:4B39
    ld   [$DA6E],a                  ; 06:4B3B
    ld   a,$60                      ; 06:4B3E
    ldh  [<TMA],a                   ; 06:4B40
    ldh  [<TIMA],a                  ; 06:4B42
    ld   a,$02                      ; 06:4B44
    ldh  [<TAC],a                   ; 06:4B46
    ld   a,$06                      ; 06:4B48
    ld   [$DA67],a                  ; 06:4B4A
    xor  a                          ; 06:4B4D
    ld   [$DA69],a                  ; 06:4B4E
    ld   [$DA6A],a                  ; 06:4B51
    ld   [$DA6B],a                  ; 06:4B54
    ld   [$DA6C],a                  ; 06:4B57
    ld   [$DA6D],a                  ; 06:4B5A
    ld   [$DA68],a                  ; 06:4B5D
    ld   [$DA6F],a                  ; 06:4B60
    ld   [$DA70],a                  ; 06:4B63
    ld   [$DA71],a                  ; 06:4B66
    ld   [$DA73],a                  ; 06:4B69
    ld   [$DA79],a                  ; 06:4B6C
    ld   [$DA7A],a                  ; 06:4B6F
    ld   [$DA7B],a                  ; 06:4B72
    ld   [$DA7C],a                  ; 06:4B75
    ld   [$DA7D],a                  ; 06:4B78
    ld   hl,$D977                   ; 06:4B7B
    ld   b,$F0                      ; 06:4B7E
    xor  a                          ; 06:4B80
Code064B81:
    ldi  [hl],a                     ; 06:4B81
    dec  b                          ; 06:4B82
    jp   nz,Code064B81              ; 06:4B83
    ret                             ; 06:4B86

Sub064B87:
    ld   a,[$DA79]                  ; 06:4B87
    inc  a                          ; 06:4B8A
    ld   [$DA79],a                  ; 06:4B8B
    ld   a,[$DA70]                  ; 06:4B8E
    and  a                          ; 06:4B91
    jp   nz,Code064C2F              ; 06:4B92
    ld   b,$01                      ; 06:4B95
    ld   a,[$DA7A]                  ; 06:4B97
    add  b                          ; 06:4B9A
    ld   [$DA7A],a                  ; 06:4B9B
    ld   b,$00                      ; 06:4B9E
    ld   a,[$DA7B]                  ; 06:4BA0
    adc  b                          ; 06:4BA3
    ld   [$DA7B],a                  ; 06:4BA4
    ld   a,[$DA7C]                  ; 06:4BA7
    adc  b                          ; 06:4BAA
    ld   [$DA7C],a                  ; 06:4BAB
    ld   a,[$DA7D]                  ; 06:4BAE
    adc  b                          ; 06:4BB1
    ld   [$DA7D],a                  ; 06:4BB2
    ld   hl,$D978                   ; 06:4BB5
    ld   a,[$DA79]                  ; 06:4BB8
    ldi  [hl],a                     ; 06:4BBB
    ldh  a,[<H_ButtonsHeld]         ; 06:4BBC
    ldi  [hl],a                     ; 06:4BBE
    ld   a,[$C535]                  ; 06:4BBF
    ldi  [hl],a                     ; 06:4BC2
    ld   a,[$C536]                  ; 06:4BC3
    ld   [hl],a                     ; 06:4BC6
    ld   hl,$D9A8                   ; 06:4BC7
    ld   de,$DA38                   ; 06:4BCA
    ldi  a,[hl]                     ; 06:4BCD
    ld   [de],a                     ; 06:4BCE
    inc  de                         ; 06:4BCF
    ldi  a,[hl]                     ; 06:4BD0
    ld   [de],a                     ; 06:4BD1
    inc  de                         ; 06:4BD2
    ldi  a,[hl]                     ; 06:4BD3
    ld   [de],a                     ; 06:4BD4
    inc  de                         ; 06:4BD5
    ld   a,[hl]                     ; 06:4BD6
    ld   [de],a                     ; 06:4BD7
    ld   hl,$DA08                   ; 06:4BD8
    ld   de,$D9D8                   ; 06:4BDB
    ldi  a,[hl]                     ; 06:4BDE
    ld   [de],a                     ; 06:4BDF
    inc  de                         ; 06:4BE0
    ld   a,[hl]                     ; 06:4BE1
    ld   [de],a                     ; 06:4BE2
    ld   hl,$DA08                   ; 06:4BE3
    ld   a,[$DA79]                  ; 06:4BE6
    ldi  [hl],a                     ; 06:4BE9
    ldh  a,[<H_ButtonsHeld]         ; 06:4BEA
    ld   [hl],a                     ; 06:4BEC
    ld   hl,$DA39                   ; 06:4BED
    ld   a,[hl]                     ; 06:4BF0
    cp   $FF                        ; 06:4BF1
    jp   z,Code064C2A               ; 06:4BF3
    ldh  a,[<H_GameState]           ; 06:4BF6
    cp   $26                        ; 06:4BF8
    jp   z,Code064C05               ; 06:4BFA
    cp   $28                        ; 06:4BFD
    jp   z,Code064C05               ; 06:4BFF
    jp   Code064C0F                 ; 06:4C02
Code064C05:
    ldh  a,[<H_ButtonsPressed]      ; 06:4C05
    ld   [$D979],a                  ; 06:4C07
    ldh  a,[<H_ButtonsPressed]      ; 06:4C0A
    ld   [$DA09],a                  ; 06:4C0C
Code064C0F:
    ld   a,[$DA6A]                  ; 06:4C0F
    and  a                          ; 06:4C12
    jp   z,Code064C21               ; 06:4C13
    ld   a,$60                      ; 06:4C16
    ldh  [<TIMA],a                  ; 06:4C18
    ld   a,$06                      ; 06:4C1A
    ldh  [<TAC],a                   ; 06:4C1C
    jp   Code064C65                 ; 06:4C1E
Code064C21:
    ldh  a,[<IE]                    ; 06:4C21
    or   $0C                        ; 06:4C23
    ldh  [<IE],a                    ; 06:4C25
    jp   Code064C65                 ; 06:4C27
Code064C2A:
    ld   b,$05                      ; 06:4C2A
    call Sub065156                  ; 06:4C2C
Code064C2F:
    ldh  a,[<H_GameState]           ; 06:4C2F
    cp   $26                        ; 06:4C31
    jp   z,Code064C3E               ; 06:4C33
    cp   $28                        ; 06:4C36
    jp   z,Code064C3E               ; 06:4C38
    jp   Code064C56                 ; 06:4C3B
Code064C3E:
    ldh  a,[<H_ButtonsPressed]      ; 06:4C3E
    ld   hl,$D9D9                   ; 06:4C40
    ld   [hl],a                     ; 06:4C43
    xor  a                          ; 06:4C44
    ld   hl,$D9A8                   ; 06:4C45
    ldi  [hl],a                     ; 06:4C48
    ldi  [hl],a                     ; 06:4C49
    ldi  [hl],a                     ; 06:4C4A
    ld   [hl],a                     ; 06:4C4B
    ld   hl,$DA38                   ; 06:4C4C
    ldi  [hl],a                     ; 06:4C4F
    ldi  [hl],a                     ; 06:4C50
    ldi  [hl],a                     ; 06:4C51
    ld   [hl],a                     ; 06:4C52
    jp   Code064C65                 ; 06:4C53
Code064C56:
    ldh  a,[<H_ButtonsHeld]         ; 06:4C56
    ld   hl,$D9D9                   ; 06:4C58
    ld   [hl],a                     ; 06:4C5B
    xor  a                          ; 06:4C5C
    ld   hl,$D9A9                   ; 06:4C5D
    ld   [hl],a                     ; 06:4C60
    ld   hl,$DA39                   ; 06:4C61
    ld   [hl],a                     ; 06:4C64
Code064C65:
    ld   a,[$D9D8]                  ; 06:4C65
    ld   b,a                        ; 06:4C68
    ld   a,[$DA38]                  ; 06:4C69
    cp   b                          ; 06:4C6C
    jp   z,Code064C75               ; 06:4C6D
    ld   b,$03                      ; 06:4C70
    call Sub065156                  ; 06:4C72
Code064C75:
    ldh  a,[<H_GameState]           ; 06:4C75
    cp   $26                        ; 06:4C77
    jp   z,Code064C84               ; 06:4C79
    cp   $28                        ; 06:4C7C
    jp   z,Code064C84               ; 06:4C7E
    jp   Code064C9B                 ; 06:4C81
Code064C84:
    ld   hl,$D9D9                   ; 06:4C84
    ld   a,[hl]                     ; 06:4C87
    ld   [$DA74],a                  ; 06:4C88
    ld   [$DA76],a                  ; 06:4C8B
    ld   hl,$DA39                   ; 06:4C8E
    ld   a,[hl]                     ; 06:4C91
    ld   [$DA75],a                  ; 06:4C92
    ld   [$DA77],a                  ; 06:4C95
    jp   Code064CBF                 ; 06:4C98
Code064C9B:
    ld   a,[$DA74]                  ; 06:4C9B
    ld   b,a                        ; 06:4C9E
    ld   hl,$D9D9                   ; 06:4C9F
    ld   a,[hl]                     ; 06:4CA2
    ld   [$DA74],a                  ; 06:4CA3
    ld   c,a                        ; 06:4CA6
    ld   a,b                        ; 06:4CA7
    xor  c                          ; 06:4CA8
    and  c                          ; 06:4CA9
    ld   [$DA76],a                  ; 06:4CAA
    ld   a,[$DA75]                  ; 06:4CAD
    ld   b,a                        ; 06:4CB0
    ld   hl,$DA39                   ; 06:4CB1
    ld   a,[hl]                     ; 06:4CB4
    ld   [$DA75],a                  ; 06:4CB5
    ld   c,a                        ; 06:4CB8
    ld   a,b                        ; 06:4CB9
    xor  c                          ; 06:4CBA
    and  c                          ; 06:4CBB
    ld   [$DA77],a                  ; 06:4CBC
Code064CBF:
    ld   hl,$DA3A                   ; 06:4CBF
    ldi  a,[hl]                     ; 06:4CC2
    ld   c,a                        ; 06:4CC3
    ldi  a,[hl]                     ; 06:4CC4
    ld   b,a                        ; 06:4CC5
    ld   hl,$C535                   ; 06:4CC6
    ld   de,$0080                   ; 06:4CC9
    add  hl,de                      ; 06:4CCC
    ld   [hl],c                     ; 06:4CCD
    inc  hl                         ; 06:4CCE
    ld   [hl],b                     ; 06:4CCF
    ld   a,$00                      ; 06:4CD0
    ret                             ; 06:4CD2

SubL_064CD3:
    ld   a,$FE                      ; 06:4CD3
    ldh  [<SB],a                    ; 06:4CD5
    ld   a,$03                      ; 06:4CD7
    ldh  [<SC],a                    ; 06:4CD9
    ld   a,$83                      ; 06:4CDB
    ldh  [<SC],a                    ; 06:4CDD
    ld   bc,$00FF                   ; 06:4CDF
    call Sub06503D                  ; 06:4CE2
    ld   a,$01                      ; 06:4CE5
    ld   [$DA73],a                  ; 06:4CE7
    rst  $18                        ; 06:4CEA  Return from 24-bit call

SubL_064CEB:
    ld   a,$00                      ; 06:4CEB
    ld   [$DA6B],a                  ; 06:4CED
    ld   [$DA69],a                  ; 06:4CF0
    ld   a,$01                      ; 06:4CF3
    ldh  [<IE],a                    ; 06:4CF5
    rst  $18                        ; 06:4CF7  Return from 24-bit call

Sub064CF8:
    ldh  a,[<IE]                    ; 06:4CF8
    and  $F3                        ; 06:4CFA
    ldh  [<IE],a                    ; 06:4CFC
    ld   a,$01                      ; 06:4CFE
    ldh  [<SB],a                    ; 06:4D00
    ld   a,$00                      ; 06:4D02
    ldh  [<SC],a                    ; 06:4D04
    ld   a,$00                      ; 06:4D06
    ld   [$DA6E],a                  ; 06:4D08
    ret                             ; 06:4D0B

Sub064D0C:
; shared by game states 00-03,18-19 (init/main for: pre-title, title, main menu)
    ld   a,[$DA6E]                  ; 06:4D0C
    and  a                          ; 06:4D0F
    jp   z,Code064D49               ; 06:4D10
    ld   a,[$D9A7]                  ; 06:4D13
    cp   $FE                        ; 06:4D16
    jr   z,Code064D4F               ; 06:4D18
    cp   $DD                        ; 06:4D1A
    jr   z,Code064D5D               ; 06:4D1C
    ld   a,$DD                      ; 06:4D1E
    ldh  [<SB],a                    ; 06:4D20
    ld   a,$82                      ; 06:4D22
    ldh  [<SC],a                    ; 06:4D24
    ld   a,$00                      ; 06:4D26
    ld   [$D9A7],a                  ; 06:4D28
    ld   a,[$DA73]                  ; 06:4D2B
    cp   $01                        ; 06:4D2E
    jp   z,Code064D39               ; 06:4D30
    cp   $02                        ; 06:4D33
    jp   z,Code064D3F               ; 06:4D35
    ret                             ; 06:4D38
Code064D39:
    ld   a,$02                      ; 06:4D39
    ld   [$DA73],a                  ; 06:4D3B
    ret                             ; 06:4D3E
Code064D3F:
    ld   a,$00                      ; 06:4D3F
    ld   [$DA73],a                  ; 06:4D41
    ld   a,$30                      ; 06:4D44
    ldh  [<$FFF3],a                 ; 06:4D46
    ret                             ; 06:4D48
Code064D49:
    ld   a,$01                      ; 06:4D49
    ld   [$DA6E],a                  ; 06:4D4B
    ret                             ; 06:4D4E
Code064D4F:
    ld   a,$00                      ; 06:4D4F
    ldh  [<$FF91],a                 ; 06:4D51
    ld   a,$30                      ; 06:4D53
    ld   [$DA6C],a                  ; 06:4D55
    ld   a,$00                      ; 06:4D58
    jp   Code064D64                 ; 06:4D5A
Code064D5D:
    ld   a,$30                      ; 06:4D5D
    ld   [$DA6C],a                  ; 06:4D5F
    ld   a,$01                      ; 06:4D62
Code064D64:
    ld   [$DA6A],a                  ; 06:4D64
    ld   a,$01                      ; 06:4D67
    ld   [$DA6B],a                  ; 06:4D69
    ld   a,$01                      ; 06:4D6C
    ld   [$DA69],a                  ; 06:4D6E
    ld   a,$02                      ; 06:4D71
    ld   [W_GameMode],a             ; 06:4D73
    call Sub0010A9                  ; 06:4D76
    ldh  a,[<H_GameState]           ; 06:4D79
    cp   $18                        ; 06:4D7B
    jr   z,Code064D8B               ; 06:4D7D
    cp   $19                        ; 06:4D7F
    jr   z,Code064D8B               ; 06:4D81
    cp   $02                        ; 06:4D83
    jr   z,Code064D8B               ; 06:4D85
    cp   $03                        ; 06:4D87
    jr   nz,Code064D9D              ; 06:4D89
Code064D8B:
    ld   b,$20                      ; 06:4D8B
    ld   hl,W_PaletteBuffer         ; 06:4D8D
Code064D90:
    ld   a,$FF                      ; 06:4D90
    ldi  [hl],a                     ; 06:4D92
    ld   a,$7F                      ; 06:4D93
    ldi  [hl],a                     ; 06:4D95
    dec  b                          ; 06:4D96
    jr   nz,Code064D90              ; 06:4D97
    ld   a,$01                      ; 06:4D99
    ldh  [<$FFC0],a                 ; 06:4D9B
Code064D9D:
    ld   a,$27                      ; 06:4D9D
    ldh  [<H_GameState],a           ; 06:4D9F
    ld   a,$00                      ; 06:4DA1
    ld   [$C168],a                  ; 06:4DA3
    xor  a                          ; 06:4DA6
    ld   b,$E0                      ; 06:4DA7
    ld   hl,$D977                   ; 06:4DA9
Code064DAC:
    ldi  [hl],a                     ; 06:4DAC
    dec  b                          ; 06:4DAD
    jp   nz,Code064DAC              ; 06:4DAE
    xor  a                          ; 06:4DB1
    ld   [$D9A7],a                  ; 06:4DB2
    ld   a,$00                      ; 06:4DB5
    ldh  [<SB],a                    ; 06:4DB7
    ld   a,$82                      ; 06:4DB9
    ldh  [<SC],a                    ; 06:4DBB
    ret                             ; 06:4DBD

Sub064DBE:
    ld   a,[$DA6A]                  ; 06:4DBE
    cp   $01                        ; 06:4DC1
    jp   z,Code064E23               ; 06:4DC3
    ld   a,[$D9A7]                  ; 06:4DC6
    cp   $DA                        ; 06:4DC9
    jp   z,Code064E04               ; 06:4DCB
    and  a                          ; 06:4DCE
    jp   z,Code064DD5               ; 06:4DCF
    jp   Code064E78                 ; 06:4DD2
Code064DD5:
    ld   a,[$DA6C]                  ; 06:4DD5
    cp   $FF                        ; 06:4DD8
    jp   z,Code064E78               ; 06:4DDA
    cp   $03                        ; 06:4DDD
    jp   nc,Code064DF5              ; 06:4DDF
    dec  a                          ; 06:4DE2
    ld   [$DA6C],a                  ; 06:4DE3
    ld   a,$FA                      ; 06:4DE6
    ldh  [<SB],a                    ; 06:4DE8
    ld   a,$03                      ; 06:4DEA
    ldh  [<SC],a                    ; 06:4DEC
    ld   a,$83                      ; 06:4DEE
    ldh  [<SC],a                    ; 06:4DF0
    ld   a,$01                      ; 06:4DF2
    ret                             ; 06:4DF4

Code064DF5:
    dec  a                          ; 06:4DF5
    ld   [$DA6C],a                  ; 06:4DF6
    ld   a,$FA                      ; 06:4DF9
    ldh  [<SB],a                    ; 06:4DFB
    ld   a,$82                      ; 06:4DFD
    ldh  [<SC],a                    ; 06:4DFF
    ld   a,$01                      ; 06:4E01
    ret                             ; 06:4E03

Code064E04:
    ld   hl,$D977                   ; 06:4E04
    ld   b,$F0                      ; 06:4E07
    xor  a                          ; 06:4E09
Code064E0A:
    ldi  [hl],a                     ; 06:4E0A
    dec  b                          ; 06:4E0B
    jp   nz,Code064E0A              ; 06:4E0C
    xor  a                          ; 06:4E0F
    ldh  [<SB],a                    ; 06:4E10
    ld   a,$82                      ; 06:4E12
    ldh  [<SC],a                    ; 06:4E14
    ld   a,$01                      ; 06:4E16
    ld   [$DA6D],a                  ; 06:4E18
    ld   a,$01                      ; 06:4E1B
    ld   [$DA6B],a                  ; 06:4E1D
    ld   a,$00                      ; 06:4E20
    ret                             ; 06:4E22

Code064E23:
    ld   a,[$D9A7]                  ; 06:4E23
    cp   $FA                        ; 06:4E26
    jp   z,Code064E4E               ; 06:4E28
    and  a                          ; 06:4E2B
    jp   z,Code064E32               ; 06:4E2C
    jp   Code064E78                 ; 06:4E2F
Code064E32:
    ld   a,[$DA6C]                  ; 06:4E32
    cp   $FF                        ; 06:4E35
    jp   z,Code064E78               ; 06:4E37
    dec  a                          ; 06:4E3A
    ld   [$DA6C],a                  ; 06:4E3B
    ld   a,$00                      ; 06:4E3E
    ld   [$D9A7],a                  ; 06:4E40
    ld   a,$DA                      ; 06:4E43
    ldh  [<SB],a                    ; 06:4E45
    ld   a,$82                      ; 06:4E47
    ldh  [<SC],a                    ; 06:4E49
    ld   a,$01                      ; 06:4E4B
    ret                             ; 06:4E4D

Code064E4E:
    ld   hl,$D977                   ; 06:4E4E
    ld   b,$F0                      ; 06:4E51
    xor  a                          ; 06:4E53
Code064E54:
    ldi  [hl],a                     ; 06:4E54
    dec  b                          ; 06:4E55
    jp   nz,Code064E54              ; 06:4E56
    ld   a,$82                      ; 06:4E59
    ldh  [<SC],a                    ; 06:4E5B
    ldh  a,[<IE]                    ; 06:4E5D
    or   $04                        ; 06:4E5F
    ldh  [<IE],a                    ; 06:4E61
    ld   a,$60                      ; 06:4E63
    ldh  [<TIMA],a                  ; 06:4E65
    ld   a,$02                      ; 06:4E67
    ldh  [<TAC],a                   ; 06:4E69
    ld   a,$01                      ; 06:4E6B
    ld   [$DA6D],a                  ; 06:4E6D
    ld   a,$01                      ; 06:4E70
    ld   [$DA6B],a                  ; 06:4E72
    ld   a,$00                      ; 06:4E75
    ret                             ; 06:4E77

Code064E78:
    ld   a,$30                      ; 06:4E78
    ldh  [<$FFF3],a                 ; 06:4E7A
    ld   a,$00                      ; 06:4E7C
    ld   [$C168],a                  ; 06:4E7E
    ld   a,$18                      ; 06:4E81
    ldh  [<H_GameState],a           ; 06:4E83
    ld   a,$02                      ; 06:4E85
    ret                             ; 06:4E87

Sub064E88:
    ld   a,$00                      ; 06:4E88
    ld   [$DA6D],a                  ; 06:4E8A
    ld   [$DA69],a                  ; 06:4E8D
    ld   [$DA68],a                  ; 06:4E90
    ld   bc,$0FFF                   ; 06:4E93
    call Sub06503D                  ; 06:4E96
    ld   hl,$0020                   ; 06:4E99
    ld   a,[$DA6A]                  ; 06:4E9C
    cp   $01                        ; 06:4E9F
    jp   z,Code064ED9               ; 06:4EA1
    ld   a,$DC                      ; 06:4EA4
    ldh  [<SB],a                    ; 06:4EA6
    ld   a,$82                      ; 06:4EA8
    ldh  [<SC],a                    ; 06:4EAA
    ld   hl,$D977                   ; 06:4EAC
    ld   b,$F0                      ; 06:4EAF
    xor  a                          ; 06:4EB1
Code064EB2:
    ldi  [hl],a                     ; 06:4EB2
    dec  b                          ; 06:4EB3
    jp   nz,Code064EB2              ; 06:4EB4
    ld   [$DA74],a                  ; 06:4EB7
    ld   [$DA76],a                  ; 06:4EBA
    ld   [$DA75],a                  ; 06:4EBD
    ld   [$DA77],a                  ; 06:4EC0
    ld   a,$E0                      ; 06:4EC3
    ld   [$DA6C],a                  ; 06:4EC5
    ld   a,[$C168]                  ; 06:4EC8
    inc  a                          ; 06:4ECB
    ld   [$C168],a                  ; 06:4ECC
    xor  a                          ; 06:4ECF
    ldh  [<SB],a                    ; 06:4ED0
    ld   a,$82                      ; 06:4ED2
    ldh  [<SC],a                    ; 06:4ED4
    jp   Code064F23                 ; 06:4ED6
Code064ED9:
    ld   a,$FC                      ; 06:4ED9
    ldh  [<SB],a                    ; 06:4EDB
    ld   a,$03                      ; 06:4EDD
    ldh  [<SC],a                    ; 06:4EDF
    ld   a,$83                      ; 06:4EE1
    ldh  [<SC],a                    ; 06:4EE3
    ld   bc,$00FF                   ; 06:4EE5
    call Sub06503D                  ; 06:4EE8
    ld   a,h                        ; 06:4EEB
    or   l                          ; 06:4EEC
    jp   z,Code064EF9               ; 06:4EED
    dec  hl                         ; 06:4EF0
    ld   a,[$D9A7]                  ; 06:4EF1
    cp   $DC                        ; 06:4EF4
    jp   nz,Code064ED9              ; 06:4EF6
Code064EF9:
    ld   hl,$D977                   ; 06:4EF9
    ld   b,$F0                      ; 06:4EFC
    xor  a                          ; 06:4EFE
Code064EFF:
    ldi  [hl],a                     ; 06:4EFF
    dec  b                          ; 06:4F00
    jp   nz,Code064EFF              ; 06:4F01
    ld   [$DA74],a                  ; 06:4F04
    ld   [$DA76],a                  ; 06:4F07
    ld   [$DA75],a                  ; 06:4F0A
    ld   [$DA77],a                  ; 06:4F0D
    ld   a,$E0                      ; 06:4F10
    ld   [$DA6C],a                  ; 06:4F12
    ld   a,[$C168]                  ; 06:4F15
    inc  a                          ; 06:4F18
    ld   [$C168],a                  ; 06:4F19
    xor  a                          ; 06:4F1C
    ldh  [<SB],a                    ; 06:4F1D
    ld   a,$82                      ; 06:4F1F
    ldh  [<SC],a                    ; 06:4F21
Code064F23:
    ld   a,$01                      ; 06:4F23
    ld   [$DA6B],a                  ; 06:4F25
    ret                             ; 06:4F28

Sub064F29:
    ld   a,$01                      ; 06:4F29
    ld   [$DA69],a                  ; 06:4F2B
    ld   a,[$DA70]                  ; 06:4F2E
    and  a                          ; 06:4F31
    jp   nz,Code064F6D              ; 06:4F32
    ld   a,[$DA6C]                  ; 06:4F35
    cp   $FF                        ; 06:4F38
    jp   z,Code064F74               ; 06:4F3A
    dec  a                          ; 06:4F3D
    ld   [$DA6C],a                  ; 06:4F3E
    ld   a,[$DA6A]                  ; 06:4F41
    cp   $01                        ; 06:4F44
    jp   z,Code064F56               ; 06:4F46
    ld   a,[$D9A7]                  ; 06:4F49
    cp   $FB                        ; 06:4F4C
    jr   z,Code064F9E               ; 06:4F4E
    ld   a,$82                      ; 06:4F50
    ldh  [<SC],a                    ; 06:4F52
    jr   Return064F79               ; 06:4F54
Code064F56:
    ld   a,$FB                      ; 06:4F56
    ld   [$D977],a                  ; 06:4F58
    ld   a,$03                      ; 06:4F5B
    ldh  [<SC],a                    ; 06:4F5D
    ld   a,$83                      ; 06:4F5F
    ldh  [<SC],a                    ; 06:4F61
    ld   a,[$D9A7]                  ; 06:4F63
    cp   $DB                        ; 06:4F66
    jr   z,Code064F7A               ; 06:4F68
    jp   Return064F79               ; 06:4F6A
Code064F6D:
    ld   hl,$C168                   ; 06:4F6D
    inc  [hl]                       ; 06:4F70
    jp   Return064F79               ; 06:4F71
Code064F74:
    ld   b,$04                      ; 06:4F74
    call Sub065156                  ; 06:4F76
Return064F79:
    ret                             ; 06:4F79

Code064F7A:
    ld   a,$06                      ; 06:4F7A
    ld   [$DA6C],a                  ; 06:4F7C
    ld   a,$01                      ; 06:4F7F
    ld   [$DA6B],a                  ; 06:4F81
    ld   a,$00                      ; 06:4F84
    ld   hl,$D9A7                   ; 06:4F86
    ldi  [hl],a                     ; 06:4F89
    ld   [hl],a                     ; 06:4F8A
    ld   hl,$D977                   ; 06:4F8B
    ldi  [hl],a                     ; 06:4F8E
    ld   [hl],a                     ; 06:4F8F
    ldh  [<SB],a                    ; 06:4F90
    ld   a,$82                      ; 06:4F92
    ldh  [<SC],a                    ; 06:4F94
    ld   a,[$C168]                  ; 06:4F96
    inc  a                          ; 06:4F99
    ld   [$C168],a                  ; 06:4F9A
    ret                             ; 06:4F9D

Code064F9E:
    ld   a,$03                      ; 06:4F9E
    ld   [$DA6C],a                  ; 06:4FA0
    ld   a,$00                      ; 06:4FA3
    ld   hl,$D9A7                   ; 06:4FA5
    ldi  [hl],a                     ; 06:4FA8
    ld   [hl],a                     ; 06:4FA9
    ld   hl,$D977                   ; 06:4FAA
    ldi  [hl],a                     ; 06:4FAD
    ld   [hl],a                     ; 06:4FAE
    ld   a,$DB                      ; 06:4FAF
    ldh  [<SB],a                    ; 06:4FB1
    ld   a,$82                      ; 06:4FB3
    ldh  [<SC],a                    ; 06:4FB5
    ld   a,[$C168]                  ; 06:4FB7
    inc  a                          ; 06:4FBA
    ld   [$C168],a                  ; 06:4FBB
    ret                             ; 06:4FBE

Sub064FBF:
    ld   a,[$DA70]                  ; 06:4FBF
    and  a                          ; 06:4FC2
    jp   nz,Code065032              ; 06:4FC3
    ldh  a,[<IE]                    ; 06:4FC6
    and  $13                        ; 06:4FC8
    ldh  [<IE],a                    ; 06:4FCA
    ldh  a,[<IF]                    ; 06:4FCC
    and  $13                        ; 06:4FCE
    ldh  [<IF],a                    ; 06:4FD0
    xor  a                          ; 06:4FD2
    ld   [$DA79],a                  ; 06:4FD3
    ld   a,[$DA6C]                  ; 06:4FD6
    and  a                          ; 06:4FD9
    jp   z,Code064FEA               ; 06:4FDA
    dec  a                          ; 06:4FDD
    ld   [$DA6C],a                  ; 06:4FDE
    ld   a,$DB                      ; 06:4FE1
    ldh  [<SB],a                    ; 06:4FE3
    ld   a,$82                      ; 06:4FE5
    ldh  [<SC],a                    ; 06:4FE7
    ret                             ; 06:4FE9

Code064FEA:
    ld   b,$F0                      ; 06:4FEA
    xor  a                          ; 06:4FEC
    ld   hl,$D977                   ; 06:4FED
Code064FF0:
    ldi  [hl],a                     ; 06:4FF0
    dec  b                          ; 06:4FF1
    jp   nz,Code064FF0              ; 06:4FF2
    ld   a,$00                      ; 06:4FF5
    ld   [$DA74],a                  ; 06:4FF7
    ld   [$DA75],a                  ; 06:4FFA
    ld   [$DA76],a                  ; 06:4FFD
    ld   [$DA77],a                  ; 06:5000
    ld   a,$00                      ; 06:5003
    ldh  [<SB],a                    ; 06:5005
    ld   a,$82                      ; 06:5007
    ldh  [<SC],a                    ; 06:5009
    ld   a,$01                      ; 06:500B
    ld   [$DA6B],a                  ; 06:500D
    xor  a                          ; 06:5010
    ld   [$DA68],a                  ; 06:5011
    ld   a,$01                      ; 06:5014
    ld   [$DA6D],a                  ; 06:5016
    ld   a,$00                      ; 06:5019
    ld   [$C168],a                  ; 06:501B
    ldh  a,[<H_GameState]           ; 06:501E
    inc  a                          ; 06:5020
    ldh  [<H_GameState],a           ; 06:5021
    ldh  a,[<IF]                    ; 06:5023
    and  $13                        ; 06:5025
    ldh  [<IF],a                    ; 06:5027
    ldh  a,[<IE]                    ; 06:5029
    or   $0C                        ; 06:502B
    ldh  [<IE],a                    ; 06:502D
    jp   Return06503C               ; 06:502F
Code065032:
    ld   a,$00                      ; 06:5032
    ld   [$C168],a                  ; 06:5034
    ldh  a,[<H_GameState]           ; 06:5037
    inc  a                          ; 06:5039
    ldh  [<H_GameState],a           ; 06:503A
Return06503C:
    ret                             ; 06:503C

Sub06503D:
    dec  bc                         ; 06:503D
    ld   a,b                        ; 06:503E
    or   c                          ; 06:503F
    jr   nz,Sub06503D               ; 06:5040
    ret                             ; 06:5042

Unused065043:
    xor  a                          ; 06:5043
    ld   [$DA69],a                  ; 06:5044
    ld   [$DA6A],a                  ; 06:5047
    ld   [$DA6B],a                  ; 06:504A
    ld   [$DA6C],a                  ; 06:504D
    ld   [$DA6D],a                  ; 06:5050
    ld   [$DA68],a                  ; 06:5053
    ld   hl,$D977                   ; 06:5056
    ld   b,$F0                      ; 06:5059
    xor  a                          ; 06:505B
Code06505C:
    ldi  [hl],a                     ; 06:505C
    dec  b                          ; 06:505D
    jp   nz,Code06505C              ; 06:505E
    ldh  a,[<IE]                    ; 06:5061
    and  $13                        ; 06:5063
    ldh  [<IE],a                    ; 06:5065
    ldh  a,[<IF]                    ; 06:5067
    and  $13                        ; 06:5069
    ldh  [<IF],a                    ; 06:506B
    ld   a,$DD                      ; 06:506D
    ldh  [<SB],a                    ; 06:506F
    ld   a,$82                      ; 06:5071
    ldh  [<SC],a                    ; 06:5073
    ldh  a,[<IF]                    ; 06:5075
    and  $13                        ; 06:5077
    ldh  [<IF],a                    ; 06:5079
    ret                             ; 06:507B

Unused06507C:
    ld   a,$06                      ; 06:507C
    rst  $10                        ; 06:507E  24-bit call
.dl SubL_064CD3                     ; 06:507F
    ret                             ; 06:5082

Unused065083:
    ld   a,[$C502]                  ; 06:5083
    ld   b,a                        ; 06:5086
    and  $F0                        ; 06:5087
    swap a                          ; 06:5089
    add  $D0                        ; 06:508B
    ld   [$C100],a                  ; 06:508D
    ld   a,b                        ; 06:5090
    and  $0F                        ; 06:5091
    add  $D0                        ; 06:5093
    ld   [$C101],a                  ; 06:5095
    ld   a,[$C501]                  ; 06:5098
    ld   b,a                        ; 06:509B
    and  $F0                        ; 06:509C
    swap a                          ; 06:509E
    add  $D0                        ; 06:50A0
    ld   [$C102],a                  ; 06:50A2
    ld   a,b                        ; 06:50A5
    and  $0F                        ; 06:50A6
    add  $D0                        ; 06:50A8
    ld   [$C103],a                  ; 06:50AA
    ld   a,[$C582]                  ; 06:50AD
    ld   b,a                        ; 06:50B0
    and  $F0                        ; 06:50B1
    swap a                          ; 06:50B3
    add  $D0                        ; 06:50B5
    ld   [$C104],a                  ; 06:50B7
    ld   a,b                        ; 06:50BA
    and  $0F                        ; 06:50BB
    add  $D0                        ; 06:50BD
    ld   [$C105],a                  ; 06:50BF
    ld   a,[$C581]                  ; 06:50C2
    ld   b,a                        ; 06:50C5
    and  $F0                        ; 06:50C6
    swap a                          ; 06:50C8
    add  $D0                        ; 06:50CA
    ld   [$C106],a                  ; 06:50CC
    ld   a,b                        ; 06:50CF
    and  $0F                        ; 06:50D0
    add  $D0                        ; 06:50D2
    ld   [$C107],a                  ; 06:50D4
    ld   a,[$DA70]                  ; 06:50D7
    ld   b,a                        ; 06:50DA
    and  $F0                        ; 06:50DB
    swap a                          ; 06:50DD
    add  $D0                        ; 06:50DF
    ld   [$C108],a                  ; 06:50E1
    ld   a,b                        ; 06:50E4
    and  $0F                        ; 06:50E5
    add  $D0                        ; 06:50E7
    ld   [$C109],a                  ; 06:50E9
    ld   a,[$DA72]                  ; 06:50EC
    ld   b,a                        ; 06:50EF
    and  $F0                        ; 06:50F0
    swap a                          ; 06:50F2
    add  $D0                        ; 06:50F4
    ld   [$C10A],a                  ; 06:50F6
    ld   a,b                        ; 06:50F9
    and  $0F                        ; 06:50FA
    add  $D0                        ; 06:50FC
    ld   [$C10B],a                  ; 06:50FE
    ld   a,[$DA7D]                  ; 06:5101
    ld   b,a                        ; 06:5104
    and  $F0                        ; 06:5105
    swap a                          ; 06:5107
    add  $D0                        ; 06:5109
    ld   [$C10C],a                  ; 06:510B
    ld   a,b                        ; 06:510E
    and  $0F                        ; 06:510F
    add  $D0                        ; 06:5111
    ld   [$C10D],a                  ; 06:5113
    ld   a,[$DA7C]                  ; 06:5116
    ld   b,a                        ; 06:5119
    and  $F0                        ; 06:511A
    swap a                          ; 06:511C
    add  $D0                        ; 06:511E
    ld   [$C10E],a                  ; 06:5120
    ld   a,b                        ; 06:5123
    and  $0F                        ; 06:5124
    add  $D0                        ; 06:5126
    ld   [$C10F],a                  ; 06:5128
    ld   a,[$DA7B]                  ; 06:512B
    ld   b,a                        ; 06:512E
    and  $F0                        ; 06:512F
    swap a                          ; 06:5131
    add  $D0                        ; 06:5133
    ld   [$C110],a                  ; 06:5135
    ld   a,b                        ; 06:5138
    and  $0F                        ; 06:5139
    add  $D0                        ; 06:513B
    ld   [$C111],a                  ; 06:513D
    ld   a,[$DA7A]                  ; 06:5140
    ld   b,a                        ; 06:5143
    and  $F0                        ; 06:5144
    swap a                          ; 06:5146
    add  $D0                        ; 06:5148
    ld   [$C112],a                  ; 06:514A
    ld   a,b                        ; 06:514D
    and  $0F                        ; 06:514E
    add  $D0                        ; 06:5150
    ld   [$C113],a                  ; 06:5152
    ret                             ; 06:5155

Sub065156:
    ld   a,[$DA70]                  ; 06:5156
    push af                         ; 06:5159
    ld   a,b                        ; 06:515A
    ld   [$DA70],a                  ; 06:515B
    ldh  a,[<H_GameState]           ; 06:515E
    ld   [$DA71],a                  ; 06:5160
    ld   a,[$DA39]                  ; 06:5163
    ld   [$DA72],a                  ; 06:5166
    ldh  a,[<IE]                    ; 06:5169
    and  $1B                        ; 06:516B
    ldh  [<IE],a                    ; 06:516D
    ld   a,$01                      ; 06:516F
    ld   [$DA6B],a                  ; 06:5171
    ld   hl,$1000                   ; 06:5174
    ld   a,$0A                      ; 06:5177
    ld   [hl],a                     ; 06:5179
    pop  af                         ; 06:517A
    and  a                          ; 06:517B
    jp   nz,Code065227              ; 06:517C
    ld   hl,$A3C2                   ; 06:517F
    ld   a,$45                      ; 06:5182
    ldi  [hl],a                     ; 06:5184
    ld   a,$52                      ; 06:5185
    ldi  [hl],a                     ; 06:5187
    ld   a,$52                      ; 06:5188
    ldi  [hl],a                     ; 06:518A
    ld   a,[$DA6A]                  ; 06:518B
    ldi  [hl],a                     ; 06:518E
    ld   a,[$DA70]                  ; 06:518F
    ldi  [hl],a                     ; 06:5192
    ld   a,[$DA71]                  ; 06:5193
    ldi  [hl],a                     ; 06:5196
    ld   a,[$DA72]                  ; 06:5197
    ldi  [hl],a                     ; 06:519A
    ld   a,[$DA79]                  ; 06:519B
    ldi  [hl],a                     ; 06:519E
    ldh  a,[<H_ButtonsHeld]         ; 06:519F
    ldi  [hl],a                     ; 06:51A1
    ld   de,$D976                   ; 06:51A2
    ld   a,[de]                     ; 06:51A5
    ldi  [hl],a                     ; 06:51A6
    inc  de                         ; 06:51A7
    ld   a,[de]                     ; 06:51A8
    ldi  [hl],a                     ; 06:51A9
    inc  de                         ; 06:51AA
    ld   a,[de]                     ; 06:51AB
    ldi  [hl],a                     ; 06:51AC
    inc  de                         ; 06:51AD
    ld   a,[de]                     ; 06:51AE
    ldi  [hl],a                     ; 06:51AF
    inc  de                         ; 06:51B0
    ld   a,[de]                     ; 06:51B1
    ldi  [hl],a                     ; 06:51B2
    inc  de                         ; 06:51B3
    ld   a,[de]                     ; 06:51B4
    ldi  [hl],a                     ; 06:51B5
    inc  de                         ; 06:51B6
    ld   a,[de]                     ; 06:51B7
    ldi  [hl],a                     ; 06:51B8
    ld   de,$D9A6                   ; 06:51B9
    ld   a,[de]                     ; 06:51BC
    ldi  [hl],a                     ; 06:51BD
    inc  de                         ; 06:51BE
    ld   a,[de]                     ; 06:51BF
    ldi  [hl],a                     ; 06:51C0
    inc  de                         ; 06:51C1
    ld   a,[de]                     ; 06:51C2
    ldi  [hl],a                     ; 06:51C3
    inc  de                         ; 06:51C4
    ld   a,[de]                     ; 06:51C5
    ldi  [hl],a                     ; 06:51C6
    inc  de                         ; 06:51C7
    ld   a,[de]                     ; 06:51C8
    ldi  [hl],a                     ; 06:51C9
    inc  de                         ; 06:51CA
    ld   a,[de]                     ; 06:51CB
    ldi  [hl],a                     ; 06:51CC
    inc  de                         ; 06:51CD
    ld   a,[de]                     ; 06:51CE
    ldi  [hl],a                     ; 06:51CF
    ld   de,$DA36                   ; 06:51D0
    ld   a,[de]                     ; 06:51D3
    ldi  [hl],a                     ; 06:51D4
    inc  de                         ; 06:51D5
    ld   a,[de]                     ; 06:51D6
    ldi  [hl],a                     ; 06:51D7
    inc  de                         ; 06:51D8
    ld   a,[de]                     ; 06:51D9
    ldi  [hl],a                     ; 06:51DA
    inc  de                         ; 06:51DB
    ld   a,[de]                     ; 06:51DC
    ldi  [hl],a                     ; 06:51DD
    inc  de                         ; 06:51DE
    ld   a,[de]                     ; 06:51DF
    ldi  [hl],a                     ; 06:51E0
    inc  de                         ; 06:51E1
    ld   a,[de]                     ; 06:51E2
    ldi  [hl],a                     ; 06:51E3
    inc  de                         ; 06:51E4
    ld   a,[de]                     ; 06:51E5
    ldi  [hl],a                     ; 06:51E6
    ld   de,$D9D6                   ; 06:51E7
    ld   a,[de]                     ; 06:51EA
    ldi  [hl],a                     ; 06:51EB
    inc  de                         ; 06:51EC
    ld   a,[de]                     ; 06:51ED
    ldi  [hl],a                     ; 06:51EE
    inc  de                         ; 06:51EF
    ld   a,[de]                     ; 06:51F0
    ldi  [hl],a                     ; 06:51F1
    inc  de                         ; 06:51F2
    ld   a,[de]                     ; 06:51F3
    ldi  [hl],a                     ; 06:51F4
    inc  de                         ; 06:51F5
    ld   a,[de]                     ; 06:51F6
    ldi  [hl],a                     ; 06:51F7
    inc  de                         ; 06:51F8
    ld   a,[de]                     ; 06:51F9
    ldi  [hl],a                     ; 06:51FA
    inc  de                         ; 06:51FB
    ld   a,[de]                     ; 06:51FC
    ldi  [hl],a                     ; 06:51FD
    ld   a,[$C502]                  ; 06:51FE
    ldi  [hl],a                     ; 06:5201
    ld   a,[$C501]                  ; 06:5202
    ldi  [hl],a                     ; 06:5205
    ld   a,[$C504]                  ; 06:5206
    ldi  [hl],a                     ; 06:5209
    ld   a,[$C503]                  ; 06:520A
    ldi  [hl],a                     ; 06:520D
    ld   a,[$C582]                  ; 06:520E
    ldi  [hl],a                     ; 06:5211
    ld   a,[$C581]                  ; 06:5212
    ldi  [hl],a                     ; 06:5215
    ld   a,[$C584]                  ; 06:5216
    ldi  [hl],a                     ; 06:5219
    ld   a,[$C583]                  ; 06:521A
    ldi  [hl],a                     ; 06:521D
    ld   a,$45                      ; 06:521E
    ldi  [hl],a                     ; 06:5220
    ld   a,$4E                      ; 06:5221
    ldi  [hl],a                     ; 06:5223
    ld   a,$44                      ; 06:5224
    ldi  [hl],a                     ; 06:5226
Code065227:
    ld   hl,$1000                   ; 06:5227
    ld   a,$00                      ; 06:522A
    ld   [hl],a                     ; 06:522C
    ld   b,$F0                      ; 06:522D
    xor  a                          ; 06:522F
    ld   hl,$D977                   ; 06:5230
Code065233:
    ldi  [hl],a                     ; 06:5233
    dec  b                          ; 06:5234
    jp   nz,Code065233              ; 06:5235
    ret                             ; 06:5238

Sub065239:
    ld   a,$C0                      ; 06:5239
    ldh  [<RP],a                    ; 06:523B
    ld   a,$FF                      ; 06:523D
    ld   [$D8B0],a                  ; 06:523F
    xor  a                          ; 06:5242
    ld   b,a                        ; 06:5243
Code065244:
    inc  a                          ; 06:5244
    jr   nz,Code065244              ; 06:5245
    inc  b                          ; 06:5247
    jr   nz,Code065244              ; 06:5248
    ld   hl,$D8B1                   ; 06:524A
    ldh  a,[<KEY1]                  ; 06:524D
    bit  7,a                        ; 06:524F
    jr   z,Code065262               ; 06:5251
    ld   [hl],$0E                   ; 06:5253
    inc  hl                         ; 06:5255
    ld   [hl],$12                   ; 06:5256
    inc  hl                         ; 06:5258
    ld   [hl],$08                   ; 06:5259
    inc  hl                         ; 06:525B
    ld   [hl],$0C                   ; 06:525C
    inc  hl                         ; 06:525E
    ld   [hl],$0C                   ; 06:525F
    ret                             ; 06:5261

Code065262:
    ld   [hl],$06                   ; 06:5262
    inc  hl                         ; 06:5264
    ld   [hl],$08                   ; 06:5265
    inc  hl                         ; 06:5267
    ld   [hl],$02                   ; 06:5268
    inc  hl                         ; 06:526A
    ld   [hl],$04                   ; 06:526B
    inc  hl                         ; 06:526D
    ld   [hl],$05                   ; 06:526E
    ret                             ; 06:5270

Sub065271:
    inc  d                          ; 06:5271
    ret  z                          ; 06:5272
    ldh  a,[c]                      ; 06:5273
    bit  1,a                        ; 06:5274
    jr   z,Sub065271                ; 06:5276
    ret                             ; 06:5278

Sub065279:
    inc  d                          ; 06:5279
    ret  z                          ; 06:527A
    ldh  a,[c]                      ; 06:527B
    bit  1,a                        ; 06:527C
    jr   nz,Sub065279               ; 06:527E
    ret                             ; 06:5280

Sub065281:
    ld   a,$C1                      ; 06:5281
    ldh  [c],a                      ; 06:5283
Code065284:
    dec  d                          ; 06:5284
    jr   nz,Code065284              ; 06:5285
    ret                             ; 06:5287

Sub065288:
    ld   a,$C0                      ; 06:5288
    ldh  [c],a                      ; 06:528A
Code06528B:
    dec  d                          ; 06:528B
    jr   nz,Code06528B              ; 06:528C
    ret                             ; 06:528E

Sub06528F:
    ld   hl,IE                      ; 06:528F
    ld   d,$00                      ; 06:5292
    ld   e,d                        ; 06:5294
    ld   a,$01                      ; 06:5295
    ld   [$D8AF],a                  ; 06:5297
Code06529A:
    push hl                         ; 06:529A
    call Sub0011C8                  ; 06:529B
    pop  hl                         ; 06:529E
    ldh  a,[<H_ButtonsPressed]      ; 06:529F
    bit  1,a                        ; 06:52A1
    jr   z,Code0652AB               ; 06:52A3
    ld   a,$FF                      ; 06:52A5
    ld   [$D8B0],a                  ; 06:52A7
    ret                             ; 06:52AA

Code0652AB:
    ld   a,[$D8B7]                  ; 06:52AB
    cp   $01                        ; 06:52AE
    jp   z,Code06532F               ; 06:52B0
    cp   $02                        ; 06:52B3
    jp   z,Code0652C8               ; 06:52B5
    ldh  a,[<H_ButtonsPressed]      ; 06:52B8
    bit  0,a                        ; 06:52BA
    jr   nz,Code06532F              ; 06:52BC
    ld   b,$02                      ; 06:52BE
    ld   c,$56                      ; 06:52C0
    ldh  a,[c]                      ; 06:52C2
    and  b                          ; 06:52C3
    jr   nz,Code06529A              ; 06:52C4
    jr   Code0652DE                 ; 06:52C6
Code0652C8:
    dec  hl                         ; 06:52C8
    ld   a,h                        ; 06:52C9
    or   l                          ; 06:52CA
    jr   z,Code0652D8               ; 06:52CB
    ld   b,$02                      ; 06:52CD
    ld   c,$56                      ; 06:52CF
    ldh  a,[c]                      ; 06:52D1
    and  b                          ; 06:52D2
    jp   nz,Code06529A              ; 06:52D3
    jr   Code0652DE                 ; 06:52D6
Code0652D8:
    ld   a,$04                      ; 06:52D8
    ld   [$D8B0],a                  ; 06:52DA
    ret                             ; 06:52DD

Code0652DE:
    ld   a,$02                      ; 06:52DE
    ld   [$D8B7],a                  ; 06:52E0
    ld   b,$1A                      ; 06:52E3
    ld   c,$56                      ; 06:52E5
    ld   d,$00                      ; 06:52E7
    ld   e,d                        ; 06:52E9
    call Sub065279                  ; 06:52EA
    ld   a,d                        ; 06:52ED
    and  a                          ; 06:52EE
    jp   z,Code06544F               ; 06:52EF
    ld   d,e                        ; 06:52F2
    call Sub065271                  ; 06:52F3
    ld   a,d                        ; 06:52F6
    and  a                          ; 06:52F7
    jp   z,Code06544F               ; 06:52F8
    call Sub065279                  ; 06:52FB
    ld   a,d                        ; 06:52FE
    and  a                          ; 06:52FF
    jp   z,Code06544F               ; 06:5300
    call Sub065271                  ; 06:5303
    ld   a,d                        ; 06:5306
    and  a                          ; 06:5307
    jp   z,Code06544F               ; 06:5308
    cp   $08                        ; 06:530B
    jp   c,Code06544F               ; 06:530D
    cp   $2A                        ; 06:5310
    jp   nc,Code06544F              ; 06:5312
    ld   a,$00                      ; 06:5315
    ld   [$D8B0],a                  ; 06:5317
    ld   d,b                        ; 06:531A
    call Sub065288                  ; 06:531B
    ld   d,b                        ; 06:531E
    call Sub065281                  ; 06:531F
    ld   d,b                        ; 06:5322
    call Sub065288                  ; 06:5323
    ld   d,b                        ; 06:5326
    call Sub065281                  ; 06:5327
    ld   d,b                        ; 06:532A
    call Sub065288                  ; 06:532B
    ret                             ; 06:532E

Code06532F:
    ld   a,$01                      ; 06:532F
    ld   [$D8B7],a                  ; 06:5331
    ld   a,$02                      ; 06:5334
    ld   [$D8AF],a                  ; 06:5336
    ld   b,$1A                      ; 06:5339
    ld   c,$56                      ; 06:533B
    ld   d,b                        ; 06:533D
    ld   e,$00                      ; 06:533E
    call Sub065288                  ; 06:5340
    ld   d,b                        ; 06:5343
    call Sub065281                  ; 06:5344
    ld   d,b                        ; 06:5347
    call Sub065288                  ; 06:5348
    ld   d,b                        ; 06:534B
    call Sub065281                  ; 06:534C
    ld   d,b                        ; 06:534F
    call Sub065288                  ; 06:5350
    ld   d,e                        ; 06:5353
    call Sub065279                  ; 06:5354
    ld   a,d                        ; 06:5357
    and  a                          ; 06:5358
    jp   z,Code06544F               ; 06:5359
    ld   d,e                        ; 06:535C
    call Sub065271                  ; 06:535D
    ld   a,d                        ; 06:5360
    and  a                          ; 06:5361
    jp   z,Code06544F               ; 06:5362
    ld   d,e                        ; 06:5365
    call Sub065279                  ; 06:5366
    ld   a,d                        ; 06:5369
    and  a                          ; 06:536A
    jp   z,Code06544F               ; 06:536B
    ld   d,e                        ; 06:536E
    call Sub065271                  ; 06:536F
    ld   a,d                        ; 06:5372
    and  a                          ; 06:5373
    jp   z,Code06544F               ; 06:5374
    ld   d,$1A                      ; 06:5377
    call Sub065288                  ; 06:5379
    ld   a,$00                      ; 06:537C
    ld   [$D8B0],a                  ; 06:537E
    ret                             ; 06:5381

Sub065382:
    xor  a                          ; 06:5382
    ldh  [<RP],a                    ; 06:5383
    ld   a,$FF                      ; 06:5385
    ld   [$D8B0],a                  ; 06:5387
    ret                             ; 06:538A

Sub06538B:
    xor  a                          ; 06:538B
    ld   [$D8AA],a                  ; 06:538C
    ld   [$D8AB],a                  ; 06:538F
    push hl                         ; 06:5392
    push bc                         ; 06:5393
    ld   hl,$D8AC                   ; 06:5394
    ld   a,$5A                      ; 06:5397
    ldi  [hl],a                     ; 06:5399
    ld   [hl],b                     ; 06:539A
    dec  hl                         ; 06:539B
    ld   b,$02                      ; 06:539C
    ld   d,$1E                      ; 06:539E
    call Sub065288                  ; 06:53A0
    call Sub0653D7                  ; 06:53A3
    pop  bc                         ; 06:53A6
    pop  hl                         ; 06:53A7
    call Return065554               ; 06:53A8
    call Sub0653D7                  ; 06:53AB
    ld   a,[$D8AA]                  ; 06:53AE
    ld   [$D8AC],a                  ; 06:53B1
    ld   a,[$D8AB]                  ; 06:53B4
    ld   [$D8AD],a                  ; 06:53B7
    ld   hl,$D8AC                   ; 06:53BA
    ld   b,$02                      ; 06:53BD
    call Sub0653D7                  ; 06:53BF
    ld   hl,$D8B0                   ; 06:53C2
    ld   b,$01                      ; 06:53C5
    call Sub0654C2                  ; 06:53C7
    ld   a,[$D8AC]                  ; 06:53CA
    ld   [$D8AA],a                  ; 06:53CD
    ld   a,[$D8AD]                  ; 06:53D0
    ld   [$D8AB],a                  ; 06:53D3
    ret                             ; 06:53D6

Sub0653D7:
    ld   c,$56                      ; 06:53D7
    ld   d,$16                      ; 06:53D9
    call Sub065281                  ; 06:53DB
    ld   d,$16                      ; 06:53DE
    call Sub065288                  ; 06:53E0
    ld   a,b                        ; 06:53E3
    cpl                             ; 06:53E4
    ld   b,a                        ; 06:53E5
Code0653E6:
    inc  b                          ; 06:53E6
    jr   z,Code06543B               ; 06:53E7
    ld   a,$08                      ; 06:53E9
    ld   [$D8B6],a                  ; 06:53EB
    ldi  a,[hl]                     ; 06:53EE
    ld   e,a                        ; 06:53EF
    ld   a,[$D8AA]                  ; 06:53F0
    add  e                          ; 06:53F3
    ld   [$D8AA],a                  ; 06:53F4
    jr   nc,Code065402              ; 06:53F7
    ld   a,[$D8AB]                  ; 06:53F9
    inc  a                          ; 06:53FC
    ld   [$D8AB],a                  ; 06:53FD
    jr   Code065405                 ; 06:5400
Code065402:
    call Return065554               ; 06:5402
Code065405:
    ld   a,e                        ; 06:5405
    rlca                            ; 06:5406
    ld   e,a                        ; 06:5407
    jr   nc,Code06541A              ; 06:5408
    ld   a,[$D8B1]                  ; 06:540A
    ld   d,a                        ; 06:540D
    call Sub065281                  ; 06:540E
    ld   a,[$D8B2]                  ; 06:5411
    ld   d,a                        ; 06:5414
    call Sub065288                  ; 06:5415
    jr   Code065428                 ; 06:5418
Code06541A:
    ld   a,[$D8B3]                  ; 06:541A
    ld   d,a                        ; 06:541D
    call Sub065281                  ; 06:541E
    ld   a,[$D8B4]                  ; 06:5421
    ld   d,a                        ; 06:5424
    call Sub065288                  ; 06:5425
Code065428:
    ld   a,[$D8B6]                  ; 06:5428
    dec  a                          ; 06:542B
    ld   [$D8B6],a                  ; 06:542C
    jr   z,Code065439               ; 06:542F
    call Sub065555                  ; 06:5431
    call Sub065555                  ; 06:5434
    jr   Code065405                 ; 06:5437
Code065439:
    jr   Code0653E6                 ; 06:5439
Code06543B:
    call Return065554               ; 06:543B
    call Return065554               ; 06:543E
    call Sub065555                  ; 06:5441
    ld   d,$16                      ; 06:5444
    call Sub065281                  ; 06:5446
    ld   d,$16                      ; 06:5449
    call Sub065288                  ; 06:544B
    ret                             ; 06:544E

Code06544F:
    ld   a,$02                      ; 06:544F
    ld   [$D8B0],a                  ; 06:5451
    ret                             ; 06:5454

Unused065455:
    ld   a,[$D8B0]                  ; 06:5455
    or   $01                        ; 06:5458
    ld   [$D8B0],a                  ; 06:545A
    ret                             ; 06:545D

Code06545E:
    ld   a,[$D8B0]                  ; 06:545E
    or   $04                        ; 06:5461
    ld   [$D8B0],a                  ; 06:5463
    ret                             ; 06:5466

Sub065467:
    xor  a                          ; 06:5467
    ld   [$D8AA],a                  ; 06:5468
    ld   [$D8AB],a                  ; 06:546B
    push hl                         ; 06:546E
    ld   hl,$D8AC                   ; 06:546F
    ld   b,$02                      ; 06:5472
    call Sub0654C2                  ; 06:5474
    ld   a,[$D8AD]                  ; 06:5477
    ld   [$D8AE],a                  ; 06:547A
    ld   b,a                        ; 06:547D
    pop  hl                         ; 06:547E
    ld   a,[$D8AC]                  ; 06:547F
    cp   $5A                        ; 06:5482
    jp   nz,Code06545E              ; 06:5484
    call Sub0654C2                  ; 06:5487
    ld   a,[$D8AA]                  ; 06:548A
    ld   d,a                        ; 06:548D
    ld   a,[$D8AB]                  ; 06:548E
    ld   e,a                        ; 06:5491
    push de                         ; 06:5492
    ld   hl,$D8AC                   ; 06:5493
    ld   b,$02                      ; 06:5496
    call Sub0654C2                  ; 06:5498
    pop  de                         ; 06:549B
    ld   hl,$D8AC                   ; 06:549C
    ldi  a,[hl]                     ; 06:549F
    xor  d                          ; 06:54A0
    ld   b,a                        ; 06:54A1
    ld   a,[hl]                     ; 06:54A2
    xor  e                          ; 06:54A3
    or   b                          ; 06:54A4
    jr   z,Code0654AF               ; 06:54A5
    ld   a,[$D8B0]                  ; 06:54A7
    or   $01                        ; 06:54AA
    ld   [$D8B0],a                  ; 06:54AC
Code0654AF:
    push de                         ; 06:54AF
    ld   hl,$D8B0                   ; 06:54B0
    ld   b,$01                      ; 06:54B3
    call Sub0653D7                  ; 06:54B5
    pop  de                         ; 06:54B8
    ld   a,d                        ; 06:54B9
    ld   [$D8AA],a                  ; 06:54BA
    ld   a,e                        ; 06:54BD
    ld   [$D8AB],a                  ; 06:54BE
    ret                             ; 06:54C1

Sub0654C2:
    ld   c,$56                      ; 06:54C2
    ld   d,$00                      ; 06:54C4
    call Sub065279                  ; 06:54C6
    ld   a,d                        ; 06:54C9
    or   a                          ; 06:54CA
    jp   z,Code06544F               ; 06:54CB
    ld   d,$00                      ; 06:54CE
    call Sub065271                  ; 06:54D0
    ld   a,d                        ; 06:54D3
    or   a                          ; 06:54D4
    jp   z,Code06544F               ; 06:54D5
    ld   d,$00                      ; 06:54D8
    call Sub065279                  ; 06:54DA
    ld   a,d                        ; 06:54DD
    or   a                          ; 06:54DE
    jp   z,Code06544F               ; 06:54DF
    call Sub065555                  ; 06:54E2
    call Sub065555                  ; 06:54E5
    push af                         ; 06:54E8
    pop  af                         ; 06:54E9
    ld   a,b                        ; 06:54EA
    cpl                             ; 06:54EB
    ld   b,a                        ; 06:54EC
Code0654ED:
    inc  b                          ; 06:54ED
    jr   z,Code06553A               ; 06:54EE
    ld   a,$08                      ; 06:54F0
    ld   [$D8B6],a                  ; 06:54F2
Code0654F5:
    ld   d,$00                      ; 06:54F5
    call Sub065271                  ; 06:54F7
    call Sub065279                  ; 06:54FA
    ld   a,[$D8B5]                  ; 06:54FD
    cp   d                          ; 06:5500
    jr   nc,Code065509              ; 06:5501
    ld   a,e                        ; 06:5503
    set  0,a                        ; 06:5504
    ld   e,a                        ; 06:5506
    jr   Code06550D                 ; 06:5507
Code065509:
    ld   a,e                        ; 06:5509
    res  0,a                        ; 06:550A
    ld   e,a                        ; 06:550C
Code06550D:
    ld   a,[$D8B6]                  ; 06:550D
    dec  a                          ; 06:5510
    ld   [$D8B6],a                  ; 06:5511
    jr   z,Code065521               ; 06:5514
    ld   a,e                        ; 06:5516
    rlca                            ; 06:5517
    ld   e,a                        ; 06:5518
    call Sub065555                  ; 06:5519
    call Sub065555                  ; 06:551C
    jr   Code0654F5                 ; 06:551F
Code065521:
    ld   a,e                        ; 06:5521
    ldi  [hl],a                     ; 06:5522
    ld   a,[$D8AA]                  ; 06:5523
    add  e                          ; 06:5526
    ld   [$D8AA],a                  ; 06:5527
    jr   nc,Code065535              ; 06:552A
    ld   a,[$D8AB]                  ; 06:552C
    inc  a                          ; 06:552F
    ld   [$D8AB],a                  ; 06:5530
    jr   Code065538                 ; 06:5533
Code065535:
    call Return065554               ; 06:5535
Code065538:
    jr   Code0654ED                 ; 06:5538
Code06553A:
    ld   d,$00                      ; 06:553A
    call Sub065271                  ; 06:553C
    ld   a,d                        ; 06:553F
    and  a                          ; 06:5540
    jp   z,Code06544F               ; 06:5541
    ld   d,$11                      ; 06:5544
    call Sub065288                  ; 06:5546
    ret                             ; 06:5549

Sub06554A:
    ld   b,$00                      ; 06:554A
    jp   Sub06538B                  ; 06:554C

Sub06554F:
    ld   b,$00                      ; 06:554F
    jp   Sub065467                  ; 06:5551
Return065554:
    ret                             ; 06:5554

Sub065555:
    jr   z,Code065557               ; 06:5555
Code065557:
    jr   nz,Return065559            ; 06:5557
Return065559:
    ret                             ; 06:5559

Sub06555A:
; Game state 2F
    ld   a,[$C168]                  ; 06:555A
    ldh  a,[<H_GameSubstate]        ; 06:555D
    rst  $00                        ; 06:555F  Execute from 16-bit pointer table
.dw Code065566                      ; 06:5560
.dw Code0655E7                      ; 06:5562
.dw Code0655F9                      ; 06:5564

Code065566:
    ld   hl,SRAMBANK                ; 06:5566
    ld   a,$00                      ; 06:5569
    ld   [hl],a                     ; 06:556B
    ld   hl,$C370                   ; 06:556C
    ldi  [hl],a                     ; 06:556F
    ldi  [hl],a                     ; 06:5570
    ldi  [hl],a                     ; 06:5571
    ldi  [hl],a                     ; 06:5572
    ldi  [hl],a                     ; 06:5573
    ld   a,$00                      ; 06:5574
    ldh  [<IE],a                    ; 06:5576
    ldh  [<$FF93],a                 ; 06:5578
    call Sub00126D                  ; 06:557A
    ld   a,:Gr_Bank1B               ; 06:557D
    ld   b,$06                      ; 06:557F
    call LoadGraphicsBank           ; 06:5581
    ld   a,:Data1B72D0              ; 06:5584
    ld   b,$06                      ; 06:5586
    ld   de,Data1B72D0              ; 06:5588
    call LoadFullPaletteLong        ; 06:558B
    ld   a,:Data1B7000              ; 06:558E
    ld   b,$06                      ; 06:5590
    ld   de,$99C0                   ; 06:5592
    ld   hl,Data1B7000              ; 06:5595
    call LoadScreenTilemapVRAM      ; 06:5598
    ld   a,$00                      ; 06:559B
    ldh  [<H_CameraXLow],a          ; 06:559D
    ldh  [<H_CameraXHigh],a         ; 06:559F
    ldh  [<$FFBB],a                 ; 06:55A1
    ld   a,$70                      ; 06:55A3
    ldh  [<H_CameraY],a             ; 06:55A5
    ld   a,$06                      ; 06:55A7
    rst  $10                        ; 06:55A9  24-bit call
.dl SubL_07588C                     ; 06:55AA
    ld   a,$07                      ; 06:55AD
    ldh  [<SVBK],a                  ; 06:55AF
    ld   de,$D800                   ; 06:55B1
    ld   b,$AA                      ; 06:55B4
    ld   hl,$D962                   ; 06:55B6
Code0655B9:
    ld   a,[de]                     ; 06:55B9
    inc  de                         ; 06:55BA
    ldi  [hl],a                     ; 06:55BB
    dec  b                          ; 06:55BC
    jp   nz,Code0655B9              ; 06:55BD
    xor  a                          ; 06:55C0
    ld   b,$AA                      ; 06:55C1
    ld   hl,$D8B8                   ; 06:55C3
Code0655C6:
    ldi  [hl],a                     ; 06:55C6
    dec  b                          ; 06:55C7
    jp   nz,Code0655C6              ; 06:55C8
    xor  a                          ; 06:55CB
    ld   [$D8B0],a                  ; 06:55CC
    ld   a,$01                      ; 06:55CF
    ldh  [<IE],a                    ; 06:55D1
    ldh  [<$FF93],a                 ; 06:55D3
    ld   a,$87                      ; 06:55D5
    ldh  [<LCDC],a                  ; 06:55D7
    ld   a,$00                      ; 06:55D9
    ldh  [<SVBK],a                  ; 06:55DB
    ld   hl,H_GameSubstate          ; 06:55DD
    inc  [hl]                       ; 06:55E0
    ld   a,$00                      ; 06:55E1
    ld   [$C0C1],a                  ; 06:55E3
    ret                             ; 06:55E6

Code0655E7:
    ld   a,$07                      ; 06:55E7
    ldh  [<SVBK],a                  ; 06:55E9
    ld   a,$10                      ; 06:55EB
    ld   [$DA0C],a                  ; 06:55ED
    ld   a,$00                      ; 06:55F0
    ldh  [<SVBK],a                  ; 06:55F2
    ld   hl,H_GameSubstate          ; 06:55F4
    inc  [hl]                       ; 06:55F7
    ret                             ; 06:55F8

Code0655F9:
    ld   a,$07                      ; 06:55F9
    ldh  [<SVBK],a                  ; 06:55FB
    ld   a,[$DA0C]                  ; 06:55FD
    ld   b,a                        ; 06:5600
    dec  a                          ; 06:5601
    ld   [$DA0C],a                  ; 06:5602
    ld   a,$00                      ; 06:5605
    ldh  [<SVBK],a                  ; 06:5607
    ld   a,b                        ; 06:5609
    and  a                          ; 06:560A
    jp   nz,Return065615            ; 06:560B
    ld   hl,H_GameState             ; 06:560E
    inc  [hl]                       ; 06:5611
    xor  a                          ; 06:5612
    ldh  [<H_GameSubstate],a        ; 06:5613
Return065615:
    ret                             ; 06:5615

Sub065616:
; Game state 30
    ldh  a,[<H_GameSubstate]        ; 06:5616
    rst  $00                        ; 06:5618  Execute from 16-bit pointer table
.dw Code065672                      ; 06:5619
.dw Code0656E6                      ; 06:561B
.dw Code065759                      ; 06:561D
.dw Code065879                      ; 06:561F
.dw Code0658CE                      ; 06:5621

Data065623:                         ; 06:5623
.db $9B,$A1,$12,$0A,$99,$0A,$E1,$0A,\
    $D4,$0A,$E2,$0A,$E2,$0A,$A4,$0A,\
    $E3,$0A,$D7,$0A,$D4,$0A,$A4,$0A,\
    $8A,$0A,$A4,$0A,$8B,$0A,$E4,$0A,\
    $E3,$0A,$E3,$0A,$DE,$0A,$DD,$9B,\
    $C1,$12,$0A,$E6,$0A,$D7,$0A,$D4,\
    $0A,$DD,$0A,$A4,$0A,$E1,$0A,$D4,\
    $0A,$D0,$0A,$D3,$0A,$E8,$0A,$A4,\
    $0A,$A4,$0A,$A4,$0A,$A4,$0A,$A4,\
    $0A,$A4,$0A,$A4,$0A,$A4,$00

Code065672:
    ld   de,W_TilemapUploadBuffer   ; 06:5672
    ld   hl,Data065623              ; 06:5675
    ld   bc,$004F                   ; 06:5678
    call CopyBytes                  ; 06:567B
    ld   a,$FF                      ; 06:567E
    ld   [$DE68],a                  ; 06:5680
    ld   a,$07                      ; 06:5683
    ldh  [<SVBK],a                  ; 06:5685
    xor  a                          ; 06:5687
    ld   [$D8B7],a                  ; 06:5688
    call Sub065239                  ; 06:568B
    ld   a,$00                      ; 06:568E
    ldh  [<SVBK],a                  ; 06:5690
    ld   hl,H_GameSubstate          ; 06:5692
    inc  [hl]                       ; 06:5695
    ret                             ; 06:5696

Data065697:                         ; 06:5697
.db $9B,$A1,$12,$0A,$A4,$0A,$A4,$0A,\
    $A4,$0A,$A4,$0A,$A4,$0A,$A4,$0A,\
    $A4,$0A,$A4,$0A,$A4,$0A,$A4,$0A,\
    $A4,$0A,$A4,$0A,$A4,$0A,$A4,$0A,\
    $A4,$0A,$A4,$0A,$A4,$0A,$A4,$9B,\
    $C1,$12,$0A,$A4,$0A,$A4,$0A,$A4,\
    $0A,$A4,$0A,$A4,$0A,$A4,$0A,$A4,\
    $0A,$A4,$0A,$A4,$0A,$A4,$0A,$A4,\
    $0A,$A4,$0A,$A4,$0A,$A4,$0A,$A4,\
    $0A,$A4,$0A,$A4,$0A,$A4,$00
Code0656E6:
    di                              ; 06:56E6
    ld   a,$07                      ; 06:56E7
    ldh  [<SVBK],a                  ; 06:56E9
    call Sub06528F                  ; 06:56EB
    ld   a,[$D8B0]                  ; 06:56EE
    cp   $FF                        ; 06:56F1
    jr   z,Code0656FC               ; 06:56F3
    cp   $00                        ; 06:56F5
    jr   z,Code065713               ; 06:56F7
    jp   Code06572E                 ; 06:56F9
Code0656FC:
    call Sub065382                  ; 06:56FC
    ld   a,$7D                      ; 06:56FF
    ld   [$DE68],a                  ; 06:5701
    ld   a,$02                      ; 06:5704
    ld   [$C0C1],a                  ; 06:5706
    ld   a,$2B                      ; 06:5709
    ldh  [<H_GameState],a           ; 06:570B
    xor  a                          ; 06:570D
    ldh  [<H_GameSubstate],a        ; 06:570E
    jp   Code065753                 ; 06:5710
Code065713:
    call Sub065382                  ; 06:5713
    ld   a,$00                      ; 06:5716
    ldh  [<SVBK],a                  ; 06:5718
    ld   de,W_TilemapUploadBuffer   ; 06:571A
    ld   hl,Data065697              ; 06:571D
    ld   bc,$004F                   ; 06:5720
    call CopyBytes                  ; 06:5723
    ldh  a,[<H_GameSubstate]        ; 06:5726
    inc  a                          ; 06:5728
    ldh  [<H_GameSubstate],a        ; 06:5729
    jp   Code065753                 ; 06:572B
Code06572E:
    call Sub065382                  ; 06:572E
    ld   a,$20                      ; 06:5731
    ld   [$DA0C],a                  ; 06:5733
    ld   a,$00                      ; 06:5736
    ldh  [<SVBK],a                  ; 06:5738
    ld   de,W_TilemapUploadBuffer   ; 06:573A
    ld   hl,Data065697              ; 06:573D
    ld   bc,$004F                   ; 06:5740
    call CopyBytes                  ; 06:5743
    ld   a,$30                      ; 06:5746
    ldh  [<$FFF3],a                 ; 06:5748
    ldh  a,[<H_GameSubstate]        ; 06:574A
    inc  a                          ; 06:574C
    inc  a                          ; 06:574D
    inc  a                          ; 06:574E
    ldh  [<H_GameSubstate],a        ; 06:574F
    jr   Code065753                 ; 06:5751
Code065753:
    ld   a,$00                      ; 06:5753
    ldh  [<SVBK],a                  ; 06:5755
    ei                              ; 06:5757
    ret                             ; 06:5758

Code065759:
    di                              ; 06:5759
    ld   a,$07                      ; 06:575A
    ldh  [<SVBK],a                  ; 06:575C
    call Sub065239                  ; 06:575E
    ld   a,[$D8B7]                  ; 06:5761
    cp   $01                        ; 06:5764
    jp   nz,Code065772              ; 06:5766
    ld   hl,$4000                   ; 06:5769
Code06576C:
    dec  hl                         ; 06:576C
    ld   a,h                        ; 06:576D
    or   l                          ; 06:576E
    jp   nz,Code06576C              ; 06:576F
Code065772:
    call Sub06528F                  ; 06:5772
    ld   a,[$D8B0]                  ; 06:5775
    cp   $FF                        ; 06:5778
    jr   z,Code065783               ; 06:577A
    cp   $00                        ; 06:577C
    jr   z,Code065792               ; 06:577E
    jp   Code06583F                 ; 06:5780
Code065783:
    ld   a,$7D                      ; 06:5783
    ld   [$DE68],a                  ; 06:5785
    ld   a,$2B                      ; 06:5788
    ldh  [<H_GameState],a           ; 06:578A
    xor  a                          ; 06:578C
    ldh  [<H_GameSubstate],a        ; 06:578D
    jp   Code065853                 ; 06:578F
Code065792:
    ld   a,[$D8AF]                  ; 06:5792
    cp   $01                        ; 06:5795
    jp   z,Code0657D6               ; 06:5797
    ld   hl,$D962                   ; 06:579A
    ld   b,$AA                      ; 06:579D
    call Sub06538B                  ; 06:579F
    ld   a,[$D8B0]                  ; 06:57A2
    cp   $00                        ; 06:57A5
    jp   nz,Code06583F              ; 06:57A7
    call Sub06554A                  ; 06:57AA
    ld   a,[$D8B0]                  ; 06:57AD
    cp   $00                        ; 06:57B0
    jp   nz,Code06583F              ; 06:57B2
    ld   a,$01                      ; 06:57B5
    ld   [$D8AF],a                  ; 06:57B7
    ld   hl,$D8B8                   ; 06:57BA
    call Sub065467                  ; 06:57BD
    ld   a,[$D8B0]                  ; 06:57C0
    cp   $00                        ; 06:57C3
    jp   nz,Code06583F              ; 06:57C5
    call Sub06554F                  ; 06:57C8
    ld   a,[$D8B0]                  ; 06:57CB
    cp   $00                        ; 06:57CE
    jp   nz,Code06583F              ; 06:57D0
    jp   Code06580B                 ; 06:57D3
Code0657D6:
    ld   hl,$D8B8                   ; 06:57D6
    call Sub065467                  ; 06:57D9
    ld   a,[$D8B0]                  ; 06:57DC
    cp   $00                        ; 06:57DF
    jr   nz,Code06583F              ; 06:57E1
    call Sub06554F                  ; 06:57E3
    ld   a,[$D8B0]                  ; 06:57E6
    cp   $00                        ; 06:57E9
    jr   nz,Code06583F              ; 06:57EB
    ld   a,$02                      ; 06:57ED
    ld   [$D8AF],a                  ; 06:57EF
    ld   hl,$D962                   ; 06:57F2
    ld   b,$AA                      ; 06:57F5
    call Sub06538B                  ; 06:57F7
    ld   a,[$D8B0]                  ; 06:57FA
    cp   $00                        ; 06:57FD
    jr   nz,Code06583F              ; 06:57FF
    call Sub06554A                  ; 06:5801
    ld   a,[$D8B0]                  ; 06:5804
    cp   $00                        ; 06:5807
    jr   nz,Code06583F              ; 06:5809
Code06580B:
    call Sub065382                  ; 06:580B
    ld   a,$20                      ; 06:580E
    ld   [$DA0C],a                  ; 06:5810
    ld   a,$00                      ; 06:5813
    ldh  [<SVBK],a                  ; 06:5815
    ld   a,$06                      ; 06:5817
    rst  $10                        ; 06:5819  24-bit call
.dl SubL_0756D9                     ; 06:581A
    ld   a,[$C42A]                  ; 06:581D
    or   $20                        ; 06:5820
    ld   [$C42A],a                  ; 06:5822
    ld   a,$06                      ; 06:5825
    rst  $10                        ; 06:5827  24-bit call
.dl SubL_0757EF                     ; 06:5828
    ld   a,$07                      ; 06:582B
    ldh  [<SVBK],a                  ; 06:582D
    ld   a,$7D                      ; 06:582F
    ld   [$DE68],a                  ; 06:5831
    ld   a,$31                      ; 06:5834
    ldh  [<$FFF3],a                 ; 06:5836
    ldh  a,[<H_GameSubstate]        ; 06:5838
    inc  a                          ; 06:583A
    ldh  [<H_GameSubstate],a        ; 06:583B
    jr   Code065853                 ; 06:583D
Code06583F:
    call Sub065382                  ; 06:583F
    ld   a,$20                      ; 06:5842
    ld   [$DA0C],a                  ; 06:5844
    ld   a,$30                      ; 06:5847
    ldh  [<$FFF3],a                 ; 06:5849
    ldh  a,[<H_GameSubstate]        ; 06:584B
    inc  a                          ; 06:584D
    inc  a                          ; 06:584E
    ldh  [<H_GameSubstate],a        ; 06:584F
    jr   Code065853                 ; 06:5851
Code065853:
    ld   a,$00                      ; 06:5853
    ldh  [<SVBK],a                  ; 06:5855
    ei                              ; 06:5857
    ret                             ; 06:5858

Data065859:                         ; 06:5859
.db $40,$48,$B2,$69,$40,$50,$B0,$69,\
    $40,$58,$B0,$49,$40,$60,$B2,$49,\
    $50,$48,$B2,$29,$50,$50,$B0,$29,\
    $50,$58,$B0,$09,$50,$60,$B2,$09
Code065879:
    ld   a,$07                      ; 06:5879
    ldh  [<SVBK],a                  ; 06:587B
    ld   a,[$DA0C]                  ; 06:587D
    ld   b,a                        ; 06:5880
    dec  a                          ; 06:5881
    ld   [$DA0C],a                  ; 06:5882
    ld   a,$00                      ; 06:5885
    ldh  [<SVBK],a                  ; 06:5887
    ld   a,b                        ; 06:5889
    and  a                          ; 06:588A
    jp   z,Code06589F               ; 06:588B
    ld   hl,$C000                   ; 06:588E
    ld   de,Data065859              ; 06:5891
    ld   b,$20                      ; 06:5894
Code065896:
    ld   a,[de]                     ; 06:5896
    inc  de                         ; 06:5897
    ldi  [hl],a                     ; 06:5898
    dec  b                          ; 06:5899
    jr   nz,Code065896              ; 06:589A
    jp   Return0658AD               ; 06:589C
Code06589F:
    ld   a,$02                      ; 06:589F
    ld   [$C0C1],a                  ; 06:58A1
    ld   a,[$C416]                  ; 06:58A4
    ldh  [<H_GameState],a           ; 06:58A7
    ld   a,$05                      ; 06:58A9
    ldh  [<H_GameSubstate],a        ; 06:58AB
Return0658AD:
    ret                             ; 06:58AD

Data0658AE:                         ; 06:58AE
.db $40,$48,$B6,$69,$40,$50,$B4,$69,\
    $40,$58,$B4,$49,$40,$60,$B6,$49,\
    $50,$48,$B6,$29,$50,$50,$B4,$29,\
    $50,$58,$B4,$09,$50,$60,$B6,$09
Code0658CE:
    ld   a,$07                      ; 06:58CE
    ldh  [<SVBK],a                  ; 06:58D0
    ld   a,[$DA0C]                  ; 06:58D2
    ld   b,a                        ; 06:58D5
    dec  a                          ; 06:58D6
    ld   [$DA0C],a                  ; 06:58D7
    ld   a,$00                      ; 06:58DA
    ldh  [<SVBK],a                  ; 06:58DC
    ld   a,b                        ; 06:58DE
    and  a                          ; 06:58DF
    jp   z,Code0658F3               ; 06:58E0
    ld   hl,$C000                   ; 06:58E3
    ld   de,Data0658AE              ; 06:58E6
    ld   b,$20                      ; 06:58E9
Code0658EB:
    ld   a,[de]                     ; 06:58EB
    inc  de                         ; 06:58EC
    ldi  [hl],a                     ; 06:58ED
    dec  b                          ; 06:58EE
    jr   nz,Code0658EB              ; 06:58EF
    jr   Return0658FB               ; 06:58F1
Code0658F3:
    ld   a,$FF                      ; 06:58F3
    ld   [$DE68],a                  ; 06:58F5
    xor  a                          ; 06:58F8
    ldh  [<H_GameSubstate],a        ; 06:58F9
Return0658FB:
    ret                             ; 06:58FB

.db $9A,$A7,$07,$00,$E6,$00,$E2,$00,\
    $EC,$00,$EC,$00,$CE,$00,$CE,$00,\
    $CE,$00

ChalMiss_Main:
; Game state 22
    ld   a,[$C168]                  ; 06:590E
    rst  $00                        ; 06:5911  Execute from 16-bit pointer table
.dw ChallMiss_LoadGraphics          ; 06:5912
.dw ChallMiss_CallSubstate          ; 06:5914

ChallMiss_LoadGraphics:
    call Sub00126D                  ; 06:5916
    ld   a,$00                      ; 06:5919
    ldh  [<IE],a                    ; 06:591B
    ld   a,:Gr_ChalMissYoshiHatch   ; 06:591D
    ld   b,$06                      ; 06:591F
    call LoadGraphicsBank           ; 06:5921
    ld   a,:Pal_ChalMiss            ; 06:5924
    ld   b,$06                      ; 06:5926
    ld   de,Pal_ChalMiss            ; 06:5928
    call LoadFullPaletteLong        ; 06:592B
    call Sub00128D                  ; 06:592E
    ld   a,:Ti_ChalMiss             ; 06:5931
    ld   b,$06                      ; 06:5933
    ld   de,$99C0                   ; 06:5935
    ld   hl,Ti_ChalMiss             ; 06:5938
    call LoadScreenTilemapVRAM      ; 06:593B
    ld   a,$00                      ; 06:593E
    ld   [$C0C4],a                  ; 06:5940
    ldh  [<H_GameSubstate],a        ; 06:5943
    ldh  [<H_CameraXLow],a          ; 06:5945
    ldh  [<H_CameraXHigh],a         ; 06:5947
    ldh  [<$FFBB],a                 ; 06:5949
    ld   a,$70                      ; 06:594B
    ldh  [<H_CameraY],a             ; 06:594D
    ld   a,$40                      ; 06:594F
    ld   [$C285],a                  ; 06:5951
    ld   a,$00                      ; 06:5954
    ld   [$C286],a                  ; 06:5956
    ld   a,$70                      ; 06:5959
    ld   [$DE68],a                  ; 06:595B
    ld   a,$01                      ; 06:595E
    ldh  [<IE],a                    ; 06:5960
    ld   a,$87                      ; 06:5962
    ldh  [<LCDC],a                  ; 06:5964
    ld   hl,$C168                   ; 06:5966
    inc  [hl]                       ; 06:5969
    ret                             ; 06:596A

ChallMiss_CallSubstate:
    ldh  a,[<H_GameSubstate]        ; 06:596B
    rst  $00                        ; 06:596D  Execute from 16-bit pointer table
.dw Code065972                      ; 06:596E
.dw Code065991                      ; 06:5970
Code065972:
    ld   hl,$C285                   ; 06:5972
    ld   a,[hl]                     ; 06:5975
    dec  [hl]                       ; 06:5976
    and  a                          ; 06:5977
    jr   nz,Return065990            ; 06:5978
    ld   hl,$C286                   ; 06:597A
    ld   a,[hl]                     ; 06:597D
    dec  [hl]                       ; 06:597E
    and  a                          ; 06:597F
    jr   nz,Return065990            ; 06:5980
    ld   a,$E0                      ; 06:5982
    ld   [$C285],a                  ; 06:5984
    ld   a,$00                      ; 06:5987
    ld   [$C286],a                  ; 06:5989
    ld   hl,H_GameSubstate          ; 06:598C
    inc  [hl]                       ; 06:598F
Return065990:
    ret                             ; 06:5990

Code065991:
    ldh  a,[<H_ButtonsPressed]      ; 06:5991
    and  $09                        ; 06:5993
    jr   nz,Code06599F              ; 06:5995
    ld   hl,$C285                   ; 06:5997
    ld   a,[hl]                     ; 06:599A
    dec  [hl]                       ; 06:599B
    and  a                          ; 06:599C
    jr   nz,Return0659AD            ; 06:599D
Code06599F:
    ld   a,$00                      ; 06:599F
    ld   [$C285],a                  ; 06:59A1
    ld   [$C286],a                  ; 06:59A4
    ldh  [<H_GameSubstate],a        ; 06:59A7
    ld   a,$1D                      ; 06:59A9
    ldh  [<H_GameState],a           ; 06:59AB
Return0659AD:
    ret                             ; 06:59AD

AwardCutscene_Main:
; Game state 1C
    ld   a,[$C168]                  ; 06:59AE
    rst  $00                        ; 06:59B1  Execute from 16-bit pointer table
.dw Code0659BA                      ; 06:59B2
.dw Code0659ED                      ; 06:59B4
.dw Code065AB9                      ; 06:59B6
.dw AwardCutscene_CallSubstate      ; 06:59B8
Code0659BA:
    ld   a,$06                      ; 06:59BA
    rst  $10                        ; 06:59BC  24-bit call
.dl SubL_0451A4                     ; 06:59BD
    ld   a,[$C1AD]                  ; 06:59C0
    dec  a                          ; 06:59C3
    ld   [$C1AD],a                  ; 06:59C4
    jr   z,Code0659CA               ; 06:59C7
    ret                             ; 06:59C9

Code0659CA:
    ld   hl,$C168                   ; 06:59CA
    inc  [hl]                       ; 06:59CD
    ret                             ; 06:59CE

DataPtrs0659CF:                     ; 06:59CF
.dl Gr_ToadAward, Gr_MarioAward, Gr_PeachAward, Gr_BowserAward,\
    Gr_YoshiAward
DataPtrs0659DE:                     ; 06:59DE
.dl Pal_AlbumImageBG, Pal_AlbumImageBG+$40, Pal_AlbumImageBG+$80, Pal_AlbumImageBG+$C0,\
    Pal_AlbumImageBG+$100
Code0659ED:
    call Sub00126D                  ; 06:59ED
    ld   a,$00                      ; 06:59F0
    ldh  [<IE],a                    ; 06:59F2
    xor  a                          ; 06:59F4
    ldh  [<VBK],a                   ; 06:59F5
    ld   a,[$C1B0]                  ; 06:59F7
    dec  a                          ; 06:59FA
    ld   c,a                        ; 06:59FB
    sla  a                          ; 06:59FC
    add  c                          ; 06:59FE
    ld   c,a                        ; 06:59FF
    ld   b,$00                      ; 06:5A00
    ld   hl,DataPtrs0659CF          ; 06:5A02
    add  hl,bc                      ; 06:5A05
    ld   e,[hl]                     ; 06:5A06
    inc  hl                         ; 06:5A07
    ld   d,[hl]                     ; 06:5A08
    inc  hl                         ; 06:5A09
    ld   a,[hl]                     ; 06:5A0A
    ld   [$C415],a                  ; 06:5A0B
    ld   l,e                        ; 06:5A0E
    ld   h,d                        ; 06:5A0F
    ld   de,$8800                   ; 06:5A10
    ld   bc,$0800                   ; 06:5A13
    ld   a,$06                      ; 06:5A16
    call CopyBytesLong              ; 06:5A18
    ld   a,[W_CurrentPlayer]        ; 06:5A1B
    and  a                          ; 06:5A1E
    jr   nz,@Luigi                  ; 06:5A1F
    ld   hl,Gr_PeachGivesMarioAward ; 06:5A21
    push hl                         ; 06:5A24
    ld   hl,Ti_PeachGivesMarioAward ; 06:5A25
    jr   Code065A31                 ; 06:5A28
@Luigi:
    ld   hl,Gr_PeachGivesLuigiAward ; 06:5A2A
    push hl                         ; 06:5A2D
    ld   hl,Ti_PeachGivesLuigiAward ; 06:5A2E
Code065A31:
    push hl                         ; 06:5A31
    ld   a,:Ti_PeachGivesMarioAward ; 06:5A32
    ld   b,$06                      ; 06:5A34
    ld   de,$9800                   ; 06:5A36
    call LoadScreenTilemapVRAM      ; 06:5A39
    pop  hl                         ; 06:5A3C
    ld   de,$02D0                   ; 06:5A3D
    add  hl,de                      ; 06:5A40
    ld   a,:Ti_PeachGivesMarioAward ; 06:5A41
    ld   b,$06                      ; 06:5A43
    ld   de,$99C0                   ; 06:5A45
    call LoadScreenTilemapVRAM      ; 06:5A48
    ld   a,$01                      ; 06:5A4B
    ldh  [<VBK],a                   ; 06:5A4D
    ld   a,:Gr_PeachGivesMarioAward ; 06:5A4F
    ld   [$C415],a                  ; 06:5A51
    pop  hl                         ; 06:5A54
    ld   de,$8000                   ; 06:5A55
    ld   bc,$1800                   ; 06:5A58
    ld   a,$06                      ; 06:5A5B
    call CopyBytesLong              ; 06:5A5D
    xor  a                          ; 06:5A60
    ldh  [<VBK],a                   ; 06:5A61
    ld   a,[W_CurrentPlayer]        ; 06:5A63
    sla  a                          ; 06:5A66
    sla  a                          ; 06:5A68
    sla  a                          ; 06:5A6A
    swap a                          ; 06:5A6C
    ld   e,a                        ; 06:5A6E
    ld   d,$00                      ; 06:5A6F
    ld   hl,Pal_PeachGivesAward     ; 06:5A71
    add  hl,de                      ; 06:5A74
    ld   e,l                        ; 06:5A75
    ld   d,h                        ; 06:5A76
    ld   a,$07                      ; 06:5A77
    ldh  [<SVBK],a                  ; 06:5A79
    ld   a,:Pal_PeachGivesAward     ; 06:5A7B
    ld   b,$06                      ; 06:5A7D
    call LoadFullPaletteLong        ; 06:5A7F
    xor  a                          ; 06:5A82
    ldh  [<SVBK],a                  ; 06:5A83
    ld   hl,W_PaletteBuffer         ; 06:5A85
    ld   b,$2C                      ; 06:5A88
Code065A8A:
    ld   [hl],$FF                   ; 06:5A8A
    inc  hl                         ; 06:5A8C
    ld   [hl],$7F                   ; 06:5A8D
    inc  hl                         ; 06:5A8F
    dec  b                          ; 06:5A90
    jr   nz,Code065A8A              ; 06:5A91
    ld   a,$00                      ; 06:5A93
    ld   [$C0C4],a                  ; 06:5A95
    ldh  [<H_GameSubstate],a        ; 06:5A98
    ld   [$C0C1],a                  ; 06:5A9A
    ldh  [<H_CameraXLow],a          ; 06:5A9D
    ldh  [<H_CameraXHigh],a         ; 06:5A9F
    ldh  [<$FFBB],a                 ; 06:5AA1
    ld   a,$70                      ; 06:5AA3
    ldh  [<H_CameraY],a             ; 06:5AA5
    ld   a,$20                      ; 06:5AA7
    ld   [$C1AD],a                  ; 06:5AA9
    ld   a,$01                      ; 06:5AAC
    ldh  [<IE],a                    ; 06:5AAE
    ld   a,$87                      ; 06:5AB0
    ldh  [<LCDC],a                  ; 06:5AB2
    ld   hl,$C168                   ; 06:5AB4
    inc  [hl]                       ; 06:5AB7
    ret                             ; 06:5AB8

Code065AB9:
    call Sub065C52                  ; 06:5AB9
    ld   a,$06                      ; 06:5ABC
    rst  $10                        ; 06:5ABE  24-bit call
.dl SubL_045221                     ; 06:5ABF
    ld   a,$06                      ; 06:5AC2
    rst  $10                        ; 06:5AC4  24-bit call
.dl SubL_045237                     ; 06:5AC5
    ld   a,[$C1AD]                  ; 06:5AC8
    dec  a                          ; 06:5ACB
    ld   [$C1AD],a                  ; 06:5ACC
    jr   z,Code065AD2               ; 06:5ACF
    ret                             ; 06:5AD1

Code065AD2:
    call Sub065C52                  ; 06:5AD2
    ld   a,$D0                      ; 06:5AD5
    ld   [$C326],a                  ; 06:5AD7
    ld   hl,$C168                   ; 06:5ADA
    inc  [hl]                       ; 06:5ADD
    ret                             ; 06:5ADE

AwardCutscene_CallSubstate:
    ldh  a,[<H_GameSubstate]        ; 06:5ADF
    rst  $00                        ; 06:5AE1  Execute from 16-bit pointer table
.dw Code065AEC                      ; 06:5AE2
.dw Code065B13                      ; 06:5AE4
.dw Code065B62                      ; 06:5AE6
.dw Code065BB2                      ; 06:5AE8
.dw Code065BC4                      ; 06:5AEA
Code065AEC:
    call Sub065C52                  ; 06:5AEC
    ld   a,[$C326]                  ; 06:5AEF
    cp   $6D                        ; 06:5AF2
    jr   nz,Code065AFB              ; 06:5AF4
    ld   a,$6F                      ; 06:5AF6
    ld   [$DE68],a                  ; 06:5AF8
Code065AFB:
    ld   a,[$C326]                  ; 06:5AFB
    dec  a                          ; 06:5AFE
    ld   [$C326],a                  ; 06:5AFF
    ret  nz                         ; 06:5B02
    ldh  a,[<H_CameraY]             ; 06:5B03
    dec  a                          ; 06:5B05
    and  $F8                        ; 06:5B06
    ldh  [<$FFC5],a                 ; 06:5B08
    ld   a,$BE                      ; 06:5B0A
    ldh  [<$FFC4],a                 ; 06:5B0C
    ld   hl,H_GameSubstate          ; 06:5B0E
    inc  [hl]                       ; 06:5B11
    ret                             ; 06:5B12

Code065B13:
    ldh  a,[<H_CameraY]             ; 06:5B13
    dec  a                          ; 06:5B15
    ldh  [<H_CameraY],a             ; 06:5B16
    cp   $70                        ; 06:5B18
    jr   nc,Code065B1F              ; 06:5B1A
    call Sub065C52                  ; 06:5B1C
Code065B1F:
    ldh  a,[<$FFC5]                 ; 06:5B1F
    ld   b,a                        ; 06:5B21
    ldh  a,[<H_CameraY]             ; 06:5B22
    and  $F8                        ; 06:5B24
    cp   b                          ; 06:5B26
    jr   z,Code065B4F               ; 06:5B27
    ldh  [<$FFC5],a                 ; 06:5B29
    ld   hl,W_TilemapUploadBuffer   ; 06:5B2B
    ldh  a,[<$FFC4]                 ; 06:5B2E
    and  $F0                        ; 06:5B30
    swap a                          ; 06:5B32
    or   $90                        ; 06:5B34
    ldi  [hl],a                     ; 06:5B36
    ldh  a,[<$FFC4]                 ; 06:5B37
    and  $0F                        ; 06:5B39
    swap a                          ; 06:5B3B
    ldi  [hl],a                     ; 06:5B3D
    ld   [hl],$54                   ; 06:5B3E
    inc  hl                         ; 06:5B40
    ld   [hl],$08                   ; 06:5B41
    inc  hl                         ; 06:5B43
    ld   [hl],$80                   ; 06:5B44
    inc  hl                         ; 06:5B46
    ld   [hl],$00                   ; 06:5B47
    ldh  a,[<$FFC4]                 ; 06:5B49
    sub  $02                        ; 06:5B4B
    ldh  [<$FFC4],a                 ; 06:5B4D
Code065B4F:
    ldh  a,[<H_CameraY]             ; 06:5B4F
    cp   $D8                        ; 06:5B51
    jr   nz,Return065B61            ; 06:5B53
    ld   hl,$C164                   ; 06:5B55
    ld   [hl],$BC                   ; 06:5B58
    inc  hl                         ; 06:5B5A
    ld   [hl],$02                   ; 06:5B5B
    ld   hl,H_GameSubstate          ; 06:5B5D
    inc  [hl]                       ; 06:5B60
Return065B61:
    ret                             ; 06:5B61

Code065B62:
    ldh  a,[<H_CameraY]             ; 06:5B62
    dec  a                          ; 06:5B64
    ldh  [<H_CameraY],a             ; 06:5B65
    cp   $48                        ; 06:5B67
    jp   c,Code065B9F               ; 06:5B69
    cp   $E0                        ; 06:5B6C
    jp   nc,Code065B9F              ; 06:5B6E
    cp   $70                        ; 06:5B71
    jr   nz,Code065B8E              ; 06:5B73
    ld   a,[$C1B0]                  ; 06:5B75
    dec  a                          ; 06:5B78
    ld   c,a                        ; 06:5B79
    sla  a                          ; 06:5B7A
    add  c                          ; 06:5B7C
    ld   c,a                        ; 06:5B7D
    ld   b,$00                      ; 06:5B7E
    ld   hl,DataPtrs0659DE          ; 06:5B80
    add  hl,bc                      ; 06:5B83
    ld   e,[hl]                     ; 06:5B84
    inc  hl                         ; 06:5B85
    ld   d,[hl]                     ; 06:5B86
    inc  hl                         ; 06:5B87
    ld   a,[hl]                     ; 06:5B88
    ld   b,$06                      ; 06:5B89
    call LoadFullPaletteLong        ; 06:5B8B
Code065B8E:
    ldh  a,[<$FFC5]                 ; 06:5B8E
    ld   b,a                        ; 06:5B90
    ldh  a,[<H_CameraY]             ; 06:5B91
    and  $F8                        ; 06:5B93
    cp   b                          ; 06:5B95
    jr   z,Code065B9F               ; 06:5B96
    ldh  [<$FFC5],a                 ; 06:5B98
    ld   a,$03                      ; 06:5B9A
    ld   [$C172],a                  ; 06:5B9C
Code065B9F:
    ldh  a,[<H_CameraY]             ; 06:5B9F
    cp   $E0                        ; 06:5BA1
    jr   nz,Return065BB1            ; 06:5BA3
    ld   hl,$C164                   ; 06:5BA5
    ld   [hl],$68                   ; 06:5BA8
    inc  hl                         ; 06:5BAA
    ld   [hl],$01                   ; 06:5BAB
    ld   hl,H_GameSubstate          ; 06:5BAD
    inc  [hl]                       ; 06:5BB0
Return065BB1:
    ret                             ; 06:5BB1

Code065BB2:
    ld   hl,$C164                   ; 06:5BB2
    ld   e,[hl]                     ; 06:5BB5
    inc  hl                         ; 06:5BB6
    ld   d,[hl]                     ; 06:5BB7
    dec  de                         ; 06:5BB8
    ld   [hl],d                     ; 06:5BB9
    dec  hl                         ; 06:5BBA
    ld   [hl],e                     ; 06:5BBB
    ld   a,d                        ; 06:5BBC
    or   e                          ; 06:5BBD
    ret  nz                         ; 06:5BBE
    ld   hl,H_GameSubstate          ; 06:5BBF
    inc  [hl]                       ; 06:5BC2
    ret                             ; 06:5BC3

Code065BC4:
    ldh  a,[<H_ButtonsPressed]      ; 06:5BC4
    and  $01                        ; 06:5BC6
    ret  z                          ; 06:5BC8
    ld   a,[$C1B0]                  ; 06:5BC9
    cp   $05                        ; 06:5BCC
    jr   z,Code065BE9               ; 06:5BCE
    cp   $04                        ; 06:5BD0
    jr   z,Code065BDC               ; 06:5BD2
    cp   $02                        ; 06:5BD4
    jr   z,Code065BDC               ; 06:5BD6
    ld   a,$1D                      ; 06:5BD8
    jr   Code065BE0                 ; 06:5BDA
Code065BDC:
    ld   a,$14                      ; 06:5BDC
    jr   Code065BE0                 ; 06:5BDE
Code065BE0:
    ldh  [<H_GameState],a           ; 06:5BE0
    xor  a                          ; 06:5BE2
    ldh  [<H_GameSubstate],a        ; 06:5BE3
    ld   [$C1B0],a                  ; 06:5BE5
    ret                             ; 06:5BE8

Code065BE9:
    ld   a,$FF                      ; 06:5BE9
    ld   [$DE68],a                  ; 06:5BEB
    ld   a,$01                      ; 06:5BEE
    ld   [$C1B1],a                  ; 06:5BF0
    ret                             ; 06:5BF3

Data065BF4:                         ; 06:5BF4
.db $98,$50,$14,$28,$98,$58,$12,$28,\
    $98,$60,$10,$28,$AB,$50,$1A,$28,\
    $AB,$58,$18,$28,$AB,$60,$16,$28,\
    $C8,$58,$1E,$28,$C8,$65,$1C,$29,\
    $FF
Data065C15:                         ; 06:5C15
.db $8B,$60,$12,$28,$8B,$68,$10,$28,\
    $9B,$60,$18,$28,$9B,$68,$16,$28,\
    $9B,$70,$14,$28,$B0,$60,$1E,$2A,\
    $B8,$68,$1C,$29,$B8,$70,$1A,$29,\
    $A0,$20,$2C,$29,$A0,$28,$28,$29,\
    $A0,$30,$24,$29,$B0,$28,$2A,$29,\
    $B0,$30,$26,$28,$A8,$38,$20,$29,\
    $B8,$38,$22,$2A,$FF

Sub065C52:
    ld   a,[W_CurrentPlayer]        ; 06:5C52
    and  a                          ; 06:5C55
    jr   nz,Code065C5D              ; 06:5C56
    ld   de,Data065BF4              ; 06:5C58
    jr   Code065C60                 ; 06:5C5B
Code065C5D:
    ld   de,Data065C15              ; 06:5C5D
Code065C60:
    ld   hl,$C000                   ; 06:5C60
    ld   b,$00                      ; 06:5C63
Code065C65:
    ld   a,[de]                     ; 06:5C65
    cp   $FF                        ; 06:5C66
    jr   z,Code065C6F               ; 06:5C68
    ldi  [hl],a                     ; 06:5C6A
    inc  de                         ; 06:5C6B
    inc  b                          ; 06:5C6C
    jr   Code065C65                 ; 06:5C6D
Code065C6F:
    ldh  a,[<H_CameraY]             ; 06:5C6F
    ld   c,a                        ; 06:5C71
    ld   de,$0004                   ; 06:5C72
    ld   hl,$C000                   ; 06:5C75
    srl  b                          ; 06:5C78
    srl  b                          ; 06:5C7A
Code065C7C:
    ld   a,[hl]                     ; 06:5C7C
    sub  c                          ; 06:5C7D
    ld   [hl],a                     ; 06:5C7E
    add  hl,de                      ; 06:5C7F
    dec  b                          ; 06:5C80
    jr   nz,Code065C7C              ; 06:5C81
    ret                             ; 06:5C83

Sub065C84:
; Game state 3A
    ldh  a,[<H_GameSubstate]        ; 06:5C84
    rst  $00                        ; 06:5C86  Execute from 16-bit pointer table
.dw Code065C8F                      ; 06:5C87
.dw Code066280                      ; 06:5C89
.dw Code0662EB                      ; 06:5C8B
.dw Code0662FE                      ; 06:5C8D

Code065C8F:
    ld   a,$06                      ; 06:5C8F
    rst  $10                        ; 06:5C91  24-bit call
.dl SubL_0451A4                     ; 06:5C92
    ld   a,[$C1AD]                  ; 06:5C95
    dec  a                          ; 06:5C98
    ld   [$C1AD],a                  ; 06:5C99
    ret  nz                         ; 06:5C9C
    ld   a,[W_SPFlag]               ; 06:5C9D
    and  a                          ; 06:5CA0
    jr   nz,Code065CA8              ; 06:5CA1
    ld   hl,H_GameSubstate          ; 06:5CA3
    inc  [hl]                       ; 06:5CA6
    ret                             ; 06:5CA7

Code065CA8:
    xor  a                          ; 06:5CA8
    ldh  [<H_GameSubstate],a        ; 06:5CA9
    ld   a,$39                      ; 06:5CAB
    ldh  [<H_GameState],a           ; 06:5CAD
    ret                             ; 06:5CAF

Data065CB0:                         ; 06:5CB0
.incbin "data/Graphics/Data065CB0.bin"
Data065FB0:                         ; 06:5FB0
.incbin "data/Tilemaps/Data065FB0.bin"

Code066280:
    call Sub00126D                  ; 06:6280
    ld   a,$00                      ; 06:6283
    ldh  [<IE],a                    ; 06:6285
    ld   hl,Data065CB0              ; 06:6287
    ld   de,$8800                   ; 06:628A
    ld   bc,$0300                   ; 06:628D
    call CopyBytes                  ; 06:6290
    ld   a,$07                      ; 06:6293
    ldh  [<SVBK],a                  ; 06:6295
    ld   a,$00                      ; 06:6297
    ld   hl,W_PaletteBuffer         ; 06:6299
    ld   b,$06                      ; 06:629C
Code06629E:
    ldi  [hl],a                     ; 06:629E
    dec  b                          ; 06:629F
    jr   nz,Code06629E              ; 06:62A0
    ld   [hl],$FF                   ; 06:62A2
    inc  hl                         ; 06:62A4
    ld   [hl],$FF                   ; 06:62A5
    inc  a                          ; 06:62A7
    ldh  [<$FFC0],a                 ; 06:62A8
    xor  a                          ; 06:62AA
    ldh  [<SVBK],a                  ; 06:62AB
    ld   hl,W_PaletteBuffer         ; 06:62AD
    ld   b,$20                      ; 06:62B0
Code0662B2:
    ld   [hl],$FF                   ; 06:62B2
    inc  hl                         ; 06:62B4
    ld   [hl],$7F                   ; 06:62B5
    inc  hl                         ; 06:62B7
    dec  b                          ; 06:62B8
    jr   nz,Code0662B2              ; 06:62B9
    call Sub00128D                  ; 06:62BB
    ld   a,:Data065FB0              ; 06:62BE
    ld   b,a                        ; 06:62C0
    ld   de,$99C0                   ; 06:62C1
    ld   hl,Data065FB0              ; 06:62C4
    call LoadScreenTilemapVRAM      ; 06:62C7
    ld   a,$00                      ; 06:62CA
    ld   [$C0C4],a                  ; 06:62CC
    ldh  [<H_CameraXLow],a          ; 06:62CF
    ldh  [<H_CameraXHigh],a         ; 06:62D1
    ldh  [<$FFBB],a                 ; 06:62D3
    ld   a,$70                      ; 06:62D5
    ldh  [<H_CameraY],a             ; 06:62D7
    ld   a,$20                      ; 06:62D9
    ld   [$C1AD],a                  ; 06:62DB
    ld   a,$01                      ; 06:62DE
    ldh  [<IE],a                    ; 06:62E0
    ld   a,$87                      ; 06:62E2
    ldh  [<LCDC],a                  ; 06:62E4
    ld   hl,H_GameSubstate          ; 06:62E6
    inc  [hl]                       ; 06:62E9
    ret                             ; 06:62EA

Code0662EB:
    ld   a,$06                      ; 06:62EB
    rst  $10                        ; 06:62ED  24-bit call
.dl SubL_045221                     ; 06:62EE
    ld   a,[$C1AD]                  ; 06:62F1
    dec  a                          ; 06:62F4
    ld   [$C1AD],a                  ; 06:62F5
    ret  nz                         ; 06:62F8
    ld   hl,H_GameSubstate          ; 06:62F9
    inc  [hl]                       ; 06:62FC
    ret                             ; 06:62FD

Code0662FE:
    ldh  a,[<H_ButtonsPressed]      ; 06:62FE
    and  $01                        ; 06:6300
    ret  z                          ; 06:6302
    ld   a,$00                      ; 06:6303
    and  a                          ; 06:6305
    jr   nz,Code066313              ; 06:6306
    ld   a,[$C1B0]                  ; 06:6308
    and  a                          ; 06:630B
    jr   nz,Code066323              ; 06:630C
    ld   a,$14                      ; 06:630E
    ldh  [<H_GameState],a           ; 06:6310
    ret                             ; 06:6312

Code066313:
    ld   a,[$C362]                  ; 06:6313
    and  $80                        ; 06:6316
    jr   nz,Code06631E              ; 06:6318
    ld   a,$02                      ; 06:631A
    jr   Code066320                 ; 06:631C
Code06631E:
    ld   a,$04                      ; 06:631E
Code066320:
    ld   [$C1B0],a                  ; 06:6320
Code066323:
    ld   a,$FF                      ; 06:6323
    ld   [$DE68],a                  ; 06:6325
    xor  a                          ; 06:6328
    ld   [$C168],a                  ; 06:6329
    ld   a,$20                      ; 06:632C
    ld   [$C1AD],a                  ; 06:632E
    ld   a,$1C                      ; 06:6331
    ldh  [<H_GameState],a           ; 06:6333
    ret                             ; 06:6335

SprInitPtrs:                        ; 06:6336
; indexed by sprite ID -1
.dl Return024000                    ; 01
.dl Sub024E8D                       ; 02
.dl Sub024E8D                       ; 03
.dl Sub025758                       ; 04
.dl Sub0640E9                       ; 05
.dl Sub0640E9                       ; 06
.dl Sub0640E9                       ; 07
.dl Sub0640E9                       ; 08
.dl Code074A88                      ; 09
.dl Return024000                    ; 0A
.dl Return024000                    ; 0B
.dl Return024000                    ; 0C
.dl Return024000                    ; 0D
.dl Return024000                    ; 0E
.dl Code08595B                      ; 0F
.dl Code08595B                      ; 10
.dl Code08595B                      ; 11
.dl Code08595B                      ; 12
.dl Code08595B                      ; 13
.dl Code08595B                      ; 14
.dl Code08595B                      ; 15
.dl Code08595B                      ; 16
.dl Code025A7A                      ; 17
.dl Sub025EF4                       ; 18
.dl Code02609F                      ; 19
.dl Code026405                      ; 1A
.dl Code026D38                      ; 1B
.dl Code0644C6                      ; 1C
.dl Return024000                    ; 1D
.dl Return024000                    ; 1E
.dl Code064258                      ; 1F
.dl Return024000                    ; 20
.dl Return024000                    ; 21
.dl Code084000                      ; 22
.dl Return024000                    ; 23
.dl Code0842B0                      ; 24
.dl Return024000                    ; 25
.dl Sub084582                       ; 26
.dl Sub084582                       ; 27
.dl Sub084582                       ; 28
.dl Sub084582                       ; 29
.dl Sub084582                       ; 2A
.dl Sub084582                       ; 2B
.dl Return08494A                    ; 2C
.dl Return085BFA                    ; 2D
.dl Code084B2A                      ; 2E
.dl Return024000                    ; 2F
.dl Return024000                    ; 30
.dl Sub024E8D                       ; 31
.dl Return0279E9                    ; 32
.dl Code074706                      ; 33
.dl Code086263                      ; 34
.dl Return024000                    ; 35
.dl Code0852D2                      ; 36
.dl Code085EF2                      ; 37
.dl Code064000                      ; 38
.dl Code0856CB                      ; 39
.dl Code0856CB                      ; 3A
.dl Code0856CB                      ; 3B
.dl Code0858D1                      ; 3C
.dl Return024000                    ; 3D
.dl Return024000                    ; 3E
.dl Return024000                    ; 3F
.dl Return024000                    ; 40
.dl Return024000                    ; 41
.dl Code0742A2                      ; 42
.dl Return024000                    ; 43
.dl Return024000                    ; 44
.dl Return024000                    ; 45
.dl Return07511A                    ; 46
.dl Code06434C                      ; 47
.dl Return024000                    ; 48
.dl Code0648F4                      ; 49
.dl Code0648F4                      ; 4A
.dl Code0648F4                      ; 4B
.dl Code0648F4                      ; 4C
.dl Code085BF4                      ; 4D
.dl Code085904                      ; 4E
.dl Code085904                      ; 4F
.dl Code026F03                      ; 50
.dl Code026F03                      ; 51
.dl Code026F03                      ; 52
.dl Code026F03                      ; 53
.dl Code026F03                      ; 54
.dl Code026F03                      ; 55
.dl Code02704A                      ; 56
.dl Code02704A                      ; 57
.dl Code02704A                      ; 58
.dl Code02704A                      ; 59
.dl Code02704A                      ; 5A
.dl Code02704A                      ; 5B
.dl Code02704A                      ; 5C
.dl Code02704A                      ; 5D
.dl Code02704A                      ; 5E
.dl Code02704A                      ; 5F
.dl Code027C9A                      ; 60
.dl Code027C9A                      ; 61
.dl Code027C9A                      ; 62
.dl Code027C9A                      ; 63
.dl Code02704A                      ; 64

SprMainPtrs:                        ; 06:6462
; indexed by sprite ID -1
.dl Code0244F5                      ; 01
.dl Code024EDF                      ; 02
.dl Code024EDF                      ; 03
.dl Code025777                      ; 04
.dl Code064199                      ; 05
.dl Code064199                      ; 06
.dl Code064199                      ; 07
.dl Code064199                      ; 08
.dl Code074B1C                      ; 09
.dl Code0649E0                      ; 0A
.dl Code02480F                      ; 0B
.dl Code024A1D                      ; 0C
.dl Code0240A6                      ; 0D
.dl Code025905                      ; 0E
.dl Code0859A2                      ; 0F
.dl Code0859A2                      ; 10
.dl Code0859A2                      ; 11
.dl Code0859A2                      ; 12
.dl Code0859A2                      ; 13
.dl Code0859A2                      ; 14
.dl Code0859A2                      ; 15
.dl Code0859A2                      ; 16
.dl Code025AFF                      ; 17
.dl Code025F66                      ; 18
.dl Code02616E                      ; 19
.dl Code0264AC                      ; 1A
.dl Code026D6A                      ; 1B
.dl Code064565                      ; 1C
.dl Code0275E4                      ; 1D
.dl Code02772C                      ; 1E
.dl Code064273                      ; 1F
.dl Code027835                      ; 20
.dl Code064A44                      ; 21
.dl Code08403A                      ; 22
.dl Code0841D6                      ; 23
.dl Code084334                      ; 24
.dl Code084479                      ; 25
.dl Code08462D                      ; 26
.dl Code08462D                      ; 27
.dl Code08462D                      ; 28
.dl Code08462D                      ; 29
.dl Code08462D                      ; 2A
.dl Code08462D                      ; 2B
.dl Code084959                      ; 2C
.dl Code085CAB                      ; 2D
.dl Code084BA5                      ; 2E
.dl Code084FA9                      ; 2F
.dl Code08509E                      ; 30
.dl Code024EDF                      ; 31
.dl Code0279EE                      ; 32
.dl Code0747B4                      ; 33
.dl Code086275                      ; 34
.dl Code08527B                      ; 35
.dl Code085335                      ; 36
.dl Code085FAC                      ; 37
.dl Code064045                      ; 38
.dl Code08576C                      ; 39
.dl Code08576C                      ; 3A
.dl Code08576C                      ; 3B
.dl Code0858E4                      ; 3C
.dl Return027A75                    ; 3D
.dl Code027AFD                      ; 3E
.dl Code027BD4                      ; 3F
.dl Empty06658E                     ; 40
.dl Code074079                      ; 41
.dl Code0742D4                      ; 42
.dl Code0743F3                      ; 43
.dl Code07444E                      ; 44
.dl Code07494E                      ; 45
.dl Code07512B                      ; 46
.dl Code064377                      ; 47
.dl Code06487B                      ; 48
.dl Return024000                    ; 49
.dl Return024000                    ; 4A
.dl Return024000                    ; 4B
.dl Return024000                    ; 4C
.dl Code085CAB                      ; 4D
.dl Return024000                    ; 4E
.dl Return024000                    ; 4F
.dl Code026F5E                      ; 50
.dl Code026F5E                      ; 51
.dl Code026F5E                      ; 52
.dl Code026F5E                      ; 53
.dl Code026F5E                      ; 54
.dl Code026F5E                      ; 55
.dl Code0270D1                      ; 56
.dl Code0270D1                      ; 57
.dl Code0270D1                      ; 58
.dl Code0270D1                      ; 59
.dl Code0270D1                      ; 5A
.dl Code0270D1                      ; 5B
.dl Code0270D1                      ; 5C
.dl Code0270D1                      ; 5D
.dl Code0270D1                      ; 5E
.dl Code0270D1                      ; 5F
.dl Code027CF6                      ; 60
.dl Code027CF6                      ; 61
.dl Code027CF6                      ; 62
.dl Code027CF6                      ; 63
.dl Code0270D1                      ; 64
Empty06658E:
