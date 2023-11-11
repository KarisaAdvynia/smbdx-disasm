def seek_GB(f, ptr):
    bank = ptr >> 16
    addr16 = ptr & 0xFFFF

    if addr16 < 0x4000:
        f.seek(addr16)
    elif addr16 < 0x8000:
        if bank == 0:
            raise ValueError(f"Address ${ptr:04X} requires a nonzero bank.")
        f.seek(((bank - 1) << 14) + addr16)
    else:
        raise ValueError(f"Address ${ptr:06X} is not a valid GB ROM pointer.")

def tell_GB(f):
    offset = f.tell()
    if offset >= 0x4000:
        return (offset >> 14 << 16) | 0x4000 | (offset & 0x3FFF)
    return offset
