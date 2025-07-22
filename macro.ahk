#Requires AutoHotkey v2.0
DetectHiddenWindows true ; 
SetTitleMatchMode 2 ;
setkeydelay -1 
#HotIf WinActive("ahk_exe" "BNSR.exe")
#SuspendExempt
#SuspendExempt False
#Include %A_ScriptDir%\lib\findtext.ahk
CyText:="|<cy>FE9700-0.83$19.400203n0Tbz83z40E20N10AUzoETy88PzYAzW61130UVUEkkTMPw8B2461630W1UH0o"
LuText:="|<lu>FF2900-0.90$7.UE84210UE8421zU"

; ========== Lunar Slash / Cyclones Anicancel
xButton2::
{
while (GetKeyState("xButton2","P"))
{
Send("{tab}")
Send("{r}")
Sleep 250

}
}
; ========== Lunar Slash / Cyclones / ( Puncture/Pierce ) Anicancel
xButton1::
{
while (GetKeyState("xButton1","P"))
{
Send("{r}")
if !GetKeyState("xButton1","P")
break
sleep 10
Send("{r}")
if !GetKeyState("xButton1","P")
break
sleep 10
Send("{r}")
if !GetKeyState("xButton1","P")
break
sleep 10
Send("{r}")
if !GetKeyState("xButton1","P")
break
sleep 10
Send("{r}")
if !GetKeyState("xButton1","P")
break
sleep 10
Send("{r}")
if !GetKeyState("xButton1","P")
break
sleep 10
Send("{r}")
if !GetKeyState("xButton1","P")
break
sleep 10
Send("{r}")
if !GetKeyState("xButton1","P")
break
sleep 125
Send("{tab}")
if !GetKeyState("xButton1","P")
break
sleep 10
Send("{tab}")
if !GetKeyState("xButton1","P")
break
sleep 10
Send("{tab}")
if !GetKeyState("xButton1","P")
break
sleep 10
Send("{tab}")
if !GetKeyState("xButton1","P")
break
sleep 10
Send("{tab}")
if !GetKeyState("xButton1","P")
break
sleep 90
	if (ok:=FindText(&X, &Y, 91, 1023, 164, 1296, 0, 0, CyText))
		{
Send("{t}")
if !GetKeyState("xButton1","P")
break
sleep 5
Send("{t}")
if !GetKeyState("xButton1","P")
break
sleep 5
Send("{t}")
if !GetKeyState("xButton1","P")
break
sleep 75
}
; else if (ok:=FindText(&X, &Y, 91, 1034, 155, 1300, 0, 0, LuText))
; 		{
; Send("{t}")
; if !GetKeyState("xButton1","P")
; break
; sleep 5
; Send("{t}")
; if !GetKeyState("xButton1","P")
; break
; sleep 5
; Send("{t}")
; if !GetKeyState("xButton1","P")
; break
; sleep 75
; }
else
		{
sleep 90
}
}
}
return