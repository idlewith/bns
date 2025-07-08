#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\bns_color.ahk

; 剑士取色，判断技能是否可是施展


class QigongAvailability
{

    ; 气功火C技能是否能施展
    IsHuoCAvailable() {
        return ColorDistance(PixelGetColor(1314, 1312), "0x812528") < 50
    }

    IsBingCAvailable() {
        return ColorDistance(PixelGetColor(1311, 1311), "0x8AB2DC") < 50
    }

    Is3Available() {
        return ColorDistance(PixelGetColor(1312, 1224), "0x659FCE") < 50
    }

}

