# 2024 - 2025 Serious Game Team-7 - Management Artifacts

This document aims to centralize all the management artifact links and resources listed below:

- [2024 - 2025 Serious Game Team-7 - Management Artifacts](#2024---2025-serious-game-team-7---management-artifacts)
  - [Tasks \& schedule](#tasks--schedule)
  - [RACI Matrix](#raci-matrix)
  - [Risks \& Assumptions](#risks--assumptions)
  - [Key Performance Indicators](#key-performance-indicators)
    - [Definition of our KPIs](#definition-of-our-kpis)
      - [Documents](#documents)
      - [Development](#development)
      - [Mood](#mood)
    - [Link to the project's KPIs](#link-to-the-projects-kpis)
  - [Weekly reports](#weekly-reports)
  - [Post Mortem Analysis](#post-mortem-analysis)
  - [Addendum](#addendum)
    - [Differences Between Gantt Chart and Actual Schedule](#differences-between-gantt-chart-and-actual-schedule)

## Tasks & schedule

You can view the breakdown of all the tasks we've identified for the duration of the project following [this link](https://docs.google.com/spreadsheets/d/14Witaidw-HDPKDrYYlEDmQa0fDt4obBBx-ouE_JA0NU/edit?usp=sharing).



## RACI Matrix

The RACI matrix of this project is as follows considering the [Project Charter](./project_charter.md):

| Name                     | Project Manager | Program Manager | Technical Leader | Software engineer | Quality assurance | Technical Writer | 
| ------------------------ | --------------- | --------------- | ---------------- | ----------------- | ----------------- | ---------------- | 
| Project kick-off         | I               | I               | I                | I                 | I                 | I                | 
| Project charter          | R               | A               | C                | C                 | C                 | C                | 
| Schedule creation        | R               | C               | C                | C                 | C                 | C                | 
| Functional specification | A               | R               | C                |                   | C                 | /                | 
| Technical specification  | A               | C               | R/A              | I                 | C                 | /                | 
| Coding process           | A               | I               | R                | R/A               | C                 | /                | 
| Testing planification    | A               | /               | C                | C                 | R/A               | I                | 
| Usage instructions       | A               | C               | C                | C                 | I                 | R/A              | 

Legend:

| Letter | Full name   | Description                                     |
| ------ | ----------- | ----------------------------------------------- |
| R      | Responsible | Executes the task or activity                   |
| A      | Accountant  | Ultimately answerable for the task's completion |
| C      | Consulted   | Provides input and/or advice on the task        |
| I      | Informed    | Kept updated on progress and decisions          |
| /      | /           | No interaction with this role for this task     |

## Risks & Assumptions

| ID  | Description                                                                   | Consequence                                                       | Impact   | Likelihood | Mitigation/Avoidance                                                                |
| --- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------- | -------- | ---------- | ----------------------------------------------------------------------------------- |
| 1   | Godot is a game engine to which we are not yet used.                           | Development pace might be hindered                                | High     | Medium     | Ask for help to the other team members                                              |
| 2   | Misinterpretation of the project                                              | Incorrect implementation of the game                          | Critical | Medium     | Regular communication with the client to understand their needs, and stick to them. |
| 3   | Team member leaving                                                           | Tasks left to the remaining members without any assignee          | High     | Unlikely   | Sharing the tasks among the remaining team members.                                 |

## Key Performance Indicators

### Definition of our KPIs

To enable the client to track our project's milestones, we have defined several quantitatively measurable KPIs. Below is a list of these KPIs along with their respective calculations.

#### Documents

The following KPIs are included in this section:

- **Functional specifications**
- **Technical specifications**
- **Test Plan**
- **User Manual**

The progress of these documents is measured using the following formula:

$$\text{percentage} = (\frac{\text{current number of sections}} {\text{total number of sections}})\times{100}$$

Where:

- **current_number_of_sections**: The number of sections that are completely done.
- **total_number_of_sections**: The number of predefined sections in the document's outline, which may evolve.

#### Development

This section tracks the following KPIs:

- **Interface**
- **Game state**
- **Core mechanics**

Given the complexity and time required for development, we include progress on partially completed pages. The progress is calculated using:

$$\text{percentage} = (\frac{({\text{Interface progress + Game State progress + Core Mechanics}})} {\text{3}})\times{100}$$

Where:

- **Interface Progress:** The cumulative progress for all interface-related tasks and features, expressed as a percentage (0-100%).
- **Game State Progress:** The progress in implementing and refining game state management, expressed as a percentage (0-100%).
- **Core Mechanics Progress:** The progress in developing and optimizing the core game mechanics, expressed as a percentage (0-100%).





#### Mood

The Mood Percentage is determined by averaging the weekly ratings (out of 10) provided by each team member. These ratings reflect their overall motivation and well-being, considering both personal perspectives and the project’s milestones and challenges.

By applying these formulas, we maintain clear and consistent progress tracking, offering a realistic and transparent view of the project’s status to the client. For better readability and understanding, all KPI values are rounded to the nearest 5%.

### Link to the project's KPIs

You can see our project's KPIs which were explained above following [this link](https://docs.google.com/spreadsheets/d/19etNyONX9NKorSdyU1BlVJ-LnPSkSyMkQAEeaoKKj7E/edit?usp=sharing).

## Weekly reports

The weekly reports folder can be found following [this link](/documents/management/weekly_reports/).

You can directly access the reports individually following the below bullet points:

- [Access Report for Week 1](/documents/management/weekly_reports/week1.md)
- [Access Report for Week 2](/documents/management/weekly_reports/week2.md)
- [Access Report for Week 3](/documents/management/weekly_reports/week3.md)
- [Access Report for Week 4](/documents/management/weekly_reports/week4.md)
- [Access Report for Week 5](/documents/management/weekly_reports/week5.md)
- [Access Report for Week 6](/documents/management/weekly_reports/week6.md)
- [Access Report for Week 7](/documents/management/weekly_reports/week6.md)

For a centralized collection of copies of all the reports in a single document, please refer to the Cumulative File for Weekly Reports:

- [Access Cumulative file for all 7 weeks](/documents/management/weekly_reports/cumulative.md)

## Post Mortem Analysis

You can refer to our Post Mortem Analysis to have a retrospective of our project following [this link](./post_mortem.md)

## Addendum

### Differences Between Gantt Chart and Actual Schedule

The project schedule deviated significantly from the initial Gantt Chart, reflecting substantial differences in both the timeline and the expected prototype of "Dilemma." This section aims to explain the discrepancies between the planned and actual schedules.

Learning Godot took longer than anticipated, delaying the development phase from the start. As mentioned in the [Post Mortem Analysis](./post_mortem.md), we should have spent more time mastering the engine before diving into the project. This would have prevented many of the issues.

As the project manager, I underestimated the time required to develop each features. This miscalculation could not be mitigated by overtime if our software engineer worked alone. Consequently, to ensure a functional prototype, we had to reorganize our efforts. Our QA and Technical Writer continued with their tasks, only seeking assistance when necessary. We also solely focused on the core features and redifined the scope of the project.

Overall, although our progress was not as far along as planned, future projects should account more accurately for the software engineer's learning curve and the actual effort needed to create each page.
