function Death_Actions()
    local unit = GetDyingUnit()
    local player = GetOwningPlayer(unit)
    local killer = GetKillingUnit()
    local killerplayer = GetOwningPlayer(killer)
    local t = CreateTimer()
    local random = GetRandomInt(1,20)
    local x = GetRandomReal(GetRectMinX(SpawnRect.revive[random]),GetRectMaxX(SpawnRect.revive[random]))
    local y = GetRandomReal(GetRectMinY(SpawnRect.revive[random]),GetRectMaxY(SpawnRect.revive[random]))
    if Hint[GetPlayerId(killerplayer)].Kill then
        Hint[GetPlayerId(killerplayer)].Kill = false
        DisplayTimedTextToPlayer(killerplayer, 0, 0, bj_TEXT_DELAY_ALWAYSHINT, "|c0000FF40Hint:|r You have killed an enemy, collect |c00FFFC00" ..KillToWin.. "|r kills to win")
    end
    Stats[GetPlayerId(killerplayer)].Kill = Stats[GetPlayerId(killerplayer)].Kill + 1
    if Mode.Current.DM == false then
        Stats.Team[GetPlayerTeam(killerplayer)] = Stats.Team[killerplayer] + 1
    end
    LeaderboardSetPlayerItemValueBJ(killerplayer,ScoreTable, Stats[GetPlayerId(killerplayer)].Kill)
    LeaderboardSortItemsByValue(ScoreTable, false)
    if Mode.Current.DM == true then
        if Stats[GetPlayerId(killerplayer)].Kill >= KillToWin then
            print("|c0000FF40"..GetPlayerName(killerplayer).."|r player has won, congratulate him, game will be end in |c00FFFC005|r second")
            TimerStart(Timer, 5, false, function()
                for i = 0, bj_MAX_PLAYERS-1 do
                    if Player(i) == killerplayer then
                        CustomVictoryBJ(killerplayer, true, true)
                    else
                        CustomDefeatBJ(Player(i, "You are loose, come again to win"))
                    end
                end
            end)
        end
    else
        if Stats.Team[GetPlayerTeam(killerplayer)] >= KillToWin then
            WinTeam = GetPlayerTeam(killerplayer)
            print("|c0000FF40"..Team.Name[GetPlayerTeam(killerplayer)].."|r team has won, congratulate them, game will be end in |c00FFFC005|r second")
            TimerStart(Timer, 5, false, function()
                for i = 0, bj_MAX_PLAYERS-1 do
                    if GetPlayerTeam(killerplayer) == WinTeam then
                        CustomVictoryBJ(killerplayer, true, true)
                    else
                        CustomDefeatBJ(Player(i, "Your team are loose, come again to win"))
                    end
                end
            end)
        end
    end
    Stats[GetPlayerId(player)].Death = Stats[GetPlayerId(player)].Death + 1
    random =  GetRandomInt(3,5)
    if Hint[GetPlayerId(player)].Death then
        Hint[GetPlayerId(player)].Death = false
        DisplayTimedTextToPlayer(player, 0, 0, bj_TEXT_DELAY_ALWAYSHINT, "|c0000FF40Hint:|r Your hero will be revive in |c00FFFC00"..random.."|r second")
    end
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
    TriggerAddAction(Trigger.Death, Death_Actions)
end