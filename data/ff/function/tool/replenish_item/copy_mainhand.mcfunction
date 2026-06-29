data modify storage ff:tool replenish_item.slot set value mainhand
data modify storage ff:tool replenish_item.use_remainder set from entity @s SelectedItem

function ff:tool/replenish_item/modify_item with storage ff:tool replenish_item