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

# Overlay scene and paths
var overlay_scene: Node = null
var gameOverScenePath = "res://Scenes/mainMenu.tscn"
var save_file_path = "res://saves/slider_positions.save"
var save_laws = "res://saves/accepted_laws.cfg"
var save_diplomacy = "res://saves/accepted_deals.cfg"

func _process(delta: float) -> void:
	if isDead:
		return

	# Check if the player is dead
	if currentMoney <= 0:
		isDead = true
		gameOverScenePath = "res://Scenes/NoMoneyEnding.tscn"
		end()
	elif currentTemperature >= 30:
		isDead = true
		gameOverScenePath = "res://Scenes/WarmEnding.tscn"
		end()
	elif currentTurn == 11 and currentMoney > 0 and currentTemperature < 30:
		isDead = false
		gameOverScenePath = "res://Scenes/GoodEnding.tscn"
		end()

func end():
	close_overlay_scene()
	delete_save_file()  
	reset_game_state()
	cleanup_lingering_scenes()
	open_overlay_scene()

func open_overlay_scene() -> void:
	if overlay_scene:
		print("Overlay already exists, cleaning it up...")
		overlay_scene.queue_free()
		overlay_scene = null  # Reset to ensure it's not reused

	print("Loading overlay scene: ", gameOverScenePath)
	overlay_scene = load(gameOverScenePath).instantiate()
	overlay_scene.z_index = 100  # Ensure it's on top
	get_tree().root.add_child(overlay_scene)
	print("Overlay opened: ", gameOverScenePath)

func close_overlay_scene() -> void:
	if overlay_scene:
		print("Closing overlay scene: ", overlay_scene.name)
		overlay_scene.queue_free()
		overlay_scene = null
	print("Overlay scene cleanup complete. Root children: ", get_tree().root.get_children())

func cleanup_lingering_scenes():
	print("Cleaning up lingering scenes...")
	for child in get_tree().root.get_children():
		# Keep GlobalVariables and the overlay scene
		if child != GlobalVariables and child != overlay_scene:
			print("Freeing lingering scene: ", child.name)
			child.queue_free()
	print("Cleanup complete. Root children: ", get_tree().root.get_children())

func reset_game_state():
	# Reset game variables to their default values
	isDead = false
	currentMoney = 50
	currentTemperature = 15
	thisTurnMoney = 50
	thisTurnTemperature = 15
	rndMoney = 0
	currentTurn = 0
	rndLevels = [0, 0, 0, 0, 0, 0]
	rndCursors = [0, 0, 0, 0, 0, 0]
	print("Game state reset.")

func delete_save_file():
	# Deletes the save files if they exist
	var dir = DirAccess.open("res://saves/")
	if dir:
		# Delete slider positions save file
		if dir.file_exists(save_file_path):
			var error = dir.remove(save_file_path)
			if error == OK:
				print("Slider positions save file deleted successfully.")
			else:
				print("Error deleting slider positions save file: ", error)
		else:
			print("Slider positions save file does not exist.")

		# Delete diplomacy save file
		if dir.file_exists(save_diplomacy):
			var error = dir.remove(save_diplomacy)
			if error == OK:
				print("Accepted deals save file deleted successfully.")
			else:
				print("Error deleting accepted deals save file: ", error)
		else:
			print("Accepted deals save file does not exist.")
		
		# Delete diplomacy save file
		if dir.file_exists(save_laws):
			var error = dir.remove(save_laws)
			if error == OK:
				print("Accepted deals save file deleted successfully.")
			else:
				print("Error deleting accepted deals save file: ", error)
		else:
			print("Accepted deals save file does not exist.")
	else:
		print("Unable to access saves directory.")
