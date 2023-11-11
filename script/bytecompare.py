import os

from _gbfile import seek_GB

def bytecompare(source, dest, searchbanks=None):
    mismatchregions = []
##    if searchregions is None:
##        searchregions = [(0, min(os.path.getsize(source), os.path.getsize(dest)))]

    with open(source, "rb") as f0, open(dest, "rb") as f1:
        for bank in searchbanks:
            start = bank << 16 | (0x4000 if bank != 0 else 0)
            f0.seek(bank * 0x4000)
            f1.seek(bank * 0x4000)

            for i in range(start, start + 0x4000):
                nextbyte0 = f0.read(1)
                nextbyte1 = f1.read(1)
                if nextbyte0 != nextbyte1:
                    if mismatchregions and mismatchregions[-1][1] > i - 8:
                        mismatchregions[-1][1] = i
                    else:
                        mismatchregions.append([i, i])

        if mismatchregions:
            for start, end in mismatchregions:
                length = end - start + 1
                seek_GB(f0, start)
                seek_GB(f1, start)

                text = [f"Mismatch at {start>>16:02X}:{start&0xFFFF:04X}"]
                if length > 1:
                    text += [f"-{end&0xFFFF:04X}"]
                if length > 8:
                    text += [f" (0x{length:X} bytes)"]
                text += [": source ",
                    " ".join(f"{i:02X}" for i in f0.read(min(length, 8)))]
                if length > 8: text.append("...")
                text += [", dest ",
                    " ".join(f"{i:02X}" for i in f1.read(min(length, 8)))]
                if length > 8: text.append("...")
                print("".join(text))
        else:
            print("The byte regions",
                  ", ".join(hex(start) + "-" + hex(end)
                            for start, end in searchregions),
                  "are identical.")

if __name__ == "__main__":
    bytecompare(
        "../../smbdx.gbc",
        "../smbdx-disasm.gbc",
        searchbanks=[
            0x00, 0x02, 0x03, 0x04, 0x06, 0x07, 0x08, 0x09,
            0x0A, 0x0B, 0x11, 0x13, 0x14, 0x15, 0x1D, 0x1F,
            ])
    input()  # wait for Enter, if run on a shell that closes at end of program
