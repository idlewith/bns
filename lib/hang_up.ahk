#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\constant.ahk
#Include %A_ScriptDir%\lib\qigong.ahk
#Include %A_ScriptDir%\lib\bnszs.ahk

; 挂机相关的操作
; 剑士挂机打BOSS并捡东西 
global ToggleRight4F := 0
; 气功挂机打BOSS并捡东西 
global ToggleRight2RTF := 0
; 挂机转转盘
global ToggleF := 0
; 挂机点左键
global ToggleMouseLeft := 0


; 挂机打怪并捡东西
ToggleQiGongKillBossAndPickThing() {
    global ToggleRight2RTF := !ToggleRight2RTF

    if (ToggleRight2RTF)
    {
        SetTimer HoldRightKey, 50
        SetTimer QiGong2RTF, 100
        ToolTip "正在按住2RTF...", 1332, 644
    }
    else
    {
        SetTimer HoldRightKey, 0
        SetTimer QiGong2RTF, 0
        ControlSend "{Right Up}", , BNSNEOWinTitle
        SetTimer ToolTip, -500
    }
}


; 挂机打怪并捡东西
ToggleBladeKillBossAndPickThing() {
    global ToggleRight4F := !ToggleRight4F

    if (ToggleRight4F)
    {
        SetTimer HoldRightKey, 50
        SetTimer Press4F, 100
        ToolTip "正在按住4F...", 1332, 644
    }
    else
    {
        SetTimer HoldRightKey, 0
        SetTimer Press4F, 0
        ControlSend "{Right Up}", , BNSNEOWinTitle
        SetTimer ToolTip, -500
    }
}

; 挂机转转盘，搞卡牌
ToggleCard() {
    global ToggleF := !ToggleF

    if (ToggleF)
    {
        SetTimer PressF, 75
        ToolTip "正在按住F...", 1332, 644
    }
    else
    {
        SetTimer PressF, 0
        SetTimer ToolTip, -500
    }
}

ToggleHoldMouseLeft() {
    global ToggleMouseLeft := !ToggleMouseLeft

    if (ToggleMouseLeft)
    {
        SetTimer HoldMouseLeft, 500
        ToolTip "正在按住左键...", 1332, 644
    }
    else
    {
        SetTimer HoldMouseLeft, 0
        SetTimer ToolTip, -500
    }
}


HoldMouseLeft() {
    ControlClick "x582 y973", BNSNEOWinTitle
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
    ; Sleep 70
}

PressF1() {
    ControlSend "{f}", , BNSNEOWinTitle
    ; Sleep 70
}

PressF2() {
    ControlSend "{f}", , BNSNEOWinTitle
    ; Sleep 70
}



