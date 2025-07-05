#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\constant.ahk
#Include %A_ScriptDir%\lib\bns_qigong_available.ahk
#Include %A_ScriptDir%\lib\bns_common_available.ahk

CoordMode "ToolTip", "Screen"

; 气功相关的技能

; todo
; - 火C触发的时候，不要触发冰C
; - 1要9秒触发一次，触发不了？



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
    qigong_availability := QigongAvailability()
    common_availability := CommonAvailability()

    ControlSend "{2}", , BNSNEOWinTitle
    Sleep 10
    ControlSend "{F}", , BNSNEOWinTitle
    Sleep 10
    ControlSend "{F}", , BNSNEOWinTitle
    Sleep 10
    ControlSend "{R}", , BNSNEOWinTitle
    Sleep 250
    ControlSend "{T}", , BNSNEOWinTitle
    Sleep 10

    if (common_availability.IsSoulStoneAvailable()) {
        ControlSend "``", , BNSNEOWinTitle
        sleep 5
    }

}


; 气功1技能，9秒一次，用来叠灼烧
QiGong1() {
    ControlSend "{1}", , BNSNEOWinTitle
}

