# SE o bloco for diferente de B: retorna
$execute unless block ~ ~ ~ $(b) run return fail

# SENÃO:

## Adiciona uma marcação
scoreboard players add step ff 1
execute if score markings ff matches 1 run function ff:display/spawn_marking

# Substitui pelo bloco A
$setblock ~ ~ ~ $(a) strict

# Se posiciona a leste e executa a função recursivamente
execute positioned ~1 ~ ~ run function ff:algorithm/floodfill with storage ff

# Se posiciona a oeste e executa a função recursivamente
execute positioned ~-1 ~ ~ run function ff:algorithm/floodfill with storage ff

# Se posiciona ao sul e executa a função recursivamente
execute positioned ~ ~ ~1 run function ff:algorithm/floodfill with storage ff

# Se posiciona ao norte e executa a função recursivamente
execute positioned ~ ~ ~-1 run function ff:algorithm/floodfill with storage ff

# Se posiciona ao zênite e executa a função recursivamente
execute positioned ~ ~1 ~ run function ff:algorithm/floodfill with storage ff

# Se posiciona ao nadir e executa a função recursivamente
execute positioned ~ ~-1 ~ run function ff:algorithm/floodfill with storage ff
