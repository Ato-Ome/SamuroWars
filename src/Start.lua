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