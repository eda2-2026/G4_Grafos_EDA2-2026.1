# Função de Invocação do Aldeão e configurações iniciais

# Invoca o aldeão, sem IA, e com vida infinita, no centro do bloco inicial (lã branca inicial).
summon villager ~ ~ ~ {Tags:["bfs_villager"], NoAI:1b, Invulnerable:1b, Silent:1b, PersistenceRequired:1b, Age:-24000}

# Define o alvo dele como o nó 1 (o próximo passo)
scoreboard players set global bfs_target_index 1

# Adiciona um som de sucesso de quando ele chega ao bloco de ouro! 
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1
