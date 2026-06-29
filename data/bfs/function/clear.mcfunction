# ==============================================================================
# COMANDO CLEAR (Limpeza de Tela)
# Executado via: /function bfs:clear
# Apaga todos os números flutuantes gerados pelo BFS
# ==============================================================================

# Mata todos os números do BFS
kill @e[type=text_display,tag=bfs_display]

# ==============================================================================
# Opcional: Limpeza de "sujeiras" invisíveis de execuções passadas
# ==============================================================================
kill @e[type=marker,tag=bfs_node]
kill @e[type=marker,tag=bfs_path_node]
kill @e[type=block_display,tag=bfs_block]
