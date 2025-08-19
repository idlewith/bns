#Requires AutoHotkey v2.0

#Include RapidOcr.ahk
#Include ./ImagePut-master/ImagePut.ahk
#Include %A_ScriptDir%\lib\constant.ahk




; 检查价格
global ToggleCheckRightPrice := 0


; 检查价格
ToggleCheckPrice() {
    global ToggleCheckRightPrice := !ToggleCheckRightPrice

    if (ToggleCheckRightPrice)
    {
        SetTimer CheckRightPrice, 480000
        ToolTip "正在检查价格...", 1332, 644
    }
    else
    {
        SetTimer CheckRightPrice, 0
        SetTimer ToolTip, -500
    }
}



CheckRightPrice()

{

    Sleep 1000

    ; 激活剑灵窗口
    WinActivate BNSNEOWinTitle
    Sleep 2000

    ; 点击刷新
    MouseClick "left", 591, 975
    Sleep 1000

    ; 获取指定范围文本到剪贴板
    GetText(1613, 323, 1677, 360)
    Sleep 1000

    ; 激活微信窗口
    WinActivate WeixinWinTitle
    Sleep 2000

    ; 激活输入框
    MouseClick "left", 1752, 948
    Sleep 1000

    ; 粘贴文本
    Send "^v"
    Sleep 1000
    Send "{Enter}"
    Sleep 2000

}


GetText(x1, y1, x2, y2) {

    image_file := A_ScriptDir "\orc\image.png"

    ocr := RapidOCR({
        numThread: 6  ; 线程数（根据CPU核心数调整）
    }) 


    width := x2 - x1
    height := y2 - y1

    ImagePutFile([x1, y1, width, height], image_file)
    res := ocr.ocr_from_file(image_file, , true)
    if (res) {

        loop res.Length {

            block := res[A_Index]
            text := block.text
            x := block.boxPoint[1].x + x1
            y := block.boxPoint[1].y + y1
            allText .= text . "`n"

        }

        ;识别总文字
        A_Clipboard := alltext

    }
}





