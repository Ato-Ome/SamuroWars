--xgm github update
String = {}
SpawnRect = {}
Trigger = {}
Mana = {}
Mode ={
    Button = {},
    Dialog = DialogCreate(),
    Voices = {
        DM = 0,
        TVT = 0
    }
}
Players = 0
Hint = {}
CritFactor = {}
CritDefault = {}
Counter = {}
Stats = {}
KillToWin = 40
Timer = CreateTimer()
Team = {
    [0] = CreateForce(),
    [1] = CreateForce()
}
WinTeam = nil
Effect = {}
Boost = {
    Count = 6,
    [1] = FourCC('I000'),
    [2] = FourCC('I001'),
    [3] = FourCC('I002'),
    [4] = FourCC('I003'),
    [5] = FourCC('I004'),
    [6] = FourCC('I005')
}
AllPlayers = 0

Color = {
    [1] = "|cffff0303",
    [2] =  "|cff0042ff",
    [3] =  "|cff1ce6b9",
    [4] =  "|cff540081",
    [5] =  "|cfffffc01",
    [6] =  "|cffFE8A0E",
    [7] =  "|cff20c000",
    [8] =  "|cffe55bb0",
    [9] =  "|cff959697",
    [10] = "|cff7ebff1",
    [11] = "|cff106246",
    [12] = "|cff4e2a04",
    [13] = "|cff9B0000",
    [14] = "|cff0000C3",
    [15] = "|cff00EAFF",
    [16] = "|cffBE00FE",
    [17] = "|cffEBCD87",
    [18] = "|cffF8A48B",
    [19] = "|cffBFFF80",
    [20] = "|cffDCB9EB",
    [21] = "|cff282828",
    [22] = "|cffEBF0FF",
    [23] = "|cff00781E",
    [24] = "|cffA46F33"
}

PlayerColors = {
    [1] = {R = 255, G = 3, B = 3}, --Red
    [2] = {R = 0, G = 66, B = 255}, --Blue
    [3] = {R = 230, G = 185, B = 84}, --Teal
    [4] = {R = 84, G = 0, B = 129}, --Purple
    [5] = {R = 255, G = 252, B = 0}, --Yellow
    [6] = {R = 254, G = 138, B = 14}, --Orange
    [7] = {R = 32, G = 192, B = 0}, --Green
    [8] = {R = 229, G = 91, B = 176}, --Pink
    [9] = {R = 149, G = 150, B = 151}, --Gray
    [10] = {R = 126, G = 191, B = 241}, --LightBlue
    [11] = {R = 16, G = 98, B = 70}, --DarkGreen
    [12] = {R = 78, G = 42, B = 4}, --Brown
    [13] = {R = 155, G = 0, B = 0}, --Maroon
    [14] = {R = 0, G = 0, B = 195}, --Navy
    [15] = {R = 0, G = 254, B = 255}, --Turqoise
    [16] = {R = 190, G = 0, B = 254}, --Violet
    [17] = {R = 235, G = 205, B = 135}, --Wheat
    [18] = {R = 248, G = 164, B = 139}, --Peach
    [19] = {R = 191, G = 255, B = 128}, --Mint
    [20] = {R = 220, G = 185, B = 235}, --Lavender
    [21] = {R = 40, G = 40, B = 40}, --Coal
    [22] = {R = 235, G = 240, B = 255}, --Snow
    [23] = {R = 0, G = 120, B = 38}, --Emerald
    [24] = {R = 164, G = 111, B = 51} --Peanut
}

