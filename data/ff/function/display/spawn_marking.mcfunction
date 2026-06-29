scoreboard players add step ff 1

execute if score animation ff matches 0 if score markings ff matches 0 run return fail

execute store result storage ff step int 1 run scoreboard players get step ff
execute align xyz positioned ~.5 ~.5 ~.5 summon text_display run function ff:display/modify_marking with storage ff
