; Hardware registers
.define JOYP                  $FF00
.define SB                    $FF01
.define SC                    $FF02
.define DIV                   $FF04
.define TIMA                  $FF05
.define TMA                   $FF06
.define TAC                   $FF07
.define IF                    $FF0F
.define NR10                  $FF10
.define NR11                  $FF11
.define NR12                  $FF12
.define NR13                  $FF13
.define NR14                  $FF14
.define NR21                  $FF16
.define NR22                  $FF17
.define NR23                  $FF18
.define NR24                  $FF19
.define NR30                  $FF1A
.define NR31                  $FF1B
.define NR32                  $FF1C
.define NR33                  $FF1D
.define NR34                  $FF1E
.define NR41                  $FF20
.define NR42                  $FF21
.define NR43                  $FF22
.define NR44                  $FF23
.define NR50                  $FF24
.define NR51                  $FF25
.define NR52                  $FF26
.define LCDC                  $FF40
.define STAT                  $FF41
.define SCY                   $FF42
.define SCX                   $FF43
.define LY                    $FF44
.define LYC                   $FF45
.define DMA                   $FF46
.define BGP                   $FF47
.define OBP0                  $FF48
.define OBP1                  $FF49
.define WY                    $FF4A
.define WX                    $FF4B
.define KEY1                  $FF4D
.define VBK                   $FF4F
.define HDMA1                 $FF51
.define HDMA2                 $FF52
.define HDMA3                 $FF53
.define HDMA4                 $FF54
.define HDMA5                 $FF55
.define RP                    $FF56
.define BGPI                  $FF68
.define BGPD                  $FF69
.define OBPI                  $FF6A
.define OBPD                  $FF6B
.define OPRI                  $FF6C
.define SVBK                  $FF70
.define PCM12                 $FF76
.define PCM34                 $FF77
.define IE                    $FFFF

; Cartridge registers
.define SRAMENABLE            $0000
.define ROMBANK               $2100
.define SRAMBANK              $4100

; HRAM
.define H_DMATransferOAM      $FF80
.define H_ButtonsHeld         $FF8B
.define H_ButtonsPressed      $FF8C
.define H_PlayerXLow          $FFA7
.define H_PlayerXHigh         $FFA8
.define H_PlayerYLow          $FFA9
.define H_PlayerYHigh         $FFAA
.define H_PlAnimPtrLow        $FFAF
.define H_PlAnimPtrHigh       $FFB0
.define H_GameState           $FFB5
.define H_GameSubstate        $FFB6
.define H_GlobalTimer         $FFB7
.define H_CameraXLow          $FFB8
.define H_CameraXHigh         $FFB9
.define H_CameraY             $FFBA
.define H_PlInitY_SubLvType   $FFC2 ; high digit is player initial Y, low digit is sublevel type

; WRAM bank 0
.define W_OAMBuffer           $C000
.define W_NonGBCError         $C0C0
.define W_SPFlag              $C160
.define W_SubLvScreenCount    $C161
.define W_SublevelID          $C162
.define W_LevelID             $C163
.define W_HardFlag            $C166
.define W_SaveFileNum         $C16B
.define W_PlayerScoreLow      $C17A
.define W_PlayerScoreMid      $C17B
.define W_PlayerScoreHigh     $C17C
.define W_LevelTimerLow       $C17D
.define W_LevelTimerHigh      $C17E
.define W_PlayerLives         $C17F
.define W_RedCoinsCurrent     $C188
.define W_RedCoinsBest        $C189
.define W_ChalLvHiScoreLow    $C18A
.define W_ChalLvHiScoreMid    $C18B
.define W_ChalLvHiScoreHigh   $C18C
.define W_HighScoreMedalFlag  $C18D
.define W_ChalUnlockFlags     $C18E
.define W_ChalUnlockFlags_x_2 $C18F
.define W_ChalUnlockFlags_x_3 $C190
.define W_ChalUnlockFlags_x_4 $C191
.define W_ModeUnlockFlags     $C192
.define W_YoshiEggItemFlag    $C193
.define W_YoshiEggMedalFlag   $C194
.define W_ChalMedalsToAdd     $C197
.define W_TotalRedCoinMedals  $C198
.define W_TotalHighScMedals   $C19C
.define W_TotalYoshiEggMedals $C19D
.define W_ChalLvTargetScLow   $C19E
.define W_ChalLvTargetScMid   $C19F
.define W_ChalLvTargetScHigh  $C1A0
.define W_ChalTotalScoreLow   $C1A1
.define W_ChalTotalScoreMid   $C1A2
.define W_ChalTotalScoreHigh  $C1A3
.define W_ChalDispTotalScLow  $C1A4
.define W_ChalDispTotalScMid  $C1A5
.define W_ChalDispTotalScHigh $C1A6
.define W_GameMode            $C1A8
.define W_AwardToGive         $C1B0
.define W_PlayerState         $C1C1
.define W_PlayerSize          $C1C5
.define W_PlayerFireFlag      $C1CE
.define W_PlayerWarpSubstate  $C1D3
.define W_PitScreenExitFlag   $C1E6
.define W_PlayerCoins         $C1F2
.define W_ChallengeFlag       $C283
.define W_ChalScoreBarPixels  $C35D
.define W_CurrentPlayer       $C383
.define W_RaceHeaderFlags     $C3A2
.define W_ScoreTileBuffer     $C34F
.define W_AlbumUnlockFlags    $C429
.define W_AlbumViewFlags      $C42D

