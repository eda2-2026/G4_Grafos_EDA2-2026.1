# Arquivo que viabiliza o comando : /function bsf:start

# 1. Zera as nossas flags globais e distâncias
scoreboard players set global bfs_found 0
scoreboard players set global bfs_dist 0
scoreboard players set global bfs_target_index 0

# 2. Mata todos os marcadores, textos e blocos de chamadas anteriores.
kill @e[type=marker,tag=bfs_node]
kill @e[type=marker,tag=bfs_path_node]
kill @e[type=text_display,tag=bfs_display]
kill @e[type=block_display,tag=bfs_block]

# 3. Invoca o(s) marcador(es) inicial(is). 
# Usamos "align xyz positioned ~0.5 ~-1 ~0.5" para cravar o marcador EXATAMENTE no centro matemático do bloco do chão.
execute if block ~ ~-1 ~ white_wool align xyz positioned ~0.5 ~-1 ~0.5 run summon marker ~ ~ ~ {Tags:["bfs_node", "bfs_active"]}

# 4. Avisa se o jogador tentou iniciar fora do labirinto
execute unless entity @e[type=marker,tag=bfs_active] run tellraw @s {"text":"Fique em cima da Lã Branca para iniciar o labirinto!","color":"red"}

# 5. Dá a partida no passo atual do BFS
execute if entity @e[type=marker,tag=bfs_active] run function bfs:algorithm/step