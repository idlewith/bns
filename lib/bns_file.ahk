#Requires AutoHotkey v2.0

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