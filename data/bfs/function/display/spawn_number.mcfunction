# Salva a distância atual na macro
execute store result storage bfs:macro dist int 1 run scoreboard players get global bfs_dist

# Chama a macro para modificar o texto
function bfs:display/modify_text with storage bfs:macro