; WRAM bank 1
.enum $D000
W_SpriteStatus       dsb $0F        ; $1:D000
W_SpriteID           dsb $0F        ; $1:D00F
W_SpriteXLow         dsb $0F        ; $1:D01E
W_SpriteXHigh        dsb $0F        ; $1:D02D
W_SpriteYLow         dsb $0F        ; $1:D03C
W_SpriteYHigh        dsb $0F        ; $1:D04B
W_SpriteXSpeed       dsb $0F        ; $1:D05A
W_SpriteYSpeed       dsb $0F        ; $1:D069
W_SpriteD078         dsb $0F        ; $1:D078
W_SpriteD087         dsb $0F        ; $1:D087
W_SpriteD096         dsb $0F        ; $1:D096
W_SpriteD0A5         dsb $0F        ; $1:D0A5
W_SpriteD0B4         dsb $0F        ; $1:D0B4
W_SpriteD0C3         dsb $0F        ; $1:D0C3
W_SpriteD0D2         dsb $0F        ; $1:D0D2
W_SpriteD0E1         dsb $0F        ; $1:D0E1
W_SpriteD0F0         dsb $0F        ; $1:D0F0
W_SpriteD0FF         dsb $0F        ; $1:D0FF
W_SpriteD10E         dsb $0F        ; $1:D10E
W_SpriteD11D         dsb $0F        ; $1:D11D
W_SpriteD12C         dsb $0F        ; $1:D12C
W_SpriteD13B         dsb $0F        ; $1:D13B
W_SpriteD14A         dsb $0F        ; $1:D14A
W_SpriteD159         dsb $0F        ; $1:D159
W_SpriteD168         dsb $0F        ; $1:D168
W_SpriteD177         dsb $0F        ; $1:D177
W_SpriteSubstate     dsb $0F        ; $1:D186
W_SpriteD195         dsb $0F        ; $1:D195
W_SpriteD1A4         dsb $0F        ; $1:D1A4
W_SpriteD1B3         dsb $0F        ; $1:D1B3
W_SpriteD1C2         dsb $0F        ; $1:D1C2
W_SpriteD1D1         dsb $0F        ; $1:D1D1
W_SpriteD1E0         dsb $0F        ; $1:D1E0
W_SpriteD1EF         dsb $0F        ; $1:D1EF
W_SpriteD1FE         dsb $0F        ; $1:D1FE
W_SpriteD20D         dsb $0F        ; $1:D20D
W_SpriteD21C         dsb $0F        ; $1:D21C
W_SpriteD22B         dsb $0F        ; $1:D22B
W_SpriteD23A         dsb $0F        ; $1:D23A
W_SpriteD249         dsb $0F        ; $1:D249
W_SpriteD258         dsb $0F        ; $1:D258
W_SpriteD267         dsb $0F        ; $1:D267
W_SpriteD276         dsb $0F        ; $1:D276
W_SpriteD285         dsb $0F        ; $1:D285
W_SpriteD294         dsb $0F        ; $1:D294
W_SpriteD2A3         dsb $0F        ; $1:D2A3
W_SpriteD2B2         dsb $0F        ; $1:D2B2
W_SpriteD2C1         dsb $0F        ; $1:D2C1
W_SpriteD2D0         dsb $0F        ; $1:D2D0
.ende

.define W_TiUpBuffer          $DF01
.define W_PalBuffer           $DF80
.define W_PalBufferSpr        $DFC0

; WRAM bank 2-3
.define W_SubLvSprTilemap     $D000

; WRAM bank 6-7
.define W_SubLv16x16Tilemap   $D000
