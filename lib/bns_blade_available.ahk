#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\bns_color.ahk
#Include %A_ScriptDir%\lib\findtext.ahk

; 剑士取色，判断技能是否可是施展


class BladeAvailability
{
    ; 剑士左键是否可用
    IsLeftAvailable() {
        return ColorDistance(PixelGetColor(1480, 1224), "0x32232A") < 50
    }

    ; 剑士Tab是否可用
    IsTabAvailable() {
        return ColorDistance(PixelGetColor(1091, 1222), "0xE19536") < 50
    }

    ; 剑士2技能是否能施展
    Is2Available() {
        return ColorDistance(PixelGetColor(1255, 1221), "0xCA9231") < 50
    }
    
    ; 剑士Z技能是否能施展
    IsZAvailable() {
        return ColorDistance(PixelGetColor(1197, 1311), "0x853733") < 50
    }

    ; 剑士out V技能是否能施展
    IsOutVAvaliable() {
        return ColorDistance(PixelGetColor(1371, 1316), "0x4C251F") < 50
    }

    ; 剑士in V技能是否能施展
    IsInVAvaliable() {
        return ColorDistance(PixelGetColor(1368, 1316), "0x948C71") < 50
    }

    ; 剑士Tab是否暴击
    IsTabCriticalHit() {
        return ColorDistance(PixelGetColor(123, 1268), "0xEF8E02") < 50
    }

    ; 剑士Tab是否暴击V2
    IsTabCriticalHitV2() {
        TabText := "|<>FE9700-0.83$19.400203n0Tbz83z40E20N10AUzoETy88PzYAzW61130UVUEkkTMPw8B2461630W1UH0o"
        return ok:=FindText(&X, &Y, 98, 1247, 139, 1292, 0, 0, TabText)
    }

    ; 剑士3的山崩是否能施展
    Is3Avaliable() {
        return ColorDistance(PixelGetColor(1313, 1222), "0x604B30") < 50
    }

}

