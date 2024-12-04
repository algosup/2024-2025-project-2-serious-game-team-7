<hr>

**<p align="center" style="font-size: 21px">Dilemma</p>**
**<p align="center" style="font-size: 18px">Test Plan</p>**
<p align="center">Laurent BOUQUIN</p>

<br>

**<p align="center">Team:</p>**
<p align="center">Thomas PLANCHARD, Max BERNARD, Quentin CLÉMENT, Clémentine CUREL, Paul NOWAK, David CUAHONTE</p>

<br>

<p align="center"> ALGOSUP, Group 7. All Rights Reserved. </p>

<hr>

<details>

<summary>Table of content</summary>

- [1. Introduction](#1-introduction)
- [2. Test strategy and criteria](#2-test-strategy-and-criteria)
	- [2.1. Testing scope and method](#21-testing-scope-and-method)
	- [2.2. Tools](#22-tools)
	- [2.3. Test criteria](#23-test-criteria)
- [3. Test plan environment](#3-test-plan-environment)
- [4. Schedule estimation](#4-schedule-estimation)
- [5. Deliverables](#5-deliverables)
- [**Glossary**](#glossary)
- [Footnotes](#footnotes)


</details>

<hr>


## 1. Introduction

The goal of the project is to create a serious game that will raise awareness about climate change. The game will be a simulation of a country that needs to change the way ecology is handled in order to change the tragic future of the planet. 


## 2. Test strategy and criteria


### 2.1. Testing scope and method

The testing team will verify the quality of the program, as well as every documents.

For the documents, the testing team will verify the content, as well as the syntax and the grammar, to be sure that no misunderstanding is left over, and thus having clear and readable documents for the client, and also for the team. In case of a problem in the content, the subject will be discussed with the team to find a solution that corresponds to the problem. If there is a problem with the syntax or the grammar, the QA[^qa] of our group will check the mistake then verify it using external tools and if the mistake is proven, an issue will be created on Github[^6] using the template for `Document Error Report` syntax errors. Once the issue is created, the person responsible for the document will be in charge of modifying the document and closing the issue.

For the program, the testing team will verify the quality of the code, as well as the quality of the program itself. Using the `Test_Cases.md` file, the testing team will be able to test the program and verify if the program is working properly. If the program is not working properly, the testing team will create an issue on Github[^gh] using the template for `Bug Report` to report the problem. The issue will be created with the maximum of details possible to help the developers to understand the problem and to fix it.


We have decided to give to each issue that we find a different level of importance. Those level of importance will help us to tell if it is relevant or not to fix it directly or if it can wait, and thus helping us having a better organization. The different level of importance are :
- ${\color{green}Optional \space (P4)}$ (Task not important but can be done if there is time left)
- ${\color{orange}Can \space wait \space (P3)}$ (Task not important but should be done sometimes soon)
- ${\color{purple}Should \space be \space done \space quickly \space (P2)}$ (Task that alter the quality of the project)
- ${\color{red}Urgent \space (P1)}$ (Task that alter the quality of the project and can't wait)

Their name are explicit to help us understand much quicker the importance of the issue.


### 2.2. Tools

To report issues, we will use a functionality of Github[^gh], called Github Issue[^ghi]. It helps us to do reports faster, and to have reports easier to read. We have decided to make two types templates for the reports, one for the documents and one for the program.

The report template for the typographical errors tells which document is concerned, what are the errors and what is its priority. 
![Document Error report template](data/Doc_Report.png)

The report template for the bugs tells what happened during the testing, which operating system was used, and a way to tell which operating system was used if it was not in the selection box, the log outputs for more precise information and its priority.
![Bug report template](data/Bug_Report.png)


### 2.3. Test criteria

We will judge if the program is working properly by testing each function of the program that can be tested. 
We will be able to determine if the code is working properly by comparing the output of the program with the expected output using the units tests we have created. 
If the output is the same, the function is working properly, if not, the function is not working properly and will output an error message with as much details as possible.




## 3. Test plan environment

Our team members have different computer OS, which are Windows and MacOs, that gives us the opportunity of testing that the program is working properly on the different OS. But also the environment is different and so the steps to be capable to test are different.


The tests will be run on the following environments:

| Specifications   	| Lenovo ThinkBook 14  | Apple MacBook Air M1 2020 |
| ---------------- 	| :------------------: | :-----------------------: |
| Processor        	| Intel Core i7-1165G7 | Apple Silicon M1          |
| RAM         		| 16 GB                | 8 GB                      |
| Operating System 	| Windows 11 Pro       | macOS Ventura             |



## 4. Schedule estimation

It is necessary to correctly spread out our time between each task, so we can be more efficient on the tests we have to do. Our total number of hours we have is 104 hours.

| Task | Subtask | Time estimation |
| --- | --- | --- |
| Analyze requirement specification | - Review functional specifications <br> - Review technical specification| - 6 hours <br> - 6 hours |
| Create the test specifications |  - Create the test plan <br> - Create test cases <br> - Review the test cases|- 20 hours <br> - 12 hours <br> - 4 hours |
| Execute the test cases | - Build up the test environment <br> - Execute the test cases <br> - Update test cases status|- 10 hours <br> - 14 hours <br> - 6 hours |
| Report the bug | - Create bug reports <br> - Create bug data report | - 6 hours <br> - 6 hours |

If this estimation is correct, we will have spent 90 hours for the quality assurance of the project, as our number of working time we have available.



## 5. Deliverables

The testing deliverables for this project are :
- From the client:
	- The Test Plan ( 12/06/2024 at 5:00pm )
	- The Test Cases ( 12/06/2024 at 5:00pm )
- From the team :
	- The Bugs Report ( 12/13/2024 at 5:00pm )




## **Glossary**


| Term | Definition | additional content |
| :---: | :---: | :---: |
| QA[^qa] | Quality Assurance is the term used in both manufacturing and service industries to describe the systematic efforts taken to assure that the product(s) delivered to customer(s) meet with the contractual.  | [Wikipedia](https://en.wikipedia.org/wiki/Quality_assurance) |
| Github[^gh] | GitHub, Inc. is a provider of Internet hosting for software development and version control using Git. | [Wikipedia](https://en.wikipedia.org/wiki/GitHub) |
| Github Issue[^ghi] | Issues are a great way to keep track of tasks, enhancements, and bugs for your projects. They’re kind of like email—except they can be shared and discussed with the rest of your team. | [Github](https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue) | 




## Footnotes


[^qa]: [Wikipedia - Quality Assurance](https://en.wikipedia.org/wiki/Quality_assurance)
[^gh]: [Wikipedia - Github](https://en.wikipedia.org/wiki/GitHub)
[^ghi]: [Github - Github Issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue) 