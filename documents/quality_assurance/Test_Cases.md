<hr>

**<p align="center" style="font-size: 21px">Dilemma</p>**
**<p align="center" style="font-size: 18px">Test Cases</p>**
<p align="center">Laurent BOUQUIN</p>

<br>

**<p align="center">Team:</p>**
<p align="center">Thomas PLANCHARD, Max BERNARD, Quentin CLÉMENT, Clémentine CUREL, Paul NOWAK, David CUAHONTE</p>

<br>

<p align="center"> ALGOSUP, Group 7. All Rights Reserved. </p>

<hr>

<details>


- [Introduction](#introduction)
- [Functional tests](#functional-tests)
- [User interface tests](#user-interface-tests)
- [Compatibility tests](#compatibility-tests)
- [Accessibility tests](#accessibility-tests)
- [Usability tests](#usability-tests)
- [Regression tests](#regression-tests)



</details>


# Introduction

This document is a test plan for the Dilemma project. It contains the test cases for the different features of the application. The test cases are divided into different categories:


| Category ID |    Category Name     |                                        Description                                         |
|:-----------:|:--------------------:|:------------------------------------------------------------------------------------------:|
|      1      |   Functional tests   |                These tests verify that the application behaves as expected.                |
|      2      | User interface tests |        These tests verify that the user interface is user-friendly and easy to use.        |
|      3      | Compatibility tests  | These tests verify that the application works correctly on different devices and browsers. |
|      4      | Accessibility tests  |     These tests verify that the application is accessible to users with disabilities.      |
|      5      |   Usability tests    |           These tests verify that the application is easy to use and understand.           |
|      6      |   Regression tests   |          These tests verify that new changes do not break existing functionality.          |

The test cases are written in a tabular format and are meant to keep track of the testing process and find any issues that may arise during the testing phase. Each test case has a unique ID, a name, a description, test data, expected result, actual result, and a checkbox to indicate whether the test has been executed or not.

The test ID is composed of two parts: the category ID and a number. For example, the first functional test case will have the ID `1.1`. These IDs are used to identify the test in the bug report and GitHub Issues.

If something has not been tested yet, the checkbox will be empty and the actual result will be `--`. Once the test has been executed, the checkbox will be checked, and the actual result will be filled in.

In the case where no test data is required, the test data field will contain `--`. If the test data is required, it will be provided in the test data field.

 <!-- Unchecked checkbox: &#x2610;
 Checked checkbox: &#x2611; -->

# Functional tests

The following table contains the functional test cases for the Dilemma project. As the category ID is `1`, the test cases will start with `1.x`.




| Test Case ID |      Test Case Name       |                              Test Case Description                               | Test Data |                        Expected Result                         | Actual Result |  Tested  |
|:------------:|:-------------------------:|:--------------------------------------------------------------------------------:|:---------:|:--------------------------------------------------------------:|:-------------:|:--------:|
|     1.1      |       Open The Game       |                    The user click on the game icon to open it                    |    --     |            The user is redirected to the main page             |      --       | &#x2610; |
|     1.2      |        Play a Game        |              The user clicks on the play button to launch the game               |    --     |            The user is redirected to the game page             |      --       | &#x2610; |
|     1.3      |    Click on RnD Button    |    The user clicks on the RnD button to see the research and development page    |    --     |                     The RnD page shows up                      |      --       | &#x2610; |
|     1.4      |    Click on Law Button    |              The user clicks on the Law button to see the Law page               |    --     |                     The Law page shows up                      |      --       | &#x2610; |
|     1.5      | Click on Diplomacy Button |        The user clicks on the Diplomacy button to see the Diplomacy page         |    --     |                  The Diplomacy page shows up                   |      --       | &#x2610; |
|     1.6      |    Click on Next Turn     | The user clicks on the Next Turn button to advance to the next turn in the game  |    --     |               The game advances to the next turn               |      --       | &#x2610; |
|     1.7      |       Save the Game       |  The user clicks on the Save button to save the game and come back to it later   |    --     |           The game is saved and can be loaded later            |      --       | &#x2610; |
|     1.8      |       Load the Game       |   The user clicks on the Load button to load a saved game and continue playing   |    --     |           The saved game is loaded and can be played           |      --       | &#x2610; |
|     1.9      |   Click on Quit Button    | The user clicks on the Quit button to quit the game and go back to the main page |    --     | The game is closed and the user is redirected to the main page |      --       | &#x2610; |








# User interface tests

The following
 table contains the user interface test cases for the Dilemma project. As the category ID is `2`, the test cases will start with `2.x`.


| Test Case ID |   Test Case Name    |               Test Case Description                | Test Data |                        Expected Result                        | Actual Result |  Tested  |
|:------------:|:-------------------:|:--------------------------------------------------:|:---------:|:-------------------------------------------------------------:|:-------------:|:--------:|
|     2.1      |  Clickable Buttons  |  The user can see that the buttons are clickable   |    --     | The buttons have a blinking filter when you can click on them |      --       | &#x2610; |
|     2.2      |   Game Interface    |   The user can see the game interface correctly    |    --     |           The game interface is displayed correctly           |      --       | &#x2610; |
|     2.3      |    RnD Interface    |    The user can see the RnD interface correctly    |    --     |           The RnD interface is displayed correctly            |      --       | &#x2610; |
|     2.4      |    Law Interface    |    The user can see the Law interface correctly    |    --     |           The Law interface is displayed correctly            |      --       | &#x2610; |
|     2.5      | Diplomacy Interface | The user can see the Diplomacy interface correctly |    --     |        The Diplomacy interface is displayed correctly         |      --       | &#x2610; |
|     2.6      |  Next Turn Button   |  The user can see the Next Turn button correctly   |    --     |          The Next Turn button is displayed correctly          |      --       | &#x2610; |
|     2.9      |  Save Game Button   |  The user can see the Save Game button correctly   |    --     |          The Save Game button is displayed correctly          |      --       | &#x2610; |
|     2.10     |  Load Game Button   |  The user can see the Load Game button correctly   |    --     |          The Load Game button is displayed correctly          |      --       | &#x2610; |
|     2.11     |  Quit Game Button   |  The user can see the Quit Game button correctly   |    --     |          The Quit Game button is displayed correctly          |      --       | &#x2610; |
|     2.12     |  Game Over Screen   |  The user can see the Game Over screen correctly   |    --     |          The Game Over screen is displayed correctly          |      --       | &#x2610; |
|     2.13     |   Game Won Screen   |   The user can see the Game Won screen correctly   |    --     |          The Game Won screen is displayed correctly           |      --       | &#x2610; |










# Compatibility tests

The following table contains the compatibility test cases for the Dilemma project. As the category ID is `3`, the test cases will start with `3.x`.


| Test Case ID |  Test Case Name   |                Test Case Description                 | Test Data |                   Expected Result                    | Actual Result |  Tested  |
|:------------:|:-----------------:|:----------------------------------------------------:|:---------:|:----------------------------------------------------:|:-------------:|:--------:|
|     3.1      |       MacOS       |       The application works correctly on MacOS       |    --     |       The application works correctly on MacOS       |      --       | &#x2610; |
|     3.2      |    Windows 10     |    The application works correctly on Windows 10     |    --     |    The application works correctly on Windows 10     |      --       | &#x2610; |
|     3.3      |  Windows 11 Pro   |  The application works correctly on Windows 11 Pro   |    --     |  The application works correctly on Windows 11 Pro   |      --       | &#x2610; |
|     3.4      | Windows 11 Family | The application works correctly on Windows 11 Family |    --     | The application works correctly on Windows 11 Family |      --       | &#x2610; |
|     3.5      |       Linux       |       The application works correctly on Linux       |    --     |       The application works correctly on Linux       |      --       | &#x2610; |






# Accessibility tests

The following table contains the accessibility test cases for the Dilemma project. As the category ID is `4`, the test cases will start with `4.x`.


| Test Case ID | Test Case Name |               Test Case Description                | Test Data |                   Expected Result                   | Actual Result |  Tested  |
|:------------:|:--------------:|:--------------------------------------------------:|:---------:|:---------------------------------------------------:|:-------------:|:--------:|
|     4.1      | Colorblindness | Use a colorblindness simulator to check the colors |    --     | The colors are distinguishable for colorblind users |      --       | &#x2610; |







# Usability tests

The following table contains the usability test cases for the Dilemma project. As the category ID is `5`, the test cases will start with `5.x`.


| Test Case ID | Test Case Name |                     Test Case Description                      | Test Data |               Expected Result                | Actual Result |  Tested  |
|:------------:|:--------------:|:--------------------------------------------------------------:|:---------:|:--------------------------------------------:|:-------------:|:--------:|
|     5.1      |    Tutorial    | The user can follow the tutorial to learn how to play the game |    --     | The user can understand how to play the game |      --       | &#x2610; |
|     5.2      |    Feedback    |  The user can provide feedback to improve the game experience  |    --     |  The user can provide feedback to the team   |      --       | &#x2610; |
|     5.3      |    Support     |      The user can contact support if they have any issues      |    --     |    The user can contact support if needed    |      --       | &#x2610; |
|     5.4      |    Settings    |     The user can change the settings to customize the game     |    --     |   The user can customize the game settings   |      --       | &#x2610; |
|     5.5      |    Language    |   The user can change the language to fit their preferences    |    --     |  The user can change the language if needed  |      --       | &#x2610; |





# Regression tests

The following table contains the regression test cases for the Dilemma project. As the category ID is `6`, the test cases will start with `6.x`.

The regression tests are special tests that are run to ensure that new changes do not break existing functionality. For this category, we will use the previous version of the application as a reference to compare the new version with it. 

Each time a new version is released, we will run the tests that already passed in the previous version to make sure that they still pass in the new version. The percentage of passed tests will be calculated to determine the quality of the new version.


| Test Case ID | Previous Version | New Version | Previous Passed Tests | Actual Passed Tests | Percentage |  Tested  |
|:------------:|:----------------:|:-----------:|:---------------------:|:-------------------:|:----------:|:--------:|
<!-- |     6.1      |                  |             |                       |                     |            | &#x2610; | -->
