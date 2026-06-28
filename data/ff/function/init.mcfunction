kill @e[type=text_display,tag=ff.display]
scoreboard players set counter ff 0

data remove storage floodfill a
data remove storage floodfill b

data modify storage floodfill a set from entity @s equipment.offhand.id
data modify storage floodfill b set from entity @s SelectedItem.id

data modify storage floodfill a set string storage floodfill a 10
data modify storage floodfill b set string storage floodfill b 10

function ff:floodfill with storage floodfill
function ff:revert with storage floodfill