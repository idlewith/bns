#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\constant.ahk

; 设置文件编码为 UTF-8（带BOM头）
FileEncoding "UTF-8"

; 初始化配置文件函数
initializeConfigFile(configFile) {
    
    if !FileExist(configFile) {
        try {
            ; 创建默认配置
            defaultConfig := "career=" CareerBladeMaster "`naltc_thing="  AdditionalBladeMasterKillBossAndPickThing
            ; 使用FileOpen确保UTF-8编码
            file := FileOpen(configFile, "w", "UTF-8")
            file.Write(defaultConfig)
            file.Close()

        } catch as e {
            MsgBox "创建配置文件失败: " e.Message, "错误", "Icon!"
        }
    }
}


; 解析配置文件函数，返回Map对象
ParseConfigFile(filePath) {
    if !FileExist(filePath) {
        throw Error("配置文件不存在: " filePath)
    }
    
    configMap := Map()  ; 创建空字典
    
    loop read, filePath {
        line := Trim(A_LoopReadLine)
        if line = "" || SubStr(line, 1, 1) = ";" {  ; 跳过空行和注释
            continue
        }
        
        ; 解析 key=value 格式
        if RegExMatch(line, "^(.*?)=(.*)$", &match) {
            key := Trim(match[1])
            value := Trim(match[2])
            
            ; 去除值部分的注释（如果有）
            if (commentPos := InStr(value, ";")) {
                value := Trim(SubStr(value, 1, commentPos-1))
            }
            
            configMap[key] := value  ; 添加到字典
        }
    }
    
    if configMap.Count = 0 {
        throw Error("配置文件中未找到有效的配置项")
    }
    
    return configMap
}