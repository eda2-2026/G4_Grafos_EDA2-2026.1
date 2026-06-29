scoreboard players set markings ff 1
scoreboard players set animation ff 0

# 10
execute if score @s ff.config matches 10 run return fail
# 11
execute if score @s ff.config matches 11 run return run scoreboard players set animation ff 1
# 01
execute if score @s ff.config matches 01 run scoreboard players set markings ff 0
execute if score @s ff.config matches 01 run return run scoreboard players set animation ff 1
# 00
scoreboard players set markings ff 0