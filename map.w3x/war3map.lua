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

--CUSTOM_CODE
--xgm github update
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
Stats = {
    Team = {}
}
KillToWin = 30
Timer = CreateTimer()
Team = {
    [0] = CreateForce(),
    [1] = CreateForce(),
    Name = {
        [0] = "Force 1",
        [1] = "Force 2"
    }
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

MultiBoard = {}

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
    PauseAllUnitsBJ(false)
    if Mode.Voices.DM > Mode.Voices.TVT then
        Mode.CurrentDM = true
        KillToWin = math.ceil(KillToWin * AllPlayers / GetPlayers())
        print("|c00FF0000Death Match|r mode was chosen by voting prepare to fight, your allies will become to enemy in |c00FFFC005|r second")
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
            DisableTrigger(gg_trg_AttackAllied)
        end)
        dialog = CreateTimerDialog(Timer)
        TimerDialogSetTitle(dialog, "Game Start")
        TimerDialogDisplay(dialog, true)
    else
        print("|c0000FFFFTeam vs Team|r mode was chosen by voting prepare to fight")
        Mode.CurrentDM = false
        KillToWin = math.ceil(KillToWin * 2 * AllPlayers / GetPlayers())
    end
    ScoreTable = CreateLeaderboardBJ(GetPlayersAll(), "Score Table ".."|c00FFFC00"..KillToWin.."|r kills to win")
    for i = 0,bj_MAX_PLAYERS-1 do
        DialogDisplay(Player(i),Mode.Dialog,false)
        if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
            LeaderboardAddItemBJ(Player(i), ScoreTable, GetPlayerName(Player(i)), 0)
        end
    end
end

