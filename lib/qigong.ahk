#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\constant.ahk

CoordMode "ToolTip", "Screen"

; 气功相关的技能

; todo
; - 火C触发的时候，不要触发冰C
; - 1要9秒触发一次，触发不了？
; - 气功的按键按的过程中，会触发输入键？



global Toggle2RTF := 0


ToggleQiGongDefaultOutputSkill() {
    global Toggle2RTF := !Toggle2RTF

    if (Toggle2RTF)
    {
        SetTimer QiGong2RTF, 355
    }
    else
    {
        SetTimer QiGong2RTF, 0
    }
}


QiGong2RTF() {

    Sleep 100
    ControlSend "{2}", , BNSNEOWinTitle
    Sleep 100
    ControlSend "{F}", , BNSNEOWinTitle
    Sleep 100
    ControlSend "{F}", , BNSNEOWinTitle
    Sleep 100
    ControlSend "{R}", , BNSNEOWinTitle
    Sleep 250
    ControlSend "{T}", , BNSNEOWinTitle
    Sleep 100

}


; 气功1技能，9秒一次，用来叠灼烧
QiGong1() {
    ControlSend "{1}", , BNSNEOWinTitle
}

