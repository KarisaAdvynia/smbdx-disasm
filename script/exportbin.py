from pathlib import Path
from _gbfile import seek_GB

def importbinptrs(binptrpath):
    ptrmap = []
    fillnext = False
    for line in open(binptrpath, "r", encoding="UTF-8"):
        if not line or line.isspace(): continue
        rawdata = line.split()
        startptr = int(rawdata[0], 16)
        if fillnext:  # use startptr as previous line's end ptr
            length = startptr - ptrmap[-1][0]
            if length <= 0:
                raise ValueError("Error parsing line:\n" + line +
                    "Length {length:X} is not a positive value.")
            ptrmap[-1][1] = length

        if len(rawdata) == 3:
            length = int(rawdata[1], 16) - startptr
            if length <= 0:
                raise ValueError("Error parsing line:\n" + line +
                    "Length {length:X} is not a positive value.")
            ptrmap.append([startptr, length, rawdata[2]])
            fillnext = False
        elif len(rawdata) == 2:
            ptrmap.append([startptr, None, rawdata[1]])
            fillnext = True
        else:
            raise ValueError("Error parsing line:\n" + line +
                "\nLine must contain either 1 or 2 hex pointers followed by a file path.")

    return ptrmap

def exportbin(sourcepath, outputdir, binptrpath):
    ptrmap = importbinptrs(binptrpath)

    with sourcepath.open("rb") as f:
        outputdir = Path(outputdir)
        for startptr, length, pathstr in ptrmap:
            seek_GB(f, startptr)
            data = f.read(length)

            exportpath = outputdir / pathstr

            # create directory if necessary
            nextdir = exportpath.parent
            if not nextdir.exists():
                print(f"Creating directory: {nextdir}")
                nextdir.mkdir(parents=True)

            # create file
            exportpath.open("wb").write(data)
        print(f"Extracted {len(ptrmap)} files.")

if __name__ == "__main__":
    # search for the source ROM outside the disassembly directory
    try:
        gbcfiles = [path for path in Path("../..").iterdir() if path.suffix.lower() == ".gbc"]
        if len(gbcfiles) == 1:
            # if only one GBA file is found, use that
            sourcepath = gbafiles[0]
        elif Path("../../smbdx.gbc").exists():
            # if "smbdx.gbc" exists, use that
            sourcepath = Path("../../smbdx.gbc")
        elif len(gbcfiles) == 0:
            raise Exception("No .gbc files were found in " +
                  str(Path("../..").resolve()))
        else:
            raise Exception(
                f"{len(gbafiles)} total .gbc files were found in " +
                str(Path("../..").resolve()))
    except Exception as err:
        errstr = str(err)
        if type(err) is not Exception:
            errstr = type(err).__name__ + ": " + errstr
        print(errstr)
        print("This script needs a source ROM to extract data. "
              "Either include a file named 'smbdx.gbc' in the directory, or include exactly one .gbc file.")
        input()
        import sys
        sys.exit()

    print("Extracting from: " + str(sourcepath.resolve()))
    try:
        exportbin(sourcepath,
                  "../data/",
                  "../binptrs.txt")
    except Exception:
        from traceback import print_exc
        print_exc()
        input()