function ButtonClickDM_Actions()
    Mode.Voices.DM = Mode.Voices.DM + 1
    DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, bj_TEXT_DELAY_ALWAYSHINT, "You have voted |c00FF0000Death Match|r mode, wait for others")
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
    DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, bj_TEXT_DELAY_ALWAYSHINT, "You have voted |c0000FFFFTeam vs Team|r mode, wait for others")
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
    DialogSetMessage(Mode.Dialog, "Mode choose")
    Mode.Button.DM = DialogAddButton(Mode.Dialog, "Death Match [|Cfffed312D|r]", 68)
    Mode.Button.TVT = DialogAddButton(Mode.Dialog, "Team vs Team [|Cfffed312T|r]", 84)
    ButtonClickTVT()
    ButtonClickDM()
    TimerStart(Timer, 7, false, ChooseTimeElapse_Actions)
    dialog = CreateTimerDialog(Timer)
    TimerDialogSetTitle(dialog, "Voting ends")
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
function Death_Actions()
    local unit = GetDyingUnit()
    local player = GetOwningPlayer(unit)
    local killer = GetKillingUnit()
    local killerplayer = GetOwningPlayer(killer)
    local t = CreateTimer()
    local random = GetRandomInt(1,20)
    local x = GetRandomReal(GetRectMinX(SpawnRect.Revive[random]),GetRectMaxX(SpawnRect.Revive[random]))
    local y = GetRandomReal(GetRectMinY(SpawnRect.Revive[random]),GetRectMaxY(SpawnRect.Revive[random]))
    if IsUnitType(unit, UNIT_TYPE_HERO) == true then
        if Hint[GetPlayerId(killerplayer)].Kill then
            Hint[GetPlayerId(killerplayer)].Kill = false
            DisplayTimedTextToPlayer(killerplayer, 0, 0, bj_TEXT_DELAY_ALWAYSHINT, "|c0000FF40Hint:|r You have killed an enemy, collect |c00FFFC00" ..KillToWin.. "|r kills to win")
        end
        Stats[GetPlayerId(killerplayer)].Kill = Stats[GetPlayerId(killerplayer)].Kill + 1
        print(Color[GetPlayerId(killerplayer)+ 1]..GetPlayerName(killerplayer).."|r has killed a "..Color[GetPlayerId(player)+ 1]..GetPlayerName(player).."|r")
        if Mode.CurrentDM == false then
            Stats.Team[GetPlayerTeam(killerplayer)] = Stats.Team[GetPlayerTeam(killerplayer)] + 1
        end
        LeaderboardSetPlayerItemValueBJ(killerplayer,ScoreTable, Stats[GetPlayerId(killerplayer)].Kill)
        LeaderboardSortItemsByValue(ScoreTable, false)
        if Mode.CurrentDM == true then
            if Stats[GetPlayerId(killerplayer)].Kill >= KillToWin then
                print("|c0000FF40"..GetPlayerName(killerplayer).."|r player has won, congratulate him, game will be end in |c00FFFC005|r second")
                TimerStart(Timer, 5, false, function()
                    for i = 0, bj_MAX_PLAYERS-1 do
                        if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
                            if Player(i) == killerplayer then
                                CustomVictoryBJ(killerplayer, true, true)
                            else
                                CustomDefeatBJ(Player(i), "You are loose, come again to win")
                            end
                        end
                    end
                end)
            end
        else
            if Stats.Team[GetPlayerTeam(killerplayer)] >= KillToWin then
                WinTeam = GetPlayerTeam(killerplayer)
                print("|c0000FF40"..Team.Name[WinTeam].."|r team has won, congratulate them, game will be end in |c00FFFC005|r second")
                TimerStart(Timer, 5, false, function()
                    for i = 0, bj_MAX_PLAYERS-1 do
                        if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
                            if GetPlayerTeam(Player(i)) == WinTeam then
                                CustomVictoryBJ(Player(i), true, true)
                            else
                                CustomDefeatBJ(Player(i), "Your team are loose, come again to win")
                            end
                        end
                    end
                end)
            end
        end
    end
    Stats[GetPlayerId(player)].Death = Stats[GetPlayerId(player)].Death + 1
    random =  GetRandomInt(3,5)
    if Hint[GetPlayerId(player)].Death then
        Hint[GetPlayerId(player)].Death = false
        DisplayTimedTextToPlayer(player, 0, 0, bj_TEXT_DELAY_ALWAYSHINT, "|c0000FF40Hint:|r Your hero will be Revive in |c00FFFC00"..random.."|r second")
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
    if Hint[GetPlayerId(sourceplayer)].Mana then
        Hint[GetPlayerId(sourceplayer)].Mana = false
        DisplayTimedTextToPlayer(sourceplayer, 0, 0, bj_TEXT_DELAY_ALWAYSHINT, "|c0000FF40Hint:|r Damage dealt will fill your mana")
    end
    if GetUnitCurrentOrder(unit) == String2OrderIdBJ("defend") then
        if Hint[GetPlayerId(player)].Parry then
            Hint[GetPlayerId(player)].Parry = false
            DisplayTimedTextToPlayer(player, 0, 0, bj_TEXT_DELAY_ALWAYSHINT, "|c0000FF40Hint:|r Parry returns all damage filling up your mana, also it increases your damage factor for |c00FFFC002|r  sec")
        end
        if Counter[GetPlayerId(player)] then
            Counter[GetPlayerId(player)] = false
            UnitAddAbility(unit, FourCC('A004'))
            if GetPlayerController(player) == MAP_CONTROL_USER then
                FlyTextTagMiss(unit, "Counter", player)
            end
            TimerStart(CreateTimer(), 1, false, function()
                UnitRemoveAbility(unit, FourCC('A004'))
                DestroyTimer(GetExpiredTimer())
            end)
        end
        UnitDamageTargetBJ(unit, source, damage, BlzGetEventAttackType(), DAMAGE_TYPE_DEFENSIVE)
        SetUnitState(unit, UNIT_STATE_MANA, GetUnitState(unit, UNIT_STATE_MANA) + damage / 5)
        if GetPlayerController(player) == MAP_CONTROL_USER then
            FlyTextTagMiss(unit, "Parry", player)
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
        SetUnitState(source, UNIT_STATE_MANA, GetUnitState(source, UNIT_STATE_MANA) + damage / 5)
        if GetPlayerController(sourceplayer) == MAP_CONTROL_USER then
            FlyTextTagManaBurn(source, "+" .. math.ceil(damage/5), sourceplayer)
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
    if Hint[GetPlayerId(player)].Slash then
        Hint[GetPlayerId(player)].Slash = false
        DisplayTimedTextToPlayer(player, 0, 0, bj_TEXT_DELAY_ALWAYSHINT, "|c0000FF40Hint:|r Slashing strike deals damage to enemies in front of you, but be careful, it can also be parried")
    end
    local first
    local effect
    GroupEnumUnitsInRange(group,GetUnitX(unit), GetUnitY(unit),250, Filter(Slash_Filter))
    for i = 1, CountUnitsInGroup(group) do
        first = FirstOfGroup(group)
        UnitDamageTarget(unit,first,250,true,false, ATTACK_TYPE_HERO,DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
        effect = AddSpecialEffect("Objects\\Spawnmodels\\Human\\HumanBlood\\HumanBloodKnight.mdl", GetUnitX(first),GetUnitY(first))
        DestroyEffect(effect)
        GroupRemoveUnit(group,first)
    end
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
    local random = GetRandomInt(17, 20)
    local rectname = {
        [17] = "|c0000FF40top left|r",
        [18]  = "|c0000FF40top right|r",
        [19] = "|c0000FF40bottom left|r",
        [20] = "|c0000FF40bottom right|r"
    }
    local x = GetRectCenterX(SpawnRect.Revive[random])
    local y = GetRectCenterY(SpawnRect.Revive[random])
    local item = CreateItem(Boost[GetRandomInt(1, Boost.Count)], x, y)
    print("|c00FFFC00"..GetItemName(item).."|r has created in "..rectname[random].." of center region")
end
--CUSTOM_CODE
function Trig_Initialization_Actions()
    MeleeStartingVisibility()
    SetMapMusicRandomBJ(gg_snd_great_player01)
        Start()
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
    UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), 75.00, ATTACK_TYPE_MELEE, DAMAGE_TYPE_MAGIC)
