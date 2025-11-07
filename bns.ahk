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
#Include %A_ScriptDir%\lib\bns_activity.ahk
#Include %A_ScriptDir%\lib\bns_zhumoling.ahk
#Include %A_ScriptDir%\lib\ocr_utils.ahk
#Include %A_ScriptDir%\lib\bns_hotstr.ahk

#MaxThreads 15
#SingleInstance Force

CoordMode "ToolTip", "Screen"
CoordMode "Pixel", "Screen"
CoordMode "Mouse", "Screen"


; 剑灵组队邀请按+

; 功能列表
; - ctrl v 在剑灵游戏里面粘贴字符串
; - 定时任务：小助手签到
; - 定时任务：每个月领B币券

; 设置文件编码为 UTF-8（带BOM头）
FileEncoding "UTF-8"

; 全局变量，用来关闭按键循环
global ToggleStart := false

; 全局变量
; 配置文件
; 如果配置文件有大的修改：initializeConfigFile、下面gui、下面的case选择器、gui DropDownList设置默认值都要修改配置
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
careerDDL := myGui.Add("DropDownList", "ys vCareerChoice w120", [CareerBladeMaster, CareerForceMaster])
careerDDL.OnEvent("Change", saveConfig)

; 功能选择（第二行）
myGui.Add("Text", "xs Section", "选择附加功能：")
altcDDL := myGui.Add(
    "DropDownList", "ys vAltcChoice w180", 
    [
        AdditionalMovePositionInUpgrade,
        AdditionalBladeMasterKillBossAndPickThing,
        AdditionalForceMasterKillBossAndPickThing,
        AdditionalPressF,
        AdditionalCreateAccount,
        AdditionalGetBilibiliCoin,
        AdditionalBNSZSCheck,
        AdditionalMouseLeftClick,
        AdditionalCheckPrice,
        ActivityLeftMoudeEnter,
        CheckPrice,
    ]
)
altcDDL.OnEvent("Change", saveConfig)

; gui DropDownList设置默认值
if FileExist(configFile) 
{
    config := ParseConfigFile(configFile)
    career := config.Get("career", "")
    altc_thing := config.Get("altc_thing", "")
    careerDDL.Text := career
    altcDDL.Text := altc_thing
}
else
{
    careerDDL.Text := CareerBladeMaster
    altcDDL.Text := AdditionalBladeMasterKillBossAndPickThing
}


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

        ; MsgBox "配置已保存！", "成功", "T2"
    } catch {
        MsgBox "保存配置失败！", "错误", "Icon!"
        return
    }
}

; 显示窗口
myGui.Show()





; ctrl v 在剑灵游戏里面粘贴字符串
#HotIf WinActive(BNSNEOWinTitle)

; F1::
; {
;     MouseGetPos &mouseX, &mouseY
;     color := PixelGetColor(mouseX, mouseY)
;     coordinateColor := "ColorDistance(PixelGetColor(" MouseX ", " MouseY "), `"" color "`") < 50"
;     ToolTip coordinateColor
;     A_Clipboard := coordinateColor
;     SetTimer ToolTip, -5000
; }



^+v::
{
    SendTextFromClipboard()
}


; ~XButton1::
; {

;     ; 从字典中获取职业
;     ; 读取并解析配置文件
;     config := ParseConfigFile(configFile)
;     career := config.Get("career", "")

;     ; 根据职业执行不同的技能
;     switch career {
;         case "气功":
;             SetTimer QiGong2RTFPress, 50
;         case "剑士":
;             ; TabRRPress()
;             SetTimer TabRRPress, 50
;         default:
;             MsgBox "未知职业: " career
;     }


;     ; ; KeyWait 返回 0（超时，仍在按住）或 1（已释放）
;     ; isReleased := KeyWait("XButton1", "T0.2")
    
;     ; if (isReleased)  ; 如果按键在 0.3 秒内释放（可能是单击）
;     ; {      
;     ;     ; 按下启动按键
;     ;     global ToggleStart := !ToggleStart

;     ;     ; 根据职业执行不同的技能
;     ;     switch career {
;     ;         case "气功":
;     ;             ToggleQiGongDefaultOutputSkill()
;     ;         case "剑士":
;     ;             ToggleBladeDefaultOutputSkill()
;     ;         default:
;     ;             MsgBox "未知职业: " career
;     ;     }

;     ; }

; }


; ~XButton1 Up::
; {
;     SetTimer TabRRPress, 0
;     SetTimer QiGong2RTFPress, 0
; }


; XButton2::
; {
;     while GetKeyState("XButton2","p")
;     {
;         ControlSend "s", , BNSNEOWinTitle
;         ControlSend "s", , BNSNEOWinTitle
;     } 
; }


#HotIf


!c::
{

    ; 从字典中获取挂机要做的事情
    ; 读取并解析配置文件
    config := ParseConfigFile(configFile)
    altc_thing := config.Get("altc_thing", "")
    career := config.Get("career", "")
    
    ; 根据职业执行不同的技能
    switch altc_thing {
        case AdditionalMovePositionInUpgrade:
            MoveToTaskZone()
        case AdditionalBladeMasterKillBossAndPickThing:
            ToggleBladeKillBossAndPickThing()
        case AdditionalForceMasterKillBossAndPickThing:
            ToggleQiGongKillBossAndPickThing()
        case AdditionalPressF:
            ToggleCard()
        case AdditionalCreateAccount:
            ToggleCreateAccount()
        case AdditionalGetBilibiliCoin:
            BiliBiliMonthlyCoin()
        case AdditionalBNSZSCheck:
            BNSClientDailyAttendance()
        case AdditionalMouseLeftClick:
            ToggleHoldMouseLeft()
        case AdditionalCheckPrice:
            ToggleCheckPrice()
        case ActivityLeftMoudeEnter:
            ToggleActivityLeftMouseEnter()
        case CheckPrice:
            ToggleCheckPrice()
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
    
    ; 如果当前时间是 0005 ，剑灵小助手打卡
    if (currentTimeHourMinute = "0005") {
        BNSClientDailyAttendance()
    }

    ; 如果当前时间是 202504220057，领取B币券
    if (currentTimeYearMonthDayHourMinute = "2511242301") {
        BiliBiliMonthlyCoin()
        
    }

}

; 设置定时器，每分钟检查一次时间
SetTimer CheckTime, 58000  ; 60000 毫秒 = 1 分钟

; 启动时立即检查一次时间（可选）
CheckTime()

; 保持脚本运行
Persistent

