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

# Death checking
var isDead: bool = false

func _process(delta: float) -> void:
    # Update the money and temperature labels
    $Money.value = currentMoney
    $Temperature.value = currentTemperature

    # Check if the player is dead
    if currentMoney <= 0 or currentTemperature >= 30:
        isDead = true
        print("Game Over!")
        # Show game over screen
        get_tree().change_scene("res://Scenes/mainMenu.tscn")
