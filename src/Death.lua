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