# Technical Specifications Plan

## Table of Contents

<details>
<summary>Click to expand</summary>

- [Technical Specifications Plan: Version 3 (Dilemma)](#technical-specifications-plan-version-3-dilemma)
  - [Table of Contents](#table-of-contents)
  - [Document Evolution](#document-evolution)
  - [Document Validation](#document-validation)
  - [1. Overview](#1-overview)
    - [1.1. Document Purpose](#11-document-purpose)
    - [1.2. Game Presentation](#12-game-presentation)
  - [2. Game Architecture](#2-game-architecture)
    - [2.1. Target Platform](#21-target-platform)
    - [2.2. Modules and Components](#22-modules-and-components)
    - [2.3. Other External IT Tools](#23-other-external-it-tools)
    - [2.4. Files Organization](#24-files-organization)
  - [3. Technologies Used](#3-technologies-used)
    - [3.1. Game Engine Presentation](#31-game-engine-presentation)
    - [3.2. Data Management](#32-data-management)
    - [3.3. Programming Language](#33-programming-language)
    - [3.4. Non-Functional Requirements](#34-non-functional-requirements)
    - [3.5. Risks & Assumptions](#35-risks--assumptions)
  - [4. Mechanics and Systems Details](#4-mechanics-and-systems-details)
    - [4.1. Setting up Game Manager](#41-setting-up-game-manager)
    - [4.2. Managing Game Economies](#42-managing-game-economies)
    - [4.3. Game Progression](#43-game-progression)
    - [4.4. Event Management](#44-event-management)
  - [5. Gameplay](#5-gameplay)
    - [5.1. Controls Handling](#51-controls-handling)
    - [5.2. Graphics and Visuals](#52-graphics-and-visuals)
    - [5.3. Sound Design](#53-sound-design)
  - [6. Product Deployment](#6-product-deployment)
    - [6.1. Version Control](#61-version-control)
    - [6.2. Game Prototype](#62-game-prototype)
    - [6.3. Beta Version](#63-beta-version)
    - [6.4. Full Version](#64-full-version)
  - [7. Sprites Gallery](#7-sprites-gallery)
  - [8. Glossary](#8-glossary)

</details>

## Document Evolution

| Author        | Paul NOWAK (Tech Lead) |
|---------------|------------|
| Created       | 11/21/2024 |
| Last modified | 11/29/2024 |
| Document deadline | 11/29/2024 |

## Document Validation

| Role | Name | Signature | Date |
|---|---|---|---|
| Project Manager | Thomas PLANCHARD | TBD | TBD |

## 1. Overview

### 1.1. Document Purpose

The main goal of this document is to provide a detailed plan that outlines the technical requirements, objectives and constraints for our game.

Indeed, it will be based on the Functionnal Specifications document, and will introduce the software architecture of Dilemma depending on several elements, such as the current Game Engine, Godot, or the specific libraries used to code certain features.

Finally, this will ensure a proper communication between the Tech Lead and the Software Engineers, who will be guided through the future technical choices required.

### 1.2. Game Presentation

Dilemma is a point-and-click serious and strategy game where the player acts as the leader of a nation, and his goal is to balance the economy of his country and the pollution it creates.

[Insert Dilemma Picture]

Aimed to raise awareness on global warming through a dystopic environment, the player must find the best choices to either avoid bankrupcy or a cataclysmic pollution disaster. For that, he has access to an office with a giant screen showing a world map, and the gameplay will involve interactions with the different control panels.

When starting the game, the player will have the possibility to select one country which he will manage among those presented on the map. Then, he will have to manage 2 important economies: Economy and Greenhouse Gazes; he will have to balance them not only for his own country, but also for the entire world, through strategic choices.

Indeed, he will have to control the different aspects of his country, and spend wisely his money to select choices for research, laws and diplomacy with other countries.

Furthermore, the game progresses through a system of turns, representing the years, and the player receive income at each turn from taxing each sector of his country's economy. After all available choices made, the player must click the "Next Turn" button to go to the next year and see how the world is evolving. 

The final goal of the player is to improve his country's economy and collaborate with other countries to  while limiting the use of greenhouse gazes around the world.

## 2. Game Architecture

### 2.1. Target Platform

The godot editor supports many platforms like Windows, macOs or Linux, but we have decided to release our game on macOs. Indeed, our software engineers are mostly working with macBook computers and the tests will also be performed with one of them to ensure Dilemma is functional and performant.

Once we selected our target platform and that we finish the development of our game, we will need to export the project. Effectively, the developers would need to compile the proper binaries and build the package required for the macOs platform.

For that, we go to the Project menu, we select export and we will have to select an export preset related to our target OS:

<img src="./Images/export_preset.png" width="250">

We choose the macOS preset, by making sure we installed the required additional tools to be able to export. Following the preset selection, we can either click on "Export Project", as a playable build, or export the project resources as a PCK or ZIP package without a playable build nor a godot executable but with only the project data.

### 2.2. Modules and Components

Lists the frameworks, libraries, and packages utilized.

### 2.3. Other External IT Tools

<img src="./Images/Slack-Logo.png" width="250">

Slack is a management and collaborative software that allow our teammembers to communicate efficiently. Allowing us to create projects for managing tasks through different channels, it's a useful tool to share valuable information such as code blocks or technical choices.

<img src="./Images/github_logo.png" width="250">

Github is a cloud-based platform that allow its users to create coding projects through repository and work together to store and share code. Indeed, it give us the feature to track and manage our changes over time.

### 2.4. Files Organization

At first, we need to organize our files in github in a tree-like structure:

```  
origin  
│
├── documents
│    │
│    ├── Management
│    │    ├── data
│    │    ├── Weekly_reports/
│    │    └── Project_charter.md
│    │
│    ├── Functional_specifications
│    │    ├── data
│    │    └── Functional_specifications.md
│    │
│    ├── Quality_assurance
│    │    ├── data
│    │    ├── Bug_Tracker.md
│    │    └── Test_plan.md
│    │
│    ├── User_manual
│    │    └── User_manual.pdf
│    │
│    └── Technical_specifications
│         ├── data
│         └── Technical_specifications.md
│
├── Dilemma/
│    │
│    ├── game_project_root/
│         ├── core/
│         └── features/
│         └── ... (other modules) 
│
└── README.md
```

Then, here's how we plan to structure the different files of our game in the Godot Game Engine:

```  
/game_project_root
├── core/                   # Core systems and global logic
│   ├── GameManager.gd       # Main game logic singleton
│   ├── InputHandler.gd      # Centralized input handling
│   ├── DataLoader.gd        # JSON or data handling scripts
│   ├── Global.gd            # Global variables or constants
│   └── autoload/            # Singleton scenes or nodes
│       ├── GameManager.tscn 
│       └── Settings.tscn
├── features/               # Game feature implementations
│   ├── homeCountry/              # homeCountry-specific assets and logic 
│   │   ├── homeCountry.tscn
│   │   ├── homeCountry.gd
│   │   ├── installations/       # the institutes (nuclear plants, green houses, etc..) built by the player
│   │   └── ui/               # homeCountry-related UI elements
│   ├── worldMap/           # worldMap-specific assets and logic 
│   │   ├── worldMap.tscn
│   │   ├── worldMap.gd
│   │   ├── countries/       # list of other countries with their specific assets and logic 
│   ├── Management game-specific logic 
│   │   ├── systems/          # Resource, task, or economy systems
│   │   │      ├── Economy.tscn
│   │   │      ├── Pollution.tscn
│   │   ├── ui/               # UI specific to the management gameplay
│   │   └── managers/         # Task, worker, or building managers
│   │   │      ├── economiesManager.gd
│   ├── EventManager/              #Manage game events (like natural disasters, or conflicts)
│   │   ├── EventManager.gd 
│   │   ├── Events/ #List of events 
│   │   └── progression/         # Check the gameplay evolution when time flies
│   └── ui/                  # General UI for the game
│       ├── MainMenu.tscn     # Main menu
│       ├── SettingsMenu.tscn # Settings menu
│       └── WorldMapMenu.tscn    # World Map Menumenu
│       ├── RnDMenu.tscn     
│       ├── LawsMenu.tscn  
│       └── DiplomacyMenu.tscn    
├── resources/              # All reusable assets
│   ├── images/              # Textures, sprites, and icons
│   │   ├── environments/     # Backgrounds and scenery
│   │   ├── ui/               # UI elements like buttons, panels
│   │   └── installations/    # Icons of buildable installations in-game
│   ├── sounds/              # Sound effects
│   ├── music/               # Background music
│   ├── fonts/               # Game fonts for UI  
├── data/                   # External configuration and data
│   ├── config.json          # Game configuration data
│   ├── levels.json          # Level-specific configurations
│   ├── dialogues.json       # NPC dialogues and text
├── tools/                  # Plugins, shaders, and utility tools
│   ├── shaders/             # Custom shaders
│   │   ├── lighting.shader
│   │   ├── worldMap.shader 
│   │   └── ui.shader
│   ├── plugins/             # Godot editor plugins or third-party tools
│   │   ├── dialogue_system/
│   │   └── input_customizer/
│   └── testing/             # Debugging and test tools
│       ├── test_scripts.gd
│       └── mock_data/       # Mock data for test cases
└── project.godot           # Godot project configuration file
```  

## 3. Technologies Used

### 3.1. Game Engine Presentation

<img src="./Images/Godot.png" width="100">

Godot is a free and open-source game engine designed to make all sort of 2D and 3D projects, especially centred around video games that can be released on PC, mobile or even consoles. Beginner-friendly, it has been initially developed in-house by an Argentian game studios until it has been rewritten and incredibly updated since its open source release in 2014.

The app possesses a full-fledged game editor with integrated tools to control several needs, such as code, animation, tilemap or shader, while offering a consistent user experience with a rich user interface. 

Its 2 main programming languages are GDScript, a Godot-specific and tightly integrated language with a lightweight syntax, or C#, which is very common in the video game industry. Indeed, the game engine relies on the object-oriented programming paradigm, introducing concepts such as classes and objects to help you run the code properly.

In fact, Godot is well-known for its efficient rendering pipeline and flexible optimization options, allowing the user to tweak the required performance for the game.

### 3.2. Data Management

Due to the importance of the system of nodes involving Money and Pollution, we need a proper strategy to save and load game data efficiently.

<img src="./Images/json-logo.png" width="100">

Subsequently, we have decided to use JSON, a text format whose conventions are familiar to the C-family of programming languages, like C# which is the programming language for our Godot Project. Indeed, JSON is simple to understand and allow to create objects written as Key/Value pairs.

For example, we create a JSON format for storing the Money and Pollution value of each node from our home country:

```json
  {
  "Energy": {"Money": 3000000, "Pollution": 0.4},
  "Transport": {"Money": 2000000, "Pollution": 1.2},
  "Education": {"Money": 3000000, "Pollution": 0.3},
  "Consumer Good": {"Money": 2000000, "Pollution": 1.3},
  "Raw Resources": {"Money": 3000000, "Pollution": 1.5},
  "Fuel": {"Money": 2000000, "Pollution": 2.0}
  }

```

With each country treated as single entity, which makes the data consistent and allow to simplify operations when updating the values at each turn.

The data is handled within the script DataLoader.gd, a child node of the Core Parent Node, and which controls the most of the storage of the game elements' variables.

In fact, Godot uses a dictionnary to serialize with JSON thanks to its inbuilt tools, and use the System.IO library that allow to create a static path of your .json file no matter where the game is saved.

[Insert picture of JSON Dictionnary code]

In theory, a .json file from a game object is generated when we start playing, and when we go to the next turn, the game retrieve from the .json file the data required to change, update them, and update the .json file with the modified values.

### 3.3. Programming Language

First of all, we have decided to use C# as the main programming language of our game. Using the ### version, we chose this high-level programming language over the built-in language GDScript because it allow a faster runtime of our scripts, and most of our teammembers are familiar with it.

In addition, some game elements like countries or game state would require interfaces, abstract classes and properties, and C# would provide a more structured code for this complex project.

Furthermore, Dilemma would require a lot of optimization due to the load of multiple assets on screen, the data management with JSON files, and the progress of our games through different events and scenarios. SC# would provide the right amount of optimization required for the development of a serious game.

### 3.4. Non-Functional Requirements

Here are the different criterias for the non-functional requirements:

#### Performance

We want to maintain a smooth gameplay at 60 fps, to load pop-up menus under 3 seconds and limit memory usage below 2GB during peak loads.

For that, we will use Godot's built-in monitor to check FPS, memory usage, and GPU/CPU load during gameplay. To optimize the different scenes, we can preload certain objects and assets to reduce loading time, and use compressed pictures for large pictures and images.

#### Responsiveness

#### Usability  

#### Reliability   

#### Maintainability   


### 3.5. Risks & Assumptions

| Risks | Assumptions | 
| ------| ----------- | 
| Having several countries in active evolution can increase loading time and be problematic for such an important feature. Indeed, each transition to the next turn could trigger lags as it involve the calculations of several data from each country.| We should pre-program the evolution of such countries with algorithms that could allow them to evolve differently per game.  |
| It could take a while to load dynamic data, such as a country's income, and display it on screen. | To use less space, we could decide to display the data only when the player select a certain country to retrieve information. Then we will have to click it again to stop displaying it.  |
| Implementing music and sound effects can trigger lag during gameplay. | A single and simple background music, accompanied with a limited use of sounds, would be wiser.  |
| Because of many mechanics (home country, other countries, Laws, Research, and diplomacy) being connected to a system of nodes (Economy and Greenhouse Gazes), an bug from one of the scripts could lead to many errors in the other connected scripts.| We have to build the global system management script piece by piece, testing it each time we connect it to a new script, and make sure it only call a certain script only if needed. Furthemore, we can implement a database to allow a better storage of certaine pieces of data. |
| We could encounter issues while trying to export our game, and the chosen export templates might not be compatible with our game. | We have to study further which export template is necessary for Dilemma, and test the export as we are progressively creating the game.  |
| When we go to another menue (Research, Laws, Diplomacy...) and we need to go back to the main scene, we should expect a long loading time to display all the assets of the world map.  | The other menus could be either pop-ups, or we should pre-program the reapparition of the world map assets.  |
| The game could encounter retrocompatibility issues when the two Software Engineers are working with MacBook computers.| We should focus on the development phase with MacBook computers, and do the testing with the same operating system.|


## 4. Mechanics and Systems Details

### 4.1. Setting up Game Manager

Explains the setup of the central game manager system.

As we create new nodes and scripts, the game grows more in complexity, and we need a more robust solution to handle properly Dilemma's main mechanics and systems.

For that, we create a node named "Core" to handle the core elements, such as the data loading or the declaration of global variables. Here, we will create a GameManager.gd script to handles the main logic of our game.

[Insert GameManager.gd picture]

To start with, we need to instantiate the most important scenes of our game:
- gameManager.tscn: contains the core systems and logic of our games, including the gameManager.gd script itself.
- homeCountry.tscn: contains the scripts and logic of the country selected by the player. It allows to set up a country to manage and follow its evolution when the game is progressing. It will become mostly active once the game enters in Play state. 
- worldMap.tscn: contains the scripts and assets required for the entire world map. Setting it up will handle the gameplay by interacting with the interface, and also to set the the other countries of the world.

Other scenes will also be instantiated, but they will be more focused on the different menus and the other countries which will complete the game depending on how far the player goes.

In fact, the game is attribuated of several states:
 - Start state: the game has just been launched, showing the main Menu which incite the player to select "New game" to play. By default, the game manager has this state when it's launched through the _Ready() function.
 - Intro state: after selecting "New Game", the game plays an initial cutscene showcasing the story and allowing the player to understand the plot. 
 - Select state: once the first cutscene finished playing, the player will be introduced to the world map. Then, he will have to decide which home country he has to choose and confirm before starting to play the actual game.
 - Play state: the main state of our game manager where most of the scripts are connected with. 
 The player finds himself in his control room, obtain his initial amount of income, and has access the world map and the other menus allowing him to manage the Economy and the Pollution. 
 He can decide to go to the next turn once he finished his limited actions, and the game progresses trough the different events and player's choices, but the game manager is still in "Player state" until the game reaches the 50th turn.
 - Ending state: When the turn 50 is over, the game makes an analysis of the player's entire progress and calculate how well he managed to balance the Economy and Pollution's economies. Depending on the results, the game manager will either trigger a good or bad ending cutscene.

 The reason to use states is to have a better control flow of our code. Indeed, certain functions like _Process() will behave differently depending on the game state. Each time it is called, this function will check the actual state of the game manager depdning on the conditions stated above before handling the other main functions.

 Furthermore, the play state will have to check several features each time the _Process() function is called:
 - the inputHandler.gd script, where the game manager will monitor the use of the player's interface and its point-and-click controls, a vital part of the gameplay.
 - the dataLoader.gd script, necessary each time the game update to the next turn to change the .json scripts values and the game economies.
 - 

### 4.2. Managing Game Economies

Managing the 2 main Game Economies, Economy and Pollution, is one of the most important points of the code. Indeed, it require a lot of calculations depending on the various aspects of the economy and the player's actions.

The script economiesManager.md takes its importance here, as it perform the various calculations required depending on the value retrieved from the stored .json files and update them.

#### Total Tax Income Calculation:
Let:
- \( N \): the number of nodes.
- \( V_i \): the value in the \( i \)-th node.
- \( T_i \): the tax multiplier for the \( i \)-th node.
- \( T_{income} \): the total tax income.

The total tax income received by the player is given by:
$$
T_{income} = \sum_{i=1}^N \left( V_i \cdot T_i \right)
$$

#### Aid Income Calculation:

When your country receive money from allied nations, it is split into three parts: one to develop a specific node chosen by the donator, one to your Income and the rest is lost to simulate administrative inefficiency.

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

#### Supply and demand

When a sector grow or shrink, so does it's need.

As a remind [spreadSheet](https://docs.google.com/spreadsheets/d/1nBxIMelLl4439p4A0lBnOFLjVdy7G12d8wt_ZIThWdA/edit?usp=sharing) details the interaction between the different nodes.

We have an equation to show how long it take supply to catch up to demand.

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

#### Effect of Taxes

The rate of growth \( r_{\text{final}} \) after applying the tax reduction can be expressed as:

\[
r_{\text{final}} = r \times \left( 1 - 2 \times \frac{t}{100} \right)
\]

Where:
- \( r \) is the original rate of growth (in percentage),
- \( t \) is the tax rate (in percentage).

Anyway, this money system diagram shows how the economy circulates through the different nodes:

<img src="./Images/economy_diagram.png" width="500">

### 4.3. Game Progression

Features state diagrams to show progression through the game.

### 4.4. Event Management

Describes handling in-game events and triggers.

## 5. Gameplay

### 5.1. Controls Handling

Details point-and-click gameplay mechanics.

Signals

### 5.2. Graphics and Visuals

Discusses visual elements, including graphics style and resolution.

### 5.3. Sound Design

Covers the game's auditory experience, including music and effects.

Signals

## 6. Product Deployment

### 6.1. Version Control

To faciciliate the organization of the team while using Github, several rules were decided:

- No work on the main branches must be applied by other team members other than the Project Manager. In fact, other branches containing a finished work (like a finalized document or a finished code) can be merged into the main with the Project Manager's authorization.

- Before merging a branch into the main one, the user must create a Pull Request and collaborate with the other team members before validating the merge. 

- "Dev" is main code branch where the code is being built by the senior SE, and any important feature will require another branch which the junior SE will work on. 

- The Software Engineers and the Tech Lead will have to agree to merge the target feature branch to the dev branch once it's finished, and any merge with the dev branch will be considered as an updated version of the game. The Q.A. must perform his tests at each version of the game. 

- When reviewing an important document, the reviewer must create GitHub issues to detail the errors in order to assist the writer. 

- A branch name must start with a capital letter, and written this way "Branch_Name".

### 6.2. Game Prototype

On the date of ####, we managed to build a prototype for our game to showcase its main features.

Here's the link to open the .zip file and test the prototype:

[Insert ZIP FILE]// Need zip file

After we let people testing it, certain technical issues were noticed:
-

### 6.3. Beta Version

A Beta Version of our game has been created on ####: it added important features such as ### and ###.

[Insert ZIP FILE]// Need zip file.

We corrected some of the bugs from the prototype, and we had to make key changes compared to the prototype:
-
-

### 6.4. Full Version

The finalized version of our game, which has been completed on ###.

Test the game with this .zip file:

[Insert ZIP FILE] // Need zip file

## 7. Sprites Gallery

Displays and categorizes visual assets used in the game.

## 8. Glossary

| Terms | Definitions |
| ----- | ----------- |
| <span id=".gd">.gd</span> | Def     |
| <span id=".tscn">.tscn</span> | Def     |
| <span id="Asset">Asset</span> | Def     |
| <span id="C#">C#</span> | Def     |
| <span id="Climate Change">Climate Change</span> | Def     |
| <span id="Controls">Controls</span> | Def     |
| <span id="Event">Event</span> | Def     |
| <span id="Game Economy">Game Economy</span> | Def     |
| <span id="Game Engine">Game Engine</span> | Def     |
| <span id="Game Manager">Game Manager</span> | Global script of the game that handle the game objects' behaviors, the game logic and the state management.      |
| <span id="GdScript">GdScript</span> | Def    |
| <span id="Github">Github</span> | Def     |
| <span id="Godot">Godot</span> | Def     |
| <span id="Graphics">Graphics</span> | Def     |
| <span id="JSON">JSON</span> | Def     |
| <span id="Mechanics">Mechanics</span> | Def     |
| <span id="Node">Node</span> | Def     |
| <span id="Open Source">Open Source</span> | Def     |
| <span id="Platform">Platform</span> | Def     |
| <span id="point-and-click">point-and-click</span> | Def     |
| <span id="Prototype">Prototype</span> | Def     |
| <span id="RnD">R.n.D.</span> | Def     |
| <span id="Scene">Scene</span> | Def     |
| <span id="Script">Script</span> | Def     |
| <span id="Sound Design">Sound Design</span> | Def     |
| <span id="Systems">Systems</span> | Def     |

