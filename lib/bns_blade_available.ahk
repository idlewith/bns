#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\bns_color.ahk

; 剑士取色，判断技能是否可是施展


class BladeAvailability
{

    ; 剑士2技能是否能施展
    Is2Available() {
        return ColorDistance(PixelGetColor(1255, 1221), "0xCA9231") < 50
    }
    
    ; 剑士Z技能是否能施展
    IsZAvailable() {
        return ColorDistance(PixelGetColor(1197, 1311), "0x853733") < 50
    }

}

