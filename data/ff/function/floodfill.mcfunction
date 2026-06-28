# SE o bloco for A: retorna
$execute unless block ~ ~ ~ $(a) run return fail

# SENÃO:

scoreboard players add counter ff 1
execute store result storage floodfill counter int 1 run scoreboard players get counter ff

function ff:text with storage floodfill

# Substitui o bloco A pelo bloco B
$fill ~ ~ ~ ~ ~ ~ $(b)

# Se posciona à leste e executa a função recursivamente
execute positioned ~1 ~ ~ run function ff:floodfill with storage floodfill

# Se posciona à oeste e executa a função recursivamente
execute positioned ~-1 ~ ~ run function ff:floodfill with storage floodfill

# Se posciona à sul e executa a função recursivamente
execute positioned ~ ~ ~1 run function ff:floodfill with storage floodfill

# Se posciona à norte e executa a função recursivamente
execute positioned ~ ~ ~-1 run function ff:floodfill with storage floodfill

# Se posciona à cima e executa a função recursivamente
execute positioned ~ ~1 ~ run function ff:floodfill with storage floodfill

# Se posciona à baixo e executa a função recursivamente
execute positioned ~ ~-1 ~ run function ff:floodfill with storage floodfill

