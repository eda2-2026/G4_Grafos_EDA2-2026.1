execute as 0-0-0-0-1 unless entity @s[distance=...1] run kill @s

execute if block ~ ~ ~ air run return fail
execute if entity @s[predicate=ff:sneaking] run return run kill 0-0-0-0-1
execute unless items entity @s weapon.mainhand * run return run kill 0-0-0-0-1

summon item_display ~ ~ ~ {UUID:[I;0,0,0,1],Glowing:1b,Tags:["ff.tool_selector"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.5f,0.5f,0.5f],scale:[1.01f,1.01f,1.01f]},item:{id:"minecraft:white_stained_glass"},brightness:{block:15,sky:15}}