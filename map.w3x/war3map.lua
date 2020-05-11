gg_rct_Region_001 = nil
gg_rct_Region_002 = nil
gg_rct_Region_003 = nil
gg_rct_Region_004 = nil
gg_rct_Region_005 = nil
gg_rct_Region_007 = nil
gg_rct_Region_008 = nil
gg_rct_Region_009 = nil
gg_rct_Region_010 = nil
gg_rct_Region_011 = nil
gg_rct_Region_012 = nil
gg_rct_Region_013 = nil
gg_rct_Region_014 = nil
gg_rct_Region_015 = nil
gg_rct_Region_006 = nil
gg_rct_Region_017 = nil
gg_rct_Region_018 = nil
gg_rct_Region_019 = nil
gg_rct_Region_020 = nil
gg_rct_Region_021 = nil
gg_rct_Region_022 = nil
gg_rct_Region_023 = nil
gg_rct_Region_024 = nil
gg_rct_Region_025 = nil
gg_rct_Region_026 = nil
gg_rct_Region_016 = nil
gg_rct_Region_028 = nil
gg_rct_Region_029 = nil
gg_rct_Region_030 = nil
gg_rct_Region_027 = nil
gg_snd_great_player01 = ""
gg_snd_AchievementEarned = nil
gg_trg_Initialization = nil
gg_trg_AttackAllied = nil
gg_trg_Counter = nil
gg_trg_Leave = nil
function InitGlobals()
end

function InitSounds()
    gg_snd_great_player01 = "war3mapImported/great_player.mp3"
    gg_snd_AchievementEarned = CreateSound("Sound/Interface/AchievementEarned.flac", false, false, false, 0, 0, "DefaultEAXON")
    SetSoundParamsFromLabel(gg_snd_AchievementEarned, "AchievementEarned")
    SetSoundDuration(gg_snd_AchievementEarned, 4173)
    SetSoundVolume(gg_snd_AchievementEarned, 127)
end

function CreateAllItems()
    local itemID
    BlzCreateItemWithSkin(FourCC("I006"), 9041.4, -12627.8, FourCC("I006"))
end

function CreateRegions()
    local we
    gg_rct_Region_001 = Rect(10336.0, -15136.0, 10464.0, -15008.0)
    gg_rct_Region_002 = Rect(10464.0, -15072.0, 10592.0, -14944.0)
    gg_rct_Region_003 = Rect(10592.0, -15008.0, 10720.0, -14880.0)
    gg_rct_Region_004 = Rect(10336.0, -15008.0, 10464.0, -14880.0)
    gg_rct_Region_005 = Rect(10464.0, -14944.0, 10592.0, -14816.0)
    gg_rct_Region_007 = Rect(9376.0, -10624.0, 9504.0, -10496.0)
    gg_rct_Region_008 = Rect(9440.0, -10496.0, 9568.0, -10368.0)
    gg_rct_Region_009 = Rect(9312.0, -10496.0, 9440.0, -10368.0)
    gg_rct_Region_010 = Rect(9248.0, -10368.0, 9376.0, -10240.0)
    gg_rct_Region_011 = Rect(9376.0, -10368.0, 9504.0, -10240.0)
    gg_rct_Region_012 = Rect(9504.0, -10368.0, 9632.0, -10240.0)
    gg_rct_Region_013 = Rect(8928.0, -13568.0, 9024.0, -13472.0)
    gg_rct_Region_014 = Rect(9536.0, -13376.0, 9632.0, -13280.0)
    gg_rct_Region_015 = Rect(8640.0, -11616.0, 8736.0, -11520.0)
    gg_rct_Region_006 = Rect(10336.0, -14880.0, 10464.0, -14752.0)
    gg_rct_Region_017 = Rect(7904.0, -11968.0, 8128.0, -11744.0)
    gg_rct_Region_018 = Rect(8096.0, -10368.0, 8352.0, -10144.0)
    gg_rct_Region_019 = Rect(9696.0, -14464.0, 9888.0, -14240.0)
    gg_rct_Region_020 = Rect(10624.0, -10496.0, 10848.0, -10272.0)
    gg_rct_Region_021 = Rect(7840.0, -14976.0, 8032.0, -14752.0)
    gg_rct_Region_022 = Rect(10176.0, -12960.0, 10400.0, -12704.0)
    gg_rct_Region_023 = Rect(10432.0, -11648.0, 10688.0, -11360.0)
    gg_rct_Region_024 = Rect(6656.0, -13088.0, 6912.0, -12832.0)
    gg_rct_Region_025 = Rect(8672.0, -14240.0, 8896.0, -13984.0)
    gg_rct_Region_026 = Rect(11744.0, -12320.0, 12032.0, -12096.0)
    gg_rct_Region_016 = Rect(9216.0, -11584.0, 9312.0, -11488.0)
    gg_rct_Region_028 = Rect(8384.0, -13408.0, 8576.0, -13120.0)
    gg_rct_Region_029 = Rect(9088.0, -16160.0, 9312.0, -15904.0)
    gg_rct_Region_030 = Rect(6912.0, -11552.0, 7168.0, -11296.0)
    gg_rct_Region_027 = Rect(8960.0, -12576.0, 9056.0, -12480.0)
end

--CUSTOM_CODE
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
        Force = "Force ",
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
            Player = "|r победил, поздравьте его, игра закончится через |c00FFFC005|r секунд",
            Team = "|r победила, поздравьте их, игра закончится через |c00FFFC005|r секунд"
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
        Force = "Команда ",
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
        Force = "力 ",
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
---@param text string
---@param textSize real
---@param x real
---@param y real
---@param z real
---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
---@param xvel real
---@param yvel real
---@param fadepoint real
---@param lifespan real
---@param player player
---@return texttag
function FlyTextTag(text, textSize, x, y, z, red, green, blue, alpha, xvel, yvel, fadepoint, lifespan, player)
    local t = CreateTextTag()
    SetTextTagText(t, text, textSize)
    SetTextTagPos(t, x, y, z)
    SetTextTagColor(t, red, green, blue, alpha)
    SetTextTagVelocity(t, xvel, yvel)
    SetTextTagFadepoint(t, fadepoint)
    SetTextTagLifespan(t, lifespan)
    SetTextTagPermanent(t, false)
    if player ~= nil then
        SetTextTagVisibility(t, player == GetLocalPlayer())
    end
    return t
end

---@param target widget
---@param text string
---@param player player
---@return texttag
function FlyTextTagGoldBounty(target, text, player)
    return FlyTextTag(text, 0.024, GetWidgetX(target) - 16, GetWidgetY(target), 0, 255, 220, 0, 255, 0, 0.03, 2, 3, player)
end

---@param target widget
---@param text string
---@param player player
---@return texttag
function FlyTextTagLumberBounty(target, text, player)
    return FlyTextTag(text, 0.024, GetWidgetX(target) - 16, GetWidgetY(target), 0, 0, 200, 80, 255, 0, 0.03, 2, 3, player)
end

---@param target widget
---@param text string
---@param player player
---@return texttag
function FlyTextTagMiss(target, text, player)
    return FlyTextTag(text, 0.024, GetWidgetX(target), GetWidgetY(target), 0, 255, 0, 0, 255, 0, 0.03, 1, 3, player)
end

