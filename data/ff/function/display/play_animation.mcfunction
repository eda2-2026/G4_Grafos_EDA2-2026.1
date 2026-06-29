# Reverte os blocos para o original
execute as @e[tag=ff.display,type=text_display] at @s run function ff:display/revert_block with storage ff

# Inicia a animação
scoreboard players operation total ff = step ff
scoreboard players set step ff 0