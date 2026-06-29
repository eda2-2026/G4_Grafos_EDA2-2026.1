# ==============================================================================
# ALGORITMO BFS - LAÇO PRINCIPAL (STEP)
# Este arquivo atua como o laço de repetição (While) do nosso Grafo.
# Ele expande a fronteira de busca (onda) camada por camada.
# ==============================================================================

# 1. INCREMENTO DA DISTÂNCIA
# A cada nova onda, aumentamos a distância do caminho atual.
scoreboard players add global bfs_dist 1

# 2. EXPANSÃO DA ONDA (SPREAD)
# Manda TODOS os nós da fronteira atual (bfs_active) explorarem as 4 direções (N, S, L, O).
execute as @e[type=marker,tag=bfs_active] at @s run function bfs:algorithm/spread


# 3. TRATAMENTO DE BECOS SEM SAÍDA (DEAD ENDS)
# Se um nó ativo tentou se espalhar mas não conseguiu gerar nenhum filho (has_children),
# significa que ele bateu em uma parede. Pintamos seu número de vermelho!
# Como ele pertence à onda anterior, subtraímos 1 da distância temporariamente para pintá-lo.
scoreboard players remove global bfs_dist 1
execute store result storage bfs:macro dist int 1 run scoreboard players get global bfs_dist

execute if score global cfg_numbers matches 1 as @e[type=marker,tag=bfs_active] unless entity @s[tag=has_children] at @s run function bfs:display/color_text_red with storage bfs:macro

scoreboard players add global bfs_dist 1


# 4. ATUALIZAÇÃO DA FRONTEIRA
# Os nós que acabaram de se espalhar deixam de ser a fronteira.
tag @e[type=marker,tag=bfs_active] remove bfs_active
# Os nós recém-descobertos (bfs_new) assumem como a nova fronteira.
tag @e[type=marker,tag=bfs_new] add bfs_active


# 5. RENDERIZAÇÃO DOS NÚMEROS (VISUAL)
# Se a configuração de números estiver ativa, spawna o texto no chão para a nova fronteira.
execute if score global cfg_numbers matches 1 as @e[type=marker,tag=bfs_active,tag=bfs_new] at @s run function bfs:display/spawn_number

# Limpa a tag provisória de recém-nascido.
tag @e[type=marker,tag=bfs_active] remove bfs_new


# 6. CONTINUIDADE DO LAÇO (RECURSÃO)
# Se ainda não achamos o ouro (bfs_found = 0) e ainda existe fronteira ativa para explorar, 
# chamamos este arquivo novamente para continuar a busca.
execute if score global bfs_found matches 0 if entity @e[type=marker,tag=bfs_active] run function bfs:algorithm/step


# 7. FALHA CRÍTICA (GRAFO DESCONEXO / SEM SAÍDA)
# Se a recursão parou (fronteira vazia) e não achamos o ouro, o labirinto não tem solução.
# Mudamos o placar para 2 (Falha) para evitar spam no chat durante o desenrolamento da pilha de chamadas.
execute if score global bfs_found matches 0 unless entity @e[type=marker,tag=bfs_active] run tellraw @a {"text":"Não há caminho até o ouro!","color":"red"}
execute if score global bfs_found matches 0 unless entity @e[type=marker,tag=bfs_active] run scoreboard players set global bfs_found 2
