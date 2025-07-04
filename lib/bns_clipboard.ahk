#Requires AutoHotkey v2.0

SendTextFromClipboard() {
    textToSend := A_Clipboard       ; 获取待发送文本
    
    ; 逐字发送（规避游戏检测）
    Loop Parse textToSend {
        SendText A_LoopField      ; 无修饰符发送单个字符
        Sleep 15                  ; 字符间延迟（防检测）
    }
}