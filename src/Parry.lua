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