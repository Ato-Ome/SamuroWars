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
    Count = 4,
    [1] = FourCC('DAMAGE'),
    [2] = FourCC('SPEED'),
    [3] = FourCC('CRIT'),
    [4] = FourCC('HEALTH'),
    [5] = FourCC('MANA'),
    [6] = FourCC('FIRE')
}