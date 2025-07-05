#Requires AutoHotkey v2.0

ColorDistance(c1, c2) {
    c1 := SubStr(c1, 3), c2 := SubStr(c2, 3)  ; 去掉 "0x"
    r := Abs(("0x" SubStr(c1, 1, 2)) - ("0x" SubStr(c2, 1, 2)))
    g := Abs(("0x" SubStr(c1, 3, 2)) - ("0x" SubStr(c2, 3, 2)))
    b := Abs(("0x" SubStr(c1, 5, 2)) - ("0x" SubStr(c2, 5, 2)))
    return Max(r, g, b)
}
