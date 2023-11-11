; Hardware registers
.define JOYP              $FF00
.define SB                $FF01
.define SC                $FF02
.define DIV               $FF04
.define TIMA              $FF05
.define TMA               $FF06
.define TAC               $FF07
.define IF                $FF0F
.define NR10              $FF10
.define NR11              $FF11
.define NR12              $FF12
.define NR13              $FF13
.define NR14              $FF14
.define NR21              $FF16
.define NR22              $FF17
.define NR23              $FF18
.define NR24              $FF19
.define NR30              $FF1A
.define NR31              $FF1B
.define NR32              $FF1C
.define NR33              $FF1D
.define NR34              $FF1E
.define NR41              $FF20
.define NR42              $FF21
.define NR43              $FF22
.define NR44              $FF23
.define NR50              $FF24
.define NR51              $FF25
.define NR52              $FF26
.define LCDC              $FF40
.define STAT              $FF41
.define SCY               $FF42
.define SCX               $FF43
.define LY                $FF44
.define LYC               $FF45
.define DMA               $FF46
.define BGP               $FF47
.define OBP0              $FF48
.define OBP1              $FF49
.define WY                $FF4A
.define WX                $FF4B
.define KEY1              $FF4D
.define VBK               $FF4F
.define HDMA1             $FF51
.define HDMA2             $FF52
.define HDMA3             $FF53
.define HDMA4             $FF54
.define HDMA5             $FF55
.define RP                $FF56
.define BGPI              $FF68
.define BGPD              $FF69
.define OBPI              $FF6A
.define OBPD              $FF6B
.define OPRI              $FF6C
.define SVBK              $FF70
.define PCM12             $FF76
.define PCM34             $FF77
.define IE                $FFFF

; Cartridge registers
.define ROMBANK           $2100
.define SRAMBANK          $4100

; HRAM
.define H_DMATransfer     $FF80
.define H_ButtonFlags     $FF8B
.define H_GameState       $FFB5
.define H_GameSubstate    $FFB6
.define H_PlayerY_SLvType $FFC2

; WRAM bank 0
.define W_SPFlag          $C160
.define W_SublevelID      $C162
.define W_LevelID         $C163
.define W_HardFlag        $C166
.define W_GameMode        $C1A8
.define W_PlayerState     $C1C1

; WRAM bank 1
.enum $D000
W_SpriteStatus       dsb $0F        ; $1:D000
W_SpriteID           dsb $0F        ; $1:D00F
W_SpriteXLow         dsb $0F        ; $1:D01E
W_SpriteXHigh        dsb $0F        ; $1:D02D
W_SpriteYLow         dsb $0F        ; $1:D03C
W_SpriteYHigh        dsb $0F        ; $1:D04B
W_SpriteXSpd         dsb $0F        ; $1:D05A
W_SpriteYSpd         dsb $0F        ; $1:D069
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
.ende
