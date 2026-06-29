# Se o bloco for diferente do original, retorna
$execute unless block ~ ~ ~ $(b) run return fail

# Adiciona uma marcação
function ff:display/spawn_marking

# Substitui pelo novo bloco
$setblock ~ ~ ~ $(a) strict

# Se posiciona a leste e executa a função recursivamente
execute positioned ~1 ~ ~ run function ff:algorithm/floodfill with storage ff

# Se posiciona a oeste e executa a função recursivamente
execute positioned ~-1 ~ ~ run function ff:algorithm/floodfill with storage ff

# Se posiciona ao sul e executa a função recursivamente
execute positioned ~ ~ ~1 run function ff:algorithm/floodfill with storage ff

# Se posiciona ao norte e executa a função recursivamente
execute positioned ~ ~ ~-1 run function ff:algorithm/floodfill with storage ff

# Se posiciona acima e executa a função recursivamente
execute positioned ~ ~1 ~ run function ff:algorithm/floodfill with storage ff

# Se posiciona abaixo e executa a função recursivamente
execute positioned ~ ~-1 ~ run function ff:algorithm/floodfill with storage ff
