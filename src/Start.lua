function Start()
    local unit
    SpawnRect = {
        [0] = Rect(-1408.0, -128.0, -1280.0, 0.0),
        [1] = Rect(-1408.0, -256.0, -1280.0, -128.0),
        [2] = Rect(-1408.0, -384.0, -1280.0, -256.0),
        [3] = Rect(-1408.0, -512.0, -1280.0, -384.0),
        [4] = Rect(-1280.0, -128.0, -1152.0, 0.0),
        [5] = Rect(-1280.0, -256.0, -1152.0, -128.0),
        [6] = Rect(-1280.0, -384.0, -1152.0, -256.0),
        [7] = Rect(-1280.0, -512.0, -1152.0, -384.0),
        [8] = Rect(-1152.0, -128.0, -1024.0, 0.0),
        [9] = Rect(-1152.0, -256.0, -1024.0, -128.0),
        [10] = Rect(-1152.0, -384.0, -1024.0, -256.0),
        [11] = Rect(-1152.0, -512.0, -1024.0, -384.0),
        [12] = Rect(1280.0, -128.0, 1408.0, 0.0),
        [13] = Rect(1280.0, -256.0, 1408.0, -128.0),
        [14] = Rect(1280.0, -384.0, 1408.0, -256.0),
        [15] = Rect(1280.0, -512.0, 1408.0, -384.0),
        [16] = Rect(1152.0, -128.0, 1280.0, 0.0),
        [17] = Rect(1152.0, -256.0, 1280.0, -128.0),
        [18] = Rect(1152.0, -384.0, 1280.0, -256.0),
        [19] = Rect(1152.0, -512.0, 1280.0, -384.0),
        [20] = Rect(1024.0, -128.0, 1152.0, 0.0),
        [21] = Rect(1024.0, -256.0, 1152.0, -128.0),
        [22] = Rect(1024.0, -384.0, 1152.0, -256.0),
        [23] = Rect(1024.0, -512.0, 1152.0, -384.0),
        Revive = {
            [1] = Rect(-1536.0, -1408.0, -1152.0, -896.0),
            [2] = Rect(1152.0, -1408.0, 1536.0, -896.0),
            [3] = Rect(-512.0, -3200.0, 512.0, -2816.0),
            [4] = Rect(-512.0, 2304.0, 512.0, 2688.0),
            [5] = Rect(-1536.0, 384.0, -1152.0, 896.0),
            [6] = Rect(1152.0, 384.0, 1536.0, 896.0),
            [7] = Rect(-1024.0, -1792.0, -384.0, -1536.0),
            [8] = Rect(384.0, -1792.0, 1024.0, -1536.0),
            [9] = Rect(-1024.0, 1024.0, -384.0, 1280.0),
            [10] = Rect(384.0, 1024.0, 1024.0, 1280.0),
            [11] = Rect(-1536.0, -640.0, -768.0, 128.0),
            [12] = Rect(768.0, -640.0, 1536.0, 128.0),
            [13] = Rect(-1152.0, -2560.0, -640.0, -2048.0),
            [14] = Rect(640.0, -2560.0, 1152.0, -2048.0),
            [15] = Rect(-1152.0, 1536.0, -640.0, 2048.0),
            [16] = Rect(640.0, 1536.0, 1152.0, 2048.0),
            [17] = Rect(-1024.0, 384.0, -384.0, 768.0), --center top left
            [18] = Rect(384.0, 384.0, 1024.0, 768.0), --center top right
            [19] = Rect(-1024.0, -1280.0, -384.0, -896.0), --center bottom left
            [20] = Rect(384.0, -1280.0, 1024.0, -896.0)  --center bottom right
        }
    }
    String = {
        enUS = {
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
    Team = {
        Name = {
            [0] = String[BlzGetLocale()].Force.."1",
            [0] = String[BlzGetLocale()].Force.."2",
        }
    }
    Death()
    Damage()
    EntireMap()
    Slash()
    TimeElapse()
    Parry()
    Stats.Team = {
        [0] = 0,
        [1] = 0
    }
    for i = 0, bj_MAX_PLAYERS-1 do
        Hint[i] = {
            Death = true,
            Mana = true,
            Parry = true,
            Slash = true,
            Kill = true
        }
        FogModifierStart(CreateFogModifierRect(Player(i), FOG_OF_WAR_VISIBLE, GetPlayableMapRect(), true, false))
    end

    for i = 0, bj_MAX_PLAYERS-1 do
        if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
            unit = CreateUnit(Player(i),FourCC("O000"), GetRectCenterX(SpawnRect[i]), GetRectCenterY(SpawnRect[i]),GetPlayerTeam(Player(i))*180)
            if GetPlayerController(Player(i)) == MAP_CONTROL_USER then
                Players = Players + 1
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
            PanCameraToForPlayer(Player(i),GetUnitX(unit),GetUnitY(unit))
        end
    end
    TimerStart(CreateTimer(), 15, true, SpawnBoost)
end