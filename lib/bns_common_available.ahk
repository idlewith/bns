#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\lib\bns_color.ahk

; 公共取色，判断技能是否可是施展


class CommonAvailability
{

    ; 是否是5格内力以下，不包括5格内力
    IsManaLess5() {
        return ColorDistance(PixelGetColor(1338, 1125), "0x1E272D") < 50
    }

    ; 灵魂石是否可以施展
    IsSoulStoneAvailable() {
        return ColorDistance(PixelGetColor(848, 1224), "0xE7E4AE") < 50
    }
}