-- Relic Guard

local sprite = Resources.sprite_load("aphelion", "item/relicGuard", PATH.."assets/sprites/items/relicGuard.png", 1, 16, 16)

local item = Item.new("aphelion", "relicGuard")
item:set_sprite(sprite)
item:set_tier(Item.TIER.uncommon)
item:set_loot_tags(Item.LOOT_TAG.category_healing)

item:onStatRecalc(function(actor, stack)
    actor.maxshield = actor.maxshield + (20 * stack)
end)

item:onShieldBreak(function(actor, stack)
    -- TODO for later: Apply to all nearby allies
    -- and change description wording
    actor:add_barrier(actor.maxshield * (0.5 + (stack * 0.5)))
end)



-- Achievement
item:add_achievement()

Player:onStatRecalc("aphelion-relicGuardUnlock", function(actor)
    if actor.maxshield >= 400.0 then
        item:progress_achievement()
    end
end)