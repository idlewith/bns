#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\bilibili.ahk
#Include %A_ScriptDir%\lib\bnszs.ahk
#Include %A_ScriptDir%\lib\constant.ahk
#Include %A_ScriptDir%\lib\hang_up.ahk
#Include %A_ScriptDir%\lib\upgrade.ahk
#Include %A_ScriptDir%\lib\bns_clipboard.ahk
#Include %A_ScriptDir%\lib\blade.ahk
#Include %A_ScriptDir%\lib\qigong.ahk
#Include %A_ScriptDir%\lib\bns_file.ahk

CoordMode "ToolTip", "Screen"

; 功能列表
; - ctrl v 在剑灵游戏里面粘贴字符串
; - 定时任务：小助手签到
; - 定时任务：每个月领B币券

; 设置文件编码为 UTF-8（带BOM头）
FileEncoding "UTF-8"

; ctrl v 在剑灵游戏里面粘贴字符串
#HotIf WinActive(BNSNEOWinTitle)

; 全局变量
; 配置文件
; 如果配置文件有大的修改：initializeConfigFile、下面gui、下面的case选择器都要修改配置
global configFile := "bns_config.txt"

; 初始化配置文件（如果不存在）
initializeConfigFile(configFile)


; 创建主窗口
myGui := Gui()
myGui.Title := "闲逛的剑灵宏配置选择器"
myGui.OnEvent("Close", (*) => ExitApp())  ; 使用匿名函数替代 GuiClose
myGui.SetFont("s10", "Arial")

; 职业选择（第一行）
myGui.Add("Text", "Section", "选择职业：")
careerDDL := myGui.Add("DropDownList", "ys vCareerChoice w120", ["剑士", "气功"])

; 功能选择（第二行）
myGui.Add("Text", "xs Section", "选择附加功能：")
altcDDL := myGui.Add("DropDownList", "ys vAltcChoice w180", ["主线移动位置", "挂机BOSS并捡物品", "挂机转转盘", "创建账号"])

; 保存并执行按钮
myGui.Add("Button", "xs Section w300", "保存配置").OnEvent("Click", saveConfig)

; 定义保存并执行函数
saveConfig(*) {
    ; 获取选择的职业
    career := myGui.Submit(false).CareerChoice
    
    ; 获取选择的功能
    altc := myGui.Submit(false).AltcChoice
    
    ; 保存配置
    try {
        configText := "career=" career "`naltc_thing=" altc
        ; 使用FileOpen确保UTF-8编码
        file := FileOpen(configFile, "w", "UTF-8")
        file.Write(configText)
        file.Close()

        MsgBox "配置已保存！", "成功", "T2"
    } catch {
        MsgBox "保存配置失败！", "错误", "Icon!"
        return
    }
}

; 显示窗口
myGui.Show()



; F1::
; {
;     MouseGetPos &mouseX, &mouseY
;     color := PixelGetColor(mouseX, mouseY)
;     coordinateColor := "ColorDistance(PixelGetColor(" MouseX ", " MouseY "), `"" color "`") < 50"
;     ToolTip coordinateColor
;     A_Clipboard := coordinateColor
;     SetTimer ToolTip, -5000
; }

^v::
{
    SendTextFromClipboard()
}


XButton1::
{

    ; 从字典中获取职业
    ; 读取并解析配置文件
    config := ParseConfigFile(configFile)
    career := config.Get("career", "")

    ; KeyWait 返回 0（超时，仍在按住）或 1（已释放）
    isReleased := KeyWait("XButton1", "T0.3")
    
    if (isReleased)  ; 如果按键在 0.3 秒内释放（可能是单击）
    {      
        
        ; 根据职业执行不同的技能
        switch career {
            case "气功":
                ToggleQiGongDefaultOutputSkill()
            case "剑士":
                ToggleBladeDefaultOutputSkill()
            default:
                MsgBox "未知职业: " career
        }

    }
    else  ; 如果超时（长按）
    {
        while GetKeyState("XButton1","p")
        {

            ; 根据职业执行不同的技能
            switch career {
                case "气功":
                    QiGong2RTF()
                case "剑士":
                    TabRR()
                default:
                    MsgBox "未知职业: " career
            }
        } 
    }

}

XButton2::
{
    while GetKeyState("XButton2","p")
    {
        ControlSend "s", , BNSNEOWinTitle
        ControlSend "s", , BNSNEOWinTitle
    } 
}


#HotIf


!c::
{

    ; 从字典中获取挂机要做的事情
    ; 读取并解析配置文件
    config := ParseConfigFile(configFile)
    altc_thing := config.Get("altc_thing", "")
    
    ; 根据职业执行不同的技能
    switch altc_thing {
        case "主线移动位置":
            MoveToTaskZone()
        case "挂机BOSS并捡物品":
            ToggleKillBossAndPickThing()
        case "挂机转转盘":
            ToggleCard()
        case "创建账号":
            ToggleCreateAccount()
        default:
            MsgBox "未知挂机事情"
    }

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

