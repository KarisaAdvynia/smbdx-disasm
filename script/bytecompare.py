import os

from _gbfile import seek_GB

def bytecompare(source, dest, searchbanks=None):
    mismatchregions = []
    if searchbanks is None:
        searchbanks = range(min(os.path.getsize(source), os.path.getsize(dest)) // 0x4000)

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

        for start, end in mismatchregions:
            if start in (0x014E, 0x014F) and end in (0x014F, 0x0150):
                # don't alert for differing checksum
                if len(mismatchregions) == 1:
                    mismatchregions.clear()
                    break
                continue
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

        if not mismatchregions:  # no mismatches found, except possibly checksum
            if isinstance(searchbanks, range):
                print(f"The compared banks "
                      f"({searchbanks.start:02X}-{searchbanks.stop-1:02X})"
                      f" are identical.")
            else:
                print("The compared banks (" +
                      " ".join(f"{bank:02X}" for bank in sorted(searchbanks)) +
                      ") are identical.")

if __name__ == "__main__":
    bytecompare(
        "../../smbdx.gbc",
        "../smbdx-disasm.gbc",
        searchbanks=
            list(range(0x0F)) +
            list(range(0x10, 0x17)) +
            list(range(0x1A, 0x21)) +
            list(range(0x26, 0x31)) +
            [0x32, 0x34, 0x36]
        )
    input()  # wait for Enter, if run on a shell that closes at end of program
