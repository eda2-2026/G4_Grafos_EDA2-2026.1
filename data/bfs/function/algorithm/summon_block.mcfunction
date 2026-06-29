# Função de Invocação do Bloco e configurações iniciais

# Invoca o blocoz, no centro do bloco inicial (lã branca inicial).
summon block_display ~ ~ ~ {Tags:["bfs_block"], transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,1f,-0.25f],scale:[0.5f,0.5f,0.5f]},block_state:{Name:"minecraft:diamond_block"},brightness:{sky:15,block:15},teleport_duration:1}

# Define o alvo dele como o nó 1 (o próximo passo)
scoreboard players set global bfs_target_index 1