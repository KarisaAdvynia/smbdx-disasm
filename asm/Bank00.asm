.bank $00 slot 0

; rst handlers
.orga $0000
    jp   rst_ExecutePtrTable        ; 00:0000  rst $00
.orga $0008
    jp   rst_ExecutePtrTableLong    ; 00:0008  rst $08 (unused)
.orga $0010
    jp   rst_CallLong               ; 00:0010  rst $10
.orga $0018
    jp   rst_ReturnLong             ; 00:0018  rst $18

; Interrupt handlers
.orga $0040
    jp   VBlankInterrupt            ; 00:0040
.orga $0048
    jp   LCDInterrupt               ; 00:0048
.orga $0050
    jp   TimerInterrupt             ; 00:0050
.orga $0058
    jp   SerialInterrupt            ; 00:0058
.orga $0060
    reti                            ; 00:0060  Joypad interrupt

.orga $0100
    nop                             ; 00:0100
    jp   CodeStart                  ; 00:0101

; Internal header                     00:0104-0150

.orga $0150
CodeStart:
    cp   $11                        ; 00:0150  if GBC or GBA, A starts with 11
    jr   nz,Code000168              ; 00:0152
    ldh  a,[<KEY1]                  ; 00:0154  GBC speed register
    bit  7,a                        ; 00:0156 \ if already fast mode, don't switch
    jr   nz,Code000167              ; 00:0158 /
    ld   a,$30                      ; 00:015A \ set joypad register to 30
    ldh  [<JOYP],a                  ; 00:015C /  (part of speed switching, apparently)
    ld   a,$81                      ; 00:015E \ prepare speed switch
    ldh  [<KEY1],a                  ; 00:0160 /
    xor  a                          ; 00:0162 \ disable interrupts
    ldh  [<IE],a                    ; 00:0163 /
    stop                            ; 00:0165  switch to fast mode
    nop                             ; 00:0166
Code000167:
    xor  a                          ; 00:0167
Code000168:
    ld   [W_NonGBCError],a          ; 00:0168  $C0C0 = 0 normally, nonzero if on non-color GB
    call Sub00126D                  ; 00:016B
    ld   sp,$CFFF                   ; 00:016E  set stack pointer
    ld   a,:Sub0B6074               ; 00:0171
    call SetROMBank                 ; 00:0173
    call Sub0B6074                  ; 00:0176
    ld   a,:Sub064B33               ; 00:0179
    call SetROMBank                 ; 00:017B
    call Sub064B33                  ; 00:017E
    ld   a,$09                      ; 00:0181
    ldh  [<IE],a                    ; 00:0183
    ldh  [<$FF93],a                 ; 00:0185
    ld   a,$00                      ; 00:0187
    ldh  [<IF],a                    ; 00:0189
    ld   a,$87                      ; 00:018B
    ldh  [<LCDC],a                  ; 00:018D
    ld   a,:Sub1F4000               ; 00:018F
    ld   [ROMBANK],a                ; 00:0191
    call Sub1F4000                  ; 00:0194
    ld   a,$10                      ; 00:0197
    ldh  [<$FFB4],a                 ; 00:0199
    ld   a,$00                      ; 00:019B
    ld   [$DA78],a                  ; 00:019D
    ld   a,[W_NonGBCError]          ; 00:01A0
    and  a                          ; 00:01A3
    jr   z,Code0001AA               ; 00:01A4
    ld   a,$37                      ; 00:01A6  if not GBC, display error message
    ldh  [<H_GameState],a           ; 00:01A8
Code0001AA:
    ei                              ; 00:01AA
MainLoop:
    call Sub0011C8                  ; 00:01AB
    ld   a,:Sub04492A               ; 00:01AE
    call SetROMBank                 ; 00:01B0
    call Sub04492A                  ; 00:01B3
    ld   hl,H_GlobalTimer           ; 00:01B6
    inc  [hl]                       ; 00:01B9
    ldh  a,[<H_GameState]           ; 00:01BA
    cp   $23                        ; 00:01BC
    jr   z,Code0001EA               ; 00:01BE
    cp   $25                        ; 00:01C0
    jr   z,Code0001EA               ; 00:01C2
    cp   $27                        ; 00:01C4
    jr   z,Code0001EA               ; 00:01C6
    cp   $24                        ; 00:01C8
    jr   z,Code0001EA               ; 00:01CA
    cp   $26                        ; 00:01CC
    jr   z,Code0001EA               ; 00:01CE
    cp   $28                        ; 00:01D0
    jr   z,Code0001EA               ; 00:01D2
    ld   a,[W_NonGBCError]          ; 00:01D4
    and  a                          ; 00:01D7
    jr   nz,Code0001EA              ; 00:01D8
    ld   a,$00                      ; 00:01DA
    and  a                          ; 00:01DC
    jr   z,Code0001EA               ; 00:01DD
    ldh  a,[<H_ButtonsHeld]         ; 00:01DF
    and  $0F                        ; 00:01E1
    cp   $0F                        ; 00:01E3
    jr   nz,Code0001EA              ; 00:01E5
    jp   Code000167                 ; 00:01E7
Code0001EA:
    ld   a,[$C1B1]                  ; 00:01EA
    and  a                          ; 00:01ED
    jr   z,Code0001F3               ; 00:01EE
    jp   Code000167                 ; 00:01F0
Code0001F3:
    call RunGameState               ; 00:01F3  execute code for current game state
    call Return001048               ; 00:01F6
    call Sub001101                  ; 00:01F9
    call Sub000F13                  ; 00:01FC
    ld   a,:Sub074000               ; 00:01FF
    call SetROMBank                 ; 00:0201
    call Sub074000                  ; 00:0204
    ld   a,[W_GameMode]             ; 00:0207
    cp   $02                        ; 00:020A
    jr   nz,Code000256              ; 00:020C
    ldh  a,[<H_GameState]           ; 00:020E
    cp   $23                        ; 00:0210
    jr   c,Code000256               ; 00:0212
    xor  a                          ; 00:0214
    ldh  [<$FF91],a                 ; 00:0215
Code000217:
    ldh  a,[<$FF91]                 ; 00:0217
    and  a                          ; 00:0219
    jr   z,Code000217               ; 00:021A
    ld   hl,$8000                   ; 00:021C
    ld   a,[$DA69]                  ; 00:021F
    cp   $01                        ; 00:0222
    jp   nz,MainLoop                ; 00:0224
    ld   a,[$DA6D]                  ; 00:0227
    cp   $01                        ; 00:022A
    jp   nz,MainLoop                ; 00:022C
Code00022F:
    dec  hl                         ; 00:022F
    ld   a,l                        ; 00:0230
    or   h                          ; 00:0231
    jp   z,Code000249               ; 00:0232
    ld   a,[$DA70]                  ; 00:0235
    and  a                          ; 00:0238
    jp   nz,MainLoop                ; 00:0239
    ld   a,[$DA6B]                  ; 00:023C
    and  a                          ; 00:023F
    jr   z,Code00022F               ; 00:0240
    xor  a                          ; 00:0242
    ld   [$DA6B],a                  ; 00:0243
    jp   MainLoop                   ; 00:0246
Code000249:
    ld   a,:Sub065156               ; 00:0249
    call SetROMBank                 ; 00:024B
    ld   b,$01                      ; 00:024E
    call Sub065156                  ; 00:0250
    jp   MainLoop                   ; 00:0253
Code000256:
    xor  a                          ; 00:0256
    ldh  [<$FF91],a                 ; 00:0257
    halt                            ; 00:0259
    nop                             ; 00:025A
Code00025B:
    ldh  a,[<$FF91]                 ; 00:025B
    and  a                          ; 00:025D
    jr   z,Code00025B               ; 00:025E
    jp   MainLoop                   ; 00:0260

RunGameState:
    ldh  a,[<H_GameState]           ; 00:0263
    rst  $00                        ; 00:0265  Execute from 16-bit pointer table
.dw PreTitleInit                    ; 00
.dw PreTitleMain                    ; 01
.dw TitleScreenInit                 ; 02
.dw TitleScreenMain                 ; 03
.dw OverworldInit                   ; 04
.dw OverworldMain                   ; 05
.dw LevelLoad_Main                  ; 06
.dw OverworldInit                   ; 07
.dw OverworldMain                   ; 08
.dw LevelLoad_Main                  ; 09
.dw LevelLoad_Main                  ; 0A
.dw NormalGameplay                  ; 0B
.dw PauseWrapper                    ; 0C
.dw SublevelLoad_Main               ; 0D
.dw Code000A09                      ; 0E
.dw GameOverWrapper                 ; 0F
.dw Code000A1B                      ; 10
.dw Code000A24                      ; 11
.dw Code000A2D                      ; 12
.dw Code000A36                      ; 13
.dw Code000A3F                      ; 14
.dw Code000A60                      ; 15
.dw FileSelectInitWrapper           ; 16
.dw FileSelectMain                  ; 17
.dw MainMenu_Init                   ; 18
.dw MainMenu_Main                   ; 19
.dw Code000B16                      ; 1A
.dw Code000B1F                      ; 1B
.dw AwardCutsceneWrapper            ; 1C
.dw ChalMenuInit                    ; 1D
.dw ChalMenu_Wrapper                ; 1E
.dw ChalYoshiHatch_Wrapper          ; 1F
.dw ChalResultsInit                 ; 20
.dw ChalResultsMain_Wrapper         ; 21
.dw ChalMiss_Wrapper                ; 22
.dw Code0004E5                      ; 23
.dw Code0005FB                      ; 24
.dw YouVsBooResults_InitWrapper     ; 25
.dw Code000BD4                      ; 26
.dw Code00069B                      ; 27
.dw Code0006C0                      ; 28
.dw Code000A69                      ; 29
.dw Code000A7A                      ; 2A
.dw RecordsWrapper                  ; 2B
.dw AlbumWrapper                    ; 2C
.dw ToyBoxWrapper                   ; 2D
.dw PrintMenuBank00Wrapper          ; 2E
.dw Code000BF2                      ; 2F
.dw Code000BFB                      ; 30
.dw Code0039C2                      ; 31
.dw Code0039CB                      ; 32
.dw YouVsBooMenu_Init               ; 33
.dw YouVsBooMenu_Wrapper            ; 34
.dw YouVsBooRace_Init               ; 35
.dw YouVsBooRace_Main               ; 36
.dw NonGBCError_Wrapper             ; 37
.dw SPTitle_Wrapper                 ; 38
.dw Credits_Wrapper                 ; 39
.dw Code000C04                      ; 3A
.dw Code0007FE                      ; 3B
.dw Code000879                      ; 3C
.dw Code0008B1                      ; 3D
.dw Code000974                      ; 3E
.dw Code00099E                      ; 3F
.dw Code0009B3                      ; 40
.dw ToadPeachRoom_Wrapper           ; 41

LevelLoad_Main:
; Game state 06/09/0A
    ld   a,[$0003]                  ; 00:02EA
    and  a                          ; 00:02ED
    jr   z,@Code0002F5              ; 00:02EE  if debug byte is set...
    ld   a,$20                      ; 00:02F0  force load sublevel 20
    ld   [W_SublevelID],a           ; 00:02F2   (debug level in Original, 9-1 in SP)
@Code0002F5:
    ld   a,:Sub0B61AC               ; 00:02F5
    call SetROMBank                 ; 00:02F7
    call Sub0B61AC                  ; 00:02FA
    call Sub0003A4                  ; 00:02FD
    call LoadSublevelBrickGraphics  ; 00:0300
    ld   l,$34                      ; 00:0303  34: Original pipe intro
    ld   a,[W_SPFlag]               ; 00:0305
    and  a                          ; 00:0308
    jr   z,@Code00030D              ; 00:0309
    ld   l,$62                      ; 00:030B  62: SP pipe intro
@Code00030D:
    ld   a,[W_SublevelID]           ; 00:030D
    cp   l                          ; 00:0310
    jr   nz,@Code00031D             ; 00:0311
    ld   a,$10                      ; 00:0313  if pipe intro, set player state to pipe intro
    ld   [W_PlayerState],a          ; 00:0315
    ld   a,$01                      ; 00:0318
    ld   [$C1F3],a                  ; 00:031A
@Code00031D:
    ld   hl,$D2F8                   ; 00:031D
    ld   [hl],$00                   ; 00:0320
    ld   a,[W_HardFlag]             ; 00:0322
    and  a                          ; 00:0325
    jr   nz,@Code00032F             ; 00:0326
    ld   a,[W_LevelID]              ; 00:0328
    cp   $12                        ; 00:032B  12: 5-3
    jr   c,@Code000330              ; 00:032D
@Code00032F:
    inc  [hl]                       ; 00:032F  if hard mode, or 5-3 or later, increment $D2F8
@Code000330:
    ldh  a,[<H_CameraXLow]          ; 00:0330
    ld   [$C175],a                  ; 00:0332
    ldh  a,[<H_CameraY]             ; 00:0335
    ld   [$C176],a                  ; 00:0337
    xor  a                          ; 00:033A
    ldh  [<SCX],a                   ; 00:033B
    ldh  [<SCY],a                   ; 00:033D
    ld   a,$07                      ; 00:033F
    ldh  [<LYC],a                   ; 00:0341
    ld   a,:Sub037376               ; 00:0343
    call SetROMBank                 ; 00:0345
    call Sub037376                  ; 00:0348
    ld   a,:Sub0444A6               ; 00:034B
    call SetROMBank                 ; 00:034D
    call Sub0444A6                  ; 00:0350
    ld   a,$01                      ; 00:0353
    ld   [$C0C4],a                  ; 00:0355
    ld   a,$03                      ; 00:0358
    ldh  [<IE],a                    ; 00:035A
    ld   a,$87                      ; 00:035C
    ldh  [<LCDC],a                  ; 00:035E
    call Sub0449E7                  ; 00:0360
    call StatusBarInit              ; 00:0363
    ld   a,$0B                      ; 00:0366
    ldh  [<H_GameState],a           ; 00:0368
    ret                             ; 00:036A

LoadSublevelBrickGraphics:
; Change brick graphics based on sublevel type
    ldh  a,[<H_PlInitY_SubLvType]   ; 00:036B
    and  $0F                        ; 00:036D
    cp   $01                        ; 00:036F
    jr   z,@UndergroundOrCastle     ; 00:0371
    cp   $04                        ; 00:0373
    jr   nz,@Else                   ; 00:0375
@UndergroundOrCastle:
    ld   a,:Gr_NormalGameplay       ; 00:0377 \ runs if underground/castle
    ld   [ROMBANK],a                ; 00:0379
    ld   a,$00                      ; 00:037C
    ldh  [<VBK],a                   ; 00:037E
    ld   hl,Gr_NormalGameplay+$830  ; 00:0380  load bricks without lines above
    ld   de,$8800                   ; 00:0383
    ld   bc,$0030                   ; 00:0386
    call CopyBytes                  ; 00:0389
    jr   @Return                    ; 00:038C /
@Else:
    ld   a,:Gr_NormalGameplay       ; 00:038E \ runs if any other sublevel type
    ld   [ROMBANK],a                ; 00:0390
    ld   a,$00                      ; 00:0393
    ldh  [<VBK],a                   ; 00:0395
    ld   hl,Gr_NormalGameplay+$800  ; 00:0397  load bricks with lines above
    ld   de,$8800                   ; 00:039A
    ld   bc,$0030                   ; 00:039D
    call CopyBytes                  ; 00:03A0 /
@Return:
    ret                             ; 00:03A3

Sub0003A4:
    ldh  a,[<H_GameState]           ; 00:03A4
    sub  $06                        ; 00:03A6  06/09/0A -> 00/03/04
    srl  a                          ; 00:03A8  06/09/0A -> 00/01/02
    rst  $00                        ; 00:03AA  Execute from 16-bit pointer table
.dw Sub0003B1                       ; 00:03AB
.dw Code0003E5                      ; 00:03AD
.dw Sub0003B1                       ; 00:03AF

Sub0003B1:
    ld   a,:Sub0371C5               ; 00:03B1
    call SetROMBank                 ; 00:03B3
    call Sub0371C5                  ; 00:03B6
    call Sub034A86                  ; 00:03B9
    ld   a,:Sub04514D               ; 00:03BC
    call SetROMBank                 ; 00:03BE
    call Sub04514D                  ; 00:03C1
    call Sub00375A                  ; 00:03C4
    ld   a,[W_ChallengeFlag]        ; 00:03C7
    and  a                          ; 00:03CA
    jr   z,@Code0003D0              ; 00:03CB
    call LoadChallengeObjData       ; 00:03CD
@Code0003D0:
    call Sub002A18                  ; 00:03D0
    call Sub003593                  ; 00:03D3
    ld   a,:Sub0371A9               ; 00:03D6
    call SetROMBank                 ; 00:03D8
    ld   a,[$C1EF]                  ; 00:03DB
    and  a                          ; 00:03DE
    jr   z,Code000414               ; 00:03DF
    call Sub0371A9                  ; 00:03E1
    ret                             ; 00:03E4

Code0003E5:
    ld   a,:Sub0371C9               ; 00:03E5
    call SetROMBank                 ; 00:03E7
    ld   a,$00                      ; 00:03EA
    ld   [$C182],a                  ; 00:03EC
    ld   [$C1B3],a                  ; 00:03EF
    call Sub0371C9                  ; 00:03F2
    ld   a,:Sub04514D               ; 00:03F5
    call SetROMBank                 ; 00:03F7
    call Sub04514D                  ; 00:03FA
    call Sub00375A                  ; 00:03FD
    ld   a,[W_ChallengeFlag]        ; 00:0400
    and  a                          ; 00:0403
    jr   z,@Code000409              ; 00:0404
    call LoadChallengeObjData       ; 00:0406
@Code000409:
    call Sub002A18                  ; 00:0409
    call Sub003593                  ; 00:040C
    ld   a,:Sub037178               ; 00:040F
    call SetROMBank                 ; 00:0411
Code000414:
    call Sub037178                  ; 00:0414
    ret                             ; 00:0417

NormalGameplay:
; Game state 0B
    ldh  a,[<H_ButtonsPressed]      ; 00:0418
    and  $08                        ; 00:041A  08: Start
    jr   z,@Code000434              ; 00:041C
    ld   a,[$C1F3]                  ; 00:041E
    and  a                          ; 00:0421
    jr   nz,@Code000434             ; 00:0422
    xor  a                          ; 00:0424 \ pause the game
    ld   [$C168],a                  ; 00:0425
    ld   [$C174],a                  ; 00:0428
    ld   a,$0C                      ; 00:042B
    ldh  [<H_GameState],a           ; 00:042D
    ld   a,$4D                      ; 00:042F
    ldh  [<$FFF2],a                 ; 00:0431
    ret                             ; 00:0433 /
@Code000434:
    ldh  a,[<H_GameState]           ; 00:0434
    cp   $24                        ; 00:0436
    jp   z,@Code000445              ; 00:0438
    ldh  a,[<H_CameraXLow]          ; 00:043B
    ld   [$C175],a                  ; 00:043D
    ldh  a,[<H_CameraY]             ; 00:0440
    ld   [$C176],a                  ; 00:0442
@Code000445:
    ld   a,:Sub0341C2               ; 00:0445
    call SetROMBank                 ; 00:0447
    call Sub0341C2                  ; 00:044A
    call Sub035A3C                  ; 00:044D
    call Sub001831                  ; 00:0450
    ld   a,:Sub037376               ; 00:0453
    call SetROMBank                 ; 00:0455
    call Sub037376                  ; 00:0458
    call Sub037863                  ; 00:045B
    call Sub002C88                  ; 00:045E
    call Sub003643                  ; 00:0461
    call Sub003AB0                  ; 00:0464
    call Sub003AFF                  ; 00:0467
    ld   a,:Sub0B62BF               ; 00:046A
    call SetROMBank                 ; 00:046C
    call Sub0B62BF                  ; 00:046F
    ret                             ; 00:0472

SublevelLoad_Main:
; Game state 0D
    ldh  a,[<H_CameraXLow]          ; 00:0473
    ld   [$C175],a                  ; 00:0475
    ldh  a,[<H_CameraY]             ; 00:0478
    ld   [$C176],a                  ; 00:047A
    call Sub00126D                  ; 00:047D
    ld   a,$00                      ; 00:0480
    ldh  [<IE],a                    ; 00:0482
    ld   a,:Sub0371C9               ; 00:0484
    call SetROMBank                 ; 00:0486
    call Sub0371C9                  ; 00:0489
    ld   a,$00                      ; 00:048C
    ld   [$C174],a                  ; 00:048E
    ld   a,$0B                      ; 00:0491
    ldh  [<H_GameState],a           ; 00:0493
    call Sub03769F                  ; 00:0495
    ld   a,[$C181]                  ; 00:0498
    push af                         ; 00:049B
    call Sub00375A                  ; 00:049C
    pop  af                         ; 00:049F
    ld   [$C181],a                  ; 00:04A0
    ld   a,[W_ChallengeFlag]        ; 00:04A3
    and  a                          ; 00:04A6
    jr   z,@Code0004AC              ; 00:04A7
    call LoadChallengeObjData       ; 00:04A9
@Code0004AC:
    call Sub002A18                  ; 00:04AC
    ld   a,:Sub0444A6               ; 00:04AF
    call SetROMBank                 ; 00:04B1
    call Sub0444A6                  ; 00:04B4
    call Sub003593                  ; 00:04B7
    call LoadSublevelBrickGraphics  ; 00:04BA
    ld   a,:Sub037376               ; 00:04BD
    call SetROMBank                 ; 00:04BF
    call Sub037376                  ; 00:04C2
    ldh  a,[<H_CameraXLow]          ; 00:04C5
    ld   [$C175],a                  ; 00:04C7
    ldh  a,[<H_CameraY]             ; 00:04CA
    ld   [$C176],a                  ; 00:04CC
    ld   a,$01                      ; 00:04CF
    ld   [$C0C4],a                  ; 00:04D1
    ld   a,$03                      ; 00:04D4
    ldh  [<IE],a                    ; 00:04D6
    ld   a,$87                      ; 00:04D8
    ldh  [<LCDC],a                  ; 00:04DA
    ld   a,:SetSublevelMusic        ; 00:04DC
    call SetROMBank                 ; 00:04DE
    call SetSublevelMusic           ; 00:04E1
    ret                             ; 00:04E4

Code0004E5:
; Game state 23
    ld   a,$01                      ; 00:04E5
    ld   [$C0C1],a                  ; 00:04E7
    call Sub0004EE                  ; 00:04EA
    ret                             ; 00:04ED

Sub0004EE:
    ld   a,[$C168]                  ; 00:04EE
    rst  $00                        ; 00:04F1  Execute from 16-bit pointer table
.dw Sub000529                       ; 00:04F2
.dw Code000536                      ; 00:04F4
.dw Code0005C2                      ; 00:04F6
.dw Code0005D3                      ; 00:04F8

Code0004FA:
    ld   a,[$DA6A]                  ; 00:04FA
    cp   $01                        ; 00:04FD
    jr   z,@Code000506              ; 00:04FF
    ld   a,$01                      ; 00:0501
    ld   [$DA78],a                  ; 00:0503
@Code000506:
    ld   a,:Sub064DBE               ; 00:0506
    call SetROMBank                 ; 00:0508
    call Sub064DBE                  ; 00:050B
    cp   $01                        ; 00:050E
    jr   z,@Return                  ; 00:0510
    cp   $02                        ; 00:0512
    jp   z,@Return                  ; 00:0514
    ld   a,[$C168]                  ; 00:0517
    inc  a                          ; 00:051A
    ld   [$C168],a                  ; 00:051B
    ld   a,:Sub0B572E               ; 00:051E
    call SetROMBank                 ; 00:0520
    call Sub0B572E                  ; 00:0523
    jr   @Return                    ; 00:0526
@Return:
    ret                             ; 00:0528

Sub000529:
    xor  a                          ; 00:0529
    ld   [$DA78],a                  ; 00:052A
    ld   a,:Sub064E88               ; 00:052D
    call SetROMBank                 ; 00:052F
    call Sub064E88                  ; 00:0532
    ret                             ; 00:0535

Code000536:
    ld   a,:Sub0B6204               ; 00:0536
    call SetROMBank                 ; 00:0538
    call Sub0B6204                  ; 00:053B
    call Sub0003B1                  ; 00:053E
    call LoadSublevelBrickGraphics  ; 00:0541
    xor  a                          ; 00:0544
    ld   [W_PlayerCoins],a          ; 00:0545
    ld   a,:Sub0371C5               ; 00:0548
    call SetROMBank                 ; 00:054A
    call Sub0371C5                  ; 00:054D
    call Sub0377DF                  ; 00:0550
    call Sub0377E4                  ; 00:0553
    ld   a,:Sub0B604D               ; 00:0556
    call SetROMBank                 ; 00:0558
    call Sub0B604D                  ; 00:055B
    ld   a,:Sub0444A6               ; 00:055E
    call SetROMBank                 ; 00:0560
    call Sub0444A6                  ; 00:0563
    ld   a,:Sub0B42B8               ; 00:0566
    call SetROMBank                 ; 00:0568
    call Sub0B42B8                  ; 00:056B
    ld   a,:Sub0740F4               ; 00:056E
    call SetROMBank                 ; 00:0570
    ld   d,$00                      ; 00:0573
    call Sub0740F4                  ; 00:0575
    ld   a,:Sub034033               ; 00:0578
    call SetROMBank                 ; 00:057A
    call Sub034033                  ; 00:057D
    call Sub037981                  ; 00:0580
    ldh  a,[<H_PlInitY_SubLvType]   ; 00:0583
    and  $0F                        ; 00:0585
    cp   $02                        ; 00:0587
    jr   nz,@Code000593             ; 00:0589
    ld   a,$08                      ; 00:058B
    ld   [$C50A],a                  ; 00:058D
    ld   [$C58A],a                  ; 00:0590
@Code000593:
    xor  a                          ; 00:0593
    ld   [$D977],a                  ; 00:0594
    ldh  [<SB],a                    ; 00:0597
    ld   [$D9A7],a                  ; 00:0599
    inc  a                          ; 00:059C
    ld   [$C0C4],a                  ; 00:059D
    ld   a,$87                      ; 00:05A0
    ldh  [<LCDC],a                  ; 00:05A2
    ldh  a,[<IE]                    ; 00:05A4
    or   $0F                        ; 00:05A6
    ldh  [<IE],a                    ; 00:05A8
    ld   a,:SetLevelTimerRace       ; 00:05AA
    call SetROMBank                 ; 00:05AC
    call SetLevelTimerRace          ; 00:05AF
    call StatusBarInit              ; 00:05B2
    ld   a,$82                      ; 00:05B5
    ldh  [<SC],a                    ; 00:05B7
    xor  a                          ; 00:05B9
    ld   [$C181],a                  ; 00:05BA
    ld   hl,$C168                   ; 00:05BD
    inc  [hl]                       ; 00:05C0
    ret                             ; 00:05C1

Code0005C2:
    ld   a,:Sub034033               ; 00:05C2
    call SetROMBank                 ; 00:05C4
    call Sub034033                  ; 00:05C7

Sub0005CA:
    ld   a,:Sub064F29               ; 00:05CA
    call SetROMBank                 ; 00:05CC
    call Sub064F29                  ; 00:05CF
    ret                             ; 00:05D2

Code0005D3:
    ld   a,:Sub064FBF               ; 00:05D3
    call SetROMBank                 ; 00:05D5
    call Sub064FBF                  ; 00:05D8
    ld   a,:Sub034033               ; 00:05DB
    call SetROMBank                 ; 00:05DD
    call Sub034033                  ; 00:05E0
    ld   a,[$C168]                  ; 00:05E3
    and  a                          ; 00:05E6
    jr   nz,Return0005F1            ; 00:05E7
    ld   a,$FF                      ; 00:05E9
    ld   [$DE68],a                  ; 00:05EB
    ld   [$C36F],a                  ; 00:05EE
Return0005F1:
    ret                             ; 00:05F1

Sub0005F2:
    ld   a,:Sub064FBF               ; 00:05F2
    call SetROMBank                 ; 00:05F4
    call Sub064FBF                  ; 00:05F7
    ret                             ; 00:05FA

Code0005FB:
; Game state 24
    ld   a,:Sub064B87               ; 00:05FB
    call SetROMBank                 ; 00:05FD
    call Sub064B87                  ; 00:0600
    and  a                          ; 00:0603
    jr   nz,Return00067D            ; 00:0604
    call Sub00067E                  ; 00:0606
    ldh  a,[<H_CameraXLow]          ; 00:0609
    ld   [$C175],a                  ; 00:060B
    ldh  a,[<H_CameraY]             ; 00:060E
    ld   [$C176],a                  ; 00:0610
    ld   a,[$C38D]                  ; 00:0613
    and  a                          ; 00:0616
    jr   nz,Code00061F              ; 00:0617
    xor  a                          ; 00:0619
    ld   [$C168],a                  ; 00:061A
    jr   Code00064E                 ; 00:061D
Code00061F:
    ld   a,[$C168]                  ; 00:061F
    and  a                          ; 00:0622
    jr   z,Code00062F               ; 00:0623
Code000625:
    ld   a,:Sub044AC3               ; 00:0625
    call SetROMBank                 ; 00:0627
    call Sub044AC3                  ; 00:062A
    jr   Return00067D               ; 00:062D
Code00062F:
    ld   hl,$DA76                   ; 00:062F
    ld   a,[$DA77]                  ; 00:0632
    or   [hl]                       ; 00:0635
    and  $08                        ; 00:0636
    jr   z,Code00064E               ; 00:0638
    ld   hl,$C5BB                   ; 00:063A
    ld   a,[$C53B]                  ; 00:063D
    or   [hl]                       ; 00:0640
    and  a                          ; 00:0641
    jr   nz,Code00064E              ; 00:0642
    ld   a,$4D                      ; 00:0644
    ldh  [<$FFF2],a                 ; 00:0646
    ld   hl,$C168                   ; 00:0648
    inc  [hl]                       ; 00:064B
    jr   Code000625                 ; 00:064C
Code00064E:
    ldh  a,[<H_GlobalTimer]         ; 00:064E
    push af                         ; 00:0650
    ld   a,[$DA79]                  ; 00:0651
    ldh  [<H_GlobalTimer],a         ; 00:0654
    ld   a,:Sub034033               ; 00:0656
    call SetROMBank                 ; 00:0658
    call Sub034033                  ; 00:065B
    call Sub001831                  ; 00:065E
    ld   a,:Sub037863               ; 00:0661
    call SetROMBank                 ; 00:0663
    call Sub037863                  ; 00:0666
    pop  af                         ; 00:0669
    ldh  [<H_GlobalTimer],a         ; 00:066A
    call Sub003643                  ; 00:066C
    call Sub003AB0                  ; 00:066F
    call Sub003BBB                  ; 00:0672
    ld   a,:Sub0B62BF               ; 00:0675
    call SetROMBank                 ; 00:0677
    call Sub0B62BF                  ; 00:067A
Return00067D:
    ret                             ; 00:067D

Sub00067E:
    ld   a,$00                      ; 00:067E
    and  a                          ; 00:0680
    ret  z                          ; 00:0681
    ld   a,[$DA74]                  ; 00:0682
    and  $0F                        ; 00:0685
    cp   $0F                        ; 00:0687
    jr   nz,Code00068E              ; 00:0689
    jp   Code000167                 ; 00:068B
Code00068E:
    ld   a,[$DA75]                  ; 00:068E
    and  $0F                        ; 00:0691
    cp   $0F                        ; 00:0693
    jr   nz,Return00069A            ; 00:0695
    jp   Code000167                 ; 00:0697
Return00069A:
    ret                             ; 00:069A

Code00069B:
; Game state 27 wrapper
    call Sub00069F                  ; 00:069B
    ret                             ; 00:069E

Sub00069F:
; Game state 27
    ld   a,[$C168]                  ; 00:069F
    rst  $00                        ; 00:06A2  Execute from 16-bit pointer table
.dw Code0004FA                      ; 00:06A3
.dw Sub000529                       ; 00:06A5
.dw Code0006AD                      ; 00:06A7
.dw Code0006AF                      ; 00:06A9
.dw Code0006B4                      ; 00:06AB

Code0006AD:
    jr   Code0006FC                 ; 00:06AD

Code0006AF:
    call Sub0005CA                  ; 00:06AF
    jr   Code0006B7                 ; 00:06B2

Code0006B4:
    call Sub0005F2                  ; 00:06B4
Code0006B7:
    ld   a,:Sub0B5D0A               ; 00:06B7
    call SetROMBank                 ; 00:06B9
    call Sub0B5D0A                  ; 00:06BC
    ret                             ; 00:06BF

Code0006C0:
; Game state 28
    ld   a,[$C168]                  ; 00:06C0
    rst  $00                        ; 00:06C3  Execute from 16-bit pointer table
.dw Code0006DD                      ; 00:06C4
.dw Code0006C8                      ; 00:06C6

Code0006C8:
    ld   a,[$C168]                  ; 00:06C8
    push af                         ; 00:06CB
    call Sub000529                  ; 00:06CC
    ld   hl,$C168                   ; 00:06CF
    pop  af                         ; 00:06D2
    cp   [hl]                       ; 00:06D3
    jr   z,Return0006DC             ; 00:06D4
    ld   [hl],$01                   ; 00:06D6
    ld   a,$23                      ; 00:06D8
    ldh  [<H_GameState],a           ; 00:06DA
Return0006DC:
    ret                             ; 00:06DC

Code0006DD:
    ld   a,:Sub064B87               ; 00:06DD
    call SetROMBank                 ; 00:06DF
    call Sub064B87                  ; 00:06E2
    and  a                          ; 00:06E5
    jr   nz,Return0006F3            ; 00:06E6
    call Sub00067E                  ; 00:06E8
    ld   a,:YouVsBooMenu_Main       ; 00:06EB
    call SetROMBank                 ; 00:06ED
    call YouVsBooMenu_Main          ; 00:06F0
Return0006F3:
    ret                             ; 00:06F3

YouVsBooMenu_Init:
; Game state 33
    ld   a,:YouVsBoo_LoadSaveData   ; 00:06F4
    call SetROMBank                 ; 00:06F6
    call YouVsBoo_LoadSaveData      ; 00:06F9
Code0006FC:
; also referenced by game state 27
    ld   a,:Sub0B575E               ; 00:06FC
    call SetROMBank                 ; 00:06FE
    call Sub0B575E                  ; 00:0701
    ret                             ; 00:0704

YouVsBooMenu_Wrapper:
; Game state 34 wrapper
    ld   a,:YouVsBooMenu_Main       ; 00:0705
    call SetROMBank                 ; 00:0707
    call YouVsBooMenu_Main          ; 00:070A
    ret                             ; 00:070D

YouVsBooRace_Init:
; Game state 35
    ld   a,:Sub0B6204               ; 00:070E
    call SetROMBank                 ; 00:0710
    call Sub0B6204                  ; 00:0713
    ld   a,:Sub0B401F               ; 00:0716
    call SetROMBank                 ; 00:0718
    call Sub0B401F                  ; 00:071B
    ld   a,:YouVsBoo_LoadSaveData   ; 00:071E
    call SetROMBank                 ; 00:0720
    call YouVsBoo_LoadSaveData      ; 00:0723
    call Sub0003B1                  ; 00:0726
    call LoadSublevelBrickGraphics  ; 00:0729
    xor  a                          ; 00:072C
    ld   [W_PlayerCoins],a          ; 00:072D
    ld   a,:Sub0444A6               ; 00:0730
    call SetROMBank                 ; 00:0732
    call Sub0444A6                  ; 00:0735
    call SetLevelTimerRace          ; 00:0738
    ld   a,$07                      ; 00:073B
    call SetROMBank                 ; 00:073D
    ld   d,$00                      ; 00:0740
    call Sub0740F4                  ; 00:0742
    ld   a,:Sub0B5FA3               ; 00:0745
    call SetROMBank                 ; 00:0747
    call Sub0B5FA3                  ; 00:074A
    ld   a,:Sub0341C2               ; 00:074D
    call SetROMBank                 ; 00:074F
    call Sub0341C2                  ; 00:0752
    call Sub037981                  ; 00:0755
    call Sub000E29                  ; 00:0758
    ld   a,$01                      ; 00:075B
    ld   [$C0C4],a                  ; 00:075D
    ld   a,$87                      ; 00:0760
    ldh  [<LCDC],a                  ; 00:0762
    ldh  a,[<IE]                    ; 00:0764
    or   $03                        ; 00:0766
    ldh  [<IE],a                    ; 00:0768
    call StatusBarInit              ; 00:076A
    xor  a                          ; 00:076D
    ld   [$C181],a                  ; 00:076E
    ld   [$C3ED],a                  ; 00:0771
    ld   [$C3EE],a                  ; 00:0774
    ld   hl,H_GameState             ; 00:0777
    inc  [hl]                       ; 00:077A
    ld   a,$FF                      ; 00:077B
    ld   [$DE68],a                  ; 00:077D
    ld   [$C36F],a                  ; 00:0780
    ret                             ; 00:0783

YouVsBooRace_Main:
; Game state 36
    ldh  a,[<H_CameraXLow]          ; 00:0784
    ld   [$C175],a                  ; 00:0786
    ldh  a,[<H_CameraY]             ; 00:0789
    ld   [$C176],a                  ; 00:078B
    ld   a,[$C38D]                  ; 00:078E
    and  a                          ; 00:0791
    jr   nz,Code00079A              ; 00:0792
    xor  a                          ; 00:0794
    ld   [$C168],a                  ; 00:0795
    jr   Code0007D3                 ; 00:0798
Code00079A:
    ld   a,[$C168]                  ; 00:079A
    and  a                          ; 00:079D
    jr   z,Code0007AA               ; 00:079E
Code0007A0:
    ld   a,:Sub044AC3               ; 00:07A0
    call SetROMBank                 ; 00:07A2
    call Sub044AC3                  ; 00:07A5
    jr   Return0007FD               ; 00:07A8
Code0007AA:
    ldh  a,[<H_ButtonsPressed]      ; 00:07AA
    and  $08                        ; 00:07AC
    jr   z,Code0007C0               ; 00:07AE
    ld   a,[$C1F3]                  ; 00:07B0
    and  a                          ; 00:07B3
    jr   nz,Code0007C0              ; 00:07B4
    ld   a,$4D                      ; 00:07B6
    ldh  [<$FFF2],a                 ; 00:07B8
    ld   hl,$C168                   ; 00:07BA
    inc  [hl]                       ; 00:07BD
    jr   Code0007A0                 ; 00:07BE
Code0007C0:
    ld   a,:Sub0341C2               ; 00:07C0
    call SetROMBank                 ; 00:07C2
    call Sub0341C2                  ; 00:07C5
    call Sub0379AD                  ; 00:07C8
    ld   a,:Sub0B4000               ; 00:07CB
    call SetROMBank                 ; 00:07CD
    call Sub0B4000                  ; 00:07D0
Code0007D3:
    ld   a,:Sub035A3C               ; 00:07D3
    call SetROMBank                 ; 00:07D5
    call Sub035A3C                  ; 00:07D8
    call Sub001831                  ; 00:07DB
    ld   a,:Sub037376               ; 00:07DE
    call SetROMBank                 ; 00:07E0
    call Sub037376                  ; 00:07E3
    call Sub037863                  ; 00:07E6
    call Sub002C88                  ; 00:07E9
    call Sub003643                  ; 00:07EC
    call Sub003AB0                  ; 00:07EF
    call Sub003BBB                  ; 00:07F2
    ld   a,:Sub0B62BF               ; 00:07F5
    call SetROMBank                 ; 00:07F7
    call Sub0B62BF                  ; 00:07FA
Return0007FD:
    ret                             ; 00:07FD

Code0007FE:
; Game state 3B
    ld   a,:Sub064CF8               ; 00:07FE
    call SetROMBank                 ; 00:0800
    call Sub064CF8                  ; 00:0803
    xor  a                          ; 00:0806
    ld   [W_SublevelID],a           ; 00:0807
    ld   [W_LevelID],a              ; 00:080A
    ld   [$C1EF],a                  ; 00:080D
    ld   [$C182],a                  ; 00:0810
    ld   [$C1B3],a                  ; 00:0813
    ld   [$C183],a                  ; 00:0816
    ld   [$C184],a                  ; 00:0819
    ld   [$C185],a                  ; 00:081C
    ld   [$C186],a                  ; 00:081F
    ld   [$C410],a                  ; 00:0822
    ld   [W_PlayerFireFlag],a       ; 00:0825
    ld   [W_PlayerSize],a           ; 00:0828
    ld   [W_HardFlag],a             ; 00:082B
    ld   a,:Sub0B61AC               ; 00:082E
    call SetROMBank                 ; 00:0830
    call Sub0B61AC                  ; 00:0833
    call Sub0003B1                  ; 00:0836
    call LoadSublevelBrickGraphics  ; 00:0839
    ld   a,:Sub037376               ; 00:083C
    call SetROMBank                 ; 00:083E
    call Sub037376                  ; 00:0841
    ld   a,:Sub0444A6               ; 00:0844
    call SetROMBank                 ; 00:0846
    call Sub0444A6                  ; 00:0849
    ld   a,$01                      ; 00:084C
    ld   [$C170],a                  ; 00:084E
    ld   a,$01                      ; 00:0851
    ld   [$C0C4],a                  ; 00:0853
    ld   a,$03                      ; 00:0856
    ldh  [<IE],a                    ; 00:0858
    ld   a,$87                      ; 00:085A
    ldh  [<LCDC],a                  ; 00:085C
    call Sub0449E7                  ; 00:085E
    call StatusBarInit              ; 00:0861
    ld   a,:Sub0B4383               ; 00:0864
    call SetROMBank                 ; 00:0866
    call Sub0B4383                  ; 00:0869
    ld   a,$FF                      ; 00:086C
    ld   [$DE68],a                  ; 00:086E
    ld   [$C36F],a                  ; 00:0871
    ld   hl,H_GameState             ; 00:0874
    inc  [hl]                       ; 00:0877
    ret                             ; 00:0878

Code000879:
; Game state 3C
    ldh  a,[<H_CameraXLow]          ; 00:0879
    ld   [$C175],a                  ; 00:087B
    ldh  a,[<H_CameraY]             ; 00:087E
    ld   [$C176],a                  ; 00:0880
    ld   a,:Sub034000               ; 00:0883
    call SetROMBank                 ; 00:0885
    call Sub034000                  ; 00:0888
    call Sub035A3C                  ; 00:088B
    call Sub001831                  ; 00:088E
    ld   a,:Sub037376               ; 00:0891
    call SetROMBank                 ; 00:0893
    call Sub037376                  ; 00:0896
    call Sub037863                  ; 00:0899
    call Sub002C88                  ; 00:089C
    call Sub003643                  ; 00:089F
    call Sub003AB0                  ; 00:08A2
    call Sub003AFF                  ; 00:08A5
    ld   a,:Sub0B62BF               ; 00:08A8
    call SetROMBank                 ; 00:08AA
    call Sub0B62BF                  ; 00:08AD
    ret                             ; 00:08B0

Code0008B1:
; Game state 3D
    ld   a,:Sub064CF8               ; 00:08B1
    call SetROMBank                 ; 00:08B3
    call Sub064CF8                  ; 00:08B6
    ld   a,$3A                      ; 00:08B9
    ld   [W_SublevelID],a           ; 00:08BB
    ld   [W_LevelID],a              ; 00:08BE
    xor  a                          ; 00:08C1
    ld   [$C3E7],a                  ; 00:08C2
    ld   [$C38D],a                  ; 00:08C5
    ld   [$C182],a                  ; 00:08C8
    ld   [$C1B3],a                  ; 00:08CB
    ld   [$C183],a                  ; 00:08CE
    ld   [$C184],a                  ; 00:08D1
    ld   [$C185],a                  ; 00:08D4
    ld   [$C186],a                  ; 00:08D7
    ld   [$C410],a                  ; 00:08DA
    inc  a                          ; 00:08DD
    ld   [$DA6A],a                  ; 00:08DE
    ld   a,$02                      ; 00:08E1
    ld   [W_GameMode],a             ; 00:08E3
    ld   a,$01                      ; 00:08E6
    ld   [$C0C1],a                  ; 00:08E8
    ld   a,:Sub0B4383               ; 00:08EB
    call SetROMBank                 ; 00:08ED
    call Sub0B4383                  ; 00:08F0
    ld   a,:Sub0B6204               ; 00:08F3
    call SetROMBank                 ; 00:08F5
    call Sub0B6204                  ; 00:08F8
    call Sub0003B1                  ; 00:08FB
    call LoadSublevelBrickGraphics  ; 00:08FE
    xor  a                          ; 00:0901
    ld   [W_PlayerCoins],a          ; 00:0902
    ld   [W_PlayerFireFlag],a       ; 00:0905
    ld   [W_PlayerSize],a           ; 00:0908
    ld   a,:Sub0371C5               ; 00:090B
    call SetROMBank                 ; 00:090D
    call Sub0371C5                  ; 00:0910
    call Sub0377DF                  ; 00:0913
    call Sub0377E4                  ; 00:0916
    ld   a,:Sub0444A6               ; 00:0919
    call SetROMBank                 ; 00:091B
    call Sub0444A6                  ; 00:091E
    ld   a,:Sub0B42B1               ; 00:0921
    call SetROMBank                 ; 00:0923
    call Sub0B42B1                  ; 00:0926
    ld   a,:Sub0740F4               ; 00:0929
    call SetROMBank                 ; 00:092B
    ld   d,$00                      ; 00:092E
    call Sub0740F4                  ; 00:0930
    ld   a,:Sub034011               ; 00:0933
    call SetROMBank                 ; 00:0935
    call Sub034011                  ; 00:0938
    call Sub037981                  ; 00:093B
    ld   a,$01                      ; 00:093E
    ld   [$C170],a                  ; 00:0940
    ld   [$C0C4],a                  ; 00:0943
    ld   a,$87                      ; 00:0946
    ldh  [<LCDC],a                  ; 00:0948
    ld   a,$03                      ; 00:094A
    ldh  [<IE],a                    ; 00:094C
    ld   a,:Sub0449E7               ; 00:094E
    call SetROMBank                 ; 00:0950
    call Sub0449E7                  ; 00:0953
    call SetLevelTimerRace          ; 00:0956
    call StatusBarInit              ; 00:0959
    xor  a                          ; 00:095C
    ld   [$C181],a                  ; 00:095D
    ld   [$C1EF],a                  ; 00:0960
    ldh  [<H_CameraXLow],a          ; 00:0963
    ldh  [<H_CameraXHigh],a         ; 00:0965
    ld   hl,H_GameState             ; 00:0967
    inc  [hl]                       ; 00:096A
    ld   a,$FF                      ; 00:096B
    ld   [$DE68],a                  ; 00:096D
    ld   [$C36F],a                  ; 00:0970
    ret                             ; 00:0973

Code000974:
; Game state 3E
    ldh  a,[<H_CameraXLow]          ; 00:0974
    ld   [$C175],a                  ; 00:0976
    ldh  a,[<H_CameraY]             ; 00:0979
    ld   [$C176],a                  ; 00:097B
    ld   a,:Sub034011               ; 00:097E
    call SetROMBank                 ; 00:0980
    call Sub034011                  ; 00:0983
    call Sub001831                  ; 00:0986
    call Sub002C88                  ; 00:0989
    call Sub003643                  ; 00:098C
    call Sub003AB0                  ; 00:098F
    call Sub003BBB                  ; 00:0992
    ld   a,:Sub0B62BF               ; 00:0995
    call SetROMBank                 ; 00:0997
    call Sub0B62BF                  ; 00:099A
    ret                             ; 00:099D

Code00099E:
; Game state 3F
    ld   a,:Sub064CF8               ; 00:099E
    call SetROMBank                 ; 00:09A0
    call Sub064CF8                  ; 00:09A3
    xor  a                          ; 00:09A6
    ld   [$C410],a                  ; 00:09A7
    ld   a,:Sub094B5E               ; 00:09AA
    call SetROMBank                 ; 00:09AC
    call Sub094B5E                  ; 00:09AF
    ret                             ; 00:09B2

Code0009B3:
; Game state 40 wrapper
    ld   a,:Sub094D63               ; 00:09B3
    call SetROMBank                 ; 00:09B5
    call Sub094D63                  ; 00:09B8
    ret                             ; 00:09BB

PauseWrapper:
; Game state 0C
    ld   a,:PauseMain               ; 00:09BC
    call SetROMBank                 ; 00:09BE
    call PauseMain                  ; 00:09C1
    ret                             ; 00:09C4

PreTitleInit:
; Game state 00
    ld   a,:Sub094000               ; 00:09C5
    call SetROMBank                 ; 00:09C7
    call Sub094000                  ; 00:09CA
    ld   a,:Sub064D0C               ; 00:09CD
    call SetROMBank                 ; 00:09CF
    call Sub064D0C                  ; 00:09D2
    ret                             ; 00:09D5

PreTitleMain:
; Game state 01
    ld   a,:PreTitleMain_CallSubstate; 00:09D6
    call SetROMBank                 ; 00:09D8
    call PreTitleMain_CallSubstate  ; 00:09DB
    ld   a,:Sub064D0C               ; 00:09DE
    call SetROMBank                 ; 00:09E0
    call Sub064D0C                  ; 00:09E3
    ret                             ; 00:09E6

TitleScreenInit:
; Game state 02
    ld   a,:Sub094105               ; 00:09E7
    call SetROMBank                 ; 00:09E9
    call Sub094105                  ; 00:09EC
    ld   a,:Sub064D0C               ; 00:09EF
    call SetROMBank                 ; 00:09F1
    call Sub064D0C                  ; 00:09F4
    ret                             ; 00:09F7

TitleScreenMain:
; Game state 03
    ld   a,:TitleScreenMain_CallSubstate; 00:09F8
    call SetROMBank                 ; 00:09FA
    call TitleScreenMain_CallSubstate; 00:09FD
    ld   a,:Sub064D0C               ; 00:0A00
    call SetROMBank                 ; 00:0A02
    call Sub064D0C                  ; 00:0A05
    ret                             ; 00:0A08

Code000A09:
; Game state 0E wrapper
    ld   a,:Sub09465D               ; 00:0A09
    call SetROMBank                 ; 00:0A0B
    call Sub09465D                  ; 00:0A0E
    ret                             ; 00:0A11

GameOverWrapper:
; Game state 0F wrapper
    ld   a,:GameOverMain            ; 00:0A12
    call SetROMBank                 ; 00:0A14
    call GameOverMain               ; 00:0A17
    ret                             ; 00:0A1A

Code000A1B:
; Game state 10 wrapper
    ld   a,:Sub0947CE               ; 00:0A1B
    call SetROMBank                 ; 00:0A1D
    call Sub0947CE                  ; 00:0A20
    ret                             ; 00:0A23

Code000A24:
; Game state 11 wrapper
    ld   a,:Sub09481F               ; 00:0A24
    call SetROMBank                 ; 00:0A26
    call Sub09481F                  ; 00:0A29
    ret                             ; 00:0A2C

Code000A2D:
; Game state 12 wrapper
    ld   a,:Sub094B7B               ; 00:0A2D
    call SetROMBank                 ; 00:0A2F
    call Sub094B7B                  ; 00:0A32
    ret                             ; 00:0A35

Code000A36:
; Game state 13 wrapper
    ld   a,:Sub094BC8               ; 00:0A36
    call SetROMBank                 ; 00:0A38
    call Sub094BC8                  ; 00:0A3B
    ret                             ; 00:0A3E

Code000A3F:
; Game state 14
    ld   a,:Sub0950E7               ; 00:0A3F
    call SetROMBank                 ; 00:0A41
    call Sub0950E7                  ; 00:0A44
    ld   a,[$C356]                  ; 00:0A47
    cp   $0A                        ; 00:0A4A
    jr   c,@Code000A57              ; 00:0A4C
    ld   a,$00                      ; 00:0A4E
    ldh  [<H_GameSubstate],a        ; 00:0A50
    ld   a,$1A                      ; 00:0A52
    ldh  [<H_GameState],a           ; 00:0A54
    ret                             ; 00:0A56
@Code000A57:
    ld   a,:Sub0950F1               ; 00:0A57
    call SetROMBank                 ; 00:0A59
    call Sub0950F1                  ; 00:0A5C
    ret                             ; 00:0A5F

Code000A60:
; Game state 15 wrapper
    ld   a,:Sub095370               ; 00:0A60
    call SetROMBank                 ; 00:0A62
    call Sub095370                  ; 00:0A65
    ret                             ; 00:0A68

Code000A69:
; Game state 29
    ld   a,[$C168]                  ; 00:0A69
    rst  $00                        ; 00:0A6C  Execute from 16-bit pointer table
.dw Code000BB4                      ; 00:0A6D
.dw Code000A71                      ; 00:0A6F

Code000A71:
    ld   a,:Sub064AA0               ; 00:0A71
    call SetROMBank                 ; 00:0A73
    call Sub064AA0                  ; 00:0A76
    ret                             ; 00:0A79

Code000A7A:
; Game state 2A wrapper
    ld   a,:Sub064B28               ; 00:0A7A
    call SetROMBank                 ; 00:0A7C
    call Sub064B28                  ; 00:0A7F
    ret                             ; 00:0A82

RecordsWrapper:
; Game state 2B wrapper
    ld   a,:RecordsMain             ; 00:0A83
    call SetROMBank                 ; 00:0A85
    call RecordsMain                ; 00:0A88
    ret                             ; 00:0A8B

AlbumWrapper:
; Game state 2C wrapper
    ld   a,:AlbumMain               ; 00:0A8C
    call SetROMBank                 ; 00:0A8E
    call AlbumMain                  ; 00:0A91
    ret                             ; 00:0A94

ToyBoxWrapper:
; Game state 2D wrapper
    ld   a,:ToyBoxMain              ; 00:0A95
    call SetROMBank                 ; 00:0A97
    call ToyBoxMain                 ; 00:0A9A
    ret                             ; 00:0A9D

PrintMenuBank00Wrapper:
; Game state 2E wrapper (of a wrapper)
    ld   a,:PrintMenuBank15Wrapper  ; 00:0A9E
    call SetROMBank                 ; 00:0AA0
    call PrintMenuBank15Wrapper     ; 00:0AA3
    ret                             ; 00:0AA6

FileSelectInitWrapper:
; Game state 16 wrapper
    ld   a,:FileSelectInit          ; 00:0AA7
    call SetROMBank                 ; 00:0AA9
    call FileSelectInit             ; 00:0AAC
    ret                             ; 00:0AAF

FileSelectMain:
; Game state 17
    ld   a,:Sub1142C2               ; 00:0AB0
    call SetROMBank                 ; 00:0AB2
    call Sub1142C2                  ; 00:0AB5
    ldh  a,[<H_GameSubstate]        ; 00:0AB8
    cp   $01                        ; 00:0ABA
    jr   z,@Return                  ; 00:0ABC
    cp   $08                        ; 00:0ABE
    jr   z,@Return                  ; 00:0AC0
    cp   $0A                        ; 00:0AC2
    jr   z,@Return                  ; 00:0AC4
    ld   a,[W_PlayerSize]           ; 00:0AC6
    push af                         ; 00:0AC9
    ld   a,[W_PlayerFireFlag]       ; 00:0ACA
    push af                         ; 00:0ACD
    ld   a,$00                      ; 00:0ACE
    ld   [W_PlayerFireFlag],a       ; 00:0AD0
    inc  a                          ; 00:0AD3
    ld   [W_PlayerSize],a           ; 00:0AD4
    ld   a,:Sub037376               ; 00:0AD7
    call SetROMBank                 ; 00:0AD9
    call Sub037376                  ; 00:0ADC
    pop  af                         ; 00:0ADF
    ld   [W_PlayerFireFlag],a       ; 00:0AE0
    pop  af                         ; 00:0AE3
    ld   [W_PlayerSize],a           ; 00:0AE4
@Return:
    ret                             ; 00:0AE7

MainMenu_Init:
; Game state 18
    ld   a,$00                      ; 00:0AE8
    ldh  [<SVBK],a                  ; 00:0AEA
    ld   a,:Sub064B33               ; 00:0AEC
    call SetROMBank                 ; 00:0AEE
    call Sub064B33                  ; 00:0AF1
    ld   a,:Sub114B60               ; 00:0AF4
    call SetROMBank                 ; 00:0AF6
    call Sub114B60                  ; 00:0AF9
    ld   a,:Sub064D0C               ; 00:0AFC
    call SetROMBank                 ; 00:0AFE
    call Sub064D0C                  ; 00:0B01
    ret                             ; 00:0B04

MainMenu_Main:
; Game state 19
    ld   a,:Sub114CB9               ; 00:0B05
    call SetROMBank                 ; 00:0B07
    call Sub114CB9                  ; 00:0B0A
    ld   a,:Sub064D0C               ; 00:0B0D
    call SetROMBank                 ; 00:0B0F
    call Sub064D0C                  ; 00:0B12
    ret                             ; 00:0B15

Code000B16:
; Game state 1A wrapper
    ld   a,:Sub114026               ; 00:0B16
    call SetROMBank                 ; 00:0B18
    call Sub114026                  ; 00:0B1B
    ret                             ; 00:0B1E

Code000B1F:
; Game state 1B wrapper
    ld   a,:Sub11407E               ; 00:0B1F
    call SetROMBank                 ; 00:0B21
    call Sub11407E                  ; 00:0B24
    ret                             ; 00:0B27

ChalMenuInit:
; Game state 1D
    call Sub00126D                  ; 00:0B28
    ld   a,$00                      ; 00:0B2B
    ldh  [<IE],a                    ; 00:0B2D
    ld   a,:ChalMenuInit_Bank11     ; 00:0B2F
    call SetROMBank                 ; 00:0B31
    call ChalMenuInit_Bank11        ; 00:0B34
    ld   a,$01                      ; 00:0B37
    ldh  [<IE],a                    ; 00:0B39
    ld   a,$87                      ; 00:0B3B
    ldh  [<LCDC],a                  ; 00:0B3D
    ld   hl,H_GameState             ; 00:0B3F
    inc  [hl]                       ; 00:0B42
    ret                             ; 00:0B43

ChalMenu_Wrapper:
; Game state 1E wrapper
    ld   a,:ChalMenu_Main           ; 00:0B44
    call SetROMBank                 ; 00:0B46
    call ChalMenu_Main              ; 00:0B49
    ret                             ; 00:0B4C

AwardCutsceneWrapper:
; Game state 1C wrapper
    ld   a,:AwardCutscene_Main      ; 00:0B4D
    call SetROMBank                 ; 00:0B4F
    call AwardCutscene_Main         ; 00:0B52
    ret                             ; 00:0B55

ChalResultsInit:
; Game state 20
    call Sub00126D                  ; 00:0B56
    ld   a,$00                      ; 00:0B59
    ldh  [<IE],a                    ; 00:0B5B
    ld   a,:Sub0448E8               ; 00:0B5D
    call SetROMBank                 ; 00:0B5F
    call Sub0448E8                  ; 00:0B62
    ld   a,$00                      ; 00:0B65
    ldh  [<H_GameSubstate],a        ; 00:0B67
@Loop000B69:
    ld   a,:ChalResultsInit_CallSubstate; 00:0B69
    call SetROMBank                 ; 00:0B6B
    call ChalResultsInit_CallSubstate; 00:0B6E
    call Sub0014AA                  ; 00:0B71
    ldh  a,[<H_GameSubstate]        ; 00:0B74
    cp   $03                        ; 00:0B76
    jr   c,@Loop000B69              ; 00:0B78
    ld   a,$01                      ; 00:0B7A
    ldh  [<IE],a                    ; 00:0B7C
    ld   a,$87                      ; 00:0B7E
    ldh  [<LCDC],a                  ; 00:0B80
    ld   hl,H_GameState             ; 00:0B82
    inc  [hl]                       ; 00:0B85
    ret                             ; 00:0B86

ChalResultsMain_Wrapper:
; Game state 21 wrapper
    ld   a,:ChalResultsMain         ; 00:0B87
    call SetROMBank                 ; 00:0B89
    call ChalResultsMain            ; 00:0B8C
    ret                             ; 00:0B8F

ChalYoshiHatch_Wrapper:
; Game state 1F
    ld   a,:ChalYoshiHatch_Main     ; 00:0B90
    call SetROMBank                 ; 00:0B92
    call ChalYoshiHatch_Main        ; 00:0B95
    ret                             ; 00:0B98

ChalMiss_Wrapper:
; Game state 22 wrapper
    ld   a,:ChalMiss_Main           ; 00:0B99
    call SetROMBank                 ; 00:0B9B
    call ChalMiss_Main              ; 00:0B9E
    ret                             ; 00:0BA1

YouVsBooResults_InitWrapper:
; Game state 25 wrapper
    call YouVsBooResults_Init       ; 00:0BA2
    ret                             ; 00:0BA5

YouVsBooResults_Init:
; Game state 25
    ld   a,[$C168]                  ; 00:0BA6
    rst  $00                        ; 00:0BA9  Execute from 16-bit pointer table
.dw Code000BB4                      ; 00:0BAA
.dw Code000BC2                      ; 00:0BAC
.dw Code000BCB                      ; 00:0BAE
.dw Sub0005CA                       ; 00:0BB0
.dw Sub0005F2                       ; 00:0BB2

Code000BB4:
    ld   a,$00                      ; 00:0BB4
    ld   [$DA78],a                  ; 00:0BB6
    ld   a,:Sub064E88               ; 00:0BB9
    call SetROMBank                 ; 00:0BBB
    call Sub064E88                  ; 00:0BBE
    ret                             ; 00:0BC1

Code000BC2:
    ld   a,:Sub136520               ; 00:0BC2
    call SetROMBank                 ; 00:0BC4
    call Sub136520                  ; 00:0BC7
    ret                             ; 00:0BCA

Code000BCB:
    ld   a,:Sub1366D9               ; 00:0BCB
    call SetROMBank                 ; 00:0BCD
    call Sub1366D9                  ; 00:0BD0
    ret                             ; 00:0BD3

Code000BD4:
; Game state 26
    ld   a,[W_GameMode]             ; 00:0BD4
    cp   $07                        ; 00:0BD7
    jr   z,Code000BE9               ; 00:0BD9
    ld   a,:Sub064B87               ; 00:0BDB
    call SetROMBank                 ; 00:0BDD
    call Sub064B87                  ; 00:0BE0
    and  a                          ; 00:0BE3
    jr   nz,Return000BF1            ; 00:0BE4
    call Sub00067E                  ; 00:0BE6
Code000BE9:
    ld   a,:Sub13685A               ; 00:0BE9
    call SetROMBank                 ; 00:0BEB
    call Sub13685A                  ; 00:0BEE
Return000BF1:
    ret                             ; 00:0BF1

Code000BF2:
; Game state 2F wrapper
    ld   a,:Sub06555A               ; 00:0BF2
    call SetROMBank                 ; 00:0BF4
    call Sub06555A                  ; 00:0BF7
    ret                             ; 00:0BFA

Code000BFB:
; Game state 30 wrapper
    ld   a,:Sub065616               ; 00:0BFB
    call SetROMBank                 ; 00:0BFD
    call Sub065616                  ; 00:0C00
    ret                             ; 00:0C03

Code000C04:
; Game state 3A wrapper
    ld   a,:Sub065C84               ; 00:0C04
    call SetROMBank                 ; 00:0C06
    call Sub065C84                  ; 00:0C09
    ret                             ; 00:0C0C

NonGBCError_Wrapper:
; Game state 37 wrapper
    ld   a,:NonGBCError_Main        ; 00:0C0D
    call SetROMBank                 ; 00:0C0F
    jp   NonGBCError_Main           ; 00:0C12

SPTitle_Wrapper:
; Game state 38 wrapper
    ld   a,:SPTitle_Main            ; 00:0C15
    call SetROMBank                 ; 00:0C17
    jp   SPTitle_Main               ; 00:0C1A

Credits_Wrapper:
; Game state 39 wrapper
    ld   a,:Credits_Main            ; 00:0C1D
    call SetROMBank                 ; 00:0C1F
    jp   Credits_Main               ; 00:0C22

ToadPeachRoom_Wrapper:
; Game state 41 wrapper
    ld   a,:ToadPeachRoom_Main      ; 00:0C25
    call SetROMBank                 ; 00:0C27
    jp   ToadPeachRoom_Main         ; 00:0C2A

VBlankInterrupt:
    push af                         ; 00:0C2D
    push bc                         ; 00:0C2E
    push de                         ; 00:0C2F
    push hl                         ; 00:0C30
    di                              ; 00:0C31
    ldh  a,[<$FF91]                 ; 00:0C32
    and  a                          ; 00:0C34
    jp   nz,Code000CC0              ; 00:0C35
    ld   a,[$C0C1]                  ; 00:0C38
    cp   $01                        ; 00:0C3B
    jp   z,Code000CD8               ; 00:0C3D
    cp   $02                        ; 00:0C40
    jp   z,Code000D2F               ; 00:0C42
    cp   $03                        ; 00:0C45
    jp   z,Code000CC6               ; 00:0C47
    cp   $04                        ; 00:0C4A
    jp   z,Code000CD2               ; 00:0C4C
    ldh  a,[<H_GameState]           ; 00:0C4F
    cp   $37                        ; 00:0C51
    jr   z,Code000CBC               ; 00:0C53
    ld   a,[$C0C4]                  ; 00:0C55
    and  a                          ; 00:0C58
    jr   nz,Code000C65              ; 00:0C59
    ldh  a,[<H_CameraXLow]          ; 00:0C5B
    ldh  [<SCX],a                   ; 00:0C5D
    ldh  a,[<H_CameraY]             ; 00:0C5F
    ldh  [<SCY],a                   ; 00:0C61
    jr   Code000C8D                 ; 00:0C63
Code000C65:
    ld   a,[$C410]                  ; 00:0C65
    and  a                          ; 00:0C68
    jr   z,Code000C83               ; 00:0C69
    ld   a,$00                      ; 00:0C6B
    ldh  [<SCX],a                   ; 00:0C6D
    ldh  a,[<H_CameraY]             ; 00:0C6F
    ldh  [<SCY],a                   ; 00:0C71
    xor  a                          ; 00:0C73
    ld   [$C40B],a                  ; 00:0C74
    ld   a,$50                      ; 00:0C77
    ldh  [<LYC],a                   ; 00:0C79
    ld   a,[$C40E]                  ; 00:0C7B
    ld   [$C175],a                  ; 00:0C7E
    jr   Code000C8D                 ; 00:0C81
Code000C83:
    ld   a,$00                      ; 00:0C83
    ldh  [<SCX],a                   ; 00:0C85
    ldh  [<SCY],a                   ; 00:0C87
    ld   a,$07                      ; 00:0C89
    ldh  [<LYC],a                   ; 00:0C8B
Code000C8D:
    ld   a,[$C178]                  ; 00:0C8D
    ldh  [<WY],a                    ; 00:0C90
    ld   a,[$C177]                  ; 00:0C92
    ldh  [<WX],a                    ; 00:0C95
    ld   a,[W_GameMode]             ; 00:0C97
    cp   $07                        ; 00:0C9A
    jr   nz,Code000CA1              ; 00:0C9C
    call LoadAnimGr_Race            ; 00:0C9E
Code000CA1:
    call Sub003D1B                  ; 00:0CA1
    call Sub000E29                  ; 00:0CA4
    call Sub000E4F                  ; 00:0CA7
    call Sub000EBE                  ; 00:0CAA
    call Sub0014AA                  ; 00:0CAD
    call LoadAnimGr_1Player         ; 00:0CB0
    call H_DMATransferOAM           ; 00:0CB3
    call LoadAnimGr_Global          ; 00:0CB6
    call LoadAnimGr_RedCoin         ; 00:0CB9
Code000CBC:
    ld   a,$01                      ; 00:0CBC
    ldh  [<$FF91],a                 ; 00:0CBE
Code000CC0:
    ei                              ; 00:0CC0
    pop  hl                         ; 00:0CC1
    pop  de                         ; 00:0CC2
    pop  bc                         ; 00:0CC3
    pop  af                         ; 00:0CC4
    reti                            ; 00:0CC5

Code000CC6:
    call Sub001677                  ; 00:0CC6
    call Sub000E29                  ; 00:0CC9
    call Sub0014AA                  ; 00:0CCC
    jp   Code000CBC                 ; 00:0CCF
Code000CD2:
    call Sub00162D                  ; 00:0CD2
    jp   Code000CBC                 ; 00:0CD5
Code000CD8:
    ld   a,[$C0C4]                  ; 00:0CD8
    and  a                          ; 00:0CDB
    jr   nz,Code000CE8              ; 00:0CDC
    ldh  a,[<H_CameraXLow]          ; 00:0CDE
    ldh  [<SCX],a                   ; 00:0CE0
    ldh  a,[<H_CameraY]             ; 00:0CE2
    ldh  [<SCY],a                   ; 00:0CE4
    jr   Code000D03                 ; 00:0CE6
Code000CE8:
    ld   a,$00                      ; 00:0CE8
    ldh  [<SCX],a                   ; 00:0CEA
    ldh  [<SCY],a                   ; 00:0CEC
    ld   a,$07                      ; 00:0CEE
    ldh  [<LYC],a                   ; 00:0CF0
    ldh  a,[<H_GameState]           ; 00:0CF2
    cp   $24                        ; 00:0CF4
    jp   nz,Code000D03              ; 00:0CF6
    ldh  a,[<H_CameraXLow]          ; 00:0CF9
    ld   [$C175],a                  ; 00:0CFB
    ldh  a,[<H_CameraY]             ; 00:0CFE
    ld   [$C176],a                  ; 00:0D00
Code000D03:
    ld   a,[$C178]                  ; 00:0D03
    ldh  [<WY],a                    ; 00:0D06
    ld   a,[$C177]                  ; 00:0D08
    ldh  [<WX],a                    ; 00:0D0B
    call LoadAnimGr_Race            ; 00:0D0D
    call Sub003D1B                  ; 00:0D10
    call Sub000E29                  ; 00:0D13
    call Sub000E4F                  ; 00:0D16
    call Sub000EBE                  ; 00:0D19
    call Sub0014AA                  ; 00:0D1C
    call LoadAnimGr_Global          ; 00:0D1F
    call LoadAnimGr_2Player         ; 00:0D22
    call H_DMATransferOAM           ; 00:0D25
    ld   a,$01                      ; 00:0D28
    ldh  [<$FF91],a                 ; 00:0D2A
    jp   Code000CC0                 ; 00:0D2C

Code000D2F:
    call H_DMATransferOAM           ; 00:0D2F
    ld   a,[$C423]                  ; 00:0D32
    and  a                          ; 00:0D35
    jr   z,Code000D69               ; 00:0D36
    ld   hl,HDMA1                   ; 00:0D38
    ld   a,$01                      ; 00:0D3B
    ldh  [<VBK],a                   ; 00:0D3D
    ld   a,[$C428]                  ; 00:0D3F
    ldi  [hl],a                     ; 00:0D42
    ld   a,[$C427]                  ; 00:0D43
    ldi  [hl],a                     ; 00:0D46
    ld   a,$18                      ; 00:0D47
    ldi  [hl],a                     ; 00:0D49
    xor  a                          ; 00:0D4A
    ldi  [hl],a                     ; 00:0D4B
    ld   a,$23                      ; 00:0D4C
    ld   [hl],a                     ; 00:0D4E
    xor  a                          ; 00:0D4F
    ldh  [<VBK],a                   ; 00:0D50
    ld   hl,HDMA1                   ; 00:0D52
    ld   a,[$C426]                  ; 00:0D55
    ldi  [hl],a                     ; 00:0D58
    ld   a,[$C425]                  ; 00:0D59
    ldi  [hl],a                     ; 00:0D5C
    ld   a,$18                      ; 00:0D5D
    ldi  [hl],a                     ; 00:0D5F
    xor  a                          ; 00:0D60
    ldi  [hl],a                     ; 00:0D61
    ld   a,$23                      ; 00:0D62
    ld   [hl],a                     ; 00:0D64
    xor  a                          ; 00:0D65
    ld   [$C423],a                  ; 00:0D66
Code000D69:
    ld   a,[$C424]                  ; 00:0D69
    and  a                          ; 00:0D6C
    jr   z,Code000D97               ; 00:0D6D
    ld   a,[$C4F4]                  ; 00:0D6F
    ldh  [<SVBK],a                  ; 00:0D72
    ld   a,[$C4EF]                  ; 00:0D74
    ld   [ROMBANK],a                ; 00:0D77
    ld   hl,HDMA1                   ; 00:0D7A
    ld   a,[$C4EE]                  ; 00:0D7D
    ldi  [hl],a                     ; 00:0D80
    ld   a,[$C4ED]                  ; 00:0D81
    ldi  [hl],a                     ; 00:0D84
    ld   a,[$C4F1]                  ; 00:0D85
    ldi  [hl],a                     ; 00:0D88
    ld   a,[$C4F0]                  ; 00:0D89
    ldi  [hl],a                     ; 00:0D8C
    ld   a,[$C4F2]                  ; 00:0D8D
    ld   [hl],a                     ; 00:0D90
    xor  a                          ; 00:0D91
    ldh  [<SVBK],a                  ; 00:0D92
    ld   [$C424],a                  ; 00:0D94
Code000D97:
    ld   hl,$D971                   ; 00:0D97
    ldi  a,[hl]                     ; 00:0D9A
    and  [hl]                       ; 00:0D9B
    jr   z,Code000DDD               ; 00:0D9C
    ld   a,$31                      ; 00:0D9E
    ld   [ROMBANK],a                ; 00:0DA0
    ld   hl,HDMA1                   ; 00:0DA3
    ld   a,$01                      ; 00:0DA6
    ldh  [<VBK],a                   ; 00:0DA8
    ld   a,[$D974]                  ; 00:0DAA
    ldi  [hl],a                     ; 00:0DAD
    ld   a,[$D973]                  ; 00:0DAE
    ldi  [hl],a                     ; 00:0DB1
    ld   a,$1C                      ; 00:0DB2
    ldi  [hl],a                     ; 00:0DB4
    xor  a                          ; 00:0DB5
    ldi  [hl],a                     ; 00:0DB6
    ld   a,$05                      ; 00:0DB7
    ld   [hl],a                     ; 00:0DB9
    xor  a                          ; 00:0DBA
    ldh  [<VBK],a                   ; 00:0DBB
    ld   hl,HDMA1                   ; 00:0DBD
    ld   a,[$D972]                  ; 00:0DC0
    ldi  [hl],a                     ; 00:0DC3
    ld   a,[$D971]                  ; 00:0DC4
    ldi  [hl],a                     ; 00:0DC7
    ld   a,$1C                      ; 00:0DC8
    ldi  [hl],a                     ; 00:0DCA
    xor  a                          ; 00:0DCB
    ldi  [hl],a                     ; 00:0DCC
    ld   a,$05                      ; 00:0DCD
    ld   [hl],a                     ; 00:0DCF
    xor  a                          ; 00:0DD0
    ld   [$D971],a                  ; 00:0DD1
    ld   [$D972],a                  ; 00:0DD4
    ld   [$D973],a                  ; 00:0DD7
    ld   [$D974],a                  ; 00:0DDA
Code000DDD:
    call Sub000E02                  ; 00:0DDD
    ld   a,:Sub156174               ; 00:0DE0
    ld   [ROMBANK],a                ; 00:0DE2
    call Sub156174                  ; 00:0DE5
    ldh  a,[<$FFBE]                 ; 00:0DE8
    ld   [ROMBANK],a                ; 00:0DEA
    ldh  a,[<H_CameraXLow]          ; 00:0DED
    ldh  [<SCX],a                   ; 00:0DEF
    ldh  a,[<H_CameraY]             ; 00:0DF1
    ldh  [<SCY],a                   ; 00:0DF3
    ld   a,[$C178]                  ; 00:0DF5
    ldh  [<WY],a                    ; 00:0DF8
    ld   a,[$C177]                  ; 00:0DFA
    ldh  [<WX],a                    ; 00:0DFD
    jp   Code000CBC                 ; 00:0DFF

Sub000E02:
    ldh  a,[<$FFC0]                 ; 00:0E02
    and  a                          ; 00:0E04
    ret  z                          ; 00:0E05
    xor  a                          ; 00:0E06
    ldh  [<$FFC0],a                 ; 00:0E07
    ld   a,$80                      ; 00:0E09
    ldh  [<BGPI],a                  ; 00:0E0B
    ldh  [<OBPI],a                  ; 00:0E0D
    ld   e,$20                      ; 00:0E0F
    ld   hl,W_PalBuffer             ; 00:0E11
Code000E14:
    ldi  a,[hl]                     ; 00:0E14
    ldh  [<BGPD],a                  ; 00:0E15
    ldi  a,[hl]                     ; 00:0E17
    ldh  [<BGPD],a                  ; 00:0E18
    dec  e                          ; 00:0E1A
    jr   nz,Code000E14              ; 00:0E1B
    ld   e,$20                      ; 00:0E1D
Code000E1F:
    ldi  a,[hl]                     ; 00:0E1F
    ldh  [<OBPD],a                  ; 00:0E20
    ldi  a,[hl]                     ; 00:0E22
    ldh  [<OBPD],a                  ; 00:0E23
    dec  e                          ; 00:0E25
    jr   nz,Code000E1F              ; 00:0E26
    ret                             ; 00:0E28

Sub000E29:
; subroutine: Load palette buffer at $1:DF80 to palette RAM
    ld   hl,$FFC0                   ; 00:0E29
    ld   a,[hl]                     ; 00:0E2C
    and  a                          ; 00:0E2D
    ret  z                          ; 00:0E2E  if $FFC0 is clear, return
    ld   [hl],$00                   ; 00:0E2F
    ld   a,$80                      ; 00:0E31  80: start from offset 0, auto increment
    ldh  [<BGPI],a                  ; 00:0E33
    ldh  [<OBPI],a                  ; 00:0E35
    ld   de,$0000                   ; 00:0E37
@Loop:
    ld   hl,W_PalBuffer             ; 00:0E3A \ loop: load 0x40 colors each to BG/sprite palette
    add  hl,de                      ; 00:0E3D
    ld   a,[hl]                     ; 00:0E3E
    ldh  [<BGPD],a                  ; 00:0E3F
    ld   hl,W_PalBufferSpr          ; 00:0E41
    add  hl,de                      ; 00:0E44
    ld   a,[hl]                     ; 00:0E45
    ldh  [<OBPD],a                  ; 00:0E46
    inc  e                          ; 00:0E48
    ld   a,e                        ; 00:0E49
    cp   $40                        ; 00:0E4A
    jr   nz,@Loop                   ; 00:0E4C /
    ret                             ; 00:0E4E

Sub000E4F:
    ld   hl,$C179                   ; 00:0E4F
    ld   a,[hl]                     ; 00:0E52
    and  a                          ; 00:0E53
    jr   z,Code000EA0               ; 00:0E54
    ld   a,[hl]                     ; 00:0E56
    bit  0,a                        ; 00:0E57
    jr   z,Code000E82               ; 00:0E59
    ld   b,$A0                      ; 00:0E5B
    ld   de,$0020                   ; 00:0E5D
    ld   c,$28                      ; 00:0E60
    ld   hl,W_GameMode              ; 00:0E62
    ld   a,[hl]                     ; 00:0E65
    cp   $07                        ; 00:0E66
    jr   z,Code000E6E               ; 00:0E68
    cp   $02                        ; 00:0E6A
    jr   nz,Code000E73              ; 00:0E6C
Code000E6E:
    ld   b,$98                      ; 00:0E6E
    ld   de,$0018                   ; 00:0E70
Code000E73:
    ld   a,b                        ; 00:0E73
    ldh  [<OBPI],a                  ; 00:0E74
Code000E76:
    ld   hl,W_PalBufferSpr          ; 00:0E76
    add  hl,de                      ; 00:0E79
    ld   a,[hl]                     ; 00:0E7A
    ldh  [<OBPD],a                  ; 00:0E7B
    inc  e                          ; 00:0E7D
    ld   a,e                        ; 00:0E7E
    cp   c                          ; 00:0E7F
    jr   nz,Code000E76              ; 00:0E80
Code000E82:
    ld   hl,$C179                   ; 00:0E82
    ld   a,[hl]                     ; 00:0E85
    ld   [hl],$00                   ; 00:0E86
    bit  1,a                        ; 00:0E88
    jr   z,Code000EA0               ; 00:0E8A
    ld   de,$0038                   ; 00:0E8C
    ld   a,$B8                      ; 00:0E8F
    ldh  [<OBPI],a                  ; 00:0E91
Code000E93:
    ld   hl,W_PalBufferSpr          ; 00:0E93
    add  hl,de                      ; 00:0E96
    ld   a,[hl]                     ; 00:0E97
    ldh  [<OBPD],a                  ; 00:0E98
    inc  e                          ; 00:0E9A
    ld   a,e                        ; 00:0E9B
    cp   $40                        ; 00:0E9C
    jr   nz,Code000E93              ; 00:0E9E
Code000EA0:
    ld   hl,$C3AA                   ; 00:0EA0
    ld   a,[hl]                     ; 00:0EA3
    and  a                          ; 00:0EA4
    ret  z                          ; 00:0EA5
    ld   [hl],$00                   ; 00:0EA6
    ld   a,$8A                      ; 00:0EA8
    ldh  [<BGPI],a                  ; 00:0EAA
    ld   de,$000A                   ; 00:0EAC
    ld   c,$0C                      ; 00:0EAF
Code000EB1:
    ld   hl,W_PalBuffer             ; 00:0EB1
    add  hl,de                      ; 00:0EB4
    ld   a,[hl]                     ; 00:0EB5
    ldh  [<BGPD],a                  ; 00:0EB6
    inc  e                          ; 00:0EB8
    ld   a,e                        ; 00:0EB9
    cp   c                          ; 00:0EBA
    jr   nz,Code000EB1              ; 00:0EBB
    ret                             ; 00:0EBD

Sub000EBE:
    ld   a,[$C172]                  ; 00:0EBE
    and  a                          ; 00:0EC1
    jp   z,Return000ECD             ; 00:0EC2
    call Sub000ECE                  ; 00:0EC5
    ld   a,$00                      ; 00:0EC8
    ld   [$C172],a                  ; 00:0ECA
Return000ECD:
    ret                             ; 00:0ECD

Sub000ECE:
    dec  a                          ; 00:0ECE
    rst  $00                        ; 00:0ECF  Execute from 16-bit pointer table
.dw Sub00128D                       ; 00:0ED0
.dw Code003729                      ; 00:0ED2
.dw Code003E2F                      ; 00:0ED4

LCDInterrupt:
    di                              ; 00:0ED6
    push af                         ; 00:0ED7
    push hl                         ; 00:0ED8
    push de                         ; 00:0ED9
    ld   a,[$C0C4]                  ; 00:0EDA
    and  a                          ; 00:0EDD
    jr   z,Code000F05               ; 00:0EDE
    ld   a,[$C175]                  ; 00:0EE0
    ldh  [<SCX],a                   ; 00:0EE3
    ld   a,[$C176]                  ; 00:0EE5
    ldh  [<SCY],a                   ; 00:0EE8
    ld   a,[$C410]                  ; 00:0EEA
    and  a                          ; 00:0EED
    jr   z,Code000F05               ; 00:0EEE
    ld   a,[$C40B]                  ; 00:0EF0
    and  a                          ; 00:0EF3
    jr   nz,Code000F05              ; 00:0EF4
    ld   [$C175],a                  ; 00:0EF6
    inc  a                          ; 00:0EF9
    ld   [$C40B],a                  ; 00:0EFA
    ld   a,$80                      ; 00:0EFD
    ldh  [<LYC],a                   ; 00:0EFF
    ld   a,$44                      ; 00:0F01
    ldh  [<STAT],a                  ; 00:0F03
Code000F05:
    pop  de                         ; 00:0F05
    pop  hl                         ; 00:0F06
    pop  af                         ; 00:0F07
    ei                              ; 00:0F08
    reti                            ; 00:0F09

Unused000F0A:
    push af                         ; 00:0F0A
    call Sub000F13                  ; 00:0F0B
    pop  af                         ; 00:0F0E
    ld   [ROMBANK],a                ; 00:0F0F
    ret                             ; 00:0F12

Sub000F13:
    ld   a,:Sub1D4006               ; 00:0F13
    ldh  [<$FFBE],a                 ; 00:0F15
    ld   [ROMBANK],a                ; 00:0F17
    call Sub1D4006                  ; 00:0F1A
    ld   a,:Sub1F4006               ; 00:0F1D
    ldh  [<$FFBE],a                 ; 00:0F1F
    ld   [ROMBANK],a                ; 00:0F21
    call Sub1F4006                  ; 00:0F24
    ret                             ; 00:0F27

LoadFullPaletteLong:
    ld   [ROMBANK],a                ; 00:0F28
    ld   hl,W_PalBuffer             ; 00:0F2B
    ld   c,$80                      ; 00:0F2E
Code000F30:
    ld   a,[de]                     ; 00:0F30
    ldi  [hl],a                     ; 00:0F31
    inc  de                         ; 00:0F32
    dec  c                          ; 00:0F33
    jr   nz,Code000F30              ; 00:0F34
    ld   a,$01                      ; 00:0F36
    ldh  [<$FFC0],a                 ; 00:0F38
    ld   a,b                        ; 00:0F3A
    ld   [ROMBANK],a                ; 00:0F3B
    ret                             ; 00:0F3E

LoadSprPaletteLong:
    ld   [ROMBANK],a                ; 00:0F3F
    ld   hl,W_PalBufferSpr          ; 00:0F42
    ld   c,$40                      ; 00:0F45
Code000F47:
    ld   a,[de]                     ; 00:0F47
    ldi  [hl],a                     ; 00:0F48
    inc  de                         ; 00:0F49
    dec  c                          ; 00:0F4A
    jr   nz,Code000F47              ; 00:0F4B
    ld   a,$01                      ; 00:0F4D
    ldh  [<$FFC0],a                 ; 00:0F4F
    ld   a,b                        ; 00:0F51
    ld   [ROMBANK],a                ; 00:0F52
    ret                             ; 00:0F55

LoadScreenTilemapVRAM:
; subroutine: Copy full-screen tilemap at ROM (A:HL), to VRAM starting at (DE),
;  then return to bank B.
; copies 0x168 bytes of tile numbers to VRAM bank 0, then 0x168 bytes of PYX0VCCC
;   attributes to VRAM bank 1
    ld   [ROMBANK],a                ; 00:0F56
    push bc                         ; 00:0F59
    ld   b,$00                      ; 00:0F5A
    ld   c,$12                      ; 00:0F5C
    push de                         ; 00:0F5E
@Loop000F5F:
    push bc                         ; 00:0F5F
    push hl                         ; 00:0F60
    push de                         ; 00:0F61
    ld   bc,$0014                   ; 00:0F62
    call CopyBytes                  ; 00:0F65
    pop  hl                         ; 00:0F68
    ld   bc,$0020                   ; 00:0F69
    add  hl,bc                      ; 00:0F6C
    ld   e,l                        ; 00:0F6D
    ld   d,h                        ; 00:0F6E
    pop  hl                         ; 00:0F6F
    ld   bc,$0014                   ; 00:0F70
    add  hl,bc                      ; 00:0F73
    pop  bc                         ; 00:0F74
    inc  b                          ; 00:0F75
    ld   a,b                        ; 00:0F76
    cp   c                          ; 00:0F77
    jr   nz,@Loop000F5F             ; 00:0F78
    pop  de                         ; 00:0F7A
    ld   b,$00                      ; 00:0F7B
    ld   c,$12                      ; 00:0F7D
    ld   a,$01                      ; 00:0F7F
    ldh  [<VBK],a                   ; 00:0F81
@Loop000F83:
    push bc                         ; 00:0F83
    push hl                         ; 00:0F84
    push de                         ; 00:0F85
    ld   bc,$0014                   ; 00:0F86
    call CopyBytes                  ; 00:0F89
    pop  hl                         ; 00:0F8C
    ld   bc,$0020                   ; 00:0F8D
    add  hl,bc                      ; 00:0F90
    ld   e,l                        ; 00:0F91
    ld   d,h                        ; 00:0F92
    pop  hl                         ; 00:0F93
    ld   bc,$0014                   ; 00:0F94
    add  hl,bc                      ; 00:0F97
    pop  bc                         ; 00:0F98
    inc  b                          ; 00:0F99
    ld   a,b                        ; 00:0F9A
    cp   c                          ; 00:0F9B
    jr   nz,@Loop000F83             ; 00:0F9C
    xor  a                          ; 00:0F9E
    ldh  [<VBK],a                   ; 00:0F9F
    pop  af                         ; 00:0FA1
    ld   [ROMBANK],a                ; 00:0FA2
    ret                             ; 00:0FA5

DMATransferVRAM:
    ld   [ROMBANK],a                ; 00:0FA6
    ld   a,b                        ; 00:0FA9
    ldh  [<HDMA1],a                 ; 00:0FAA
    ld   a,c                        ; 00:0FAC
    ldh  [<HDMA2],a                 ; 00:0FAD
    ld   a,d                        ; 00:0FAF
    ldh  [<HDMA3],a                 ; 00:0FB0
    ld   a,e                        ; 00:0FB2
    ldh  [<HDMA4],a                 ; 00:0FB3
    ld   a,l                        ; 00:0FB5
    ldh  [<HDMA5],a                 ; 00:0FB6
    ld   a,h                        ; 00:0FB8
    ld   [ROMBANK],a                ; 00:0FB9
    ret                             ; 00:0FBC

Unused000FBD:
    ld   [ROMBANK],a                ; 00:0FBD
    push bc                         ; 00:0FC0
    ld   bc,$02D0                   ; 00:0FC1
    ld   de,$D000                   ; 00:0FC4
    call CopyBytes                  ; 00:0FC7
    pop  af                         ; 00:0FCA
    ld   [ROMBANK],a                ; 00:0FCB
    ret                             ; 00:0FCE

Sub000FCF:
    push af                         ; 00:0FCF
    ld   a,:Sub144412               ; 00:0FD0
    ldh  [<$FFBE],a                 ; 00:0FD2
    ld   [ROMBANK],a                ; 00:0FD4
    call Sub144412                  ; 00:0FD7
    pop  af                         ; 00:0FDA
    ldh  [<$FFBE],a                 ; 00:0FDB
    ld   [ROMBANK],a                ; 00:0FDD
    ret                             ; 00:0FE0

Data000FE1:                         ; 00:0FE1
.db $00,$01,$01,$00

Sub000FE5:
    ld   a,[$DA6A]                  ; 00:0FE5
    xor  $01                        ; 00:0FE8
    sla  a                          ; 00:0FEA
    add  e                          ; 00:0FEC
    ld   e,a                        ; 00:0FED
    ld   d,$00                      ; 00:0FEE
    ld   hl,Data000FE1              ; 00:0FF0
    add  hl,de                      ; 00:0FF3
    ld   a,[hl]                     ; 00:0FF4
    ret                             ; 00:0FF5

VerifySaveFileChecksum:
; A: save file number
; Checks if $A118+$40*file is 1, and $A119+$40*file is the sum of the previous $19 bytes
; Sets carry flag if checksum is valid, clears it if not
    swap a                          ; 00:0FF6
    sla  a                          ; 00:0FF8
    sla  a                          ; 00:0FFA
    ld   e,a                        ; 00:0FFC  e = a*40
    ld   d,$00                      ; 00:0FFD
    ld   hl,$A100                   ; 00:0FFF
    add  hl,de                      ; 00:1002  hl = pointer to save file
    call Calc19ByteSum              ; 00:1003  $FF97 = sum of $19 bytes at [HL]
    ldh  a,[<$FF97]                 ; 00:1006
    ld   hl,$A119                   ; 00:1008
    add  hl,de                      ; 00:100B
    cp   [hl]                       ; 00:100C
    jr   nz,@ClearCarry             ; 00:100D
    inc  hl                         ; 00:100F
    ldh  a,[<$FF98]                 ; 00:1010
    cp   [hl]                       ; 00:1012
    jr   nz,@ClearCarry             ; 00:1013
    ld   hl,$A118                   ; 00:1015
    add  hl,de                      ; 00:1018
    ld   a,[hl]                     ; 00:1019
    cp   $01                        ; 00:101A
    jr   nz,@ClearCarry             ; 00:101C
    ld   a,$00                      ; 00:101E
    scf                             ; 00:1020
    ret                             ; 00:1021
@ClearCarry:
    scf                             ; 00:1022
    ccf                             ; 00:1023
    ret                             ; 00:1024

Calc19ByteSum:
; subroutine: Calculate the sum of $19 bytes, starting at [HL]
; returns 16-bit sum in $FF97
    ld   a,$19                      ; 00:1025
CalculateSum:
; subroutine: Calculate the sum of A bytes, starting at [HL]
; returns 16-bit sum in $FF97
    ld   c,a                        ; 00:1027
    xor  a                          ; 00:1028
    ldh  [<$FF97],a                 ; 00:1029
    ldh  [<$FF98],a                 ; 00:102B
    ld   b,a                        ; 00:102D
@Loop:
    ldh  a,[<$FF97]                 ; 00:102E
    add  [hl]                       ; 00:1030
    ldh  [<$FF97],a                 ; 00:1031
    ldh  a,[<$FF98]                 ; 00:1033
    adc  $00                        ; 00:1035
    ldh  [<$FF98],a                 ; 00:1037
    inc  hl                         ; 00:1039
    inc  b                          ; 00:103A
    ld   a,b                        ; 00:103B
    cp   c                          ; 00:103C
    jr   nz,@Loop                   ; 00:103D
    ret                             ; 00:103F

Unused001040:                       ; 00:1040
.db $00,$00,$01,$02,$01,$01,$02,$01

Return001048:
    ret                             ; 00:1048

Unused001049:
    ld   hl,$C372                   ; 00:1049
    ld   a,[$C371]                  ; 00:104C
    or   [hl]                       ; 00:104F
    and  a                          ; 00:1050
    jr   z,@Code00109A              ; 00:1051
    ld   a,[$C371]                  ; 00:1053
    ld   e,a                        ; 00:1056
    ld   a,[$C372]                  ; 00:1057
    ld   d,a                        ; 00:105A
    dec  de                         ; 00:105B
    ld   a,e                        ; 00:105C
    ld   [$C371],a                  ; 00:105D
    ld   a,d                        ; 00:1060
    ld   [$C372],a                  ; 00:1061
    ld   a,[$C370]                  ; 00:1064
    and  a                          ; 00:1067
    jr   z,@Return                  ; 00:1068
    ld   a,[$C373]                  ; 00:106A
    dec  a                          ; 00:106D
    bit  7,a                        ; 00:106E
    jr   nz,@Code001095             ; 00:1070
    ld   a,[$C374]                  ; 00:1072
    inc  a                          ; 00:1075
    and  $01                        ; 00:1076
    ld   [$C374],a                  ; 00:1078
    ld   e,a                        ; 00:107B
    ld   d,$00                      ; 00:107C
    sla  a                          ; 00:107E
    sla  a                          ; 00:1080
    sla  a                          ; 00:1082
    ld   [SRAMBANK],a               ; 00:1084
    ld   a,[$C370]                  ; 00:1087
    sla  a                          ; 00:108A
    ld   l,a                        ; 00:108C
    ld   h,$00                      ; 00:108D
    add  hl,de                      ; 00:108F
    ld   de,Unused001040            ; 00:1090
    add  hl,de                      ; 00:1093
    ld   a,[hl]                     ; 00:1094
@Code001095:
    ld   [$C373],a                  ; 00:1095
    jr   @Return                    ; 00:1098
@Code00109A:
    ld   a,[$C374]                  ; 00:109A
    and  a                          ; 00:109D
    jr   z,@Return                  ; 00:109E
    ld   a,$00                      ; 00:10A0
    ld   [$C374],a                  ; 00:10A2
    ld   [SRAMBANK],a               ; 00:10A5
@Return:
    ret                             ; 00:10A8

Sub0010A9:
    ld   a,$44                      ; 00:10A9
    ldh  [<$FFF2],a                 ; 00:10AB

Sub0010AD:
    ld   a,$03                      ; 00:10AD
    ld   de,$0008                   ; 00:10AF
Return0010B2:
    ret                             ; 00:10B2

Unused0010B3:
    ld   [$C370],a                  ; 00:10B3
    ld   a,[$C381]                  ; 00:10B6
    and  a                          ; 00:10B9
    jr   nz,@Return                 ; 00:10BA
    ldh  a,[<H_GameState]           ; 00:10BC
    cp   $3C                        ; 00:10BE
    jr   z,@Return                  ; 00:10C0
    cp   $3E                        ; 00:10C2
    jr   z,@Return                  ; 00:10C4
    ld   a,e                        ; 00:10C6
    ld   [$C371],a                  ; 00:10C7
    ld   a,d                        ; 00:10CA
    ld   [$C372],a                  ; 00:10CB
    ld   a,$01                      ; 00:10CE
    ld   [$C374],a                  ; 00:10D0
    ld   a,$08                      ; 00:10D3
    ld   [SRAMBANK],a               ; 00:10D5
    ld   a,$02                      ; 00:10D8
    ld   [$C373],a                  ; 00:10DA
@Return:
    ret                             ; 00:10DD

SetROMBank:
    ldh  [<$FFBE],a                 ; 00:10DE
    ld   [ROMBANK],a                ; 00:10E0
    ret                             ; 00:10E3

Sub0010E4:
    push hl                         ; 00:10E4
    ld   a,[W_GameMode]             ; 00:10E5
    cp   $02                        ; 00:10E8
    jr   z,@Code0010FB              ; 00:10EA
    ldh  a,[<H_GlobalTimer]         ; 00:10EC
    ld   hl,$FFBC                   ; 00:10EE
    add  [hl]                       ; 00:10F1
    ld   hl,LY                      ; 00:10F2
    add  [hl]                       ; 00:10F5
    rrca                            ; 00:10F6
    ldh  [<$FFBC],a                 ; 00:10F7
    pop  hl                         ; 00:10F9
    ret                             ; 00:10FA
@Code0010FB:
    ldh  a,[<H_GlobalTimer]         ; 00:10FB
    ldh  [<$FFBC],a                 ; 00:10FD
    pop  hl                         ; 00:10FF
    ret                             ; 00:1100

Sub001101:
    ld   a,[$C28B]                  ; 00:1101
    and  a                          ; 00:1104
    jr   z,Return001123             ; 00:1105
    ld   a,$00                      ; 00:1107
    ld   [$C28B],a                  ; 00:1109
    ld   a,$00                      ; 00:110C
    ldh  [<$FFF2],a                 ; 00:110E
    ldh  [<$FFF3],a                 ; 00:1110
    ldh  [<$FFF4],a                 ; 00:1112
    ld   [$DE68],a                  ; 00:1114
    ld   a,:Sub1F4000               ; 00:1117
    ld   [ROMBANK],a                ; 00:1119
    call Sub1F4000                  ; 00:111C
    ld   a,$10                      ; 00:111F
    ldh  [<$FFB4],a                 ; 00:1121
Return001123:
    ret                             ; 00:1123

Sub001124:
    push af                         ; 00:1124
    sla  e                          ; 00:1125
    rl   d                          ; 00:1127
    sla  e                          ; 00:1129
    rl   d                          ; 00:112B
    sla  e                          ; 00:112D
    rl   d                          ; 00:112F
    ld   a,:Ti_16x16Tiles           ; 00:1131
    ld   [ROMBANK],a                ; 00:1133
    ld   hl,Ti_16x16Tiles           ; 00:1136
    add  hl,de                      ; 00:1139
    ld   a,h                        ; 00:113A
    ldh  [<$FF99],a                 ; 00:113B
    ld   a,l                        ; 00:113D
    ldh  [<$FF9A],a                 ; 00:113E
    ld   a,$98                      ; 00:1140
    ld   b,a                        ; 00:1142
    ld   a,$00                      ; 00:1143
    ld   h,a                        ; 00:1145
    ld   d,a                        ; 00:1146
    ld   c,a                        ; 00:1147
    ldh  a,[<$FF98]                 ; 00:1148
    and  $F0                        ; 00:114A
    ld   l,a                        ; 00:114C
    sla  l                          ; 00:114D
    rl   h                          ; 00:114F
    sla  l                          ; 00:1151
    rl   h                          ; 00:1153
    ldh  a,[<$FF97]                 ; 00:1155
    and  $F0                        ; 00:1157
    ld   e,a                        ; 00:1159
    srl  e                          ; 00:115A
    srl  e                          ; 00:115C
    srl  e                          ; 00:115E
    add  hl,de                      ; 00:1160
    add  hl,bc                      ; 00:1161
    ld   b,h                        ; 00:1162
    ld   c,l                        ; 00:1163
    ld   hl,$DF00                   ; 00:1164
    ld   a,[hl]                     ; 00:1167
    inc  a                          ; 00:1168
    ld   e,a                        ; 00:1169
    ld   a,$00                      ; 00:116A
    ld   d,a                        ; 00:116C
    add  hl,de                      ; 00:116D
    push hl                         ; 00:116E
    ldh  a,[<$FF99]                 ; 00:116F
    ld   h,a                        ; 00:1171
    ldh  a,[<$FF9A]                 ; 00:1172
    ld   l,a                        ; 00:1174
    ldi  a,[hl]                     ; 00:1175
    ld   d,a                        ; 00:1176
    ldi  a,[hl]                     ; 00:1177
    ld   e,a                        ; 00:1178
    ldi  a,[hl]                     ; 00:1179
    ldh  [<$FF9B],a                 ; 00:117A
    ldi  a,[hl]                     ; 00:117C
    ldh  [<$FF9C],a                 ; 00:117D
    ld   a,h                        ; 00:117F
    ldh  [<$FF99],a                 ; 00:1180
    ld   a,l                        ; 00:1182
    ldh  [<$FF9A],a                 ; 00:1183
    pop  hl                         ; 00:1185
    call Sub0011B6                  ; 00:1186
    push hl                         ; 00:1189
    ld   a,$00                      ; 00:118A
    ld   h,a                        ; 00:118C
    ld   a,$20                      ; 00:118D
    ld   l,a                        ; 00:118F
    add  hl,bc                      ; 00:1190
    ld   b,h                        ; 00:1191
    ld   c,l                        ; 00:1192
    ldh  a,[<$FF99]                 ; 00:1193
    ld   h,a                        ; 00:1195
    ldh  a,[<$FF9A]                 ; 00:1196
    ld   l,a                        ; 00:1198
    ldi  a,[hl]                     ; 00:1199
    ld   d,a                        ; 00:119A
    ldi  a,[hl]                     ; 00:119B
    ld   e,a                        ; 00:119C
    ldi  a,[hl]                     ; 00:119D
    ldh  [<$FF9B],a                 ; 00:119E
    ld   a,[hl]                     ; 00:11A0
    ldh  [<$FF9C],a                 ; 00:11A1
    pop  hl                         ; 00:11A3
    call Sub0011B6                  ; 00:11A4
    ld   a,$00                      ; 00:11A7
    ld   [hl],a                     ; 00:11A9
    ld   hl,$DF00                   ; 00:11AA
    ld   a,$0E                      ; 00:11AD
    add  [hl]                       ; 00:11AF
    ld   [hl],a                     ; 00:11B0
    pop  af                         ; 00:11B1
    ld   [ROMBANK],a                ; 00:11B2
    ret                             ; 00:11B5

Sub0011B6:
    ld   a,b                        ; 00:11B6
    ldi  [hl],a                     ; 00:11B7
    ld   a,c                        ; 00:11B8
    ldi  [hl],a                     ; 00:11B9
    ld   a,$02                      ; 00:11BA
    ldi  [hl],a                     ; 00:11BC
    ld   a,d                        ; 00:11BD
    ldi  [hl],a                     ; 00:11BE
    ld   a,e                        ; 00:11BF
    ldi  [hl],a                     ; 00:11C0
    ldh  a,[<$FF9B]                 ; 00:11C1
    ldi  [hl],a                     ; 00:11C3
    ldh  a,[<$FF9C]                 ; 00:11C4
    ldi  [hl],a                     ; 00:11C6
    ret                             ; 00:11C7

Sub0011C8:
    ld   a,$20                      ; 00:11C8
    ldh  [<JOYP],a                  ; 00:11CA
    ldh  a,[<JOYP]                  ; 00:11CC
    ldh  a,[<JOYP]                  ; 00:11CE
    cpl                             ; 00:11D0
    and  $0F                        ; 00:11D1
    swap a                          ; 00:11D3
    ld   b,a                        ; 00:11D5
    ld   a,$10                      ; 00:11D6
    ldh  [<JOYP],a                  ; 00:11D8
    ldh  a,[<JOYP]                  ; 00:11DA
    ldh  a,[<JOYP]                  ; 00:11DC
    ldh  a,[<JOYP]                  ; 00:11DE
    ldh  a,[<JOYP]                  ; 00:11E0
    ldh  a,[<JOYP]                  ; 00:11E2
    ldh  a,[<JOYP]                  ; 00:11E4
    cpl                             ; 00:11E6
    and  $0F                        ; 00:11E7
    or   b                          ; 00:11E9
    ld   c,a                        ; 00:11EA
    ldh  a,[<H_ButtonsHeld]         ; 00:11EB
    xor  c                          ; 00:11ED
    and  c                          ; 00:11EE
    ldh  [<H_ButtonsPressed],a      ; 00:11EF
    ld   a,c                        ; 00:11F1
    ldh  [<H_ButtonsHeld],a         ; 00:11F2
    ld   a,$30                      ; 00:11F4
    ldh  [<JOYP],a                  ; 00:11F6
    ret                             ; 00:11F8

Sub0011F9:
; Copy subroutine $1207 to HRAM $FF80
    ld   c,<H_DMATransferOAM        ; 00:11F9
    ld   b,ROM_DMATransferOAM_End-ROM_DMATransferOAM; 00:11FB
    ld   hl,ROM_DMATransferOAM      ; 00:11FD
@Loop:
    ldi  a,[hl]                     ; 00:1200
    ldh  [c],a                      ; 00:1201
    inc  c                          ; 00:1202
    dec  b                          ; 00:1203
    jr   nz,@Loop                   ; 00:1204
    ret                             ; 00:1206

ROM_DMATransferOAM:
; DMA transfer from the OAM buffer ($C000) to OAM
    ld   a,>W_OAMBuffer             ; 00:1207/FF80
    ldh  [<DMA],a                   ; 00:1209/FF82
    ld   a,$28                      ; 00:120B/FF84
-   dec  a                          ; 00:120D/FF86
    jr   nz,-                       ; 00:120E/FF87
    ret                             ; 00:1210/FF89
ROM_DMATransferOAM_End:

rst_ExecutePtrTable:
; rst $00
; Execute from pointer table: Jump to a 16-bit pointer from a table at [SP], indexed by A
; This is called as a subroutine, but does not return
    ld   e,a                        ; 00:1211 \ de = 2*a
    ld   d,$00                      ; 00:1212 |
    sla  e                          ; 00:1214 |
    rl   d                          ; 00:1216 /
    pop  hl                         ; 00:1218  pull return address (start of pointer table)
    add  hl,de                      ; 00:1219  add index
    ld   e,[hl]                     ; 00:121A \
    inc  hl                         ; 00:121B |
    ld   d,[hl]                     ; 00:121C | hl = pointer from table
    push de                         ; 00:121D |
    pop  hl                         ; 00:121E /
    jp   hl                         ; 00:121F  jump to pointer

rst_ExecutePtrTableLong:
; rst $08 (actually unused)
; Execute from pointer table long: Jump to a 24-bit pointer from a table at [SP], indexed by A
; This is called as a subroutine, but does not return
    ld   e,a                        ; 00:1220 \ de = 3*a
    ld   d,$00                      ; 00:1221 |
    ld   l,a                        ; 00:1223 |
    ld   h,$00                      ; 00:1224 |
    sla  e                          ; 00:1226 |
    rl   d                          ; 00:1228 |
    add  hl,de                      ; 00:122A |
    ld   d,h                        ; 00:122B |
    ld   e,l                        ; 00:122C /
    pop  hl                         ; 00:122D  pull return address (start of pointer table)
    add  hl,de                      ; 00:122E  add index
    ld   e,[hl]                     ; 00:122F \
    inc  hl                         ; 00:1230 |
    ld   d,[hl]                     ; 00:1231 | de = lower bytes of pointer from table
    inc  hl                         ; 00:1232 /
    ld   a,[hl]                     ; 00:1233  load bank byte
    ld   [ROMBANK],a                ; 00:1234  change ROM bank
    ldh  [<$FFBE],a                 ; 00:1237  set current bank in RAM
    push de                         ; 00:1239 \
    pop  hl                         ; 00:123A | jump to loaded pointer
    jp   hl                         ; 00:123B /

rst_CallLong:
; rst $10
; 24-bit call: Run subroutine at a 24-bit pointer at [SP]
; Register A should contain the return bank byte
    ldh  [<$FFBF],a                 ; 00:123C  store old ROM bank
    pop  hl                         ; 00:123E  pull "return" address (address of 24-bit pointer)
    ld   e,[hl]                     ; 00:123F \
    inc  hl                         ; 00:1240 | load lower bytes of pointer
    ld   d,[hl]                     ; 00:1241 |
    inc  hl                         ; 00:1242 /
    ld   a,[hl]                     ; 00:1243  load bank byte
    ld   [ROMBANK],a                ; 00:1244  change ROM bank
    ldh  [<$FFBE],a                 ; 00:1247  set current bank in RAM
    inc  hl                         ; 00:1249 \ push next byte after pointer,
    push hl                         ; 00:124A /  as the subroutine's return address
    push de                         ; 00:124B \
    pop  hl                         ; 00:124C | jump to loaded pointer
    jp   hl                         ; 00:124D /

rst_ReturnLong:
; rst $18
; Return from 24-bit call
; This is called as a subroutine, but does not use its return address
    pop  hl                         ; 00:124E  pop return address from rst $18 (unused)
    pop  hl                         ; 00:124F  pop return address from rst $10
    ldh  a,[<$FFBF]                 ; 00:1250  retrieve old ROM bank
    ld   [ROMBANK],a                ; 00:1252  change ROM bank
    ldh  [<$FFBE],a                 ; 00:1255  set current bank in RAM
    jp   hl                         ; 00:1257  jump to popped return address

Sub001258:
    ldh  a,[<$FFBE]                 ; 00:1258
    push af                         ; 00:125A
    ld   a,$FF                      ; 00:125B
    ld   [$DE68],a                  ; 00:125D
    call Sub000F13                  ; 00:1260
    call Sub00126D                  ; 00:1263
    pop  af                         ; 00:1266
    ldh  [<$FFBE],a                 ; 00:1267
    ld   [ROMBANK],a                ; 00:1269
    ret                             ; 00:126C

Sub00126D:
    ldh  a,[<IE]                    ; 00:126D
    ldh  [<$FF92],a                 ; 00:126F
    res  0,a                        ; 00:1271
Code001273:
    ldh  a,[<LY]                    ; 00:1273
    cp   $91                        ; 00:1275
    jr   nz,Code001273              ; 00:1277
    ldh  a,[<LCDC]                  ; 00:1279
    and  $7F                        ; 00:127B
    ldh  [<LCDC],a                  ; 00:127D
    ldh  a,[<$FF92]                 ; 00:127F
    ldh  [<IE],a                    ; 00:1281
    ret                             ; 00:1283

ClearBytes:
; subroutine: Clear BC bytes of memory, starting at [HL]
    ld   a,$00                      ; 00:1284
    ldi  [hl],a                     ; 00:1286
    dec  bc                         ; 00:1287
    ld   a,c                        ; 00:1288
    or   b                          ; 00:1289
    jr   nz,ClearBytes              ; 00:128A
    ret                             ; 00:128C

Sub00128D:
    ld   hl,$9BFF                   ; 00:128D
    ld   bc,$0400                   ; 00:1290
    ld   a,$01                      ; 00:1293
    ldh  [<VBK],a                   ; 00:1295
Code001297:
    xor  a                          ; 00:1297
    ldd  [hl],a                     ; 00:1298
    dec  bc                         ; 00:1299
    ld   a,b                        ; 00:129A
    or   c                          ; 00:129B
    jr   nz,Code001297              ; 00:129C
    ld   hl,$9FFF                   ; 00:129E
    ld   bc,$0400                   ; 00:12A1
Code0012A4:
    ld   a,$06                      ; 00:12A4
    ldd  [hl],a                     ; 00:12A6
    dec  bc                         ; 00:12A7
    ld   a,b                        ; 00:12A8
    or   c                          ; 00:12A9
    jr   nz,Code0012A4              ; 00:12AA
    ld   hl,$9BFF                   ; 00:12AC
    ld   bc,$0400                   ; 00:12AF
    xor  a                          ; 00:12B2
    ldh  [<VBK],a                   ; 00:12B3
Code0012B5:
    ld   a,$F4                      ; 00:12B5
    ldd  [hl],a                     ; 00:12B7
    dec  bc                         ; 00:12B8
    ld   a,b                        ; 00:12B9
    or   c                          ; 00:12BA
    jr   nz,Code0012B5              ; 00:12BB
    ld   hl,$9FFF                   ; 00:12BD
    ld   bc,$0400                   ; 00:12C0
Code0012C3:
    ld   a,$F7                      ; 00:12C3
    ldd  [hl],a                     ; 00:12C5
    dec  bc                         ; 00:12C6
    ld   a,b                        ; 00:12C7
    or   c                          ; 00:12C8
    jr   nz,Code0012C3              ; 00:12C9
    ret                             ; 00:12CB

LoadAnimGr_1Player:
    ld   a,:Gr_PlayerSuper          ; 00:12CC
    ld   [ROMBANK],a                ; 00:12CE
    ldh  a,[<VBK]                   ; 00:12D1
    push af                         ; 00:12D3
    ld   a,$01                      ; 00:12D4
    ldh  [<VBK],a                   ; 00:12D6
    ldh  a,[<H_PlAnimPtrHigh]       ; 00:12D8
    ldh  [<HDMA1],a                 ; 00:12DA
    ldh  a,[<H_PlAnimPtrLow]        ; 00:12DC
    ldh  [<HDMA2],a                 ; 00:12DE
    ld   a,$80                      ; 00:12E0
    ldh  [<HDMA3],a                 ; 00:12E2
    ld   a,$00                      ; 00:12E4
    ldh  [<HDMA4],a                 ; 00:12E6
    ld   a,$07                      ; 00:12E8
    ldh  [<HDMA5],a                 ; 00:12EA
    pop  af                         ; 00:12EC
    ldh  [<VBK],a                   ; 00:12ED
    ldh  a,[<$FFBE]                 ; 00:12EF
    ld   [ROMBANK],a                ; 00:12F1
    ret                             ; 00:12F4

LoadAnimGr_2Player:
    ld   a,:Gr_PlayerSuper          ; 00:12F5
    ld   [ROMBANK],a                ; 00:12F7
    ldh  a,[<VBK]                   ; 00:12FA
    push af                         ; 00:12FC
    ld   a,$01                      ; 00:12FD
    ldh  [<VBK],a                   ; 00:12FF
    ldh  a,[<H_PlAnimPtrHigh]       ; 00:1301
    ldh  [<HDMA1],a                 ; 00:1303
    ldh  a,[<H_PlAnimPtrLow]        ; 00:1305
    ldh  [<HDMA2],a                 ; 00:1307
    ld   a,$80                      ; 00:1309
    ldh  [<HDMA3],a                 ; 00:130B
    ld   a,$00                      ; 00:130D
    ldh  [<HDMA4],a                 ; 00:130F
    ld   a,$07                      ; 00:1311
    ldh  [<HDMA5],a                 ; 00:1313
    ld   a,[$C365]                  ; 00:1315
    ldh  [<HDMA1],a                 ; 00:1318
    ld   a,[$C364]                  ; 00:131A
    ldh  [<HDMA2],a                 ; 00:131D
    ld   a,$80                      ; 00:131F
    ldh  [<HDMA3],a                 ; 00:1321
    ld   a,$80                      ; 00:1323
    ldh  [<HDMA4],a                 ; 00:1325
    ld   a,$07                      ; 00:1327
    ldh  [<HDMA5],a                 ; 00:1329
    pop  af                         ; 00:132B
    ldh  [<VBK],a                   ; 00:132C
    ldh  a,[<$FFBE]                 ; 00:132E
    ld   [ROMBANK],a                ; 00:1330
    ret                             ; 00:1333

LoadAnimGr_RedCoin:
    ld   hl,$C376                   ; 00:1334
    ld   a,[hl]                     ; 00:1337
    and  a                          ; 00:1338
    jr   z,@Return                  ; 00:1339
    ld   [hl],$00                   ; 00:133B
    ld   a,:Gr_RedCoinAnim          ; 00:133D
    ld   [ROMBANK],a                ; 00:133F
    ldh  a,[<VBK]                   ; 00:1342
    push af                         ; 00:1344
    ld   a,$01                      ; 00:1345
    ldh  [<VBK],a                   ; 00:1347
    ld   a,[$C378]                  ; 00:1349
    ldh  [<HDMA1],a                 ; 00:134C
    ld   a,[$C377]                  ; 00:134E
    ldh  [<HDMA2],a                 ; 00:1351
    ld   a,$88                      ; 00:1353
    ldh  [<HDMA3],a                 ; 00:1355
    ld   a,$00                      ; 00:1357
    ldh  [<HDMA4],a                 ; 00:1359
    ld   a,$03                      ; 00:135B
    ldh  [<HDMA5],a                 ; 00:135D
    pop  af                         ; 00:135F
    ldh  [<VBK],a                   ; 00:1360
    ldh  a,[<$FFBE]                 ; 00:1362
    ld   [ROMBANK],a                ; 00:1364
@Return:
    ret                             ; 00:1367

LoadAnimGr_Global:
    ld   hl,$C379                   ; 00:1368
    ld   a,[hl]                     ; 00:136B
    and  a                          ; 00:136C
    jr   z,@Code001399              ; 00:136D
    ld   [hl],$00                   ; 00:136F \ update dynamic graphics for underwater surface
    ld   a,:Gr_UnderwaterAnim       ; 00:1371
    ld   [ROMBANK],a                ; 00:1373
    ldh  a,[<VBK]                   ; 00:1376
    push af                         ; 00:1378
    xor  a                          ; 00:1379
    ldh  [<VBK],a                   ; 00:137A
    ld   a,[$C37B]                  ; 00:137C
    ldh  [<HDMA1],a                 ; 00:137F
    ld   a,[$C37A]                  ; 00:1381
    ldh  [<HDMA2],a                 ; 00:1384
    ld   a,$93                      ; 00:1386
    ldh  [<HDMA3],a                 ; 00:1388
    ld   a,$80                      ; 00:138A
    ldh  [<HDMA4],a                 ; 00:138C
    xor  a                          ; 00:138E
    ldh  [<HDMA5],a                 ; 00:138F
    pop  af                         ; 00:1391
    ldh  [<VBK],a                   ; 00:1392
    ldh  a,[<$FFBE]                 ; 00:1394
    ld   [ROMBANK],a                ; 00:1396 /
@Code001399:
    ld   hl,$C37D                   ; 00:1399
    ld   a,[hl]                     ; 00:139C
    and  a                          ; 00:139D
    jr   z,@Return                  ; 00:139E
    ld   [hl],$00                   ; 00:13A0 \ update dynamic graphics for water/lava
    ld   a,:Gr_WaterLavaAnim        ; 00:13A2
    ld   [ROMBANK],a                ; 00:13A4
    ldh  a,[<VBK]                   ; 00:13A7
    push af                         ; 00:13A9
    xor  a                          ; 00:13AA
    ldh  [<VBK],a                   ; 00:13AB
    ld   a,[$C37F]                  ; 00:13AD
    ldh  [<HDMA1],a                 ; 00:13B0
    ld   a,[$C37E]                  ; 00:13B2
    ldh  [<HDMA2],a                 ; 00:13B5
    ld   a,$93                      ; 00:13B7
    ldh  [<HDMA3],a                 ; 00:13B9
    ld   a,$F0                      ; 00:13BB
    ldh  [<HDMA4],a                 ; 00:13BD
    xor  a                          ; 00:13BF
    ldh  [<HDMA5],a                 ; 00:13C0
    pop  af                         ; 00:13C2
    ldh  [<VBK],a                   ; 00:13C3
    ldh  a,[<$FFBE]                 ; 00:13C5
    ld   [ROMBANK],a                ; 00:13C7 /
@Return:
    ret                             ; 00:13CA

LoadAnimGr_Race:
    ld   hl,$C376                   ; 00:13CB
    ld   a,[hl]                     ; 00:13CE
    and  a                          ; 00:13CF
    jr   z,@Code0013FE              ; 00:13D0
    ld   [hl],$00                   ; 00:13D2 \ update dynamic graphics for most race blocks
    ld   a,:Gr_FaceSolidSpikedAnim  ; 00:13D4
    ld   [ROMBANK],a                ; 00:13D6
    ldh  a,[<VBK]                   ; 00:13D9
    push af                         ; 00:13DB
    ld   a,$01                      ; 00:13DC
    ldh  [<VBK],a                   ; 00:13DE
    ld   a,[$C378]                  ; 00:13E0
    ldh  [<HDMA1],a                 ; 00:13E3
    ld   a,[$C377]                  ; 00:13E5
    ldh  [<HDMA2],a                 ; 00:13E8
    ld   a,$88                      ; 00:13EA
    ldh  [<HDMA3],a                 ; 00:13EC
    ld   a,$00                      ; 00:13EE
    ldh  [<HDMA4],a                 ; 00:13F0
    ld   a,$0B                      ; 00:13F2
    ldh  [<HDMA5],a                 ; 00:13F4
    pop  af                         ; 00:13F6
    ldh  [<VBK],a                   ; 00:13F7
    ldh  a,[<$FFBE]                 ; 00:13F9
    ld   [ROMBANK],a                ; 00:13FB /
@Code0013FE:
    ld   hl,$C388                   ; 00:13FE
    ld   a,[hl]                     ; 00:1401
    and  a                          ; 00:1402
    jr   z,@Return                  ; 00:1403
    ld   [hl],$00                   ; 00:1405 \ update 3-2-1 block graphics
    ld   a,:Gr_321BlockAnim         ; 00:1407
    ld   [ROMBANK],a                ; 00:1409
    ldh  a,[<VBK]                   ; 00:140C
    push af                         ; 00:140E
    ld   a,$01                      ; 00:140F
    ldh  [<VBK],a                   ; 00:1411
    ld   a,[$C387]                  ; 00:1413
    ldh  [<HDMA1],a                 ; 00:1416
    ld   a,[$C386]                  ; 00:1418
    ldh  [<HDMA2],a                 ; 00:141B
    ld   a,$88                      ; 00:141D
    ldh  [<HDMA3],a                 ; 00:141F
    ld   a,$C0                      ; 00:1421
    ldh  [<HDMA4],a                 ; 00:1423
    ld   a,$03                      ; 00:1425
    ldh  [<HDMA5],a                 ; 00:1427
    pop  af                         ; 00:1429
    ldh  [<VBK],a                   ; 00:142A
    ldh  a,[<$FFBE]                 ; 00:142C
    ld   [ROMBANK],a                ; 00:142E /
@Return:
    ret                             ; 00:1431

CopyBytesLong:
    push af                         ; 00:1432
    ld   a,[$C415]                  ; 00:1433
    ld   [ROMBANK],a                ; 00:1436
    call CopyBytes                  ; 00:1439
    pop  af                         ; 00:143C
    ld   [ROMBANK],a                ; 00:143D
    ret                             ; 00:1440

CopyBytes:
; subroutine: Copy BC bytes from [HL] to [DE]
    ldi  a,[hl]                     ; 00:1441
    ld   [de],a                     ; 00:1442
    inc  de                         ; 00:1443
    dec  bc                         ; 00:1444
    ld   a,b                        ; 00:1445
    or   c                          ; 00:1446
    jr   nz,CopyBytes               ; 00:1447
    ret                             ; 00:1449

DataPtrs00144A:                     ; 00:144A
.dl $00DF01, TiUp_094647, TiUp_0955DA, TiUp_044AB2,\
    TiUp_1146EA, TiUp_11470A, TiUp_11471D, TiUp_114753,\
    TiUp_114732, TiUp_1146E5, TiUp_114000, TiUp_064A79,\
    TiUp_1150E4, TiUp_115162, TiUp_1151E0, TiUp_115123,\
    TiUp_1151A1, TiUp_11520F

Sub001480:
    push af                         ; 00:1480
    call Sub0014AA                  ; 00:1481
    pop  af                         ; 00:1484
    call SetROMBank                 ; 00:1485
    ret                             ; 00:1488

Code001489:
    inc  de                         ; 00:1489
    ld   h,a                        ; 00:148A
    ld   a,[de]                     ; 00:148B
    ld   l,a                        ; 00:148C
    inc  de                         ; 00:148D
    ld   a,[de]                     ; 00:148E
    inc  de                         ; 00:148F
    call Sub0014CD                  ; 00:1490
    ld   a,[de]                     ; 00:1493
    cp   $00                        ; 00:1494
    jr   nz,Code001489              ; 00:1496
    ld   a,[$C171]                  ; 00:1498
    and  a                          ; 00:149B
    jr   nz,Code0014A5              ; 00:149C
    xor  a                          ; 00:149E
    ld   [$DF00],a                  ; 00:149F
    ld   [W_TiUpBuffer],a           ; 00:14A2
Code0014A5:
    xor  a                          ; 00:14A5
    ld   [$C171],a                  ; 00:14A6
    ret                             ; 00:14A9

Sub0014AA:
    ld   hl,DataPtrs00144A          ; 00:14AA
    ld   d,$00                      ; 00:14AD
    ld   a,[$C171]                  ; 00:14AF
    ld   e,a                        ; 00:14B2
    sla  a                          ; 00:14B3
    add  e                          ; 00:14B5
    ld   e,a                        ; 00:14B6
    add  hl,de                      ; 00:14B7
    ld   e,[hl]                     ; 00:14B8
    inc  hl                         ; 00:14B9
    ld   d,[hl]                     ; 00:14BA
    inc  hl                         ; 00:14BB
    ld   a,[hl]                     ; 00:14BC
    ld   [ROMBANK],a                ; 00:14BD
    ld   a,[de]                     ; 00:14C0
    cp   $00                        ; 00:14C1
    jr   nz,Code001489              ; 00:14C3
    xor  a                          ; 00:14C5
    ld   [$DF00],a                  ; 00:14C6
    ld   [W_TiUpBuffer],a           ; 00:14C9
    ret                             ; 00:14CC

Sub0014CD:
    push af                         ; 00:14CD
    and  $3F                        ; 00:14CE
    ld   b,a                        ; 00:14D0
    pop  af                         ; 00:14D1
    rlca                            ; 00:14D2
    rlca                            ; 00:14D3
    and  $03                        ; 00:14D4
    jr   z,Code0014E0               ; 00:14D6
    dec  a                          ; 00:14D8
    jr   z,Code0014FE               ; 00:14D9
    dec  a                          ; 00:14DB
    jr   z,Code001522               ; 00:14DC
    jr   Code001539                 ; 00:14DE
Code0014E0:
    ld   a,$01                      ; 00:14E0
    ldh  [<VBK],a                   ; 00:14E2
    ld   a,[de]                     ; 00:14E4
    ld   [hl],a                     ; 00:14E5
    inc  de                         ; 00:14E6
    xor  a                          ; 00:14E7
    ldh  [<VBK],a                   ; 00:14E8
    ld   a,[de]                     ; 00:14EA
    ldi  [hl],a                     ; 00:14EB
    ld   a,l                        ; 00:14EC
    and  $1F                        ; 00:14ED
    jr   nz,Code0014F9              ; 00:14EF
    ld   a,l                        ; 00:14F1
    sub  $20                        ; 00:14F2
    ld   l,a                        ; 00:14F4
    ld   a,h                        ; 00:14F5
    sbc  $00                        ; 00:14F6
    ld   h,a                        ; 00:14F8
Code0014F9:
    inc  de                         ; 00:14F9
    dec  b                          ; 00:14FA
    jr   nz,Code0014E0              ; 00:14FB
    ret                             ; 00:14FD

Code0014FE:
    ld   a,[de]                     ; 00:14FE
    ldh  [<$FF97],a                 ; 00:14FF
    inc  de                         ; 00:1501
    ld   a,[de]                     ; 00:1502
    ld   c,a                        ; 00:1503
    inc  de                         ; 00:1504
Code001505:
    ld   a,$01                      ; 00:1505
    ldh  [<VBK],a                   ; 00:1507
    ldh  a,[<$FF97]                 ; 00:1509
    ld   [hl],a                     ; 00:150B
    xor  a                          ; 00:150C
    ldh  [<VBK],a                   ; 00:150D
    ld   a,c                        ; 00:150F
    ldi  [hl],a                     ; 00:1510
    ld   a,l                        ; 00:1511
    and  $1F                        ; 00:1512
    jr   nz,Code00151E              ; 00:1514
    ld   a,l                        ; 00:1516
    sub  $20                        ; 00:1517
    ld   l,a                        ; 00:1519
    ld   a,h                        ; 00:151A
    sbc  $00                        ; 00:151B
    ld   h,a                        ; 00:151D
Code00151E:
    dec  b                          ; 00:151E
    jr   nz,Code001505              ; 00:151F
    ret                             ; 00:1521

Code001522:
    ld   a,$01                      ; 00:1522
    ldh  [<VBK],a                   ; 00:1524
    ld   a,[de]                     ; 00:1526
    ld   [hl],a                     ; 00:1527
    inc  de                         ; 00:1528
    xor  a                          ; 00:1529
    ldh  [<VBK],a                   ; 00:152A
    ld   a,[de]                     ; 00:152C
    ld   [hl],a                     ; 00:152D
    inc  de                         ; 00:152E
    ld   a,b                        ; 00:152F
    ld   bc,$0020                   ; 00:1530
    add  hl,bc                      ; 00:1533
    ld   b,a                        ; 00:1534
    dec  b                          ; 00:1535
    jr   nz,Code001522              ; 00:1536
    ret                             ; 00:1538

Code001539:
    ld   a,[de]                     ; 00:1539
    ldh  [<$FF97],a                 ; 00:153A
    inc  de                         ; 00:153C
    ld   a,[de]                     ; 00:153D
    ldh  [<$FF98],a                 ; 00:153E
    inc  de                         ; 00:1540
Code001541:
    ld   a,$01                      ; 00:1541
    ldh  [<VBK],a                   ; 00:1543
    ldh  a,[<$FF97]                 ; 00:1545
    ld   [hl],a                     ; 00:1547
    xor  a                          ; 00:1548
    ldh  [<VBK],a                   ; 00:1549
    ldh  a,[<$FF98]                 ; 00:154B
    ld   [hl],a                     ; 00:154D
    ld   a,b                        ; 00:154E
    ld   bc,$0020                   ; 00:154F
    add  hl,bc                      ; 00:1552
    ld   b,a                        ; 00:1553
    dec  b                          ; 00:1554
    jr   nz,Code001541              ; 00:1555
    ret                             ; 00:1557

Sub001558:
    ld   a,:VerifyRecordsChecksum   ; 00:1558
    ld   [ROMBANK],a                ; 00:155A
    call VerifyRecordsChecksum      ; 00:155D
    jr   c,@Code001565              ; 00:1560
    call SetRecordsDefaults         ; 00:1562
@Code001565:
    ldh  a,[<$FFBE]                 ; 00:1565
    ld   [ROMBANK],a                ; 00:1567
    ret                             ; 00:156A

LoadScreenTilemapD480:
    ld   bc,$D480                   ; 00:156B
    jr   Code001573                 ; 00:156E

LoadScreenTilemapD000:
    ld   bc,$D000                   ; 00:1570
Code001573:
    push af                         ; 00:1573
    ld   a,[$C415]                  ; 00:1574
    ld   [ROMBANK],a                ; 00:1577
    ld   d,$24                      ; 00:157A
Code00157C:
    ldi  a,[hl]                     ; 00:157C
    ld   [bc],a                     ; 00:157D
    inc  bc                         ; 00:157E
    ld   a,c                        ; 00:157F
    and  $1F                        ; 00:1580
    cp   $14                        ; 00:1582
    jr   nz,Code00157C              ; 00:1584
Code001586:
    xor  a                          ; 00:1586
    ld   [bc],a                     ; 00:1587
    inc  bc                         ; 00:1588
    ld   a,c                        ; 00:1589
    and  $1F                        ; 00:158A
    jr   nz,Code001586              ; 00:158C
    dec  d                          ; 00:158E
    jr   nz,Code00157C              ; 00:158F
    pop  af                         ; 00:1591
    ld   [ROMBANK],a                ; 00:1592
    ret                             ; 00:1595

Sub001596:
    push af                         ; 00:1596
    ld   a,[$C415]                  ; 00:1597
    ld   [ROMBANK],a                ; 00:159A
    ld   c,$04                      ; 00:159D
Code00159F:
    ld   b,$12                      ; 00:159F
Code0015A1:
    ld   a,[de]                     ; 00:15A1
    ldi  [hl],a                     ; 00:15A2
    inc  de                         ; 00:15A3
    dec  b                          ; 00:15A4
    jr   nz,Code0015A1              ; 00:15A5
    ld   a,l                        ; 00:15A7
    add  $0E                        ; 00:15A8
    ld   l,a                        ; 00:15AA
    ld   a,h                        ; 00:15AB
    adc  $00                        ; 00:15AC
    ld   h,a                        ; 00:15AE
    dec  c                          ; 00:15AF
    jr   nz,Code00159F              ; 00:15B0
    pop  af                         ; 00:15B2
    ld   [ROMBANK],a                ; 00:15B3
    ret                             ; 00:15B6

Unused0015B7:
    push af                         ; 00:15B7
    ld   a,[$C415]                  ; 00:15B8
    ld   [ROMBANK],a                ; 00:15BB
@Code0015BE:
    ld   a,$0A                      ; 00:15BE
    ldh  [<$FF9A],a                 ; 00:15C0
@Code0015C2:
    push de                         ; 00:15C2
    ld   a,[de]                     ; 00:15C3
    ldi  [hl],a                     ; 00:15C4
    ld   a,e                        ; 00:15C5
    add  $68                        ; 00:15C6
    ld   e,a                        ; 00:15C8
    ld   a,d                        ; 00:15C9
    adc  $01                        ; 00:15CA
    ld   d,a                        ; 00:15CC
    ld   a,[de]                     ; 00:15CD
    ld   [bc],a                     ; 00:15CE
    inc  bc                         ; 00:15CF
    pop  de                         ; 00:15D0
    inc  de                         ; 00:15D1
    ldh  a,[<$FF9A]                 ; 00:15D2
    dec  a                          ; 00:15D4
    ldh  [<$FF9A],a                 ; 00:15D5
    jr   nz,@Code0015C2             ; 00:15D7
    ld   a,e                        ; 00:15D9
    add  $0A                        ; 00:15DA
    ld   e,a                        ; 00:15DC
    ld   a,d                        ; 00:15DD
    adc  $00                        ; 00:15DE
    ld   d,a                        ; 00:15E0
    ld   a,l                        ; 00:15E1
    add  $16                        ; 00:15E2
    ld   l,a                        ; 00:15E4
    ld   a,h                        ; 00:15E5
    adc  $00                        ; 00:15E6
    ld   h,a                        ; 00:15E8
    ld   a,c                        ; 00:15E9
    add  $16                        ; 00:15EA
    ld   c,a                        ; 00:15EC
    ld   a,b                        ; 00:15ED
    adc  $00                        ; 00:15EE
    ld   b,a                        ; 00:15F0
    ldh  a,[<$FF99]                 ; 00:15F1
    dec  a                          ; 00:15F3
    ldh  [<$FF99],a                 ; 00:15F4
    jr   nz,@Code0015BE             ; 00:15F6
    pop  af                         ; 00:15F8
    ld   [ROMBANK],a                ; 00:15F9
    ret                             ; 00:15FC

Sub0015FD:
    push af                         ; 00:15FD
    ld   a,:Sub157708               ; 00:15FE
    ldh  [<$FFBE],a                 ; 00:1600
    ld   [ROMBANK],a                ; 00:1602
    call Sub157708                  ; 00:1605
    pop  af                         ; 00:1608
    ldh  [<$FFBE],a                 ; 00:1609
    ld   [ROMBANK],a                ; 00:160B
    ret                             ; 00:160E

Sub00160F:
    push af                         ; 00:160F
    ld   a,:Sub157A4A               ; 00:1610
    ld   [ROMBANK],a                ; 00:1612
    call Sub157A4A                  ; 00:1615
    pop  af                         ; 00:1618
    ld   [ROMBANK],a                ; 00:1619
    ret                             ; 00:161C

Code00161D:
    ld   a,:Code0A5CC4              ; 00:161D
    ldh  [<$FFBE],a                 ; 00:161F
    ld   [ROMBANK],a                ; 00:1621
    jp   Code0A5CC4                 ; 00:1624

VRAMPtrs001627:                     ; 00:1627
.dw $9985,$99C5,$99E8

Sub00162D:
    ldh  a,[<$FFA6]                 ; 00:162D
    and  a                          ; 00:162F
    ret  z                          ; 00:1630
    ldh  a,[<$FF98]                 ; 00:1631
    ld   l,a                        ; 00:1633
    ldh  a,[<$FF97]                 ; 00:1634
    cp   l                          ; 00:1636
    jr   z,Code00165B               ; 00:1637
    ld   bc,VRAMPtrs001627          ; 00:1639
    ld   h,$00                      ; 00:163C
    sla  l                          ; 00:163E
    add  hl,bc                      ; 00:1640
    ld   d,h                        ; 00:1641
    ld   e,l                        ; 00:1642
    ld   a,[de]                     ; 00:1643
    inc  de                         ; 00:1644
    ld   l,a                        ; 00:1645
    ld   a,[de]                     ; 00:1646
    ld   h,a                        ; 00:1647
    ld   [hl],$FF                   ; 00:1648
    ld   h,$00                      ; 00:164A
    ldh  a,[<$FF97]                 ; 00:164C
    sla  a                          ; 00:164E
    ld   l,a                        ; 00:1650
    add  hl,bc                      ; 00:1651
    ld   d,h                        ; 00:1652
    ld   e,l                        ; 00:1653
    ld   a,[de]                     ; 00:1654
    inc  de                         ; 00:1655
    ld   l,a                        ; 00:1656
    ld   a,[de]                     ; 00:1657
    ld   h,a                        ; 00:1658
    ld   [hl],$24                   ; 00:1659
Code00165B:
    ldh  a,[<$FF99]                 ; 00:165B
    and  a                          ; 00:165D
    jr   nz,Code001661              ; 00:165E
    ret                             ; 00:1660

Code001661:
    ld   hl,$99EC                   ; 00:1661
    ld   a,[$C3F1]                  ; 00:1664
    and  $03                        ; 00:1667
    inc  a                          ; 00:1669
    ld   [hl],a                     ; 00:166A
    dec  hl                         ; 00:166B
    dec  hl                         ; 00:166C
    ld   a,[$C3F1]                  ; 00:166D
    srl  a                          ; 00:1670
    srl  a                          ; 00:1672
    inc  a                          ; 00:1674
    ld   [hl],a                     ; 00:1675
    ret                             ; 00:1676

Sub001677:
    xor  a                          ; 00:1677
    ldh  [<SCX],a                   ; 00:1678
    ld   a,[$C3F2]                  ; 00:167A
    ldh  [<SCY],a                   ; 00:167D
    ld   a,[$C3F4]                  ; 00:167F
    and  a                          ; 00:1682
    ret  nz                         ; 00:1683
    ld   a,$01                      ; 00:1684
    ldh  [<VBK],a                   ; 00:1686
    ld   a,[$C3F6]                  ; 00:1688
    ld   l,a                        ; 00:168B
    ld   a,[$C3F7]                  ; 00:168C
    ld   h,a                        ; 00:168F
    push hl                         ; 00:1690
    ld   de,$0600                   ; 00:1691
    add  hl,de                      ; 00:1694
    ld   a,[$C3F9]                  ; 00:1695
    ld   e,a                        ; 00:1698
    ld   a,[$C3FA]                  ; 00:1699
    ld   d,a                        ; 00:169C
    ld   bc,$0020                   ; 00:169D
    ld   a,[$C3F8]                  ; 00:16A0
    ld   [$C415],a                  ; 00:16A3
    ld   a,$00                      ; 00:16A6
    push bc                         ; 00:16A8
    push de                         ; 00:16A9
    call CopyBytesLong              ; 00:16AA
    pop  de                         ; 00:16AD
    pop  bc                         ; 00:16AE
    pop  hl                         ; 00:16AF
    xor  a                          ; 00:16B0
    ldh  [<VBK],a                   ; 00:16B1
    ld   a,[$C3F8]                  ; 00:16B3
    ld   [$C415],a                  ; 00:16B6
    ld   a,$00                      ; 00:16B9
    call CopyBytesLong              ; 00:16BB
    ld   a,$08                      ; 00:16BE
    ld   [$C3F4],a                  ; 00:16C0
    ret                             ; 00:16C3

Sub0016C4:
    ld   b,a                        ; 00:16C4
    ld   a,[$CDE2]                  ; 00:16C5
    bit  4,a                        ; 00:16C8
    jp   nz,Code001736              ; 00:16CA
    ld   a,[$CDF3]                  ; 00:16CD
    bit  7,a                        ; 00:16D0
    jr   z,Code0016D8               ; 00:16D2
    push de                         ; 00:16D4
    ld   de,$CDE3                   ; 00:16D5
Code0016D8:
    ld   a,d                        ; 00:16D8
    ldh  [<$FF97],a                 ; 00:16D9
    ld   a,e                        ; 00:16DB
    ldh  [<$FF98],a                 ; 00:16DC
    ld   a,b                        ; 00:16DE
    call Sub001771                  ; 00:16DF
    ldh  [<SVBK],a                  ; 00:16E2
    ld   c,$10                      ; 00:16E4
    ld   a,[$CDE2]                  ; 00:16E6
    and  $60                        ; 00:16E9
    ld   b,a                        ; 00:16EB
    jr   nz,Code0016F7              ; 00:16EC
Code0016EE:
    ldi  a,[hl]                     ; 00:16EE
    ld   [de],a                     ; 00:16EF
    inc  de                         ; 00:16F0
    dec  c                          ; 00:16F1
    jr   nz,Code0016EE              ; 00:16F2
    jp   Code001721                 ; 00:16F4
Code0016F7:
    ldi  a,[hl]                     ; 00:16F7
    bit  6,b                        ; 00:16F8
    jr   z,Code001718               ; 00:16FA
    push hl                         ; 00:16FC
    push af                         ; 00:16FD
    ld   a,c                        ; 00:16FE
    dec  a                          ; 00:16FF
    xor  $01                        ; 00:1700
    ld   l,a                        ; 00:1702
    ldh  a,[<$FF98]                 ; 00:1703
    add  l                          ; 00:1705
    ld   l,a                        ; 00:1706
    ldh  a,[<$FF97]                 ; 00:1707
    adc  $00                        ; 00:1709
    ld   h,a                        ; 00:170B
    pop  af                         ; 00:170C
    bit  5,b                        ; 00:170D
    jr   z,Code001714               ; 00:170F
    call Sub00173F                  ; 00:1711
Code001714:
    ld   [hl],a                     ; 00:1714
    pop  hl                         ; 00:1715
    jr   Code00171C                 ; 00:1716
Code001718:
    call Sub00173F                  ; 00:1718
    ld   [de],a                     ; 00:171B
Code00171C:
    inc  de                         ; 00:171C
    dec  c                          ; 00:171D
    jp   nz,Code0016F7              ; 00:171E
Code001721:
    ld   a,[$CDF3]                  ; 00:1721
    bit  7,a                        ; 00:1724
    jr   z,Code00172C               ; 00:1726
    pop  de                         ; 00:1728
    call Sub001756                  ; 00:1729
Code00172C:
    ld   a,$01                      ; 00:172C
    ldh  [<SVBK],a                  ; 00:172E
    ld   a,$15                      ; 00:1730
    ld   [ROMBANK],a                ; 00:1732
    ret                             ; 00:1735

Code001736:
    ld   c,$10                      ; 00:1736
    xor  a                          ; 00:1738
Code001739:
    ld   [de],a                     ; 00:1739
    inc  de                         ; 00:173A
    dec  c                          ; 00:173B
    jr   nz,Code001739              ; 00:173C
    ret                             ; 00:173E

Sub00173F:
    cp   $00                        ; 00:173F
    ret  z                          ; 00:1741
    cp   $66                        ; 00:1742
    ret  z                          ; 00:1744
    cp   $99                        ; 00:1745
    ret  z                          ; 00:1747
    cp   $FF                        ; 00:1748
    ret  z                          ; 00:174A
    push bc                         ; 00:174B
    ld   b,a                        ; 00:174C
    ld   a,$01                      ; 00:174D
Code00174F:
    srl  b                          ; 00:174F
    rla                             ; 00:1751
    jr   nc,Code00174F              ; 00:1752
    pop  bc                         ; 00:1754
    ret                             ; 00:1755

Sub001756:
    ld   b,$08                      ; 00:1756
Code001758:
    ld   hl,$CDE3                   ; 00:1758
    ld   c,$80                      ; 00:175B
Code00175D:
    sla  [hl]                       ; 00:175D
    rra                             ; 00:175F
    inc  hl                         ; 00:1760
    sla  [hl]                       ; 00:1761
    rr   c                          ; 00:1763
    inc  hl                         ; 00:1765
    jr   nc,Code00175D              ; 00:1766
    ld   [de],a                     ; 00:1768
    inc  de                         ; 00:1769
    ld   a,c                        ; 00:176A
    ld   [de],a                     ; 00:176B
    inc  de                         ; 00:176C
    dec  b                          ; 00:176D
    jr   nz,Code001758              ; 00:176E
    ret                             ; 00:1770

Sub001771:
    push de                         ; 00:1771
    ld   h,$00                      ; 00:1772
    ld   l,a                        ; 00:1774
    ld   c,$04                      ; 00:1775
    call Sub001802                  ; 00:1777
    ld   hl,W_SpriteStatus          ; 00:177A
    add  hl,de                      ; 00:177D
    pop  de                         ; 00:177E
    ld   a,[$D915]                  ; 00:177F
    ret                             ; 00:1782

Sub001783:
    ld   a,[$CDF3]                  ; 00:1783
    ld   c,$06                      ; 00:1786
    ld   hl,$0000                   ; 00:1788
    bit  7,a                        ; 00:178B
    jr   z,Code001794               ; 00:178D
    ld   c,$01                      ; 00:178F
    ld   hl,$0220                   ; 00:1791
Code001794:
    push hl                         ; 00:1794
    ld   a,[$CDE0]                  ; 00:1795
    ld   h,$00                      ; 00:1798
    ld   l,a                        ; 00:179A
    call Sub001802                  ; 00:179B
    pop  hl                         ; 00:179E
    add  hl,de                      ; 00:179F
    ld   a,[$D914]                  ; 00:17A0
    ld   d,a                        ; 00:17A3
    ld   a,[$D913]                  ; 00:17A4
    ld   e,a                        ; 00:17A7
    add  hl,de                      ; 00:17A8
    ret                             ; 00:17A9

Sub0017AA:
    ld   a,[$CDF3]                  ; 00:17AA
    bit  7,a                        ; 00:17AD
    jr   z,Code0017C8               ; 00:17AF
    ld   a,c                        ; 00:17B1
    cp   $28                        ; 00:17B2
    jr   z,Code0017C2               ; 00:17B4
    cp   $15                        ; 00:17B6
    jr   z,Code0017C2               ; 00:17B8
    cp   $14                        ; 00:17BA
    jr   z,Code0017C2               ; 00:17BC
    cp   $01                        ; 00:17BE
    jr   nz,Code0017C8              ; 00:17C0
Code0017C2:
    ld   a,$10                      ; 00:17C2
    ld   [$CDE2],a                  ; 00:17C4
    ret                             ; 00:17C7
Code0017C8:
    push bc                         ; 00:17C8
    push de                         ; 00:17C9
    push hl                         ; 00:17CA
    ld   d,c                        ; 00:17CB
    ld   bc,$0240                   ; 00:17CC
    add  hl,bc                      ; 00:17CF
    ld   a,[hl]                     ; 00:17D0
    ld   [$CDE2],a                  ; 00:17D1
    pop  hl                         ; 00:17D4
    ld   a,[$CDF3]                  ; 00:17D5
    bit  7,a                        ; 00:17D8
    jp   nz,Code0017ED              ; 00:17DA
    ldi  a,[hl]                     ; 00:17DD
    ld   b,a                        ; 00:17DE
    ld   a,d                        ; 00:17DF
    dec  a                          ; 00:17E0
    cp   $14                        ; 00:17E1
    jr   nz,Code0017E9              ; 00:17E3
    ld   de,$000C                   ; 00:17E5
    add  hl,de                      ; 00:17E8
Code0017E9:
    ld   a,b                        ; 00:17E9
    pop  de                         ; 00:17EA
    pop  bc                         ; 00:17EB
    ret                             ; 00:17EC
Code0017ED:
    ld   a,[hl]                     ; 00:17ED
    ld   bc,$FFE0                   ; 00:17EE
    add  hl,bc                      ; 00:17F1
    ld   b,a                        ; 00:17F2
    ld   a,d                        ; 00:17F3
    dec  a                          ; 00:17F4
    cp   $15                        ; 00:17F5
    jr   nz,Code0017FE              ; 00:17F7
    ld   de,$0240                   ; 00:17F9
    add  hl,de                      ; 00:17FC
    inc  hl                         ; 00:17FD
Code0017FE:
    ld   a,b                        ; 00:17FE
    pop  de                         ; 00:17FF
    pop  bc                         ; 00:1800
    ret                             ; 00:1801

Sub001802:
    push af                         ; 00:1802
    push bc                         ; 00:1803
    ld   a,h                        ; 00:1804
@Loop001805:
    sla  a                          ; 00:1805
    sla  l                          ; 00:1807
    adc  $00                        ; 00:1809
    dec  c                          ; 00:180B
    jr   nz,@Loop001805             ; 00:180C
    ld   d,a                        ; 00:180E
    ld   e,l                        ; 00:180F
    pop  bc                         ; 00:1810
    pop  af                         ; 00:1811
    ret                             ; 00:1812

Sub001813:
    push af                         ; 00:1813
    ld   a,:Sub156329               ; 00:1814
    ld   [ROMBANK],a                ; 00:1816
    call Sub156329                  ; 00:1819
    pop  af                         ; 00:181C
    ld   [ROMBANK],a                ; 00:181D
    ret                             ; 00:1820

Data001821:                         ; 00:1821
.db $28,$70,$60,$80,$30,$50,$40,$90
Data001829:                         ; 00:1829
.db $60,$70,$38,$80,$60,$50,$40,$90

Sub001831:
    xor  a                          ; 00:1831
    ld   [$C26B],a                  ; 00:1832
    ld   [$C1F5],a                  ; 00:1835
    ld   [$C1F6],a                  ; 00:1838
    ld   [$D2F4],a                  ; 00:183B
    ld   hl,Data001829              ; 00:183E
    ld   a,[W_GameMode]             ; 00:1841
    cp   $07                        ; 00:1844
    jr   z,Code00187F               ; 00:1846
    cp   $02                        ; 00:1848
    jr   z,Code00187F               ; 00:184A
    ld   a,$02                      ; 00:184C
    ld   [ROMBANK],a                ; 00:184E
    ld   bc,$0000                   ; 00:1851
Code001854:
    ld   hl,W_SpriteID              ; 00:1854
    add  hl,bc                      ; 00:1857
    ld   a,[hl]                     ; 00:1858  sprite ID in slot BC
    cp   $58                        ; 00:1859
    jr   c,Code001876               ; 00:185B
    cp   $65                        ; 00:185D
    jr   nc,Code001876              ; 00:185F
    call Sub02741E                  ; 00:1861 \ run if 58 <= sprite ID < 65 (sprite platform)
    jr   nc,Code001876              ; 00:1864
    cp   $01                        ; 00:1866
    jr   nz,Code001876              ; 00:1868
    ld   a,[$C27D]                  ; 00:186A
    ldh  [<H_CameraY],a             ; 00:186D
    ld   a,[$C27E]                  ; 00:186F
    ldh  [<$FFBB],a                 ; 00:1872
    jr   Code00187C                 ; 00:1874 /
Code001876:
    inc  c                          ; 00:1876
    ld   a,c                        ; 00:1877
    cp   $0F                        ; 00:1878
    jr   nz,Code001854              ; 00:187A
Code00187C:
    ld   hl,Data001821              ; 00:187C
Code00187F:
    ldh  a,[<H_GlobalTimer]         ; 00:187F
    and  $07                        ; 00:1881
    ld   e,a                        ; 00:1883
    ld   d,$00                      ; 00:1884
    add  hl,de                      ; 00:1886
    ld   a,[hl]                     ; 00:1887
    ldh  [<$FFC1],a                 ; 00:1888
    ld   a,d                        ; 00:188A
    ld   [$C414],a                  ; 00:188B
Code00188E:
    ld   a,[$C414]                  ; 00:188E
    ld   c,a                        ; 00:1891
    ld   b,$00                      ; 00:1892
    ld   hl,W_SpriteStatus          ; 00:1894
    add  hl,bc                      ; 00:1897
    ld   a,[hl]                     ; 00:1898
    and  a                          ; 00:1899
    jp   z,Code0018A0               ; 00:189A
    call Sub0018B0                  ; 00:189D
Code0018A0:
    ld   a,[$C414]                  ; 00:18A0
    inc  a                          ; 00:18A3
    ld   [$C414],a                  ; 00:18A4
    cp   $0F                        ; 00:18A7
    jp   nz,Code00188E              ; 00:18A9
    call Sub0025FD                  ; 00:18AC
    ret                             ; 00:18AF

Sub0018B0:
    ld   hl,W_SpriteStatus          ; 00:18B0
    add  hl,bc                      ; 00:18B3
    ld   a,[hl]                     ; 00:18B4
    dec  a                          ; 00:18B5
    rst  $00                        ; 00:18B6  Execute from 16-bit pointer table
.dw Code0018C6                      ; 00:18B7
.dw Code00191A                      ; 00:18B9
.dw Code0019DE                      ; 00:18BB

Data0018BD:                         ; 00:18BD
.db $02,$03,$31,$26,$27,$28,$29,$2A,\
    $2B

Code0018C6:
    ld   hl,W_SpriteStatus          ; 00:18C6
    add  hl,bc                      ; 00:18C9
    inc  [hl]                       ; 00:18CA
    ld   a,[W_ChallengeFlag]        ; 00:18CB
    and  a                          ; 00:18CE
    jr   z,Code0018F0               ; 00:18CF
    ld   de,$0000                   ; 00:18D1
Code0018D4:
    ld   hl,Data0018BD              ; 00:18D4
    add  hl,de                      ; 00:18D7
    push hl                         ; 00:18D8
    ld   hl,W_SpriteID              ; 00:18D9
    add  hl,bc                      ; 00:18DC
    ld   a,[hl]                     ; 00:18DD
    pop  hl                         ; 00:18DE
    cp   [hl]                       ; 00:18DF
    jr   nz,Code0018EA              ; 00:18E0
    ld   hl,$D10E                   ; 00:18E2
    add  hl,bc                      ; 00:18E5
    ld   [hl],$80                   ; 00:18E6
    jr   Code0018F0                 ; 00:18E8
Code0018EA:
    inc  e                          ; 00:18EA
    ld   a,e                        ; 00:18EB
    cp   $09                        ; 00:18EC
    jr   nz,Code0018D4              ; 00:18EE
Code0018F0:
    ld   a,:SprInitPtrs             ; 00:18F0
    ld   [ROMBANK],a                ; 00:18F2
    ld   hl,W_SpriteID              ; 00:18F5
    add  hl,bc                      ; 00:18F8
    ld   e,[hl]                     ; 00:18F9  sprite ID in slot BC
    dec  e                          ; 00:18FA  index pointer table with sprID -1
    ld   d,$00                      ; 00:18FB
    ld   hl,SprInitPtrs             ; 00:18FD
ExecutePtrTableLong_E:
; Jump to a 24-bit pointer from a table at [HL], indexed by E
    push hl                         ; 00:1900
    ld   l,e                        ; 00:1901 \
    ld   h,$00                      ; 00:1902 |
    sla  e                          ; 00:1904 |
    rl   d                          ; 00:1906 |
    add  hl,de                      ; 00:1908 | DE = 3 * E
    ld   d,h                        ; 00:1909 |
    ld   e,l                        ; 00:190A /
    pop  hl                         ; 00:190B
    add  hl,de                      ; 00:190C  HL = original HL + 3 * original E
    ld   e,[hl]                     ; 00:190D \
    inc  hl                         ; 00:190E |
    ld   d,[hl]                     ; 00:190F | load 24-bit pointer into ADE
    inc  hl                         ; 00:1910 |
    ld   a,[hl]                     ; 00:1911 /
    ld   [ROMBANK],a                ; 00:1912  change ROM bank
    ldh  [<$FFBE],a                 ; 00:1915  set current bank in RAM
    push de                         ; 00:1917 \
    pop  hl                         ; 00:1918 / move address to HL
    jp   hl                         ; 00:1919

Code00191A:
    ld   a,:SprMainPtrs             ; 00:191A
    ld   [ROMBANK],a                ; 00:191C
    ld   hl,W_SpriteID              ; 00:191F
    add  hl,bc                      ; 00:1922
    ld   e,[hl]                     ; 00:1923  sprite ID in slot BC
    dec  e                          ; 00:1924  index pointer table with sprID -1
    ld   d,$00                      ; 00:1925
    ld   hl,SprMainPtrs             ; 00:1927
    jr   ExecutePtrTableLong_E      ; 00:192A

Sub00192C:
    ld   hl,$D2B2                   ; 00:192C
    add  hl,bc                      ; 00:192F
    ld   a,[hl]                     ; 00:1930
    and  $0F                        ; 00:1931
    cp   $00                        ; 00:1933
    jr   z,Return001964             ; 00:1935
    push de                         ; 00:1937
    dec  a                          ; 00:1938
    sla  a                          ; 00:1939
    sla  a                          ; 00:193B
    add  $03                        ; 00:193D
    ld   e,a                        ; 00:193F
    ld   d,$00                      ; 00:1940
    ld   hl,Data002F1E              ; 00:1942
    add  hl,de                      ; 00:1945
    ld   a,[hl]                     ; 00:1946
    cp   $00                        ; 00:1947
    jr   z,Code001963               ; 00:1949
    dec  a                          ; 00:194B
    ldh  [<$FF9B],a                 ; 00:194C
    sla  a                          ; 00:194E
    ld   e,a                        ; 00:1950
    ld   hl,ScoreSpriteValues       ; 00:1951
    add  hl,de                      ; 00:1954
    ldi  a,[hl]                     ; 00:1955
    ldh  [<$FF97],a                 ; 00:1956
    ld   a,[hl]                     ; 00:1958
    ldh  [<$FF98],a                 ; 00:1959
    push bc                         ; 00:195B
    call GivePointsFF97             ; 00:195C
    call SpawnScoreSprite           ; 00:195F
    pop  bc                         ; 00:1962
Code001963:
    pop  de                         ; 00:1963
Return001964:
    ret                             ; 00:1964

Sub001965:
    ld   a,$45                      ; 00:1965
    ldh  [<$FFF2],a                 ; 00:1967
    push de                         ; 00:1969
    ld   de,$0008                   ; 00:196A
    ld   a,$03                      ; 00:196D
    call Return0010B2               ; 00:196F
    pop  de                         ; 00:1972
    ld   hl,$D2B2                   ; 00:1973
    add  hl,bc                      ; 00:1976
    ld   a,[hl]                     ; 00:1977
    and  $0F                        ; 00:1978
    cp   $00                        ; 00:197A
    jr   z,Code0019A5               ; 00:197C
    push de                         ; 00:197E
    dec  a                          ; 00:197F
    ld   e,a                        ; 00:1980
    ld   d,$00                      ; 00:1981
    ld   hl,Data002F42              ; 00:1983
    add  hl,de                      ; 00:1986
    ld   a,[hl]                     ; 00:1987
    cp   $00                        ; 00:1988
    jr   z,Code0019A4               ; 00:198A
    dec  a                          ; 00:198C
    ldh  [<$FF9B],a                 ; 00:198D
    sla  a                          ; 00:198F
    ld   e,a                        ; 00:1991
    ld   hl,ScoreSpriteValues       ; 00:1992
    add  hl,de                      ; 00:1995
    ldi  a,[hl]                     ; 00:1996
    ldh  [<$FF97],a                 ; 00:1997
    ld   a,[hl]                     ; 00:1999
    ldh  [<$FF98],a                 ; 00:199A
    push bc                         ; 00:199C
    call GivePointsFF97             ; 00:199D
    call SpawnScoreSprite           ; 00:19A0
    pop  bc                         ; 00:19A3
Code0019A4:
    pop  de                         ; 00:19A4
Code0019A5:
    ld   a,$12                      ; 00:19A5
    ldh  [<$FF97],a                 ; 00:19A7
    ld   hl,W_SpriteXHigh           ; 00:19A9
    add  hl,bc                      ; 00:19AC
    push hl                         ; 00:19AD
    ld   hl,W_SpriteXLow            ; 00:19AE
    add  hl,bc                      ; 00:19B1
    ldh  a,[<H_PlayerXLow]          ; 00:19B2
    sub  [hl]                       ; 00:19B4
    pop  hl                         ; 00:19B5
    ldh  a,[<H_PlayerXHigh]         ; 00:19B6
    sbc  [hl]                       ; 00:19B8
    bit  7,a                        ; 00:19B9
    jr   nz,Sub0019C1               ; 00:19BB
    ld   a,$EE                      ; 00:19BD
    ldh  [<$FF97],a                 ; 00:19BF

Sub0019C1:
    ldh  a,[<$FF97]                 ; 00:19C1
    ld   hl,W_SpriteXSpeed          ; 00:19C3
    add  hl,bc                      ; 00:19C6
    ld   [hl],a                     ; 00:19C7
    ld   hl,W_SpriteYSpeed          ; 00:19C8
    add  hl,bc                      ; 00:19CB
    ld   [hl],$CC                   ; 00:19CC
    ld   hl,W_SpriteStatus          ; 00:19CE
    add  hl,bc                      ; 00:19D1
    ld   [hl],$03                   ; 00:19D2
    ld   hl,$D1A4                   ; 00:19D4
    add  hl,bc                      ; 00:19D7
    ld   [hl],$01                   ; 00:19D8
    ret                             ; 00:19DA

Data0019DB:                         ; 00:19DB
.db $04,$01,$02
Code0019DE:
    ld   de,$0000                   ; 00:19DE
    ld   hl,W_SpriteID              ; 00:19E1
    add  hl,bc                      ; 00:19E4
    ld   a,[hl]                     ; 00:19E5
    cp   $2C                        ; 00:19E6
    jr   z,Code0019F9               ; 00:19E8
    cp   $23                        ; 00:19EA
    jr   z,Code0019F8               ; 00:19EC
    cp   $05                        ; 00:19EE
    jr   c,Code0019FA               ; 00:19F0
    cp   $09                        ; 00:19F2
    jr   nc,Code0019FA              ; 00:19F4
    jr   Code0019F9                 ; 00:19F6
Code0019F8:
    inc  e                          ; 00:19F8
Code0019F9:
    inc  e                          ; 00:19F9
Code0019FA:
    ld   hl,Data0019DB              ; 00:19FA
    add  hl,de                      ; 00:19FD
    ld   a,[hl]                     ; 00:19FE
    ld   hl,W_SpriteYSpeed          ; 00:19FF
    add  hl,bc                      ; 00:1A02
    add  [hl]                       ; 00:1A03
    bit  7,a                        ; 00:1A04
    jr   nz,Code001A0F              ; 00:1A06
    cp   $40                        ; 00:1A08  if sprite Y speed is positive and > $40...
    jp   c,Code001A0F               ; 00:1A0A
    ld   a,$40                      ; 00:1A0D  cap it to $40
Code001A0F:
    ld   [hl],a                     ; 00:1A0F
    call Sub001A3D                  ; 00:1A10
    call Sub001A79                  ; 00:1A13
    ld   a,$E0                      ; 00:1A16
    call Sub0029DA                  ; 00:1A18
    ld   a,:DataPtrs056727          ; 00:1A1B
    call SetROMBank                 ; 00:1A1D
    ld   hl,W_SpriteID              ; 00:1A20
    add  hl,bc                      ; 00:1A23
    ld   a,[hl]                     ; 00:1A24
    sla  a                          ; 00:1A25
    ld   e,a                        ; 00:1A27
    ld   d,$00                      ; 00:1A28
    ld   hl,DataPtrs056727          ; 00:1A2A
    add  hl,de                      ; 00:1A2D
    ldi  a,[hl]                     ; 00:1A2E
    ld   e,a                        ; 00:1A2F
    ld   a,[hl]                     ; 00:1A30
    ld   d,a                        ; 00:1A31
    ld   l,e                        ; 00:1A32
    ld   h,d                        ; 00:1A33
    call Disp16x16Sprite            ; 00:1A34
    ld   a,$00                      ; 00:1A37
    call SetROMBank                 ; 00:1A39
    ret                             ; 00:1A3C

Sub001A3D:
    ld   hl,W_SpriteXSpeed          ; 00:1A3D
    add  hl,bc                      ; 00:1A40
    ld   a,[hl]                     ; 00:1A41
    and  a                          ; 00:1A42
    jp   z,Return001A78             ; 00:1A43
    ld   a,[hl]                     ; 00:1A46
    push af                         ; 00:1A47
    ld   hl,$D078                   ; 00:1A48
    add  hl,bc                      ; 00:1A4B
    pop  af                         ; 00:1A4C
    ld   e,a                        ; 00:1A4D
    swap a                          ; 00:1A4E
    and  $F0                        ; 00:1A50
    add  [hl]                       ; 00:1A52
    ld   [hl],a                     ; 00:1A53
    push af                         ; 00:1A54
    ld   d,$00                      ; 00:1A55
    ld   a,e                        ; 00:1A57
    swap a                          ; 00:1A58
    and  $0F                        ; 00:1A5A
    bit  3,a                        ; 00:1A5C
    jp   z,Code001A64               ; 00:1A5E
    or   $F0                        ; 00:1A61
    dec  d                          ; 00:1A63
Code001A64:
    ldh  [<$FF97],a                 ; 00:1A64
    ld   hl,W_SpriteXLow            ; 00:1A66
    add  hl,bc                      ; 00:1A69
    pop  af                         ; 00:1A6A
    ldh  a,[<$FF97]                 ; 00:1A6B
    adc  [hl]                       ; 00:1A6D
    ld   [hl],a                     ; 00:1A6E
    push af                         ; 00:1A6F
    ld   hl,W_SpriteXHigh           ; 00:1A70
    add  hl,bc                      ; 00:1A73
    pop  af                         ; 00:1A74
    ld   a,[hl]                     ; 00:1A75
    adc  d                          ; 00:1A76
    ld   [hl],a                     ; 00:1A77
Return001A78:
    ret                             ; 00:1A78

Sub001A79:
    ld   hl,W_SpriteYSpeed          ; 00:1A79
    add  hl,bc                      ; 00:1A7C
    ld   a,[hl]                     ; 00:1A7D
    and  a                          ; 00:1A7E
    jp   z,Return001AB2             ; 00:1A7F
    ld   a,[hl]                     ; 00:1A82
    ld   hl,$D087                   ; 00:1A83
    add  hl,bc                      ; 00:1A86
    ld   e,a                        ; 00:1A87
    swap a                          ; 00:1A88
    and  $F0                        ; 00:1A8A
    add  [hl]                       ; 00:1A8C
    ld   [hl],a                     ; 00:1A8D
    push af                         ; 00:1A8E
    ld   d,$00                      ; 00:1A8F
    ld   a,e                        ; 00:1A91
    swap a                          ; 00:1A92
    and  $0F                        ; 00:1A94
    bit  3,a                        ; 00:1A96
    jp   z,Code001A9E               ; 00:1A98
    or   $F0                        ; 00:1A9B
    dec  d                          ; 00:1A9D
Code001A9E:
    ldh  [<$FF97],a                 ; 00:1A9E
    ld   hl,W_SpriteYLow            ; 00:1AA0
    add  hl,bc                      ; 00:1AA3
    pop  af                         ; 00:1AA4
    ldh  a,[<$FF97]                 ; 00:1AA5
    adc  [hl]                       ; 00:1AA7
    ld   [hl],a                     ; 00:1AA8
    push af                         ; 00:1AA9
    ld   hl,W_SpriteYHigh           ; 00:1AAA
    add  hl,bc                      ; 00:1AAD
    pop  af                         ; 00:1AAE
    ld   a,[hl]                     ; 00:1AAF
    adc  d                          ; 00:1AB0
    ld   [hl],a                     ; 00:1AB1
Return001AB2:
    ret                             ; 00:1AB2

Data001AB3:                         ; 00:1AB3
.db $01,$01,$01,$00,$01,$01,$01,$01,\
    $01,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $01,$00,$00,$00,$00,$00,$00,$00,\
    $01,$01,$01,$01,$01,$01,$01,$00,\
    $01,$01,$01,$01,$01,$01,$01,$01,\
    $00,$00,$01,$01,$01,$00,$01,$00,\
    $00,$01,$00,$00,$00,$01,$00,$00,\
    $01,$01,$00,$01,$00,$00,$01,$01,\
    $00,$00,$00,$00,$00,$00,$01,$01,\
    $01,$01,$00,$00,$00,$01,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$01,\
    $00,$00,$00,$00,$00,$00,$01,$01,\
    $01,$01,$01,$01,$02,$03,$01,$00,\
    $01,$01,$00,$01,$01,$00,$01,$01,\
    $01,$01,$01,$00,$01,$01,$01,$00,\
    $00,$00,$00,$00,$00,$01,$01,$01,\
    $01,$01,$01,$00,$00,$00,$00,$00,\
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
Data001BB3:                         ; 00:1BB3
.db $00,$00,$07,$09,$04,$0C,$04,$04,\
    $06,$0A,$08,$18,$08,$08
Data001BC1:                         ; 00:1BC1
.db $00,$00,$10,$10,$10,$10,$08,$08,\
    $18,$18,$20,$20,$10,$10

Sub001BCF:
    push bc                         ; 00:1BCF
    ld   hl,$D1EF                   ; 00:1BD0
    add  hl,bc                      ; 00:1BD3
    ld   a,[hl]                     ; 00:1BD4
    ldh  [<$FFA6],a                 ; 00:1BD5
    ld   hl,W_SpriteXLow            ; 00:1BD7
    add  hl,bc                      ; 00:1BDA
    ld   a,[hl]                     ; 00:1BDB
    ldh  [<$FF97],a                 ; 00:1BDC
    ld   hl,W_SpriteXHigh           ; 00:1BDE
    add  hl,bc                      ; 00:1BE1
    ld   a,[hl]                     ; 00:1BE2
    ldh  [<$FF98],a                 ; 00:1BE3
    ld   hl,W_SpriteYLow            ; 00:1BE5
    add  hl,bc                      ; 00:1BE8
    ld   a,[hl]                     ; 00:1BE9
    ldh  [<$FF99],a                 ; 00:1BEA
    ld   hl,$D276                   ; 00:1BEC
    add  hl,bc                      ; 00:1BEF
    ld   a,[hl]                     ; 00:1BF0
    ldh  [<$FF9A],a                 ; 00:1BF1
    ld   a,$00                      ; 00:1BF3
    ldh  [<$FFA5],a                 ; 00:1BF5
    ld   e,a                        ; 00:1BF7
    ld   d,a                        ; 00:1BF8
    inc  a                          ; 00:1BF9
    ldh  [<$FF9F],a                 ; 00:1BFA
Code001BFC:
    ld   b,$00                      ; 00:1BFC
    ldh  a,[<$FF9A]                 ; 00:1BFE
    ld   c,a                        ; 00:1C00
    sla  c                          ; 00:1C01
    ld   hl,Data001BB3              ; 00:1C03
    add  hl,bc                      ; 00:1C06
    add  hl,de                      ; 00:1C07
    ldh  a,[<$FF97]                 ; 00:1C08
    add  [hl]                       ; 00:1C0A
    push af                         ; 00:1C0B
    and  $F0                        ; 00:1C0C
    swap a                          ; 00:1C0E
    ldh  [<$FF9B],a                 ; 00:1C10
    ld   hl,$D2C1                   ; 00:1C12
    add  hl,de                      ; 00:1C15
    ld   [hl],a                     ; 00:1C16
    ld   hl,$FF98                   ; 00:1C17
    pop  af                         ; 00:1C1A
    ld   a,$00                      ; 00:1C1B
    adc  [hl]                       ; 00:1C1D
    ldh  [<$FF9C],a                 ; 00:1C1E
    ld   hl,Data001BC1              ; 00:1C20
    add  hl,bc                      ; 00:1C23
    add  hl,de                      ; 00:1C24
    ldh  a,[<$FF99]                 ; 00:1C25
    add  [hl]                       ; 00:1C27
    push de                         ; 00:1C28
    call Sub001CC0                  ; 00:1C29
    pop  de                         ; 00:1C2C
    ld   hl,$FF9F                   ; 00:1C2D
    sla  [hl]                       ; 00:1C30
    inc  e                          ; 00:1C32
    ld   a,e                        ; 00:1C33
    cp   $02                        ; 00:1C34
    jp   nz,Code001BFC              ; 00:1C36
    pop  bc                         ; 00:1C39
    ld   hl,$D1EF                   ; 00:1C3A
    add  hl,bc                      ; 00:1C3D
    ld   [hl],$00                   ; 00:1C3E
    ldh  a,[<$FFA5]                 ; 00:1C40
    and  $03                        ; 00:1C42
    jr   z,Return001C70             ; 00:1C44
    inc  [hl]                       ; 00:1C46
    ldh  a,[<$FFA6]                 ; 00:1C47
    and  a                          ; 00:1C49
    jr   z,Code001C4D               ; 00:1C4A
    inc  [hl]                       ; 00:1C4C
Code001C4D:
    ld   hl,W_SpriteYLow            ; 00:1C4D
    add  hl,bc                      ; 00:1C50
    ld   a,[$D2C9]                  ; 00:1C51
    and  $0F                        ; 00:1C54
    xor  $FF                        ; 00:1C56
    inc  a                          ; 00:1C58
    add  [hl]                       ; 00:1C59
    ld   [hl],a                     ; 00:1C5A
    ld   hl,W_SpriteStatus          ; 00:1C5B
    add  hl,bc                      ; 00:1C5E
    ld   a,[hl]                     ; 00:1C5F
    cp   $03                        ; 00:1C60
    jr   z,Return001C70             ; 00:1C62
    ld   a,$00                      ; 00:1C64
    ld   hl,W_SpriteYSpeed          ; 00:1C66
    add  hl,bc                      ; 00:1C69
    ld   [hl],a                     ; 00:1C6A
    ld   hl,$D087                   ; 00:1C6B
    add  hl,bc                      ; 00:1C6E
    ld   [hl],a                     ; 00:1C6F
Return001C70:
    ret                             ; 00:1C70

Sub001C71:
    push bc                         ; 00:1C71
    ld   hl,W_SpriteXLow            ; 00:1C72
    add  hl,bc                      ; 00:1C75
    ld   a,[hl]                     ; 00:1C76
    ldh  [<$FF97],a                 ; 00:1C77
    ld   hl,W_SpriteXHigh           ; 00:1C79
    add  hl,bc                      ; 00:1C7C
    ld   a,[hl]                     ; 00:1C7D
    ldh  [<$FF98],a                 ; 00:1C7E
    ld   hl,W_SpriteYLow            ; 00:1C80
    add  hl,bc                      ; 00:1C83
    ld   a,[hl]                     ; 00:1C84
    ldh  [<$FF99],a                 ; 00:1C85
    ld   de,$0000                   ; 00:1C87
    ld   a,$00                      ; 00:1C8A
    ldh  [<$FFA5],a                 ; 00:1C8C
    inc  a                          ; 00:1C8E
    ldh  [<$FF9F],a                 ; 00:1C8F
    ld   hl,$FFA3                   ; 00:1C91
    ldh  a,[<$FF97]                 ; 00:1C94
    add  [hl]                       ; 00:1C96
    ld   hl,$D2C1                   ; 00:1C97
    ld   [hl],a                     ; 00:1C9A
    push af                         ; 00:1C9B
    and  $F0                        ; 00:1C9C
    swap a                          ; 00:1C9E
    ldh  [<$FF9B],a                 ; 00:1CA0
    ld   hl,$FF98                   ; 00:1CA2
    pop  af                         ; 00:1CA5
    ld   a,$00                      ; 00:1CA6
    adc  [hl]                       ; 00:1CA8
    ldh  [<$FF9C],a                 ; 00:1CA9
    ld   hl,$FFA4                   ; 00:1CAB
    ldh  a,[<$FF99]                 ; 00:1CAE
    add  [hl]                       ; 00:1CB0
    call Sub001CC0                  ; 00:1CB1
    pop  bc                         ; 00:1CB4
    ldh  a,[<$FFA5]                 ; 00:1CB5
    and  a                          ; 00:1CB7
    jp   z,Code001CBD               ; 00:1CB8
    scf                             ; 00:1CBB
    ret                             ; 00:1CBC

Code001CBD:
    scf                             ; 00:1CBD
    ccf                             ; 00:1CBE
    ret                             ; 00:1CBF

Sub001CC0:
    push af                         ; 00:1CC0
    ld   hl,$D2C9                   ; 00:1CC1
    add  hl,de                      ; 00:1CC4
    ld   [hl],a                     ; 00:1CC5
    pop  af                         ; 00:1CC6
    and  $F0                        ; 00:1CC7
    ld   c,a                        ; 00:1CC9
    ld   b,$00                      ; 00:1CCA
    ldh  a,[<$FF9C]                 ; 00:1CCC
    cp   $10                        ; 00:1CCE
    jr   c,Code001CD6               ; 00:1CD0
    ld   a,$07                      ; 00:1CD2
    jr   Code001CD8                 ; 00:1CD4
Code001CD6:
    ld   a,$06                      ; 00:1CD6
Code001CD8:
    ldh  [<SVBK],a                  ; 00:1CD8
    ld   hl,W_SpriteStatus          ; 00:1CDA
    add  hl,bc                      ; 00:1CDD
    ldh  a,[<$FF9B]                 ; 00:1CDE
    ld   c,a                        ; 00:1CE0
    ld   b,$00                      ; 00:1CE1
    add  hl,bc                      ; 00:1CE3
    ldh  a,[<$FF9C]                 ; 00:1CE4
    and  $0F                        ; 00:1CE6
    ld   b,a                        ; 00:1CE8
    ld   c,$00                      ; 00:1CE9
    add  hl,bc                      ; 00:1CEB
    ld   c,[hl]                     ; 00:1CEC
    ld   b,$00                      ; 00:1CED
    ld   hl,Data001AB3              ; 00:1CEF
    add  hl,bc                      ; 00:1CF2
    ld   a,[hl]                     ; 00:1CF3
    push af                         ; 00:1CF4
    ld   a,$00                      ; 00:1CF5
    ldh  [<SVBK],a                  ; 00:1CF7
    pop  af                         ; 00:1CF9
    rst  $00                        ; 00:1CFA  Execute from 16-bit pointer table
.dw Return001D0A                    ; 00:1CFB
.dw Code001D03                      ; 00:1CFD
.dw Code001D0B                      ; 00:1CFF
.dw Code001D12                      ; 00:1D01

Code001D03:
    ld   hl,$FFA5                   ; 00:1D03
    ldh  a,[<$FF9F]                 ; 00:1D06
    or   [hl]                       ; 00:1D08
    ld   [hl],a                     ; 00:1D09
Return001D0A:
    ret                             ; 00:1D0A

Code001D0B:
    ld   a,[$C375]                  ; 00:1D0B
    and  a                          ; 00:1D0E
    jr   nz,Code001D03              ; 00:1D0F
    ret                             ; 00:1D11

Code001D12:
    ld   a,[$C375]                  ; 00:1D12
    and  a                          ; 00:1D15
    jr   z,Code001D03               ; 00:1D16
    ret                             ; 00:1D18

Data001D19:                         ; 00:1D19
.db $1A,$14
Data001D1B:                         ; 00:1D1B
.db $06,$0C
Data001D1D:                         ; 00:1D1D
.db $14,$08
Data001D1F:                         ; 00:1D1F
.db $00,$80

Sub001D21:
    ld   a,[W_GameMode]             ; 00:1D21
    cp   $02                        ; 00:1D24
    jr   nz,Sub001D55               ; 00:1D26
    ld   a,[$DA6A]                  ; 00:1D28
    xor  $01                        ; 00:1D2B
    ld   [$D2F5],a                  ; 00:1D2D
    ld   e,a                        ; 00:1D30
    ld   d,$00                      ; 00:1D31
    ld   hl,Data001D1F              ; 00:1D33
    add  hl,de                      ; 00:1D36
    ld   e,[hl]                     ; 00:1D37
    call Sub001F75                  ; 00:1D38
    call Sub001D55                  ; 00:1D3B
    jr   c,Return001D54             ; 00:1D3E
    ld   a,[$DA6A]                  ; 00:1D40
    ld   [$D2F5],a                  ; 00:1D43
    ld   e,a                        ; 00:1D46
    ld   d,$00                      ; 00:1D47
    ld   hl,Data001D1F              ; 00:1D49
    add  hl,de                      ; 00:1D4C
    ld   e,[hl]                     ; 00:1D4D
    call Sub001F75                  ; 00:1D4E
    call Sub001D55                  ; 00:1D51
Return001D54:
    ret                             ; 00:1D54

Sub001D55:
    ld   hl,$D20D                   ; 00:1D55
    add  hl,bc                      ; 00:1D58
    ld   a,[hl]                     ; 00:1D59
    and  a                          ; 00:1D5A
    jr   z,Code001D61               ; 00:1D5B
    dec  [hl]                       ; 00:1D5D
    jp   Code001F72                 ; 00:1D5E
Code001D61:
    ld   a,[W_PlayerState]          ; 00:1D61
    cp   $11                        ; 00:1D64
    jp   z,Code001F72               ; 00:1D66
    ld   a,[$C1D5]                  ; 00:1D69
    and  a                          ; 00:1D6C
    jr   z,Code001D83               ; 00:1D6D
    ld   hl,W_SpriteID              ; 00:1D6F
    add  hl,bc                      ; 00:1D72
    ld   a,[hl]                     ; 00:1D73
    cp   $0C                        ; 00:1D74
    jr   z,Code001D83               ; 00:1D76
    cp   $3F                        ; 00:1D78
    jr   z,Code001D83               ; 00:1D7A
    ldh  a,[<$FFAC]                 ; 00:1D7C
    sla  a                          ; 00:1D7E
    jp   c,Code001F72               ; 00:1D80
Code001D83:
    ld   hl,$D285                   ; 00:1D83
    add  hl,bc                      ; 00:1D86
    ld   a,[hl]                     ; 00:1D87
    sla  a                          ; 00:1D88
    sla  a                          ; 00:1D8A
    ld   e,a                        ; 00:1D8C
    ld   d,$00                      ; 00:1D8D
    ld   hl,Data002F63              ; 00:1D8F
    add  hl,de                      ; 00:1D92
    ldi  a,[hl]                     ; 00:1D93
    ldh  [<$FF97],a                 ; 00:1D94
    ldi  a,[hl]                     ; 00:1D96
    ldh  [<$FF99],a                 ; 00:1D97
    ldi  a,[hl]                     ; 00:1D99
    ldh  [<$FF98],a                 ; 00:1D9A
    ld   a,[hl]                     ; 00:1D9C
    ldh  [<$FF9A],a                 ; 00:1D9D

Sub001D9F:
    ld   a,[$C1C2]                  ; 00:1D9F
    cp   $0B                        ; 00:1DA2
    jr   nz,Code001DAB              ; 00:1DA4
    ld   de,$0000                   ; 00:1DA6
    jr   Code001DB1                 ; 00:1DA9
Code001DAB:
    ld   a,[W_PlayerSize]           ; 00:1DAB
    ld   e,a                        ; 00:1DAE
    ld   d,$00                      ; 00:1DAF
Code001DB1:
    ldh  a,[<H_PlayerYLow]          ; 00:1DB1
    ld   hl,Data001D19              ; 00:1DB3
    add  hl,de                      ; 00:1DB6
    add  [hl]                       ; 00:1DB7
    ld   [$C23B],a                  ; 00:1DB8
    ldh  a,[<H_PlayerYHigh]         ; 00:1DBB
    adc  $00                        ; 00:1DBD
    ld   [$C23C],a                  ; 00:1DBF
    ld   hl,Data001D1B              ; 00:1DC2
    add  hl,de                      ; 00:1DC5
    ld   a,[hl]                     ; 00:1DC6
    ld   [$C23D],a                  ; 00:1DC7
    ld   hl,W_SpriteXHigh           ; 00:1DCA
    add  hl,bc                      ; 00:1DCD
    ld   a,[hl]                     ; 00:1DCE
    ld   e,a                        ; 00:1DCF
    ldh  a,[<$FF97]                 ; 00:1DD0
    ld   hl,W_SpriteXLow            ; 00:1DD2
    add  hl,bc                      ; 00:1DD5
    add  [hl]                       ; 00:1DD6
    ld   [$D2D4],a                  ; 00:1DD7
    ld   a,$00                      ; 00:1DDA
    adc  e                          ; 00:1DDC
    ld   [$D2D5],a                  ; 00:1DDD
    ld   hl,W_SpriteYHigh           ; 00:1DE0
    add  hl,bc                      ; 00:1DE3
    ld   a,[hl]                     ; 00:1DE4
    ld   e,a                        ; 00:1DE5
    ld   hl,W_SpriteYLow            ; 00:1DE6
    add  hl,bc                      ; 00:1DE9
    ld   a,[hl]                     ; 00:1DEA
    ld   hl,$FF98                   ; 00:1DEB
    add  [hl]                       ; 00:1DEE
    ld   [$D2D6],a                  ; 00:1DEF
    ld   a,$00                      ; 00:1DF2
    adc  e                          ; 00:1DF4
    ld   [$D2D7],a                  ; 00:1DF5
    ld   a,[$C23B]                  ; 00:1DF8
    ld   hl,$D2D6                   ; 00:1DFB
    sub  [hl]                       ; 00:1DFE
    ldh  [<$FF9F],a                 ; 00:1DFF
    ld   hl,$D2D7                   ; 00:1E01
    ld   a,[$C23C]                  ; 00:1E04
    sbc  [hl]                       ; 00:1E07
    bit  7,a                        ; 00:1E08
    jr   z,Code001E18               ; 00:1E0A
    cpl                             ; 00:1E0C
    ld   e,a                        ; 00:1E0D
    ldh  a,[<$FF9F]                 ; 00:1E0E
    cpl                             ; 00:1E10
    add  $01                        ; 00:1E11
    ldh  [<$FF9F],a                 ; 00:1E13
    ld   a,e                        ; 00:1E15
    adc  $00                        ; 00:1E16
Code001E18:
    and  a                          ; 00:1E18
    jp   nz,Code001F72              ; 00:1E19
    ldh  a,[<H_PlayerXLow]          ; 00:1E1C
    add  $08                        ; 00:1E1E
    ldh  [<$FF9B],a                 ; 00:1E20
    ldh  a,[<H_PlayerXHigh]         ; 00:1E22
    adc  $00                        ; 00:1E24
    ldh  [<$FF9C],a                 ; 00:1E26
    ld   hl,$D2D4                   ; 00:1E28
    ldh  a,[<$FF9B]                 ; 00:1E2B
    sub  [hl]                       ; 00:1E2D
    ldh  [<$FFA0],a                 ; 00:1E2E
    ld   hl,$D2D5                   ; 00:1E30
    ldh  a,[<$FF9C]                 ; 00:1E33
    sbc  [hl]                       ; 00:1E35
    bit  7,a                        ; 00:1E36
    jr   z,Code001E46               ; 00:1E38
    cpl                             ; 00:1E3A
    ld   e,a                        ; 00:1E3B
    ldh  a,[<$FFA0]                 ; 00:1E3C
    cpl                             ; 00:1E3E
    add  $01                        ; 00:1E3F
    ldh  [<$FFA0],a                 ; 00:1E41
    ld   a,e                        ; 00:1E43
    adc  $00                        ; 00:1E44
Code001E46:
    and  a                          ; 00:1E46
    jp   nz,Code001F72              ; 00:1E47
    ld   hl,$C23D                   ; 00:1E4A
    ldh  a,[<$FF9A]                 ; 00:1E4D
    add  [hl]                       ; 00:1E4F
    ld   hl,$FF9F                   ; 00:1E50
    cp   [hl]                       ; 00:1E53
    jp   c,Code001F72               ; 00:1E54
    ldh  a,[<$FF99]                 ; 00:1E57
    add  $06                        ; 00:1E59
    ld   hl,$FFA0                   ; 00:1E5B
    cp   [hl]                       ; 00:1E5E
    jp   c,Code001F72               ; 00:1E5F
    ld   hl,W_SpriteID              ; 00:1E62
    add  hl,bc                      ; 00:1E65
    ld   a,[hl]                     ; 00:1E66
    cp   $26                        ; 00:1E67
    jr   z,Code001E9A               ; 00:1E69
    cp   $27                        ; 00:1E6B
    jr   z,Code001E9A               ; 00:1E6D
    cp   $28                        ; 00:1E6F
    jr   z,Code001E9A               ; 00:1E71
    cp   $29                        ; 00:1E73
    jr   z,Code001E9A               ; 00:1E75
    cp   $2A                        ; 00:1E77
    jr   z,Code001EA0               ; 00:1E79
    cp   $2B                        ; 00:1E7B
    jr   z,Code001EA0               ; 00:1E7D
    cp   $44                        ; 00:1E7F
    jr   z,Code001EA0               ; 00:1E81
    cp   $25                        ; 00:1E83
    jr   z,Code001E9A               ; 00:1E85
    cp   $23                        ; 00:1E87
    jr   z,Code001E9A               ; 00:1E89
    cp   $0D                        ; 00:1E8B
    jr   z,Code001E9A               ; 00:1E8D
    cp   $2C                        ; 00:1E8F
    jr   z,Code001EA0               ; 00:1E91
    ldh  a,[<$FFAC]                 ; 00:1E93
    bit  7,a                        ; 00:1E95
    jp   nz,Code001F6D              ; 00:1E97
Code001E9A:
    ld   a,[$C1D8]                  ; 00:1E9A
    and  a                          ; 00:1E9D
    jr   nz,Code001F0B              ; 00:1E9E
Code001EA0:
    ldh  a,[<H_PlayerYLow]          ; 00:1EA0
    add  $20                        ; 00:1EA2
    ld   [$D2EE],a                  ; 00:1EA4
    ldh  a,[<H_PlayerYHigh]         ; 00:1EA7
    adc  $00                        ; 00:1EA9
    ld   [$D2EF],a                  ; 00:1EAB
    ld   a,[$D2D6]                  ; 00:1EAE
    ld   [$D2F0],a                  ; 00:1EB1
    ld   a,[$D2D7]                  ; 00:1EB4
    ld   [$D2F1],a                  ; 00:1EB7
    ld   hl,W_SpriteID              ; 00:1EBA
    add  hl,bc                      ; 00:1EBD
    ld   a,[hl]                     ; 00:1EBE
    cp   $26                        ; 00:1EBF
    jr   z,Code001ED7               ; 00:1EC1
    cp   $27                        ; 00:1EC3
    jr   z,Code001ED7               ; 00:1EC5
    cp   $28                        ; 00:1EC7
    jr   z,Code001ED7               ; 00:1EC9
    cp   $29                        ; 00:1ECB
    jr   z,Code001ED7               ; 00:1ECD
    cp   $2A                        ; 00:1ECF
    jr   z,Code001ED7               ; 00:1ED1
    cp   $2B                        ; 00:1ED3
    jr   nz,Code001EE7              ; 00:1ED5
Code001ED7:
    ld   a,[$D2D6]                  ; 00:1ED7
    add  $03                        ; 00:1EDA
    ld   [$D2F0],a                  ; 00:1EDC
    ld   a,[$D2D7]                  ; 00:1EDF
    adc  $00                        ; 00:1EE2
    ld   [$D2F1],a                  ; 00:1EE4
Code001EE7:
    ld   de,$0001                   ; 00:1EE7
    ld   hl,$D2F0                   ; 00:1EEA
    ld   a,[$D2EE]                  ; 00:1EED
    sub  [hl]                       ; 00:1EF0
    ld   hl,$D2F1                   ; 00:1EF1
    ld   a,[$D2EF]                  ; 00:1EF4
    sbc  [hl]                       ; 00:1EF7
    bit  7,a                        ; 00:1EF8
    jr   nz,Code001F6F              ; 00:1EFA
    ld   hl,W_SpriteID              ; 00:1EFC
    add  hl,bc                      ; 00:1EFF
    ld   a,[hl]                     ; 00:1F00
    cp   $04                        ; 00:1F01
    jr   nz,Code001F0B              ; 00:1F03
    ldh  a,[<$FFAC]                 ; 00:1F05
    bit  7,a                        ; 00:1F07
    jr   z,Code001F6F               ; 00:1F09
Code001F0B:
    ld   hl,$FF9A                   ; 00:1F0B
    ld   a,[$D2D6]                  ; 00:1F0E
    add  [hl]                       ; 00:1F11
    ld   [$D2EC],a                  ; 00:1F12
    ld   a,[$D2D7]                  ; 00:1F15
    adc  $00                        ; 00:1F18
    ld   [$D2ED],a                  ; 00:1F1A
    ld   a,[$C1DD]                  ; 00:1F1D
    and  a                          ; 00:1F20
    jr   z,Code001F28               ; 00:1F21
    ld   de,$0000                   ; 00:1F23
    jr   Code001F2E                 ; 00:1F26
Code001F28:
    ld   a,[W_PlayerSize]           ; 00:1F28
    ld   e,a                        ; 00:1F2B
    ld   d,$00                      ; 00:1F2C
Code001F2E:
    ldh  a,[<H_PlayerYLow]          ; 00:1F2E
    ld   hl,Data001D1D              ; 00:1F30
    add  hl,de                      ; 00:1F33
    add  [hl]                       ; 00:1F34
    ld   [$D2EE],a                  ; 00:1F35
    ldh  a,[<H_PlayerYHigh]         ; 00:1F38
    adc  $00                        ; 00:1F3A
    ld   [$D2EF],a                  ; 00:1F3C
    ld   hl,$D2EC                   ; 00:1F3F
    ld   a,[$D2EE]                  ; 00:1F42
    sub  [hl]                       ; 00:1F45
    ldh  [<$FF97],a                 ; 00:1F46
    ld   hl,$D2ED                   ; 00:1F48
    ld   a,[$D2EF]                  ; 00:1F4B
    sbc  [hl]                       ; 00:1F4E
    bit  7,a                        ; 00:1F4F
    jr   z,Code001F59               ; 00:1F51
    ldh  a,[<$FF97]                 ; 00:1F53
    cpl                             ; 00:1F55
    inc  a                          ; 00:1F56
    ldh  [<$FF97],a                 ; 00:1F57
Code001F59:
    ldh  a,[<$FFAC]                 ; 00:1F59
    bit  7,a                        ; 00:1F5B
    jr   z,Code001F68               ; 00:1F5D
    ld   de,$0002                   ; 00:1F5F
    ldh  a,[<$FF97]                 ; 00:1F62
    cp   $06                        ; 00:1F64
    jr   c,Code001F6F               ; 00:1F66
Code001F68:
    ld   de,$0000                   ; 00:1F68
    jr   Code001F6F                 ; 00:1F6B
Code001F6D:
    ld   e,$00                      ; 00:1F6D
Code001F6F:
    ld   a,e                        ; 00:1F6F
    scf                             ; 00:1F70
    ret                             ; 00:1F71

Code001F72:
    scf                             ; 00:1F72
    ccf                             ; 00:1F73
    ret                             ; 00:1F74

Sub001F75:
    ld   hl,$C501                   ; 00:1F75
    add  hl,de                      ; 00:1F78
    ld   a,[hl]                     ; 00:1F79
    ldh  [<H_PlayerXLow],a          ; 00:1F7A
    ld   hl,$C502                   ; 00:1F7C
    add  hl,de                      ; 00:1F7F
    ld   a,[hl]                     ; 00:1F80
    ldh  [<H_PlayerXHigh],a         ; 00:1F81
    ld   hl,$C503                   ; 00:1F83
    add  hl,de                      ; 00:1F86
    ld   a,[hl]                     ; 00:1F87
    ldh  [<H_PlayerYLow],a          ; 00:1F88
    ld   hl,$C504                   ; 00:1F8A
    add  hl,de                      ; 00:1F8D
    ld   a,[hl]                     ; 00:1F8E
    ldh  [<H_PlayerYHigh],a         ; 00:1F8F
    ld   hl,$C509                   ; 00:1F91
    add  hl,de                      ; 00:1F94
    ld   a,[hl]                     ; 00:1F95
    ld   [W_PlayerState],a          ; 00:1F96
    ld   hl,$C50D                   ; 00:1F99
    add  hl,de                      ; 00:1F9C
    ld   a,[hl]                     ; 00:1F9D
    ld   [W_PlayerSize],a           ; 00:1F9E
    ld   hl,$C525                   ; 00:1FA1
    add  hl,de                      ; 00:1FA4
    ld   a,[hl]                     ; 00:1FA5
    ld   [$C1DD],a                  ; 00:1FA6
    ld   hl,$C520                   ; 00:1FA9
    add  hl,de                      ; 00:1FAC
    ld   a,[hl]                     ; 00:1FAD
    ld   [$C1D8],a                  ; 00:1FAE
    ld   hl,$C506                   ; 00:1FB1
    add  hl,de                      ; 00:1FB4
    ld   a,[hl]                     ; 00:1FB5
    ldh  [<$FFAC],a                 ; 00:1FB6
    ld   hl,$C51D                   ; 00:1FB8
    add  hl,de                      ; 00:1FBB
    ld   a,[hl]                     ; 00:1FBC
    ld   [$C1D5],a                  ; 00:1FBD
    ld   hl,$C50A                   ; 00:1FC0
    add  hl,de                      ; 00:1FC3
    ld   a,[hl]                     ; 00:1FC4
    ld   [$C1C2],a                  ; 00:1FC5
    ret                             ; 00:1FC8

Sub001FC9:
    ld   hl,$D20D                   ; 00:1FC9
    add  hl,bc                      ; 00:1FCC
    ld   a,[hl]                     ; 00:1FCD
    and  a                          ; 00:1FCE
    jr   z,Code001FD5               ; 00:1FCF
    dec  [hl]                       ; 00:1FD1
    jp   Code002186                 ; 00:1FD2
Code001FD5:
    ld   a,[W_PlayerState]          ; 00:1FD5
    cp   $11                        ; 00:1FD8
    jp   z,Code002186               ; 00:1FDA
    ld   hl,$D285                   ; 00:1FDD
    add  hl,bc                      ; 00:1FE0
    ld   a,[hl]                     ; 00:1FE1
    sla  a                          ; 00:1FE2
    sla  a                          ; 00:1FE4
    ld   e,a                        ; 00:1FE6
    ld   d,$00                      ; 00:1FE7
    ld   hl,Data002F63              ; 00:1FE9
    add  hl,de                      ; 00:1FEC
    ldi  a,[hl]                     ; 00:1FED
    ldh  [<$FF97],a                 ; 00:1FEE
    ldi  a,[hl]                     ; 00:1FF0
    ldh  [<$FF99],a                 ; 00:1FF1
    ldi  a,[hl]                     ; 00:1FF3
    ldh  [<$FF98],a                 ; 00:1FF4
    ld   a,[hl]                     ; 00:1FF6
    ldh  [<$FF9A],a                 ; 00:1FF7
    ld   a,[$C1DD]                  ; 00:1FF9
    and  a                          ; 00:1FFC
    jr   z,Code002004               ; 00:1FFD
    ld   de,$0000                   ; 00:1FFF
    jr   Code00200A                 ; 00:2002
Code002004:
    ld   a,[W_PlayerSize]           ; 00:2004
    ld   e,a                        ; 00:2007
    ld   d,$00                      ; 00:2008
Code00200A:
    ldh  a,[<H_PlayerYLow]          ; 00:200A
    ld   hl,Data001D19              ; 00:200C
    add  hl,de                      ; 00:200F
    add  [hl]                       ; 00:2010
    ld   [$C23B],a                  ; 00:2011
    ldh  a,[<H_PlayerYHigh]         ; 00:2014
    adc  $00                        ; 00:2016
    ld   [$C23C],a                  ; 00:2018
    ld   hl,Data001D1B              ; 00:201B
    add  hl,de                      ; 00:201E
    ld   a,[hl]                     ; 00:201F
    ld   [$C23D],a                  ; 00:2020
    ld   hl,W_SpriteXHigh           ; 00:2023
    add  hl,bc                      ; 00:2026
    ld   a,[hl]                     ; 00:2027
    ld   e,a                        ; 00:2028
    ldh  a,[<$FF97]                 ; 00:2029
    ld   hl,W_SpriteXLow            ; 00:202B
    add  hl,bc                      ; 00:202E
    add  [hl]                       ; 00:202F
    ld   [$D2D4],a                  ; 00:2030
    ld   a,$00                      ; 00:2033
    adc  e                          ; 00:2035
    ld   [$D2D5],a                  ; 00:2036
    ld   hl,W_SpriteYHigh           ; 00:2039
    add  hl,bc                      ; 00:203C
    ld   a,[hl]                     ; 00:203D
    ld   e,a                        ; 00:203E
    ld   hl,W_SpriteYLow            ; 00:203F
    add  hl,bc                      ; 00:2042
    ld   a,[hl]                     ; 00:2043
    ld   hl,$FF98                   ; 00:2044
    add  [hl]                       ; 00:2047
    ld   [$D2D6],a                  ; 00:2048
    ld   a,$00                      ; 00:204B
    adc  e                          ; 00:204D
    ld   [$D2D7],a                  ; 00:204E
    ld   a,[$C23B]                  ; 00:2051
    ld   hl,$D2D6                   ; 00:2054
    sub  [hl]                       ; 00:2057
    ldh  [<$FF9F],a                 ; 00:2058
    ld   hl,$D2D7                   ; 00:205A
    ld   a,[$C23C]                  ; 00:205D
    sbc  [hl]                       ; 00:2060
    bit  7,a                        ; 00:2061
    jr   z,Code002073               ; 00:2063
    xor  $FF                        ; 00:2065
    ld   e,a                        ; 00:2067
    ldh  a,[<$FF9F]                 ; 00:2068
    xor  $FF                        ; 00:206A
    add  $01                        ; 00:206C
    ldh  [<$FF9F],a                 ; 00:206E
    ld   a,e                        ; 00:2070
    adc  $00                        ; 00:2071
Code002073:
    and  a                          ; 00:2073
    jp   nz,Code002186              ; 00:2074
    ldh  a,[<H_PlayerXLow]          ; 00:2077
    add  $08                        ; 00:2079
    ldh  [<$FF9B],a                 ; 00:207B
    ldh  a,[<H_PlayerXHigh]         ; 00:207D
    adc  $00                        ; 00:207F
    ldh  [<$FF9C],a                 ; 00:2081
    ld   hl,$D2D4                   ; 00:2083
    ldh  a,[<$FF9B]                 ; 00:2086
    sub  [hl]                       ; 00:2088
    ldh  [<$FFA0],a                 ; 00:2089
    ld   hl,$D2D5                   ; 00:208B
    ldh  a,[<$FF9C]                 ; 00:208E
    sbc  [hl]                       ; 00:2090
    bit  7,a                        ; 00:2091
    jr   z,Code0020A3               ; 00:2093
    xor  $FF                        ; 00:2095
    ld   e,a                        ; 00:2097
    ldh  a,[<$FFA0]                 ; 00:2098
    xor  $FF                        ; 00:209A
    add  $01                        ; 00:209C
    ldh  [<$FFA0],a                 ; 00:209E
    ld   a,e                        ; 00:20A0
    adc  $00                        ; 00:20A1
Code0020A3:
    and  a                          ; 00:20A3
    jp   nz,Code002186              ; 00:20A4
    ld   hl,$C23D                   ; 00:20A7
    ldh  a,[<$FF9A]                 ; 00:20AA
    add  [hl]                       ; 00:20AC
    ld   hl,$FF9F                   ; 00:20AD
    cp   [hl]                       ; 00:20B0
    jp   c,Code002186               ; 00:20B1
    ldh  a,[<$FF99]                 ; 00:20B4
    add  $06                        ; 00:20B6
    ld   hl,$FFA0                   ; 00:20B8
    cp   [hl]                       ; 00:20BB
    jp   c,Code002186               ; 00:20BC
    ld   hl,$FF9A                   ; 00:20BF
    ld   a,[$D2D6]                  ; 00:20C2
    sub  [hl]                       ; 00:20C5
    ld   [$D2EC],a                  ; 00:20C6
    ld   a,[$D2D7]                  ; 00:20C9
    sbc  $00                        ; 00:20CC
    ld   [$D2ED],a                  ; 00:20CE
    ldh  a,[<H_PlayerYLow]          ; 00:20D1
    add  $20                        ; 00:20D3
    ld   [$D2EE],a                  ; 00:20D5
    ldh  a,[<H_PlayerYHigh]         ; 00:20D8
    adc  $00                        ; 00:20DA
    ld   [$D2EF],a                  ; 00:20DC
    ld   hl,$D2EC                   ; 00:20DF
    ld   a,[$D2EE]                  ; 00:20E2
    sub  [hl]                       ; 00:20E5
    ldh  [<$FF97],a                 ; 00:20E6
    ld   hl,$D2ED                   ; 00:20E8
    ld   a,[$D2EF]                  ; 00:20EB
    sbc  [hl]                       ; 00:20EE
    bit  7,a                        ; 00:20EF
    jr   z,Code0020FA               ; 00:20F1
    ldh  a,[<$FF97]                 ; 00:20F3
    xor  $FF                        ; 00:20F5
    inc  a                          ; 00:20F7
    ldh  [<$FF97],a                 ; 00:20F8
Code0020FA:
    ld   de,$0001                   ; 00:20FA
    ldh  a,[<$FF97]                 ; 00:20FD
    cp   $04                        ; 00:20FF
    jp   c,Code002183               ; 00:2101
    ld   hl,$FF9A                   ; 00:2104
    ld   a,[$D2D6]                  ; 00:2107
    add  [hl]                       ; 00:210A
    ld   [$D2EC],a                  ; 00:210B
    ld   a,[$D2D7]                  ; 00:210E
    adc  $00                        ; 00:2111
    ld   [$D2ED],a                  ; 00:2113
    ld   a,[$C1DD]                  ; 00:2116
    and  a                          ; 00:2119
    jr   z,Code002121               ; 00:211A
    ld   de,$0000                   ; 00:211C
    jr   Code002127                 ; 00:211F
Code002121:
    ld   a,[W_PlayerSize]           ; 00:2121
    ld   e,a                        ; 00:2124
    ld   d,$00                      ; 00:2125
Code002127:
    ldh  a,[<H_PlayerYLow]          ; 00:2127
    ld   hl,Data001D1D              ; 00:2129
    add  hl,de                      ; 00:212C
    add  [hl]                       ; 00:212D
    ld   [$D2EE],a                  ; 00:212E
    ldh  a,[<H_PlayerYHigh]         ; 00:2131
    adc  $00                        ; 00:2133
    ld   [$D2EF],a                  ; 00:2135
    ld   hl,$D2EC                   ; 00:2138
    ld   a,[$D2EE]                  ; 00:213B
    sub  [hl]                       ; 00:213E
    ldh  [<$FF97],a                 ; 00:213F
    ld   hl,$D2ED                   ; 00:2141
    ld   a,[$D2EF]                  ; 00:2144
    sbc  [hl]                       ; 00:2147
    bit  7,a                        ; 00:2148
    jr   z,Code002152               ; 00:214A
    ldh  a,[<$FF97]                 ; 00:214C
    cpl                             ; 00:214E
    inc  a                          ; 00:214F
    ldh  [<$FF97],a                 ; 00:2150
Code002152:
    ldh  a,[<$FFAC]                 ; 00:2152
    bit  7,a                        ; 00:2154
    jr   z,Code002161               ; 00:2156
    ld   de,$0002                   ; 00:2158
    ldh  a,[<$FF97]                 ; 00:215B
    cp   $06                        ; 00:215D
    jr   c,Code002183               ; 00:215F
Code002161:
    ld   de,$0000                   ; 00:2161
    jr   Code002183                 ; 00:2164
@Unused002166:
    ld   de,$0000                   ; 00:2166
    ld   a,[$C1D8]                  ; 00:2169
    and  a                          ; 00:216C
    jr   nz,Code002183              ; 00:216D
    inc  e                          ; 00:216F
    ld   hl,$D2D6                   ; 00:2170
    ld   a,[$C23B]                  ; 00:2173
    sub  [hl]                       ; 00:2176
    ld   hl,$D2D7                   ; 00:2177
    ld   a,[$C23C]                  ; 00:217A
    sbc  [hl]                       ; 00:217D
    bit  7,a                        ; 00:217E
    jr   nz,Code002183              ; 00:2180
    inc  e                          ; 00:2182
Code002183:
    ld   a,e                        ; 00:2183
    scf                             ; 00:2184
    ret                             ; 00:2185

Code002186:
    scf                             ; 00:2186
    ccf                             ; 00:2187
    ret                             ; 00:2188

Sub002189:
    scf                             ; 00:2189
    ret                             ; 00:218A

Sub00218B:
    push bc                         ; 00:218B
    ld   hl,$D22B                   ; 00:218C
    add  hl,bc                      ; 00:218F
    ld   a,[hl]                     ; 00:2190
    and  a                          ; 00:2191
    jp   z,Code00219F               ; 00:2192
    ld   hl,$D22B                   ; 00:2195
    add  hl,bc                      ; 00:2198
    ld   a,[hl]                     ; 00:2199
    xor  a                          ; 00:219A
    ld   [hl],a                     ; 00:219B
    jp   Code00237B                 ; 00:219C
Code00219F:
    ld   hl,$D2A3                   ; 00:219F
    add  hl,bc                      ; 00:21A2
    ld   a,[hl]                     ; 00:21A3
    bit  0,a                        ; 00:21A4
    jr   z,Code0021B7               ; 00:21A6
    ld   hl,W_SpriteID              ; 00:21A8
    add  hl,bc                      ; 00:21AB
    ld   a,[hl]                     ; 00:21AC
    cp   $0D                        ; 00:21AD
    jp   z,Code0021B7               ; 00:21AF
    cp   $0E                        ; 00:21B2
    jp   nz,Code0023B4              ; 00:21B4
Code0021B7:
    ld   hl,W_SpriteXSpeed          ; 00:21B7
    add  hl,bc                      ; 00:21BA
    ld   a,[hl]                     ; 00:21BB
    ldh  [<$FFA6],a                 ; 00:21BC
    ld   hl,$D285                   ; 00:21BE
    add  hl,bc                      ; 00:21C1
    ld   a,[hl]                     ; 00:21C2
    sla  a                          ; 00:21C3
    sla  a                          ; 00:21C5
    ld   e,a                        ; 00:21C7
    ld   d,$00                      ; 00:21C8
    ld   hl,Data002F63              ; 00:21CA
    add  hl,de                      ; 00:21CD
    ldi  a,[hl]                     ; 00:21CE
    ldh  [<$FF97],a                 ; 00:21CF
    ldi  a,[hl]                     ; 00:21D1
    ld   [$D2D8],a                  ; 00:21D2
    ldi  a,[hl]                     ; 00:21D5
    ldh  [<$FF98],a                 ; 00:21D6
    ld   a,[hl]                     ; 00:21D8
    ld   [$D2D9],a                  ; 00:21D9
    ld   hl,W_SpriteXHigh           ; 00:21DC
    add  hl,bc                      ; 00:21DF
    ld   e,[hl]                     ; 00:21E0
    ldh  a,[<$FF97]                 ; 00:21E1
    ld   hl,W_SpriteXLow            ; 00:21E3
    add  hl,bc                      ; 00:21E6
    add  [hl]                       ; 00:21E7
    ld   [$D2D4],a                  ; 00:21E8
    ld   a,$00                      ; 00:21EB
    adc  e                          ; 00:21ED
    ld   [$D2D5],a                  ; 00:21EE
    ld   hl,W_SpriteYLow            ; 00:21F1
    add  hl,bc                      ; 00:21F4
    ld   a,[hl]                     ; 00:21F5
    ld   hl,$FF98                   ; 00:21F6
    add  [hl]                       ; 00:21F9
    ld   [$D2D6],a                  ; 00:21FA
    ld   hl,$D294                   ; 00:21FD
    add  hl,bc                      ; 00:2200
    ld   a,[hl]                     ; 00:2201
    ld   [$D2EB],a                  ; 00:2202
    ld   bc,$0000                   ; 00:2205
Code002208:
    ld   hl,W_SpriteStatus          ; 00:2208
    add  hl,bc                      ; 00:220B
    ld   a,[hl]                     ; 00:220C
    and  a                          ; 00:220D
    jp   z,Code0023AD               ; 00:220E
    ld   a,[$C414]                  ; 00:2211
    cp   c                          ; 00:2214
    jp   z,Code0023AD               ; 00:2215
    ld   hl,$D1A4                   ; 00:2218
    add  hl,bc                      ; 00:221B
    ld   a,[hl]                     ; 00:221C
    cp   $01                        ; 00:221D
    jp   z,Code0023AD               ; 00:221F
    ld   a,[$C414]                  ; 00:2222
    ld   e,a                        ; 00:2225
    ld   d,$00                      ; 00:2226
    ld   hl,W_SpriteID              ; 00:2228
    add  hl,de                      ; 00:222B
    ld   a,[hl]                     ; 00:222C
    cp   $0C                        ; 00:222D
    jr   nz,Code00223D              ; 00:222F
    ld   hl,W_SpriteID              ; 00:2231
    add  hl,bc                      ; 00:2234
    ld   a,[hl]                     ; 00:2235
    cp   $01                        ; 00:2236
    jr   z,Code00227D               ; 00:2238
    jp   Code0023AD                 ; 00:223A
Code00223D:
    ld   hl,$D2A3                   ; 00:223D
    add  hl,bc                      ; 00:2240
    ld   a,[hl]                     ; 00:2241
    bit  0,a                        ; 00:2242
    jp   nz,Code0023AD              ; 00:2244
    ld   hl,W_SpriteID              ; 00:2247
    add  hl,de                      ; 00:224A
    ld   a,[hl]                     ; 00:224B
    cp   $0D                        ; 00:224C
    jr   z,Code00227D               ; 00:224E
    cp   $01                        ; 00:2250
    jr   z,Code00227D               ; 00:2252
    cp   $0E                        ; 00:2254
    jr   z,Code00227D               ; 00:2256
    cp   $1D                        ; 00:2258
    jr   z,Code00227D               ; 00:225A
    ld   hl,$D249                   ; 00:225C
    add  hl,de                      ; 00:225F
    ld   a,[hl]                     ; 00:2260
    and  a                          ; 00:2261
    jr   nz,Code00227D              ; 00:2262
    ld   hl,$D249                   ; 00:2264
    add  hl,bc                      ; 00:2267
    ld   a,[hl]                     ; 00:2268
    and  a                          ; 00:2269
    jr   nz,Code00227D              ; 00:226A
    ld   hl,W_SpriteXSpeed          ; 00:226C
    add  hl,bc                      ; 00:226F
    ld   a,[hl]                     ; 00:2270
    and  a                          ; 00:2271
    jr   z,Code00227D               ; 00:2272
    ld   hl,$FFA6                   ; 00:2274
    xor  [hl]                       ; 00:2277
    bit  7,a                        ; 00:2278
    jp   z,Code0023AD               ; 00:227A
Code00227D:
    ld   hl,$D285                   ; 00:227D
    add  hl,bc                      ; 00:2280
    ld   a,[hl]                     ; 00:2281
    sla  a                          ; 00:2282
    sla  a                          ; 00:2284
    ld   e,a                        ; 00:2286
    ld   d,$00                      ; 00:2287
    ld   hl,Data002F63              ; 00:2289
    add  hl,de                      ; 00:228C
    ldi  a,[hl]                     ; 00:228D
    ldh  [<$FF97],a                 ; 00:228E
    ldi  a,[hl]                     ; 00:2290
    ld   [$D2DE],a                  ; 00:2291
    ldi  a,[hl]                     ; 00:2294
    ldh  [<$FF98],a                 ; 00:2295
    ld   a,[hl]                     ; 00:2297
    ld   [$D2DF],a                  ; 00:2298
    ld   hl,W_SpriteXHigh           ; 00:229B
    add  hl,bc                      ; 00:229E
    ld   e,[hl]                     ; 00:229F
    ldh  a,[<$FF97]                 ; 00:22A0
    ld   hl,W_SpriteXLow            ; 00:22A2
    add  hl,bc                      ; 00:22A5
    add  [hl]                       ; 00:22A6
    ld   [$D2DA],a                  ; 00:22A7
    ld   a,$00                      ; 00:22AA
    adc  e                          ; 00:22AC
    ld   [$D2DB],a                  ; 00:22AD
    ld   hl,W_SpriteYLow            ; 00:22B0
    add  hl,bc                      ; 00:22B3
    ld   a,[hl]                     ; 00:22B4
    ld   hl,$FF98                   ; 00:22B5
    add  [hl]                       ; 00:22B8
    ld   [$D2DC],a                  ; 00:22B9
    ld   hl,$D2D6                   ; 00:22BC
    ld   a,[$D2DC]                  ; 00:22BF
    sub  [hl]                       ; 00:22C2
    bit  7,a                        ; 00:22C3
    jr   z,Code0022CA               ; 00:22C5
    xor  $FF                        ; 00:22C7
    inc  a                          ; 00:22C9
Code0022CA:
    ldh  [<$FF97],a                 ; 00:22CA
    ld   hl,$D2DA                   ; 00:22CC
    ld   a,[$D2D4]                  ; 00:22CF
    sub  [hl]                       ; 00:22D2
    ldh  [<$FF98],a                 ; 00:22D3
    ld   hl,$D2DB                   ; 00:22D5
    ld   a,[$D2D5]                  ; 00:22D8
    sbc  [hl]                       ; 00:22DB
    ldh  [<$FF99],a                 ; 00:22DC
    bit  7,a                        ; 00:22DE
    jr   z,Code0022F2               ; 00:22E0
    cpl                             ; 00:22E2
    ldh  [<$FF99],a                 ; 00:22E3
    ldh  a,[<$FF98]                 ; 00:22E5
    cpl                             ; 00:22E7
    add  $01                        ; 00:22E8
    ldh  [<$FF98],a                 ; 00:22EA
    ldh  a,[<$FF99]                 ; 00:22EC
    adc  $00                        ; 00:22EE
    ldh  [<$FF99],a                 ; 00:22F0
Code0022F2:
    and  a                          ; 00:22F2
    jp   nz,Code0023AD              ; 00:22F3
    ld   hl,$D2DF                   ; 00:22F6
    ld   a,[$D2D9]                  ; 00:22F9
    add  [hl]                       ; 00:22FC
    ld   hl,$FF97                   ; 00:22FD
    cp   [hl]                       ; 00:2300
    jp   c,Code0023AD               ; 00:2301
    ld   hl,$D2DE                   ; 00:2304
    ld   a,[$D2D8]                  ; 00:2307
    add  [hl]                       ; 00:230A
    ld   hl,$FF98                   ; 00:230B
    cp   [hl]                       ; 00:230E
    jp   c,Code0023AD               ; 00:230F
    ld   hl,$D249                   ; 00:2312
    add  hl,bc                      ; 00:2315
    ld   a,[hl]                     ; 00:2316
    and  a                          ; 00:2317
    jr   nz,Code00237B              ; 00:2318
    ld   hl,W_SpriteID              ; 00:231A
    add  hl,bc                      ; 00:231D
    ld   a,[hl]                     ; 00:231E
    cp   $01                        ; 00:231F
    jr   z,Code00237B               ; 00:2321
    cp   $1D                        ; 00:2323
    jr   z,Code00237B               ; 00:2325
    ld   a,[$C414]                  ; 00:2327
    ld   e,a                        ; 00:232A
    ld   d,$00                      ; 00:232B
    ld   hl,$D249                   ; 00:232D
    add  hl,de                      ; 00:2330
    ld   a,[hl]                     ; 00:2331
    and  a                          ; 00:2332
    jr   nz,Code00237B              ; 00:2333
    ld   hl,W_SpriteID              ; 00:2335
    add  hl,de                      ; 00:2338
    ld   a,[hl]                     ; 00:2339
    cp   $0D                        ; 00:233A
    jr   z,Code00237B               ; 00:233C
    cp   $01                        ; 00:233E
    jr   z,Code00237B               ; 00:2340
    cp   $0E                        ; 00:2342
    jr   z,Code00237B               ; 00:2344
    cp   $1D                        ; 00:2346
    jr   z,Code00237B               ; 00:2348
    ld   hl,W_SpriteXLow            ; 00:234A
    add  hl,bc                      ; 00:234D
    ld   a,[hl]                     ; 00:234E
    ld   hl,W_SpriteXLow            ; 00:234F
    add  hl,de                      ; 00:2352
    cp   [hl]                       ; 00:2353
    jr   nz,Code002362              ; 00:2354
    ld   hl,W_SpriteXHigh           ; 00:2356
    add  hl,bc                      ; 00:2359
    ld   a,[hl]                     ; 00:235A
    ld   hl,W_SpriteXHigh           ; 00:235B
    add  hl,de                      ; 00:235E
    cp   [hl]                       ; 00:235F
    jr   z,Code0023AD               ; 00:2360
Code002362:
    ld   hl,W_SpriteXSpeed          ; 00:2362
    add  hl,bc                      ; 00:2365
    ld   a,[hl]                     ; 00:2366
    and  a                          ; 00:2367
    jp   z,Code00237B               ; 00:2368
    bit  7,a                        ; 00:236B
    jr   z,Code002376               ; 00:236D
    call Sub0023B8                  ; 00:236F
    jr   nc,Code0023AD              ; 00:2372
    jr   Code00237B                 ; 00:2374
Code002376:
    call Sub0023D9                  ; 00:2376
    jr   nc,Code0023AD              ; 00:2379
Code00237B:
    ld   hl,W_SpriteID              ; 00:237B
    add  hl,bc                      ; 00:237E
    ld   a,[hl]                     ; 00:237F
    cp   $25                        ; 00:2380
    jr   z,Code00239E               ; 00:2382
    cp   $19                        ; 00:2384
    jr   z,Code00239E               ; 00:2386
    cp   $47                        ; 00:2388
    jr   z,Code00239E               ; 00:238A
    cp   $0C                        ; 00:238C
    jr   nz,Code002397              ; 00:238E
    ld   a,[$D2EB]                  ; 00:2390
    and  $02                        ; 00:2393
    jr   z,Code0023AD               ; 00:2395
Code002397:
    ld   de,$0000                   ; 00:2397
    ld   e,c                        ; 00:239A
    pop  bc                         ; 00:239B
Code00239C:
    scf                             ; 00:239C
    ret                             ; 00:239D

Code00239E:
    ld   d,$00                      ; 00:239E
    ld   e,c                        ; 00:23A0
    pop  bc                         ; 00:23A1
    ld   hl,W_SpriteID              ; 00:23A2
    add  hl,bc                      ; 00:23A5
    ld   a,[hl]                     ; 00:23A6
    cp   $0D                        ; 00:23A7
    jr   z,Code00239C               ; 00:23A9
    push bc                         ; 00:23AB
    ld   c,e                        ; 00:23AC
Code0023AD:
    inc  c                          ; 00:23AD
    ld   a,c                        ; 00:23AE
    cp   $0F                        ; 00:23AF
    jp   nz,Code002208              ; 00:23B1
Code0023B4:
    pop  bc                         ; 00:23B4
    scf                             ; 00:23B5
    ccf                             ; 00:23B6
    ret                             ; 00:23B7

Sub0023B8:
    ld   hl,$D2D5                   ; 00:23B8
    ld   a,[$D2DB]                  ; 00:23BB
    sub  [hl]                       ; 00:23BE
    jr   c,Code002437               ; 00:23BF
    ld   hl,$D2D4                   ; 00:23C1
    ld   a,[$D2DA]                  ; 00:23C4
    sub  [hl]                       ; 00:23C7
    jr   nc,Code00242E              ; 00:23C8
    ld   hl,$D2D5                   ; 00:23CA
    ld   a,[hl]                     ; 00:23CD
    adc  $00                        ; 00:23CE
    ld   [hl],a                     ; 00:23D0
    ld   a,[$D2DB]                  ; 00:23D1
    sub  [hl]                       ; 00:23D4
    jr   c,Code002437               ; 00:23D5
    jr   Code00242E                 ; 00:23D7

Sub0023D9:
    ld   hl,$D2DB                   ; 00:23D9
    ld   a,[$D2D5]                  ; 00:23DC
    sub  [hl]                       ; 00:23DF
    jr   c,Code002437               ; 00:23E0
    ld   hl,$D2DA                   ; 00:23E2
    ld   a,[$D2D4]                  ; 00:23E5
    sub  [hl]                       ; 00:23E8
    jr   nc,Code00242E              ; 00:23E9
    ld   hl,$D2DB                   ; 00:23EB
    ld   a,[hl]                     ; 00:23EE
    adc  $00                        ; 00:23EF
    ld   [hl],a                     ; 00:23F1
    ld   a,[$D2D5]                  ; 00:23F2
    sub  [hl]                       ; 00:23F5
    jr   c,Code002437               ; 00:23F6
    jr   Code00242E                 ; 00:23F8
    ld   hl,W_SpriteXHigh           ; 00:23FA
    add  hl,de                      ; 00:23FD
    ld   a,[hl]                     ; 00:23FE
    ld   hl,W_SpriteXHigh           ; 00:23FF
    add  hl,bc                      ; 00:2402
    cp   [hl]                       ; 00:2403
    jr   z,Code00240A               ; 00:2404
    jr   c,Code002422               ; 00:2406
    jr   Code002416                 ; 00:2408
Code00240A:
    ld   hl,W_SpriteXLow            ; 00:240A
    add  hl,de                      ; 00:240D
    ld   a,[hl]                     ; 00:240E
    ld   hl,W_SpriteXLow            ; 00:240F
    add  hl,bc                      ; 00:2412
    cp   [hl]                       ; 00:2413
    jr   c,Code002422               ; 00:2414
Code002416:
    ld   hl,W_SpriteXSpeed          ; 00:2416
    add  hl,de                      ; 00:2419
    ld   a,[hl]                     ; 00:241A
    bit  7,a                        ; 00:241B
    jr   z,Code0023AD               ; 00:241D
    jp   Code00237B                 ; 00:241F
Code002422:
    ld   hl,W_SpriteXSpeed          ; 00:2422
    add  hl,de                      ; 00:2425
    ld   a,[hl]                     ; 00:2426
    bit  7,a                        ; 00:2427
    jr   nz,Code0023AD              ; 00:2429
    jp   Code00237B                 ; 00:242B
Code00242E:
    ld   hl,$D22B                   ; 00:242E
    add  hl,bc                      ; 00:2431
    ld   a,[hl]                     ; 00:2432
    ld   [hl],$01                   ; 00:2433
    scf                             ; 00:2435
    ret                             ; 00:2436

Code002437:
    scf                             ; 00:2437
    ccf                             ; 00:2438
    ret                             ; 00:2439

Sub00243A:
    push bc                         ; 00:243A
    ld   hl,$D22B                   ; 00:243B
    add  hl,bc                      ; 00:243E
    ld   a,[hl]                     ; 00:243F
    and  a                          ; 00:2440
    jr   z,Code00244D               ; 00:2441
    ld   hl,$D22B                   ; 00:2443
    add  hl,bc                      ; 00:2446
    ld   a,[hl]                     ; 00:2447
    xor  a                          ; 00:2448
    ld   [hl],a                     ; 00:2449
    jp   Code00255E                 ; 00:244A
Code00244D:
    ld   hl,$D2A3                   ; 00:244D
    add  hl,bc                      ; 00:2450
    ld   a,[hl]                     ; 00:2451
    bit  0,a                        ; 00:2452
    jr   z,Code002456               ; 00:2454
Code002456:
    ld   hl,W_SpriteXSpeed          ; 00:2456
    add  hl,bc                      ; 00:2459
    ld   a,[hl]                     ; 00:245A
    ldh  [<$FFA6],a                 ; 00:245B
    ld   hl,$D285                   ; 00:245D
    add  hl,bc                      ; 00:2460
    ld   a,[hl]                     ; 00:2461
    sla  a                          ; 00:2462
    sla  a                          ; 00:2464
    ld   e,a                        ; 00:2466
    ld   d,$00                      ; 00:2467
    ld   hl,Data002F63              ; 00:2469
    add  hl,de                      ; 00:246C
    ldi  a,[hl]                     ; 00:246D
    ldh  [<$FF97],a                 ; 00:246E
    ldi  a,[hl]                     ; 00:2470
    ld   [$D2D8],a                  ; 00:2471
    ldi  a,[hl]                     ; 00:2474
    ldh  [<$FF98],a                 ; 00:2475
    ld   a,[hl]                     ; 00:2477
    ld   [$D2D9],a                  ; 00:2478
    ld   hl,W_SpriteXHigh           ; 00:247B
    add  hl,bc                      ; 00:247E
    ld   e,[hl]                     ; 00:247F
    ldh  a,[<$FF97]                 ; 00:2480
    ld   hl,W_SpriteXLow            ; 00:2482
    add  hl,bc                      ; 00:2485
    add  [hl]                       ; 00:2486
    ld   [$D2D4],a                  ; 00:2487
    ld   a,$00                      ; 00:248A
    adc  e                          ; 00:248C
    ld   [$D2D5],a                  ; 00:248D
    ld   hl,W_SpriteYLow            ; 00:2490
    add  hl,bc                      ; 00:2493
    ld   a,[hl]                     ; 00:2494
    ld   hl,$FF98                   ; 00:2495
    add  [hl]                       ; 00:2498
    ld   [$D2D6],a                  ; 00:2499
    ld   hl,$D294                   ; 00:249C
    add  hl,bc                      ; 00:249F
    ld   a,[hl]                     ; 00:24A0
    ld   [$D2EB],a                  ; 00:24A1
    ld   bc,$0000                   ; 00:24A4
Code0024A7:
    ld   hl,W_SpriteStatus          ; 00:24A7
    add  hl,bc                      ; 00:24AA
    ld   a,[hl]                     ; 00:24AB
    and  a                          ; 00:24AC
    jp   z,Code00258C               ; 00:24AD
    ld   a,[$C414]                  ; 00:24B0
    cp   c                          ; 00:24B3
    jp   z,Code00258C               ; 00:24B4
    ld   hl,$D1A4                   ; 00:24B7
    add  hl,bc                      ; 00:24BA
    ld   a,[hl]                     ; 00:24BB
    cp   $01                        ; 00:24BC
    jp   z,Code00258C               ; 00:24BE
    ld   hl,$D2A3                   ; 00:24C1
    add  hl,bc                      ; 00:24C4
    ld   a,[hl]                     ; 00:24C5
    bit  0,a                        ; 00:24C6
    jp   nz,Code00258C              ; 00:24C8
    ld   hl,$D285                   ; 00:24CB
    add  hl,bc                      ; 00:24CE
    ld   e,[hl]                     ; 00:24CF
    sla  e                          ; 00:24D0
    sla  e                          ; 00:24D2
    ld   d,$00                      ; 00:24D4
    ld   hl,Data002F63              ; 00:24D6
    add  hl,de                      ; 00:24D9
    ldi  a,[hl]                     ; 00:24DA
    ldh  [<$FF97],a                 ; 00:24DB
    ldi  a,[hl]                     ; 00:24DD
    ld   [$D2DE],a                  ; 00:24DE
    ldi  a,[hl]                     ; 00:24E1
    ldh  [<$FF98],a                 ; 00:24E2
    ld   a,[hl]                     ; 00:24E4
    ld   [$D2DF],a                  ; 00:24E5
    ld   hl,W_SpriteXHigh           ; 00:24E8
    add  hl,bc                      ; 00:24EB
    ld   e,[hl]                     ; 00:24EC
    ldh  a,[<$FF97]                 ; 00:24ED
    ld   hl,W_SpriteXLow            ; 00:24EF
    add  hl,bc                      ; 00:24F2
    add  [hl]                       ; 00:24F3
    ld   [$D2DA],a                  ; 00:24F4
    ld   a,$00                      ; 00:24F7
    adc  e                          ; 00:24F9
    ld   [$D2DB],a                  ; 00:24FA
    ld   hl,W_SpriteYLow            ; 00:24FD
    add  hl,bc                      ; 00:2500
    ld   a,[hl]                     ; 00:2501
    ld   hl,$FF98                   ; 00:2502
    add  [hl]                       ; 00:2505
    ld   [$D2DC],a                  ; 00:2506
    ld   hl,$D2D6                   ; 00:2509
    ld   a,[$D2DC]                  ; 00:250C
    sub  [hl]                       ; 00:250F
    bit  7,a                        ; 00:2510
    jr   z,Code002516               ; 00:2512
    cpl                             ; 00:2514
    inc  a                          ; 00:2515
Code002516:
    ldh  [<$FF97],a                 ; 00:2516
    ld   hl,$D2DA                   ; 00:2518
    ld   a,[$D2D4]                  ; 00:251B
    sub  [hl]                       ; 00:251E
    ldh  [<$FF98],a                 ; 00:251F
    ld   hl,$D2DB                   ; 00:2521
    ld   a,[$D2D5]                  ; 00:2524
    sbc  [hl]                       ; 00:2527
    ldh  [<$FF99],a                 ; 00:2528
    bit  7,a                        ; 00:252A
    jr   z,Code00253E               ; 00:252C
    cpl                             ; 00:252E
    ldh  [<$FF99],a                 ; 00:252F
    ldh  a,[<$FF98]                 ; 00:2531
    cpl                             ; 00:2533
    add  $01                        ; 00:2534
    ldh  [<$FF98],a                 ; 00:2536
    ldh  a,[<$FF99]                 ; 00:2538
    adc  $00                        ; 00:253A
    ldh  [<$FF99],a                 ; 00:253C
Code00253E:
    and  a                          ; 00:253E
    jp   nz,Code00258C              ; 00:253F
    ld   hl,$D2DF                   ; 00:2542
    ld   a,[$D2D9]                  ; 00:2545
    add  [hl]                       ; 00:2548
    ld   hl,$FF97                   ; 00:2549
    cp   [hl]                       ; 00:254C
    jp   c,Code00258C               ; 00:254D
    ld   hl,$D2DE                   ; 00:2550
    ld   a,[$D2D8]                  ; 00:2553
    add  [hl]                       ; 00:2556
    ld   hl,$FF98                   ; 00:2557
    cp   [hl]                       ; 00:255A
    jp   c,Code00258C               ; 00:255B
Code00255E:
    ld   hl,W_SpriteID              ; 00:255E
    add  hl,bc                      ; 00:2561
    ld   a,[hl]                     ; 00:2562
    cp   $19                        ; 00:2563
    jr   z,Code00257D               ; 00:2565
    cp   $47                        ; 00:2567
    jr   z,Code00257D               ; 00:2569
    cp   $0C                        ; 00:256B
    jr   nz,Code002576              ; 00:256D
    ld   a,[$D2EB]                  ; 00:256F
    and  $02                        ; 00:2572
    jr   z,Code00258C               ; 00:2574
Code002576:
    ld   de,$0000                   ; 00:2576
    ld   e,c                        ; 00:2579
    pop  bc                         ; 00:257A
Code00257B:
    scf                             ; 00:257B
    ret                             ; 00:257C

Code00257D:
    ld   d,$00                      ; 00:257D
    ld   e,c                        ; 00:257F
    pop  bc                         ; 00:2580
    ld   hl,W_SpriteID              ; 00:2581
    add  hl,bc                      ; 00:2584
    ld   a,[hl]                     ; 00:2585
    cp   $0D                        ; 00:2586
    jr   z,Code00257B               ; 00:2588
    push bc                         ; 00:258A
    ld   c,e                        ; 00:258B
Code00258C:
    inc  c                          ; 00:258C
    ld   a,c                        ; 00:258D
    cp   $0F                        ; 00:258E
    jp   nz,Code0024A7              ; 00:2590
    pop  bc                         ; 00:2593
    scf                             ; 00:2594
    ccf                             ; 00:2595
    ret                             ; 00:2596

Sub002597:
    call Sub00218B                  ; 00:2597
    jr   nc,Code0025C4              ; 00:259A
    ld   hl,$D1EF                   ; 00:259C
    add  hl,bc                      ; 00:259F
    ld   a,[hl]                     ; 00:25A0
    and  a                          ; 00:25A1
    jp   nz,Code0025AB              ; 00:25A2
    ld   hl,$D1FE                   ; 00:25A5
    add  hl,bc                      ; 00:25A8
    ld   [hl],$01                   ; 00:25A9
Code0025AB:
    ld   hl,$D1FE                   ; 00:25AB
    add  hl,de                      ; 00:25AE
    ld   a,[hl]                     ; 00:25AF
    and  a                          ; 00:25B0
    jr   nz,Return0025CA            ; 00:25B1
    ld   hl,$D1FE                   ; 00:25B3
    add  hl,bc                      ; 00:25B6
    ld   a,[hl]                     ; 00:25B7
    and  a                          ; 00:25B8
    jr   nz,Return0025CA            ; 00:25B9
    ld   hl,W_SpriteXSpeed          ; 00:25BB
    add  hl,bc                      ; 00:25BE
    ld   a,[hl]                     ; 00:25BF
    xor  $FF                        ; 00:25C0
    inc  a                          ; 00:25C2
    ld   [hl],a                     ; 00:25C3
Code0025C4:
    ld   hl,$D1FE                   ; 00:25C4
    add  hl,bc                      ; 00:25C7
    ld   [hl],$00                   ; 00:25C8
Return0025CA:
    ret                             ; 00:25CA

Sub0025CB:
    ld   a,[W_GameMode]             ; 00:25CB
    cp   $02                        ; 00:25CE
    jr   z,Code0025F3               ; 00:25D0
    ld   a,[$C174]                  ; 00:25D2
    and  a                          ; 00:25D5
    jr   nz,Code0025F6              ; 00:25D6
    ld   a,[W_PlayerState]          ; 00:25D8
    cp   $07                        ; 00:25DB
    jr   z,Code0025F6               ; 00:25DD
    cp   $06                        ; 00:25DF
    jr   z,Code0025F6               ; 00:25E1
    cp   $09                        ; 00:25E3
    jr   z,Code0025F6               ; 00:25E5
    cp   $03                        ; 00:25E7
    jr   z,Code0025F6               ; 00:25E9
    cp   $04                        ; 00:25EB
    jr   z,Code0025F6               ; 00:25ED
    cp   $0B                        ; 00:25EF
    jr   z,Code0025F6               ; 00:25F1
Code0025F3:
    scf                             ; 00:25F3
    ccf                             ; 00:25F4
    ret                             ; 00:25F5

Code0025F6:
    scf                             ; 00:25F6
    ret                             ; 00:25F7

Sub0025F8:
    ld   hl,$D2F4                   ; 00:25F8
    inc  [hl]                       ; 00:25FB
    ret                             ; 00:25FC

Sub0025FD:
    ld   a,[$D2F4]                  ; 00:25FD
    and  a                          ; 00:2600
    jp   z,Return0026A7             ; 00:2601
    ld   a,[W_GameMode]             ; 00:2604
    cp   $02                        ; 00:2607
    jr   z,Code002646               ; 00:2609
    ld   a,[W_PlayerState]          ; 00:260B
    cp   $03                        ; 00:260E
    ret  z                          ; 00:2610
    cp   $07                        ; 00:2611
    ret  z                          ; 00:2613
    cp   $06                        ; 00:2614
    ret  z                          ; 00:2616
    cp   $09                        ; 00:2617
    ret  z                          ; 00:2619
    ld   a,$13                      ; 00:261A
    ld   [W_PlayerState],a          ; 00:261C
    xor  a                          ; 00:261F
    ld   [$C1C7],a                  ; 00:2620
    ld   [$C200],a                  ; 00:2623
    ldh  [<$FFAE],a                 ; 00:2626
    ld   a,$B6                      ; 00:2628
    ldh  [<$FFAC],a                 ; 00:262A
    ld   a,$00                      ; 00:262C
    ld   [$C203],a                  ; 00:262E
    ld   a,$0A                      ; 00:2631
    ld   [$C204],a                  ; 00:2633
    ld   a,$00                      ; 00:2636
    ld   [$C205],a                  ; 00:2638
    ld   a,$0A                      ; 00:263B
    ld   [$C206],a                  ; 00:263D
    ld   a,$44                      ; 00:2640
    ldh  [<$FFF2],a                 ; 00:2642
    jr   Code00269F                 ; 00:2644
Code002646:
    ld   a,[$D2F5]                  ; 00:2646
    swap a                          ; 00:2649
    sla  a                          ; 00:264B
    sla  a                          ; 00:264D
    sla  a                          ; 00:264F
    ld   e,a                        ; 00:2651
    ld   d,$00                      ; 00:2652
    ld   hl,$C509                   ; 00:2654
    add  hl,de                      ; 00:2657
    ld   a,[hl]                     ; 00:2658
    cp   $03                        ; 00:2659
    ret  z                          ; 00:265B
    cp   $07                        ; 00:265C
    ret  z                          ; 00:265E
    cp   $06                        ; 00:265F
    ret  z                          ; 00:2661
    cp   $09                        ; 00:2662
    ret  z                          ; 00:2664
    ld   [hl],$13                   ; 00:2665
    ld   hl,$C50F                   ; 00:2667
    add  hl,de                      ; 00:266A
    ld   [hl],$00                   ; 00:266B
    ld   hl,$C508                   ; 00:266D
    add  hl,de                      ; 00:2670
    ld   [hl],$00                   ; 00:2671
    ld   hl,$C548                   ; 00:2673
    add  hl,de                      ; 00:2676
    ld   [hl],$00                   ; 00:2677
    ld   hl,$C506                   ; 00:2679
    add  hl,de                      ; 00:267C
    ld   [hl],$B6                   ; 00:267D
    ld   hl,$C54B                   ; 00:267F
    add  hl,de                      ; 00:2682
    ld   [hl],$00                   ; 00:2683
    ld   hl,$C54C                   ; 00:2685
    add  hl,de                      ; 00:2688
    ld   [hl],$0A                   ; 00:2689
    ld   hl,$C54D                   ; 00:268B
    add  hl,de                      ; 00:268E
    ld   [hl],$00                   ; 00:268F
    ld   hl,$C54E                   ; 00:2691
    add  hl,de                      ; 00:2694
    ld   [hl],$0A                   ; 00:2695
    ld   a,$44                      ; 00:2697
    ldh  [<$FFF2],a                 ; 00:2699
    ld   a,e                        ; 00:269B
    and  a                          ; 00:269C
    jr   nz,Return0026A7            ; 00:269D
Code00269F:
    ld   de,$0008                   ; 00:269F
    ld   a,$03                      ; 00:26A2
    call Return0010B2               ; 00:26A4
Return0026A7:
    ret                             ; 00:26A7

Sub0026A8:
    ld   a,[W_PlayerState]          ; 00:26A8
    cp   $06                        ; 00:26AB
    jr   z,Code0026B3               ; 00:26AD
    cp   $03                        ; 00:26AF
    jr   nz,Return0026B9            ; 00:26B1
Code0026B3:
    ld   hl,$D20D                   ; 00:26B3
    add  hl,bc                      ; 00:26B6
    ld   [hl],$08                   ; 00:26B7
Return0026B9:
    ret                             ; 00:26B9

LoadSpriteFixedSlot:
; Load spriteID A into slot DE
    push bc                         ; 00:26BA
    push af                         ; 00:26BB
    jr   Code0026D5                 ; 00:26BC

LoadSpriteAnySlot:
; subroutine: Find free sprite slot, then load spriteID A into it
; If the sprite was loaded, return slot index in DE, with carry flag clear
; If no slot found, set carry flag
    push bc                         ; 00:26BE
    push af                         ; 00:26BF
    ld   de,$0000                   ; 00:26C0
@Loop_CheckSlots:
    ld   hl,W_SpriteStatus          ; 00:26C3
    add  hl,de                      ; 00:26C6
    ld   a,[hl]                     ; 00:26C7
    and  a                          ; 00:26C8
    jr   z,Code0026D5               ; 00:26C9
    inc  e                          ; 00:26CB
    ld   a,e                        ; 00:26CC
    cp   $0F                        ; 00:26CD
    jr   nz,@Loop_CheckSlots        ; 00:26CF
    pop  af                         ; 00:26D1
    pop  bc                         ; 00:26D2
    scf                             ; 00:26D3  if no slot found, set carry flag
    ret                             ; 00:26D4

Code0026D5:
; Load a sprite into slot DE, using sprite ID from stack
    ld   hl,W_SpriteStatus          ; 00:26D5
    add  hl,de                      ; 00:26D8
    ld   a,$02                      ; 00:26D9
    ld   [hl],a                     ; 00:26DB
    ld   hl,W_SpriteID              ; 00:26DC
    add  hl,de                      ; 00:26DF
    pop  af                         ; 00:26E0
    ld   [hl],a                     ; 00:26E1
    ld   hl,W_SpriteXSpeed          ; 00:26E2  first table to clear
    add  hl,de                      ; 00:26E5
    push de                         ; 00:26E6
    ld   de,$000F                   ; 00:26E7
    ld   c,$2A                      ; 00:26EA
    ld   a,$00                      ; 00:26EC
Loop_ClearSprTables:                ;         \ clear RAM from $D05A+de to $D2D0+de
    ld   [hl],a                     ; 00:26EE
    add  hl,de                      ; 00:26EF
    dec  c                          ; 00:26F0
    jr   nz,Loop_ClearSprTables     ; 00:26F1 /
    pop  de                         ; 00:26F3
    ld   a,$00                      ; 00:26F4
    ld   hl,W_SpriteYHigh           ; 00:26F6
    add  hl,de                      ; 00:26F9
    ld   [hl],a                     ; 00:26FA
    ld   hl,$D20D                   ; 00:26FB
    add  hl,de                      ; 00:26FE
    ld   [hl],a                     ; 00:26FF
    call Sub002723                  ; 00:2700
    pop  bc                         ; 00:2703
    scf                             ; 00:2704
    ccf                             ; 00:2705  if slot found, clear carry flag
    ret                             ; 00:2706

Sub002707:
    push bc                         ; 00:2707
    ld   d,b                        ; 00:2708
    ld   e,c                        ; 00:2709
    call Sub002723                  ; 00:270A
    pop  bc                         ; 00:270D
    ld   hl,$D13B                   ; 00:270E
    add  hl,bc                      ; 00:2711
    ld   [hl],$02                   ; 00:2712
    ld   hl,$D10E                   ; 00:2714
    add  hl,bc                      ; 00:2717
    ld   a,[hl]                     ; 00:2718
    and  $80                        ; 00:2719
    or   $03                        ; 00:271B
    ld   [hl],a                     ; 00:271D
    xor  a                          ; 00:271E
    ld   [$C1DE],a                  ; 00:271F
    ret                             ; 00:2722

Sub002723:
    ld   hl,W_SpriteID              ; 00:2723
    add  hl,de                      ; 00:2726
    ld   c,[hl]                     ; 00:2727
    ld   b,$00                      ; 00:2728
    ldh  a,[<$FFBE]                 ; 00:272A
    push af                         ; 00:272C
    ld   a,:Data0567F1              ; 00:272D
    call SetROMBank                 ; 00:272F
    ld   hl,Data0567F1              ; 00:2732
    add  hl,bc                      ; 00:2735
    ld   a,[hl]                     ; 00:2736
    ld   hl,$D276                   ; 00:2737
    add  hl,de                      ; 00:273A
    ld   [hl],a                     ; 00:273B
    ld   hl,Data056856              ; 00:273C
    add  hl,bc                      ; 00:273F
    ld   a,[hl]                     ; 00:2740
    ld   hl,$D285                   ; 00:2741
    add  hl,de                      ; 00:2744
    ld   [hl],a                     ; 00:2745
    ld   hl,Data0568BB              ; 00:2746
    add  hl,bc                      ; 00:2749
    ld   a,[hl]                     ; 00:274A
    ld   hl,$D294                   ; 00:274B
    add  hl,de                      ; 00:274E
    ld   [hl],a                     ; 00:274F
    ld   hl,Data056920              ; 00:2750
    add  hl,bc                      ; 00:2753
    ld   a,[hl]                     ; 00:2754
    ld   hl,$D2A3                   ; 00:2755
    add  hl,de                      ; 00:2758
    ld   [hl],a                     ; 00:2759
    ld   hl,Data056985              ; 00:275A
    add  hl,bc                      ; 00:275D
    ld   a,[hl]                     ; 00:275E
    ld   hl,$D2B2                   ; 00:275F
    add  hl,de                      ; 00:2762
    ld   [hl],a                     ; 00:2763
    pop  af                         ; 00:2764
    call SetROMBank                 ; 00:2765
    ret                             ; 00:2768

Sub002769:
    ldi  a,[hl]                     ; 00:2769
    ldh  [<$FF9F],a                 ; 00:276A
    ldi  a,[hl]                     ; 00:276C
    ldh  [<$FFA0],a                 ; 00:276D
    ldi  a,[hl]                     ; 00:276F
    ldh  [<$FFA1],a                 ; 00:2770
    ld   a,[hl]                     ; 00:2772
    ldh  [<$FFA2],a                 ; 00:2773
    ld   hl,$D2B2                   ; 00:2775
    add  hl,bc                      ; 00:2778
    ld   a,[hl]                     ; 00:2779
    swap a                          ; 00:277A
    and  $0F                        ; 00:277C
    ld   e,a                        ; 00:277E
    ldh  a,[<$FF97]                 ; 00:277F
    ld   hl,H_CameraY               ; 00:2781
    add  e                          ; 00:2784
    sub  [hl]                       ; 00:2785
    ldh  [<$FF97],a                 ; 00:2786
    ldh  a,[<$FF9B]                 ; 00:2788
    ld   hl,$FFBB                   ; 00:278A
    sbc  [hl]                       ; 00:278D
    ldh  [<$FF9B],a                 ; 00:278E
    ldh  a,[<$FF97]                 ; 00:2790
    add  $10                        ; 00:2792
    ldh  [<$FF97],a                 ; 00:2794
    ldh  a,[<$FF9B]                 ; 00:2796
    adc  $00                        ; 00:2798
    and  a                          ; 00:279A
    jp   nz,Return002860            ; 00:279B
    ldh  a,[<$FF99]                 ; 00:279E
    ld   e,a                        ; 00:27A0
    ldh  a,[<$FF98]                 ; 00:27A1
    add  $08                        ; 00:27A3
    ldh  [<$FF98],a                 ; 00:27A5
    ldh  a,[<$FF99]                 ; 00:27A7
    adc  $00                        ; 00:27A9
    ld   e,a                        ; 00:27AB
    ld   hl,H_CameraXLow            ; 00:27AC
    ldh  a,[<$FF98]                 ; 00:27AF
    sub  [hl]                       ; 00:27B1
    ldh  [<$FF98],a                 ; 00:27B2
    ld   hl,H_CameraXHigh           ; 00:27B4
    ld   a,e                        ; 00:27B7
    sbc  [hl]                       ; 00:27B8
    ldh  [<$FF99],a                 ; 00:27B9
    jr   Code002824                 ; 00:27BB

Disp16x16Sprite:
; subroutine: Display 16x16 sprite
; HL: pointer to 4 bytes of OAM attributes
    ldi  a,[hl]                     ; 00:27BD
    ldh  [<$FF9F],a                 ; 00:27BE
    ldi  a,[hl]                     ; 00:27C0
    ldh  [<$FFA0],a                 ; 00:27C1
    ldi  a,[hl]                     ; 00:27C3
    ldh  [<$FFA1],a                 ; 00:27C4
    ld   a,[hl]                     ; 00:27C6
    ldh  [<$FFA2],a                 ; 00:27C7
    ld   hl,$D2B2                   ; 00:27C9
    add  hl,bc                      ; 00:27CC
    ld   a,[hl]                     ; 00:27CD
    swap a                          ; 00:27CE
    and  $0F                        ; 00:27D0
    ld   d,a                        ; 00:27D2
    ld   hl,W_SpriteYHigh           ; 00:27D3
    add  hl,bc                      ; 00:27D6
    ld   a,[hl]                     ; 00:27D7
    ld   e,a                        ; 00:27D8
    ld   hl,W_SpriteYLow            ; 00:27D9
    add  hl,bc                      ; 00:27DC
    ld   a,[hl]                     ; 00:27DD
    add  d                          ; 00:27DE
    add  $10                        ; 00:27DF
    ldh  [<$FF97],a                 ; 00:27E1
    ld   a,e                        ; 00:27E3
    adc  $00                        ; 00:27E4
    ldh  [<$FFA6],a                 ; 00:27E6
    ld   hl,H_CameraY               ; 00:27E8
    ldh  a,[<$FF97]                 ; 00:27EB
    sub  [hl]                       ; 00:27ED
    ldh  [<$FF97],a                 ; 00:27EE
    ld   hl,$FFBB                   ; 00:27F0
    ldh  a,[<$FFA6]                 ; 00:27F3
    sbc  [hl]                       ; 00:27F5
    and  a                          ; 00:27F6
    jr   nz,Return002860            ; 00:27F7
    ld   hl,W_SpriteXHigh           ; 00:27F9
    add  hl,bc                      ; 00:27FC
    ld   e,[hl]                     ; 00:27FD
    ld   hl,W_SpriteXLow            ; 00:27FE
    add  hl,bc                      ; 00:2801
    ld   a,[hl]                     ; 00:2802
    add  $08                        ; 00:2803
    ldh  [<$FF98],a                 ; 00:2805
    ld   a,$00                      ; 00:2807
    adc  e                          ; 00:2809
    ld   e,a                        ; 00:280A
    ld   hl,W_SpriteID              ; 00:280B
    add  hl,bc                      ; 00:280E
    ld   a,[hl]                     ; 00:280F
    cp   $1E                        ; 00:2810  1E: score sprite
    ld   a,e                        ; 00:2812
    jr   z,@Code002822              ; 00:2813
    ld   hl,H_CameraXLow            ; 00:2815
    ldh  a,[<$FF98]                 ; 00:2818
    sub  [hl]                       ; 00:281A
    ldh  [<$FF98],a                 ; 00:281B
    ld   hl,H_CameraXHigh           ; 00:281D
    ld   a,e                        ; 00:2820
    sbc  [hl]                       ; 00:2821
@Code002822:
    ldh  [<$FF99],a                 ; 00:2822
Code002824:
    ld   hl,$FF99                   ; 00:2824
    ldh  a,[<$FF98]                 ; 00:2827
    add  $10                        ; 00:2829
    ld   e,a                        ; 00:282B
    ld   a,$00                      ; 00:282C
    adc  [hl]                       ; 00:282E
    and  a                          ; 00:282F
    jr   nz,Return002860            ; 00:2830
    ld   a,e                        ; 00:2832
    cp   $B8                        ; 00:2833
    jr   nc,Return002860            ; 00:2835
    ld   hl,W_OAMBuffer             ; 00:2837
    ldh  a,[<$FFC1]                 ; 00:283A
    ld   e,a                        ; 00:283C
    ld   d,$00                      ; 00:283D
    add  hl,de                      ; 00:283F
    ldh  a,[<$FF97]                 ; 00:2840
    ldi  [hl],a                     ; 00:2842
    ldh  a,[<$FF98]                 ; 00:2843
    ldi  [hl],a                     ; 00:2845
    ldh  a,[<$FF9F]                 ; 00:2846
    ldi  [hl],a                     ; 00:2848
    ldh  a,[<$FFA0]                 ; 00:2849
    ld   [hl],a                     ; 00:284B
    call Sub0028FD                  ; 00:284C
    ldh  a,[<$FF97]                 ; 00:284F
    ldi  [hl],a                     ; 00:2851
    ldh  a,[<$FF98]                 ; 00:2852
    add  $08                        ; 00:2854
    ldi  [hl],a                     ; 00:2856
    ldh  a,[<$FFA1]                 ; 00:2857
    ldi  [hl],a                     ; 00:2859
    ldh  a,[<$FFA2]                 ; 00:285A
    ld   [hl],a                     ; 00:285C
    call Sub0028FD                  ; 00:285D
Return002860:
    ret                             ; 00:2860

Sub002861:
    ldi  a,[hl]                     ; 00:2861
    ldh  [<$FF9F],a                 ; 00:2862
    ld   a,[hl]                     ; 00:2864
    ldh  [<$FFA0],a                 ; 00:2865
    ldh  a,[<$FF97]                 ; 00:2867
    ld   hl,H_CameraY               ; 00:2869
    add  $10                        ; 00:286C
    sub  [hl]                       ; 00:286E
    ldh  [<$FF97],a                 ; 00:286F
    ld   hl,$FFBB                   ; 00:2871
    ldh  a,[<$FFA6]                 ; 00:2874
    sbc  [hl]                       ; 00:2876
    and  a                          ; 00:2877
    ret  nz                         ; 00:2878

Sub002879:
    ldh  a,[<$FF98]                 ; 00:2879
    add  $08                        ; 00:287B
    ld   e,a                        ; 00:287D
    ldh  a,[<$FF99]                 ; 00:287E
    adc  $00                        ; 00:2880
    ld   d,a                        ; 00:2882
    ld   a,e                        ; 00:2883
    ld   hl,H_CameraXLow            ; 00:2884
    sub  [hl]                       ; 00:2887
    ldh  [<$FF98],a                 ; 00:2888
    ld   a,d                        ; 00:288A
    ld   hl,H_CameraXHigh           ; 00:288B
    sbc  [hl]                       ; 00:288E
    ldh  [<$FF99],a                 ; 00:288F
    jr   Code0028D1                 ; 00:2891

Sub002893:
    ldi  a,[hl]                     ; 00:2893
    ldh  [<$FF9F],a                 ; 00:2894
    ld   a,[hl]                     ; 00:2896
    ldh  [<$FFA0],a                 ; 00:2897
    ld   hl,W_SpriteYLow            ; 00:2899
    add  hl,bc                      ; 00:289C
    ld   a,[hl]                     ; 00:289D
    ld   hl,H_CameraY               ; 00:289E
    sub  [hl]                       ; 00:28A1
    add  $10                        ; 00:28A2
    ldh  [<$FF97],a                 ; 00:28A4
    ld   hl,W_SpriteXHigh           ; 00:28A6
    add  hl,bc                      ; 00:28A9
    ld   d,[hl]                     ; 00:28AA
    ld   hl,W_SpriteXLow            ; 00:28AB
    add  hl,bc                      ; 00:28AE
    ld   a,[hl]                     ; 00:28AF
    add  $08                        ; 00:28B0
    ldh  [<$FF98],a                 ; 00:28B2
    ld   e,a                        ; 00:28B4
    ld   a,d                        ; 00:28B5
    adc  $00                        ; 00:28B6
    ld   d,a                        ; 00:28B8
    ld   hl,W_SpriteID              ; 00:28B9
    add  hl,bc                      ; 00:28BC
    ld   a,[hl]                     ; 00:28BD
    cp   $1E                        ; 00:28BE
    ld   a,d                        ; 00:28C0
    jr   z,Code0028CF               ; 00:28C1
    ld   hl,H_CameraXLow            ; 00:28C3
    ld   a,e                        ; 00:28C6
    sub  [hl]                       ; 00:28C7
    ldh  [<$FF98],a                 ; 00:28C8
    ld   hl,H_CameraXHigh           ; 00:28CA
    ld   a,d                        ; 00:28CD
    sbc  [hl]                       ; 00:28CE
Code0028CF:
    ldh  [<$FF99],a                 ; 00:28CF
Code0028D1:
    ld   hl,$FF99                   ; 00:28D1
    ldh  a,[<$FF98]                 ; 00:28D4
    add  $10                        ; 00:28D6
    ld   e,a                        ; 00:28D8
    ld   a,$00                      ; 00:28D9
    adc  [hl]                       ; 00:28DB
    and  a                          ; 00:28DC
    jr   nz,Return0028FC            ; 00:28DD
    ld   a,e                        ; 00:28DF
    cp   $B8                        ; 00:28E0
    jr   nc,Return0028FC            ; 00:28E2
    ld   hl,W_OAMBuffer             ; 00:28E4
    ldh  a,[<$FFC1]                 ; 00:28E7
    ld   e,a                        ; 00:28E9
    ld   d,$00                      ; 00:28EA
    add  hl,de                      ; 00:28EC
    ldh  a,[<$FF97]                 ; 00:28ED
    ldi  [hl],a                     ; 00:28EF
    ldh  a,[<$FF98]                 ; 00:28F0
    ldi  [hl],a                     ; 00:28F2
    ldh  a,[<$FF9F]                 ; 00:28F3
    ldi  [hl],a                     ; 00:28F5
    ldh  a,[<$FFA0]                 ; 00:28F6
    ld   [hl],a                     ; 00:28F8
    call Sub0028FD                  ; 00:28F9
Return0028FC:
    ret                             ; 00:28FC

Sub0028FD:
    ldh  a,[<$FFC1]                 ; 00:28FD
    add  $04                        ; 00:28FF
    cp   $A0                        ; 00:2901
    jr   c,Code002916               ; 00:2903
    ld   a,[W_GameMode]             ; 00:2905
    cp   $07                        ; 00:2908
    jr   z,Code002910               ; 00:290A
    cp   $02                        ; 00:290C
    jr   nz,Code002914              ; 00:290E
Code002910:
    ld   a,$38                      ; 00:2910
    jr   Code002916                 ; 00:2912
Code002914:
    ld   a,$28                      ; 00:2914
Code002916:
    ldh  [<$FFC1],a                 ; 00:2916
    ld   hl,W_OAMBuffer             ; 00:2918
    ld   e,a                        ; 00:291B
    ld   d,$00                      ; 00:291C
    add  hl,de                      ; 00:291E
    ret                             ; 00:291F

Sub002920:
    ld   hl,W_SpriteXHigh           ; 00:2920
    add  hl,bc                      ; 00:2923
    ld   d,[hl]                     ; 00:2924
    ld   hl,W_SpriteXLow            ; 00:2925
    add  hl,bc                      ; 00:2928
    ld   a,[hl]                     ; 00:2929
    add  $08                        ; 00:292A
    ld   e,a                        ; 00:292C
    ld   a,$00                      ; 00:292D
    adc  d                          ; 00:292F
    ld   d,a                        ; 00:2930
    ld   a,[$C1ED]                  ; 00:2931
    sub  $80                        ; 00:2934
    ldh  [<$FF98],a                 ; 00:2936
    ld   a,[$C1EE]                  ; 00:2938
    sbc  $00                        ; 00:293B
    ldh  [<$FF99],a                 ; 00:293D
    ld   a,[W_GameMode]             ; 00:293F
    cp   $07                        ; 00:2942
    jr   z,Code00296A               ; 00:2944
    cp   $02                        ; 00:2946
    jr   z,Code002979               ; 00:2948
    ld   hl,$FF98                   ; 00:294A
    ld   a,e                        ; 00:294D
    sub  [hl]                       ; 00:294E
    ld   e,a                        ; 00:294F
    ld   hl,$FF99                   ; 00:2950
    ld   a,d                        ; 00:2953
    sbc  [hl]                       ; 00:2954
    bit  7,a                        ; 00:2955
    jr   nz,Code002962              ; 00:2957
    cp   $01                        ; 00:2959
    jr   c,Code002967               ; 00:295B
    ld   a,e                        ; 00:295D
    cp   $80                        ; 00:295E
    jr   c,Code002967               ; 00:2960
Code002962:
    call Sub0029EF                  ; 00:2962
    scf                             ; 00:2965
    ret                             ; 00:2966

Code002967:
    scf                             ; 00:2967
    ccf                             ; 00:2968
    ret                             ; 00:2969

Code00296A:
    ld   hl,$C535                   ; 00:296A
    ldi  a,[hl]                     ; 00:296D
    sub  $80                        ; 00:296E
    ldh  [<$FF9A],a                 ; 00:2970
    ld   a,[hl]                     ; 00:2972
    sbc  $00                        ; 00:2973
    ldh  [<$FF9B],a                 ; 00:2975
    jr   Code00299E                 ; 00:2977
Code002979:
    bit  7,d                        ; 00:2979
    jr   nz,Code002962              ; 00:297B
    ld   hl,$C3E9                   ; 00:297D
    ldi  a,[hl]                     ; 00:2980
    sub  $80                        ; 00:2981
    ldh  [<$FF98],a                 ; 00:2983
    ld   a,[hl]                     ; 00:2985
    sbc  $00                        ; 00:2986
    ldh  [<$FF99],a                 ; 00:2988
    ld   hl,$C5B5                   ; 00:298A
    ldi  a,[hl]                     ; 00:298D
    sub  $80                        ; 00:298E
    ldh  [<$FF9A],a                 ; 00:2990
    ld   a,[hl]                     ; 00:2992
    sbc  $00                        ; 00:2993
    ldh  [<$FF9B],a                 ; 00:2995
    ld   a,[$DA6A]                  ; 00:2997
    cp   $01                        ; 00:299A
    jr   nz,Code0029BC              ; 00:299C
Code00299E:
    ld   hl,$FF98                   ; 00:299E
    ld   a,e                        ; 00:29A1
    sub  [hl]                       ; 00:29A2
    ld   hl,$FF99                   ; 00:29A3
    ld   a,d                        ; 00:29A6
    sbc  [hl]                       ; 00:29A7
    bit  7,a                        ; 00:29A8
    jr   z,Code002967               ; 00:29AA
    ld   hl,$FF9A                   ; 00:29AC
    ld   a,e                        ; 00:29AF
    sub  [hl]                       ; 00:29B0
    ld   hl,$FF9B                   ; 00:29B1
    ld   a,d                        ; 00:29B4
    sbc  [hl]                       ; 00:29B5
    bit  7,a                        ; 00:29B6
    jr   z,Code002967               ; 00:29B8
    jr   Code002962                 ; 00:29BA
Code0029BC:
    ld   hl,$FF9A                   ; 00:29BC
    ld   a,e                        ; 00:29BF
    sub  [hl]                       ; 00:29C0
    ld   hl,$FF9B                   ; 00:29C1
    ld   a,d                        ; 00:29C4
    sbc  [hl]                       ; 00:29C5
    bit  7,a                        ; 00:29C6
    jr   z,Code002967               ; 00:29C8
    ld   hl,$FF98                   ; 00:29CA
    ld   a,e                        ; 00:29CD
    sub  [hl]                       ; 00:29CE
    ld   hl,$FF99                   ; 00:29CF
    ld   a,d                        ; 00:29D2
    sbc  [hl]                       ; 00:29D3
    bit  7,a                        ; 00:29D4
    jr   z,Code002967               ; 00:29D6
    jr   Code002962                 ; 00:29D8

Sub0029DA:
    ld   hl,W_SpriteYHigh           ; 00:29DA
    add  hl,bc                      ; 00:29DD
    ld   a,[hl]                     ; 00:29DE
    ld   d,a                        ; 00:29DF
    ld   hl,W_SpriteYLow            ; 00:29E0
    add  hl,bc                      ; 00:29E3
    ld   a,[hl]                     ; 00:29E4
    add  $08                        ; 00:29E5
    ld   e,a                        ; 00:29E7
    ld   a,d                        ; 00:29E8
    adc  $00                        ; 00:29E9
    cp   $01                        ; 00:29EB
    jr   nz,Return0029FB            ; 00:29ED

Sub0029EF:
    ld   hl,W_SpriteStatus          ; 00:29EF
    add  hl,bc                      ; 00:29F2
    ld   [hl],$00                   ; 00:29F3
    ld   hl,W_SpriteID              ; 00:29F5
    add  hl,bc                      ; 00:29F8
    ld   [hl],$00                   ; 00:29F9
Return0029FB:
    ret                             ; 00:29FB

Sub0029FC:
    ld   hl,W_SpriteYLow            ; 00:29FC
    add  hl,bc                      ; 00:29FF
    ld   a,[hl]                     ; 00:2A00
    add  $08                        ; 00:2A01
    ld   e,a                        ; 00:2A03
    ld   a,$00                      ; 00:2A04
    adc  $00                        ; 00:2A06
    cp   $01                        ; 00:2A08
    jr   z,Code002A11               ; 00:2A0A
    ld   a,e                        ; 00:2A0C
    cp   $FC                        ; 00:2A0D
    jr   c,Return002A13             ; 00:2A0F
Code002A11:
    jr   Sub0029EF                  ; 00:2A11
Return002A13:
    ret                             ; 00:2A13

Data002A14:                         ; 00:2A14
.db $2E,$36,$22,$38

Sub002A18:
    ld   de,$0000                   ; 00:2A18
    ld   a,$00                      ; 00:2A1B
    ld   [$D2D2],a                  ; 00:2A1D
    ld   [$D2D3],a                  ; 00:2A20
@Loop002A23:
    ld   a,$00                      ; 00:2A23
    ld   hl,W_SpriteStatus          ; 00:2A25
    add  hl,de                      ; 00:2A28
    ld   [hl],a                     ; 00:2A29
    ld   hl,W_SpriteID              ; 00:2A2A
    add  hl,de                      ; 00:2A2D
    ld   [hl],a                     ; 00:2A2E
    inc  e                          ; 00:2A2F
    ld   a,e                        ; 00:2A30
    cp   $0F                        ; 00:2A31
    jr   nz,@Loop002A23             ; 00:2A33
    ld   a,$02                      ; 00:2A35
    call ClearWRAMBank              ; 00:2A37
    ld   a,$03                      ; 00:2A3A
    call ClearWRAMBank              ; 00:2A3C
    ld   a,[W_GameMode]             ; 00:2A3F
    cp   $07                        ; 00:2A42  07: You vs. Boo
    jr   nz,@Code002A51             ; 00:2A44
    xor  a                          ; 00:2A46 \ runs if You vs. Boo
    ldh  [<SVBK],a                  ; 00:2A47
    ld   a,:Sub0750B0               ; 00:2A49
    call SetROMBank                 ; 00:2A4B
    call Sub0750B0                  ; 00:2A4E /
@Code002A51:
    ld   a,:SublevelSprPtrsSP       ; 00:2A51
    call SetROMBank                 ; 00:2A53
    ld   hl,SublevelSprPtrsSP       ; 00:2A56
    ld   a,[W_SPFlag]               ; 00:2A59
    and  a                          ; 00:2A5C
    jr   nz,@LoadSprDataPtr         ; 00:2A5D
    ld   a,:SublevelSprPtrsNormal   ; 00:2A5F
    call SetROMBank                 ; 00:2A61
    ld   hl,SublevelSprPtrsHard     ; 00:2A64
    ld   a,[W_HardFlag]             ; 00:2A67
    and  a                          ; 00:2A6A
    jr   nz,@LoadSprDataPtr         ; 00:2A6B
    ld   hl,SublevelSprPtrsNormal   ; 00:2A6D
@LoadSprDataPtr:
; at this point, HL points to a pointer table
; if Super Players, 12:6B14, if normal mode, 05:5217, if hard mode, 05:6687
    ld   a,[W_SublevelID]           ; 00:2A70 \
    sla  a                          ; 00:2A73 |
    ld   e,a                        ; 00:2A75 | de = 2*sublevelID
    ld   d,$00                      ; 00:2A76 /
    add  hl,de                      ; 00:2A78  hl = address to load pointer to sprite data
    ldi  a,[hl]                     ; 00:2A79 \
    ld   e,a                        ; 00:2A7A |
    ld   h,[hl]                     ; 00:2A7B | hl = pointer to sprite data
    ld   l,e                        ; 00:2A7C /

@Loop_LoadSpriteData:
; Format: Each sprite command is 6 bytes long
;  byte 0: ignored, unless it's FF (which marks end of data)
;  byte 1: Y-position
;  byte 2: X-position high bit
;  byte 3: X-position
;  byte 4: ignored
;  byte 5: sprite ID
    ldi  a,[hl]                     ; 00:2A7D  load byte from sprite data
    cp   $FF                        ; 00:2A7E \ if byte is FF, end
    jr   z,@Loop_LoadSpriteData_End ; 00:2A80 /
    ldi  a,[hl]                     ; 00:2A82 \
    ldh  [<$FF97],a                 ; 00:2A83 | load byte 1 into $FF97, 2 into $FF9A,
    ldi  a,[hl]                     ; 00:2A85 |   3 into $FF98, and 5 into $FF99
    ldh  [<$FF9A],a                 ; 00:2A86 |
    ldi  a,[hl]                     ; 00:2A88 | so now $FF97-A contain bytes 1 3 5 2
    ldh  [<$FF98],a                 ; 00:2A89 |
    inc  hl                         ; 00:2A8B |
    ldi  a,[hl]                     ; 00:2A8C |
    ldh  [<$FF99],a                 ; 00:2A8D /
    push hl                         ; 00:2A8F
    ld   c,$02                      ; 00:2A90
    ldh  a,[<$FF9A]                 ; 00:2A92
    and  $0F                        ; 00:2A94
    and  a                          ; 00:2A96
    jr   z,@Code002A9B              ; 00:2A97
    ld   c,$03                      ; 00:2A99
@Code002A9B:
    ld   a,c                        ; 00:2A9B
    ldh  [<SVBK],a                  ; 00:2A9C
    ldh  a,[<$FF97]                 ; 00:2A9E
    and  $7F                        ; 00:2AA0
    swap a                          ; 00:2AA2
    ld   c,a                        ; 00:2AA4
    ld   b,$00                      ; 00:2AA5
    ldh  a,[<$FF98]                 ; 00:2AA7
    and  $F0                        ; 00:2AA9
    swap a                          ; 00:2AAB
    ld   d,a                        ; 00:2AAD
    ld   e,$00                      ; 00:2AAE
    ldh  a,[<$FF98]                 ; 00:2AB0
    and  $0F                        ; 00:2AB2
    ld   l,a                        ; 00:2AB4
    ld   h,$00                      ; 00:2AB5
    add  hl,de                      ; 00:2AB7
    add  hl,bc                      ; 00:2AB8
    push hl                         ; 00:2AB9
    ld   de,W_SubLvSprTilemap       ; 00:2ABA
    add  hl,de                      ; 00:2ABD
    ldh  a,[<$FF99]                 ; 00:2ABE
    ld   [hl],a                     ; 00:2AC0
    pop  hl                         ; 00:2AC1
    ld   a,[W_ChallengeFlag]        ; 00:2AC2
    and  a                          ; 00:2AC5
    jr   z,+                        ; 00:2AC6
+   pop  hl                         ; 00:2AC8
    jr   @Loop_LoadSpriteData       ; 00:2AC9
@Loop_LoadSpriteData_End:
    xor  a                          ; 00:2ACB
    ldh  [<SVBK],a                  ; 00:2ACC
    ldh  a,[<H_CameraXLow]          ; 00:2ACE
    add  $B0                        ; 00:2AD0
    ld   e,a                        ; 00:2AD2
    ldh  a,[<H_CameraXHigh]         ; 00:2AD3
    adc  $00                        ; 00:2AD5
    ld   d,a                        ; 00:2AD7
    srl  d                          ; 00:2AD8
    rr   e                          ; 00:2ADA
    srl  d                          ; 00:2ADC
    rr   e                          ; 00:2ADE
    srl  d                          ; 00:2AE0
    rr   e                          ; 00:2AE2
    srl  d                          ; 00:2AE4
    rr   e                          ; 00:2AE6
    ld   a,e                        ; 00:2AE8
    ld   [$D2D2],a                  ; 00:2AE9
    ld   a,d                        ; 00:2AEC
    ld   [$D2D3],a                  ; 00:2AED
    ldh  a,[<H_CameraXHigh]         ; 00:2AF0
    and  a                          ; 00:2AF2
    jr   z,@Code002B00              ; 00:2AF3
    ldh  a,[<H_CameraXLow]          ; 00:2AF5
    add  $A0                        ; 00:2AF7
    ld   e,a                        ; 00:2AF9
    ldh  a,[<H_CameraXHigh]         ; 00:2AFA
    adc  $00                        ; 00:2AFC
    jr   @Code002B05                ; 00:2AFE
@Code002B00:
    ldh  a,[<H_CameraXLow]          ; 00:2B00
    ld   e,a                        ; 00:2B02
    ldh  a,[<H_CameraXHigh]         ; 00:2B03
@Code002B05:
    ld   d,a                        ; 00:2B05
    srl  d                          ; 00:2B06
    rr   e                          ; 00:2B08
    srl  d                          ; 00:2B0A
    rr   e                          ; 00:2B0C
    srl  d                          ; 00:2B0E
    rr   e                          ; 00:2B10
    srl  d                          ; 00:2B12
    rr   e                          ; 00:2B14
@Loop002B16:
    push de                         ; 00:2B16
    sla  e                          ; 00:2B17
    rl   d                          ; 00:2B19
    sla  e                          ; 00:2B1B
    rl   d                          ; 00:2B1D
    sla  e                          ; 00:2B1F
    rl   d                          ; 00:2B21
    sla  e                          ; 00:2B23
    rl   d                          ; 00:2B25
    ld   a,d                        ; 00:2B27
    ldh  [<$FFA4],a                 ; 00:2B28
    ld   a,e                        ; 00:2B2A
    ldh  [<$FFA5],a                 ; 00:2B2B
    ld   a,$00                      ; 00:2B2D
    ldh  [<$FFA6],a                 ; 00:2B2F
    pop  de                         ; 00:2B31
    push de                         ; 00:2B32
    call Sub002CE2                  ; 00:2B33
    pop  de                         ; 00:2B36
    ld   a,$01                      ; 00:2B37
    add  e                          ; 00:2B39
    ld   e,a                        ; 00:2B3A
    ld   a,$00                      ; 00:2B3B
    adc  d                          ; 00:2B3D
    ld   d,a                        ; 00:2B3E
    ld   a,[$D2D2]                  ; 00:2B3F
    sub  e                          ; 00:2B42
    ld   a,[$D2D3]                  ; 00:2B43
    sbc  d                          ; 00:2B46
    bit  7,a                        ; 00:2B47
    jr   z,@Loop002B16              ; 00:2B49
    ldh  a,[<H_CameraXHigh]         ; 00:2B4B
    and  a                          ; 00:2B4D
    ret  z                          ; 00:2B4E
    call Sub002BAE                  ; 00:2B4F
    ld   bc,$0000                   ; 00:2B52
    ld   a,[$C182]                  ; 00:2B55
    ldh  [<$FF97],a                 ; 00:2B58
@Loop002B5A:
    ldh  a,[<$FF97]                 ; 00:2B5A
    srl  a                          ; 00:2B5C
    ldh  [<$FF97],a                 ; 00:2B5E
    jr   nc,@Code002B96             ; 00:2B60
    ld   hl,$C183                   ; 00:2B62
    add  hl,bc                      ; 00:2B65
    ld   a,[W_SublevelID]           ; 00:2B66
    cp   [hl]                       ; 00:2B69
    jr   nz,@Code002B96             ; 00:2B6A
    ld   hl,Data002A14              ; 00:2B6C
    add  hl,bc                      ; 00:2B6F
    ld   a,[hl]                     ; 00:2B70
    call LoadSpriteAnySlot          ; 00:2B71
    jr   c,@Code002B96              ; 00:2B74
    ld   hl,W_SpriteStatus          ; 00:2B76
    add  hl,de                      ; 00:2B79
    ld   [hl],$01                   ; 00:2B7A
    push bc                         ; 00:2B7C
    call Sub002BE1                  ; 00:2B7D
    pop  bc                         ; 00:2B80
    jr   @Code002B96                ; 00:2B81
@Unused002B83:
    ld   hl,W_SpriteXLow            ; 00:2B83
    add  hl,de                      ; 00:2B86
    ld   [hl],$00                   ; 00:2B87
    ld   hl,W_SpriteXHigh           ; 00:2B89
    add  hl,de                      ; 00:2B8C
    ldh  a,[<H_CameraXHigh]         ; 00:2B8D
    ld   [hl],a                     ; 00:2B8F
    ld   hl,W_SpriteYLow            ; 00:2B90
    add  hl,de                      ; 00:2B93
    ld   [hl],$40                   ; 00:2B94
@Code002B96:
    inc  c                          ; 00:2B96
    ld   a,c                        ; 00:2B97
    cp   $04                        ; 00:2B98
    jr   nz,@Loop002B5A             ; 00:2B9A
    ret                             ; 00:2B9C

ClearWRAMBank:
; subroutine: Clear WRAM bank (specified in A)
    ldh  [<SVBK],a                  ; 00:2B9D
    ld   hl,$D000                   ; 00:2B9F
    ld   de,$1000                   ; 00:2BA2
@Loop:
    ld   a,$00                      ; 00:2BA5
    ldi  [hl],a                     ; 00:2BA7
    dec  de                         ; 00:2BA8
    ld   a,e                        ; 00:2BA9
    or   d                          ; 00:2BAA
    jr   nz,@Loop                   ; 00:2BAB
    ret                             ; 00:2BAD

Sub002BAE:
    ld   a,[$C182]                  ; 00:2BAE
    bit  0,a                        ; 00:2BB1
    jr   nz,Code002BBA              ; 00:2BB3
    bit  2,a                        ; 00:2BB5
    jr   nz,Code002BD0              ; 00:2BB7
    ret                             ; 00:2BB9

Code002BBA:
    ld   a,[W_SPFlag]               ; 00:2BBA
    and  a                          ; 00:2BBD
    ret  z                          ; 00:2BBE
    ld   a,[W_SublevelID]           ; 00:2BBF
    cp   $0C                        ; 00:2BC2
    jr   nz,Code002BCB              ; 00:2BC4
    ldh  a,[<H_CameraXHigh]         ; 00:2BC6
    cp   $0A                        ; 00:2BC8
    ret  nz                         ; 00:2BCA
Code002BCB:
    xor  a                          ; 00:2BCB
    ld   [$C182],a                  ; 00:2BCC
    ret                             ; 00:2BCF

Code002BD0:
    ld   a,[W_SPFlag]               ; 00:2BD0
    and  a                          ; 00:2BD3
    ret  z                          ; 00:2BD4
    ld   a,[W_SublevelID]           ; 00:2BD5
    cp   $18                        ; 00:2BD8
    jr   z,Code002BCB               ; 00:2BDA
    cp   $1F                        ; 00:2BDC
    jr   z,Code002BCB               ; 00:2BDE
    ret                             ; 00:2BE0

Sub002BE1:
    ld   a,[$C182]                  ; 00:2BE1
    bit  0,a                        ; 00:2BE4
    jr   nz,Code002BF3              ; 00:2BE6
    bit  2,a                        ; 00:2BE8
    jr   nz,Code002C2B              ; 00:2BEA
    ret                             ; 00:2BEC

Data002BED:                         ; 00:2BED
.dw $0720,$0C50,$0850
Code002BF3:
    ld   a,[W_SPFlag]               ; 00:2BF3
    and  a                          ; 00:2BF6
    jr   nz,Code002C0E              ; 00:2BF7
    ld   a,[W_SublevelID]           ; 00:2BF9
    cp   $14                        ; 00:2BFC
    jr   z,Code002C06               ; 00:2BFE
    ldh  a,[<H_CameraXHigh]         ; 00:2C00
    cp   $0A                        ; 00:2C02
    jr   z,Code002C0A               ; 00:2C04
Code002C06:
    ld   c,$00                      ; 00:2C06
    jr   Code002C10                 ; 00:2C08
Code002C0A:
    ld   c,$02                      ; 00:2C0A
    jr   Code002C10                 ; 00:2C0C
Code002C0E:
    ld   c,$04                      ; 00:2C0E
Code002C10:
    ld   b,$00                      ; 00:2C10
    ld   hl,Data002BED              ; 00:2C12
    add  hl,bc                      ; 00:2C15
    ldi  a,[hl]                     ; 00:2C16
    push hl                         ; 00:2C17
    ld   hl,W_SpriteXLow            ; 00:2C18
    add  hl,de                      ; 00:2C1B
    ld   [hl],a                     ; 00:2C1C
    pop  hl                         ; 00:2C1D
    ld   a,[hl]                     ; 00:2C1E
    ld   hl,W_SpriteXHigh           ; 00:2C1F
    add  hl,de                      ; 00:2C22
    ld   [hl],a                     ; 00:2C23
    ret                             ; 00:2C24

Data002C25:                         ; 00:2C25
.dw $D7AC,$D7AC,$D8AC
Code002C2B:
    ld   a,[W_SPFlag]               ; 00:2C2B
    and  a                          ; 00:2C2E
    jr   nz,Code002C43              ; 00:2C2F
    call Sub002C52                  ; 00:2C31
    ld   a,[W_SublevelID]           ; 00:2C34
    cp   $06                        ; 00:2C37
    jr   nz,Code002C3F              ; 00:2C39
    ld   c,$00                      ; 00:2C3B
    jr   Code002C73                 ; 00:2C3D
Code002C3F:
    ld   c,$02                      ; 00:2C3F
    jr   Code002C73                 ; 00:2C41
Code002C43:
    ld   a,[W_SublevelID]           ; 00:2C43
    cp   $06                        ; 00:2C46
    ret  z                          ; 00:2C48
    push af                         ; 00:2C49
    call Sub002C52                  ; 00:2C4A
    pop  af                         ; 00:2C4D
    ld   c,$04                      ; 00:2C4E
    jr   Code002C73                 ; 00:2C50

Sub002C52:
    push de                         ; 00:2C52
    ld   de,$0000                   ; 00:2C53
    ld   hl,W_SpriteID              ; 00:2C56
Code002C59:
    ldi  a,[hl]                     ; 00:2C59
    cp   $22                        ; 00:2C5A
    jr   z,Code002C66               ; 00:2C5C
    inc  d                          ; 00:2C5E
    ld   a,d                        ; 00:2C5F
    cp   $10                        ; 00:2C60
    jr   nz,Code002C59              ; 00:2C62
    jr   Code002C71                 ; 00:2C64
Code002C66:
    xor  a                          ; 00:2C66
    ld   hl,W_SpriteID              ; 00:2C67
    add  hl,de                      ; 00:2C6A
    ld   [hl],a                     ; 00:2C6B
    ld   hl,W_SpriteStatus          ; 00:2C6C
    add  hl,de                      ; 00:2C6F
    ld   [hl],a                     ; 00:2C70
Code002C71:
    pop  de                         ; 00:2C71
    ret                             ; 00:2C72

Code002C73:
    ld   b,$00                      ; 00:2C73
    ld   hl,Data002C25              ; 00:2C75
    add  hl,bc                      ; 00:2C78
    ldi  a,[hl]                     ; 00:2C79
    push af                         ; 00:2C7A
    ld   h,[hl]                     ; 00:2C7B
    pop  af                         ; 00:2C7C
    ld   l,a                        ; 00:2C7D
    ld   a,$02                      ; 00:2C7E
    ldh  [<SVBK],a                  ; 00:2C80
    ld   [hl],$22                   ; 00:2C82
    xor  a                          ; 00:2C84
    ldh  [<SVBK],a                  ; 00:2C85
    ret                             ; 00:2C87

Sub002C88:
    ldh  a,[<H_CameraXHigh]         ; 00:2C88
    ld   d,a                        ; 00:2C8A
    ldh  a,[<H_CameraXLow]          ; 00:2C8B
    add  $B0                        ; 00:2C8D
    ld   e,a                        ; 00:2C8F
    ld   a,$00                      ; 00:2C90
    adc  d                          ; 00:2C92
    ld   d,a                        ; 00:2C93
    srl  d                          ; 00:2C94
    rr   e                          ; 00:2C96
    srl  d                          ; 00:2C98
    rr   e                          ; 00:2C9A
    srl  d                          ; 00:2C9C
    rr   e                          ; 00:2C9E
    srl  d                          ; 00:2CA0
    rr   e                          ; 00:2CA2
    ld   a,[$D2D2]                  ; 00:2CA4
    sub  e                          ; 00:2CA7
    ld   a,[$D2D3]                  ; 00:2CA8
    sbc  d                          ; 00:2CAB
    bit  7,a                        ; 00:2CAC
    jr   z,Return002CE1             ; 00:2CAE
    ld   a,[$D2D2]                  ; 00:2CB0
    add  $01                        ; 00:2CB3
    ld   [$D2D2],a                  ; 00:2CB5
    ld   e,a                        ; 00:2CB8
    ld   a,[$D2D3]                  ; 00:2CB9
    adc  $00                        ; 00:2CBC
    ld   [$D2D3],a                  ; 00:2CBE
    ld   d,a                        ; 00:2CC1
    push de                         ; 00:2CC2
    sla  e                          ; 00:2CC3
    rl   d                          ; 00:2CC5
    sla  e                          ; 00:2CC7
    rl   d                          ; 00:2CC9
    sla  e                          ; 00:2CCB
    rl   d                          ; 00:2CCD
    sla  e                          ; 00:2CCF
    rl   d                          ; 00:2CD1
    ld   a,d                        ; 00:2CD3
    ldh  [<$FFA4],a                 ; 00:2CD4
    ld   a,e                        ; 00:2CD6
    ldh  [<$FFA5],a                 ; 00:2CD7
    ld   a,$00                      ; 00:2CD9
    ldh  [<$FFA6],a                 ; 00:2CDB
    pop  de                         ; 00:2CDD
    call Sub002CE2                  ; 00:2CDE
Return002CE1:
    ret                             ; 00:2CE1

Sub002CE2:
    ld   b,$02                      ; 00:2CE2
    ld   a,d                        ; 00:2CE4
    and  a                          ; 00:2CE5
    jr   z,@Code002CEA              ; 00:2CE6
    ld   b,$03                      ; 00:2CE8
@Code002CEA:
    ld   a,b                        ; 00:2CEA
    ldh  [<SVBK],a                  ; 00:2CEB
    ld   a,e                        ; 00:2CED
    and  $F0                        ; 00:2CEE
    swap a                          ; 00:2CF0
    ld   d,a                        ; 00:2CF2
    ld   a,e                        ; 00:2CF3
    and  $0F                        ; 00:2CF4
    ld   e,a                        ; 00:2CF6
    ld   hl,W_SubLvSprTilemap       ; 00:2CF7
    add  hl,de                      ; 00:2CFA
    ld   c,$10                      ; 00:2CFB
@Loop002CFD:
    ld   a,[hl]                     ; 00:2CFD  sprite ID
    and  a                          ; 00:2CFE
    jr   z,@Code002D3C              ; 00:2CFF
    push hl                         ; 00:2D01
    push bc                         ; 00:2D02
    ld   e,[hl]                     ; 00:2D03  sprite ID
    ld   a,$00                      ; 00:2D04
    ldh  [<SVBK],a                  ; 00:2D06
    ld   a,[W_HardFlag]             ; 00:2D08
    and  a                          ; 00:2D0B
    jr   z,@Code002D15              ; 00:2D0C
    ld   a,e                        ; 00:2D0E \ in hard mode...
    cp   $04                        ; 00:2D0F | if sprite to load would be Goomba
    jr   nz,@Code002D15             ; 00:2D11 |
    ld   e,$31                      ; 00:2D13 | replace it by Buzzy Beetle
@Code002D15:
    ld   a,e                        ; 00:2D15 /
    call LoadSpriteAnySlot          ; 00:2D16
    jr   c,@Code002D37              ; 00:2D19
    ld   a,$01                      ; 00:2D1B
    ld   hl,W_SpriteStatus          ; 00:2D1D
    add  hl,de                      ; 00:2D20
    ld   [hl],a                     ; 00:2D21
    ldh  a,[<$FFA5]                 ; 00:2D22
    ld   hl,W_SpriteXLow            ; 00:2D24
    add  hl,de                      ; 00:2D27
    ld   [hl],a                     ; 00:2D28
    ldh  a,[<$FFA4]                 ; 00:2D29
    ld   hl,W_SpriteXHigh           ; 00:2D2B
    add  hl,de                      ; 00:2D2E
    ld   [hl],a                     ; 00:2D2F
    ldh  a,[<$FFA6]                 ; 00:2D30
    ld   hl,W_SpriteYLow            ; 00:2D32
    add  hl,de                      ; 00:2D35
    ld   [hl],a                     ; 00:2D36
@Code002D37:
    pop  bc                         ; 00:2D37
    pop  hl                         ; 00:2D38
    ld   a,b                        ; 00:2D39
    ldh  [<SVBK],a                  ; 00:2D3A
@Code002D3C:
    ldh  a,[<$FFA6]                 ; 00:2D3C
    add  $10                        ; 00:2D3E
    ldh  [<$FFA6],a                 ; 00:2D40
    ld   de,$0010                   ; 00:2D42
    add  hl,de                      ; 00:2D45
    dec  c                          ; 00:2D46
    jr   nz,@Loop002CFD             ; 00:2D47
    ld   a,$00                      ; 00:2D49
    ldh  [<SVBK],a                  ; 00:2D4B
    ret                             ; 00:2D4D

Give1up:
    ld   a,[W_ChallengeFlag]        ; 00:2D4E
    and  a                          ; 00:2D51
    jr   nz,@Code002D61             ; 00:2D52  don't give 1up in challenge mode
    ld   a,[W_PlayerLives]          ; 00:2D54
    inc  a                          ; 00:2D57
    cp   $80                        ; 00:2D58
    jr   nz,@Code002D5E             ; 00:2D5A
    ld   a,$7F                      ; 00:2D5C  if lives would be 128, cap to 127
@Code002D5E:
    ld   [W_PlayerLives],a          ; 00:2D5E
@Code002D61:
    ld   a,$29                      ; 00:2D61
    ldh  [<$FFF3],a                 ; 00:2D63
    ret                             ; 00:2D65

GiveCoin:
    ld   a,$24                      ; 00:2D66
    ldh  [<$FFF3],a                 ; 00:2D68
    ld   a,[W_GameMode]             ; 00:2D6A
    cp   $02                        ; 00:2D6D
    jr   z,@Race                    ; 00:2D6F
    cp   $07                        ; 00:2D71
    jr   z,@Race                    ; 00:2D73
    ld   a,[W_PlayerCoins]          ; 00:2D75
    inc  a                          ; 00:2D78
    cp   $64                        ; 00:2D79
    jr   nz,@Code002D82             ; 00:2D7B
    call Give1up                    ; 00:2D7D
    ld   a,$00                      ; 00:2D80
@Code002D82:
    ld   [W_PlayerCoins],a          ; 00:2D82
    ret                             ; 00:2D85
@Race:
    ld   hl,W_PlayerCoins           ; 00:2D86
    inc  [hl]                       ; 00:2D89
    ld   a,[hl]                     ; 00:2D8A
    cp   $63                        ; 00:2D8B
    jr   c,@Return                  ; 00:2D8D
    ld   [hl],$63                   ; 00:2D8F  if race, cap coins to 99
@Return:
    ret                             ; 00:2D91

Data002D92:                         ; 00:2D92
.db $38,$39,$3A,$3B,$3C
Data002D97:                         ; 00:2D97
.db $03,$03,$03,$03,$01

Sub002D9C:
    call Sub002DDC                  ; 00:2D9C
    jr   Code002DA4                 ; 00:2D9F

Sub002DA1:
    call Sub002DE0                  ; 00:2DA1
Code002DA4:
    push bc                         ; 00:2DA4
    ld   a,[$D30A]                  ; 00:2DA5
    and  $1F                        ; 00:2DA8
    ld   c,a                        ; 00:2DAA
    ld   de,$0000                   ; 00:2DAB
Code002DAE:
    srl  c                          ; 00:2DAE
    jr   nc,Code002DB3              ; 00:2DB0
    inc  e                          ; 00:2DB2
Code002DB3:
    dec  d                          ; 00:2DB3
    ld   a,d                        ; 00:2DB4
    cp   $05                        ; 00:2DB5
    jr   nz,Code002DAE              ; 00:2DB7
    ld   d,$00                      ; 00:2DB9
    dec  e                          ; 00:2DBB
    ld   hl,Data002D92              ; 00:2DBC
    add  hl,de                      ; 00:2DBF
    ld   a,[hl]                     ; 00:2DC0
    ldh  [<$FFF3],a                 ; 00:2DC1
    ld   hl,Data002D97              ; 00:2DC3
    add  hl,de                      ; 00:2DC6
    ld   a,[hl]                     ; 00:2DC7
    ld   de,$0008                   ; 00:2DC8
    call Return0010B2               ; 00:2DCB
    ld   hl,W_RedCoinsCurrent       ; 00:2DCE
    inc  [hl]                       ; 00:2DD1
    pop  bc                         ; 00:2DD2
    ret                             ; 00:2DD3

BitTable8Asc_002DD4:                ; 00:2DD4
.db $01,$02,$04,$08,$10,$20,$40,$80

Sub002DDC:
    push bc                         ; 00:2DDC
    push de                         ; 00:2DDD
    jr   Code002DE5                 ; 00:2DDE

Sub002DE0:
    push bc                         ; 00:2DE0
    push de                         ; 00:2DE1
    ld   de,$0004                   ; 00:2DE2
Code002DE5:
; DE has Mario's collision point that touched the red coin
    ld   a,[$D30A]                  ; 00:2DE5 \ copy old red coin flags
    ld   [$D30B],a                  ; 00:2DE8 /  into $D30B for status bar flashing
    ld   hl,$C221                   ; 00:2DEB \
    add  hl,de                      ; 00:2DEE |
    ld   a,[hl]                     ; 00:2DEF | $FF97=Mario X collision point, low byte high digit
    and  $F0                        ; 00:2DF0 |  current block's position within screen
    swap a                          ; 00:2DF2 |
    ldh  [<$FF97],a                 ; 00:2DF4 /
    ld   hl,$C229                   ; 00:2DF6 \
    add  hl,de                      ; 00:2DF9 | $FF98=Mario X collision point, high byte
    ld   a,[hl]                     ; 00:2DFA |  current block's screen number
    ldh  [<$FF98],a                 ; 00:2DFB /
    ld   e,$00                      ; 00:2DFD  E is loop index
@Loop:
    ld   hl,$D30C                   ; 00:2DFF  red coin screen numbers
    add  hl,de                      ; 00:2E02
    ldh  a,[<$FF98]                 ; 00:2E03
    cp   [hl]                       ; 00:2E05
    jr   nz,@Continue               ; 00:2E06
    ld   hl,$D31C                   ; 00:2E08  red coin X
    add  hl,de                      ; 00:2E0B \
    ld   a,[hl]                     ; 00:2E0C |
    and  $0F                        ; 00:2E0D | compare only red coin X to Mario position
    ld   hl,$FF97                   ; 00:2E0F |
    cp   [hl]                       ; 00:2E12 |
    jr   nz,@Continue               ; 00:2E13 /
    ld   hl,BitTable8Asc_002DD4     ; 00:2E15
    add  hl,de                      ; 00:2E18
    ld   a,[$D30A]                  ; 00:2E19 \
    or   [hl]                       ; 00:2E1C | set red coin flag
    ld   [$D30A],a                  ; 00:2E1D /
    ld   a,$70                      ; 00:2E20 \ set timer to flash status bar red coins
    ld   [$D32C],a                  ; 00:2E22 /
    jr   @EndLoop                   ; 00:2E25
@Continue:
    inc  e                          ; 00:2E27
    ld   a,e                        ; 00:2E28
    cp   $05                        ; 00:2E29  loop 5 times
    jr   nz,@Loop                   ; 00:2E2B
@EndLoop:
    pop  de                         ; 00:2E2D
    pop  bc                         ; 00:2E2E
    ret                             ; 00:2E2F

GivePointsFF97:
; subroutine: Add 16-bit value at $FF97 to current score. Cap to 0F423F (9,999,990 displayed) if applicable
    ld   hl,W_PlayerScoreLow        ; 00:2E30
    ldh  a,[<$FF97]                 ; 00:2E33 \
    add  [hl]                       ; 00:2E35 | add byte at $FF97 to low byte
    ldi  [hl],a                     ; 00:2E36 /
    ldh  a,[<$FF98]                 ; 00:2E37 \
    adc  [hl]                       ; 00:2E39 | add byte at $FF98 to mid byte, with carry
    ldi  [hl],a                     ; 00:2E3A /
    ld   a,$00                      ; 00:2E3B \
    adc  [hl]                       ; 00:2E3D | update high byte, with carry
    ld   [hl],a                     ; 00:2E3E /
    cp   $0F                        ; 00:2E3F
    jr   z,@CheckMidByte            ; 00:2E41
    jr   nc,@CapScore               ; 00:2E43  if high byte > 0F, cap score
    jr   @Return                    ; 00:2E45  if high byte < 0F, return
@CheckMidByte:
    dec  hl                         ; 00:2E47
    ldd  a,[hl]                     ; 00:2E48
    cp   $42                        ; 00:2E49
    jr   z,@CheckLowByte            ; 00:2E4B
    jr   nc,@CapScore               ; 00:2E4D
    jp   @Return                    ; 00:2E4F
@CheckLowByte:
    ld   a,[hl]                     ; 00:2E52
    cp   $3F                        ; 00:2E53
    jr   c,@Return                  ; 00:2E55
@CapScore:
    ld   hl,W_PlayerScoreLow        ; 00:2E57 \
    ld   a,$3F                      ; 00:2E5A |
    ldi  [hl],a                     ; 00:2E5C |
    ld   a,$42                      ; 00:2E5D | set score to 0F423F (9,999,990 displayed)
    ldi  [hl],a                     ; 00:2E5F |
    ld   a,$0F                      ; 00:2E60 |
    ld   [hl],a                     ; 00:2E62 /
@Return:
    ret                             ; 00:2E63

Sub002E64:
    ld   a,[$D2F4]                  ; 00:2E64
    cp   $02                        ; 00:2E67
    jr   nz,Code002E6E              ; 00:2E69
    call Sub002EC0                  ; 00:2E6B
Code002E6E:
    call Sub002EC0                  ; 00:2E6E
    jr   nc,Sub002E90               ; 00:2E71

Sub002E73:
    ld   hl,$D2B2                   ; 00:2E73
    add  hl,bc                      ; 00:2E76
    ld   a,[hl]                     ; 00:2E77
    and  $0F                        ; 00:2E78
    ret  z                          ; 00:2E7A
    dec  a                          ; 00:2E7B
    sla  a                          ; 00:2E7C
    sla  a                          ; 00:2E7E
    ld   e,a                        ; 00:2E80
    ld   d,$00                      ; 00:2E81
    ld   hl,Data002F1E              ; 00:2E83
    add  hl,de                      ; 00:2E86
    ld   de,$0000                   ; 00:2E87
    add  hl,de                      ; 00:2E8A
    ld   a,[hl]                     ; 00:2E8B
    cp   $00                        ; 00:2E8C
    ret  z                          ; 00:2E8E
    dec  a                          ; 00:2E8F

Sub002E90:
    ldh  [<$FF9B],a                 ; 00:2E90
    cp   $0A                        ; 00:2E92  0A: 1up
    jr   z,@1up                     ; 00:2E94
    sla  a                          ; 00:2E96
    ld   e,a                        ; 00:2E98
    ld   d,$00                      ; 00:2E99
    ld   hl,ScoreSpriteValues       ; 00:2E9B
    add  hl,de                      ; 00:2E9E
    ldi  a,[hl]                     ; 00:2E9F
    ldh  [<$FF97],a                 ; 00:2EA0
    ld   a,[hl]                     ; 00:2EA2
    ldh  [<$FF98],a                 ; 00:2EA3
    call GivePointsFF97             ; 00:2EA5
    call SpawnScoreSprite           ; 00:2EA8
    ld   a,[$D2F4]                  ; 00:2EAB
    cp   $02                        ; 00:2EAE
    ret  nz                         ; 00:2EB0
    ld   hl,$C1DE                   ; 00:2EB1
    ld   a,[hl]                     ; 00:2EB4
    and  a                          ; 00:2EB5
    ret  z                          ; 00:2EB6
    dec  [hl]                       ; 00:2EB7
    ret                             ; 00:2EB8
@1up:
    call SpawnScoreSprite           ; 00:2EB9
    call Give1up                    ; 00:2EBC
    ret                             ; 00:2EBF

Sub002EC0:
    ld   a,[$C1DE]                  ; 00:2EC0
    inc  a                          ; 00:2EC3
    cp   $0A                        ; 00:2EC4
    jr   c,Code002ECA               ; 00:2EC6
    ld   a,$0A                      ; 00:2EC8
Code002ECA:
    ld   [$C1DE],a                  ; 00:2ECA
    cp   $01                        ; 00:2ECD
    jr   z,Code002ED5               ; 00:2ECF
    dec  a                          ; 00:2ED1
    scf                             ; 00:2ED2
    ccf                             ; 00:2ED3
    ret                             ; 00:2ED4

Code002ED5:
    scf                             ; 00:2ED5
    ret                             ; 00:2ED6

SpawnScoreSprite:
; subroutine: Spawn score sprite at existing sprite's position
; BC: sprite slot with position to use
    ld   hl,W_SpriteXLow            ; 00:2ED7 \ $FF97 = sprite X position, 16-bit
    add  hl,bc                      ; 00:2EDA
    ld   a,[hl]                     ; 00:2EDB
    ldh  [<$FF97],a                 ; 00:2EDC
    ld   hl,W_SpriteXHigh           ; 00:2EDE
    add  hl,bc                      ; 00:2EE1
    ld   a,[hl]                     ; 00:2EE2
    ldh  [<$FF98],a                 ; 00:2EE3 /
    ld   hl,W_SpriteYLow            ; 00:2EE5
    add  hl,bc                      ; 00:2EE8
    ld   a,[hl]                     ; 00:2EE9
    ldh  [<$FF99],a                 ; 00:2EEA  $FF99 = sprite Y position, 8-bit
    ldh  a,[<$FFBE]                 ; 00:2EEC
    push af                         ; 00:2EEE
    ld   a,:Sub0276B3               ; 00:2EEF
    call SetROMBank                 ; 00:2EF1
    call Sub0276B3                  ; 00:2EF4
    pop  af                         ; 00:2EF7
    call SetROMBank                 ; 00:2EF8
    ret                             ; 00:2EFB

Data002EFC:                         ; 00:2EFC
.db $64,$0A

Sub002EFE:
    ld   bc,$0000                   ; 00:2EFE
Code002F01:
    ld   hl,Data002EFC              ; 00:2F01
    add  hl,bc                      ; 00:2F04
Code002F05:
    ld   a,e                        ; 00:2F05
    sub  [hl]                       ; 00:2F06
    ld   a,d                        ; 00:2F07
    sbc  $00                        ; 00:2F08
    bit  7,a                        ; 00:2F0A
    jr   nz,Code002F17              ; 00:2F0C
    ld   a,e                        ; 00:2F0E
    sub  [hl]                       ; 00:2F0F
    ld   e,a                        ; 00:2F10
    ld   a,d                        ; 00:2F11
    sbc  $00                        ; 00:2F12
    ld   d,a                        ; 00:2F14
    jr   Code002F05                 ; 00:2F15
Code002F17:
    inc  bc                         ; 00:2F17
    ld   a,c                        ; 00:2F18
    cp   $02                        ; 00:2F19
    jr   nz,Code002F01              ; 00:2F1B
    ret                             ; 00:2F1D

Data002F1E:                         ; 00:2F1E
.db $01,$03,$02,$02,$03,$00,$02,$02,\
    $01,$00,$01,$01,$06,$00,$06,$06,\
    $05,$00,$00,$02,$01,$00,$00,$02,\
    $06,$00,$00,$02,$01,$03,$02,$00,\
    $00,$00,$00,$02
Data002F42:                         ; 00:2F42
.db $02,$02,$01,$06,$02,$02,$02,$02,\
    $02
ScoreSpriteValues:                  ; 00:2F4B  fixed-point (*10 for displayed value)
.dw 10, 20, 40, 50, 80, 100, 200, 400,\
    500, 800, 0, 1000
Data002F63:                         ; 00:2F63
.db $00,$00,$00,$00,$08,$07,$FE,$02,\
    $08,$06,$07,$06,$08,$05,$09,$03,\
    $08,$05,$08,$05,$04,$04,$04,$04,\
    $04,$01,$05,$01,$08,$04,$10,$0C,\
    $08,$05,$08,$06,$08,$05,$10,$06,\
    $08,$08,$0A,$08,$0C,$06,$06,$02,\
    $18,$18,$0E,$04,$08,$05,$08,$05,\
    $08,$05,$08,$05,$08,$05,$08,$05,\
    $08,$06,$07,$06,$08,$06,$08,$08,\
    $08,$07,$0C,$0C,$08,$07,$10,$08,\
    $08,$07,$14,$04,$08,$04,$0A,$04,\
    $08,$05,$09,$03,$0C,$0C,$0E,$04,\
    $10,$10,$0E,$04,$18,$0F,$00,$20,\
    $08,$05,$09,$03,$10,$10,$10,$10,\
    $08,$07,$08,$08,$08,$05,$10,$0C,\
    $10,$08,$12,$08,$18,$08,$0A,$08,\
    $10,$08,$12,$08,$08,$04,$0C,$02,\
    $10,$08,$12,$08

Sub002FEF:
    ld   hl,W_SpriteXHigh           ; 00:2FEF
    add  hl,bc                      ; 00:2FF2
    push hl                         ; 00:2FF3
    ld   hl,W_SpriteXLow            ; 00:2FF4
    add  hl,bc                      ; 00:2FF7
    ldh  a,[<H_PlayerXLow]          ; 00:2FF8
    sub  [hl]                       ; 00:2FFA
    pop  hl                         ; 00:2FFB
    ldh  a,[<H_PlayerXHigh]         ; 00:2FFC
    sbc  [hl]                       ; 00:2FFE
    ret                             ; 00:2FFF

Sub003000:
    ld   a,[W_PlayerSize]           ; 00:3000
    and  a                          ; 00:3003
    jr   nz,Code00300B              ; 00:3004
    ld   a,[$C1D5]                  ; 00:3006
    and  a                          ; 00:3009
    ret  nz                         ; 00:300A
Code00300B:
    call Sub002FEF                  ; 00:300B
    jr   c,Code003020               ; 00:300E
    ld   hl,$D195                   ; 00:3010
    add  hl,bc                      ; 00:3013
    ld   [hl],$01                   ; 00:3014
    ld   hl,W_SpriteXSpeed          ; 00:3016
    add  hl,bc                      ; 00:3019
    ld   a,[hl]                     ; 00:301A
    bit  7,a                        ; 00:301B
    ret  z                          ; 00:301D
    jr   Code00302E                 ; 00:301E
Code003020:
    xor  a                          ; 00:3020
    ld   hl,$D195                   ; 00:3021
    add  hl,bc                      ; 00:3024
    ld   [hl],a                     ; 00:3025
    ld   hl,W_SpriteXSpeed          ; 00:3026
    add  hl,bc                      ; 00:3029
    ld   a,[hl]                     ; 00:302A
    bit  7,a                        ; 00:302B
    ret  nz                         ; 00:302D
Code00302E:
    cpl                             ; 00:302E
    inc  a                          ; 00:302F
    ld   [hl],a                     ; 00:3030
    ret                             ; 00:3031

TimerInterrupt:
    push af                         ; 00:3032
    ld   a,$02                      ; 00:3033
    ldh  [<TAC],a                   ; 00:3035
    ld   a,$60                      ; 00:3037
    ldh  [<TIMA],a                  ; 00:3039
    ld   a,$83                      ; 00:303B
    ldh  [<SC],a                    ; 00:303D
    pop  af                         ; 00:303F
    reti                            ; 00:3040

SerialInterrupt:
    push af                         ; 00:3041
    push bc                         ; 00:3042
    push de                         ; 00:3043
    push hl                         ; 00:3044
    ldh  a,[<SVBK]                  ; 00:3045
    push af                         ; 00:3047
    ld   a,$00                      ; 00:3048
    ldh  [<SVBK],a                  ; 00:304A
    ld   a,[$C0C1]                  ; 00:304C
    cp   $02                        ; 00:304F
    jr   nz,Code003068              ; 00:3051
    ld   a,:Sub156165               ; 00:3053
    ld   [ROMBANK],a                ; 00:3055
    call Sub156165                  ; 00:3058
    ldh  a,[<$FFBE]                 ; 00:305B
    ld   [ROMBANK],a                ; 00:305D
    pop  af                         ; 00:3060
    ldh  [<SVBK],a                  ; 00:3061
    pop  hl                         ; 00:3063
    pop  de                         ; 00:3064
    pop  bc                         ; 00:3065
    pop  af                         ; 00:3066
    reti                            ; 00:3067

Code003068:
    ld   a,[$DA69]                  ; 00:3068
    and  a                          ; 00:306B
    jr   nz,Code0030BA              ; 00:306C
    ldh  a,[<SB]                    ; 00:306E
    ld   [$D9A7],a                  ; 00:3070
    cp   $FE                        ; 00:3073
    jp   z,Code0030B3               ; 00:3075
    cp   $DD                        ; 00:3078
    jp   z,Code0030B3               ; 00:307A
    cp   $FC                        ; 00:307D
    jp   z,Code0030B3               ; 00:307F
    cp   $DC                        ; 00:3082
    jp   z,Code0030B3               ; 00:3084
    cp   $FB                        ; 00:3087
    jp   z,Code0030B3               ; 00:3089
    cp   $DB                        ; 00:308C
    jp   z,Code0030B3               ; 00:308E
    cp   $FA                        ; 00:3091
    jp   z,Code0030B3               ; 00:3093
    cp   $DA                        ; 00:3096
    jp   z,Code0030B3               ; 00:3098
    cp   $01                        ; 00:309B
    jp   z,Code0030B3               ; 00:309D
    ld   a,$DD                      ; 00:30A0
    ldh  [<SB],a                    ; 00:30A2
    ld   a,$00                      ; 00:30A4
    ld   [$D9A7],a                  ; 00:30A6
    ld   bc,$00FF                   ; 00:30A9
    ld   a,$82                      ; 00:30AC
    ldh  [<SC],a                    ; 00:30AE
    jp   Code003163                 ; 00:30B0
Code0030B3:
    ld   a,$82                      ; 00:30B3
    ldh  [<SC],a                    ; 00:30B5
    jp   Code003163                 ; 00:30B7
Code0030BA:
    ld   a,[$DA6D]                  ; 00:30BA
    and  a                          ; 00:30BD
    jp   z,Code00313A               ; 00:30BE
    ld   a,[$DA68]                  ; 00:30C1
    ld   c,a                        ; 00:30C4
    ld   b,$00                      ; 00:30C5
    ld   hl,$D9A7                   ; 00:30C7
    add  hl,bc                      ; 00:30CA
    dec  hl                         ; 00:30CB
    ldh  a,[<SB]                    ; 00:30CC
    ld   [hl],a                     ; 00:30CE
    ld   hl,$D977                   ; 00:30CF
    add  hl,bc                      ; 00:30D2
    ld   a,[hl]                     ; 00:30D3
    ldh  [<SB],a                    ; 00:30D4
    ld   a,[$DA67]                  ; 00:30D6
    ld   b,a                        ; 00:30D9
    dec  b                          ; 00:30DA
    ld   a,[$DA68]                  ; 00:30DB
    cp   b                          ; 00:30DE
    jp   z,Code00311D               ; 00:30DF
    ld   a,[$DA68]                  ; 00:30E2
    and  $01                        ; 00:30E5
    jp   z,Code003103               ; 00:30E7
    ld   a,[$DA6A]                  ; 00:30EA
    and  a                          ; 00:30ED
    jp   z,Code0030FC               ; 00:30EE
    ld   a,$60                      ; 00:30F1
    ldh  [<TIMA],a                  ; 00:30F3
    ld   a,$06                      ; 00:30F5
    ldh  [<TAC],a                   ; 00:30F7
    jp   Code00315C                 ; 00:30F9
Code0030FC:
    ld   a,$82                      ; 00:30FC
    ldh  [<SC],a                    ; 00:30FE
    jp   Code00315C                 ; 00:3100
Code003103:
    ld   a,[$DA6A]                  ; 00:3103
    cp   $01                        ; 00:3106
    jp   z,Code003116               ; 00:3108
    ld   a,$60                      ; 00:310B
    ldh  [<TIMA],a                  ; 00:310D
    ld   a,$06                      ; 00:310F
    ldh  [<TAC],a                   ; 00:3111
    jp   Code00315C                 ; 00:3113
Code003116:
    ld   a,$82                      ; 00:3116
    ldh  [<SC],a                    ; 00:3118
    jp   Code00315C                 ; 00:311A
Code00311D:
    ld   a,$01                      ; 00:311D
    ld   [$DA6B],a                  ; 00:311F
    xor  a                          ; 00:3122
    ld   [$DA68],a                  ; 00:3123
    ld   a,[$DA6A]                  ; 00:3126
    and  a                          ; 00:3129
    jp   nz,Code003163              ; 00:312A
    ldh  a,[<IE]                    ; 00:312D
    and  $13                        ; 00:312F
    ldh  [<IE],a                    ; 00:3131
    ld   a,$82                      ; 00:3133
    ldh  [<SC],a                    ; 00:3135
    jp   Code003163                 ; 00:3137
Code00313A:
    ldh  a,[<SB]                    ; 00:313A
    ld   [$D9A7],a                  ; 00:313C
    ld   a,[$D977]                  ; 00:313F
    ldh  [<SB],a                    ; 00:3142
    ld   a,$01                      ; 00:3144
    ld   [$DA6B],a                  ; 00:3146
    ld   a,[$DA6A]                  ; 00:3149
    and  a                          ; 00:314C
    jp   nz,Code003163              ; 00:314D
    ld   a,$82                      ; 00:3150
    ldh  [<SC],a                    ; 00:3152
    ld   a,$01                      ; 00:3154
    ld   [$DA6B],a                  ; 00:3156
    jp   Code003163                 ; 00:3159
Code00315C:
    ld   a,[$DA68]                  ; 00:315C
    inc  a                          ; 00:315F
    ld   [$DA68],a                  ; 00:3160
Code003163:
    pop  af                         ; 00:3163
    ldh  [<SVBK],a                  ; 00:3164
    pop  hl                         ; 00:3166
    pop  de                         ; 00:3167
    pop  bc                         ; 00:3168
    pop  af                         ; 00:3169
    reti                            ; 00:316A

InitSubLv16x16Tilemap:
; Fill WRAM banks 6-7 with 03 (empty tile), and init screen exit table
    ld   a,$06                      ; 00:316B
    ldh  [<SVBK],a                  ; 00:316D
    ld   b,$02                      ; 00:316F  loop 2 times
@BankLoop:
    push bc                         ; 00:3171
    ld   hl,W_SubLv16x16Tilemap     ; 00:3172
    ld   bc,$1000                   ; 00:3175  loop 1000 times ($D000-E000)
@TileLoop:
    ld   a,$03                      ; 00:3178
    ldi  [hl],a                     ; 00:317A  overwrite byte with 03 (empty tile)
    dec  bc                         ; 00:317B
    ld   a,b                        ; 00:317C \
    or   c                          ; 00:317D | loop if BC is not 0
    jr   nz,@TileLoop               ; 00:317E /
    ld   hl,SVBK                    ; 00:3180
    inc  [hl]                       ; 00:3183
    pop  bc                         ; 00:3184
    dec  b                          ; 00:3185
    jr   nz,@BankLoop               ; 00:3186
    ld   a,$00                      ; 00:3188
    ldh  [<SVBK],a                  ; 00:318A
    ld   de,$000C                   ; 00:318C
@ScreenExitFFLoop:
    ld   hl,$D2FA                   ; 00:318F \ add FF-termination markers every 4 bytes in screen exit table
    add  hl,de                      ; 00:3192
    ld   [hl],$FF                   ; 00:3193
    dec  e                          ; 00:3195
    dec  e                          ; 00:3196
    dec  e                          ; 00:3197
    dec  e                          ; 00:3198
    ld   a,e                        ; 00:3199
    and  a                          ; 00:319A
    jr   nz,@ScreenExitFFLoop       ; 00:319B /
    ret                             ; 00:319D

LoadSublevelMainData:
; DE starts with pointer to start of header
; scratch RAM:
; $FFA1 = number of screens remaining to load
; $FFA2 = current screen number
; $FFA3 = current object's length (used by 00 and 40 only)
; $FFA4 = current object's YX byte
; $FFA5-6 = misc scratch RAM (used by 80+ only)

; Header byte 00: screen count
    ld   a,$00                      ; 00:319E
    ldh  [<$FFA2],a                 ; 00:31A0
    ld   a,[de]                     ; 00:31A2 \
    ld   [W_SubLvScreenCount],a     ; 00:31A3 | W_SubLvScreenCount = header byte 00 (screen count)
    ldh  [<$FFA1],a                 ; 00:31A6 / initialize remaining screen count for level load
    ld   a,$06                      ; 00:31A8
; Header byte 01: floor tile
    ldh  [<SVBK],a                  ; 00:31AA
    inc  de                         ; 00:31AC  increment byte to load from
    ld   hl,$D0F0                   ; 00:31AD
; fill Y=F with header byte 01 (floor tile) for level's entire screen count
    ld   b,$00                      ; 00:31B0  B: loop until screen number
@ScreenLoop:
    ld   c,$10                      ; 00:31B2  C: loop 10 times
@TileLoop:
    ld   a,[de]                     ; 00:31B4 \
    ldi  [hl],a                     ; 00:31B5 | fill $D_F0-D_FF with header byte 01 (floor tile)
    dec  c                          ; 00:31B6 |
    jr   nz,@TileLoop               ; 00:31B7 /
    push bc                         ; 00:31B9
    ld   bc,$00F0                   ; 00:31BA \ add another 00F0 to HL, to add 0100 total
    add  hl,bc                      ; 00:31BD /  (move to next screen's tilemap)
    pop  bc                         ; 00:31BE
    inc  b                          ; 00:31BF
    ld   a,b                        ; 00:31C0 \
    cp   $10                        ; 00:31C1 | check if B reached 10
    jr   nz,@Code0031CC             ; 00:31C3 /
    ldh  a,[<SVBK]                  ; 00:31C5 \
    inc  a                          ; 00:31C7 | if so, increment WRAM bank to 7
    ldh  [<SVBK],a                  ; 00:31C8 |
    ld   h,$D0                      ; 00:31CA / and reset HL to $D0F0
@Code0031CC:
    ld   a,[W_SubLvScreenCount]     ; 00:31CC
    cp   b                          ; 00:31CF
    jp   nc,@ScreenLoop             ; 00:31D0
; Header byte 02:
;  high digit: Mario initial Y; low digit: level type
    inc  de                         ; 00:31D3  increment byte to load from
    ld   a,[de]                     ; 00:31D4 \ $FFC2 = header byte 02
    ldh  [<H_PlInitY_SubLvType],a   ; 00:31D5 /  (Mario initial Y, level type)
    ld   a,[W_GameMode]             ; 00:31D7
    cp   $07                        ; 00:31DA
    jr   z,@RaceHeader              ; 00:31DC
    cp   $02                        ; 00:31DE
    jr   nz,@Code0031EA             ; 00:31E0
@RaceHeader:
; Header byte 03 in race levels:
; bit 0: (0)face or (1)3-2-1 blocks; bit 1: (0)solid/spike or (1)red/white blocks
    xor  a                          ; 00:31E2 \ runs if game mode is You vs. Boo or VS
    ldh  [<SVBK],a                  ; 00:31E3
    inc  de                         ; 00:31E5  increment byte to load from
    ld   a,[de]                     ; 00:31E6
    ld   [W_RaceHeaderFlags],a      ; 00:31E7 / $C3A2 = header byte 03 (animated tiles to load)
@Code0031EA:
    ld   a,$00                      ; 00:31EA
    ldh  [<SVBK],a                  ; 00:31EC
    ld   hl,$D2FA                   ; 00:31EE
    inc  de                         ; 00:31F1  increment byte to load from
@ScreenExitLoop:
    ld   a,[de]                     ; 00:31F2 \
    cp   $FF                        ; 00:31F3 | end loop if next byte is FF
    jr   z,@ScreenExitLoop_End      ; 00:31F5 /
    ld   b,$04                      ; 00:31F7  loop 4 times
@LoadScreenExit:
    ld   a,[de]                     ; 00:31F9 \
    ldi  [hl],a                     ; 00:31FA |
    inc  de                         ; 00:31FB | loop: load 4 header bytes into $1:D2FA
    dec  b                          ; 00:31FC |
    jr   nz,@LoadScreenExit         ; 00:31FD /
    jr   @ScreenExitLoop            ; 00:31FF
@ScreenExitLoop_End:
    ld   a,$06                      ; 00:3201
    ldh  [<SVBK],a                  ; 00:3203

; Object loading
; DE starts with location of FF byte that marks end of header
MainDataObjectLoop:
    inc  de                         ; 00:3205  increment byte to load from
    ld   a,[de]                     ; 00:3206
    cp   $FF                        ; 00:3207
    jr   nz,@Code00326D             ; 00:3209
; runs if object byte is FF
    ldh  a,[<$FFA1]                 ; 00:320B \
    dec  a                          ; 00:320D | decrement screens remaining to load
    ldh  [<$FFA1],a                 ; 00:320E /
    jr   nz,@Code00325B             ; 00:3210
    ld   a,$06                      ; 00:3212
    ldh  [<SVBK],a                  ; 00:3214
    ld   b,$00                      ; 00:3216
    ld   hl,$D004                   ; 00:3218  HL = $D004 by deafult
    ld   a,[W_GameMode]             ; 00:321B
    cp   $02                        ; 00:321E
    jr   z,@Code003229              ; 00:3220
    ld   a,[W_GameMode]             ; 00:3222
    cp   $07                        ; 00:3225
    jr   nz,@Code00322B             ; 00:3227
@Code003229:
    dec  hl                         ; 00:3229 \ if race level, HL = $D002
    dec  hl                         ; 00:322A /
@Code00322B:
    ld   a,[W_ChallengeFlag]        ; 00:322B
    cp   $01                        ; 00:322E
    jr   z,@Code003237              ; 00:3230
    ld   a,$70                      ; 00:3232 \ if not challenge mode, store 70
    ld   [hl],a                     ; 00:3234 |
    jr   @Code003242                ; 00:3235 /
@Code003237:
    ld   a,$71                      ; 00:3237 \ if challenge mode, store 71 71 71 93
    ldi  [hl],a                     ; 00:3239 |
    ldi  [hl],a                     ; 00:323A |
    ldi  [hl],a                     ; 00:323B |
    ld   a,$93                      ; 00:323C |
    ld   [hl],a                     ; 00:323E |
    dec  hl                         ; 00:323F |
    dec  hl                         ; 00:3240 | then revert HL
    dec  hl                         ; 00:3241 /
@Code003242:
    inc  h                          ; 00:3242  shift 1 screen right
    inc  b                          ; 00:3243
    ld   a,b                        ; 00:3244
    cp   $10                        ; 00:3245 \ check if screen reached 10
    jr   nz,@Code003250             ; 00:3247 /
    ldh  a,[<SVBK]                  ; 00:3249 \
    inc  a                          ; 00:324B | if so, increment bank byte
    ldh  [<SVBK],a                  ; 00:324C /
    ld   h,$D0                      ; 00:324E
@Code003250:
    ld   a,[W_SubLvScreenCount]     ; 00:3250
    cp   b                          ; 00:3253
    jr   nc,@Code00322B             ; 00:3254
    ld   a,$00                      ; 00:3256
    ldh  [<SVBK],a                  ; 00:3258
    ret                             ; 00:325A

@Code00325B:
    ldh  a,[<$FFA2]                 ; 00:325B
    inc  a                          ; 00:325D
    ldh  [<$FFA2],a                 ; 00:325E
    cp   $10                        ; 00:3260
    jr   nz,MainDataObjectLoop      ; 00:3262
    ldh  a,[<SVBK]                  ; 00:3264
    inc  a                          ; 00:3266
    ldh  [<SVBK],a                  ; 00:3267
    ld   h,$D0                      ; 00:3269
    jr   MainDataObjectLoop         ; 00:326B

@Code00326D:
; still level data loading, process object bytes that are not FF
; starts with A as an object byte already loaded, DE as address it was loaded from
    ldh  [<$FFA3],a                 ; 00:326D  $FFA3 = object byte 0
    push de                         ; 00:326F
    bit  7,a                        ; 00:3270
    jr   nz,Obj2_Extended_Main      ; 00:3272
    bit  6,a                        ; 00:3274
    jr   nz,Obj1_TileColumn_Main    ; 00:3276
    jr   Obj0_TileRow_Main          ; 00:3278

Obj2_Extended_Main:
    ldh  a,[<$FFA3]                 ; 00:327A
    and  $7F                        ; 00:327C
    rst  $00                        ; 00:327E  Execute from 16-bit pointer table
.dw Obj200_SubLvMainWrapper         ; 00:327F
.dw Obj201_SubLvMainWrapper         ; 00:3281
.dw Obj202_SubLvMainWrapper         ; 00:3283
.dw Obj203_SubLvMainWrapper         ; 00:3285
.dw Obj204_SubLvMainWrapper         ; 00:3287
.dw Obj205_SubLvMainWrapper         ; 00:3289
.dw Obj206_SubLvMainWrapper         ; 00:328B
.dw Obj207_SubLvMainWrapper         ; 00:328D
.dw Obj208_SubLvMainWrapper         ; 00:328F
.dw Obj209_SubLvMainWrapper         ; 00:3291
.dw Obj20A_SubLvMainWrapper         ; 00:3293
.dw Obj20B_SubLvMainWrapper         ; 00:3295
.dw Obj20C_SubLvMainWrapper         ; 00:3297
.dw Obj20D_SubLvMainWrapper         ; 00:3299
; objects 2.0E-0F are only usable in challenge mode object data

Obj0_TileRow_Main:
; object 0: horizontal line of tiles (runs if bits 6-7 are both clear)
    pop  de                         ; 00:329B
    call ObjShared_GetTilemapAddr   ; 00:329C  HL = tilemap address from level data
    inc  de                         ; 00:329F
    ldh  a,[<$FFA3]                 ; 00:32A0  object byte 0
    and  $3F                        ; 00:32A2  bits 0-5: length (width)
    ld   b,a                        ; 00:32A4  B = remaining tiles to process
@Loop:
    ld   a,b                        ; 00:32A5 \
    and  a                          ; 00:32A6
    jp   z,MainDataObjectLoop       ; 00:32A7
    ld   a,[de]                     ; 00:32AA
    ldi  [hl],a                     ; 00:32AB  write tile to tilemap, then x += 1
    call ObjShared_TilemapXCarry    ; 00:32AC
    dec  b                          ; 00:32AF
    jr   @Loop                      ; 00:32B0 /

Obj1_TileColumn_Main:
; object 1: vertical line of tiles (runs if bit 6 set, bit 7 clear)
    pop  de                         ; 00:32B2
    call ObjShared_GetTilemapAddr   ; 00:32B3
    inc  de                         ; 00:32B6
    ldh  a,[<$FFA3]                 ; 00:32B7  object byte 0
    and  $3F                        ; 00:32B9  bits 0-5: length (height)
    ld   b,a                        ; 00:32BB  B = remaining tiles to process
@Loop:
    ld   a,b                        ; 00:32BC \
    and  a                          ; 00:32BD
    jp   z,MainDataObjectLoop       ; 00:32BE
    call ObjShared_SetTileShiftDown ; 00:32C1
    dec  b                          ; 00:32C4
    jp   @Loop                      ; 00:32C5 /

Obj200_SubLvMainWrapper:
    pop  de                         ; 00:32C8
    call Obj200_Main                ; 00:32C9
    jp   MainDataObjectLoop         ; 00:32CC

Obj200_Main:
; object 2.00: vertical pipe (not enterable)
    call ObjShared_GetTilemapAddr   ; 00:32CF
    inc  de                         ; 00:32D2
    ld   a,[de]                     ; 00:32D3
    ldh  [<$FFA6],a                 ; 00:32D4  $FFA6 = length
    push de                         ; 00:32D6
    ld   de,Obj200_Tilemap          ; 00:32D7  05 07 06 08
ObjPipeShared:
; 2.00/2.07 shared code
    ld   b,$02                      ; 00:32DA  loop 2 times
@Loop0032DC:
    call ObjShared_SetTileShiftDown ; 00:32DC \
    inc  de                         ; 00:32DF
    ldh  a,[<$FFA6]                 ; 00:32E0
    ld   c,a                        ; 00:32E2
@Loop0032E3:
    ld   a,c                        ; 00:32E3  \ loop length times
    cp   $00                        ; 00:32E4
    jr   z,@Code0032EE              ; 00:32E6
    call ObjShared_SetTileShiftDown ; 00:32E8
    dec  c                          ; 00:32EB
    jr   @Loop0032E3                ; 00:32EC  /
@Code0032EE:
    dec  b                          ; 00:32EE
    jr   z,@Code003307              ; 00:32EF
    push bc                         ; 00:32F1
    inc  hl                         ; 00:32F2
    call ObjShared_TilemapXCarry    ; 00:32F3
    ldh  a,[<$FFA6]                 ; 00:32F6  \ revert y position in HL to start of object
    inc  a                          ; 00:32F8  c = length+1
    ld   c,a                        ; 00:32F9  c = 10 - (length+1)
    ld   a,$10                      ; 00:32FA  bc = -(length+1) * 10
    sub  c                          ; 00:32FC  /
    ld   c,a                        ; 00:32FD
    swap c                          ; 00:32FE
    ld   b,$FF                      ; 00:3300
    add  hl,bc                      ; 00:3302
    pop  bc                         ; 00:3303
    inc  de                         ; 00:3304
    jr   @Loop0032DC                ; 00:3305 /
@Code003307:
    pop  de                         ; 00:3307
    ret                             ; 00:3308

Obj207_SubLvMainWrapper:
    pop  de                         ; 00:3309
    call Obj207_Main                ; 00:330A
    jp   MainDataObjectLoop         ; 00:330D

Obj207_Main:
; object 2.07: vertical pipe (enterable)
    call ObjShared_GetTilemapAddr   ; 00:3310
    inc  de                         ; 00:3313
    ld   a,[de]                     ; 00:3314
    ldh  [<$FFA6],a                 ; 00:3315  $FFA6 = length
    push de                         ; 00:3317
    ld   de,Obj207_Tilemap          ; 00:3318  22 07 23 08
    jr   ObjPipeShared              ; 00:331B

Obj204_SubLvMainWrapper:
    pop  de                         ; 00:331D
    call Obj204_Main                ; 00:331E
    jp   MainDataObjectLoop         ; 00:3321

Obj204_Main:
; object 2.04: horizontal pipe
    call ObjShared_GetTilemapAddr   ; 00:3324
    inc  de                         ; 00:3327
    ld   a,[de]                     ; 00:3328
    ldh  [<$FFA5],a                 ; 00:3329  $FFA5 = length
    push de                         ; 00:332B
    ld   de,Obj204_Tilemap          ; 00:332C  28 29 2A 2B
    ld   b,$00                      ; 00:332F
@Loop:
    call ObjShared_SetTileShiftDown ; 00:3331 \ loop length+1 times
    inc  de                         ; 00:3334
    ld   a,[de]                     ; 00:3335
    ld   [hl],a                     ; 00:3336  write tile to tilemap
    inc  de                         ; 00:3337
    ldh  a,[<$FFA5]                 ; 00:3338
    cp   b                          ; 00:333A
    jr   z,@Code003351              ; 00:333B
    inc  b                          ; 00:333D  increment relative X
    ld   a,b                        ; 00:333E
    cp   $01                        ; 00:333F  if position after incrementing is not 1...
    jr   z,@Code003345              ; 00:3341
    dec  de                         ; 00:3343  \ subtract 2 from DE
    dec  de                         ; 00:3344  /  to repeat tiles 2A/2B
@Code003345:
    push bc                         ; 00:3345
    ld   bc,$FFF0                   ; 00:3346  \
    add  hl,bc                      ; 00:3349  / y -= 1
    inc  hl                         ; 00:334A  x += 1
    call ObjShared_TilemapXCarry    ; 00:334B
    pop  bc                         ; 00:334E
    jr   @Loop                      ; 00:334F /
@Code003351:
    pop  de                         ; 00:3351
    ret                             ; 00:3352

Obj205_SubLvMainWrapper:
    pop  de                         ; 00:3353
    call Obj205_Main                ; 00:3354
    jp   MainDataObjectLoop         ; 00:3357

Obj205_Main:
; object 2.05: pipe intersection (includes left column of vertical pipe)
    call ObjShared_GetTilemapAddr   ; 00:335A
    inc  de                         ; 00:335D
    ld   a,[de]                     ; 00:335E
    ld   b,a                        ; 00:335F  b = length
    push de                         ; 00:3360
    ld   de,Obj205_Tilemap          ; 00:3361  07 2C 2D
@Loop:
    call ObjShared_SetTileShiftDown ; 00:3364 \ loop length times: write tile 07
    dec  b                          ; 00:3367
    jr   nz,@Loop                   ; 00:3368 /
    inc  de                         ; 00:336A
    call ObjShared_SetTileShiftDown ; 00:336B
    inc  de                         ; 00:336E
    ld   a,[de]                     ; 00:336F
    ld   [hl],a                     ; 00:3370  set tile
    pop  de                         ; 00:3371
    ret                             ; 00:3372

Obj201_SubLvMainWrapper:
    pop  de                         ; 00:3373
    call Obj201_Main                ; 00:3374
    jp   MainDataObjectLoop         ; 00:3377

Obj201_Main:
; object 2.01: BG cloud
    call ObjShared_GetTilemapAddr   ; 00:337A
    inc  de                         ; 00:337D  increment byte to load from
    ld   a,[de]                     ; 00:337E
    ldh  [<$FFA5],a                 ; 00:337F  $FFA5 = length
    push de                         ; 00:3381
    ld   de,Obj201_Tilemap          ; 00:3382  09 0C 0A 0D 0B 0E
    call ObjShared_SetTileShiftDown ; 00:3385  write tile from [de] (09) to tilemap, then y += 1
    inc  de                         ; 00:3388
    ld   a,[de]                     ; 00:3389
    ld   [hl],a                     ; 00:338A  write tile 0C
    inc  de                         ; 00:338B
    ld   bc,$FFF0                   ; 00:338C \
    add  hl,bc                      ; 00:338F / y -= 1
    inc  hl                         ; 00:3390  x += 1
    call ObjShared_TilemapXCarry    ; 00:3391
    ldh  a,[<$FFA5]                 ; 00:3394
    ld   b,a                        ; 00:3396
@Loop003397:                        ;         \ loop length times
    ld   c,$02                      ; 00:3397  loop 2 times
@Loop003399:
    call ObjShared_SetTileShiftDown ; 00:3399  \
    inc  de                         ; 00:339C
    dec  c                          ; 00:339D
    jr   nz,@Loop003399             ; 00:339E  /
    push bc                         ; 00:33A0
    ld   bc,$FFE0                   ; 00:33A1  \
    add  hl,bc                      ; 00:33A4  / y -= 2
    inc  hl                         ; 00:33A5   x += 1
    call ObjShared_TilemapXCarry    ; 00:33A6
    pop  bc                         ; 00:33A9
    dec  b                          ; 00:33AA
    jr   z,@Code0033B1              ; 00:33AB
    dec  de                         ; 00:33AD  \ revert tile to load
    dec  de                         ; 00:33AE  /
    jr   @Loop003397                ; 00:33AF /
@Code0033B1:
    call ObjShared_SetTileShiftDown ; 00:33B1  write tile from [de] (0B) to tilemap, then y += 1
    inc  de                         ; 00:33B4
    ld   a,[de]                     ; 00:33B5
    ld   [hl],a                     ; 00:33B6  write tile 0E
    pop  de                         ; 00:33B7
    ret                             ; 00:33B8

Obj202_SubLvMainWrapper:
    pop  de                         ; 00:33B9
    call Obj202_Main                ; 00:33BA
    jp   MainDataObjectLoop         ; 00:33BD

Obj202_Main:
; object 2.02: BG bush
    call ObjShared_GetTilemapAddr   ; 00:33C0
    inc  de                         ; 00:33C3
    ld   a,[de]                     ; 00:33C4
    ldh  [<$FFA5],a                 ; 00:33C5  $FFA5 = length
    push de                         ; 00:33C7
    ld   de,Obj202_Tilemap          ; 00:33C8  0F 10 11
    ld   a,[de]                     ; 00:33CB
    ldi  [hl],a                     ; 00:33CC  write tile to tilemap, then x += 1
    call ObjShared_TilemapXCarry    ; 00:33CD
    inc  de                         ; 00:33D0
    ldh  a,[<$FFA5]                 ; 00:33D1
    ld   b,a                        ; 00:33D3
Obj202_20C_Shared:
@Loop:                              ;         \ loop length times
    ld   a,[de]                     ; 00:33D4
    ldi  [hl],a                     ; 00:33D5
    call ObjShared_TilemapXCarry    ; 00:33D6
    dec  b                          ; 00:33D9
    jr   nz,@Loop                   ; 00:33DA /
    inc  de                         ; 00:33DC
    ld   a,[de]                     ; 00:33DD
    ld   [hl],a                     ; 00:33DE
    pop  de                         ; 00:33DF
    ret                             ; 00:33E0

Obj203_SubLvMainWrapper:
    pop  de                         ; 00:33E1
    call Obj203_Main                ; 00:33E2
    jp   MainDataObjectLoop         ; 00:33E5

Obj203_Main:
; object 2.03: BG sloped hill
; length is inverted! Subtracted from 5 for the 3-high hill, or from 3 for the 2-high hill
; Obj203_Tilemap: 5 columns of 3 tiles each
; 03 03 13 / 03 13 14 / 12 14 15 / 03 17 16 / 03 03 17
    call ObjShared_GetTilemapAddr   ; 00:33E8
    inc  de                         ; 00:33EB
    ld   a,[de]                     ; 00:33EC
    ldh  [<$FFA5],a                 ; 00:33ED  $FFA5 = length
    push de                         ; 00:33EF
    ld   de,Obj203_Tilemap          ; 00:33F0
    ldh  a,[<$FFA4]                 ; 00:33F3  current object's YX byte
    and  $F0                        ; 00:33F5
    swap a                          ; 00:33F7  current object's Y
    cp   $0D                        ; 00:33F9
    jr   c,@3HighHill               ; 00:33FB
; runs if object Y >= 0D: 2 high hill
    ldh  a,[<$FFA5]                 ; 00:33FD
    inc  a                          ; 00:33FF  length + 1
    ld   c,a                        ; 00:3400  c = length + 1
    sla  a                          ; 00:3401  a = (length + 1) * 2
    add  c                          ; 00:3403  a = (length + 1) * 3
    add  e                          ; 00:3404
    ld   e,a                        ; 00:3405 \ index DE with (length + 1) * 3
    ld   a,d                        ; 00:3406 /
    adc  $00                        ; 00:3407
    ld   d,a                        ; 00:3409
    ldh  a,[<$FFA5]                 ; 00:340A  length
    ld   b,a                        ; 00:340C
    ld   a,$03                      ; 00:340D
    sub  b                          ; 00:340F
    ld   b,a                        ; 00:3410  b = 3 - length
@LoopX_2High:                       ;         \ loop (3 - length) times
    ld   c,$02                      ; 00:3411  loop 2 times
@LoopY_2High:
    call ObjShared_SetTileShiftDown ; 00:3413
    inc  de                         ; 00:3416
    dec  c                          ; 00:3417
    jr   nz,@LoopY_2High            ; 00:3418
    dec  b                          ; 00:341A
    jr   z,@Return                  ; 00:341B
    inc  de                         ; 00:341D
    push bc                         ; 00:341E
    ld   bc,$FFE0                   ; 00:341F
    add  hl,bc                      ; 00:3422
    inc  hl                         ; 00:3423
    call ObjShared_TilemapXCarry    ; 00:3424
    pop  bc                         ; 00:3427
    jr   @LoopX_2High               ; 00:3428 /

@3HighHill:
; runs if object Y < 0D: 3 high hill
    ldh  a,[<$FFA5]                 ; 00:342A  length
    ld   c,a                        ; 00:342C
    sla  a                          ; 00:342D  length * 2
    add  c                          ; 00:342F  length * 3
    add  e                          ; 00:3430
    ld   e,a                        ; 00:3431 \ index DE with length * 3
    ld   a,d                        ; 00:3432
    adc  $00                        ; 00:3433
    ld   d,a                        ; 00:3435 /
    ld   a,$05                      ; 00:3436
    sub  c                          ; 00:3438
    ld   b,a                        ; 00:3439  b = 5 - length
@LoopX_3High:                       ;         \ loop (5 - length) times
    ld   c,$03                      ; 00:343A
@LoopY_3High:
    call ObjShared_SetTileShiftDown ; 00:343C
    inc  de                         ; 00:343F
    dec  c                          ; 00:3440
    jr   nz,@LoopY_3High            ; 00:3441
    dec  b                          ; 00:3443
    jr   z,@Return                  ; 00:3444
    push bc                         ; 00:3446
    ld   bc,$FFD0                   ; 00:3447
    add  hl,bc                      ; 00:344A
    inc  hl                         ; 00:344B
    call ObjShared_TilemapXCarry    ; 00:344C
    pop  bc                         ; 00:344F
    jr   @LoopX_3High               ; 00:3450 /
@Return:
    pop  de                         ; 00:3452
    ret                             ; 00:3453

Obj206_SubLvMainWrapper:
    pop  de                         ; 00:3454
    call Obj206_Main                ; 00:3455
    jp   MainDataObjectLoop         ; 00:3458

Obj206_Main:
; object 2.06: tree platform
    call ObjShared_GetTilemapAddr   ; 00:345B
    inc  de                         ; 00:345E
    ld   a,[de]                     ; 00:345F
    ldh  [<$FFA5],a                 ; 00:3460  $FFA5 = length
    push de                         ; 00:3462
    ldh  a,[<$FFA4]                 ; 00:3463  current object's YX byte
    and  $F0                        ; 00:3465
    swap a                          ; 00:3467  current object's Y
    ld   b,a                        ; 00:3469
    ld   a,$0F                      ; 00:346A
    sub  b                          ; 00:346C
    ldh  [<$FFA4],a                 ; 00:346D  $FFA4 = 0F - current object's Y
    ld   de,Obj206_Tilemap          ; 00:346F  32 33 35 34
    ld   a,[de]                     ; 00:3472
    ldi  [hl],a                     ; 00:3473  write tile 32 (platform left edge) to tilemap, then x += 1
    call ObjShared_TilemapXCarry    ; 00:3474
    inc  de                         ; 00:3477
    ldh  a,[<$FFA5]                 ; 00:3478
    ld   b,a                        ; 00:347A
@LoopX:                             ;         \
    call ObjShared_SetTileShiftDown ; 00:347B  write tile from [de] [33: platform center] to tilemap, then y += 1
    inc  de                         ; 00:347E
    ldh  a,[<$FFA4]                 ; 00:347F
    ld   c,a                        ; 00:3481
    and  c                          ; 00:3482
@LoopY:
    jr   z,@Code00348B              ; 00:3483  \ write tile 35 (stem tile) until bottom of level
    call ObjShared_SetTileShiftDown ; 00:3485
    dec  c                          ; 00:3488
    jr   @LoopY                     ; 00:3489  /
@Code00348B:
    push bc                         ; 00:348B
    inc  hl                         ; 00:348C  x += 1
    call ObjShared_TilemapXCarry    ; 00:348D
    ldh  a,[<$FFA4]                 ; 00:3490
    inc  a                          ; 00:3492
    ld   c,a                        ; 00:3493
    ld   a,$10                      ; 00:3494
    sub  c                          ; 00:3496
    ld   c,a                        ; 00:3497
    swap c                          ; 00:3498
    ld   b,$FF                      ; 00:349A
    add  hl,bc                      ; 00:349C
    pop  bc                         ; 00:349D
    dec  b                          ; 00:349E
    jr   z,@Code0034A4              ; 00:349F
    dec  de                         ; 00:34A1
    jr   @LoopX                     ; 00:34A2 /
@Code0034A4:
    inc  de                         ; 00:34A4
    ld   a,[de]                     ; 00:34A5
    ld   [hl],a                     ; 00:34A6  write tile 34 (platform right edge)
    pop  de                         ; 00:34A7
    ret                             ; 00:34A8

Obj208_SubLvMainWrapper:
    pop  de                         ; 00:34A9
    call Obj208_Main                ; 00:34AA
    jp   MainDataObjectLoop         ; 00:34AD

Obj208_Main:
; object 2.08: BG round tree (1x3)
    call ObjShared_GetTilemapAddr   ; 00:34B0
    inc  de                         ; 00:34B3
    push de                         ; 00:34B4
    ld   de,Obj208_Tilemap          ; 00:34B5  48 49 4B
    ld   b,$03                      ; 00:34B8  loop 3 times
@Loop:
    call ObjShared_SetTileShiftDown ; 00:34BA
    inc  de                         ; 00:34BD
    dec  b                          ; 00:34BE
    jr   nz,@Loop                   ; 00:34BF
    pop  de                         ; 00:34C1
    ret                             ; 00:34C2

Obj209_SubLvMainWrapper:
    pop  de                         ; 00:34C3
    call Obj209_Main                ; 00:34C4
    jp   MainDataObjectLoop         ; 00:34C7

Obj209_Main:
; object 2.09: BG round tree (1x2)
    call ObjShared_GetTilemapAddr   ; 00:34CA
    inc  de                         ; 00:34CD
    push de                         ; 00:34CE
    ld   de,Obj209_Tilemap          ; 00:34CF  4A 4B
    call ObjShared_SetTileShiftDown ; 00:34D2
    inc  de                         ; 00:34D5
    ld   a,[de]                     ; 00:34D6
    ld   [hl],a                     ; 00:34D7
    pop  de                         ; 00:34D8
    ret                             ; 00:34D9

Obj20A_SubLvMainWrapper:
    pop  de                         ; 00:34DA
    call Obj20A_Main                ; 00:34DB
    jp   MainDataObjectLoop         ; 00:34DE

Obj20A_Main:
; object 2.0A: bullet cannon (1x2)
    call ObjShared_GetTilemapAddr   ; 00:34E1
    inc  de                         ; 00:34E4
    push de                         ; 00:34E5
    ld   de,Obj20A_Tilemap          ; 00:34E6  46 47
    call ObjShared_SetTileShiftDown ; 00:34E9
    inc  de                         ; 00:34EC
    ld   a,[de]                     ; 00:34ED
    ld   [hl],a                     ; 00:34EE
    pop  de                         ; 00:34EF
    ret                             ; 00:34F0

Obj20B_SubLvMainWrapper:
    pop  de                         ; 00:34F1
    call Obj20B_Main                ; 00:34F2
    jp   MainDataObjectLoop         ; 00:34F5

Obj20B_Main:
; object 2.0B: scale platform cable top
    call ObjShared_GetTilemapAddr   ; 00:34F8
    inc  de                         ; 00:34FB
    ld   a,[de]                     ; 00:34FC
    ld   b,a                        ; 00:34FD
    push de                         ; 00:34FE
    ld   de,Obj20B_Tilemap          ; 00:34FF  44 4D 45
    ld   a,[de]                     ; 00:3502
    ldi  [hl],a                     ; 00:3503
    inc  de                         ; 00:3504
    call ObjShared_TilemapXCarry    ; 00:3505
@Loop:                              ;         \ loop length times
    ld   a,[de]                     ; 00:3508
    ldi  [hl],a                     ; 00:3509
    call ObjShared_TilemapXCarry    ; 00:350A
    dec  b                          ; 00:350D
    jr   nz,@Loop                   ; 00:350E /
    inc  de                         ; 00:3510
    ld   a,[de]                     ; 00:3511
    ld   [hl],a                     ; 00:3512
    pop  de                         ; 00:3513
    ret                             ; 00:3514

Obj20C_SubLvMainWrapper:
    pop  de                         ; 00:3515
    call Obj20C_Main                ; 00:3516
    jp   MainDataObjectLoop         ; 00:3519

Obj20C_Main:
; object 2.0C: mushroom platform
    call ObjShared_GetTilemapAddr   ; 00:351C
    inc  de                         ; 00:351F
    ld   a,[de]                     ; 00:3520
    ldh  [<$FFA5],a                 ; 00:3521  $FFA5 = length
    push de                         ; 00:3523
    ld   de,Obj20C_Tilemap          ; 00:3524  4F 50 51
    ld   a,[de]                     ; 00:3527
    ldi  [hl],a                     ; 00:3528
    call ObjShared_TilemapXCarry    ; 00:3529
    inc  de                         ; 00:352C
    ldh  a,[<$FFA5]                 ; 00:352D
    ld   b,a                        ; 00:352F
    ld   a,[de]                     ; 00:3530
    ldi  [hl],a                     ; 00:3531
    call ObjShared_TilemapXCarry    ; 00:3532
    dec  b                          ; 00:3535
    jp   nz,Obj202_20C_Shared       ; 00:3536
    inc  de                         ; 00:3539
    ld   a,[de]                     ; 00:353A
    ld   [hl],a                     ; 00:353B
    pop  de                         ; 00:353C
    ret                             ; 00:353D

Obj20D_SubLvMainWrapper:
    pop  de                         ; 00:353E
    call Obj20D_Main                ; 00:353F
    jp   MainDataObjectLoop         ; 00:3542

Obj20D_Main:
; object 2.0D: mushroom platform stem
    call ObjShared_GetTilemapAddr   ; 00:3545
    inc  de                         ; 00:3548
    push de                         ; 00:3549
    ldh  a,[<$FFA4]                 ; 00:354A  current object's YX byte
    and  $F0                        ; 00:354C
    swap a                          ; 00:354E  current object Y
    ld   b,a                        ; 00:3550
    ld   a,$0F                      ; 00:3551
    sub  b                          ; 00:3553
    ld   b,a                        ; 00:3554  0F - object Y
    ld   de,Obj20D_Tilemap          ; 00:3555  52 53
    call ObjShared_SetTileShiftDown ; 00:3558
    inc  de                         ; 00:355B
    ld   a,b                        ; 00:355C
    and  a                          ; 00:355D
@Loop:
    jr   z,@Return                  ; 00:355E \ loop 0F - object Y times
    call ObjShared_SetTileShiftDown ; 00:3560
    dec  b                          ; 00:3563
    jr   @Loop                      ; 00:3564
@Return:
    pop  de                         ; 00:3566
    ret                             ; 00:3567

ObjShared_GetTilemapAddr:
; subroutine: Retrieve a YX byte from level data, to calculate tilemap address in HL
    ld   hl,W_SubLv16x16Tilemap     ; 00:3568
    ldh  a,[<$FFA2]                 ; 00:356B \
    and  $0F                        ; 00:356D |
    ld   b,a                        ; 00:356F | bc = current screen number (low digit)*100
    ld   c,$00                      ; 00:3570 /
    add  hl,bc                      ; 00:3572
    inc  de                         ; 00:3573  increment byte to load from
    ld   a,[de]                     ; 00:3574
    ldh  [<$FFA4],a                 ; 00:3575  $FFA4 = new byte from level data
    ld   c,a                        ; 00:3577
    ld   b,$00                      ; 00:3578
    add  hl,bc                      ; 00:357A  hl = $D000 + screen low * 100 + YX byte
    ret                             ; 00:357B

ObjShared_SetTileShiftDown:
; subroutine: Write tile from [de] to tilemap, then increment tilemap Y position
    ld   a,[de]                     ; 00:357C
    ld   [hl],a                     ; 00:357D
    ld   a,l                        ; 00:357E \
    add  $10                        ; 00:357F |
    ld   l,a                        ; 00:3581 | add 10 to HL, with carry
    ld   a,h                        ; 00:3582 |
    adc  $00                        ; 00:3583 |
    ld   h,a                        ; 00:3585 /
    ret                             ; 00:3586

ObjShared_TilemapXCarry:
; subroutine: Handle tilemap X carry (called after incrementing tilemap address in HL)
    ld   a,l                        ; 00:3587 \
    and  $0F                        ; 00:3588 | if L low digit is nonzero, return
    jr   nz,@Return                 ; 00:358A /
    push bc                         ; 00:358C \
    ld   bc,$00F0                   ; 00:358D | add F0 to HL
    add  hl,bc                      ; 00:3590 |
    pop  bc                         ; 00:3591 /
@Return:
    ret                             ; 00:3592

Sub003593:
    ld   a,$06                      ; 00:3593
    ldh  [<SVBK],a                  ; 00:3595
    ld   hl,$9800                   ; 00:3597
    ld   de,W_SubLv16x16Tilemap     ; 00:359A
    ldh  a,[<H_CameraXHigh]         ; 00:359D
    and  a                          ; 00:359F
    jr   z,Code0035B6               ; 00:35A0
    cp   $11                        ; 00:35A2
    jr   c,Code0035AF               ; 00:35A4
    ldh  a,[<SVBK]                  ; 00:35A6
    inc  a                          ; 00:35A8
    ldh  [<SVBK],a                  ; 00:35A9
    ldh  a,[<H_CameraXHigh]         ; 00:35AB
    and  $0F                        ; 00:35AD
Code0035AF:
    add  d                          ; 00:35AF
    ld   d,a                        ; 00:35B0
    dec  d                          ; 00:35B1
    ld   e,$0E                      ; 00:35B2
    ld   l,$1C                      ; 00:35B4
Code0035B6:
    ld   a,$10                      ; 00:35B6
    ldh  [<$FFA6],a                 ; 00:35B8
Code0035BA:
    ld   a,$10                      ; 00:35BA
    ldh  [<$FFA5],a                 ; 00:35BC
Code0035BE:
    push de                         ; 00:35BE
    push hl                         ; 00:35BF
    ld   a,:Ti_16x16Tiles           ; 00:35C0
    call SetROMBank                 ; 00:35C2
    ld   hl,Ti_16x16Tiles           ; 00:35C5
    ld   a,[de]                     ; 00:35C8
    ld   c,a                        ; 00:35C9
    cp   $3F                        ; 00:35CA
    jr   nz,Code0035D8              ; 00:35CC
    ld   a,[$C1B3]                  ; 00:35CE
    and  a                          ; 00:35D1
    jr   z,Code0035D8               ; 00:35D2
    ld   a,$03                      ; 00:35D4
    ld   [de],a                     ; 00:35D6
    ld   c,a                        ; 00:35D7
Code0035D8:
    ld   b,$00                      ; 00:35D8
    sla  c                          ; 00:35DA
    rl   b                          ; 00:35DC
    sla  c                          ; 00:35DE
    rl   b                          ; 00:35E0
    sla  c                          ; 00:35E2
    rl   b                          ; 00:35E4
    add  hl,bc                      ; 00:35E6
    push hl                         ; 00:35E7
    pop  de                         ; 00:35E8
    pop  hl                         ; 00:35E9
    ld   b,$02                      ; 00:35EA
Code0035EC:
    ld   c,$02                      ; 00:35EC
Code0035EE:
    ld   a,$01                      ; 00:35EE
    ldh  [<VBK],a                   ; 00:35F0
    ld   a,[de]                     ; 00:35F2
    ld   [hl],a                     ; 00:35F3
    inc  de                         ; 00:35F4
    xor  a                          ; 00:35F5
    ldh  [<VBK],a                   ; 00:35F6
    ld   a,[de]                     ; 00:35F8
    ldi  [hl],a                     ; 00:35F9
    inc  de                         ; 00:35FA
    dec  c                          ; 00:35FB
    jr   nz,Code0035EE              ; 00:35FC
    push bc                         ; 00:35FE
    ld   bc,$001E                   ; 00:35FF
    add  hl,bc                      ; 00:3602
    pop  bc                         ; 00:3603
    dec  b                          ; 00:3604
    jr   nz,Code0035EC              ; 00:3605
    pop  de                         ; 00:3607
    ld   a,e                        ; 00:3608
    add  $10                        ; 00:3609
    ld   e,a                        ; 00:360B
    ld   a,d                        ; 00:360C
    adc  $00                        ; 00:360D
    ld   d,a                        ; 00:360F
    ldh  a,[<$FFA5]                 ; 00:3610
    dec  a                          ; 00:3612
    ldh  [<$FFA5],a                 ; 00:3613
    jr   nz,Code0035BE              ; 00:3615
    ld   h,$98                      ; 00:3617
    ld   a,l                        ; 00:3619
    add  $02                        ; 00:361A
    and  $1F                        ; 00:361C
    ld   l,a                        ; 00:361E
    dec  d                          ; 00:361F
    inc  e                          ; 00:3620
    ld   a,e                        ; 00:3621
    cp   $10                        ; 00:3622
    jr   c,Code003636               ; 00:3624
    and  $0F                        ; 00:3626
    ld   e,a                        ; 00:3628
    inc  d                          ; 00:3629
    ld   a,d                        ; 00:362A
    cp   $E0                        ; 00:362B
    jr   c,Code003636               ; 00:362D
    ldh  a,[<SVBK]                  ; 00:362F
    inc  a                          ; 00:3631
    ldh  [<SVBK],a                  ; 00:3632
    ld   d,$D0                      ; 00:3634
Code003636:
    ldh  a,[<$FFA6]                 ; 00:3636
    dec  a                          ; 00:3638
    ldh  [<$FFA6],a                 ; 00:3639
    jp   nz,Code0035BA              ; 00:363B
    ld   a,$00                      ; 00:363E
    ldh  [<SVBK],a                  ; 00:3640
    ret                             ; 00:3642

Sub003643:
    ldh  a,[<H_CameraXHigh]         ; 00:3643
    ld   b,a                        ; 00:3645
    ldh  a,[<$FFC4]                 ; 00:3646
    cp   b                          ; 00:3648
    jr   c,Code00365E               ; 00:3649
    jr   z,Code00364F               ; 00:364B
    jr   Code00367B                 ; 00:364D
Code00364F:
    ldh  a,[<$FFC5]                 ; 00:364F
    ld   b,a                        ; 00:3651
    ldh  a,[<H_CameraXLow]          ; 00:3652
    and  $F8                        ; 00:3654
    cp   b                          ; 00:3656
    jr   c,Code00367B               ; 00:3657
    jr   z,Return00365D             ; 00:3659
    jr   Code00365E                 ; 00:365B
Return00365D:
    ret                             ; 00:365D

Code00365E:
    ldh  a,[<H_CameraXHigh]         ; 00:365E
    ldh  [<$FFC4],a                 ; 00:3660
    ld   b,a                        ; 00:3662
    ldh  a,[<H_CameraXLow]          ; 00:3663
    and  $F8                        ; 00:3665
    ldh  [<$FFC5],a                 ; 00:3667
    bit  3,a                        ; 00:3669
    jr   z,Code003671               ; 00:366B
    ld   a,$01                      ; 00:366D
    ldh  [<$FFC8],a                 ; 00:366F
Code003671:
    ldh  a,[<$FFC5]                 ; 00:3671
    and  $F0                        ; 00:3673
    swap a                          ; 00:3675
    add  $0C                        ; 00:3677
    jr   Code003697                 ; 00:3679
Code00367B:
    ldh  a,[<H_CameraXHigh]         ; 00:367B
    ldh  [<$FFC4],a                 ; 00:367D
    dec  a                          ; 00:367F
    ld   b,a                        ; 00:3680
    ldh  a,[<H_CameraXLow]          ; 00:3681
    and  $F8                        ; 00:3683
    ldh  [<$FFC5],a                 ; 00:3685
    bit  3,a                        ; 00:3687
    jr   z,Code00368F               ; 00:3689
    ld   a,$01                      ; 00:368B
    ldh  [<$FFC8],a                 ; 00:368D
Code00368F:
    ldh  a,[<$FFC5]                 ; 00:368F
    and  $F0                        ; 00:3691
    swap a                          ; 00:3693
    add  $0F                        ; 00:3695
Code003697:
    cp   $10                        ; 00:3697
    jr   c,Code0036A2               ; 00:3699
    and  $0F                        ; 00:369B
    ldh  [<$FFC7],a                 ; 00:369D
    inc  b                          ; 00:369F
    jr   Code0036A4                 ; 00:36A0
Code0036A2:
    ldh  [<$FFC7],a                 ; 00:36A2
Code0036A4:
    ld   c,$00                      ; 00:36A4
    ld   hl,$D000                   ; 00:36A6
    add  hl,bc                      ; 00:36A9
    call Sub0036B9                  ; 00:36AA
    ld   a,$02                      ; 00:36AD
    ld   [$C172],a                  ; 00:36AF
    ldh  a,[<$FFC7]                 ; 00:36B2
    sla  a                          ; 00:36B4
    ldh  [<$FFC7],a                 ; 00:36B6
    ret                             ; 00:36B8

Sub0036B9:
    ld   a,$06                      ; 00:36B9
    ldh  [<SVBK],a                  ; 00:36BB
    ld   a,h                        ; 00:36BD
    cp   $E0                        ; 00:36BE
    jr   c,@Code0036CA              ; 00:36C0
    sub  $10                        ; 00:36C2
    ld   h,a                        ; 00:36C4
    ldh  a,[<SVBK]                  ; 00:36C5
    inc  a                          ; 00:36C7
    ldh  [<SVBK],a                  ; 00:36C8
@Code0036CA:
    ldh  a,[<$FFC7]                 ; 00:36CA
    add  l                          ; 00:36CC
    ld   l,a                        ; 00:36CD
    ld   de,$C120                   ; 00:36CE
    ld   a,:Ti_16x16Tiles           ; 00:36D1
    ld   [ROMBANK],a                ; 00:36D3
    ld   a,$10                      ; 00:36D6
    ldh  [<$FFA2],a                 ; 00:36D8
@Loop0036DA:
    push hl                         ; 00:36DA
    ld   a,[hl]                     ; 00:36DB \
    ld   c,a                        ; 00:36DC / c = 16x16 tile ID from 6:D000-7:DFFF
    cp   $3F                        ; 00:36DD  3F: hidden block with 1up
    jr   nz,@Code0036EB             ; 00:36DF
    ld   a,[$C1B3]                  ; 00:36E1  if 3F, check flag
    and  a                          ; 00:36E4
    jr   z,@Code0036EB              ; 00:36E5
    ld   a,$03                      ; 00:36E7  if $C13B is set, replace 3F with blank tile
    ld   [hl],a                     ; 00:36E9
    ld   c,a                        ; 00:36EA
@Code0036EB:
    ld   b,$00                      ; 00:36EB \
    sla  c                          ; 00:36ED |
    rl   b                          ; 00:36EF |
    sla  c                          ; 00:36F1 | bc = c*8
    rl   b                          ; 00:36F3 |
    sla  c                          ; 00:36F5 |
    rl   b                          ; 00:36F7 /
    ld   hl,Ti_16x16Tiles           ; 00:36F9
    add  hl,bc                      ; 00:36FC  hl = Ti_16x16Tiles + tile ID
    ldh  a,[<$FFC8]                 ; 00:36FD \
    sla  a                          ; 00:36FF |
    ld   c,a                        ; 00:3701 | add 2*$FFC8
    ld   b,$00                      ; 00:3702 /
    add  hl,bc                      ; 00:3704  hl = Ti_16x16Tiles + tile ID + 2*$FFC8
    ld   a,$02                      ; 00:3705
    ldh  [<$FFA3],a                 ; 00:3707
@Loop003709:
    ldi  a,[hl]                     ; 00:3709
    ld   [de],a                     ; 00:370A
    inc  de                         ; 00:370B
    ldi  a,[hl]                     ; 00:370C
    ld   [de],a                     ; 00:370D
    inc  de                         ; 00:370E
    inc  hl                         ; 00:370F
    inc  hl                         ; 00:3710
    ldh  a,[<$FFA3]                 ; 00:3711
    dec  a                          ; 00:3713
    ldh  [<$FFA3],a                 ; 00:3714
    jr   nz,@Loop003709             ; 00:3716
    pop  hl                         ; 00:3718
    ld   a,l                        ; 00:3719
    add  $10                        ; 00:371A
    ld   l,a                        ; 00:371C
    ldh  a,[<$FFA2]                 ; 00:371D
    dec  a                          ; 00:371F
    ldh  [<$FFA2],a                 ; 00:3720
    jr   nz,@Loop0036DA             ; 00:3722
    ld   a,$00                      ; 00:3724
    ldh  [<SVBK],a                  ; 00:3726
    ret                             ; 00:3728

Code003729:
    ld   de,$C130                   ; 00:3729
    ld   hl,$9900                   ; 00:372C
    ldh  a,[<$FFC7]                 ; 00:372F
    ld   c,a                        ; 00:3731
    ldh  a,[<$FFC8]                 ; 00:3732
    add  c                          ; 00:3734
    ld   c,a                        ; 00:3735
    ld   b,$00                      ; 00:3736
    add  hl,bc                      ; 00:3738
    ld   b,$03                      ; 00:3739
Code00373B:
    ld   c,$08                      ; 00:373B
Code00373D:
    ld   a,$01                      ; 00:373D
    ldh  [<VBK],a                   ; 00:373F
    ld   a,[de]                     ; 00:3741
    ld   [hl],a                     ; 00:3742
    inc  de                         ; 00:3743
    xor  a                          ; 00:3744
    ldh  [<VBK],a                   ; 00:3745
    ld   a,[de]                     ; 00:3747
    ld   [hl],a                     ; 00:3748
    inc  de                         ; 00:3749
    ld   a,l                        ; 00:374A
    add  $20                        ; 00:374B
    ld   l,a                        ; 00:374D
    dec  c                          ; 00:374E
    jr   nz,Code00373D              ; 00:374F
    inc  h                          ; 00:3751
    dec  b                          ; 00:3752
    jr   nz,Code00373B              ; 00:3753
    ld   a,$00                      ; 00:3755
    ldh  [<$FFC8],a                 ; 00:3757
    ret                             ; 00:3759

Sub00375A:
    call InitSubLv16x16Tilemap      ; 00:375A
    ld   a,[W_SublevelID]           ; 00:375D
    ld   c,a                        ; 00:3760
    ld   b,$00                      ; 00:3761  bc = sublevelID
    ld   l,c                        ; 00:3763
    ld   h,b                        ; 00:3764  hl = sublevelID
    sla  c                          ; 00:3765
    rl   b                          ; 00:3767  bc = sublevelID*2
    add  hl,bc                      ; 00:3769
    ld   c,l                        ; 00:376A
    ld   b,h                        ; 00:376B  bc = sublevelID*3
    ld   a,[W_SPFlag]               ; 00:376C
    and  a                          ; 00:376F
    jr   nz,@SuperPlayers           ; 00:3770
    ld   a,:SublevelMainPtrs0       ; 00:3772
    call SetROMBank                 ; 00:3774
    ld   hl,SublevelMainPtrs0       ; 00:3777
    jr   @Code003784                ; 00:377A
@SuperPlayers:
    ld   a,:SublevelMainPtrsSP      ; 00:377C
    call SetROMBank                 ; 00:377E
    ld   hl,SublevelMainPtrsSP      ; 00:3781
@Code003784:
    add  hl,bc                      ; 00:3784
    ld   e,[hl]                     ; 00:3785
    inc  hl                         ; 00:3786
    ld   d,[hl]                     ; 00:3787
    inc  hl                         ; 00:3788
    ld   a,[hl]                     ; 00:3789
    call SetROMBank                 ; 00:378A
    call LoadSublevelMainData       ; 00:378D
    ld   a,$00                      ; 00:3790
    ldh  [<$FFC8],a                 ; 00:3792
    ldh  a,[<H_CameraXLow]          ; 00:3794
    ldh  [<$FFC5],a                 ; 00:3796
    ldh  a,[<H_CameraXHigh]         ; 00:3798
    ldh  [<$FFC4],a                 ; 00:379A
    ldh  [<$FFC9],a                 ; 00:379C
    ldh  [<$FFCA],a                 ; 00:379E
    ld   a,$80                      ; 00:37A0
    ldh  [<$FFCB],a                 ; 00:37A2
    ld   a,$0D                      ; 00:37A4
    ldh  [<$FFC7],a                 ; 00:37A6
    ld   a,$01                      ; 00:37A8
    ld   [$C181],a                  ; 00:37AA
    ret                             ; 00:37AD

LoadChallengeObjData:
    ld   a,[W_SublevelID]           ; 00:37AE
    sla  a                          ; 00:37B1
    ld   c,a                        ; 00:37B3
    ld   b,$00                      ; 00:37B4  bc = 2*sublevelID
    ld   a,:ChallengeObjDataPtrs    ; 00:37B6
    call SetROMBank                 ; 00:37B8
    ld   hl,ChallengeObjDataPtrs    ; 00:37BB
    add  hl,bc                      ; 00:37BE
    ld   e,[hl]                     ; 00:37BF
    inc  hl                         ; 00:37C0
    ld   d,[hl]                     ; 00:37C1
    call @Sub0037C6                 ; 00:37C2  redundant call
    ret                             ; 00:37C5

@Sub0037C6:
    ld   a,$00                      ; 00:37C6
    ldh  [<$FFA2],a                 ; 00:37C8
    ld   a,$06                      ; 00:37CA
    ldh  [<SVBK],a                  ; 00:37CC
ChalDataObjLoop:
    ld   a,[de]                     ; 00:37CE
    cp   $FF                        ; 00:37CF
    jp   z,Code0038A2               ; 00:37D1
    ldh  [<$FFA3],a                 ; 00:37D4
    push de                         ; 00:37D6
    bit  7,a                        ; 00:37D7
    jr   nz,Obj2_Extended_Ch        ; 00:37D9
    bit  6,a                        ; 00:37DB
    jr   nz,Obj1_TileColumn_Ch      ; 00:37DD

; object 0: horizontal line of tiles  (runs if bits 6-7 are both clear)
    pop  de                         ; 00:37DF
    call ObjShared_GetTilemapAddr   ; 00:37E0
    inc  de                         ; 00:37E3
    ldh  a,[<$FFA3]                 ; 00:37E4
    and  $3F                        ; 00:37E6
    ld   b,a                        ; 00:37E8
@Loop:
    ld   a,[de]                     ; 00:37E9
    ldi  [hl],a                     ; 00:37EA
    call ObjShared_TilemapXCarry    ; 00:37EB
    dec  b                          ; 00:37EE
    jr   nz,@Loop                   ; 00:37EF
    jp   ChalDataObjLoop_Continue   ; 00:37F1

Obj1_TileColumn_Ch:
; object 1: vertical line of tiles  (runs if bit 6 set, bit 7 clear)
    pop  de                         ; 00:37F4
    call ObjShared_GetTilemapAddr   ; 00:37F5
    inc  de                         ; 00:37F8
    ldh  a,[<$FFA3]                 ; 00:37F9
    and  $3F                        ; 00:37FB
    ld   b,a                        ; 00:37FD
Code0037FE:
    call ObjShared_SetTileShiftDown ; 00:37FE
    dec  b                          ; 00:3801
    jr   nz,Code0037FE              ; 00:3802
    jp   ChalDataObjLoop_Continue   ; 00:3804

Obj2_Extended_Ch:
; object 2: extended object  (runs if bit 7 is set)
    ldh  a,[<$FFA3]                 ; 00:3807
    and  $7F                        ; 00:3809
    rst  $00                        ; 00:380B  Execute from 16-bit pointer table
.dw Obj200_ChDataWrapper            ; 00:380C
.dw Obj201_ChDataWrapper            ; 00:380E
.dw Obj202_ChDataWrapper            ; 00:3810
.dw Obj203_ChDataWrapper            ; 00:3812
.dw Obj204_ChDataWrapper            ; 00:3814
.dw Obj205_ChDataWrapper            ; 00:3816
.dw Obj206_ChDataWrapper            ; 00:3818
.dw Obj207_ChDataWrapper            ; 00:381A
.dw Obj208_ChDataWrapper            ; 00:381C
.dw Obj209_ChDataWrapper            ; 00:381E
.dw Obj20A_ChDataWrapper            ; 00:3820
.dw Obj20B_ChDataWrapper            ; 00:3822
.dw Obj20C_ChDataWrapper            ; 00:3824
.dw Obj20D_ChDataWrapper            ; 00:3826
.dw Obj20E                          ; 00:3828
.dw Obj20F                          ; 00:382A

Obj200_ChDataWrapper:
    pop  de                         ; 00:382C
    call Obj200_Main                ; 00:382D
    jr   ChalDataObjLoop_Continue   ; 00:3830
Obj201_ChDataWrapper:
    pop  de                         ; 00:3832
    call Obj201_Main                ; 00:3833
    jr   ChalDataObjLoop_Continue   ; 00:3836
Obj202_ChDataWrapper:
    pop  de                         ; 00:3838
    call Obj202_Main                ; 00:3839
    jr   ChalDataObjLoop_Continue   ; 00:383C
Obj203_ChDataWrapper:
    pop  de                         ; 00:383E
    call Obj203_Main                ; 00:383F
    jr   ChalDataObjLoop_Continue   ; 00:3842
Obj204_ChDataWrapper:
    pop  de                         ; 00:3844
    call Obj204_Main                ; 00:3845
    jr   ChalDataObjLoop_Continue   ; 00:3848
Obj205_ChDataWrapper:
    pop  de                         ; 00:384A
    call Obj205_Main                ; 00:384B
    jr   ChalDataObjLoop_Continue   ; 00:384E
Obj206_ChDataWrapper:
    pop  de                         ; 00:3850
    call Obj206_Main                ; 00:3851
    jr   ChalDataObjLoop_Continue   ; 00:3854
Obj207_ChDataWrapper:
    pop  de                         ; 00:3856
    call Obj207_Main                ; 00:3857
    jr   ChalDataObjLoop_Continue   ; 00:385A
Obj208_ChDataWrapper:
    pop  de                         ; 00:385C
    call Obj208_Main                ; 00:385D
    jr   ChalDataObjLoop_Continue   ; 00:3860
Obj209_ChDataWrapper:
    pop  de                         ; 00:3862
    call Obj209_Main                ; 00:3863
    jr   ChalDataObjLoop_Continue   ; 00:3866
Obj20A_ChDataWrapper:
    pop  de                         ; 00:3868
    call Obj20A_Main                ; 00:3869
    jr   ChalDataObjLoop_Continue   ; 00:386C
Obj20B_ChDataWrapper:
    pop  de                         ; 00:386E
    call Obj20B_Main                ; 00:386F
    jr   ChalDataObjLoop_Continue   ; 00:3872
Obj20C_ChDataWrapper:
    pop  de                         ; 00:3874
    call Obj20C_Main                ; 00:3875
    jr   ChalDataObjLoop_Continue   ; 00:3878
Obj20D_ChDataWrapper:
    pop  de                         ; 00:387A
    call Obj20D_Main                ; 00:387B
    jr   ChalDataObjLoop_Continue   ; 00:387E

Obj20E:
; object 2.0E: challenge x-4 pillar
    pop  de                         ; 00:3880
    call ObjShared_GetTilemapAddr   ; 00:3881
    inc  de                         ; 00:3884
    push de                         ; 00:3885
    ld   de,Obj20E_Tilemap          ; 00:3886  90 91 92
    jr   Obj20E_20F_Shared          ; 00:3889

Obj20F:
; object 2.0F: challenge x-4 doorway
    pop  de                         ; 00:388B
    call ObjShared_GetTilemapAddr   ; 00:388C
    inc  de                         ; 00:388F
    push de                         ; 00:3890
    ld   de,Obj20F_Tilemap          ; 00:3891  8F 94 94
Obj20E_20F_Shared:
    ld   b,$03                      ; 00:3894  loop 3 times
@Loop:
    call ObjShared_SetTileShiftDown ; 00:3896
    inc  de                         ; 00:3899
    dec  b                          ; 00:389A
    jr   nz,@Loop                   ; 00:389B
    pop  de                         ; 00:389D
ChalDataObjLoop_Continue:
    inc  de                         ; 00:389E
    jp   ChalDataObjLoop            ; 00:389F

Code0038A2:
    inc  de                         ; 00:38A2
    ldh  a,[<$FFA2]                 ; 00:38A3
    inc  a                          ; 00:38A5
    ldh  [<$FFA2],a                 ; 00:38A6
    ld   b,a                        ; 00:38A8
    cp   $10                        ; 00:38A9
    jr   nz,Code0038B1              ; 00:38AB
    ld   a,$07                      ; 00:38AD
    ldh  [<SVBK],a                  ; 00:38AF
Code0038B1:
    ld   a,[W_SubLvScreenCount]     ; 00:38B1
    cp   b                          ; 00:38B4
    jp   nz,ChalDataObjLoop         ; 00:38B5
    ld   a,$00                      ; 00:38B8
    ldh  [<SVBK],a                  ; 00:38BA
    ret                             ; 00:38BC

OverworldInit:
; Game state 04/07
    call Sub00126D                  ; 00:38BD
    ld   a,$00                      ; 00:38C0
    ldh  [<IE],a                    ; 00:38C2
    ldh  a,[<H_CameraXLow]          ; 00:38C4
    ld   [$C175],a                  ; 00:38C6
    ldh  a,[<H_CameraY]             ; 00:38C9
    ld   [$C176],a                  ; 00:38CB
    ld   a,$00                      ; 00:38CE
    ldh  [<H_GameSubstate],a        ; 00:38D0
Code0038D2:
    ld   a,:OverworldInit_CallSubstate; 00:38D2
    call SetROMBank                 ; 00:38D4
    call OverworldInit_CallSubstate ; 00:38D7
    call Sub0014AA                  ; 00:38DA
    ldh  a,[<H_GameSubstate]        ; 00:38DD
    cp   $05                        ; 00:38DF
    jr   c,Code0038D2               ; 00:38E1
    xor  a                          ; 00:38E3
    ldh  [<H_GameSubstate],a        ; 00:38E4
    ld   a,$03                      ; 00:38E6
    ldh  [<IE],a                    ; 00:38E8
    ld   a,$87                      ; 00:38EA
    ldh  [<LCDC],a                  ; 00:38EC
    ld   a,$FF                      ; 00:38EE
    ld   [$DE68],a                  ; 00:38F0
    ld   hl,H_GameState             ; 00:38F3
    inc  [hl]                       ; 00:38F6
    ret                             ; 00:38F7

OverworldMain:
; Game state 05/08
    ld   a,[W_ChallengeFlag]        ; 00:38F8
    cp   $01                        ; 00:38FB
    jr   z,@Code00390E              ; 00:38FD
    ld   a,[$C1B7]                  ; 00:38FF
    and  $01                        ; 00:3902
    jr   nz,@Code00390E             ; 00:3904
    ld   a,:Sub045096               ; 00:3906
    call SetROMBank                 ; 00:3908
    call Sub045096                  ; 00:390B
@Code00390E:
    ld   a,:Sub1161D7               ; 00:390E
    call SetROMBank                 ; 00:3910
    call Sub1161D7                  ; 00:3913
    ld   a,[W_ChallengeFlag]        ; 00:3916
    cp   $01                        ; 00:3919
    jr   z,@Code00396C              ; 00:391B
    ldh  a,[<H_ButtonsPressed]      ; 00:391D
    and  $08                        ; 00:391F  08: Start
    jr   nz,@Code00392F             ; 00:3921
    ld   a,[$C1B8]                  ; 00:3923
    and  a                          ; 00:3926
    ret  z                          ; 00:3927
    ldh  a,[<H_ButtonsPressed]      ; 00:3928
    and  $01                        ; 00:392A  01: A
    jr   nz,@Code003949             ; 00:392C
    ret                             ; 00:392E
@Code00392F:
    ld   a,[$C1B7]                  ; 00:392F
    and  $01                        ; 00:3932
    jr   z,@Code003949              ; 00:3934
    ld   a,[$C1AF]                  ; 00:3936
    ld   [W_PlayerFireFlag],a       ; 00:3939
    ld   hl,W_LevelID               ; 00:393C
    inc  [hl]                       ; 00:393F
    xor  a                          ; 00:3940
    ld   [$C1B7],a                  ; 00:3941
    ld   a,$04                      ; 00:3944
    ldh  [<H_GameState],a           ; 00:3946
    ret                             ; 00:3948
@Code003949:
    ld   a,$02                      ; 00:3949
    ld   [$C1B7],a                  ; 00:394B
    ld   a,$01                      ; 00:394E
    ld   [$C1B8],a                  ; 00:3950
    ld   a,[W_LevelID]              ; 00:3953
    ld   [W_SublevelID],a           ; 00:3956
    ld   a,$03                      ; 00:3959
    ld   de,$0008                   ; 00:395B
    call Return0010B2               ; 00:395E
    ld   a,[$C1AF]                  ; 00:3961
    ld   [W_PlayerFireFlag],a       ; 00:3964
    ld   hl,H_GameState             ; 00:3967
    inc  [hl]                       ; 00:396A
    ret                             ; 00:396B
@Code00396C:
    ldh  a,[<H_ButtonsPressed]      ; 00:396C
    and  $0B                        ; 00:396E  Start/B/A
    ret  z                          ; 00:3970
    ldh  a,[<H_ButtonsPressed]      ; 00:3971
    and  $09                        ; 00:3973  Start/A
    jr   nz,@Code00397C             ; 00:3975
    ld   a,$1D                      ; 00:3977
    ldh  [<H_GameState],a           ; 00:3979
    ret                             ; 00:397B
@Code00397C:
    ld   a,$03                      ; 00:397C
    ld   de,$0008                   ; 00:397E
    call Return0010B2               ; 00:3981
    ld   a,[W_LevelID]              ; 00:3984
    sla  a                          ; 00:3987
    ld   c,a                        ; 00:3989
    ld   b,$00                      ; 00:398A
    ld   a,:ChallengeRedCoinCoords  ; 00:398C
    call SetROMBank                 ; 00:398E
    ld   hl,ChallengeRedCoinCoords  ; 00:3991
    add  hl,bc                      ; 00:3994
    ld   e,[hl]                     ; 00:3995
    inc  hl                         ; 00:3996
    ld   d,[hl]                     ; 00:3997
    ld   bc,$0000                   ; 00:3998
@Loop00399B:
    ld   hl,$D30C                   ; 00:399B
    add  hl,bc                      ; 00:399E
    ld   a,[de]                     ; 00:399F
    ld   [hl],a                     ; 00:39A0
    inc  de                         ; 00:39A1
    ld   hl,$D31C                   ; 00:39A2
    add  hl,bc                      ; 00:39A5
    ld   a,[de]                     ; 00:39A6
    ld   [hl],a                     ; 00:39A7
    inc  de                         ; 00:39A8
    inc  c                          ; 00:39A9
    ld   a,c                        ; 00:39AA
    cp   $05                        ; 00:39AB
    jr   c,@Loop00399B              ; 00:39AD
    ld   a,$00                      ; 00:39AF
    ld   [W_RedCoinsCurrent],a      ; 00:39B1
    ld   [$D30A],a                  ; 00:39B4
    ld   [W_YoshiEggItemFlag],a     ; 00:39B7
    ld   [$C1B3],a                  ; 00:39BA
    ld   a,$0A                      ; 00:39BD
    ldh  [<H_GameState],a           ; 00:39BF
    ret                             ; 00:39C1

Code0039C2:
; Game state 31 wrapper
    ld   a,:Sub116F12               ; 00:39C2
    call SetROMBank                 ; 00:39C4
    call Sub116F12                  ; 00:39C7
    ret                             ; 00:39CA

Code0039CB:
; Game state 32
    ld   a,:Sub116F7B               ; 00:39CB
    call SetROMBank                 ; 00:39CD
    call Sub116F7B                  ; 00:39D0
    ld   a,:Sub045096               ; 00:39D3
    call SetROMBank                 ; 00:39D5
    call Sub045096                  ; 00:39D8
    ldh  a,[<H_ButtonsPressed]      ; 00:39DB
    and  $01                        ; 00:39DD
    jr   nz,Code0039E2              ; 00:39DF
    ret                             ; 00:39E1

Code0039E2:
    ld   a,$03                      ; 00:39E2
    ld   de,$0008                   ; 00:39E4
    call Return0010B2               ; 00:39E7
    ld   a,[W_SublevelID]           ; 00:39EA
    ld   [W_LevelID],a              ; 00:39ED
    ld   a,$06                      ; 00:39F0
    ldh  [<H_GameState],a           ; 00:39F2
    ret                             ; 00:39F4

LoadGraphicsBank:
; Load an entire bank of graphics from ROM, starting at [A]:4000, then return to bank B
;  Copies $4000-5800 to VRAM bank 0, $5800-7000 to VRAM bank 1
    call SetROMBank                 ; 00:39F5
    push bc                         ; 00:39F8
    ld   hl,$4000                   ; 00:39F9
    ld   de,$8000                   ; 00:39FC
    ld   bc,$1800                   ; 00:39FF
    call CopyBytes                  ; 00:3A02
    ld   a,$01                      ; 00:3A05
    ldh  [<VBK],a                   ; 00:3A07
    ld   hl,$5800                   ; 00:3A09
    ld   de,$8000                   ; 00:3A0C
    ld   bc,$1800                   ; 00:3A0F
    call CopyBytes                  ; 00:3A12
    ld   a,$00                      ; 00:3A15
    ldh  [<VBK],a                   ; 00:3A17
    pop  bc                         ; 00:3A19
    ld   a,b                        ; 00:3A1A
    call SetROMBank                 ; 00:3A1B
    ret                             ; 00:3A1E

    ret                             ; 00:3A1F

StatusBarTiles_Default:             ; 00:3A20
.db $F4,$F4,$F4,$F4,$F4,$F4,$F4,$D0,\
    $F4,$FE,$F9,$D0,$D0,$F4,$F4,$F4,\
    $7A,$F4,$F4,$F4,$F4,$F4,$F4,$F4,\
    $F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4
StatusBarTiles_Challenge:           ; 00:3A40
.db $F4,$F4,$F4,$F4,$F4,$F4,$F4,$D0,\
    $F4,$77,$77,$77,$77,$77,$F4,$F4,\
    $7A,$F4,$F4,$F4,$F4,$F4,$F4,$F4,\
    $F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4
StatusBarTiles_Race:                ; 00:3A60
.db $F4,$F4,$F4,$F4,$F4,$FE,$F9,$D0,\
    $D0,$F4,$7A,$F4,$F4,$F4,$F4,$F4,\
    $F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,\
    $F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4

StatusBarInit:
    ld   a,[W_GameMode]             ; 00:3A80
    cp   $02                        ; 00:3A83
    jr   z,@Race                    ; 00:3A85
    cp   $07                        ; 00:3A87
    jr   z,@Race                    ; 00:3A89
    ld   a,[W_ChallengeFlag]        ; 00:3A8B
    cp   $01                        ; 00:3A8E
    jr   z,@Challenge               ; 00:3A90
    ld   de,StatusBarTiles_Default  ; 00:3A92
    jr   @LoadTiles                 ; 00:3A95
@Challenge:
    ld   de,StatusBarTiles_Challenge; 00:3A97
    jr   @LoadTiles                 ; 00:3A9A
@Race:
    ld   de,StatusBarTiles_Race     ; 00:3A9C
@LoadTiles:
    ld   hl,$C100                   ; 00:3A9F
    ld   b,$20                      ; 00:3AA2
@CopyLoop:
    ld   a,[de]                     ; 00:3AA4
    ldi  [hl],a                     ; 00:3AA5
    inc  de                         ; 00:3AA6
    dec  b                          ; 00:3AA7
    jr   nz,@CopyLoop               ; 00:3AA8
    ld   a,$00                      ; 00:3AAA
    ld   [$C180],a                  ; 00:3AAC
    ret                             ; 00:3AAF

Sub003AB0:
    ld   a,[$C181]                  ; 00:3AB0
    and  a                          ; 00:3AB3
    ret  z                          ; 00:3AB4
    ld   a,[$C180]                  ; 00:3AB5
    inc  a                          ; 00:3AB8
    ld   [$C180],a                  ; 00:3AB9
    cp   $18                        ; 00:3ABC
    ret  c                          ; 00:3ABE
    ld   a,$00                      ; 00:3ABF
    ld   [$C180],a                  ; 00:3AC1
    ld   a,[W_LevelTimerHigh]       ; 00:3AC4
    and  a                          ; 00:3AC7
    jr   nz,Code003AD8              ; 00:3AC8
    ld   a,[W_LevelTimerLow]        ; 00:3ACA
    cp   $64                        ; 00:3ACD
    jr   nz,Code003AD8              ; 00:3ACF
    ld   a,$71                      ; 00:3AD1
    ld   [$DE68],a                  ; 00:3AD3
    jr   Code003AF4                 ; 00:3AD6
Code003AD8:
    ld   a,[W_LevelTimerLow]        ; 00:3AD8
    ld   e,a                        ; 00:3ADB
    ld   a,[W_LevelTimerHigh]       ; 00:3ADC
    or   e                          ; 00:3ADF
    jr   nz,Code003AF4              ; 00:3AE0
    ld   a,$00                      ; 00:3AE2
    ld   [$C181],a                  ; 00:3AE4
    ld   a,$49                      ; 00:3AE7
    ldh  [<$FFF2],a                 ; 00:3AE9
    ld   a,:Sub0B4027               ; 00:3AEB
    call SetROMBank                 ; 00:3AED
    call Sub0B4027                  ; 00:3AF0
    ret                             ; 00:3AF3

Code003AF4:
    ld   hl,W_LevelTimerLow         ; 00:3AF4
    ld   e,[hl]                     ; 00:3AF7
    inc  hl                         ; 00:3AF8
    ld   d,[hl]                     ; 00:3AF9
    dec  de                         ; 00:3AFA
    ld   [hl],d                     ; 00:3AFB
    dec  hl                         ; 00:3AFC
    ld   [hl],e                     ; 00:3AFD
    ret                             ; 00:3AFE

Sub003AFF:
    call LoadStatusBarScore         ; 00:3AFF
    ld   a,[W_ChallengeFlag]        ; 00:3B02
    cp   $01                        ; 00:3B05
    jr   z,@Challenge               ; 00:3B07
    ld   hl,$C10B                   ; 00:3B09
    call Sub003D04                  ; 00:3B0C
    ld   a,[$C170]                  ; 00:3B0F
    and  a                          ; 00:3B12
    jr   nz,@HideTimer              ; 00:3B13
    ld   a,[W_SPFlag]               ; 00:3B15
    and  a                          ; 00:3B18
    jr   nz,@SuperPlayers           ; 00:3B19
    ld   a,[W_SublevelID]           ; 00:3B1B
    cp   $34                        ; 00:3B1E
    jr   z,@HideTimer               ; 00:3B20
    jr   @Code003B2B                ; 00:3B22
@SuperPlayers:
    ld   a,[W_SublevelID]           ; 00:3B24
    cp   $62                        ; 00:3B27
    jr   z,@HideTimer               ; 00:3B29
@Code003B2B:
    ld   hl,$C111                   ; 00:3B2B
    call Sub003D0D                  ; 00:3B2E
    jr   @Return                    ; 00:3B31
@HideTimer:
    ld   hl,$C111                   ; 00:3B33
    ld   a,$F4                      ; 00:3B36
    ldi  [hl],a                     ; 00:3B38
    ldi  [hl],a                     ; 00:3B39
    ld   [hl],a                     ; 00:3B3A
@Return:
    ret                             ; 00:3B3B

@Challenge:
    ld   a,[$D32C]                  ; 00:3B3C
    cp   $00                        ; 00:3B3F
    jr   z,@Code003B85              ; 00:3B41
    cp   $70                        ; 00:3B43
    jr   nz,@Code003B4F             ; 00:3B45
    ld   a,[$D30A]                  ; 00:3B47
    ld   c,a                        ; 00:3B4A
    ld   d,$78                      ; 00:3B4B
    jr   @Code003B70                ; 00:3B4D
@Code003B4F:
    and  $0F                        ; 00:3B4F
    jr   nz,@Code003B7E             ; 00:3B51
    ld   a,[$D30A]                  ; 00:3B53
    cp   $1F                        ; 00:3B56
    jr   nz,@Code003B5D             ; 00:3B58
    ld   c,a                        ; 00:3B5A
    jr   @Code003B63                ; 00:3B5B
@Code003B5D:
    ld   b,a                        ; 00:3B5D
    ld   a,[$D30B]                  ; 00:3B5E
    xor  b                          ; 00:3B61
    ld   c,a                        ; 00:3B62
@Code003B63:
    ld   a,[$D32C]                  ; 00:3B63
    bit  4,a                        ; 00:3B66
    jr   nz,@Code003B6E             ; 00:3B68
    ld   d,$77                      ; 00:3B6A
    jr   @Code003B70                ; 00:3B6C
@Code003B6E:
    ld   d,$78                      ; 00:3B6E
@Code003B70:
    ld   hl,$C109                   ; 00:3B70
    ld   b,$05                      ; 00:3B73
@Code003B75:
    rrc  c                          ; 00:3B75
    jr   nc,@Code003B7A             ; 00:3B77
    ld   [hl],d                     ; 00:3B79
@Code003B7A:
    inc  hl                         ; 00:3B7A
    dec  b                          ; 00:3B7B
    jr   nz,@Code003B75             ; 00:3B7C
@Code003B7E:
    ld   a,[$D32C]                  ; 00:3B7E
    dec  a                          ; 00:3B81
    ld   [$D32C],a                  ; 00:3B82
@Code003B85:
    ld   a,[W_YoshiEggItemFlag]     ; 00:3B85
    and  a                          ; 00:3B88
    jr   z,@Code003B90              ; 00:3B89
    ld   a,$79                      ; 00:3B8B
    ld   [$C10E],a                  ; 00:3B8D
@Code003B90:
    ld   a,[$C170]                  ; 00:3B90
    and  a                          ; 00:3B93
    jr   nz,@HideTimer_Chal         ; 00:3B94
    ld   a,[W_SublevelID]           ; 00:3B96  This code only runs in Challenge mode, so why is it checking for the pipe intro sublevel?
    cp   $34                        ; 00:3B99  34: Original pipe intro
    jr   z,@HideTimer_Chal          ; 00:3B9B
    ld   hl,$C111                   ; 00:3B9D
    call Sub003D0D                  ; 00:3BA0
    ret                             ; 00:3BA3

@HideTimer_Chal:
    ld   hl,$C111                   ; 00:3BA4
    ld   a,$F4                      ; 00:3BA7
    ldi  [hl],a                     ; 00:3BA9
    ldi  [hl],a                     ; 00:3BAA
    ld   [hl],a                     ; 00:3BAB
    ret                             ; 00:3BAC

Data003BAD:                         ; 00:3BAD
.db $24,$12,$10,$24,$16,$14,$04,$10,\
    $12,$04,$14,$16
Data003BB9:                         ; 00:3BB9
.db $9E,$9C

Sub003BBB:
    ld   hl,$C107                   ; 00:3BBB
    call Sub003D04                  ; 00:3BBE
    ld   a,[$C170]                  ; 00:3BC1
    and  a                          ; 00:3BC4
    jr   nz,Code003BCD              ; 00:3BC5
    ld   hl,$C10B                   ; 00:3BC7
    call Sub003D0D                  ; 00:3BCA
Code003BCD:
    ld   a,[W_GameMode]             ; 00:3BCD
    cp   $07                        ; 00:3BD0
    jr   z,Code003BD9               ; 00:3BD2
    ld   hl,$C581                   ; 00:3BD4
    jr   Code003BDC                 ; 00:3BD7
Code003BD9:
    ld   hl,$C3B0                   ; 00:3BD9
Code003BDC:
    ldh  a,[<H_CameraXHigh]         ; 00:3BDC
    ld   b,a                        ; 00:3BDE
    ldh  a,[<H_CameraXLow]          ; 00:3BDF
    ld   c,a                        ; 00:3BE1
    ldi  a,[hl]                     ; 00:3BE2
    add  $10                        ; 00:3BE3
    ld   e,a                        ; 00:3BE5
    ld   a,[hl]                     ; 00:3BE6
    adc  $00                        ; 00:3BE7
    ld   d,a                        ; 00:3BE9
    ld   a,e                        ; 00:3BEA
    sub  c                          ; 00:3BEB
    ld   e,a                        ; 00:3BEC
    ld   a,d                        ; 00:3BED
    sbc  b                          ; 00:3BEE
    cp   $01                        ; 00:3BEF
    jr   nc,Code003BF9              ; 00:3BF1
    ld   a,e                        ; 00:3BF3
    cp   $B0                        ; 00:3BF4
    jr   nc,Code003BF9              ; 00:3BF6
    ret                             ; 00:3BF8

Code003BF9:
    dec  hl                         ; 00:3BF9
    ld   a,[W_GameMode]             ; 00:3BFA
    cp   $07                        ; 00:3BFD
    jr   z,Code003C06               ; 00:3BFF
    ld   bc,$C501                   ; 00:3C01
    jr   Code003C09                 ; 00:3C04
Code003C06:
    ld   bc,H_PlayerXLow            ; 00:3C06
Code003C09:
    ld   a,[bc]                     ; 00:3C09
    inc  bc                         ; 00:3C0A
    ld   e,a                        ; 00:3C0B
    ldi  a,[hl]                     ; 00:3C0C
    sub  e                          ; 00:3C0D
    ld   e,a                        ; 00:3C0E
    ld   a,[bc]                     ; 00:3C0F
    ld   d,a                        ; 00:3C10
    ld   b,$00                      ; 00:3C11
    ld   a,[hl]                     ; 00:3C13
    sbc  d                          ; 00:3C14
    ld   d,a                        ; 00:3C15
    jr   c,Code003C2F               ; 00:3C16
Code003C18:
    inc  b                          ; 00:3C18
    ld   a,e                        ; 00:3C19
    sub  $40                        ; 00:3C1A
    ld   e,a                        ; 00:3C1C
    ld   a,d                        ; 00:3C1D
    sbc  $00                        ; 00:3C1E
    ld   d,a                        ; 00:3C20
    jr   nc,Code003C18              ; 00:3C21
    ld   a,b                        ; 00:3C23
    cp   $2B                        ; 00:3C24
    jr   c,Code003C2A               ; 00:3C26
    ld   a,$2B                      ; 00:3C28
Code003C2A:
    add  $78                        ; 00:3C2A
    ld   b,a                        ; 00:3C2C
    jr   Code003C4E                 ; 00:3C2D
Code003C2F:
    ld   a,d                        ; 00:3C2F
    xor  $FF                        ; 00:3C30
    ld   d,a                        ; 00:3C32
    ld   a,e                        ; 00:3C33
    xor  $FF                        ; 00:3C34
    ld   e,a                        ; 00:3C36
    inc  de                         ; 00:3C37
Code003C38:
    inc  b                          ; 00:3C38
    ld   a,e                        ; 00:3C39
    sub  $40                        ; 00:3C3A
    ld   e,a                        ; 00:3C3C
    ld   a,d                        ; 00:3C3D
    sbc  $00                        ; 00:3C3E
    ld   d,a                        ; 00:3C40
    jr   nc,Code003C38              ; 00:3C41
    ld   a,b                        ; 00:3C43
    cp   $23                        ; 00:3C44
    jr   c,Code003C4A               ; 00:3C46
    ld   b,$23                      ; 00:3C48
Code003C4A:
    ld   a,$20                      ; 00:3C4A
    sub  b                          ; 00:3C4C
    ld   b,a                        ; 00:3C4D
Code003C4E:
    ld   a,[W_GameMode]             ; 00:3C4E
    cp   $07                        ; 00:3C51
    jr   z,Code003C77               ; 00:3C53
    ld   a,[$C589]                  ; 00:3C55
    cp   $03                        ; 00:3C58
    jr   z,Code003CCD               ; 00:3C5A
    cp   $04                        ; 00:3C5C
    jr   z,Code003CCD               ; 00:3C5E
    cp   $11                        ; 00:3C60
    jr   z,Code003CCD               ; 00:3C62
    cp   $01                        ; 00:3C64
    jr   z,Code003C83               ; 00:3C66
    ld   a,[$C58A]                  ; 00:3C68
    cp   $01                        ; 00:3C6B
    jr   z,Code003C7D               ; 00:3C6D
    cp   $09                        ; 00:3C6F
    jr   z,Code003C7D               ; 00:3C71
    cp   $0E                        ; 00:3C73
    jr   z,Code003C7D               ; 00:3C75
Code003C77:
    ld   a,$10                      ; 00:3C77
    ldh  [<$FF97],a                 ; 00:3C79
    jr   Code003C87                 ; 00:3C7B
Code003C7D:
    ld   a,$11                      ; 00:3C7D
    ldh  [<$FF97],a                 ; 00:3C7F
    jr   Code003C87                 ; 00:3C81
Code003C83:
    ld   a,$0F                      ; 00:3C83
    ldh  [<$FF97],a                 ; 00:3C85
Code003C87:
    push bc                         ; 00:3C87
    ld   a,[$C58B]                  ; 00:3C88
    ld   c,a                        ; 00:3C8B
    ld   a,[$C58D]                  ; 00:3C8C
    add  c                          ; 00:3C8F
    ld   c,a                        ; 00:3C90
    sla  a                          ; 00:3C91
    add  c                          ; 00:3C93
    ld   c,a                        ; 00:3C94
    ld   b,$00                      ; 00:3C95
    ld   hl,Data003BAD              ; 00:3C97
    add  hl,bc                      ; 00:3C9A
    pop  bc                         ; 00:3C9B
    ld   c,[hl]                     ; 00:3C9C
    inc  hl                         ; 00:3C9D
    ld   e,l                        ; 00:3C9E
    ld   d,h                        ; 00:3C9F
    ld   a,[$DA6A]                  ; 00:3CA0
    cpl                             ; 00:3CA3
    inc  a                          ; 00:3CA4
    add  c                          ; 00:3CA5
    ld   c,a                        ; 00:3CA6
    ld   a,[W_GameMode]             ; 00:3CA7
    cp   $07                        ; 00:3CAA
    jr   nz,Code003CB3              ; 00:3CAC
    ld   de,Data003BB9              ; 00:3CAE
    ld   c,$23                      ; 00:3CB1
Code003CB3:
    ld   hl,$C030                   ; 00:3CB3
    ldh  a,[<$FF97]                 ; 00:3CB6
    ldi  [hl],a                     ; 00:3CB8
    ld   [hl],b                     ; 00:3CB9
    inc  hl                         ; 00:3CBA
    ld   a,[de]                     ; 00:3CBB
    ldi  [hl],a                     ; 00:3CBC
    inc  de                         ; 00:3CBD
    ld   [hl],c                     ; 00:3CBE
    inc  hl                         ; 00:3CBF
    ld   a,b                        ; 00:3CC0
    add  $08                        ; 00:3CC1
    ld   b,a                        ; 00:3CC3
    ldh  a,[<$FF97]                 ; 00:3CC4
    ldi  [hl],a                     ; 00:3CC6
    ld   [hl],b                     ; 00:3CC7
    inc  hl                         ; 00:3CC8
    ld   a,[de]                     ; 00:3CC9
    ldi  [hl],a                     ; 00:3CCA
    ld   [hl],c                     ; 00:3CCB
    ret                             ; 00:3CCC

Code003CCD:
    ld   a,b                        ; 00:3CCD
    add  $04                        ; 00:3CCE
    ld   b,a                        ; 00:3CD0
    ld   a,[$DA6A]                  ; 00:3CD1
    cpl                             ; 00:3CD4
    inc  a                          ; 00:3CD5
    add  $04                        ; 00:3CD6
    ld   c,a                        ; 00:3CD8
    ld   a,[$C58B]                  ; 00:3CD9
    xor  $02                        ; 00:3CDC
    swap a                          ; 00:3CDE
    or   c                          ; 00:3CE0
    ld   c,a                        ; 00:3CE1
    ld   hl,$C030                   ; 00:3CE2
    ld   [hl],$10                   ; 00:3CE5
    inc  hl                         ; 00:3CE7
    ld   [hl],b                     ; 00:3CE8
    inc  hl                         ; 00:3CE9
    ld   [hl],$18                   ; 00:3CEA
    inc  hl                         ; 00:3CEC
    ld   [hl],c                     ; 00:3CED
    ret                             ; 00:3CEE

LoadStatusBarScore:
    ld   de,W_PlayerScoreLow        ; 00:3CEF
    call LoadScoreTileBuffer        ; 00:3CF2
    ld   de,W_ScoreTileBuffer       ; 00:3CF5
    ld   hl,$C101                   ; 00:3CF8
    ld   b,$06                      ; 00:3CFB
@Loop:
    ld   a,[de]                     ; 00:3CFD \ load score to status bar buffer
    ldi  [hl],a                     ; 00:3CFE
    inc  de                         ; 00:3CFF
    dec  b                          ; 00:3D00
    jr   nz,@Loop                   ; 00:3D01 /
    ret                             ; 00:3D03

Sub003D04:
    ld   a,[W_PlayerCoins]          ; 00:3D04
    ldh  [<$FFA5],a                 ; 00:3D07
    call HexToDec8bit               ; 00:3D09
    ret                             ; 00:3D0C

Sub003D0D:
    ld   a,[W_LevelTimerLow]        ; 00:3D0D
    ldh  [<$FFA5],a                 ; 00:3D10
    ld   a,[W_LevelTimerHigh]       ; 00:3D12
    ldh  [<$FFA4],a                 ; 00:3D15
    call HexToDec16bit              ; 00:3D17
    ret                             ; 00:3D1A

Sub003D1B:
    ldh  a,[<H_GameState]           ; 00:3D1B
    cp   $01                        ; 00:3D1D
    ret  z                          ; 00:3D1F
    cp   $04                        ; 00:3D20
    ret  z                          ; 00:3D22
    cp   $17                        ; 00:3D23
    ret  z                          ; 00:3D25
    cp   $2D                        ; 00:3D26
    ret  z                          ; 00:3D28
    cp   $2C                        ; 00:3D29
    ret  z                          ; 00:3D2B
    cp   $1C                        ; 00:3D2C
    ret  z                          ; 00:3D2E
    cp   $14                        ; 00:3D2F
    ret  z                          ; 00:3D31
    cp   $1A                        ; 00:3D32
    ret  z                          ; 00:3D34
    cp   $18                        ; 00:3D35
    ret  z                          ; 00:3D37
    cp   $38                        ; 00:3D38
    ret  z                          ; 00:3D3A
    xor  a                          ; 00:3D3B
    ldh  [<VBK],a                   ; 00:3D3C
    ld   de,$C100                   ; 00:3D3E
    ld   a,d                        ; 00:3D41
    ldh  [<HDMA1],a                 ; 00:3D42
    ld   a,e                        ; 00:3D44
    ldh  [<HDMA2],a                 ; 00:3D45
    ld   a,$98                      ; 00:3D47
    ldh  [<HDMA3],a                 ; 00:3D49
    ld   a,$00                      ; 00:3D4B
    ldh  [<HDMA4],a                 ; 00:3D4D
    ld   a,$01                      ; 00:3D4F
    ldh  [<HDMA5],a                 ; 00:3D51
    ret                             ; 00:3D53

HexToDec24bit:
; subroutine: Convert 24-bit big-endian value in $FFA3 to 6-digit decimal tiles in [hl]
    ldh  a,[<$FFA5]                 ; 00:3D54
    ld   e,a                        ; 00:3D56
    ldh  a,[<$FFA4]                 ; 00:3D57
    ld   d,a                        ; 00:3D59
    ldh  a,[<$FFA3]                 ; 00:3D5A
    ld   c,a                        ; 00:3D5C
    ld   b,$00                      ; 00:3D5D  output digit = 0
@Loop_Subtract100000:
    ld   a,e                        ; 00:3D5F
    sub  $A0                        ; 00:3D60
    ld   e,a                        ; 00:3D62
    ld   a,d                        ; 00:3D63
    sbc  $86                        ; 00:3D64
    ld   d,a                        ; 00:3D66
    ld   a,c                        ; 00:3D67
    sbc  $01                        ; 00:3D68
    ld   c,a                        ; 00:3D6A
    jr   c,@Loop_Subtract100000_End ; 00:3D6B
    ld   a,e                        ; 00:3D6D
    ldh  [<$FFA5],a                 ; 00:3D6E
    ld   a,d                        ; 00:3D70
    ldh  [<$FFA4],a                 ; 00:3D71
    ld   a,c                        ; 00:3D73
    ldh  [<$FFA3],a                 ; 00:3D74
    inc  b                          ; 00:3D76  increment output digit
    jr   @Loop_Subtract100000       ; 00:3D77
@Loop_Subtract100000_End:
    ld   a,b                        ; 00:3D79
    add  $D0                        ; 00:3D7A  output tile ID = digit + $D0
    ldi  [hl],a                     ; 00:3D7C
    ldh  a,[<$FFA5]                 ; 00:3D7D
    ld   e,a                        ; 00:3D7F
    ldh  a,[<$FFA4]                 ; 00:3D80
    ld   d,a                        ; 00:3D82
    ldh  a,[<$FFA3]                 ; 00:3D83
    ld   c,a                        ; 00:3D85
    ld   b,$00                      ; 00:3D86
@Loop_Subtract10000:
    ld   a,e                        ; 00:3D88
    sub  $10                        ; 00:3D89
    ld   e,a                        ; 00:3D8B
    ld   a,d                        ; 00:3D8C
    sbc  $27                        ; 00:3D8D
    ld   d,a                        ; 00:3D8F
    ld   a,c                        ; 00:3D90
    sbc  $00                        ; 00:3D91
    ld   c,a                        ; 00:3D93
    jr   c,@Loop_Subtract10000_End  ; 00:3D94
    ld   a,e                        ; 00:3D96
    ldh  [<$FFA5],a                 ; 00:3D97
    ld   a,d                        ; 00:3D99
    ldh  [<$FFA4],a                 ; 00:3D9A
    ld   a,c                        ; 00:3D9C
    ldh  [<$FFA3],a                 ; 00:3D9D
    inc  b                          ; 00:3D9F
    jr   @Loop_Subtract10000        ; 00:3DA0
@Loop_Subtract10000_End:
    ld   a,b                        ; 00:3DA2
    add  $D0                        ; 00:3DA3
    ldi  [hl],a                     ; 00:3DA5
    ldh  a,[<$FFA5]                 ; 00:3DA6
    ld   e,a                        ; 00:3DA8
    ldh  a,[<$FFA4]                 ; 00:3DA9
    ld   d,a                        ; 00:3DAB
    ld   b,$00                      ; 00:3DAC
@Loop_Subtract1000:
    ld   a,e                        ; 00:3DAE
    sub  $E8                        ; 00:3DAF
    ld   e,a                        ; 00:3DB1
    ld   a,d                        ; 00:3DB2
    sbc  $03                        ; 00:3DB3
    ld   d,a                        ; 00:3DB5
    jr   c,@Loop_Subtract1000_End   ; 00:3DB6
    ld   a,e                        ; 00:3DB8
    ldh  [<$FFA5],a                 ; 00:3DB9
    ld   a,d                        ; 00:3DBB
    ldh  [<$FFA4],a                 ; 00:3DBC
    inc  b                          ; 00:3DBE
    jr   @Loop_Subtract1000         ; 00:3DBF
@Loop_Subtract1000_End:
    ld   a,b                        ; 00:3DC1
    add  $D0                        ; 00:3DC2
    ldi  [hl],a                     ; 00:3DC4

HexToDec16bit:
; subroutine: Convert 16-bit big-endian value in $FFA4 to 3-digit decimal tiles in [hl]
; 24-bit conversion also continues here
    ldh  a,[<$FFA5]                 ; 00:3DC5
    ld   e,a                        ; 00:3DC7
    ldh  a,[<$FFA4]                 ; 00:3DC8
    ld   d,a                        ; 00:3DCA
    ld   b,$00                      ; 00:3DCB
@Loop_Subtract100:
    ld   a,e                        ; 00:3DCD
    sub  $64                        ; 00:3DCE
    ld   e,a                        ; 00:3DD0
    ld   a,d                        ; 00:3DD1
    sbc  $00                        ; 00:3DD2
    ld   d,a                        ; 00:3DD4
    jr   c,@Loop_Subtract100_End    ; 00:3DD5
    ld   a,e                        ; 00:3DD7
    ldh  [<$FFA5],a                 ; 00:3DD8
    ld   a,d                        ; 00:3DDA
    ldh  [<$FFA4],a                 ; 00:3DDB
    inc  b                          ; 00:3DDD
    jr   @Loop_Subtract100          ; 00:3DDE
@Loop_Subtract100_End:
    ld   a,b                        ; 00:3DE0
    add  $D0                        ; 00:3DE1
    ldi  [hl],a                     ; 00:3DE3

HexToDec8bit:
; subroutine: Convert 8-bit value in $FFA5 to 2-digit decimal tiles in [hl]
; 16-bit and 24-bit conversion also continue here
    ldh  a,[<$FFA5]                 ; 00:3DE4
    ld   b,$00                      ; 00:3DE6
@Loop_Subtract10:
    sub  $0A                        ; 00:3DE8
    jr   c,@Loop_Subtract10_End     ; 00:3DEA
    ldh  [<$FFA5],a                 ; 00:3DEC
    inc  b                          ; 00:3DEE
    jr   @Loop_Subtract10           ; 00:3DEF
@Loop_Subtract10_End:
    ld   a,b                        ; 00:3DF1
    add  $D0                        ; 00:3DF2
    ldi  [hl],a                     ; 00:3DF4
    ldh  a,[<$FFA5]                 ; 00:3DF5
    add  $D0                        ; 00:3DF7
    ld   [hl],a                     ; 00:3DF9  set final tile to 0
    ret                             ; 00:3DFA

LoadScoreTileBuffer:
; subroutine: Convert 24-bit value in [DE] to 6-digit decimal tiles in W_ScoreTileBuffer
    ld   a,[de]                     ; 00:3DFB \ load value from [de] (little-endian)
    ldh  [<$FFA5],a                 ; 00:3DFC | into $FFA3 (big-endian)
    inc  de                         ; 00:3DFE |
    ld   a,[de]                     ; 00:3DFF |
    ldh  [<$FFA4],a                 ; 00:3E00 |
    inc  de                         ; 00:3E02 |
    ld   a,[de]                     ; 00:3E03 |
    ldh  [<$FFA3],a                 ; 00:3E04 /
    ld   hl,W_ScoreTileBuffer       ; 00:3E06
    call HexToDec24bit              ; 00:3E09
    inc  hl                         ; 00:3E0C
    ld   [hl],$D0                   ; 00:3E0D
    ld   hl,W_ScoreTileBuffer       ; 00:3E0F
    ld   b,$06                      ; 00:3E12
@Loop_HideLeadingZeros:             ;         \ Replace up to 6 "0" tiles with empty
    ld   a,[hl]                     ; 00:3E14
    cp   $D0                        ; 00:3E15  D0: "0"
    jr   nz,@Return                 ; 00:3E17
    ld   [hl],$F4                   ; 00:3E19  F4: empty tile
    inc  hl                         ; 00:3E1B
    dec  b                          ; 00:3E1C
    jr   nz,@Loop_HideLeadingZeros  ; 00:3E1D /
@Return:
    ret                             ; 00:3E1F

AwardCutsceneTilemapPtrs:           ; 00:3E20
.dl Ti_ToadAward, Ti_MarioAward, Ti_PeachAward, Ti_BowserAward,\
    Ti_YoshiAward

Code003E2F:
    ld   a,$01                      ; 00:3E2F
    ldh  [<VBK],a                   ; 00:3E31
    ldh  a,[<$FFC4]                 ; 00:3E33
    and  $F0                        ; 00:3E35
    swap a                          ; 00:3E37
    or   $90                        ; 00:3E39
    ld   d,a                        ; 00:3E3B
    ldh  a,[<$FFC4]                 ; 00:3E3C
    and  $0F                        ; 00:3E3E
    swap a                          ; 00:3E40
    ld   e,a                        ; 00:3E42
    push de                         ; 00:3E43
    ld   a,[W_AwardToGive]          ; 00:3E44
    dec  a                          ; 00:3E47
    ld   c,a                        ; 00:3E48
    sla  a                          ; 00:3E49
    add  c                          ; 00:3E4B
    ld   c,a                        ; 00:3E4C
    ld   b,$00                      ; 00:3E4D
    ld   hl,AwardCutsceneTilemapPtrs; 00:3E4F
    add  hl,bc                      ; 00:3E52
    ld   c,[hl]                     ; 00:3E53
    inc  hl                         ; 00:3E54
    ld   b,[hl]                     ; 00:3E55
    inc  hl                         ; 00:3E56
    ld   a,[hl]                     ; 00:3E57
    ld   [ROMBANK],a                ; 00:3E58
    ld   a,[$C164]                  ; 00:3E5B
    ld   l,a                        ; 00:3E5E
    ld   a,[$C165]                  ; 00:3E5F
    ld   h,a                        ; 00:3E62
    add  hl,bc                      ; 00:3E63
    push hl                         ; 00:3E64
    ld   bc,$0014                   ; 00:3E65
    call CopyBytes                  ; 00:3E68
    xor  a                          ; 00:3E6B
    ldh  [<VBK],a                   ; 00:3E6C
    pop  hl                         ; 00:3E6E
    ld   bc,$FE98                   ; 00:3E6F
    add  hl,bc                      ; 00:3E72
    pop  de                         ; 00:3E73
    ld   bc,$0014                   ; 00:3E74
    call CopyBytes                  ; 00:3E77
    ld   a,[$C164]                  ; 00:3E7A
    ld   l,a                        ; 00:3E7D
    ld   a,[$C165]                  ; 00:3E7E
    ld   h,a                        ; 00:3E81
    ld   de,$FFEC                   ; 00:3E82
    add  hl,de                      ; 00:3E85
    ld   a,l                        ; 00:3E86
    ld   [$C164],a                  ; 00:3E87
    ld   a,h                        ; 00:3E8A
    ld   [$C165],a                  ; 00:3E8B
    ldh  a,[<$FFC4]                 ; 00:3E8E
    sub  $02                        ; 00:3E90
    cp   $80                        ; 00:3E92
    jr   nc,Code003E98              ; 00:3E94
    ld   a,$BE                      ; 00:3E96
Code003E98:
    ldh  [<$FFC4],a                 ; 00:3E98
    xor  a                          ; 00:3E9A
    ld   [$C172],a                  ; 00:3E9B
    ret                             ; 00:3E9E

; 16x16 tile numbers for each extended object
Obj200_Tilemap:                     ; 00:3E9F
.db $05,$07,$06,$08
Obj207_Tilemap:                     ; 00:3EA3
.db $22,$07,$23,$08
Obj204_Tilemap:                     ; 00:3EA7
.db $28,$29,$2A,$2B
Obj205_Tilemap:                     ; 00:3EAB
.db $07,$2C,$2D
Obj201_Tilemap:                     ; 00:3EAE
.db $09,$0C,$0A,$0D,$0B,$0E
Obj202_Tilemap:                     ; 00:3EB4
.db $0F,$10,$11
Obj203_Tilemap:                     ; 00:3EB7
.db $03,$03,$13,$03,$13,$14,$12,$14,\
    $15,$03,$17,$16,$03,$03,$17
Obj206_Tilemap:                     ; 00:3EC6
.db $32,$33,$35,$34
Obj208_Tilemap:                     ; 00:3ECA
.db $48,$49,$4B
Obj209_Tilemap:                     ; 00:3ECD
.db $4A,$4B
Obj20A_Tilemap:                     ; 00:3ECF
.db $46,$47
Obj20B_Tilemap:                     ; 00:3ED1
.db $44,$4D,$45
Obj20C_Tilemap:                     ; 00:3ED4
.db $4F,$50,$51
Obj20D_Tilemap:                     ; 00:3ED7
.db $52,$53
Obj20E_Tilemap:                     ; 00:3ED9
.db $90,$91,$92
Obj20F_Tilemap:                     ; 00:3EDC
.db $8F,$94,$94
