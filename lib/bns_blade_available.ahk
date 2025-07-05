#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\bns_color.ahk

; 取色，判断技能是否可是施展


class BladeAvailability
{

    ; 剑士2技能是否能施展
    Is2Available() {
        return ColorDistance(PixelGetColor(1255, 1221), "0xCA9231") < 50
    }


    ; PixelGetColor(1196, 1311) == "0x9F3B36"
    
    ; 剑士Z技能是否能施展
    IsZAvailable() {
        return ColorDistance(PixelGetColor(1197, 1311), "0x853733") < 50
    }

    ; 是否是5格内力以下，不包括5格内力
    IsManaLess5() {
        return ColorDistance(PixelGetColor(1264, 1130), "0x282625") < 50
    }

    ; 灵魂石是否可以施展
    IsSoulStoneAvailable() {
        return ColorDistance(PixelGetColor(848, 1224), "0xE7E4AE") < 50
    }
}

