# Cria uma entidade auxiliar
summon item_display ~ ~ ~ {UUID:[I;0,0,0,0]}

# Usa o datapack BlockState para obter o id do bloco atual
loot replace entity 0-0-0-0-0 contents loot blockstate:get

# Salva o bloco original na storage
data modify storage ff b set from entity 0-0-0-0-0 item.components."minecraft:custom_data".Name

# Mata a entity auxiliar
kill 0-0-0-0-0