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
    - [1.3. System Overview](#13-system-overview)
  - [2. Game Architecture](#2-game-architecture)
    - [2.1. Target Platform](#21-target-platform)
    - [2.2. Modules and Components](#22-modules-and-components)
    - [2.3. Other External IT Tools](#23-other-external-it-tools)
    - [2.4. Files Organization](#24-files-organization)
  - [3. Technologies Used](#3-technologies-used)
    - [3.1. Game Engine Presentation](#31-game-engine-presentation)
    - [3.2. Data Management](#32-data-management)
    - [3.3. Technical Choices](#33-technical-choices)
    - [3.4. Non-Functional Requirements](#34-non-functional-requirements)
    - [3.5. Risks & Assumptions](#35-risks--assumptions)
    - [3.6. Optimization Solutions](#36-optimization-solutions)
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
    - [6.1. Deployment Environment](#61-deployment-environment)
    - [6.2. Release Schedule](#62-release-schedule)
    - [6.3. Game Prototype](#63-game-prototype)
    - [6.4. Beta Version](#64-beta-version)
    - [6.5. Full Version](#65-full-version)
  - [7. Sprites Gallery](#7-sprites-gallery)
  - [8. Glossary](#8-glossary)

</details>

## Document Evolution

| Author        | Paul NOWAK (Tech Lead) |
|---------------|------------|
| Created       | 11/21/2024 |
| Last modified | 11/22/2024 |
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

Details the game type, core rules, and key mechanics and systems.

### 1.3. System Overview

Provides a system structure diagram for an at-a-glance understanding.

## 2. Game Architecture

### 2.1. Target Platform

Identifies the platforms on which the game will run.

### 2.2. Modules and Components

Lists the frameworks, libraries, and packages utilized.

### 2.3. Other External IT Tools

Specifies external tools required for development and deployment.

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
│   │   ├── ui/               # UI specific to the management gameplay
│   │   └── managers/         # Task, worker, or building managers
│   ├── EventManager/              #Manage game events (like natural disasters, or conflicts)
│   │   ├── EventManager.gd 
│   │   ├── Events/ #List of events 
│   │   └── progression/         # Check the gameplay evolution when time flies
│   └── ui/                  # General UI for the game
│       ├── MainMenu.tscn     # Main menu
│       ├── SettingsMenu.tscn # Settings menu
│       └── WorldMapMenu.tscn    # World Map Menumenu
│       ├── RNDMenu.tscn     
│       ├── LawsMenu.tscn  
│       └── DiplomacyMenu.tscn    
├── resources/              # All reusable assets
│   ├── images/              # Textures, sprites, and icons
│   │   ├── environments/     # Backgrounds and scenery
│   │   ├── ui/               # UI elements like buttons, panels
│   │   └── installations/            # Icons of buildable installations in-game
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

Highlights the Godot engine and its capabilities.

### 3.2. Data Management

Details data storage and retrieval strategies.

### 3.3. Technical Choices

Discusses programming languages used, such as GDScript or C#.

### 3.4. Non-Functional Requirements

Defines performance, scalability, and maintainability criteria.

### 3.5. Risks & Assumptions

| Risks | Assumptions | 
| ------| ----------- | 
| TBD | TBD  |
| TBD | TBD  |
| TBD | TBD  |
| TBD | TBD  |
| TBD | TBD  |
| TBD | TBD  |

### 3.6. Optimization Solutions

Proposes solutions for performance and resource optimization.

## 4. Mechanics and Systems Details

### 4.1. Setting up Game Manager

Explains the setup of the central game manager system.

### 4.2. Managing Game Economies

Includes class diagrams illustrating the economy mechanics.

### 4.3. Game Progression

Features state diagrams to show progression through the game.

### 4.4. Event Management

Describes handling in-game events and triggers.

## 5. Gameplay

### 5.1. Controls Handling

Details point-and-click gameplay mechanics.

### 5.2. Graphics and Visuals

Discusses visual elements, including graphics style and resolution.

### 5.3. Sound Design

Covers the game's auditory experience, including music and effects.

## 6. Product Deployment

### 6.1. Deployment Environment

Outlines server specifications and requirements.

### 6.2. Release Schedule

Describes version control practices and collaboration rules (e.g., GitHub).


To faciciliate the organization of the team while using Github, several rules were decided:

- No work on the main branches must be applied by other team members other than the Project Manager. In fact, other branches containing a finished work (like a finalized document or a finished code) can be merged into the main with the Project Manager's authorization.

- Before merging a branch into the main one, the user must create a Pull Request and collaborate with the other team members before validating the merge. 

- "Dev" is main code branch where the code is being built by the senior SE, and any important feature will require another branch which the junior SE will work on. 

- The Software Engineers and the Tech Lead will have to agree to merge the target feature branch to the dev branch once it's finished, and any merge with the dev branch will be considered as an updated version of the game. The Q.A. must perform his tests at each version of the game. 

- When reviewing an important document, the reviewer must create GitHub issues to detail the errors in order to assist the writer. 

- A branch name must start with a capital letter, and written this way "Branch_Name".

### 6.3. Game Prototype

On the date of ####, we managed to build a prototype for our game to showcase its main features.

Here's the link to open the .zip file and test the prototype:

[Insert ZIP FILE]// Need zip file

After we let people testing it, certain technical issues were noticed:
-

### 6.4. Beta Version

A Beta Version of our game has been created on ####: it added important features such as ### and ###.

[Insert ZIP FILE]// Need zip file.

We corrected some of the bugs from the prototype, and we had to make key changes compared to the prototype:
-
-

### 6.5. Full Version

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
| <span id="Game Economy">Game Economy</span> | Def     |
| <span id="Game Engine">Game Engine</span> | Def     |
| <span id="Game Manager">Game Manager</span> | Def     |
| <span id="GdScript">GdScript</span> | Def    |
| <span id="Github">Github</span> | Def     |
| <span id="Godot">Godot</span> | Def     |
| <span id="Graphics">Graphics</span> | Def     |
| <span id="Mechanics">Mechanics</span> | Def     |
| <span id="Node">Node</span> | Def     |
| <span id="Platform">Platform</span> | Def     |
| <span id="Point & Click">Point & Click</span> | Def     |
| <span id="Prototype">Prototype</span> | Def     |
| <span id="RnD">R.n.D.</span> | Def     |
| <span id="Scene">Scene</span> | Def     |
| <span id="Script">Script</span> | Def     |
| <span id="Sound Design">Sound Design</span> | Def     |
| <span id="Systems">Systems</span> | Def     |

