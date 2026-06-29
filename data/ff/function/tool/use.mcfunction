advancement revoke @s only ff:tool_use
function ff:tool/replenish_item/main

kill @e[type=text_display,tag=ff.display]

execute if entity @s[predicate=ff:sneaking] run return run function ff:tool/menu

execute unless items entity @s weapon.offhand *[custom_data~{ff:true}] run return fail

execute anchored eyes positioned ^ ^ ^2 align xyz run function ff:algorithm/init