end

function Trig_Counter_Actions()
    ForGroupBJ(GetUnitsInRangeOfLocMatching(250.00, GetUnitLoc(GetTriggerUnit()), Condition(Trig_Counter_Func001001003)), Trig_Counter_Func001002)
        TimerStart(CreateTimer(), 0.05, false, function() UnitRemoveAbility(GetTriggerUnit(), FourCC('A004')) DestroyTimer(GetExpiredTimer()) end)
end

function InitTrig_Counter()
    gg_trg_Counter = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(gg_trg_Counter, EVENT_PLAYER_UNIT_SPELL_CAST)
    TriggerAddCondition(gg_trg_Counter, Condition(Trig_Counter_Conditions))
    TriggerAddAction(gg_trg_Counter, Trig_Counter_Actions)
end

function Trig_Leave_Actions()
        print("|c00FFFC00"..GetPlayerName(GetTriggerPlayer()).."|r Has left the game")
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
    SetPlayerStartLocation(Player(12), 6)
    ForcePlayerStartLocation(Player(12), 6)
    SetPlayerColor(Player(12), ConvertPlayerColor(12))
    SetPlayerRacePreference(Player(12), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(12), false)
    SetPlayerController(Player(12), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(13), 7)
    ForcePlayerStartLocation(Player(13), 7)
    SetPlayerColor(Player(13), ConvertPlayerColor(13))
    SetPlayerRacePreference(Player(13), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(13), false)
    SetPlayerController(Player(13), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(14), 8)
    ForcePlayerStartLocation(Player(14), 8)
    SetPlayerColor(Player(14), ConvertPlayerColor(14))
    SetPlayerRacePreference(Player(14), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(14), false)
    SetPlayerController(Player(14), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(15), 9)
    ForcePlayerStartLocation(Player(15), 9)
    SetPlayerColor(Player(15), ConvertPlayerColor(15))
    SetPlayerRacePreference(Player(15), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(15), false)
    SetPlayerController(Player(15), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(16), 10)
    ForcePlayerStartLocation(Player(16), 10)
    SetPlayerColor(Player(16), ConvertPlayerColor(16))
    SetPlayerRacePreference(Player(16), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(16), false)
    SetPlayerController(Player(16), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(17), 11)
    ForcePlayerStartLocation(Player(17), 11)
    SetPlayerColor(Player(17), ConvertPlayerColor(17))
    SetPlayerRacePreference(Player(17), RACE_PREF_ORC)
    SetPlayerRaceSelectable(Player(17), false)
    SetPlayerController(Player(17), MAP_CONTROL_USER)
end

