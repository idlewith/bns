#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\constant.ahk
#Include %A_ScriptDir%\lib\bns_blade_available.ahk
#Include %A_ScriptDir%\lib\bns_common_available.ahk

#MaxThreadsPerHotkey 2

CoordMode "ToolTip", "Screen"

; 剑士相关的技能

global ToggleTabRR := 0


ToggleBladeDefaultOutputSkill() {
    global ToggleTabRR := !ToggleTabRR

    if (ToggleTabRR)
    {
        SetTimer TabRR, 85
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

    blade_availability := BladeAvailability()
    common_availability := CommonAvailability()
    
    if (common_availability.IsManaLess5() && blade_availability.Is2Available()) {
        ControlSend "{2}", , BNSNEOWinTitle
        sleep 5
    }

    if (common_availability.IsManaLess5() && blade_availability.IsZAvailable()) {
        ControlSend "{Z}", , BNSNEOWinTitle
        sleep 5
    }

    if (common_availability.IsSoulStoneAvailable()) {
        ControlSend "``", , BNSNEOWinTitle
        sleep 5
    }
}

