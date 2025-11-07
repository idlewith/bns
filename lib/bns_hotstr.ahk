#Requires AutoHotkey v2.0


#Hotstring EndChars `t

::amtls::
{
    UseCtrlVSendText("阿玛忒拉斯")
}



UseCtrlVSendText(text) {

    A_Clipboard := text
    Sleep 200
    Send "^v"

}