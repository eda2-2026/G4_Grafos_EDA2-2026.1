data modify storage ff:tool replenish_item.slot set value offhand
data modify storage ff:tool replenish_item.use_remainder set from entity @s Inventory[{Slot:-106b}]

function ff:tool/replenish_item/modify_item with storage ff:tool replenish_item