kill @e[type=text_display,tag=ff.display]
scoreboard players reset step ff
scoreboard players reset total ff
data remove storage ff a
data remove storage ff b

data modify storage ff a set from entity @s SelectedItem.id
function ff:util/get_block

data modify storage ff a set string storage ff a 10
data modify storage ff b set string storage ff b 10

execute unless data storage ff a run return run tellraw @s {"text":"Segure um bloco para substituir","color":"red"}
execute unless function ff:util/compare_strings run return run tellraw @s {"text":"Os blocos devem ser diferentes","color":"red"}
execute if data storage ff {a:"structure_void"} run data modify storage ff a set value air
execute if data storage ff {b:"air"} run return run tellraw @s {"text":"Se posicione em cima de um bloco","color":"red"}

function ff:algorithm/floodfill with storage ff

# Animar
execute if score animation ff matches 1 run function ff:display/play_animation