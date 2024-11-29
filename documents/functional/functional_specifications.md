# Functional Specification

## Table of Contents

<details>
<summary>Click to expand</summary>

- [Functional Specification](#functional-specification)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
    - [Overview](#overview)
    - [Purpose](#purpose)
    - [Out of Scope](#out-of-scope)
    - [Personas](#personas)
      - [**Eco-Crazy Advocate**](#eco-crazy-advocate)
      - [**Eco-Curious Gamer**](#eco-curious-gamer)
    - [Use cases](#use-cases)
  - [Game Mechanics](#game-mechanics)
    - [Economy \& green house gazes](#economy--green-house-gazes)
      - [Nodes](#nodes)
      - [Median Income](#median-income)
      - [Supply and demand](#supply-and-demand)
        - [=\> General Case:](#-general-case)
        - [=\> Stopping Condition:](#-stopping-condition)
      - [Pollution](#pollution)
    - [Diplomacy](#diplomacy)
      - [International agreement](#international-agreement)
        - [=\> Trade agreements](#-trade-agreements)
        - [=\> economic assistance treaties](#-economic-assistance-treaties)
        - [=\> research sharing](#-research-sharing)
      - [UN Resolution](#un-resolution)
        - [=\> UN leader](#-un-leader)
        - [=\> Making a resolution](#-making-a-resolution)
    - [Player income](#player-income)
      - [Taxes](#taxes)
        - [=\> Total Tax Income Calculation:](#-total-tax-income-calculation)
      - [International Aid](#international-aid)
        - [=\> Aid Income Calculation:](#-aid-income-calculation)
    - [Laws](#laws)
      - [Monetary laws](#monetary-laws)
      - [Ecological laws](#ecological-laws)
    - [Research](#research)
      - [Energy Research](#energy-research)
      - [Transport Research](#transport-research)
      - [Mechanic Interplay](#mechanic-interplay)

</details>

## Introduction

This is the official document containing the functional specifications of the serious game Dilemma. Our team is composed
of:

| Name             | Role              | Description                                                                               |
| ---------------- | ----------------- | ----------------------------------------------------------------------------------------- |
| Thomas PLANCHARD | Project Manager   | Responsible for project management, including timelines, planning, and team coordination. |
| Max BERNARD      | Program Manager   | Manages functional specification development and client communication for the project.    |
| Paul NOWAK       | Technical Lead    | Guides technical decisions and translates requirements into scalable technical solutions. |
| Clementine CUREL | Software Engineer | Develops and implements codebase, ensures code quality and collaboration within the team. |
| Quentin CLEMENT  | Software Engineer | Develops and implements codebase, ensures code quality and collaboration within the team. |
| Laurent BOUQUIN  | Quality Assurance | Creates tests to validate the quality of the solution and to ensure compliance.           |
| David CUAHONTE   | Technical Writer  | Creates comprehensive end-user documentation to facilitate the usage of the application.  |

### Overview

"Dilemma" is a project aimed at creating a serious strategy game using the Godot engine to raise awareness about greenhouse gas emissions and the importance of ecological transition. This game challenges players to manage a country by making strategic decisions across sectors like energy, transport, and education. The goal is to achieve a successful ecological transition while balancing economic growth and environmental impact. This project focuses on delivering an engaging and educational experience to inspire thoughtful action on environmental challenges.

_A logo of the game is shown below:_

<div align="center">

placeholder

</div>

### Purpose

This project is an opportunity for us to explore game development using the Godot engine while addressing an important global issue. Our main goal is to create a serious game that raises awareness about greenhouse gas emissions and the importance of ecological transition. By simulating the challenges of managing a country’s economy and environment, we aim to deliver a thought-provoking and educational experience.

While the primary objective is to ensure the core mechanics effectively demonstrate the impact of strategic decisions on the environment, we’re also considering additional features to enhance immersion, such as dynamic feedback systems and detailed visual representations of pollution and progress. However, aspects like multiplayer gameplay fall outside the scope of this project.

### Out of Scope

- **Mobile or Console Versions:**  
  Expanding the game to mobile or console platforms would require significant changes to the user interface and control schemes to accommodate different devices. Given the limited time left in the project, we will focus on the PC version and do not plan to implement mobile or console support.

- **Multiplayer Mode:**  
  The game is designed as a single-player experience where the player manages a country's ecological transition. Adding multiplayer support, while an interesting feature, would require extensive changes to the game mechanics, networking, and synchronization, which are beyond the scope of this project.

- **Multilingual Support:**  
  While supporting multiple languages would make the game more accessible, implementing a multilingual system would require significant effort, including a language selection menu and text translations. With the project's time constraints, this feature will not be pursued.

- **Real-time Data Integration:**  
  Integrating live data for real-world ecological or economic metrics would increase the game's realism. However, collecting and processing such data would introduce complexities related to data sources, reliability, and real-time updates, which are outside the project's current scope.

### Personas

#### **Eco-Crazy Advocate**

**Gaming Habits**: Plays strategy and simulation games that simulate real-world scenarios (e.g., _SimCity_ _Civilization_). Focuses on games with a strong narrative or cause.

**Motivations**:

- Passionate about the environment, eager to spread awareness and take action on ecological issues.
- Sees gaming as a powerful tool for educating others and raising awareness.

**Goals**:

- Enjoys games that challenge players to think about and solve real-world problems, especially environmental ones.
- Wants to inspire change through gameplay and storytelling.

**Frustrations**:

- Games that ignore or trivialize environmental issues.
  - Lack of depth in portraying ecological problems.

**Preferred Features**:

- Clear environmental impact in the game’s mechanics and story.
- Educational elements that teach sustainability and climate action.

---

#### **Eco-Curious Gamer**

**Gaming Habits**: Plays popular action/adventure and simulation games (e.g., _The Witcher 3_, _Minecraft_). Enjoys
immersive worlds and engaging gameplay but rarely considers environmental themes.

**Motivations**:

- Enjoys games for entertainment but is open to learning new topics, including ecology, if introduced in an engaging
  way.
- Curious about real-world issues, though not well-versed in ecological problems.

**Goals**:

- Wants to play fun, engaging games that subtly teach about global warming and sustainability.
- Enjoys learning through games but doesn't want to feel lectured.

**Frustrations**:

- Overly complex or preachy games that focus too much on details and not enough on fun.
- Lack of relatable or accessible environmental themes.

**Preferred Features**:

- Easy-to-understand mechanics with a natural integration of ecological themes.
- Gameplay decisions that impact the environment in a visible way.

### Use cases

**Modern Gamer Explores Ecological Transition Strategy**:

1. A modern gamer, interested in strategy games, installs the game on their computer and launches it.
2. The gamer begins a new game, selecting a country and starting the transition process towards a greener future.
3. As the player advances, they make decisions on policy, energy use, and environmental protection to balance growth with sustainability, all while learning about ecological impacts.
4. The gamer enjoys the challenge of improving the country's ecological footprint and continues to refine their strategies for a successful transition.

**Old-school Gamer Tackles Serious Ecological Strategy**:

1. An old-school gamer, intrigued by the serious gameplay approach, opens the game and starts a new round with a country in need of an ecological overhaul.
2. The gamer evaluates the country’s situation, making decisions on how to best balance the economy and environment, aiming for long-term ecological success.
3. The game’s serious tone and need for careful decision-making appeal to the gamer’s strategic mindset, as they focus on reaching an ecological transition while managing resources.
4. The gamer feels rewarded as their country progresses towards a greener future, deepening their understanding of the environmental challenges faced globally.

**Modern and Old-school Gamers Compete for Ecological Success**:

1. Both a modern and an old-school gamer start the game on their PCs, each choosing different countries to lead through the ecological transition.
2. They take turns in the game, making decisions about policies, renewable energy, and ecological preservation, with the goal of achieving the most sustainable country.
3. After completing their turns, the gamers compare results based on the ecological health and economic growth of their countries, enjoying the challenge of balancing both.
4. The players discuss strategies, sharing insights into how to best tackle the game's complexities while competing for the most successful ecological transition.

## Game Mechanics

### Economy & green house gazes

The economic and green house gaz system works in nodes. The nodes represent aspect of the Economy of a country eg.
example Transportation, Education, etc...

nodes have two values. Money and pollution. The pollution value is proportional to the money, but the ratio between the two can change with laws and technologies.

#### Nodes

| Name           |                                                                  |
| -------------- | ---------------------------------------------------------------- |
| Energy         | Electricity production in the country                            |
| Transport      | Personal and public transport                                    |
| Education      | How much money is in the education sector                        |
| Consumer Goods | The industry that fulfill the every day needs of the population  |
| Raw Resources  | All the materials and resources needed to make goods             |
| Fuel           | Represent all Hydrocarbon fuel including both fossil and biofuel |

The nodes are connected together and can grow and shrink to represent supply and demand.

***eg.*** *More money in `consumer good factory` means more money in `energy production` to represent factories increasing their energy consumption along with their output.*

This [spreadSheet](https://docs.google.com/spreadsheets/d/1nBxIMelLl4439p4A0lBnOFLjVdy7G12d8wt_ZIThWdA/edit?usp=sharing) details the interaction between the different nodes.

#### Median Income

A lot of Nodes are linked to the median income of the population. This is a unique node that doesn't directly generate pollution. Instead it leads and receive from a lot of different node and is one of the central element of the Game.

#### Supply and demand

When a sector grow or shrink, so does it's need.

***eg.*** *10% of Transport value comes from energy. if transport's value double, it's need in energy also does. So transport goes from draining 5M energy to draining 10M energy. but it's still 10% of the value of transport.*

The equation for how long it take supply to catch up to demand. 

1. The growth rate is 6% per turn, but if that 6% would cause the value to overshoot the supply, the growth rate reduces to 3%.
2. The growth continues until the value reaches the demand, meaning it will stop growing once the value equals or exceeds the demand.

Let the value be \( V_t \), the demand be \( D \), and the growth rate at time \( t \) be \( r_t \). The value at the next turn is \( V_{t+1} \).

##### => General Case:
- **If** \( V_t + 6\% \times V_t \leq D \), the growth rate is 6%, so:
  \[
  V_{t+1} = V_t + 0.06 \times V_t = V_t (1 + 0.06)
  \]
  
- **If** \( V_t + 6\% \times V_t > D \), then the growth rate reduces to 3% to avoid overshooting the demand, so:
  \[
  V_{t+1} = V_t + 0.03 \times V_t = V_t (1 + 0.03)
  \]

##### => Stopping Condition:
- The growth stops when \( V_t \geq D \), i.e., when the value reaches or exceeds the demand.

\[
V_{t+1} = \begin{cases} 
V_t (1 + 0.06) & \text{if } V_t + 0.06 \times V_t \leq D \\
V_t (1 + 0.03) & \text{if } V_t + 0.06 \times V_t > D \\
\end{cases}
\]
\[
\text{Stop when } V_t \geq D
\]

#### Pollution

Each node generate pollution proportionally to it's monetary value. The proportion can be changed by passing laws that reduce green house gases emissions in one or multiple nodes.

[Pollution per Value on this spreadsheet](https://docs.google.com/spreadsheets/d/1nBxIMelLl4439p4A0lBnOFLjVdy7G12d8wt_ZIThWdA/edit?usp=sharing) is the baseline for how much CO2 is created relative to the value of a node.

### Diplomacy

Diplomacy allows for two countries to make a number of agreements. These agreement can take two forms. UN resolution and International agreement.

#### International agreement

International agreement are accord between two countries. Those accord can concern trade, economic assistance, or research sharing.

##### => Trade agreements

Two countries can agree to a trade either resources or goods. Buying something that your country doesn't have enough off make that part of your economy grow slower but allows to satisfy demand for however many turns the agreement last.

##### => economic assistance treaties

Those treaties let you give money to a struggling country to help them catch up to the rest of the world. A country that struggle too much economically will also struggle to transition ecologically.

The game is all about cooperation and it is up to the player to sacrifice some of their economy to help other less fortunate place if they can.

##### => research sharing

Research sharing allow two countries to pool their RnD progress together. In game terms this mean that their research progress add to one an other at the end of each turn.

#### UN Resolution

Those are agreement between every nation to pass a particular law, to pool economic resources or to share technology.

##### => UN leader

At the beginning of a turn a country becomes the UN leader and can propose a resolution. The next turn a new UN leader is chosen at random but can't be the same as the previous one.

##### => Making a resolution

The UN leader propose a resolution and all the other countries can vote to accept or reject it. If the resolution is accepted it is enforced the following turn. Otherwise nothing happens.

### Player income

The player needs money to spend on laws, trade and research.

The main source of income for the player to spend in the game comes from taxing the different sector of the economy. The other source of income are trade and international aids

#### Taxes

At the beginning of each turn the player receive money from the different economic sectors. The income is calculated by taking the monetary value of the node with a multiplier determined by the tax law.

##### => Total Tax Income Calculation:
Let:
- \( N \): the number of nodes.
- \( V_i \): the value in the \( i \)-th node.
- \( T_i \): the tax multiplier for the \( i \)-th node.
- \( T_{income} \): the total tax income.

The total tax income is given by:
$$
T_{income} = \sum_{i=1}^N \left( V_i \cdot T_i \right)
$$

#### International Aid

If foreign nations are giving money to your country that money is split into three parts. Some of it goes toward developing a specific node chosen by the donator. Some of it goes to your Income and the rest is lost to simulate administrative inefficiency.


##### => Aid Income Calculation:
Let:
- \( D_i \): the value of the \( i \)-th donation, sorted in descending order (\( D_1 \geq D_2 \geq \dots \)).
- \( I_i \): the income derived from the \( i \)-th donation.
- \( N \): the total number of donations.

1. For the first donation (\( i = 1 \)):
   $$
   I_1 = \frac{D_1}{5}
   $$

2. For each subsequent donation (\( i \geq 2 \)):
   $$
   I_i = \frac{D_i}{5} \cdot (1 - 0.1(i - 1))
   $$

3. Total aid income (\( A_{income} \)):
   $$
   A = \sum_{i=1}^N I_i
   $$

### Laws

Laws can be two of types. Monetary laws which are taxes and subsidies, and Ecological laws.

#### Monetary laws

These laws

#### Ecological laws

### Research

The **Research** mechanic serves as the game's upgrade system, allowing players to advance their country's ecological transition through focused technological progress. Research is divided into two key areas: **Energy** and **Transport**, each offering a pathway to unlock more sustainable practices and infrastructure. Additionally, each level can be further upgraded in the future for enhanced benefits.

#### Energy Research

The **Energy Research** track focuses on developing cleaner, renewable energy sources to replace fossil fuels. Each step progresses toward reducing greenhouse gas emissions while maintaining or increasing energy production.

- **Level 1: Hydropower Expansion**  
  Rivers are tapped for hydropower generation, offering a steady, low-emission energy source while considering ecological impacts.

- **Level 2: Wind Turbines**  
  Large-scale wind farms are established, significantly increasing the share of renewable energy in the grid.

- **Level 3: Solar Panels**  
  Introduction of solar energy as a supplemental power source. Generates clean energy but requires investment in infrastructure.

- **Level 4: Advanced Energy Storage Systems**  
  Revolutionizes energy efficiency by integrating cutting-edge storage solutions, ensuring surplus renewable energy can be stored and distributed seamlessly.

- **Level 5: Fusion Reactors**  
  Research culminates in fusion technology, providing nearly limitless, clean energy and marking the pinnacle of renewable energy research.

#### Transport Research

The **Transport Research** track emphasizes reducing emissions from personal and public transport systems. Players can transition their country toward cleaner, more efficient modes of transportation.

- **Level 1: Public Transport Electrification**  
  Expands electric public transport, such as buses and trains, reducing reliance on fossil fuels for urban mobility.

- **Level 2: Electric Vehicles**  
  Incentivizes the adoption of electric cars, reducing emissions from personal transport.

- **Level 3: High-Speed Rail Networks**  
  Builds national high-speed rail systems, offering a low-emission alternative for long-distance travel.

- **Level 4: Autonomous Public Transport**  
  Integrates AI-driven systems into public transport, optimizing routes, reducing energy waste, and further lowering emissions.

- **Level 5: Hyperloop Systems**  
  Introduces cutting-edge hyperloop technology, drastically improving transport efficiency with near-zero emissions.

#### Mechanic Interplay

Players can choose to specialize in one research area or progress both simultaneously, balancing their country’s energy production and transportation needs. Upgrading in one track can also synergize with the other, such as electric vehicles benefiting from advancements in renewable energy.

This system ensures players have a strategic tool to guide their country toward ecological sustainability while managing resources and prioritizing goals effectively.
