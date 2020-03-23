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
    TimerStart(CreateTimer(), 45, true, SpawnBoost)
end