---@param target widget
---@param text string
---@param player player
---@return texttag
function FlyTextTagCriticalStrike(target, text, player)
    return FlyTextTag(text, 0.024, GetWidgetX(target), GetWidgetY(target), 0, 255, 0, 0, 255, 0, 0.04, 2, 5, player)
end

---@param target widget
---@param text string
---@param player player
---@return texttag
function FlyTextTagManaBurn(target, text, player)
    return FlyTextTag(text, 0.024, GetWidgetX(target), GetWidgetY(target), 0, 82, 82, 255, 255, 0, 0.04, 2, 5, player)
end

---@param target widget
---@param text string
---@param player player
---@return texttag
function FlyTextTagShadowStrike(target, text, player)
    return FlyTextTag(text, 0.024, GetWidgetX(target), GetWidgetY(target), 0, 160, 255, 0, 255, 0, 0.04, 2, 5, player)
end
function ChooseTimeElapse_Actions()
    TimerDialogDisplay(dialog, false)
    DestroyTimerDialog(Dialog)
    if Mode.Voices.DM > Mode.Voices.TVT then
        Mode.CurrentDM = true
        KillToWin = math.ceil(KillToWin * AllPlayers / GetPlayers())
        print(String[BlzGetLocale()].Mode.DM)
        TimerStart(Timer, 5, false, function()
            for i = 0, bj_MAX_PLAYERS-1 do
                for j = 0, bj_MAX_PLAYERS-1 do
                    if i ~= j then
                        SetPlayerAllianceStateBJ( Player(i), Player(j), bj_ALLIANCE_UNALLIED )
                    end
                end
            end
            TimerDialogDisplay(dialog, false)
            DestroyTimerDialog(Dialog)
            PauseAllUnitsBJ(false)
        end)
        dialog = CreateTimerDialog(Timer)
        TimerDialogSetTitle(dialog, String[BlzGetLocale()].Mode.DMTimer)
        TimerDialogDisplay(dialog, true)
    else
        print(String[BlzGetLocale()].Mode.TVT)
        Mode.CurrentDM = false
        KillToWin = math.ceil(KillToWin * 2 * AllPlayers / GetPlayers())
        PauseAllUnitsBJ(false)
        local group = CreateGroup()
        local first
        GroupEnumUnitsInRect(group, bj_mapInitialPlayableArea, nil)
        for i = 0, CountUnitsInGroup(group) do
            first = FirstOfGroup(group)
            if first ~= nil then
                SetUnitColor(first, ConvertPlayerColor(GetPlayerTeam(GetOwningPlayer(first))))
                GroupRemoveUnit(group, first)
            end
        end
        DestroyGroup(group)
        for i = 0, bj_MAX_PLAYERS do
            SetPlayerColor(Player(i), ConvertPlayerColor(GetPlayerTeam(Player(i))))
        end
    end
    ScoreTable = CreateLeaderboardBJ(GetPlayersAll(), String[BlzGetLocale()].Mode.ScoreTable[1]..KillToWin..String[BlzGetLocale()].Mode.ScoreTable[2])
    for i = 0,bj_MAX_PLAYERS-1 do
        DialogDisplay(Player(i),Mode.Dialog,false)
        if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
            LeaderboardAddItemBJ(Player(i), ScoreTable, GetPlayerName(Player(i)), 0)
        end
    end
end

function ButtonClickDM_Actions()
    Mode.Voices.DM = Mode.Voices.DM + 1
    DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, bj_TEXT_DELAY_ALWAYSHINT, String[BlzGetLocale()].Mode.DMVote)
    if Mode.Voices.TVT + Mode.Voices.DM >= Players then
        DestroyTimer(Timer)
        Timer = CreateTimer()
        ChooseTimeElapse_Actions()
    end
end

function ButtonClickDM()
    Trigger.ButtonClickDM = CreateTrigger()
    TriggerRegisterDialogButtonEvent(Trigger.ButtonClickDM, Mode.Button.DM)
    TriggerAddAction(Trigger.ButtonClickDM, ButtonClickDM_Actions)
end

function ButtonClickTVT_Actions()
    Mode.Voices.TVT = Mode.Voices.TVT + 1
    DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, bj_TEXT_DELAY_ALWAYSHINT, String[BlzGetLocale()].Mode.TVTVote)
    if Mode.Voices.TVT + Mode.Voices.DM >= Players then
        DestroyTimer(Timer)
        Timer = CreateTimer()
        ChooseTimeElapse_Actions()
    end
end

function ButtonClickTVT()
    Trigger.ButtonClickTVT = CreateTrigger()
    TriggerRegisterDialogButtonEvent(Trigger.ButtonClickTVT, Mode.Button.TVT)
    TriggerAddAction(Trigger.ButtonClickTVT, ButtonClickTVT_Actions)
end

function TimeElapse_Actions()
    PauseAllUnitsBJ(true)
    DialogSetMessage(Mode.Dialog, String[BlzGetLocale()].Mode.Choose)
    Mode.Button.DM = DialogAddButton(Mode.Dialog, String[BlzGetLocale()].Mode.DMButton, 68)
    Mode.Button.TVT = DialogAddButton(Mode.Dialog, String[BlzGetLocale()].Mode.TVTButton, 84)
    ButtonClickTVT()
    ButtonClickDM()
    TimerStart(Timer, 7, false, ChooseTimeElapse_Actions)
    dialog = CreateTimerDialog(Timer)
    TimerDialogSetTitle(dialog, String[BlzGetLocale()].Mode.VotingEnd)
    TimerDialogDisplay(dialog, true)
    for i = 0, bj_MAX_PLAYERS-1 do
        if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
            DialogDisplay(Player(i), Mode.Dialog,true)
        end
    end
end

function TimeElapse()
    Trigger.TimeElapsed = CreateTrigger()
    TriggerRegisterTimerEventSingle(Trigger.TimeElapsed, 1)
    TriggerAddAction(Trigger.TimeElapsed, TimeElapse_Actions)
end
function Death_Conditions()
    return IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true
end

