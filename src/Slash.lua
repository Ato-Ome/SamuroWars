function ParryAI_Actions()
    local unit = GetTriggerUnit()
    local player = GetOwningPlayer(unit)
    local group = CreateGroup()
    local first
    local point
    local random
    GroupEnumUnitsInRange(group, GetUnitX(unit), GetUnitY(unit), 250, nil)
    for i = 1, CountUnitsInGroup(group) do
        first = FirstOfGroup(group)
        random = GetRandomReal(0, 100)
        if first ~= unit and IsUnitEnemy(first, player) and IsUnitVisible(first, player) and GetPlayerController(GetOwningPlayer(first)) == MAP_CONTROL_COMPUTER and random >= 25 then
            if BlzGetUnitAbilityCooldownRemaining(first, FourCC('A000')) == 0 then
                IssueImmediateOrder(first, "defend")
            elseif BlzGetUnitAbilityCooldownRemaining(first, FourCC('A001')) == 0 and GetUnitState(first, UNIT_STATE_MANA) > 30 then
                point = GetRandomLocInRect(bj_mapInitialPlayableArea)
                IssuePointOrderLoc(first, "blink", point)
                RemoveLocation(point)
            end
        end
        GroupRemoveUnit(group, first)
    end
    DestroyGroup(group)
end

function AttackAI_Actions()
    local unit = GetTriggerUnit()
    local attacker = GetAttacker()
    SetUnitFacingToFaceUnitTimed(unit, attacker, 0)
    local random = GetRandomReal(0, 100)
    if random >= 25 then
        IssueImmediateOrder(unit, "shockwave")
    end
end

function AttackAI_Conditions()
    local unit = GetTriggerUnit()
    return BlzGetUnitAbilityCooldownRemaining(unit, FourCC('A003')) == 0
end

function SlashAI_Actions()
    local unit = GetTriggerUnit()
    local player = GetOwningPlayer(unit)
    local group = CreateGroup()
    local first
    GroupEnumUnitsInRange(group, GetUnitX(unit), GetUnitY(unit), 250, nil)
    for i = 1, CountUnitsInGroup(group) do
        first = FirstOfGroup(group)
        if first ~= unit and IsUnitEnemy(first, player) and IsUnitVisible(first, player) and GetPlayerController(GetOwningPlayer(first)) == MAP_CONTROL_COMPUTER and BlzGetUnitAbilityCooldownRemaining(first, FourCC('A003')) == 0 and IsUnitEnemy(first, unit) then
            SetUnitFacingToFaceUnitTimed(first, unit, 0)
            IssueImmediateOrder(first, "shockwave")
        end
        GroupRemoveUnit(group, first)
    end
    DestroyGroup(group)
end

function SlashAI()
    Trigger.SlashAI = CreateTrigger()
    TriggerAddAction(Trigger.SlashAI, SlashAI_Actions)

    Trigger.AttackAI = CreateTrigger()
    TriggerAddCondition(Trigger.AttackAI, Condition(AttackAI_Conditions))
    TriggerAddAction(Trigger.AttackAI, AttackAI_Actions)

    Trigger.ParryAI = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(Trigger.ParryAI, EVENT_PLAYER_UNIT_SPELL_CAST)
    TriggerAddCondition(Trigger.ParryAI, Condition(Slash_Conditions))
    TriggerAddAction(Trigger.ParryAI, ParryAI_Actions)
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
    local first
    local effect
    GroupEnumUnitsInRange(group,GetUnitX(unit), GetUnitY(unit),250, Filter(Slash_Filter))
    for i = 1, CountUnitsInGroup(group) do
        first = FirstOfGroup(group)
        UnitDamageTarget(unit,first,250,true,false, ATTACK_TYPE_HERO,DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
        effect = AddSpecialEffect("Objects\\Spawnmodels\\Human\\HumanBlood\\HumanBloodKnight.mdl", GetUnitX(first),GetUnitY(first))
        DestroyEffect(effect)
        GroupRemoveUnit(group,first)
    end
    DestroyGroup(group)
end

function Slash()
    Trigger.Slash = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(Trigger.Slash, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    TriggerAddCondition(Trigger.Slash, Condition(Slash_Conditions))
    TriggerAddAction(Trigger.Slash, Slash_Actions)
end