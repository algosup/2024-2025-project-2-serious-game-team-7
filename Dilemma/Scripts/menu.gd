extends Node

# Path to the scene for New Game
@export var scene_to_load: String = "res://Scenes/control.tscn"

func _ready():
	print("Menu script _ready method running...")

	# Debug New Game node
	if has_node("Dilemma1/New"):
		var new_game_node = $Dilemma1/New
		if new_game_node is Button:
			new_game_node.connect("pressed", Callable(self, "_on_new_game_pressed"))
			print("New Game button connected successfully.")
		else:
			print("Error: New Game node is not a Button. Found: ", typeof(new_game_node))
	else:
		print("Error: New Game node not found in Dilemma1.")

	# Debug Quit node
	if has_node("Dilemma1/Quit"):
		var quit_node = $Dilemma1/Quit
		if quit_node is Button:
			quit_node.connect("pressed", Callable(self, "_on_quit_pressed"))
			print("Quit button connected successfully.")
		else:
			print("Error: Quit node is not a Button. Found: ", typeof(quit_node))
	else:
		print("Error: Quit node not found in Dilemma1.")

func _on_new_game_pressed():
	print("New Game button pressed!")
	if ResourceLoader.exists(scene_to_load):
		print("Scene %s exists. Loading..." % scene_to_load)
		get_tree().change_scene(scene_to_load)
	else:
		print("Error: Scene %s does not exist." % scene_to_load)

func _on_quit_pressed():
	print("Quit button pressed!")
	get_tree().quit()
