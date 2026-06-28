summon item_display ~ ~ ~ {UUID:[I;0,0,0,0]}
loot replace entity 0-0-0-0-0 contents loot blockstate:get
data modify storage ff b set from entity 0-0-0-0-0 item.components."minecraft:custom_data".Name
kill 0-0-0-0-0