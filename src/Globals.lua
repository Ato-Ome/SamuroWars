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