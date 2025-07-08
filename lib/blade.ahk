#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\constant.ahk
#Include %A_ScriptDir%\lib\bns_blade_available.ahk
#Include %A_ScriptDir%\lib\bns_common_available.ahk
#Include %A_ScriptDir%\lib\bns_keyboard.ahk

; 剑士相关的技能


ToggleBladeDefaultOutputSkill() {

    if (ToggleStart)
    {
        SetTimer TabRR, 30
    }
    else
    {
        SetTimer TabRR, 0
    }
}


TabRR() {
    
    PressKeyWithAbort("r", 200)
    Sleep 78

    PressKeyWithAbort("Tab", 100)
    Sleep 50

    ; 大后期 穿击
    ; PressKeyWithAbort("t", 100)
    ; Sleep 50



    blade_availability := BladeAvailability()
    common_availability := CommonAvailability()
    
    if (common_availability.IsManaLess5() && blade_availability.Is2Available()) {
        PressKeyWithAbort("2", 1)
        Sleep 5
    }

    if (common_availability.IsManaLess5() && blade_availability.IsZAvailable()) {
        PressKeyWithAbort("z", 1)
        Sleep 5
    }

    if (common_availability.IsSoulStoneAvailable()) {
        PressKeyWithAbort("``", 1)
        Sleep 5
    }
}

