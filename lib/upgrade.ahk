#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\constant.ahk

global ToggleLeftYClick := 0

ToggleCreateAccount() {
    global ToggleLeftYClick := !ToggleLeftYClick

    if (ToggleLeftYClick)
    {
        SetTimer LeftYCreateAccount, 500
    }
    else
    {
        SetTimer LeftYCreateAccount, 0
    }
}

LeftYCreateAccount() {
    Sleep 500  
    ; Click 2426, 1367 ; 创号
    ControlClick "x2421 y1371", BNSNEOWinTitle
    Sleep 500  ;
    ControlSend "{y}", , BNSNEOWinTitle
    Sleep 500  ;
}

MoveToTaskZone() {
    Sleep 500 
    Send "j" 
    Sleep 500 
    ; 移动到任务执行区域
    Click 1762, 1198 
    Sleep 500
    Send "Y"
    Sleep 500
}


