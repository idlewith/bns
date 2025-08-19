#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\lib\bns_color.ahk

; 剑士取色，判断技能是否可是施展


class QigongAvailability
{

    ; 气功火C技能是否能施展
    IsHuoCAvailable() {
        ; return ColorDistance(PixelGetColor(1314, 1312), "0x812528") < 50
        return ColorDistance(PixelGetColor(1316, 1329), "0xFED2AC") < 90
        ;  || ColorDistance(PixelGetColor(1329, 1327), "0x450E0C") < 50
    }

    IsBingCAvailable() {
        return ColorDistance(PixelGetColor(1311, 1311), "0x8AB2DC") < 50
    }

    Is3Available() {
        return ColorDistance(PixelGetColor(1312, 1224), "0x659FCE") < 50
    }


    ; 气功冰Z技能是否能施展
    IsBingZAvailable() {
        return ColorDistance(PixelGetColor(1199, 1312), "0x1C62D2") < 50
    }

    ; 气功冰X技能是否能施展
    IsBingXAvailable() {
        return ColorDistance(PixelGetColor(1253, 1316), "0x4FBDFD") < 50
    }

    ; 气功冰1技能是否能施展
    IsBing1Available() {
        return ColorDistance(PixelGetColor(1197, 1224), "0xA8CFED") < 50
    }

}

