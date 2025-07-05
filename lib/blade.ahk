#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\constant.ahk

; 剑士相关的技能

global ToggleTabRR := 0


ToggleBladeDefaultOutputSkill() {
    global ToggleTabRR := !ToggleTabRR

    if (ToggleTabRR)
    {
        SetTimer TabRR, 50
    }
    else
    {
        SetTimer TabRR, 0
    }
}


TabRR() {
    ControlSend "{Tab}", , BNSNEOWinTitle
    Sleep 190
    ControlSend "{R}", , BNSNEOWinTitle
    Sleep 150
    ControlSend "{R}", , BNSNEOWinTitle
    Sleep 125

    ToolTip "Toggle"
    SetTimer () => ToolTip(), -100
}
