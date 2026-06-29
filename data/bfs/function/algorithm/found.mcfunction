# O Ouro foi encontrado!

# 1. Altera a flag para o loop (step) ser interrompido e parar de espalhar a onda
scoreboard players set global bfs_found 1
scoreboard players operation global bfs_path_index = global bfs_dist

# 2. A função está rodando a partir do marcador que está EXATAMENTE do lado do ouro.
# Então iniciamos a reconstrução do caminho (reconstruct_path) a partir dele mesmo.
function bfs:algorithm/reconstruct_path