function Death_Actions()
    local unit = GetDyingUnit()
    local player = GetOwningPlayer(unit)
    local killer = GetKillingUnit()
    local killerplayer = GetOwningPlayer(killer)
    local t = CreateTimer()
    local random = GetRandomInt(1,20)
    local x = GetRandomReal(GetRectMinX(SpawnRect.Revive[random]),GetRectMaxX(SpawnRect.Revive[random]))
    local y = GetRandomReal(GetRectMinY(SpawnRect.Revive[random]),GetRectMaxY(SpawnRect.Revive[random]))
    Stats[GetPlayerId(killerplayer)].Kill = Stats[GetPlayerId(killerplayer)].Kill + 1
    BlzDisplayChatMessage(Player(24), 0, Color[GetPlayerId(killerplayer)+ 1]..GetPlayerName(killerplayer)..String[BlzGetLocale()].Kill..Color[GetPlayerId(player)+ 1]..GetPlayerName(player).."|r")
    --print(Color[GetPlayerId(killerplayer)+ 1]..GetPlayerName(killerplayer)..String[BlzGetLocale()].Kill..Color[GetPlayerId(player)+ 1]..GetPlayerName(player).."|r")
    if Mode.CurrentDM == false then
        Stats.Team[GetPlayerTeam(killerplayer)] = Stats.Team[GetPlayerTeam(killerplayer)] + 1
    end
    LeaderboardSetPlayerItemValueBJ(killerplayer,ScoreTable, Stats[GetPlayerId(killerplayer)].Kill)
    LeaderboardSortItemsByValue(ScoreTable, false)
    if Mode.CurrentDM == true then
        if Stats[GetPlayerId(killerplayer)].Kill >= KillToWin then
            print("|c0000FF40"..GetPlayerName(killerplayer)..String[BlzGetLocale()].Win.Player)
            PauseAllUnitsBJ(true)
            DestroyTrigger(Trigger.Death)
            TimerStart(Timer, 5, false, function()
                for i = 0, bj_MAX_PLAYERS-1 do
                    if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
                        if Player(i) == killerplayer then
                            CustomVictoryBJ(killerplayer, true, true)
                        else
                            CustomDefeatBJ(Player(i), String[BlzGetLocale()].Loose.DM)
                        end
                    end
                end
            end)
        end
    else
        if Stats.Team[GetPlayerTeam(killerplayer)] >= KillToWin then
            WinTeam = GetPlayerTeam(killerplayer)
            DestroyTrigger(Trigger.Death)
            print("|c0000FF40"..Team.Name[WinTeam]..String[BlzGetLocale()].Win.Team)
            PauseAllUnitsBJ(true)
            TimerStart(Timer, 5, false, function()
                for i = 0, bj_MAX_PLAYERS-1 do
                    if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
                        if GetPlayerTeam(Player(i)) == WinTeam then
                            CustomVictoryBJ(Player(i), true, true)
                        else
                            CustomDefeatBJ(Player(i), String[BlzGetLocale()].Loose.TVT)
                        end
                    end
                end
            end)
        end
    end
    Stats[GetPlayerId(player)].Death = Stats[GetPlayerId(player)].Death + 1
    random =  GetRandomInt(3,5)
    TimerStart(t, random,false, function()
        ReviveHero(unit, x, y, true)
        SetUnitState(unit, UNIT_STATE_MANA, Mana[GetPlayerId(player)])
        PanCameraToForPlayer(player, GetUnitX(unit),GetUnitY(unit))
        SelectUnitForPlayerSingle(unit, player)
    end)
end

function Death()
    Trigger.Death = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(Trigger.Death, EVENT_PLAYER_UNIT_DEATH)
    TriggerAddCondition(Trigger.Death, Condition(Death_Conditions))
    TriggerAddAction(Trigger.Death, Death_Actions)
end
function Damage_Actions()
    local unit = BlzGetEventDamageTarget()
    local source = GetEventDamageSource()
    local player = GetOwningPlayer(unit)
    local sourceplayer = GetOwningPlayer(source)
    local damage = GetEventDamage()
    if GetUnitCurrentOrder(source) ~= String2OrderIdBJ("defend") and GetUnitTypeId(source) ~= UNIT_TYPE_SUMMONED then
        damage = damage*CritFactor[GetPlayerId(sourceplayer)]
    end
    BlzSetEventDamage(damage)
    local effect
    if GetUnitCurrentOrder(unit) == String2OrderIdBJ("defend") then
        if Counter[GetPlayerId(player)] and BlzGetEventDamageType() ~= DAMAGE_TYPE_ENHANCED then
            Counter[GetPlayerId(player)] = false
            UnitAddAbility(unit, FourCC('A004'))
            if GetPlayerController(player) == MAP_CONTROL_USER then
                FlyTextTagMiss(unit, String[BlzGetLocale()].Hint.CounterFT, player)
            end
            IssueImmediateOrder(unit, "thunderclap")
            --PlaySoundOnUnitBJ(gg_snd_RyuKanSenTsumui, 100, GetTriggerUnit())
            TimerStart(CreateTimer(), 0.05, false, function() UnitRemoveAbility(unit, FourCC('A004')) DestroyTimer(GetExpiredTimer()) end)
            BlzStartUnitAbilityCooldown(unit, FourCC('A000'), 3)
        end
        UnitDamageTargetBJ(unit, source, damage, BlzGetEventAttackType(), DAMAGE_TYPE_DEFENSIVE)
        SetUnitState(unit, UNIT_STATE_MANA, GetUnitState(unit, UNIT_STATE_MANA) + damage / 5)
        if GetPlayerController(player) == MAP_CONTROL_USER then
            FlyTextTagMiss(unit, String[BlzGetLocale()].Hint.ParryFT, player)
            FlyTextTagManaBurn(unit, "+" .. math.ceil(damage/5), player)
        end
        if BlzGetEventDamageType() ~= DAMAGE_TYPE_ENHANCED then
            CritFactor[GetPlayerId(player)] = CritFactor[GetPlayerId(player)] + 1
        end
        BlzSetEventDamage(0.0)
        PlaySoundOnUnitBJ(gg_snd_MetalHeavySliceMetal1, 100, unit)
        effect = AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIda\\AIdaTarget.mdl", unit, "overhead")
        BlzSetSpecialEffectTime(effect, 0.3)
        TimerStart(CreateTimer(), 0.3, false, function() DestroyEffect(effect) DestroyTimer(GetExpiredTimer()) end)
    elseif GetUnitState(unit,UNIT_STATE_LIFE) < damage then
        Mana[GetPlayerId(GetOwningPlayer(unit))] = GetUnitState(unit, UNIT_STATE_MANA)
    end
    if GetEventDamage() > 0 then
        if GetPlayerController(sourceplayer) == MAP_CONTROL_USER then
            local textsize = 0.018 + damage / 30000
            FlyTextTag("-" .. math.ceil(damage), textsize, GetUnitX(unit) - 32, GetUnitY(unit), 32, 255, 0, 0, 255, 0, 0.03, 1.5, 2, sourceplayer)
        end
        if IsUnitIllusion(unit) == false then
            SetUnitState(source, UNIT_STATE_MANA, GetUnitState(source, UNIT_STATE_MANA) + damage / 5)
            if GetPlayerController(sourceplayer) == MAP_CONTROL_USER then
                FlyTextTagManaBurn(source, "+" .. math.ceil(damage/5), sourceplayer)
            end
        end
        if GetUnitTypeId(source) ~= UNIT_TYPE_SUMMONED and BlzGetEventDamageType() ~= DAMAGE_TYPE_DEFENSIVE then
            TimerStart(CreateTimer(), 0.03, false, function() DestroyEffect(Effect[GetPlayerId(sourceplayer)].Crit) CritFactor[GetPlayerId(sourceplayer)] = CritDefault[GetPlayerId(sourceplayer)] DestroyTimer(GetExpiredTimer()) end)
        end
    end
    --PrintDamage(true, damage, BlzGetEventDamageType(), BlzGetEventAttackType(), BlzGetEventWeaponType(), true, true, true)
end

function Damage()
    Trigger.Damage = CreateTrigger()
    TriggerAddAction(Trigger.Damage, Damage_Actions)
end
function EntireMap_Actions()
    TriggerRegisterUnitEvent(Trigger.Damage, GetTriggerUnit(), EVENT_UNIT_DAMAGED)
    TriggerRegisterUnitEvent(Trigger.Damaging, GetTriggerUnit(), EVENT_UNIT_DAMAGING)
end

function EntireMap()
    Trigger.EntireMap = CreateTrigger()
    TriggerRegisterEnterRectSimple(Trigger.EntireMap, GetPlayableMapRect())
    TriggerAddAction(Trigger.EntireMap, EntireMap_Actions)
