#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\constant.ahk

; 发送一个按键：拆成 down → hold → up，并在中间检查中断
PressKeyWithAbort(key, hold := 5) {
    ; 检查中断
    if !ToggleStart
        return

    ; 按下
    ControlSend "{" key " down}", , BNSNEOWinTitle
    ; 持续按住
    Sleep hold

    ; 检查中断
    if !ToggleStart {
        ; 补发松开，防止卡键
        ControlSend "{" key " up}", , BNSNEOWinTitle
        return
    }

    ; 松开
    ControlSend "{" key " up}", , BNSNEOWinTitle
}