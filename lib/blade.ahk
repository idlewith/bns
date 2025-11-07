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
    
    ; if (common_availability.IsSoulStoneAvailable()) {
    ;     PressKeyWithAbort("``", 1)
    ;     Sleep 5
    ; }
}

TabRRPress() {

    if !GetKeyState("XButton1", "P") || !WinExist(BNSNEOWinTitle)
        return

    keysDown := []

    ; 获取可用性状态（只计算一次）
    blade_availability := BladeAvailability()
    common_availability := CommonAvailability()

    actions := [
        ; { key: "r",  hold: true, sleepHold: 100, sleepAfter: 78 },
        ; { key: "Tab", hold: true, sleepHold: 100, sleepAfter: 30 },


        ; todo test
        ; { key: "r",  hold: false, sleepAfter: 10 },
        ; { key: "r",  hold: false, sleepAfter: 10 },
        ; { key: "r",  hold: false, sleepAfter: 10 },
        ; { key: "r",  hold: false, sleepAfter: 10 },
        ; { key: "r",  hold: false, sleepAfter: 10 },
        ; { key: "r",  hold: false, sleepAfter: 10 },
        ; { key: "r",  hold: false, sleepAfter: 10 },
        ; { key: "r",  hold: false, sleepAfter: 10 },
        ; { key: "r",  hold: false, sleepAfter: 125 },

        ; { key: "Tab",  hold: false, sleepAfter: 10 },
        ; { key: "Tab",  hold: false, sleepAfter: 10 },
        ; { key: "Tab",  hold: false, sleepAfter: 10 },
        ; { key: "Tab",  hold: false, sleepAfter: 10 },
        ; { key: "Tab",  hold: false, sleepAfter: 90 },


        ; { key: "t",  hold: false, sleepAfter: 5, condition: () => ( !common_availability.IsManaLess5() && blade_availability.IsTabCriticalHit() )},
        ; { key: "t",  hold: false, sleepAfter: 5, condition: () => ( !common_availability.IsManaLess5() && blade_availability.IsTabCriticalHit() )},
        ; { key: "t",  hold: false, sleepAfter: 75, condition: () => ( !common_availability.IsManaLess5() && blade_availability.IsTabCriticalHit() )},

        ; 275
        { key: "r",  hold: false, sleepAfter: 275 },
        ; 150
        { key: "Tab", hold: false, sleepAfter: 130 },

        ; 150
        ; { key: "t",  hold: false, sleepAfter: 90, condition: () => ( !common_availability.IsManaLess5() && blade_availability.IsTabCriticalHitV2() )},
        { key: "t",  hold: false, sleepAfter: 100, condition: () => ( ( blade_availability.IsTabCriticalHit() || blade_availability.IsLeftCriticalHit() ) && !common_availability.IsManaLess5() )},

        { key: "z",  hold: false, sleepAfter: 15, condition: () => ( common_availability.IsManaLess5() && blade_availability.IsZAvailable() )},

        { key: "3",  hold: false, sleepAfter: 15, condition: () => ( common_availability.IsManaLess5() && blade_availability.Is3Avaliable() )},

        ; { key: "v",  hold: false, sleepAfter: 120, condition: () => ( common_availability.IsManaLess3() && blade_availability.IsOutVAvaliable() )},
        ; { key: "v",  hold: false, sleepAfter: 15, condition: () => ( blade_availability.IsInVAvaliable() )},

        { key: "2",  hold: false, sleepAfter: 5, condition: () => ( common_availability.IsManaLess5() && blade_availability.Is2Available() )},

        ; { key: "``", hold: false, sleepAfter: 5, condition: () => common_availability.IsSoulStoneAvailable() },
    ]



    SetTimer TabRRPress, 0

    for action in actions {
        if !GetKeyState("XButton1", "P")
            break

        if action.HasProp("condition") && !action.condition.Call()
            continue

        if action.hold {
            if !GetKeyState("XButton1", "P")
                break

            ControlSend("{" action.key " down}", , BNSNEOWinTitle)
            keysDown.Push(action.key)
            Sleep(action.sleepHold)
            ControlSend("{" action.key " up}", , BNSNEOWinTitle)
            Sleep(action.sleepAfter)

            if !GetKeyState("XButton1", "P")
                break

        } else {
            ; ControlSend("{" action.key "}", , BNSNEOWinTitle)
            
            SendInput("{" action.key "}")

            if !GetKeyState("XButton1", "P")
                break

            Sleep(action.sleepAfter)
            
        }
    }

    SetTimer TabRRPress, 50


}


