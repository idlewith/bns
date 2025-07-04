#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\constant.ahk

; 挂机相关的操作

global ToggleRight4F := 0
global ToggleF := 0


; 挂机打怪并捡东西
ToggleKillBossAndPickThing() {
    global ToggleRight4F := !ToggleRight4F

    if (ToggleRight4F)
    {
        SetTimer HoldRightKey, 50
        SetTimer Press4F, 100
    }
    else
    {
        SetTimer HoldRightKey, 0
        SetTimer Press4F, 0
    }
}

; 挂机转转盘，搞卡牌
ToggleCard() {
    global ToggleF := !ToggleF

    if (ToggleF)
    {
        SetTimer PressF, 500
    }
    else
    {
        SetTimer PressF, 0
    }
}


HoldRightKey() {
    ControlSend "{Right Down}", , BNSNEOWinTitle
}


Press4F() {
    ControlSend "{4}", , BNSNEOWinTitle
    Sleep 100
    ControlSend "{f}", , BNSNEOWinTitle
}

PressF() {
    ControlSend "{f}", , BNSNEOWinTitle
    Sleep 200
}