end
function ParryAI_Actions()
    local unit = GetTriggerUnit()
    local player = GetOwningPlayer(unit)
    local group = CreateGroup()
    local first
    local point
    local random
    GroupEnumUnitsInRange(group, GetUnitX(unit), GetUnitY(unit), 250, nil)
    for i = 1, CountUnitsInGroup(group) do
        first = FirstOfGroup(group)
        random = GetRandomReal(0, 100)
        if first ~= unit and IsUnitEnemy(first, player) and IsUnitVisible(first, player) and GetPlayerController(GetOwningPlayer(first)) == MAP_CONTROL_COMPUTER and random >= 25 then
            if BlzGetUnitAbilityCooldownRemaining(first, FourCC('A000')) == 0 then
                IssueImmediateOrder(first, "defend")
            elseif BlzGetUnitAbilityCooldownRemaining(first, FourCC('A001')) == 0 and GetUnitState(first, UNIT_STATE_MANA) > 30 then
                point = GetRandomLocInRect(bj_mapInitialPlayableArea)
                IssuePointOrderLoc(first, "blink", point)
                RemoveLocation(point)
            end
        end
        GroupRemoveUnit(group, first)
    end
    DestroyGroup(group)
end

function AttackAI_Actions()
    local unit = GetTriggerUnit()
    local attacker = GetAttacker()
    SetUnitFacingToFaceUnitTimed(unit, attacker, 0)
    local random = GetRandomReal(0, 100)
    if random >= 25 then
        IssueImmediateOrder(unit, "shockwave")
    end
end

function AttackAI_Conditions()
    local unit = GetTriggerUnit()
    return BlzGetUnitAbilityCooldownRemaining(unit, FourCC('A003')) == 0
end

function SlashAI_Actions()
    local unit = GetTriggerUnit()
    local player = GetOwningPlayer(unit)
    local group = CreateGroup()
    local first
    GroupEnumUnitsInRange(group, GetUnitX(unit), GetUnitY(unit), 250, nil)
    for i = 1, CountUnitsInGroup(group) do
        first = FirstOfGroup(group)
        if first ~= unit and IsUnitEnemy(first, player) and IsUnitVisible(first, player) and GetPlayerController(GetOwningPlayer(first)) == MAP_CONTROL_COMPUTER and BlzGetUnitAbilityCooldownRemaining(first, FourCC('A003')) == 0 and IsUnitEnemy(first, unit) then
            SetUnitFacingToFaceUnitTimed(first, unit, 0)
            IssueImmediateOrder(first, "shockwave")
        end
        GroupRemoveUnit(group, first)
    end
    DestroyGroup(group)
end

function SlashAI()
    Trigger.SlashAI = CreateTrigger()
    TriggerAddAction(Trigger.SlashAI, SlashAI_Actions)

    Trigger.AttackAI = CreateTrigger()
    TriggerAddCondition(Trigger.AttackAI, Condition(AttackAI_Conditions))
    TriggerAddAction(Trigger.AttackAI, AttackAI_Actions)

    Trigger.ParryAI = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(Trigger.ParryAI, EVENT_PLAYER_UNIT_SPELL_CAST)
    TriggerAddCondition(Trigger.ParryAI, Condition(Slash_Conditions))
    TriggerAddAction(Trigger.ParryAI, ParryAI_Actions)
end


function Slash_Filter()
    local unit = GetTriggerUnit()
    local filterunit = GetFilterUnit()
    local x1 = GetUnitX(unit)
    local y1 = GetUnitY(unit)
    local x2 = GetUnitX(filterunit)
    local y2 = GetUnitY(filterunit)
    local a = GetUnitFacing(unit)
    local lenght = SquareRoot((x2-x1)^2 + (y2-y1)^2)
    local angle = Acos(Cos(a*bj_DEGTORAD)*(x2-x1)/lenght+Sin(a*bj_DEGTORAD)*(y2-y1)/lenght)*bj_RADTODEG
    return GetUnitState(filterunit, UNIT_STATE_LIFE) >= 0 and IsUnitEnemy(filterunit, GetOwningPlayer(unit)) and angle <= 75 and lenght <= 250
end

function Slash_Conditions()
    return GetSpellAbilityId() == FourCC("A003")
end