function InitCustomTeams()
    SetPlayerTeam(Player(0), 0)
    SetPlayerTeam(Player(1), 0)
    SetPlayerTeam(Player(2), 0)
    SetPlayerTeam(Player(3), 0)
    SetPlayerTeam(Player(4), 0)
    SetPlayerTeam(Player(5), 0)
    SetPlayerTeam(Player(16), 0)
    SetPlayerTeam(Player(17), 0)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(16), true)
    SetPlayerAllianceStateAllyBJ(Player(0), Player(17), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(16), true)
    SetPlayerAllianceStateAllyBJ(Player(1), Player(17), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(16), true)
    SetPlayerAllianceStateAllyBJ(Player(2), Player(17), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(16), true)
    SetPlayerAllianceStateAllyBJ(Player(3), Player(17), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(16), true)
    SetPlayerAllianceStateAllyBJ(Player(4), Player(17), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(16), true)
    SetPlayerAllianceStateAllyBJ(Player(5), Player(17), true)
    SetPlayerAllianceStateAllyBJ(Player(16), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(16), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(16), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(16), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(16), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(16), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(16), Player(17), true)
    SetPlayerAllianceStateAllyBJ(Player(17), Player(0), true)
    SetPlayerAllianceStateAllyBJ(Player(17), Player(1), true)
    SetPlayerAllianceStateAllyBJ(Player(17), Player(2), true)
    SetPlayerAllianceStateAllyBJ(Player(17), Player(3), true)
    SetPlayerAllianceStateAllyBJ(Player(17), Player(4), true)
    SetPlayerAllianceStateAllyBJ(Player(17), Player(5), true)
    SetPlayerAllianceStateAllyBJ(Player(17), Player(16), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(16), true)
    SetPlayerAllianceStateVisionBJ(Player(0), Player(17), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(16), true)
    SetPlayerAllianceStateVisionBJ(Player(1), Player(17), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(16), true)
    SetPlayerAllianceStateVisionBJ(Player(2), Player(17), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(16), true)
    SetPlayerAllianceStateVisionBJ(Player(3), Player(17), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(16), true)
    SetPlayerAllianceStateVisionBJ(Player(4), Player(17), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(16), true)
    SetPlayerAllianceStateVisionBJ(Player(5), Player(17), true)
    SetPlayerAllianceStateVisionBJ(Player(16), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(16), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(16), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(16), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(16), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(16), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(16), Player(17), true)
    SetPlayerAllianceStateVisionBJ(Player(17), Player(0), true)
    SetPlayerAllianceStateVisionBJ(Player(17), Player(1), true)
    SetPlayerAllianceStateVisionBJ(Player(17), Player(2), true)
    SetPlayerAllianceStateVisionBJ(Player(17), Player(3), true)
    SetPlayerAllianceStateVisionBJ(Player(17), Player(4), true)
    SetPlayerAllianceStateVisionBJ(Player(17), Player(5), true)
    SetPlayerAllianceStateVisionBJ(Player(17), Player(16), true)
    SetPlayerTeam(Player(12), 1)
    SetPlayerTeam(Player(13), 1)
    SetPlayerTeam(Player(14), 1)
    SetPlayerTeam(Player(15), 1)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(13), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(14), true)
    SetPlayerAllianceStateAllyBJ(Player(12), Player(15), true)
    SetPlayerAllianceStateAllyBJ(Player(13), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(13), Player(14), true)
    SetPlayerAllianceStateAllyBJ(Player(13), Player(15), true)
    SetPlayerAllianceStateAllyBJ(Player(14), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(14), Player(13), true)
    SetPlayerAllianceStateAllyBJ(Player(14), Player(15), true)
    SetPlayerAllianceStateAllyBJ(Player(15), Player(12), true)
    SetPlayerAllianceStateAllyBJ(Player(15), Player(13), true)
    SetPlayerAllianceStateAllyBJ(Player(15), Player(14), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(13), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(14), true)
    SetPlayerAllianceStateVisionBJ(Player(12), Player(15), true)
    SetPlayerAllianceStateVisionBJ(Player(13), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(13), Player(14), true)
    SetPlayerAllianceStateVisionBJ(Player(13), Player(15), true)
    SetPlayerAllianceStateVisionBJ(Player(14), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(14), Player(13), true)
    SetPlayerAllianceStateVisionBJ(Player(14), Player(15), true)
    SetPlayerAllianceStateVisionBJ(Player(15), Player(12), true)
    SetPlayerAllianceStateVisionBJ(Player(15), Player(13), true)
    SetPlayerAllianceStateVisionBJ(Player(15), Player(14), true)
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
    SetCameraBounds(-3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    NewSoundEnvironment("Default")
    SetAmbientDaySound("BarrensDay")
    SetAmbientNightSound("BarrensNight")
    SetMapMusic("Music", true, 0)
    InitSounds()
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
    DefineStartLocation(0, 0.0, -256.0)
    DefineStartLocation(1, 0.0, -256.0)
    DefineStartLocation(2, 0.0, -256.0)
    DefineStartLocation(3, 0.0, -256.0)
    DefineStartLocation(4, 0.0, -256.0)
    DefineStartLocation(5, 0.0, -256.0)
    DefineStartLocation(6, 0.0, -256.0)
    DefineStartLocation(7, 0.0, -256.0)
    DefineStartLocation(8, 0.0, -256.0)
    DefineStartLocation(9, 0.0, -256.0)
    DefineStartLocation(10, 0.0, -256.0)
    DefineStartLocation(11, 0.0, -256.0)
    InitCustomPlayerSlots()
    InitCustomTeams()
    InitAllyPriorities()
end

