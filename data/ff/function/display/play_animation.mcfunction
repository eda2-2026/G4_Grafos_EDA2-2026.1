execute as @e[tag=ff.display,type=text_display] at @s run function ff:display/revert with storage ff

scoreboard players operation total ff = step ff
scoreboard players set step ff 0