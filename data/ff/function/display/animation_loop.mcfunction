execute if score total ff >= step ff run scoreboard players add step ff 1
execute if score markings ff matches 0 if score total ff < step ff run return run function ff:display/kill_markings

execute as @e[tag=ff.display,type=text_display] at @s if score @s ff = step ff run function ff:display/setblock with storage ff
