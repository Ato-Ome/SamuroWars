function ChooseTimeElapse_Actions()
    TimerDialogDisplay(dialog, false)
    DestroyTimerDialog(Dialog)
    PauseAllUnitsBJ(false)
    if Mode.Voices.DM > Mode.Voices.TVT then
        Mode.CurrentDM = true
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
        KillToWin = KillToWin * CountPlayersInForceBJ(GetPlayersAll())/2
    end
    for i = 0, bj_MAX_PLAYERS-1 do
        DialogDisplay(Player(i),Mode.Dialog,false)
    end
    ScoreTable = CreateLeaderboardBJ(GetPlayersAll(), "Score Table ".."|c00FFFC00"..KillToWin.."|r kills to win")
    for i = 0,bj_MAX_PLAYERS-1 do
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