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
        UnitDamageTarget(unit,first,150,true,false,ATTACK_TYPE_HERO,DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
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