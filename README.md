# 🧩 Algoritmos em Grafos no Minecraft - EDA2

Este projeto é um datapack de Minecraft desenvolvido em dupla para a disciplina de Estruturas de Dados e Algoritmos 2 (EDA2). Ele implementa algoritmos clássicos de grafos de forma visual e interativa no ambiente tridimensional e bidimensional do jogo, demonstrando conceitos fundamentais de grafos através de gamificação.

---

## 🕹️ Instalação e Requisitos Globais

A aplicação roda diretamente no motor do Minecraft Vanilla sem a necessidade de mods.
**Pré-requisitos:** Minecraft: Java Edition na versão **26.2**.

### 📦 Dependências
O projeto utiliza a seguinte dependência inclusa (Não precisa instalar):
* **[BlockState Datapack](https://github.com/Triton365/BlockState):** Serve para obter o ID do bloco na coordenada desejada de forma eficiente por meio de uma árvore de busca binária contendo todos os blocos e estados mapeados.

### 📥 Passo a Passo de Instalação
1. Localize a pasta do seu mundo: `.minecraft/saves/<NOME_DO_MUNDO>/datapacks/`.
2. Mova a pasta do datapack (este repositório) para dentro do diretório `datapacks/`.
3. Entre no mundo. Caso já estiver nele, envie o comando `/reload` no chat.

---

## 📚 Algoritmos Implementados

*(Clique nas abas abaixo para expandir a documentação, arquitetura e instruções de uso de cada algoritmo)*

<details>
<summary><b><big><big> 🌊 Algoritmo Flood Fill</big></big></b></summary>
<br>

## Objetivo do Algoritmo
O objetivo deste algoritmo é implementar o clássico **Flood Fill** (Preenchimento por Inundação) com recursão dentro do ambiente tridimensional do Minecraft. Ele demonstra de forma visual e interativa como algoritmos de travessia e busca em grafos operam no espaço 3D, mapeando blocos adjacentes como vértices e suas conexões como arestas.

## Características e Arquitetura

* **Recursão Espacial 3D (6 Direções):** O algoritmo de inundação propaga-se de forma tridimensional, verificando as 6 direções cardinais e espaciais: **Norte, Sul, Leste, Oeste, Cima e Baixo** a partir do ponto de partida.
* **Marcação de Passos:** Mostra o número do passo em cada bloco afetado, permitindo visualizar a ordem em que o algoritmo se espalhou.

## Como Configurar e Executar

1. **Preparação:** Segure na mão do personagem o bloco com o qual deseja preencher a área. Caso queira apagar os blocos (substituir por ar), segure o item **Vazio Estrutural** (`structure_void`).
2. **(Opcional) Configurações Visuais:** Você pode ajustar o datapack via scoreboard:
   * **Marcações de Passos:** Mostra os números dos passos nos blocos afetados.
     * Habilitar: `/scoreboard players set markings ff 1`
     * Desabilitar: `/scoreboard players set markings ff 0`
   * **Animação:** Preenche a área de forma animada seguindo a ordem de descoberta (requer `markings` ativo).
     * Habilitar: `/scoreboard players set animation ff 1`
     * Desabilitar: `/scoreboard players set animation ff 0`
3. **Execução:** Fique posicionado exatamente em cima do bloco inicial da estrutura que quer preencher e digite o seguinte comando:
   ```mcfunction
   /execute positioned ~ ~-1 ~ run function ff:algorithm/init
   ```
4. O algoritmo executará, substituindo os blocos de forma animada e mostrando visualmente a ordem de preenchimento.

</details>

<details>
<summary><b><big><big> 🧭 Algoritmo Busca em Largura (BFS)</big></big></b></summary>
<br>

## Objetivo do Algoritmo
O objetivo deste algoritmo é demonstrar o funcionamento da **Busca em Largura (Breadth-First Search - BFS)** encontrando o caminho mais curto (Shortest Path) entre um ponto de partida (Semente) e um alvo (Bloco de Ouro) em um labirinto bidimensional desenhado no chão, onde cada "nó" do grafo é representado por um bloco de Lã Branca.

## Características e Arquitetura

* **Expansão em Ondas (4 Direções):** O algoritmo explora os nós adjacentes em formato de onda concêntrica, verificando o **Norte, Sul, Leste e Oeste**. Isso garante que o primeiro caminho a encontrar o ouro é, matematicamente, o mais curto.
* **Reconstrução de Caminho (Path Reconstruction):** Assim que o alvo é alcançado, o algoritmo faz o rastreamento inverso, utilizando os ponteiros de parentesco (Parent Pointers) para subir na árvore geradora da folha até a raiz, extraindo e traçando a rota ótima.
* **Feedback Visual de Status:** O processo e os nós são renderizados passo a passo com semântica de cores:
  * ⬜ **Branco:** Nós recém-descobertos sendo explorados na onda.
  * 🟥 **Vermelho:** "Becos sem saída" (dead ends) que falharam em expandir.
  * 🟨 **Amarelo:** Os nós que compõem o caminho mais curto reconstruído.
  * 🟩 **Verde:** Os blocos ativamente pisados e validados pelo Agente de Navegação.
* **Agente de Navegação (NPC):** Após encontrar a solução, um Aldeão atua como ator passivo e percorre fisicamente o grafo (labirinto), caminhando nó por nó sobre a rota ótima até o alvo, simulando a aplicação real em navegação robótica/GPS.

## Como Configurar e Executar

1. **Preparação:** Crie o seu labirinto bidimensional colocando **Lã Branca** no chão. Coloque um **Bloco de Ouro** adjacente a qualquer lã branca onde deseja que seja o destino final.
2. **(Opcional) Configurações Visuais:** Você pode customizar os recursos visuais via placares:
   * **Sistema Visual de Status (Números e Cores):** (Padrão: Ligado)
     * Desligar: `/scoreboard players set global cfg_numbers 0`
     * Ligar: `/scoreboard players set global cfg_numbers 1`
   * **Agente de Navegação (Aldeão):** (Padrão: Ligado)
     * Desligar: `/scoreboard players set global cfg_villager 0`
     * Ligar: `/scoreboard players set global cfg_villager 1`
3. **Execução:** Fique posicionado exatamente em cima da Lã Branca onde você quer que a busca comece (Nó Semente) e digite:
   ```mcfunction
   /function bfs:algorithm/start
   ```

4. Acompanhe visualmente a onda expandindo, a árvore de falhas vermelha sendo desenhada e o Aldeão resolvendo o labirinto sobre a trilha amarela!
5. **Limpeza:** Para apagar os números e cores do labirinto após a execução, digite `/function bfs:clear`.

</details>

---

## Equipe de Desenvolvimento

| <img src="docs/assets/fotos/Davi-UnB.png" width="120px;" alt="Davi Freitas"/><br />**Davi Freitas** | <img src="docs/assets/fotos/Mateus0xC.png" width="120px;" alt="Mateus Barreto"/><br />**Mateus Barreto** |
| :---: | :---: |
| Matrícula: **241011018** | Matrícula: **241011466** |
| <img src="https://github.com/Davi-UnB.png" width="16px;"/> [`@Davi-UnB`](https://github.com/Davi-UnB) | <img src="https://github.com/Mateus0xC.png" width="16px;"/> [`@Mateus0xC`](https://github.com/Mateus0xC)