function Slash_Actions()
    local group = CreateGroup()
    local unit = GetTriggerUnit()
    local player = GetOwningPlayer(unit)
    local first
    local effect
    GroupEnumUnitsInRange(group,GetUnitX(unit), GetUnitY(unit),250, Filter(Slash_Filter))
    for i = 1, CountUnitsInGroup(group) do
        first = FirstOfGroup(group)
        UnitDamageTarget(unit,first,250,true,false, ATTACK_TYPE_HERO,DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
        effect = AddSpecialEffect("Objects\\Spawnmodels\\Human\\HumanBlood\\HumanBloodKnight.mdl", GetUnitX(first),GetUnitY(first))
        DestroyEffect(effect)
        GroupRemoveUnit(group,first)
    end
    DestroyGroup(group)
end

function Slash()
    Trigger.Slash = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(Trigger.Slash, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    TriggerAddCondition(Trigger.Slash, Condition(Slash_Conditions))
    TriggerAddAction(Trigger.Slash, Slash_Actions)
end
function Start()
    local unit
    SpawnRect = {
        [0] = gg_rct_Region_001, --Rect(-1408.0, -128.0, -1280.0, 0.0),
        [1] = gg_rct_Region_002, --Rect(-1408.0, -256.0, -1280.0, -128.0),
        [2] = gg_rct_Region_003, --Rect(-1408.0, -384.0, -1280.0, -256.0),
        [3] = gg_rct_Region_004, --Rect(-1408.0, -512.0, -1280.0, -384.0),
        [4] = gg_rct_Region_005, --Rect(-1280.0, -128.0, -1152.0, 0.0),
        [5] = gg_rct_Region_006, --Rect(-1280.0, -256.0, -1152.0, -128.0),

        [11] = gg_rct_Region_007, --Rect(-1152.0, -512.0, -1024.0, -384.0),
        [12] = gg_rct_Region_008, --Rect(1280.0, -128.0, 1408.0, 0.0),
        [13] = gg_rct_Region_009, --Rect(1280.0, -256.0, 1408.0, -128.0),
        [14] = gg_rct_Region_010, --Rect(1280.0, -384.0, 1408.0, -256.0),
        [15] = gg_rct_Region_011, --Rect(1280.0, -512.0, 1408.0, -384.0),
        [16] = gg_rct_Region_012, --Rect(1152.0, -128.0, 1280.0, 0.0),
        Revive = {
            [1] = gg_rct_Region_015, --Rect(-1536.0, -1408.0, -1152.0, -896.0), --center top left
            [2] = gg_rct_Region_016, --Rect(1152.0, -1408.0, 1536.0, -896.0), --center top right
            [3] = gg_rct_Region_013, --Rect(-512.0, -3200.0, 512.0, -2816.0), --center bottom left
            [4] = gg_rct_Region_014, --Rect(-512.0, 2304.0, 512.0, 2688.0),  --center bottom right
            [5] = gg_rct_Region_029, --Rect(-1536.0, 384.0, -1152.0, 896.0),
            [6] = gg_rct_Region_030, --Rect(1152.0, 384.0, 1536.0, 896.0),
            [7] = gg_rct_Region_017, --Rect(-1024.0, -1792.0, -384.0, -1536.0),
            [8] = gg_rct_Region_018, --Rect(384.0, -1792.0, 1024.0, -1536.0),
            [9] = gg_rct_Region_019, --Rect(-1024.0, 1024.0, -384.0, 1280.0),
            [10] = gg_rct_Region_020, --Rect(384.0, 1024.0, 1024.0, 1280.0),
            [11] = gg_rct_Region_021, --Rect(-1536.0, -640.0, -768.0, 128.0),
            [12] = gg_rct_Region_022, --Rect(768.0, -640.0, 1536.0, 128.0),
            [13] = gg_rct_Region_023, --Rect(-1152.0, -2560.0, -640.0, -2048.0),
            [14] = gg_rct_Region_024, --Rect(640.0, -2560.0, 1152.0, -2048.0),
            [15] = gg_rct_Region_025, --Rect(-1152.0, 1536.0, -640.0, 2048.0),
            [16] = gg_rct_Region_026, --Rect(640.0, 1536.0, 1152.0, 2048.0),
            [17] = gg_rct_Region_027, --Rect(-1024.0, 384.0, -384.0, 768.0),
            [18] = gg_rct_Region_028, --Rect(384.0, 384.0, 1024.0, 768.0),
            [19] = gg_rct_Region_002, --Rect(-1024.0, -1280.0, -384.0, -896.0),
            [20] = gg_rct_Region_011, --Rect(384.0, -1280.0, 1024.0, -896.0)
        }
    }
    Team = {
        Name = {
            [0] = String[BlzGetLocale()].Force.."1",
            [1] = String[BlzGetLocale()].Force.."2",
        }
    }
    Death()
    Damage()
    EntireMap()
    Slash()
    TimeElapse()
    Parry()
    SlashAI()
    Stats.Team = {
        [0] = 0,
        [1] = 0
    }
    for i = 0, bj_MAX_PLAYERS-1 do
        FogModifierStart(CreateFogModifierRect(Player(i), FOG_OF_WAR_VISIBLE, GetPlayableMapRect(), true, false))
    end

    for i = 0, bj_MAX_PLAYERS-1 do
        if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
            unit = CreateUnit(Player(i),FourCC("O000"), GetRectCenterX(SpawnRect[i]), GetRectCenterY(SpawnRect[i]),90+GetPlayerTeam(Player(i))*180)
            if GetPlayerController(Player(i)) == MAP_CONTROL_COMPUTER then
                TriggerRegisterUnitInRange(Trigger.SlashAI, unit, 250, nil)
                TriggerRegisterPlayerUnitEvent(Trigger.AttackAI, Player(i), EVENT_PLAYER_UNIT_ATTACKED, nil)
                StartMeleeAI(Player(i), "SamuroWars.ai")
            end
            if GetPlayerController(Player(i)) == MAP_CONTROL_USER then
                Players = Players + 1
            else
                SetUnitAcquireRange(unit, 1000000000)
            end
            ForceAddPlayer(Team[GetPlayerTeam(Player(i))], Player(i))
            AllPlayers = AllPlayers + 1
            CritFactor[i] = 1
            CritDefault[i] = 1
            Stats[i] = {
                Kill = 0,
                Death = 0,
                Damage = 0
            }
            SelectUnitForPlayerSingle(unit, GetOwningPlayer(unit))
            PanCameraToTimedForPlayer(Player(i),GetUnitX(unit),GetUnitY(unit), 0)
        end
    end
    PauseAllUnitsBJ(true)
    TimerStart(CreateTimer(), 15, true, SpawnBoost)
    SetPlayerName(Player(24), " ")
end
function ParryEffect_Actions()
    local player = GetOwningPlayer(GetTriggerUnit())
    Counter[GetPlayerId(player)] = true
    TimerStart(CreateTimer(), 0.3, false, function()
        Counter[GetPlayerId(player)] = false
        DestroyTimer(GetExpiredTimer())
    end)
end

function Parry_Conditions()
    return GetSpellAbilityId() == FourCC("A000")
end

function Parry_Actions()
    local unit = GetTriggerUnit()
    local player = GetOwningPlayer(unit)
    if CritFactor[GetPlayerId(player)] ~= CritDefault[GetPlayerId(player)] then
        Effect[GetPlayerId(player)] = {
            Crit = AddSpecialEffectTargetUnitBJ("weapon", unit, "Sweep_Fire_Large.mdx")
        }
        TimerStart(CreateTimer(), 2, false, function()
            CritFactor[GetPlayerId(player)] = CritDefault[GetPlayerId(player)]
            if Effect[GetPlayerId(player)].Crit ~= nil then
                DestroyEffect(Effect[GetPlayerId(player)].Crit)
            end
            DestroyTimer(GetExpiredTimer())
        end)
    end
end

function Parry()
    Trigger.Parry = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(Trigger.Parry, EVENT_PLAYER_UNIT_SPELL_ENDCAST)
    TriggerAddCondition(Trigger.Parry, Condition(Parry_Conditions))
    TriggerAddAction(Trigger.Parry, Parry_Actions)
    Trigger.ParryEffect = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(Trigger.ParryEffect, EVENT_PLAYER_UNIT_SPELL_CHANNEL)
    TriggerAddCondition(Trigger.ParryEffect, Condition(Parry_Conditions))
    TriggerAddAction(Trigger.ParryEffect, ParryEffect_Actions)
end
---@param showdamage boolean
---@param damage real
---@param damagetype damagetype
---@param attacktype attacktype
---@param weapontype weapontype
---@param showdamagetype boolean
---@param showattacktype boolean
---@param showweapontype boolean
function PrintDamage(showdamage, damage, damagetype, attacktype, weapontype, showdamagetype, showattacktype, showweapontype)
    if showdamage == true then
        print(damage)
    end
    if showdamagetype then
        if damagetype == DAMAGE_TYPE_UNKNOWN then
            print("DAMAGE_TYPE_UNKNOWN")
        elseif damagetype == DAMAGE_TYPE_NORMAL then
            print("DAMAGE_TYPE_NORMAL")
        elseif damagetype == DAMAGE_TYPE_ENHANCED then
            print("DAMAGE_TYPE_ENHANCED")
        elseif damagetype == DAMAGE_TYPE_FIRE then
            print("DAMAGE_TYPE_FIRE")
        elseif damagetype == DAMAGE_TYPE_COLD then
            print("DAMAGE_TYPE_COLD")
        elseif damagetype == DAMAGE_TYPE_LIGHTNING then
            print("DAMAGE_TYPE_LIGHTNING")
        elseif damagetype == DAMAGE_TYPE_POISON then
            print("DAMAGE_TYPE_POISON")
        elseif damagetype == DAMAGE_TYPE_DISEASE then
            print("DAMAGE_TYPE_")
        elseif damagetype == DAMAGE_TYPE_DIVINE then
            print("DAMAGE_TYPE_DIVINE")
        elseif damagetype == DAMAGE_TYPE_MAGIC then
            print("DAMAGE_TYPE_MAGIC")
        elseif damagetype == DAMAGE_TYPE_SONIC then
            print("DAMAGE_TYPE_SONIC")
        elseif damagetype == DAMAGE_TYPE_ACID then
            print("DAMAGE_TYPE_ACID")
        elseif damagetype == DAMAGE_TYPE_FORCE then
            print("DAMAGE_TYPE_FORCE")
        elseif damagetype == DAMAGE_TYPE_DEATH then
            print("DAMAGE_TYPE_DEATH")
        elseif damagetype == DAMAGE_TYPE_MIND then
            print("DAMAGE_TYPE_MIND")
        elseif damagetype == DAMAGE_TYPE_PLANT then
            print("DAMAGE_TYPE_PLANT")
        elseif damagetype == DAMAGE_TYPE_DEFENSIVE then
            print("DAMAGE_TYPE_DEFENSIVE")
        elseif damagetype == DAMAGE_TYPE_DEMOLITION then
            print("DAMAGE_TYPE_DEMOLITION")
        elseif damagetype == DAMAGE_TYPE_SLOW_POISON then
            print("DAMAGE_TYPE_SLOW_POISON")
        elseif damagetype == DAMAGE_TYPE_SPIRIT_LINK then
            print("DAMAGE_TYPE_SPIRIT_LINK")
        elseif damagetype == DAMAGE_TYPE_SHADOW_STRIKE then
            print("DAMAGE_TYPE_SHADOW_STRIKE")
        elseif damagetype == DAMAGE_TYPE_UNIVERSAL then
            print("DAMAGE_TYPE_UNIVERSAL")
        end
    end
    if showattacktype then
        if attacktype == ATTACK_TYPE_NORMAL then
            print("ATTACK_TYPE_NORMAL")
        elseif attacktype == ATTACK_TYPE_HERO then
            print("ATTACK_TYPE_HERO")
        elseif attacktype == ATTACK_TYPE_MELEE then
            print("ATTACK_TYPE_MELEE")
        elseif attacktype == ATTACK_TYPE_PIERCE then
            print("ATTACK_TYPE_PIERCE")
        elseif attacktype == ATTACK_TYPE_MAGIC then
            print("ATTACK_TYPE_MAGIC")
        elseif attacktype == ATTACK_TYPE_CHAOS then
            print("ATTACK_TYPE_CHAOS")
        elseif attacktype == ATTACK_TYPE_SIEGE then
            print("ATTACK_TYPE_SIEGE")
        end
    end
    if showweapontype then
        if weapontype == WEAPON_TYPE_WHOKNOWS then
            print("WEAPON_TYPE_WHOKNOWS")
        elseif weapontype == WEAPON_TYPE_METAL_LIGHT_CHOP then
            print("WEAPON_TYPE_METAL_LIGHT_CHOP")
        elseif weapontype == WEAPON_TYPE_METAL_MEDIUM_CHOP then
            print("WEAPON_TYPE_METAL_MEDIUM_CHOP")
        elseif weapontype == WEAPON_TYPE_METAL_HEAVY_CHOP then
            print("WEAPON_TYPE_METAL_HEAVY_CHOP")
        elseif weapontype == WEAPON_TYPE_METAL_LIGHT_SLICE then
            print("WEAPON_TYPE_METAL_LIGHT_SLICE")
        elseif weapontype == WEAPON_TYPE_METAL_MEDIUM_SLICE then
            print("WEAPON_TYPE_METAL_MEDIUM_SLICE")
        elseif weapontype == WEAPON_TYPE_METAL_HEAVY_SLICE then
            print("WEAPON_TYPE_METAL_HEAVY_SLICE")
        elseif weapontype == WEAPON_TYPE_METAL_MEDIUM_BASH then
            print("WEAPON_TYPE_METAL_MEDIUM_BASH")
        elseif weapontype == WEAPON_TYPE_METAL_HEAVY_BASH then
            print("WEAPON_TYPE_METAL_HEAVY_BASH")
        elseif weapontype == WEAPON_TYPE_METAL_MEDIUM_STAB then
            print("WEAPON_TYPE_METAL_MEDIUM_STAB")
        elseif weapontype == WEAPON_TYPE_METAL_HEAVY_STAB then
            print("WEAPON_TYPE_METAL_HEAVY_STAB")
        elseif weapontype == WEAPON_TYPE_WOOD_LIGHT_SLICE then
            print("WEAPON_TYPE_WOOD_LIGHT_SLICE")
        elseif weapontype == WEAPON_TYPE_WOOD_MEDIUM_SLICE then
            print("WEAPON_TYPE_WOOD_MEDIUM_SLICE")
        elseif weapontype == WEAPON_TYPE_WOOD_HEAVY_SLICE then
            print("WEAPON_TYPE_WOOD_HEAVY_SLICE")
        elseif weapontype == WEAPON_TYPE_WOOD_LIGHT_BASH then
            print("WEAPON_TYPE_WOOD_LIGHT_BASH")
        elseif weapontype == WEAPON_TYPE_WOOD_MEDIUM_BASH then
            print("WEAPON_TYPE_WOOD_MEDIUM_BASH")
        elseif weapontype == WEAPON_TYPE_WOOD_HEAVY_BASH then
            print("WEAPON_TYPE_WOOD_HEAVY_BASH")
        elseif weapontype == WEAPON_TYPE_WOOD_LIGHT_STAB then
            print("WEAPON_TYPE_WOOD_LIGHT_STAB")
        elseif weapontype == WEAPON_TYPE_WOOD_MEDIUM_STAB then
            print("WEAPON_TYPE_WOOD_MEDIUM_STAB")
        elseif weapontype == WEAPON_TYPE_CLAW_LIGHT_SLICE then
            print("WEAPON_TYPE_CLAW_LIGHT_SLICE")
        elseif weapontype == WEAPON_TYPE_CLAW_MEDIUM_SLICE then
            print("WEAPON_TYPE_CLAW_MEDIUM_SLICE")
        elseif weapontype == WEAPON_TYPE_CLAW_HEAVY_SLICE then
            print("WEAPON_TYPE_CLAW_HEAVY_SLICE")
        elseif weapontype == WEAPON_TYPE_AXE_MEDIUM_CHOP then
            print("WEAPON_TYPE_AXE_MEDIUM_CHOP")
        elseif weapontype == WEAPON_TYPE_ROCK_HEAVY_BASH then
            print("WEAPON_TYPE_ROCK_HEAVY_BASH")
        end
    end
end
function SpawnBoost()
    local random = GetRandomInt(1, 4)
    local rectname = {
        [1] = String[BlzGetLocale()].Rect.TL,
        [2]  = String[BlzGetLocale()].Rect.TR,
        [3] = String[BlzGetLocale()].Rect.BL,
        [4] = String[BlzGetLocale()].Rect.BR
    }
    local x = GetRectCenterX(SpawnRect.Revive[random])
    local y = GetRectCenterY(SpawnRect.Revive[random])
    local item = CreateItem(Boost[GetRandomInt(1, Boost.Count)], x, y)
    local red = BlzGetItemIntegerField(item, ITEM_IF_TINTING_COLOR_RED)
    local green = BlzGetItemIntegerField(item, ITEM_IF_TINTING_COLOR_GREEN)
    local blue = BlzGetItemIntegerField(item, ITEM_IF_TINTING_COLOR_BLUE)
    --print("|c00FFFC00"..GetItemName(item)..String[BlzGetLocale()].Rune[1]..rectname[random]..String[BlzGetLocale()].Rune[2])
    --BlzDisplayChatMessage(Player(24), 0, "|c00FFFC00"..GetItemName(item)..String[BlzGetLocale()].Rune[1]..rectname[random]..String[BlzGetLocale()].Rune[2])
    local minimapicon = CreateMinimapIcon(x, y, red, green, blue, "UI\\Minimap\\Minimap-QuestObjectivePrimary.mdl", FOG_OF_WAR_VISIBLE)
    PingMinimap(x, y, 3)
    TimerStart(CreateTimer(), 3, false, function() DestroyMinimapIcon(minimapicon) DestroyTimer(GetExpiredTimer()) end)
end
--CUSTOM_CODE
function Trig_Initialization_Actions()
    MeleeStartingVisibility()
    SetMapMusicRandomBJ(gg_snd_great_player01)
        Start()
        BlzChangeMinimapTerrainTex("map.blp")
end

function InitTrig_Initialization()
    gg_trg_Initialization = CreateTrigger()
    TriggerAddAction(gg_trg_Initialization, Trig_Initialization_Actions)
end

function Trig_AttackAllied_Conditions()
    if (not (IsUnitAlly(GetAttacker(), GetOwningPlayer(GetAttackedUnitBJ())) == true)) then
        return false
    end
    return true
end

function Trig_AttackAllied_Actions()
    IssueImmediateOrderBJ(GetAttacker(), "stop")
end

function InitTrig_AttackAllied()
    gg_trg_AttackAllied = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(gg_trg_AttackAllied, EVENT_PLAYER_UNIT_ATTACKED)
    TriggerAddCondition(gg_trg_AttackAllied, Condition(Trig_AttackAllied_Conditions))
    TriggerAddAction(gg_trg_AttackAllied, Trig_AttackAllied_Actions)
end

function Trig_Counter_Conditions()
    if (not (GetSpellAbilityId() == FourCC("A004"))) then
        return false
    end
    return true
end

function Trig_Counter_Func001001003001()
    return (IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(GetTriggerUnit())) == true)
end

function Trig_Counter_Func001001003002()
    return (IsUnitAliveBJ(GetFilterUnit()) == true)
end

function Trig_Counter_Func001001003()
    return GetBooleanAnd(Trig_Counter_Func001001003001(), Trig_Counter_Func001001003002())
end

function Trig_Counter_Func001002()
    UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), 150.00, ATTACK_TYPE_MELEE, DAMAGE_TYPE_MAGIC)
