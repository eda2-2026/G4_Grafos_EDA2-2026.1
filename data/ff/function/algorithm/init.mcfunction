# Elimina marcações anteriores
function ff:display/clear_markings

# Interpreta e aplica as configurações
function ff:tool/apply_configs

# Remove os dados do storage
data remove storage ff novo
data remove storage ff original

# Salva o novo bloco na storage
data modify storage ff novo set from entity @s SelectedItem.id

# Obtém o bloco original
function ff:util/get_block

# Remove namespace "minecraft:" do id
data modify storage ff novo set string storage ff novo 10
data modify storage ff original set string storage ff original 10

# Tratamento de erros
execute unless data storage ff novo run return fail
execute unless function ff:util/compare_strings run return fail
execute if data storage ff {original:"air"} run return fail

# Caso especial: preencher com ar
execute if data storage ff {novo:"structure_void"} run data modify storage ff novo set value air

# Inicia o floodfill
function ff:algorithm/floodfill with storage ff

# Reproduz som de confirmação
playsound minecraft:item.trident.return master @a ~ ~ ~ 1 1.4

# Inicia animação se estiver habilitada
execute if score animation ff matches 1 run function ff:display/play_animation