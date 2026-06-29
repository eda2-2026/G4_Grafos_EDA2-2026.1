# Elimina marcações anteriores
function ff:display/kill_markings

# Interpreta e aplica as configurações
function ff:tool/apply_configs

# Remove os dados do storage
data remove storage ff a
data remove storage ff b

# Salva o novo bloco na storage
data modify storage ff a set from entity @s SelectedItem.id

# Obtém o bloco original
function ff:util/get_block

# Remove namespace "minecraft:" do id
data modify storage ff a set string storage ff a 10
data modify storage ff b set string storage ff b 10

# Mensagens de erro
execute unless data storage ff a run return run tellraw @s {"text":"Segure um bloco para substituir","color":"red"}
execute unless function ff:util/compare_strings run return run tellraw @s {"text":"Os blocos devem ser diferentes","color":"red"}
execute if data storage ff {b:"air"} run return run tellraw @s {"text":"Se posicione em cima de um bloco","color":"red"}

# Caso especial: preencher com ar
execute if data storage ff {a:"structure_void"} run data modify storage ff a set value air

# Inicia o floodfill
function ff:algorithm/floodfill with storage ff

# Reproduz som de confirmação
playsound minecraft:item.trident.return master @a ~ ~ ~ 1 1.4

# Inicia animação se estiver habilitada
execute if score animation ff matches 1 run function ff:display/play_animation