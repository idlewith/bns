#Requires AutoHotkey v2.0

; 活动左键-enter领取材料
global ToggleVarActivityLeftMouseEnter := 0

ToggleActivityLeftMouseEnter() {
    global ToggleVarActivityLeftMouseEnter := !ToggleVarActivityLeftMouseEnter

    if (ToggleVarActivityLeftMouseEnter)
    {
        SetTimer ActivityLeftMouseEnter, 1500
    }
    else
    {
        SetTimer ActivityLeftMouseEnter, 0
    }
}



ActivityLeftMouseEnter() {
    Sleep 90
    MouseGetPos &mouseX, &mouseY
    Sleep 90
    MouseClick "left", mouseX, mouseY
    Sleep 800
    Send "{Enter}"
    Sleep 90
}
