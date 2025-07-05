#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\constant.ahk
#Include %A_ScriptDir%\lib\bns_qigong_available.ahk

#MaxThreadsPerHotkey 2

CoordMode "ToolTip", "Screen"

; 气功相关的技能

; todo
; - 火C触发的时候，不要触发冰C
; - （done 另启一个SetTimer就可以了）1要9秒触发一次，触发不了？
; - （done 不要输入大写T）气功的按键按的过程中，会触发输入键？



global Toggle2RTF := 0


ToggleQiGongDefaultOutputSkill() {
    global Toggle2RTF := !Toggle2RTF

    if (Toggle2RTF)
    {
        SetTimer QiGong2RTF, 95
        ; SetTimer QiGongRC, 50
        SetTimer QiGong1, 9000 
    }
    else
    {
        SetTimer QiGong2RTF, 0
        ; SetTimer QiGongRC, 0
        SetTimer QiGong1, 0
    }
}


QiGong2RTF() {

    Sleep 5
    ControlSend "{2}", , BNSNEOWinTitle
    Sleep 5
    ControlSend "{f}", , BNSNEOWinTitle
    Sleep 35
    ControlSend "{f}", , BNSNEOWinTitle
    Sleep 35
    ControlSend "{r}", , BNSNEOWinTitle
    Sleep 5
    ControlSend "{t}", , BNSNEOWinTitle
    Sleep 5

}


; 气功1技能，9秒一次，用来叠灼烧
QiGong1() {
    ControlSend "{1}", , BNSNEOWinTitle
}

; 气功火C，确保只按火C，不开罩子
QiGongRC() {
    qigong_availability := QigongAvailability()
    if (qigong_availability.IsHuoCAvailable()) {
        sleep 35
        ControlSend "{c}", , BNSNEOWinTitle
        sleep 5
    }
}


