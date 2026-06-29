# ==============================================================================
# ALGORITMO BFS - RECONSTRUÇÃO DO CAMINHO
# Este arquivo roda imediatamente após o algoritmo encontrar o ouro.
# Ele traça o caminho ótimo de trás pra frente, do objetivo até a semente inicial.
# ==============================================================================

# 1. RASTREAMENTO DO CAMINHO (MIGALHAS DE PÃO)
# Invoca um nó de caminho (bfs_path_node) que servirá de guia para a IA do Aldeão.
# Atribuímos a ele um índice decrescente para que o Aldeão saiba a ordem exata dos passos.
summon marker ~ ~ ~ {Tags:["bfs_path_node"]}
execute as @e[type=marker,tag=bfs_path_node,distance=..0.1,limit=1] run scoreboard players operation @s bfs_path_index = global bfs_path_index
scoreboard players remove global bfs_path_index 1


# 2. FEEDBACK VISUAL (PINTURA DO CAMINHO)
# Transforma a lã branca do chão do labirinto no Bloco de Gabarito (Lã verde).
execute if block ~ ~ ~ white_wool run setblock ~ ~ ~ green_wool

# Lê o número do passo atual e armazena em nossa macro para manipulação de texto.
execute if score global cfg_numbers matches 1 as @e[type=marker,tag=bfs_path_node,distance=..0.1,limit=1] store result storage bfs:macro dist int 1 run scoreboard players get @s bfs_path_index

# Pinta o número do caminho ótimo de Amarelo para destacá-lo da busca geral!
execute if score global cfg_numbers matches 1 run function bfs:display/color_text_yellow with storage bfs:macro


# 3. RECURSÃO REVERSA (SUBINDO A ÁRVORE)
# Verifica a Tag de parentesco ("parent_X") deixada durante a expansão (spread).
# O nó identifica de qual direção ele veio e passa a execução para o seu Pai.

# LESTE: Se viemos do Leste (parent_1), o Pai está no OESTE (X-1).
execute if entity @s[tag=parent_1] positioned ~-1 ~ ~ as @e[type=marker,tag=bfs_node,distance=..0.5,limit=1] run function bfs:algorithm/reconstruct_path

# OESTE: Se viemos do Oeste (parent_2), o Pai está no LESTE (X+1).
execute if entity @s[tag=parent_2] positioned ~1 ~ ~ as @e[type=marker,tag=bfs_node,distance=..0.5,limit=1] run function bfs:algorithm/reconstruct_path

# SUL: Se viemos do Sul (parent_3), o Pai está no NORTE (Z-1).
execute if entity @s[tag=parent_3] positioned ~ ~ ~-1 as @e[type=marker,tag=bfs_node,distance=..0.5,limit=1] run function bfs:algorithm/reconstruct_path

# NORTE: Se viemos do Norte (parent_4), o Pai está no SUL (Z+1).
execute if entity @s[tag=parent_4] positioned ~ ~ ~1 as @e[type=marker,tag=bfs_node,distance=..0.5,limit=1] run function bfs:algorithm/reconstruct_path


# 4. CONDIÇÃO DE PARADA (RAIZ DO GRAFO)
# Se o nó atual não possui nenhuma tag de parentesco, significa que chegamos na Semente Inicial.
# O caminho ótimo foi 100% traçado! Invocamos o Aldeão para percorrê-lo.
execute if score global cfg_villager matches 1 unless entity @s[tag=parent_1] unless entity @s[tag=parent_2] unless entity @s[tag=parent_3] unless entity @s[tag=parent_4] run function bfs:algorithm/summon_villager
