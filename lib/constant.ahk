#Requires AutoHotkey v2.0

; 剑灵进程名
BNSNEOWinTitle := "ahk_exe BNSR.exe"
BNSZSTitle := "ahk_exe 剑灵小助手.exe"


; 职业
CareerBladeMaster := "剑士"
CareerForceMaster := "气功"

; 附件功能
AdditionalMovePositionInUpgrade := "主线移动位置"
AdditionalBladeMasterKillBossAndPickThing := "剑士挂机BOSS并捡物品"
AdditionalForceMasterKillBossAndPickThing := "气功挂机BOSS并捡物品"
AdditionalPressF := "挂机转转盘"
AdditionalCreateAccount := "创建账号"
AdditionalGetBilibiliCoin := "领取B币券"
AdditionalBNSZSCheck := "剑灵小助手客户端签到"
AdditionalMouseLeftClick := "点击左键"
AdditionalCheckPrice := "检查价格"
ActivityLeftMoudeEnter := "活动左键-enter领取材料"



; 中文星期映射表
weekdayMap := ["周日", "周一", "周二", "周三", "周四", "周五", "周六"]

; 浊魔灵刷新数据表
zhuMoLingData := Map(
    "周一", [
        {time: "03:10", locations: ["灰狼村", "白雾森林"]},
        {time: "05:20", locations: ["悲鸣村", "天狼陵"]},
        {time: "08:33", locations: ["悲鸣村", "灰狼村"]},
        {time: "11:37", locations: ["土门客栈", "海岸客栈"]},
        {time: "15:23", locations: ["土门客栈", "巨岩谷"]},
        {time: "18:49", locations: ["巨岩谷", "孤村"]},
        {time: "21:59", locations: ["海岸客栈", "半月湖"]}
    ],
    "周二", [
        {time: "02:05", locations: ["灰狼村", "半月湖"]},
        {time: "04:55", locations: ["天狼陵", "巨岩谷"]},
        {time: "07:25", locations: ["白雾森林", "烈沙/孤村"]},
        {time: "09:26", locations: ["半月湖", "烈沙/孤村"]},
        {time: "11:55", locations: ["烈沙/孤村", "悲鸣村"]},
        {time: "13:59", locations: ["烈沙/孤村", "悲鸣村"]},
        {time: "16:47", locations: ["鬼都", "黑森林"]},
        {time: "19:44", locations: ["巨岩谷", "黑森林"]},
        {time: "23:18", locations: ["海岸客栈", "孤村"]}
    ],
    "周三", [
        {time: "01:30", locations: ["海岸客栈", "未知"]},
        {time: "13:44", locations: ["半月湖", "海岸客栈"]},
        {time: "17:21", locations: ["白雾森林", "悲鸣村"]},
        {time: "20:42", locations: ["半月湖", "灰狼村"]},
        {time: "23:35", locations: ["白雾森林", "孤村"]}
    ],
    "周四", [
        {time: "01:50", locations: ["鬼都", "悲鸣村"]},
        {time: "05:15", locations: ["半月湖", "白雾森林"]},
        {time: "09:02", locations: ["黑森林", "鬼都"]},
        {time: "12:49", locations: ["灰狼村", "半月湖"]},
        {time: "16:39", locations: ["天狼陵", "鬼都"]},
        {time: "19:25", locations: ["天狼陵", "鬼都"]},
        {time: "21:58", locations: ["灰狼村", "巨岩谷"]}
    ],
    "周五", [
        {time: "01:36", locations: ["孤村", "鬼都"]},
        {time: "06:45", locations: ["半月湖", "烈沙/孤村"]},
        {time: "08:56", locations: ["半月湖", "白雾森林"]},
        {time: "11:07", locations: ["海岸客栈", "巨岩谷"]},
        {time: "13:11", locations: ["天狼陵", "烈沙/孤村"]},
        {time: "17:08", locations: ["孤村", "巨岩谷"]},
        {time: "19:44", locations: ["鬼都", "巨岩谷"]},
        {time: "22:18", locations: ["白雾森林", "悲鸣村"]}
    ],
    "周六", [
        {time: "07:06", locations: ["天狼陵", "黑森林"]},
        {time: "09:29", locations: ["海岸客栈", "鬼都"]},
        {time: "11:59", locations: ["半月湖", "天狼陵"]},
        {time: "15:06", locations: ["巨岩谷", "悲鸣村"]},
        {time: "19:04", locations: ["天狼陵", "未知"]},
        {time: "21:52", locations: ["黑森林", "灰狼村"]}
    ],
    "周日", [
        {time: "02:56", locations: ["海岸客栈", "灰狼村"]},
        {time: "04:56", locations: ["巨岩谷", "悲鸣村"]},
        {time: "06:32", locations: ["烈沙/孤村", "未知"]},
        {time: "10:05", locations: ["天狼陵", "未知"]},
        {time: "12:33", locations: ["鬼都", "白雾森林"]},
        {time: "14:47", locations: ["鬼都", "天狼陵"]},
        {time: "17:11", locations: ["白雾森林", "黑森林"]},
        {time: "21:10", locations: ["海岸客栈", "灰狼村"]}
    ]
)

