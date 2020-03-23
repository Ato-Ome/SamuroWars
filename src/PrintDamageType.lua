---@param showdamage boolean
---@param damage real
---@param damagetype damagetype
---@param attacktype attacktype
---@param weapontype weapontype
---@param showdamagetype boolean
---@param showattacktype boolean
---@param showweapontype boolean
function PrintDamage(showdamage, damage, damagetype, attacktype, weapontype, showdamagetype, showattacktype, showweapontype)
    if showdamage == true then
        print(damage)
    end
    if showdamagetype then
        if damagetype == DAMAGE_TYPE_UNKNOWN then
            print("DAMAGE_TYPE_UNKNOWN")
        elseif damagetype == DAMAGE_TYPE_NORMAL then
            print("DAMAGE_TYPE_NORMAL")
        elseif damagetype == DAMAGE_TYPE_ENHANCED then
            print("DAMAGE_TYPE_ENHANCED")
        elseif damagetype == DAMAGE_TYPE_FIRE then
            print("DAMAGE_TYPE_FIRE")
        elseif damagetype == DAMAGE_TYPE_COLD then
            print("DAMAGE_TYPE_COLD")
        elseif damagetype == DAMAGE_TYPE_LIGHTNING then
            print("DAMAGE_TYPE_LIGHTNING")
        elseif damagetype == DAMAGE_TYPE_POISON then
            print("DAMAGE_TYPE_POISON")
        elseif damagetype == DAMAGE_TYPE_DISEASE then
            print("DAMAGE_TYPE_")
        elseif damagetype == DAMAGE_TYPE_DIVINE then
            print("DAMAGE_TYPE_DIVINE")
        elseif damagetype == DAMAGE_TYPE_MAGIC then
            print("DAMAGE_TYPE_MAGIC")
        elseif damagetype == DAMAGE_TYPE_SONIC then
            print("DAMAGE_TYPE_SONIC")
        elseif damagetype == DAMAGE_TYPE_ACID then
            print("DAMAGE_TYPE_ACID")
        elseif damagetype == DAMAGE_TYPE_FORCE then
            print("DAMAGE_TYPE_FORCE")
        elseif damagetype == DAMAGE_TYPE_DEATH then
            print("DAMAGE_TYPE_DEATH")
        elseif damagetype == DAMAGE_TYPE_MIND then
            print("DAMAGE_TYPE_MIND")
        elseif damagetype == DAMAGE_TYPE_PLANT then
            print("DAMAGE_TYPE_PLANT")
        elseif damagetype == DAMAGE_TYPE_DEFENSIVE then
            print("DAMAGE_TYPE_DEFENSIVE")
        elseif damagetype == DAMAGE_TYPE_DEMOLITION then
            print("DAMAGE_TYPE_DEMOLITION")
        elseif damagetype == DAMAGE_TYPE_SLOW_POISON then
            print("DAMAGE_TYPE_SLOW_POISON")
        elseif damagetype == DAMAGE_TYPE_SPIRIT_LINK then
            print("DAMAGE_TYPE_SPIRIT_LINK")
        elseif damagetype == DAMAGE_TYPE_SHADOW_STRIKE then
            print("DAMAGE_TYPE_SHADOW_STRIKE")
        elseif damagetype == DAMAGE_TYPE_UNIVERSAL then
            print("DAMAGE_TYPE_UNIVERSAL")
        end
    end
    if showattacktype then
        if attacktype == ATTACK_TYPE_NORMAL then
            print("ATTACK_TYPE_NORMAL")
        elseif attacktype == ATTACK_TYPE_HERO then
            print("ATTACK_TYPE_HERO")
        elseif attacktype == ATTACK_TYPE_MELEE then
            print("ATTACK_TYPE_MELEE")
        elseif attacktype == ATTACK_TYPE_PIERCE then
            print("ATTACK_TYPE_PIERCE")
        elseif attacktype == ATTACK_TYPE_MAGIC then
            print("ATTACK_TYPE_MAGIC")
        elseif attacktype == ATTACK_TYPE_CHAOS then
            print("ATTACK_TYPE_CHAOS")
        elseif attacktype == ATTACK_TYPE_SIEGE then
            print("ATTACK_TYPE_SIEGE")
        end
    end
    if showweapontype then
        if weapontype == WEAPON_TYPE_WHOKNOWS then
            print("WEAPON_TYPE_WHOKNOWS")
        elseif weapontype == WEAPON_TYPE_METAL_LIGHT_CHOP then
            print("WEAPON_TYPE_METAL_LIGHT_CHOP")
        elseif weapontype == WEAPON_TYPE_METAL_MEDIUM_CHOP then
            print("WEAPON_TYPE_METAL_MEDIUM_CHOP")
        elseif weapontype == WEAPON_TYPE_METAL_HEAVY_CHOP then
            print("WEAPON_TYPE_METAL_HEAVY_CHOP")
        elseif weapontype == WEAPON_TYPE_METAL_LIGHT_SLICE then
            print("WEAPON_TYPE_METAL_LIGHT_SLICE")
        elseif weapontype == WEAPON_TYPE_METAL_MEDIUM_SLICE then
            print("WEAPON_TYPE_METAL_MEDIUM_SLICE")
        elseif weapontype == WEAPON_TYPE_METAL_HEAVY_SLICE then
            print("WEAPON_TYPE_METAL_HEAVY_SLICE")
        elseif weapontype == WEAPON_TYPE_METAL_MEDIUM_BASH then
            print("WEAPON_TYPE_METAL_MEDIUM_BASH")
        elseif weapontype == WEAPON_TYPE_METAL_HEAVY_BASH then
            print("WEAPON_TYPE_METAL_HEAVY_BASH")
        elseif weapontype == WEAPON_TYPE_METAL_MEDIUM_STAB then
            print("WEAPON_TYPE_METAL_MEDIUM_STAB")
        elseif weapontype == WEAPON_TYPE_METAL_HEAVY_STAB then
            print("WEAPON_TYPE_METAL_HEAVY_STAB")
        elseif weapontype == WEAPON_TYPE_WOOD_LIGHT_SLICE then
            print("WEAPON_TYPE_WOOD_LIGHT_SLICE")
        elseif weapontype == WEAPON_TYPE_WOOD_MEDIUM_SLICE then
            print("WEAPON_TYPE_WOOD_MEDIUM_SLICE")
        elseif weapontype == WEAPON_TYPE_WOOD_HEAVY_SLICE then
            print("WEAPON_TYPE_WOOD_HEAVY_SLICE")
        elseif weapontype == WEAPON_TYPE_WOOD_LIGHT_BASH then
            print("WEAPON_TYPE_WOOD_LIGHT_BASH")
        elseif weapontype == WEAPON_TYPE_WOOD_MEDIUM_BASH then
            print("WEAPON_TYPE_WOOD_MEDIUM_BASH")
        elseif weapontype == WEAPON_TYPE_WOOD_HEAVY_BASH then
            print("WEAPON_TYPE_WOOD_HEAVY_BASH")
        elseif weapontype == WEAPON_TYPE_WOOD_LIGHT_STAB then
            print("WEAPON_TYPE_WOOD_LIGHT_STAB")
        elseif weapontype == WEAPON_TYPE_WOOD_MEDIUM_STAB then
            print("WEAPON_TYPE_WOOD_MEDIUM_STAB")
        elseif weapontype == WEAPON_TYPE_CLAW_LIGHT_SLICE then
            print("WEAPON_TYPE_CLAW_LIGHT_SLICE")
        elseif weapontype == WEAPON_TYPE_CLAW_MEDIUM_SLICE then
            print("WEAPON_TYPE_CLAW_MEDIUM_SLICE")
        elseif weapontype == WEAPON_TYPE_CLAW_HEAVY_SLICE then
            print("WEAPON_TYPE_CLAW_HEAVY_SLICE")
        elseif weapontype == WEAPON_TYPE_AXE_MEDIUM_CHOP then
            print("WEAPON_TYPE_AXE_MEDIUM_CHOP")
        elseif weapontype == WEAPON_TYPE_ROCK_HEAVY_BASH then
            print("WEAPON_TYPE_ROCK_HEAVY_BASH")
        end
    end
end