#Requires AutoHotkey v2.0
CoordMode "ToolTip", "Screen"



::btw::by the way


^+s::
{
    DailyAttendance()
}


; 检查当前时间是否为目标时间（23:00）
CheckTime() {
    ; 获取当前时间的小时和分钟 
    currentTime := FormatTime(A_Now, "HHmm") ; 获取当前时间，格式为 HHmm（24 小时制）
    
    ; 如果当前时间是 23:00，则执行任务
    if (currentTime = "0057") {
        DailyAttendance()
        
        ; 停止定时器，避免重复执行
        SetTimer CheckTime, 0
    }
}

; 设置定时器，每分钟检查一次时间
SetTimer CheckTime, 58000  ; 60000 毫秒 = 1 分钟

; 启动时立即检查一次时间（可选）
CheckTime()

; 保持脚本运行
Persistent









DailyAttendance() {
    
; 打开 Chrome 浏览器并访问指定网页
Run "chrome.exe https://tools.bnszs.com/manage/login?callback=/manage/center"

; 等待浏览器打开并加载页面
WinWaitActive "ahk_exe chrome.exe"
Sleep 2000  ; 等待页面加载完成，时间可以根据实际情况调整


; 首页登录 
; 1409 862
Click 1409, 862
Sleep 5000  ;

; 我知道了 
; 1340, 986
Click 1340, 986
Sleep 1000  ;

; 签到 
; 461, 685
Click 461, 685
Sleep 2000  ;

}

