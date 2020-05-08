--xgm github update
String = {}
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
    [1] = CreateForce()
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