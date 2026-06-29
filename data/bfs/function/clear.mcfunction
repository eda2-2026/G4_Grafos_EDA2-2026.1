# ==============================================================================
# COMANDO CLEAR (Limpeza de Tela)
# Executado via: /function bfs:clear
# Apaga todos os números flutuantes gerados tanto pelo BFS quanto pelo Flood Fill
# ==============================================================================

# Mata todos os números do BFS
kill @e[type=text_display,tag=bfs_display]

# Mata todos os números do Flood Fill
kill @e[type=text_display,tag=ff.display]

# ==============================================================================
# Opcional: Limpeza de "sujeiras" invisíveis de execuções passadas
# ==============================================================================
kill @e[type=marker,tag=bfs_node]
kill @e[type=marker,tag=bfs_path_node]
kill @e[type=villager,tag=bfs_villager]
kill @e[type=marker,tag=ff.node]
