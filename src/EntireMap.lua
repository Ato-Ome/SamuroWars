function EntireMap_Actions()
    TriggerRegisterUnitEvent(Trigger.Damage, GetTriggerUnit(), EVENT_UNIT_DAMAGED)
    TriggerRegisterUnitEvent(Trigger.Damaging, GetTriggerUnit(), EVENT_UNIT_DAMAGING)
end

function EntireMap()
    Trigger.EntireMap = CreateTrigger()
    TriggerRegisterEnterRectSimple(Trigger.EntireMap, GetPlayableMapRect())
    TriggerAddAction(Trigger.EntireMap, EntireMap_Actions)
end