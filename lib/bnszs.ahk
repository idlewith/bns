#Requires AutoHotkey v2.0


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



BNSClientDailyAttendance() {

    Sleep 1000
    WinActivate BNSZSTitle
    Sleep 1000

    DeafultAvatarResult := ClickImage("C:\code\bns\image\touxiang.png", "默认头像")  
    Sleep 500
    if DeafultAvatarResult.IsClick {
        MouseClick "left", DeafultAvatarResult.X + 5, DeafultAvatarResult.Y + 5
    }
    Sleep 2000

    ; 下面是循环所有窗口找到目标窗口
    ; ; 弹出来登录QQ的框
    ; qqLoginHwnd := ""
    ; for hwnd in WinGetList() {
    ;     class := WinGetClass(hwnd)
    ;     exe   := WinGetProcessName(hwnd)
        
    ;     ; 检查是否符合 QQ 快捷登录窗口特征
    ;     if (class ~= "HwndWrapper\[剑灵小助手;.*\]") && (exe = "剑灵小助手3.1.5.exe") {
    ;         qqLoginHwnd := hwnd
    ;         break
    ;     }
    ; }

    ; if !qqLoginHwnd {
    ;     MsgBox "未找到 QQ 快捷登录窗口！"
    ; }

    ; ; 激活窗口
    ; WinActivate("ahk_id " qqLoginHwnd)
    ; Sleep 3000


    Found1QQResult := ClickImage("*100 C:\code\bns\image\1.png", "登录界面的1号QQ")
    Sleep 500
    if Found1QQResult.IsClick {
        MouseClick "left", Found1QQResult.X + 5, Found1QQResult.Y + 5
    }
    Sleep 3000


    ; 后面都是在主窗口
    Found1QQLoginedResult := ClickImage("*100 C:\code\bns\image\1-2.png", "登录后的1号QQ头像")
    Sleep 500  
    if Found1QQLoginedResult.IsClick {
        MouseClick "right", Found1QQLoginedResult.X + 5, Found1QQLoginedResult.Y + 5
    }
    Sleep 500


    FoundMarkResult := ClickImage("C:\code\bns\image\mark.png", "签到选项")
    Sleep 500
    if FoundMarkResult.IsClick {
        MouseClick "left", FoundMarkResult.X + 5, FoundMarkResult.Y + 5
    }
    Sleep 500


    MarkOKResult := ClickImage("C:\code\bns\image\mark_ok.png", "签到OK按钮")
    Sleep 500
    if MarkOKResult.IsClick {
        MouseClick "left", MarkOKResult.X + 5, MarkOKResult.Y + 5
    }
    Sleep 500

    FoundTitleResult := ClickImage("C:\code\bns\image\title.png", "标签栏")
    Sleep 500
    if FoundTitleResult.IsClick {
        MouseClick "left", FoundTitleResult.X + 5, FoundTitleResult.Y + 5
    }
    Sleep 500


    ; 后面都是在主窗口
    Found1QQLoginedResult := ClickImage("*50 C:\code\bns\image\1-2.png", "登录后的1号QQ头像")
    Sleep 500  
    if Found1QQLoginedResult.IsClick {
        MouseClick "left", Found1QQLoginedResult.X + 5, Found1QQLoginedResult.Y + 5
        Sleep 500

        QuitResult := ClickImage("*50 C:\code\bns\image\quit.png", "")
        Sleep 500
        if QuitResult.IsClick {
            MouseClick "left", QuitResult.X + 5, QuitResult.Y + 5
        }
        Sleep 2000

        Found1QQResult := ClickImage("*100 C:\code\bns\image\1.png", "登录界面的1号QQ")
        Sleep 500
        if Found1QQResult.IsClick {
            MouseClick "left", Found1QQResult.X + 5, Found1QQResult.Y + 5
        }
        Sleep 3000

        Found1QQLoginedResult := ClickImage("C:\code\bns\image\1-2.png", "登录后的1号QQ头像")
        Sleep 500  
        if Found1QQLoginedResult.IsClick {
            MouseClick "right", Found1QQLoginedResult.X + 5, Found1QQLoginedResult.Y + 5
        }
        Sleep 500


        FoundMarkResult := ClickImage("C:\code\bns\image\mark.png", "签到选项")
        Sleep 500
        if FoundMarkResult.IsClick {
            MouseClick "left", FoundMarkResult.X + 5, FoundMarkResult.Y + 5
        }
        Sleep 500


        MarkOKResult := ClickImage("C:\code\bns\image\mark_ok.png", "签到OK按钮")
        Sleep 500
        if MarkOKResult.IsClick {
            MouseClick "left", MarkOKResult.X + 5, MarkOKResult.Y + 5
        }
        Sleep 500

        FoundTitleResult := ClickImage("C:\code\bns\image\title.png", "标签栏")
        Sleep 500
        if FoundTitleResult.IsClick {
            MouseClick "left", FoundTitleResult.X + 5, FoundTitleResult.Y + 5
        }
        Sleep 500

    }
    Sleep 500

}



ClickImage(imagePath, PromptFound) {

    FoundLeftX := 0
    FoundLeftY := 0
    FoundRightX := A_ScreenWidth
    FoundRightY := A_ScreenHeight

    ToolTipX := 313
    ToolTipY := 1191
    ToolTipDelay := 1000

    IsClick := false

    try {
    
        Loop 5 {


            if ImageSearch(&FoundX, &FoundY, FoundLeftX, FoundLeftY, FoundRightX, FoundRightY, imagePath) {
                
                IsClick := true

                ToolTip PromptFound, ToolTipX, ToolTipY
                SetTimer ToolTip, -ToolTipDelay

                break

            }
            else {
                ToolTip "没找到！！！ -- " PromptFound, ToolTipX, ToolTipY
                SetTimer ToolTip, -ToolTipDelay
            }
            
            Sleep 50

        }
    }
    catch Error as err 
    {
        ToolTip "error", ToolTipX, ToolTipY
        SetTimer ToolTip, -ToolTipDelay
    }


    return { IsClick: IsClick, X: FoundX, Y: FoundY }   

}





