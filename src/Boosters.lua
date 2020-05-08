function SpawnBoost()
    local random = GetRandomInt(17, 20)
    local rectname = {
        [17] = String[BlzGetLocale()].Rect.TL,
        [18]  = String[BlzGetLocale()].Rect.TR,
        [19] = String[BlzGetLocale()].Rect.BL,
        [20] = String[BlzGetLocale()].Rect.BR
    }
    local x = GetRectCenterX(SpawnRect.Revive[random])
    local y = GetRectCenterY(SpawnRect.Revive[random])
    local item = CreateItem(Boost[GetRandomInt(1, Boost.Count)], x, y)
    print("|c00FFFC00"..GetItemName(item)..String[BlzGetLocale()].Rune[1]..rectname[random]..String[BlzGetLocale()].Rune[2])
end