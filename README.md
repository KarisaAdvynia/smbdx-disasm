# Super Mario Bros. Deluxe (U V1.1) disassembly

For assembling with [WLA DX](https://github.com/vhelin/wla-dx). To assemble:
```
wla-gb smbdx.asm
wlalink smbdx-linkfile smbdx-disasm.gbc
```

Work in progress. Produces an exact match for the 0x10 banks that contain code (00, 02-04, 06-0B, 11, 13-15, 1D, 1F), the 6 banks that contain level data (05, 0C, 0D, 10, 12, 32), and certain graphics banks (01, 0E, 1A, 20, 26-2B), with the exception of the auto-calculated checksum at $014E. Most ROM pointers have been replaced by labels, but not all.

Remaining regions:
- Bank 1D: Music. While this mixed code/data bank does assemble to an exact match, much of this bank's data seems to contain pointers, in a yet-to-be-documented format.
- Many graphics banks. Many data pointers are unconfirmed, so their `.incbin`s haven't been included yet.

## About data files
This repository does not include in-game data files (graphics, tilemaps, etc), which must be extracted from the vanilla game before assembling. A script is provided to do so:
- Place the vanilla ROM in the directory containing the `smbdx-disasm` directory
    - Optionally: name the vanilla ROM `smbdx.gbc`. If the vanilla ROM is the only .gbc file in the directory, it will be auto-detected, but if there are multiple .gbc files, this is required.
- Run `exportbin.py` (in `scripts`) to create the `data` folder.

## Vanilla ROM hashes
- SHA1: `07295CD60AE44183EBECB013930727E0404169D5`
- SHA256: `DB81DD4ACBD0C7A3B9004F169EE278450C764C842AE777ABD28073FBEDF4078B`
- MD5: `1FD75C2B798C04ACD4B99AD2F1006280`

## See also
- [Super Mario Bros. Deluxe (U V1.1) documentation](https://docs.google.com/spreadsheets/d/19fShYqArSSwr_LNUHhCVjaquUkKdN37tw3Fd13LUB5c/) - Documentation spreadsheet, including ROM/RAM maps, various IDs, and other info
