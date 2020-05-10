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
        DisplayTimedTextToPlayer(sourceplayer, 0, 0, bj_TEXT_DELAY_ALWAYSHINT, String[BlzGetLocale()].Hint.Damage)
    end
    if GetUnitCurrentOrder(unit) == String2OrderIdBJ("defend") then
        if Hint[GetPlayerId(player)].Parry then
            Hint[GetPlayerId(player)].Parry = false
            DisplayTimedTextToPlayer(player, 0, 0, bj_TEXT_DELAY_ALWAYSHINT, String[BlzGetLocale()].Hint.Parry)
        end
        if Counter[GetPlayerId(player)] then
            Counter[GetPlayerId(player)] = false
            UnitAddAbility(unit, FourCC('A004'))
            if GetPlayerController(player) == MAP_CONTROL_USER then
                FlyTextTagMiss(unit, String[BlzGetLocale()].Hint.CounterFT, player)
            end
            IssueImmediateOrder(unit, "thunderclap")
            --PlaySoundOnUnitBJ(gg_snd_RyuKanSenTsumui, 100, GetTriggerUnit())
            TimerStart(CreateTimer(), 0.05, false, function() UnitRemoveAbility(unit, FourCC('A004')) DestroyTimer(GetExpiredTimer()) end)
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