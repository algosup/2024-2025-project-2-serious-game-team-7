extends Node

# Current resources of the player
var currentMoney: int = 50
var currentTemperature: int = 15

# Resources gained or lost in the current turn
var thisTurnMoney: int = 50
var thisTurnTemperature: int = 15
var rndMoney: int = 0

# Current turn
var currentTurn: int = 0

# RnD levels

const MAX_RND_LEVEL = 5
var rndLevels: Array = [0, 0, 0, 0, 0, 0]  # Initial levels for all sliders
var rndCursors: Array = [0, 0, 0, 0, 0, 0]  # Cursor positions for all sliders