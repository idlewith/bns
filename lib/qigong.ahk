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
        SetTimer QiGong2RTF, 95
        SetTimer QiGong1, 9000 
    }
    else
    {
        SetTimer QiGong2RTF, 0
        SetTimer QiGong1, 0
    }
}


QiGong2RTF() {

    Sleep 5
    PressKeyWithAbort("2", 5)
    PressKeyWithAbort("f", 35)
    PressKeyWithAbort("f", 35)
    PressKeyWithAbort("r", 5)

    common_availability := CommonAvailability()
    qigong_availability := QigongAvailability()

    if (common_availability.IsManaLess5() && qigong_availability.Is3Available()) {
        PressKeyWithAbort("3", 5)
        sleep 5
    }

    PressKeyWithAbort("r", 5)
    PressKeyWithAbort("r", 5)
    PressKeyWithAbort("r", 5)

    if (qigong_availability.IsHuoCAvailable()) {
        PressKeyWithAbort("r", 5)
        Sleep 300
        PressKeyWithAbort("r", 5)
        Sleep 300
        PressKeyWithAbort("r", 5)
        Sleep 300

        PressKeyWithAbort("c", 5)
        Sleep 300

        PressKeyWithAbort("r", 35)
        Sleep 300
        PressKeyWithAbort("r", 35)
        Sleep 300
        PressKeyWithAbort("r", 35)
        Sleep 300
        
    }

    ControlSend "t", , BNSNEOWinTitle
    Sleep 5

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
        
        { key: "c", hold: false, sleepAfter: 800 , condition: () => ( qigong_availability.IsHuoCAvailable() )},
        { key: "r", hold: false, sleepAfter: 120 },
        { key: "t", hold: false, sleepAfter: 120 },
        { key: "f",  hold: false, sleepAfter: 120 },
        { key: "2",  hold: false, sleepAfter: 120 },
        { key: "3",  hold: false, sleepAfter: 15, condition: () => ( common_availability.IsManaLess5() && qigong_availability.Is3Available() )},
    ]



    SetTimer QiGong2RTFPress, 0


    for action in actions {
        if !GetKeyState("XButton1", "P")
            return

        if action.HasProp("condition") && !action.condition.Call()
            continue

        if action.hold {
            if !GetKeyState("XButton1", "P")
                return

            ControlSend("{" action.key " down}", , BNSNEOWinTitle)
            keysDown.Push(action.key)
            Sleep(action.sleepHold)
            ControlSend("{" action.key " up}", , BNSNEOWinTitle)
            Sleep(action.sleepAfter)

            if !GetKeyState("XButton1", "P")
                return

        } else {

            if (action.key = 'c') {
                SendInput("{" action.key "}")
                Sleep(action.sleepAfter)
                break
            }

            ; ControlSend("{" action.key "}", , BNSNEOWinTitle)
            SendInput("{" action.key "}")
            Sleep(action.sleepAfter)

            if !GetKeyState("XButton1", "P")
                return
        }
    }


    SetTimer QiGong2RTFPress, 50


}