end

function Trig_Counter_Actions()
    ForGroupBJ(GetUnitsInRangeOfLocMatching(250.00, GetUnitLoc(GetTriggerUnit()), Condition(Trig_Counter_Func001001003)), Trig_Counter_Func001002)
end

function InitTrig_Counter()
    gg_trg_Counter = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(gg_trg_Counter, EVENT_PLAYER_UNIT_SPELL_CAST)
    TriggerAddCondition(gg_trg_Counter, Condition(Trig_Counter_Conditions))
    TriggerAddAction(gg_trg_Counter, Trig_Counter_Actions)
end

function Trig_Leave_Func002001002001()
    return (GetUnitTypeId(GetFilterUnit()) == FourCC("O000"))
end

function Trig_Leave_Func002001002002()
    return (GetOwningPlayer(GetEnumUnit()) == GetTriggerPlayer())
end

function Trig_Leave_Func002001002()
    return GetBooleanAnd(Trig_Leave_Func002001002001(), Trig_Leave_Func002001002002())
end

function Trig_Leave_Func002002()
    SetUnitAcquireRangeBJ(GetEnumUnit(), 1000000000.00)
end

function Trig_Leave_Actions()
        print("|c00FFFC00"..GetPlayerName(GetTriggerPlayer()).."|r Has left the game")
    ForGroupBJ(GetUnitsInRectMatching(GetPlayableMapRect(), Condition(Trig_Leave_Func002001002)), Trig_Leave_Func002002)