String = {
    enUS = {
        Multiboard = {
            Player = "Player",
            Kills = "Kills",
        },
        Rune = {
            [1] = "|r has created in ",
            [2] = " of center region"
        },
        Win = {
            Player = "|r player has won, congratulate him, game will be end in |c00FFFC005|r second",
            Team = "|r team has won, congratulate them, game will be end in |c00FFFC005|r second"
        },
        Loose = {
            TVT = "Your team are loose, come again to win",
            DM = "You are loose, come again to win",
        },
        Kill = "|r has killed a ",
        Hint = {
            Slash = "|c0000FF40Hint:|r Slashing strike deals damage to enemies in front of you, but be careful, it can also be parried",
            Kill = {
                [1] = "|c0000FF40Hint:|r You have killed an enemy, collect |c00FFFC00",
                [2] = "|r kills to win"
            },
            Death = {
                [1] = "|c0000FF40Hint:|r Your hero will be Revive in |c00FFFC00",
                [2] = "|r second"
            },
            Damage = "|c0000FF40Hint:|r Damage dealt will fill your mana",
            Parry = "|c0000FF40Hint:|r Parry returns all damage filling up your mana, also it increases your damage factor for |c00FFFC002|r  sec",
            CounterFT = "Counter",
            ParryFT = "Parry"
        },
        Rect = {
            [1] = "|r has created in ",
            [2] = " of center region",
            TL = "|c0000FF40top left|r",
            TR= "|c0000FF40top right|r",
            BL = "|c0000FF40bottom left|r",
            BR = "|c0000FF40bottom right|r"
        },
        Force = "Force",
        Mode = {
            DM = "|c00FF0000Death Match|r mode was chosen by voting prepare to fight, your allies will become to enemy in |c00FFFC005|r second",
            TVT = "|c0000FFFFTeam vs Team|r mode was chosen by voting prepare to fight",
            DMTimer = "Game Start",
            DMVote = "You have voted |c00FF0000Death Match|r mode, wait for others",
            TVTVote = "You have voted |c00FF0000Team vs Team|r mode, wait for others",
            Choose = "Mode choose",
            VotingEnd = "Voting ends",
            DMButton = "Death Match [|Cfffed312D|r]",
            TVTButton = "Team vs Team [|Cfffed312T|r]",
            ScoreTable = {
                [1] = "Score Table |c00FFFC00|n",
                [2] = "|r kills to win"
            },
        }
    },
    ruRU = {
        Rune = {
            [1] = "|r создана в ",
            [2] = " центральной области"
        },
        Win = {
            Player = "|r победил, поздравьте его, игра закончится через |c00FFFC005|r second",
            Team = "|r победила, поздравьте их, игра закончится через |c00FFFC005|r second"
        },
        Loose = {
            TVT = "Ваша команда проиграла, возвращайся снова, чтобы победить",
            DM = "Ты проиграл, возвращайся снова, чтобы победить",
        },
        Kill = "|r убил ",
        Hint = {
            Slash = "|c0000FF40Подсказка:|r Режущий удар наносит урон врагам впереди, но будьте осторожны, он может быть паррирован.",
            Kill = {
                [1] = "|c0000FF40Подсказка:|r Вы убили врага, соберите |c00FFFC00",
                [2] = "|r убийств для победы"
            },
            Death = {
                [1] = "|c0000FF40Подсказка:|r Ваш герой будет воскрешен через |c00FFFC00",
                [2] = "|r секунд"
            },
            Damage = "|c0000FF40Подсказка:|r Наносимый урон будет восполнять ваш запас маны",
            Parry = "|c0000FF40Подсказка:|r Парирование отражает весь урон, восполняя запас маны, также увеличивает критический фактор на |c00FFFC002|r  секунды",
            CounterFT = "Контрудар",
            ParryFT = "Парирование"
        },
        Rect = {
            [1] = "|r создана в ",
            [2] = " центральной области",
            TL = "|c0000FF40верхнем левом углу|r",
            TR= "|c0000FF40верхнем правом углу|r",
            BL = "|c0000FF40нижнем левом углу|r",
            BR = "|c0000FF40нижнем правом углу|r"
        },
        Force = "Команда",
        Mode = {
            DM = "|c00FF0000Death Match|r режим был выбран путем голосования, приготовьтесь к бою, ваши союзники станут врагами через |c00FFFC005|r секунд",
            TVT = "|c0000FFFFTeam vs Team|r режим был выбран путем голосования, приготовьтесь к бою",
            DMTimer = "Начало игры",
            DMVote = "Вы проголосовали за |c00FF0000Death Match|r мод, дождитесь остальных",
            TVTVote = "Вы проголосовали за |c00FF0000Team vs Team|r мод, дождитесь остальных",
            Choose = "Выбор мода",
            VotingEnd = "Конец голосования",
            DMButton = "Death Match [|Cfffed312D|r]",
            TVTButton = "Team vs Team [|Cfffed312T|r]",
            ScoreTable = {
                [1] = "Таблица лидеров |c00FFFC00|n",
                [2] = "|r убийств для победы"
            }
        }
    },
    zhCN = {
        Rune = {
            [1] = "|r 已在 ",
            [2] = " 中心区域"
        },
        Win = {
            Player = "|r 玩家赢了，恭喜他，比赛将在 |c00FFFC005|r 第二",
            Team = "|r 球队赢了，祝贺他们，比赛将以 |c00FFFC005|r 第二"
        },
        Loose = {
            TVT = "您的团队很松散，再次获胜",
            DM = "你很松，再来赢",
        },
        Kill = "|r 杀死了一个 ",
        Hint = {
            Slash = "|c0000FF40暗示:|r 猛烈的打击会对前方的敌人造成伤害，但请注意，它也可以招架",
            Kill = {
                [1] = "|c0000FF40暗示:|r 你杀了一个敌人，收集 |c00FFFC00",
                [2] = "|r 杀死胜利"
            },
            Death = {
                [1] = "|c0000FF40暗示:|r 您的英雄将复活 |c00FFFC00",
                [2] = "|r 第二"
            },
            Damage = "|c0000FF40暗示:|r 造成的伤害将填补你的法力值",
            Parry = "|c0000FF40暗示:|r 帕里退还所有伤害，填满您的法力，同时也会增加您的伤害系数 |c00FFFC002|r  第二",
            CounterFT = "计数器",
            ParryFT = "帕里"
        },
        Rect = {
            [1] = "|r 已在 ",
            [2] = " 中心区域",
            TL = "|c0000FF40左上方|r",
            TR= "|c0000FF40右上|r",
            BL = "|c0000FF40左下方|r",
            BR = "|c0000FF40右下|r"
        },
        Force = "力",
        Mode = {
            DM = "|c00FF0000死亡竞赛|r模式是通过投票准备战斗而选择的，您的盟友将在|c00FFFC005|r秒内成为敌人",
            TVT = "|c0000FFFF团队vs团队|r模式通过投票准备战斗",
            DMTimer = "游戏开始",
            DMVote = "您已投票|c00FF0000死亡竞赛|r模式，等待其他人",
            TVTVote = "您已投票|c00FF0000团队vs团队|r模式，等待其他人",
            Choose = "模式选择",
            VotingEnd = "投票结束",
            DMButton = "死亡竞赛 [|Cfffed312D|r]",
            TVTButton = "团队vs团队 [|Cfffed312T|r]",
            ScoreTable = {
                [1] = "得分表 |c00FFFC00|n",
                [2] = "|r 杀死胜利"
            }
        }
    },
    esES = {
        Rune = {
            [1] = "|r has created in ",
            [2] = " of center region"
        },
        Win = {
            Player = "|r player has won, congratulate him, game will be end in |c00FFFC005|r second",
            Team = "|r team has won, congratulate them, game will be end in |c00FFFC005|r second"
        },
        Loose = {
            TVT = "Your team are loose, come again to win",
            DM = "You are loose, come again to win",
        },
        Kill = "|r has killed a ",
        Hint = {
            Slash = "|c0000FF40Hint:|r Slashing strike deals damage to enemies in front of you, but be careful, it can also be parried",
            Kill = {
                [1] = "|c0000FF40Hint:|r You have killed an enemy, collect |c00FFFC00",
                [2] = "|r kills to win"
            },
            Death = {
                [1] = "|c0000FF40Hint:|r Your hero will be Revive in |c00FFFC00",
                [2] = "|r second"
            },
            Damage = "|c0000FF40Hint:|r Damage dealt will fill your mana",
            Parry = "|c0000FF40Hint:|r Parry returns all damage filling up your mana, also it increases your damage factor for |c00FFFC002|r  sec",
            CounterFT = "Counter",
            ParryFT = "Parry"
        },
        Rect = {
            [1] = "|r has created in ",
            [2] = " of center region",
            TL = "|c0000FF40top left|r",
            TR= "|c0000FF40top right|r",
            BL = "|c0000FF40bottom left|r",
            BR = "|c0000FF40bottom right|r"
        },
        Force = "Force",
        Mode = {
            DM = "|c00FF0000Death Match|r mode was chosen by voting prepare to fight, your allies will become to enemy in |c00FFFC005|r second",
            TVT = "|c0000FFFFTeam vs Team|r mode was chosen by voting prepare to fight",
            DMTimer = "Game Start",
            DMVote = "You have voted |c00FF0000Death Match|r mode, wait for others",
            TVTVote = "You have voted |c00FF0000Team vs Team|r mode, wait for others",
            Choose = "Mode choose",
            VotingEnd = "Voting ends",
            DMButton = "Death Match [|Cfffed312D|r]",
            TVTButton = "Team vs Team [|Cfffed312T|r]",
            ScoreTable = {
                [1] = "Score Table |c00FFFC00|n",
                [2] = "|r kills to win"
            },
        }
    },
    deDE = {
        Rune = {
            [1] = "|r has created in ",
            [2] = " of center region"
        },
        Win = {
            Player = "|r player has won, congratulate him, game will be end in |c00FFFC005|r second",
            Team = "|r team has won, congratulate them, game will be end in |c00FFFC005|r second"
        },
        Loose = {
            TVT = "Your team are loose, come again to win",
            DM = "You are loose, come again to win",
        },
        Kill = "|r has killed a ",
        Hint = {
            Slash = "|c0000FF40Hint:|r Slashing strike deals damage to enemies in front of you, but be careful, it can also be parried",
            Kill = {
                [1] = "|c0000FF40Hint:|r You have killed an enemy, collect |c00FFFC00",
                [2] = "|r kills to win"
            },
            Death = {
                [1] = "|c0000FF40Hint:|r Your hero will be Revive in |c00FFFC00",
                [2] = "|r second"
            },
            Damage = "|c0000FF40Hint:|r Damage dealt will fill your mana",
            Parry = "|c0000FF40Hint:|r Parry returns all damage filling up your mana, also it increases your damage factor for |c00FFFC002|r  sec",
            CounterFT = "Counter",
            ParryFT = "Parry"
        },
        Rect = {
            [1] = "|r has created in ",
            [2] = " of center region",
            TL = "|c0000FF40top left|r",
            TR= "|c0000FF40top right|r",
            BL = "|c0000FF40bottom left|r",
            BR = "|c0000FF40bottom right|r"
        },
        Force = "Force",
        Mode = {
            DM = "|c00FF0000Death Match|r mode was chosen by voting prepare to fight, your allies will become to enemy in |c00FFFC005|r second",
            TVT = "|c0000FFFFTeam vs Team|r mode was chosen by voting prepare to fight",
            DMTimer = "Game Start",
            DMVote = "You have voted |c00FF0000Death Match|r mode, wait for others",
            TVTVote = "You have voted |c00FF0000Team vs Team|r mode, wait for others",
            Choose = "Mode choose",
            VotingEnd = "Voting ends",
            DMButton = "Death Match [|Cfffed312D|r]",
            TVTButton = "Team vs Team [|Cfffed312T|r]",
            ScoreTable = {
                [1] = "Score Table |c00FFFC00|n",
                [2] = "|r kills to win"
            },
        }
    },
    esMX = {
        Rune = {
            [1] = "|r has created in ",
            [2] = " of center region"
        },
        Win = {
            Player = "|r player has won, congratulate him, game will be end in |c00FFFC005|r second",
            Team = "|r team has won, congratulate them, game will be end in |c00FFFC005|r second"
        },
        Loose = {
            TVT = "Your team are loose, come again to win",
            DM = "You are loose, come again to win",
        },
        Kill = "|r has killed a ",
        Hint = {
            Slash = "|c0000FF40Hint:|r Slashing strike deals damage to enemies in front of you, but be careful, it can also be parried",
            Kill = {
                [1] = "|c0000FF40Hint:|r You have killed an enemy, collect |c00FFFC00",
                [2] = "|r kills to win"
            },
            Death = {
                [1] = "|c0000FF40Hint:|r Your hero will be Revive in |c00FFFC00",
                [2] = "|r second"
            },
            Damage = "|c0000FF40Hint:|r Damage dealt will fill your mana",
            Parry = "|c0000FF40Hint:|r Parry returns all damage filling up your mana, also it increases your damage factor for |c00FFFC002|r  sec",
            CounterFT = "Counter",
            ParryFT = "Parry"
        },
        Rect = {
            [1] = "|r has created in ",
            [2] = " of center region",
            TL = "|c0000FF40top left|r",
            TR= "|c0000FF40top right|r",
            BL = "|c0000FF40bottom left|r",
            BR = "|c0000FF40bottom right|r"
        },
        Force = "Force",
        Mode = {
            DM = "|c00FF0000Death Match|r mode was chosen by voting prepare to fight, your allies will become to enemy in |c00FFFC005|r second",
            TVT = "|c0000FFFFTeam vs Team|r mode was chosen by voting prepare to fight",
            DMTimer = "Game Start",
            DMVote = "You have voted |c00FF0000Death Match|r mode, wait for others",
            TVTVote = "You have voted |c00FF0000Team vs Team|r mode, wait for others",
            Choose = "Mode choose",
            VotingEnd = "Voting ends",
            DMButton = "Death Match [|Cfffed312D|r]",
            TVTButton = "Team vs Team [|Cfffed312T|r]",
            ScoreTable = {
                [1] = "Score Table |c00FFFC00|n",
                [2] = "|r kills to win"
            },
        }
    },
    frFR = {
        Rune = {
            [1] = "|r has created in ",
            [2] = " of center region"
        },
        Win = {
            Player = "|r player has won, congratulate him, game will be end in |c00FFFC005|r second",
            Team = "|r team has won, congratulate them, game will be end in |c00FFFC005|r second"
        },
        Loose = {
            TVT = "Your team are loose, come again to win",
            DM = "You are loose, come again to win",
        },
        Kill = "|r has killed a ",
        Hint = {
            Slash = "|c0000FF40Hint:|r Slashing strike deals damage to enemies in front of you, but be careful, it can also be parried",
            Kill = {
                [1] = "|c0000FF40Hint:|r You have killed an enemy, collect |c00FFFC00",
                [2] = "|r kills to win"
            },
            Death = {
                [1] = "|c0000FF40Hint:|r Your hero will be Revive in |c00FFFC00",
                [2] = "|r second"
            },
            Damage = "|c0000FF40Hint:|r Damage dealt will fill your mana",
            Parry = "|c0000FF40Hint:|r Parry returns all damage filling up your mana, also it increases your damage factor for |c00FFFC002|r  sec",
            CounterFT = "Counter",
            ParryFT = "Parry"
        },
        Rect = {
            [1] = "|r has created in ",
            [2] = " of center region",
            TL = "|c0000FF40top left|r",
            TR= "|c0000FF40top right|r",
            BL = "|c0000FF40bottom left|r",
            BR = "|c0000FF40bottom right|r"
        },
        Force = "Force",
        Mode = {
            DM = "|c00FF0000Death Match|r mode was chosen by voting prepare to fight, your allies will become to enemy in |c00FFFC005|r second",
            TVT = "|c0000FFFFTeam vs Team|r mode was chosen by voting prepare to fight",
            DMTimer = "Game Start",
            DMVote = "You have voted |c00FF0000Death Match|r mode, wait for others",
            TVTVote = "You have voted |c00FF0000Team vs Team|r mode, wait for others",
            Choose = "Mode choose",
            VotingEnd = "Voting ends",
            DMButton = "Death Match [|Cfffed312D|r]",
            TVTButton = "Team vs Team [|Cfffed312T|r]",
            ScoreTable = {
                [1] = "Score Table |c00FFFC00|n",
                [2] = "|r kills to win"
            },
        }
    },
    itIT = {
        Rune = {
            [1] = "|r has created in ",
            [2] = " of center region"
        },
        Win = {
            Player = "|r player has won, congratulate him, game will be end in |c00FFFC005|r second",
            Team = "|r team has won, congratulate them, game will be end in |c00FFFC005|r second"
        },
        Loose = {
            TVT = "Your team are loose, come again to win",
            DM = "You are loose, come again to win",
        },
        Kill = "|r has killed a ",
        Hint = {
            Slash = "|c0000FF40Hint:|r Slashing strike deals damage to enemies in front of you, but be careful, it can also be parried",
            Kill = {
                [1] = "|c0000FF40Hint:|r You have killed an enemy, collect |c00FFFC00",
                [2] = "|r kills to win"
            },
            Death = {
                [1] = "|c0000FF40Hint:|r Your hero will be Revive in |c00FFFC00",
                [2] = "|r second"
            },
            Damage = "|c0000FF40Hint:|r Damage dealt will fill your mana",
            Parry = "|c0000FF40Hint:|r Parry returns all damage filling up your mana, also it increases your damage factor for |c00FFFC002|r  sec",
            CounterFT = "Counter",
            ParryFT = "Parry"
        },
        Rect = {
            [1] = "|r has created in ",
            [2] = " of center region",
            TL = "|c0000FF40top left|r",
            TR= "|c0000FF40top right|r",
            BL = "|c0000FF40bottom left|r",
            BR = "|c0000FF40bottom right|r"
        },
        Force = "Force",
        Mode = {
            DM = "|c00FF0000Death Match|r mode was chosen by voting prepare to fight, your allies will become to enemy in |c00FFFC005|r second",
            TVT = "|c0000FFFFTeam vs Team|r mode was chosen by voting prepare to fight",
            DMTimer = "Game Start",
            DMVote = "You have voted |c00FF0000Death Match|r mode, wait for others",
            TVTVote = "You have voted |c00FF0000Team vs Team|r mode, wait for others",
            Choose = "Mode choose",
            VotingEnd = "Voting ends",
            DMButton = "Death Match [|Cfffed312D|r]",
            TVTButton = "Team vs Team [|Cfffed312T|r]",
            ScoreTable = {
                [1] = "Score Table |c00FFFC00|n",
                [2] = "|r kills to win"
            },
        }
    },
    koKR = {
        Rune = {
            [1] = "|r has created in ",
            [2] = " of center region"
        },
        Win = {
            Player = "|r player has won, congratulate him, game will be end in |c00FFFC005|r second",
            Team = "|r team has won, congratulate them, game will be end in |c00FFFC005|r second"
        },
        Loose = {
            TVT = "Your team are loose, come again to win",
            DM = "You are loose, come again to win",
        },
        Kill = "|r has killed a ",
        Hint = {
            Slash = "|c0000FF40Hint:|r Slashing strike deals damage to enemies in front of you, but be careful, it can also be parried",
            Kill = {
                [1] = "|c0000FF40Hint:|r You have killed an enemy, collect |c00FFFC00",
                [2] = "|r kills to win"
            },
            Death = {
                [1] = "|c0000FF40Hint:|r Your hero will be Revive in |c00FFFC00",
                [2] = "|r second"
            },
            Damage = "|c0000FF40Hint:|r Damage dealt will fill your mana",
            Parry = "|c0000FF40Hint:|r Parry returns all damage filling up your mana, also it increases your damage factor for |c00FFFC002|r  sec",
            CounterFT = "Counter",
            ParryFT = "Parry"
        },
        Rect = {
            [1] = "|r has created in ",
            [2] = " of center region",
            TL = "|c0000FF40top left|r",
            TR= "|c0000FF40top right|r",
            BL = "|c0000FF40bottom left|r",
            BR = "|c0000FF40bottom right|r"
        },
        Force = "Force",
        Mode = {
            DM = "|c00FF0000Death Match|r mode was chosen by voting prepare to fight, your allies will become to enemy in |c00FFFC005|r second",
            TVT = "|c0000FFFFTeam vs Team|r mode was chosen by voting prepare to fight",
            DMTimer = "Game Start",
            DMVote = "You have voted |c00FF0000Death Match|r mode, wait for others",
            TVTVote = "You have voted |c00FF0000Team vs Team|r mode, wait for others",
            Choose = "Mode choose",
            VotingEnd = "Voting ends",
            DMButton = "Death Match [|Cfffed312D|r]",
            TVTButton = "Team vs Team [|Cfffed312T|r]",
            ScoreTable = {
                [1] = "Score Table |c00FFFC00|n",
                [2] = "|r kills to win"
            },
        }
    },
    plPL = {
        Rune = {
            [1] = "|r has created in ",
            [2] = " of center region"
        },
        Win = {
            Player = "|r player has won, congratulate him, game will be end in |c00FFFC005|r second",
            Team = "|r team has won, congratulate them, game will be end in |c00FFFC005|r second"
        },
        Loose = {
            TVT = "Your team are loose, come again to win",
            DM = "You are loose, come again to win",
        },
        Kill = "|r has killed a ",
        Hint = {
            Slash = "|c0000FF40Hint:|r Slashing strike deals damage to enemies in front of you, but be careful, it can also be parried",
            Kill = {
                [1] = "|c0000FF40Hint:|r You have killed an enemy, collect |c00FFFC00",
                [2] = "|r kills to win"
            },
            Death = {
                [1] = "|c0000FF40Hint:|r Your hero will be Revive in |c00FFFC00",
                [2] = "|r second"
            },
            Damage = "|c0000FF40Hint:|r Damage dealt will fill your mana",
            Parry = "|c0000FF40Hint:|r Parry returns all damage filling up your mana, also it increases your damage factor for |c00FFFC002|r  sec",
            CounterFT = "Counter",
            ParryFT = "Parry"
        },
        Rect = {
            [1] = "|r has created in ",
            [2] = " of center region",
            TL = "|c0000FF40top left|r",
            TR= "|c0000FF40top right|r",
            BL = "|c0000FF40bottom left|r",
            BR = "|c0000FF40bottom right|r"
        },
        Force = "Force",
        Mode = {
            DM = "|c00FF0000Death Match|r mode was chosen by voting prepare to fight, your allies will become to enemy in |c00FFFC005|r second",
            TVT = "|c0000FFFFTeam vs Team|r mode was chosen by voting prepare to fight",
            DMTimer = "Game Start",
            DMVote = "You have voted |c00FF0000Death Match|r mode, wait for others",
            TVTVote = "You have voted |c00FF0000Team vs Team|r mode, wait for others",
            Choose = "Mode choose",
            VotingEnd = "Voting ends",
            DMButton = "Death Match [|Cfffed312D|r]",
            TVTButton = "Team vs Team [|Cfffed312T|r]",
            ScoreTable = {
                [1] = "Score Table |c00FFFC00|n",
                [2] = "|r kills to win"
            },
        }
    },
    ptBR = {
        Rune = {
            [1] = "|r has created in ",
            [2] = " of center region"
        },
        Win = {
            Player = "|r player has won, congratulate him, game will be end in |c00FFFC005|r second",
            Team = "|r team has won, congratulate them, game will be end in |c00FFFC005|r second"
        },
        Loose = {
            TVT = "Your team are loose, come again to win",
            DM = "You are loose, come again to win",
        },
        Kill = "|r has killed a ",
        Hint = {
            Slash = "|c0000FF40Hint:|r Slashing strike deals damage to enemies in front of you, but be careful, it can also be parried",
            Kill = {
                [1] = "|c0000FF40Hint:|r You have killed an enemy, collect |c00FFFC00",
                [2] = "|r kills to win"
            },
            Death = {
                [1] = "|c0000FF40Hint:|r Your hero will be Revive in |c00FFFC00",
                [2] = "|r second"
            },
            Damage = "|c0000FF40Hint:|r Damage dealt will fill your mana",
            Parry = "|c0000FF40Hint:|r Parry returns all damage filling up your mana, also it increases your damage factor for |c00FFFC002|r  sec",
            CounterFT = "Counter",
            ParryFT = "Parry"
        },
        Rect = {
            [1] = "|r has created in ",
            [2] = " of center region",
            TL = "|c0000FF40top left|r",
            TR= "|c0000FF40top right|r",
            BL = "|c0000FF40bottom left|r",
            BR = "|c0000FF40bottom right|r"
        },
        Force = "Force",
        Mode = {
            DM = "|c00FF0000Death Match|r mode was chosen by voting prepare to fight, your allies will become to enemy in |c00FFFC005|r second",
            TVT = "|c0000FFFFTeam vs Team|r mode was chosen by voting prepare to fight",
            DMTimer = "Game Start",
            DMVote = "You have voted |c00FF0000Death Match|r mode, wait for others",
            TVTVote = "You have voted |c00FF0000Team vs Team|r mode, wait for others",
            Choose = "Mode choose",
            VotingEnd = "Voting ends",
            DMButton = "Death Match [|Cfffed312D|r]",
            TVTButton = "Team vs Team [|Cfffed312T|r]",
            ScoreTable = {
                [1] = "Score Table |c00FFFC00|n",
                [2] = "|r kills to win"
            },
        }
    },
    zhTW = {
        Rune = {
            [1] = "|r has created in ",
            [2] = " of center region"
        },
        Win = {
            Player = "|r player has won, congratulate him, game will be end in |c00FFFC005|r second",
            Team = "|r team has won, congratulate them, game will be end in |c00FFFC005|r second"
        },
        Loose = {
            TVT = "Your team are loose, come again to win",
            DM = "You are loose, come again to win",
        },
        Kill = "|r has killed a ",
        Hint = {
            Slash = "|c0000FF40Hint:|r Slashing strike deals damage to enemies in front of you, but be careful, it can also be parried",
            Kill = {
                [1] = "|c0000FF40Hint:|r You have killed an enemy, collect |c00FFFC00",
                [2] = "|r kills to win"
            },
            Death = {
                [1] = "|c0000FF40Hint:|r Your hero will be Revive in |c00FFFC00",
                [2] = "|r second"
            },
            Damage = "|c0000FF40Hint:|r Damage dealt will fill your mana",
            Parry = "|c0000FF40Hint:|r Parry returns all damage filling up your mana, also it increases your damage factor for |c00FFFC002|r  sec",
            CounterFT = "Counter",
            ParryFT = "Parry"
        },
        Rect = {
            [1] = "|r has created in ",
            [2] = " of center region",
            TL = "|c0000FF40top left|r",
            TR= "|c0000FF40top right|r",
            BL = "|c0000FF40bottom left|r",
            BR = "|c0000FF40bottom right|r"
        },
        Force = "Force",
        Mode = {
            DM = "|c00FF0000Death Match|r mode was chosen by voting prepare to fight, your allies will become to enemy in |c00FFFC005|r second",
            TVT = "|c0000FFFFTeam vs Team|r mode was chosen by voting prepare to fight",
            DMTimer = "Game Start",
            DMVote = "You have voted |c00FF0000Death Match|r mode, wait for others",
            TVTVote = "You have voted |c00FF0000Team vs Team|r mode, wait for others",
            Choose = "Mode choose",
            VotingEnd = "Voting ends",
            DMButton = "Death Match [|Cfffed312D|r]",
            TVTButton = "Team vs Team [|Cfffed312T|r]",
            ScoreTable = {
                [1] = "Score Table |c00FFFC00|n",
                [2] = "|r kills to win"
            },
        }
    }
}