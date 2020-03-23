function SpawnBoost()
    local random = GetRandomInt(17, 20)
    CreateItem(FourCC('RAW'), GetRectCenterX(SpawnRect.Revive[random]), GetRectCenterY(SpawnRect.Revive[random]))
end