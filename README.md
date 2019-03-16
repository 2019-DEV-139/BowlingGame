# CodingDojo - Bowling

This repository contains the solution to Bowling Kata from CodingDojo: http://codingdojo.org/kata/Bowling/

## About
This code was created by a developer under alias `2019_DEV_139` as a first round of customer interviews.

## Installation
Xcode 10.1 or later is required to run the project.
1. Download or clone the repository:
```
git clone https://github.com/2019-DEV-139/BowlingGame.git
```
2. Open `BowlingGame.xcodeproj` file in the project directory
3. Select any simulator in the Xcode IDE
4. Click `Run` (play icon) or press `⌘+R` key combination

## Usage
![Screenshot](/screenshot.jpg?raw=true)


App allows user to enter a custom bowling game in string representation and calculate the game score. It also offers a selection of several predefined games. Score is updated when "Calculate Score" button is tapped.

App does not check if a game is valid.

## Project structure
`SimpleCalculator`  - logic for bowling game score calculation.
`GameStrings` - predefined game values
`ViewController` - UI for game input
`BowlingGameTests` - unit and integration tests for `SimpleCalculator` struct
