# 🌊 Algoritmo Flood Fill em Minecraft - EDA2

## Objetivo do Projeto
O objetivo deste projeto é implementar o algoritmo clássico de **Flood Fill** (Preenchimento por Inundação) dentro do ambiente tridimensional do Minecraft por meio de um **Datapack**. O sistema demonstra de forma visual e interativa como algoritmos de travessia e busca em grafos operam no espaço 3D, mapeando blocos adjacentes como vértices e suas conexões como arestas.

## Características e Arquitetura

* **Recursão Espacial 3D (6 Direções):** O algoritmo de inundação propaga-se de forma tridimensional, verificando as 6 direções cardinais e espaciais: **Leste, Oeste, Sul, Norte, Zênite e Nadir** a partir do ponto de partida.
* **Marcação de Passos:** Mostra o número do passo em cada bloco afetado, permitindo visualizar a ordem em que o algoritmo se espalhou.

## 🕹️ Como Executar

A aplicação roda diretamente no motor do Minecraft Vanilla sem a necessidade de mods.

**Pré-requisitos:** Minecraft: Java Edition na versão **26.2**.

## 📦 Dependências

O projeto utiliza a seguinte dependência inclusa:
* **[BlockState Datapack](https://github.com/Triton365/BlockState):** Serve para obter o ID do bloco na coordenada desejada de forma eficiente por meio de uma árvore de busca binária contendo todos os blocos e estados mapeados.

### Passo 1: Instalar o Datapack no seu Mundo
1. Com o Minecraft fechado ou no menu principal, acesse a pasta da sua instância de jogo.
2. Localize a pasta do seu mundo de testes: `.minecraft/saves/<NOME_DO_MUNDO>/datapacks/`.
3. Mova a pasta `floodfill` (este repositório) para dentro da pasta `datapacks/`.
4. Entre no mundo no Minecraft.
5. Se o mundo já estava aberto, digite o comando `/reload` no chat e pressione Enter.

### Passo 2: Configurar o Preenchimento
1. Escolha o bloco com o qual deseja preencher a área e coloque-o na sua mão principal. Caso queira substituir os blocos por ar, segure o item **Vazio Estrutural** (`structure_void`).

2. **(Opcional)** Ajuste as configurações do datapack via scoreboard:
   * **Marcações de Passos:** Mostra os números dos passos nos blocos afetados.
     * Habilitar: `/scoreboard players set markings ff 1`
     * Desabilitar: `/scoreboard players set markings ff 0`
   * **Animação:** Preenche a área de forma animada seguindo a ordem de descoberta (requer `markings` ativo).
     * Habilitar: `/scoreboard players set animation ff 1`
     * Desabilitar: `/scoreboard players set animation ff 0`

### Passo 3: Executar o Algoritmo
1. Fique posicionado exatamente em cima do bloco inicial da estrutura que quer preencher.
2. Digite o seguinte comando no chat:
   ```mcfunction
   /execute positioned ~ ~-1 ~ run function ff:algorithm/init
   ```
3. O algoritmo executará, substituindo os blocos de forma animada e mostrando visualmente a ordem de preenchimento!
