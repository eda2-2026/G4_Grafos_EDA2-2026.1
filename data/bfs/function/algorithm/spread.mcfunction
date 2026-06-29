# Arquivo que espalha a onda

# ==========================================
# LESTE (X+1)
# Se o filho nascer no Leste, para ele voltar pro pai ele tem que ir pro OESTE (tag=parent_1)
# ==========================================
# Checa lã branca livre
execute positioned ~1 ~ ~ if block ~ ~ ~ white_wool unless entity @e[type=marker,tag=bfs_node,distance=..0.5] run tag @s add has_children
execute positioned ~1 ~ ~ if block ~ ~ ~ white_wool unless entity @e[type=marker,tag=bfs_node,distance=..0.5] run summon marker ~ ~ ~ {Tags:["bfs_node", "bfs_new", "parent_1"]}
# Checa o Ouro
execute positioned ~1 ~ ~ if block ~ ~ ~ gold_block run tag @s add has_children
execute positioned ~1 ~ ~ if block ~ ~ ~ gold_block run function bfs:algorithm/found


# ==========================================
# OESTE (X-1)
# Se o filho nascer no Oeste, para voltar pro pai ele tem que ir pro LESTE (tag=parent_2)
# ==========================================
# Checa lã branca livre
execute positioned ~-1 ~ ~ if block ~ ~ ~ white_wool unless entity @e[type=marker,tag=bfs_node,distance=..0.5] run tag @s add has_children
execute positioned ~-1 ~ ~ if block ~ ~ ~ white_wool unless entity @e[type=marker,tag=bfs_node,distance=..0.5] run summon marker ~ ~ ~ {Tags:["bfs_node", "bfs_new", "parent_2"]}
# Checa o Ouro
execute positioned ~-1 ~ ~ if block ~ ~ ~ gold_block run tag @s add has_children
execute positioned ~-1 ~ ~ if block ~ ~ ~ gold_block run function bfs:algorithm/found


# ==========================================
# SUL (Z+1)
# Se o filho nascer no Sul, para voltar pro pai ele tem que ir pro NORTE (tag=parent_3)
# ==========================================
# Checa lã branca livre
execute positioned ~ ~ ~1 if block ~ ~ ~ white_wool unless entity @e[type=marker,tag=bfs_node,distance=..0.5] run tag @s add has_children
execute positioned ~ ~ ~1 if block ~ ~ ~ white_wool unless entity @e[type=marker,tag=bfs_node,distance=..0.5] run summon marker ~ ~ ~ {Tags:["bfs_node", "bfs_new", "parent_3"]}
# Checa o Ouro
execute positioned ~ ~ ~1 if block ~ ~ ~ gold_block run tag @s add has_children
execute positioned ~ ~ ~1 if block ~ ~ ~ gold_block run function bfs:algorithm/found


# ==========================================
# NORTE (Z-1)
# Se o filho nascer no Norte, para voltar pro pai ele tem que ir pro SUL (tag=parent_4)
# ==========================================
# Checa lã branca livre
execute positioned ~ ~ ~-1 if block ~ ~ ~ white_wool unless entity @e[type=marker,tag=bfs_node,distance=..0.5] run tag @s add has_children
execute positioned ~ ~ ~-1 if block ~ ~ ~ white_wool unless entity @e[type=marker,tag=bfs_node,distance=..0.5] run summon marker ~ ~ ~ {Tags:["bfs_node", "bfs_new", "parent_4"]}
# Checa o Ouro
execute positioned ~ ~ ~-1 if block ~ ~ ~ gold_block run tag @s add has_children
execute positioned ~ ~ ~-1 if block ~ ~ ~ gold_block run function bfs:algorithm/found
