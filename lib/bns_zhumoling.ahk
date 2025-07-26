#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\lib\constant.ahk
#Include %A_ScriptDir%\lib\utils.ahk


reportZhumoling() {
    static lastCheckedDay := ""
    
    ; 获取当前时间和星期
    currentTime := FormatTime(, "HH:mm")
    currentDate := FormatTime(, "yyyyMMdd")
    dayOfWeek := weekdayMap[A_WDay] ; 转换系统星期格式
    
    ; 新的一天重置提醒记录
    if (lastCheckedDay != currentDate) {
        lastCheckedDay := currentDate
    }
    
    ; 获取当天的浊魔灵数据
    if !zhuMoLingData.Has(dayOfWeek) {
        return
    }
    todayEvents := zhuMoLingData[dayOfWeek]
    
    ; 检查每个事件
    for event in todayEvents {
        ; 计算提醒时间（提前10分钟）
        eventTime := event.time
        remindTime := calculateReminderTime(eventTime)

        locationText := Join("`n", event.locations*)

        ; todo
        ; debugTextList := [A_WDay, dayOfWeek, eventTime, remindTime, locationText]
        ; ToolTip Join("`n", debugTextList*)
        
        ; 如果当前时间匹配提醒时间
        if (currentTime = remindTime) {
            locationText := Join("`n", event.locations*)
            MsgBox("浊魔灵即将刷新！`n`n刷新时间: " eventTime 
                . "`n刷新地点: `n" locationText
                . "`n`n【10分钟后出现BOSS！！！】", "《剑灵巅峰服》浊魔灵提醒")
        }
    }
}


; 计算提醒时间函数
calculateReminderTime(eventTime) {
    parts := StrSplit(eventTime, ":")
    hour := Integer(parts[1])
    minute := Integer(parts[2])
    
    ; 减去10分钟
    ; 10
    totalMinutes := hour * 60 + minute - 6
    
    ; 处理跨小时计算
    newHour := Floor(totalMinutes / 60)
    newMinute := Mod(totalMinutes, 60)
    
    ; 处理跨天情况（凌晨时段）
    ; if (newHour < 0) {
    ;     newHour += 24
    ; }
    
    ; 格式化为 HH:mm
    return Format("{:02}:{:02}", newHour, newMinute)
}
