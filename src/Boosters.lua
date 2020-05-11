function SpawnBoost()
    local random = GetRandomInt(1, 4)
    local rectname = {
        [1] = String[BlzGetLocale()].Rect.TL,
        [2]  = String[BlzGetLocale()].Rect.TR,
        [3] = String[BlzGetLocale()].Rect.BL,
        [4] = String[BlzGetLocale()].Rect.BR
    }
    local x = GetRectCenterX(SpawnRect.Revive[random])
    local y = GetRectCenterY(SpawnRect.Revive[random])
    local item = CreateItem(Boost[GetRandomInt(1, Boost.Count)], x, y)
    local red = BlzGetItemIntegerField(item, ITEM_IF_TINTING_COLOR_RED)
    local green = BlzGetItemIntegerField(item, ITEM_IF_TINTING_COLOR_GREEN)
    local blue = BlzGetItemIntegerField(item, ITEM_IF_TINTING_COLOR_BLUE)
    --print("|c00FFFC00"..GetItemName(item)..String[BlzGetLocale()].Rune[1]..rectname[random]..String[BlzGetLocale()].Rune[2])
    --BlzDisplayChatMessage(Player(24), 0, "|c00FFFC00"..GetItemName(item)..String[BlzGetLocale()].Rune[1]..rectname[random]..String[BlzGetLocale()].Rune[2])
    local minimapicon = CreateMinimapIcon(x, y, red, green, blue, "UI\\Minimap\\Minimap-QuestObjectivePrimary.mdl", FOG_OF_WAR_VISIBLE)
    PingMinimap(x, y, 3)
    TimerStart(CreateTimer(), 3, false, function() DestroyMinimapIcon(minimapicon) DestroyTimer(GetExpiredTimer()) end)
end