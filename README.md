# hero
hero rpg game based on flare engine

# how to add a new item to chest
mods/hero_geos/images/icons/<xx>.png

    draw some 32*32 size pictures into xx.png in order

mods/hero_geos/engine/icons.txt 

    icon_set=<startnum>,images/icons/<xx>.png

mods/hero_geos/items/items.txt

    [item]

    id=751

    name=Aloe Vera

    item_type=crafting  -- items/types.txt

    quality=crafting    -- items/qualities.txt

    icon=513            -- engine/icons.txt  <startnum> + the position
    
    price=20            
    
    max_quantity=40
    
    soundfx=soundfx/inventory/xy.ogg  --soundfx/inventory/<xy>.ogg
    
    loot_animation=animations/loot/xz.txt --animations/loot/<xz>.ogg

mods/hero_geos/soundfx/inventory/<xy>.ogg
    
    put new xy.ogg to soundfx/inventory

mods/hero_geos/animations/loot/<xz>.txt

    put new xz.txt to animations/loot

    in frame=Index, Direction, X, Y, Width, Height, X offset, Y offset

mods/hero_geos/loot/<xs>.txt

    loot=751,100  -- itemid, chance
    
# how to add a new power
mods/hero_geos/powers/powers.txt

    id:XX  --unified identity

    type: fixed missile repeater spawn transform block  --dead code
    
    icon: same as inventory

    new_state: if not instant, it's animation tag. 
        in animations/avatar/male/default_body.txt [<new_state>], such as [swing]

    base_damage: melee -- mods/default/engine/damage_types.txt
                          dmg_melee_min -- correspond to "stat="

mods/hero_geos/trees/default.txt
    
    [power]
    id=1
    position=0,0

    position : relative to power field

!!! very important attribute: replace_power in "rock.txt"
    That's replace meta_power to new power according to carry different weapon.
    