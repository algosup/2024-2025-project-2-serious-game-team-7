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
var overlay_scene: Node = null
var gameOverScenePath = "res://Scenes/mainMenu.tscn"
var save_file_path = "user://slider_positions.save"

func _process(delta: float) -> void:
	# Check if the player is dead
	if currentMoney <= 0 or currentTemperature >= 30:
		game_over()

func game_over():
	isDead = true
	print("Game Over!")
	
	delete_save_file()
	open_overlay_scene()
	reset_game_state()

func open_overlay_scene() -> void:
	if overlay_scene:
		overlay_scene.queue_free()  # Remove existing overlay if any
	
	overlay_scene = load(gameOverScenePath).instantiate()
	overlay_scene.z_index = 100  # Ensure it's on top
	get_tree().root.add_child(overlay_scene)

func close_overlay_scene() -> void:
	if overlay_scene:
		overlay_scene.queue_free()
		overlay_scene = null

func reset_game_state():
	isDead = false
	currentMoney = 50
	currentTemperature = 15
	thisTurnMoney = 50
	thisTurnTemperature = 15
	rndMoney = 0
	currentTurn = 0
	rndLevels = [0, 0, 0, 0, 0, 0]
	rndCursors = [0, 0, 0, 0, 0, 0]

func delete_save_file():
	var dir = DirAccess.open("user://")
	if dir:
		if dir.file_exists(save_file_path):
			var error = dir.remove(save_file_path)
			if error == OK:
				print("Save file deleted successfully")
			else:
				print("Error deleting save file: ", error)
		else:
			print("Save file does not exist")
	else:
		print("Unable to access user directory")
