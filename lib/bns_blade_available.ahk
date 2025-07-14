#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\bns_color.ahk

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

}

