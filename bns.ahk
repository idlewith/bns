#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\bilibili.ahk
#Include %A_ScriptDir%\lib\bnszs.ahk
#Include %A_ScriptDir%\lib\constant.ahk
#Include %A_ScriptDir%\lib\hang_up.ahk
#Include %A_ScriptDir%\lib\upgrade.ahk
#Include %A_ScriptDir%\lib\bns_clipboard.ahk
#Include %A_ScriptDir%\lib\blade.ahk
#Include %A_ScriptDir%\lib\qigong.ahk

CoordMode "ToolTip", "Screen"

; 功能列表
; - ctrl v 在剑灵游戏里面粘贴字符串
; - 定时任务：小助手签到
; - 定时任务：每个月领B币券



; ctrl v 在剑灵游戏里面粘贴字符串
#HotIf WinActive(BNSNEOWinTitle)

F1::
{
    MouseGetPos &mouseX, &mouseY
    color := PixelGetColor(mouseX, mouseY)
    coordinateColor := "ColorDistance(PixelGetColor(" MouseX ", " MouseY "), `"" color "`") < 50"
    ToolTip coordinateColor
    A_Clipboard := coordinateColor
    SetTimer ToolTip, -5000
}

^v::
{
    SendTextFromClipboard()
}


XButton1::
{
    ; KeyWait 返回 0（超时，仍在按住）或 1（已释放）
    isReleased := KeyWait("XButton1", "T0.3")
    
    if (isReleased)  ; 如果按键在 0.3 秒内释放（可能是单击）
    {
        ; 剑士
        ToggleBladeDefaultOutputSkill()
        ; 气功
        ; ToggleQiGongDefaultOutputSkill()
    }
    else  ; 如果超时（长按）
    {
        while GetKeyState("XButton1","p")
        {
            ; 剑士
            TabRR()
            ; 气功
            ; QiGong2RTF()
        } 
    }

}

XButton2::
{
    while GetKeyState("XButton2","p")
    {
        ControlSend "s", , BNSNEOWinTitle
        Sleep 150
        ControlSend "s", , BNSNEOWinTitle
        Sleep 125
    } 
}


#HotIf



^+a::
{
    ToggleCreateAccount()
}


!c::
{
    ; MoveToTaskZone()
    ToggleKillBossAndPickThing()
    ; ToggleCard()
}


; 实时检查任务
; 检查当前时间是否为目标时间（23:00）
CheckTime() {
    ; 获取当前时间的小时和分钟 
    currentTimeHourMinute := FormatTime(A_Now, "HHmm") ; 获取当前时间，格式为 HHmm（24 小时制）
    currentTimeYearMonthDayHourMinute := FormatTime(A_Now, "yyMMddHHmm") ; 获取当前时间，格式为 yyMMddHHmm (24 小时制）
    
    ; 如果当前时间是 00:57，剑灵小助手打卡
    ; if (currentTimeHourMinute = "0031") {
    ;     BNSDailyAttendance()
    ; }

    ; 如果当前时间是 202504220057，领取B币券
    if (currentTimeYearMonthDayHourMinute = "2507242301") {
        BiliBiliMonthlyCoin()
        
    }
}

; 设置定时器，每分钟检查一次时间
SetTimer CheckTime, 58000  ; 60000 毫秒 = 1 分钟

; 启动时立即检查一次时间（可选）
CheckTime()

; 保持脚本运行
Persistent