end

function InitTrig_Leave()
    gg_trg_Leave = CreateTrigger()
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(0))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(1))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(2))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(3))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(4))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(5))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(6))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(7))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(8))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(9))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(10))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(11))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(12))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(13))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(14))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(15))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(16))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(17))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(18))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(19))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(20))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(21))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(22))
    TriggerRegisterPlayerEventLeave(gg_trg_Leave, Player(23))
    TriggerAddAction(gg_trg_Leave, Trig_Leave_Actions)
end

function InitCustomTriggers()
    InitTrig_Initialization()
    InitTrig_AttackAllied()
    InitTrig_Counter()
    InitTrig_Leave()
end

function RunInitializationTriggers()
    ConditionalTriggerExecute(gg_trg_Initialization)
end

function InitCustomPlayerSlots()
    SetPlayerStartLocation(Player(0), 0)
    ForcePlayerStartLocation(Player(0), 0)
    SetPlayerColor(Player(0), ConvertPlayerColor(0))
    SetPlayerRacePreference(Player(0), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(0), false)
    SetPlayerController(Player(0), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(1), 1)
    ForcePlayerStartLocation(Player(1), 1)
    SetPlayerColor(Player(1), ConvertPlayerColor(1))
    SetPlayerRacePreference(Player(1), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(1), false)
    SetPlayerController(Player(1), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(2), 2)
    ForcePlayerStartLocation(Player(2), 2)
    SetPlayerColor(Player(2), ConvertPlayerColor(2))
    SetPlayerRacePreference(Player(2), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(2), false)
    SetPlayerController(Player(2), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(3), 3)
    ForcePlayerStartLocation(Player(3), 3)
    SetPlayerColor(Player(3), ConvertPlayerColor(3))
    SetPlayerRacePreference(Player(3), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(3), false)
    SetPlayerController(Player(3), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(4), 4)
    ForcePlayerStartLocation(Player(4), 4)
    SetPlayerColor(Player(4), ConvertPlayerColor(4))
    SetPlayerRacePreference(Player(4), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(4), false)
    SetPlayerController(Player(4), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(5), 5)
    ForcePlayerStartLocation(Player(5), 5)
    SetPlayerColor(Player(5), ConvertPlayerColor(5))
    SetPlayerRacePreference(Player(5), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(5), false)
    SetPlayerController(Player(5), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(11), 6)
    ForcePlayerStartLocation(Player(11), 6)
    SetPlayerColor(Player(11), ConvertPlayerColor(11))
    SetPlayerRacePreference(Player(11), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(11), false)
    SetPlayerController(Player(11), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(12), 7)
    ForcePlayerStartLocation(Player(12), 7)
    SetPlayerColor(Player(12), ConvertPlayerColor(12))
    SetPlayerRacePreference(Player(12), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(12), false)
    SetPlayerController(Player(12), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(13), 8)
    ForcePlayerStartLocation(Player(13), 8)
    SetPlayerColor(Player(13), ConvertPlayerColor(13))
    SetPlayerRacePreference(Player(13), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(13), false)
    SetPlayerController(Player(13), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(14), 9)
    ForcePlayerStartLocation(Player(14), 9)
    SetPlayerColor(Player(14), ConvertPlayerColor(14))
    SetPlayerRacePreference(Player(14), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(14), false)
    SetPlayerController(Player(14), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(15), 10)
    ForcePlayerStartLocation(Player(15), 10)
    SetPlayerColor(Player(15), ConvertPlayerColor(15))
    SetPlayerRacePreference(Player(15), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(15), false)
    SetPlayerController(Player(15), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(16), 11)
    ForcePlayerStartLocation(Player(16), 11)
    SetPlayerColor(Player(16), ConvertPlayerColor(16))
    SetPlayerRacePreference(Player(16), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(16), false)
    SetPlayerController(Player(16), MAP_CONTROL_USER)
