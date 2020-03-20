function Damage_Actions()
    local unit = BlzGetEventDamageTarget()
    local source = GetEventDamageSource()
    local player = GetOwningPlayer(unit)
    local sourceplayer = GetOwningPlayer(source)
    local damage = GetEventDamage()
    if GetUnitCurrentOrder(source) ~= String2OrderIdBJ("defend") then
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
        UnitDamageTargetBJ(unit, source, damage, BlzGetEventAttackType(), DAMAGE_TYPE_DEFENSIVE)
        SetUnitState(unit, UNIT_STATE_MANA, GetUnitState(unit, UNIT_STATE_MANA) + damage / 5)
        if BlzGetEventDamageType() ~= DAMAGE_TYPE_ENHANCED then
            CritFactor[GetPlayerId(player)] = CritFactor[GetPlayerId(player)] + 1
        end
        if GetPlayerController(player) == MAP_CONTROL_USER then
            FlyTextTagMiss(unit, "Parry", player)
            FlyTextTagManaBurn(unit, "+" .. math.ceil(damage/5), player)
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
    end
end

function Damage()
    Trigger.Damage = CreateTrigger()
    TriggerAddAction(Trigger.Damage, Damage_Actions)
end