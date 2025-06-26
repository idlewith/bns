#Requires AutoHotkey v2.0
CoordMode "ToolTip", "Screen"



global ToggleLeftYClick := 0



::btw::by the way


^+s::
{
    BNSDailyAttendance()
}

^+c::
{
    global ToggleLeftYClick := !ToggleLeftYClick

    if (ToggleLeftYClick)
    {
        SetTimer LeftY, 500
    }
    else
    {
        SetTimer LeftY, 0
    }
}



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





BiliBiliMonthlyCoin() {
    
    ; 打开 Chrome 浏览器并访问指定网页
    Run "chrome.exe https://account.bilibili.com/account/big/myPackage"
}



BNSDailyAttendance() {
    
; 打开 Chrome 浏览器并访问指定网页
Run "chrome.exe https://tools.bnszs.com/manage/login?callback=/manage/center"

; 等待浏览器打开并加载页面
WinWaitActive "ahk_exe chrome.exe"
Sleep 2000  ; 等待页面加载完成，时间可以根据实际情况调整


; 首页登录 
; 1409 862
Click 1409, 862
Sleep 8000  ;

; 我知道了 
; 1340, 986
Click 1340, 986
Sleep 1000  ;

; 签到 
; 461, 685
Click 461, 685
Sleep 2000  ;

}


LeftY() {
    ; Send "{LButton}" 
    Sleep 500  
    Click 2426, 1367 ; 创号
    Sleep 500  ;
    Send "Y"
    Sleep 500  ;
}
