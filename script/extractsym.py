"""Generate a symbol file containing the label names from each code file."""

from pathlib import Path

def extractsym(dirpath, ext, inc_generic=False, inc_relative=False):
    """
    inc_generic: whether to include auto-generated labels containing the label's
      address, such as "Sub014567" or "DataPtrs12789A"
    inc_relative: whether to include labels starting with "@", used for
      branches within a subroutine
    """
    labels = []
    for path in dirpath.glob("**/*" + ext):
        print("Processing:", path.as_posix())

        labelname = None
        for line in path.open("r", newline=""):
            # remove comment and trailing whitespace if any
            stripline = line.split(";")[0].rstrip()

            if stripline.endswith(":") and (inc_relative or not stripline.startswith("@")):
                labelname = stripline[:-1]

            if labelname is not None:
                pos = line.find("; ")
                if pos >= 1:
                    addrstr = line[pos+2:pos+9]
                    bankstr, addr16str = addrstr.split(":", maxsplit=1)
                    try:
                        int(bankstr, 16)  # is this a valid pointer
                        int(addr16str, 16)  # is this a valid pointer
                        if inc_generic or not labelname.endswith(bankstr+addr16str):
                            labels.append((addrstr, labelname))
                        labelname = None
                    except ValueError:
                        pass

    return labels

if __name__ == "__main__":
    labels = extractsym(Path("../asm/"), ".asm",
                        inc_generic=True, inc_relative=True)
    with open("../../smbdx-disasm.sym", "w", encoding="UTF-8",
              newline="\n") as f:
        for addrstr, labelname in sorted(labels):
            f.write(addrstr + " " + labelname + "\n")
