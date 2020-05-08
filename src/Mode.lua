function ChooseTimeElapse_Actions()
    TimerDialogDisplay(dialog, false)
    DestroyTimerDialog(Dialog)
    PauseAllUnitsBJ(false)
    if Mode.Voices.DM > Mode.Voices.TVT then
        Mode.CurrentDM = true
        KillToWin = math.ceil(KillToWin * AllPlayers / GetPlayers())
        print(String[BlzGetLocale()].Mode.DM)
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
        end)
        dialog = CreateTimerDialog(Timer)
        TimerDialogSetTitle(dialog, String[BlzGetLocale()].Mode.DMTimer)
        TimerDialogDisplay(dialog, true)
    else
        print(String[BlzGetLocale()].Mode.TVT)
        Mode.CurrentDM = false
        KillToWin = math.ceil(KillToWin * 2 * AllPlayers / GetPlayers())
    end
    ScoreTable = CreateLeaderboardBJ(GetPlayersAll(), String[BlzGetLocale()].Mode.ScoreTable[1]..KillToWin..String[BlzGetLocale()].Mode.ScoreTable[2])
    for i = 0,bj_MAX_PLAYERS-1 do
        DialogDisplay(Player(i),Mode.Dialog,false)
        if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
            LeaderboardAddItemBJ(Player(i), ScoreTable, GetPlayerName(Player(i)), 0)
        end
    end
end

function ButtonClickDM_Actions()
    Mode.Voices.DM = Mode.Voices.DM + 1
    DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, bj_TEXT_DELAY_ALWAYSHINT, String[BlzGetLocale()].Mode.DMVote)
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
    DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, bj_TEXT_DELAY_ALWAYSHINT, String[BlzGetLocale()].Mode.TVTVote)
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
    DialogSetMessage(Mode.Dialog, String[BlzGetLocale()].Mode.Choose)
    Mode.Button.DM = DialogAddButton(Mode.Dialog, String[BlzGetLocale()].Mode.DMButton, 68)
    Mode.Button.TVT = DialogAddButton(Mode.Dialog, String[BlzGetLocale()].Mode.TVTButton, 84)
    ButtonClickTVT()
    ButtonClickDM()
    TimerStart(Timer, 7, false, ChooseTimeElapse_Actions)
    dialog = CreateTimerDialog(Timer)
    TimerDialogSetTitle(dialog, String[BlzGetLocale()].Mode.VotingEnd)
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