end

function InitCustomTeams()
    SetPlayerTeam(Player(0), 0)
    SetPlayerTeam(Player(1), 0)
    SetPlayerTeam(Player(2), 0)
    SetPlayerTeam(Player(3), 0)
    SetPlayerTeam(Player(4), 0)
    SetPlayerTeam(Player(5), 0)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(4), true)
    SetPlayerTeam(Player(11), 1)
    SetPlayerTeam(Player(12), 1)
    SetPlayerTeam(Player(13), 1)
    SetPlayerTeam(Player(14), 1)
    SetPlayerTeam(Player(15), 1)
    SetPlayerTeam(Player(16), 1)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(13), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(14), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(15), true)
    SetPlayerAllianceStateAllyBJ(Player(11), Player(16), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(13), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(14), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(15), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(16), true)
    SetPlayerAllianceStateAllyBJ(Player(13), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(13), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(13), Player(14), true)
    SetPlayerAllianceStateAllyBJ(Player(13), Player(15), true)
    SetPlayerAllianceStateAllyBJ(Player(13), Player(16), true)
    SetPlayerAllianceStateAllyBJ(Player(14), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(14), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(14), Player(13), true)
    SetPlayerAllianceStateAllyBJ(Player(14), Player(15), true)
    SetPlayerAllianceStateAllyBJ(Player(14), Player(16), true)
    SetPlayerAllianceStateAllyBJ(Player(15), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(15), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(15), Player(13), true)
    SetPlayerAllianceStateAllyBJ(Player(15), Player(14), true)
    SetPlayerAllianceStateAllyBJ(Player(15), Player(16), true)
    SetPlayerAllianceStateAllyBJ(Player(16), Player(11), true)
    SetPlayerAllianceStateAllyBJ(Player(16), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(16), Player(13), true)
    SetPlayerAllianceStateAllyBJ(Player(16), Player(14), true)
    SetPlayerAllianceStateAllyBJ(Player(16), Player(15), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(13), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(14), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(15), true)
    SetPlayerAllianceStateVisionBJ(Player(11), Player(16), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(13), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(14), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(15), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(16), true)
    SetPlayerAllianceStateVisionBJ(Player(13), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(13), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(13), Player(14), true)
    SetPlayerAllianceStateVisionBJ(Player(13), Player(15), true)
    SetPlayerAllianceStateVisionBJ(Player(13), Player(16), true)
    SetPlayerAllianceStateVisionBJ(Player(14), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(14), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(14), Player(13), true)
    SetPlayerAllianceStateVisionBJ(Player(14), Player(15), true)
    SetPlayerAllianceStateVisionBJ(Player(14), Player(16), true)
    SetPlayerAllianceStateVisionBJ(Player(15), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(15), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(15), Player(13), true)
    SetPlayerAllianceStateVisionBJ(Player(15), Player(14), true)
    SetPlayerAllianceStateVisionBJ(Player(15), Player(16), true)
    SetPlayerAllianceStateVisionBJ(Player(16), Player(11), true)
    SetPlayerAllianceStateVisionBJ(Player(16), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(16), Player(13), true)
    SetPlayerAllianceStateVisionBJ(Player(16), Player(14), true)
    SetPlayerAllianceStateVisionBJ(Player(16), Player(15), true)
end

function InitAllyPriorities()
    SetStartLocPrioCount(0, 11)
    SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 1, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 2, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 3, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 4, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 5, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 6, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 7, 8, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 8, 9, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 9, 10, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 10, 11, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(1, 11)
    SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 2, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 3, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 4, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 5, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 6, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 7, 8, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 8, 9, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 9, 10, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 10, 11, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(2, 11)
    SetStartLocPrio(2, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 2, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 3, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 4, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 5, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 6, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 7, 8, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 8, 9, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 9, 10, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 10, 11, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(3, 11)
    SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 2, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 3, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 4, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 5, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 6, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 7, 8, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 8, 9, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 9, 10, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 10, 11, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(4, 11)
    SetStartLocPrio(4, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 2, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 3, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 4, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 5, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 6, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 7, 8, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 8, 9, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 9, 10, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 10, 11, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(5, 11)
    SetStartLocPrio(5, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 2, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 3, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 4, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 5, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 6, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 7, 8, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 8, 9, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 9, 10, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 10, 11, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(6, 11)
    SetStartLocPrio(6, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 2, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 3, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 4, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 5, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 6, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 7, 8, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 8, 9, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 9, 10, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 10, 11, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(7, 11)
    SetStartLocPrio(7, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 2, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 3, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 4, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 5, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 6, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 7, 8, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 8, 9, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 9, 10, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 10, 11, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(8, 11)
    SetStartLocPrio(8, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(8, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(8, 2, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(8, 3, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(8, 4, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(8, 5, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(8, 6, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(8, 7, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(8, 8, 9, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(8, 9, 10, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(8, 10, 11, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(9, 11)
    SetStartLocPrio(9, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(9, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(9, 2, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(9, 3, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(9, 4, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(9, 5, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(9, 6, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(9, 7, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(9, 8, 8, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(9, 9, 10, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(9, 10, 11, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(10, 11)
    SetStartLocPrio(10, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(10, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(10, 2, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(10, 3, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(10, 4, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(10, 5, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(10, 6, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(10, 7, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(10, 8, 8, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(10, 9, 9, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(10, 10, 11, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(11, 11)
    SetStartLocPrio(11, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(11, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(11, 2, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(11, 3, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(11, 4, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(11, 5, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(11, 6, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(11, 7, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(11, 8, 8, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(11, 9, 9, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(11, 10, 10, MAP_LOC_PRIO_HIGH)
end

function main()
    SetCameraBounds(5888.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -16384.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 12544.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -9088.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 5888.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -9088.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 12544.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -16384.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    SetTerrainFogEx(0, 3000.0, 5000.0, 8.500, 0.502, 0.502, 0.502)
    NewSoundEnvironment("Default")
    SetAmbientDaySound("LordaeronWinterDay")
    SetAmbientNightSound("LordaeronWinterNight")
    SetMapMusic("Music", true, 0)
    InitSounds()
    CreateRegions()
    CreateAllItems()
    InitBlizzard()
    InitGlobals()
    InitCustomTriggers()
    RunInitializationTriggers()
end

function config()
    SetMapName("TRIGSTR_001")
    SetMapDescription("TRIGSTR_003")
    SetPlayers(12)
    SetTeams(12)
    SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
    DefineStartLocation(0, 11456.0, -9728.0)
    DefineStartLocation(1, 11456.0, -9728.0)
    DefineStartLocation(2, 11456.0, -9728.0)
    DefineStartLocation(3, 11456.0, -9728.0)
    DefineStartLocation(4, 11456.0, -9728.0)
    DefineStartLocation(5, 11456.0, -9728.0)
    DefineStartLocation(6, 11456.0, -9728.0)
    DefineStartLocation(7, 11456.0, -9728.0)
    DefineStartLocation(8, 11456.0, -9728.0)
    DefineStartLocation(9, 11456.0, -9728.0)
    DefineStartLocation(10, 11456.0, -9728.0)
    DefineStartLocation(11, 11456.0, -9728.0)
    InitCustomPlayerSlots()
    InitCustomTeams()
    InitAllyPriorities()
end

