function SpawnBoost()
    local random = GetRandomInt(17, 20)
    local rectname = {
        [17] = "|c0000FF40top left|r",
        [18]  = "|c0000FF40top right|r",
        [19] = "|c0000FF40bottom left|r",
        [20] = "|c0000FF40bottom right|r"
    }
    local x = GetRectCenterX(SpawnRect.Revive[random])
    local y = GetRectCenterY(SpawnRect.Revive[random])
    local item = CreateItem(Boost[GetRandomInt(1, Boost.Count)], x, y)
    print("|c00FFFC00"..GetItemName(item).."|r has created in "..rectname[random].." of center region")
end