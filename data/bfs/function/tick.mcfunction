# Este arquivo roda a cada frame (tick) para todos os aldeões bfs_villager

# 1. Limpa o target antigo de todos os nós
tag @e[type=marker,tag=bfs_path_node] remove bfs_target

# 2. Marca o nó atual que tem o índice igual ao target_index do aldeão
execute as @e[type=marker,tag=bfs_path_node] if score @s bfs_path_index = global bfs_target_index run tag @s add bfs_target

# 3. O aldeão olha para o target e dá um passinho pra frente (0.15 blocos)
execute as @e[type=villager,tag=bfs_villager] at @s facing entity @e[type=marker,tag=bfs_target,limit=1] feet run tp @s ^ ^ ^0.2

# 4. Checa se o aldeão chegou muito perto do target
# Se sim, aumenta o target_index para ele ir pro próximo
execute as @e[type=villager,tag=bfs_villager] at @s if entity @e[type=marker,tag=bfs_target,distance=..0.3] run scoreboard players add global bfs_target_index 1
execute as @e[type=villager,tag=bfs_villager] at @s if entity @e[type=marker,tag=bfs_target,distance=..0.3] run playsound minecraft:entity.chicken.step master @a ~ ~ ~ 1 1

# 5. Checa se ele chegou no fim do labirinto (O target index ficou maior que a distância total)
execute as @e[type=villager,tag=bfs_villager] at @s if score global bfs_target_index > global bfs_dist run playsound minecraft:entity.villager.celebrate master @a ~ ~ ~ 1 1
execute as @e[type=villager,tag=bfs_villager] at @s if score global bfs_target_index > global bfs_dist run kill @s

# Salva a missão atual (o número do nó) na macro
execute as @e[type=villager,tag=bfs_villager] at @s if entity @e[type=marker,tag=bfs_target,distance=..0.3] store result storage bfs:macro dist int 1 run scoreboard players get global bfs_target_index

# Pinta o número pisado de Verde! (Somente se os números estiverem ativados)
execute if score global cfg_numbers matches 1 as @e[type=villager,tag=bfs_villager] at @s if entity @e[type=marker,tag=bfs_target,distance=..0.3] run function bfs:display/color_text_green with storage bfs:macro
