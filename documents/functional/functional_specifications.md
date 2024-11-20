# Functional Specification

## Table of Contents

<details>
<summary>Click to expand</summary>

</details>

## Introduction

This is the official document containing the functional specifications of the serious game Dilemma. Our team is composed of:

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

### Personas

#### **Eco-Crazy Advocate**

**Gaming Habits**: Plays strategy and simulation games that simulate real-world scenarios (e.g., _SimCity_, _Civilization_). Focuses on games with a strong narrative or cause.

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

**Gaming Habits**: Plays popular action/adventure and simulation games (e.g., _The Witcher 3_, _Minecraft_). Enjoys immersive worlds and engaging gameplay but rarely considers environmental themes.

**Motivations**:

- Enjoys games for entertainment but is open to learning new topics, including ecology, if introduced in an engaging way.
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

### Economy & green house gazes

The economic and green house gaz system works in nodes. The nodes represent aspect of the Economy of a country eg. example Transportation, Education, Income etc... 

A node has two values. Money and pollution. The pollution value is proportional to the money, but the ratio between the two can change from laws.

#### Nodes 

| Name |  |
| --- | --- |
| Energy | Electricity production in the country |
| Transport | Personal and public transport |
| Education | How much money is in the education sector |
| Consumer Goods | The industry that fulfill the every day needs of the population |
| Raw Resources | All the materials and resources needed to make goods |
| Fuel | Represent all Hydrocarbon fuel including both fossil and biofuel |

#### Connection

A connection tie two monetary values together. this can often work in both directions to represent supply and demand.
eg. More money in `consumer good factory` means more money in `energy production` to represent factories increasing their energy consumption along with their output.

The specific list of connections can be found in [this table]

#### Median Income

A lot of Nodes are linked to the median income of the population. This is a unique node that doesn't directly generate pollution. Instead it leads and receive from a lot of different node and is the central element of the Game.

#### Pollution

Each node generate pollution proportionally to it's monetary value. The proportion can be changed by passing laws that reduce green house gases emissions in one or multiple nodes.

### Diplomacy

Diplomacy allows for two countries to make a number of agreements. These agreement can take two forms. UN resolution and International agreement.

#### International agreement

International agreement are accord between two countries. Those accord can concern trade, economic assistance, or research sharing.

##### Trade agreements 

Two countries can agree to a trade either resources or 

#### UN Resolution

Those are agreement between every nation to pass a particular law, to pool economic resources or to share technology.

##### UN leader

At the beginning of a turn a country becomes the UN leader and can propose a resolution. The next turn a new UN leader is chosen at random but can't be the same as the previous one.

##### Making a resolution 

The UN leader propose a resolution and all the other countries can vote to accept or reject it. If the resolution is accepted it is enforced the following turn. Otherwise nothing happens.

#### Player income

The main source of income for the player to spend in the game comes from taxing the different sector of the economy.

### Law

### Research

