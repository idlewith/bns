#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\constant.ahk
#Include %A_ScriptDir%\lib\bns_qigong_available.ahk
#Include %A_ScriptDir%\lib\bns_keyboard.ahk

; 气功相关的技能

; - (done 多按左键，大概率不触发冰C) 火C触发的时候，不要触发冰C
; - （done 另启一个SetTimer就可以了）1要9秒触发一次，触发不了？
; - （done 不要输入大写T）气功的按键按的过程中，会触发输入键？


ToggleQiGongDefaultOutputSkill() {
    if (ToggleStart)
    {
        SetTimer QiGong2RTF, 50
        ; SetTimer QiGong1, 9000 
    }
    else
    {
        SetTimer QiGong2RTF, 0
        ; SetTimer QiGong1, 0
    }
}


QiGong2RTF() {

    if !ToggleStart || !WinExist(BNSNEOWinTitle)
        return

    keysDown := []

    ; 获取可用性状态（只计算一次）
    qigong_availability := QigongAvailability()
    common_availability := CommonAvailability()

    actions := [
        
        { key: "c", sleepAfter: 800 , condition: () => ( qigong_availability.IsHuoCAvailable() )},
        { key: "r", sleepAfter: 120 },
        { key: "t", sleepAfter: 120 },
        { key: "f", sleepAfter: 120 },
        { key: "2", sleepAfter: 120 },
        { key: "3", sleepAfter: 15, condition: () => ( common_availability.IsManaLess5() && qigong_availability.Is3Available() )},
    ]



    SetTimer QiGong2RTF, 0


    for action in actions {
        if !ToggleStart
            break

        if action.HasProp("condition") && !action.condition.Call()
            continue

        if (action.key = 'c') {
            SendInput("{" action.key "}")
            Sleep(action.sleepAfter)
            break
        }

        ; ControlSend("{" action.key "}", , BNSNEOWinTitle)
        SendInput("{" action.key "}")
        Sleep(action.sleepAfter)

        if !ToggleStart
            break

    }


    SetTimer QiGong2RTF, 50

}


; 气功1技能，9秒一次，用来叠灼烧
QiGong1() {
    PressKeyWithAbort("1", 5)
}




QiGong2RTFPress() {

    if !GetKeyState("XButton1", "P") || !WinExist(BNSNEOWinTitle)
        return

    keysDown := []

    ; 获取可用性状态（只计算一次）
    qigong_availability := QigongAvailability()
    common_availability := CommonAvailability()

    actions := [

        { key: "c", sleepAfter: 800 , condition: () => ( qigong_availability.IsHuoCAvailable() )},

        { key: "t", sleepAfter: 120 },

        { key: "z", sleepAfter: 800, condition: () => ( qigong_availability.IsBingZAvailable() )},
        { key: "x", sleepAfter: 120, condition: () => ( qigong_availability.IsBingXAvailable() )},
        { key: "1", sleepAfter: 120, condition: () => ( qigong_availability.IsBing1Available() )},

        { key: "2", sleepAfter: 120 },

        { key: "r", sleepAfter: 120 },
        { key: "f", sleepAfter: 120 },

    ]



    SetTimer QiGong2RTFPress, 0


    for action in actions {
        if !GetKeyState("XButton1", "P")
            break

        if action.HasProp("condition") && !action.condition.Call()
            continue

        if (action.key = 'c') {
            SendInput "r"
            Sleep 800
            SendInput("{" action.key "}")
            Sleep(action.sleepAfter)
            break
        }

        if (action.key = 'z') {
            SendInput "t"
            Sleep 800
            SendInput("{" action.key "}")
            Sleep(action.sleepAfter)
        }

        ; ControlSend("{" action.key "}", , BNSNEOWinTitle)
        SendInput("{" action.key "}")
        Sleep(action.sleepAfter)

        if !GetKeyState("XButton1", "P")
            break

    }


    SetTimer QiGong2RTFPress, 50


}

