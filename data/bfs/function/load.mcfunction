# Este arquivo é carregado a cada vez que se entra no mundo ou se executa /reload

# Minecraft não tem variáveis como em linguagens de programação tradicionais.
# Portanto utilizaremos a ferramenta Scoreboard, que funciona como uma planilha.

# Variáveis Globais

# bfs_found: Funciona como uma flag booleana (0 = Buscando, 1 = Ouro encontrado). Para o loop principal.
scoreboard objectives add bfs_found dummy

# bfs_dist: Mede a distância percorrida. É incrementada a cada "onda" (step) do algoritmo.
scoreboard objectives add bfs_dist dummy

# bfs_path_index: Usada no Backtrack. Dá um número de ordem para cada bloco rosa (migalha de pão).
scoreboard objectives add bfs_path_index dummy

# bfs_target_index: Usada pela IA do Aldeão. Diz para qual "migalha de pão" ele deve olhar e andar.
scoreboard objectives add bfs_target_index dummy


# Configurações do BFS - Define On/Off para os blocks ou os números

scoreboard objectives add cfg_numbers dummy
scoreboard objectives add cfg_block dummy

# Opção Padrão - block ativo, Números(Ondas) Ligados

scoreboard players set global cfg_numbers 1
scoreboard players set global cfg_block 1