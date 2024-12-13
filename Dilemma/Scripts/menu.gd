extends Button

# Path to the scene for New Game
@export var cutscene_to_load: String = "res://Scenes/introduction.tscn"
@export var scene_to_load: String = "res://Scenes/control.tscn"

func _ready() -> void:
	print("Menu script _ready method running...")

	# Debug New Game node
	if (self.text == "Quit"):
		self.pressed.connect(self._on_quit_pressed)
	if (self.text == "New Game"):
		self.pressed.connect(self._on_new_game_pressed)
	if (self.text == "Continue"):
		self.pressed.connect(self._on_continue_pressed)
#
func _on_new_game_pressed():
	print("New Game button pressed!")
	if ResourceLoader.exists(cutscene_to_load):
		print("Scene %s exists. Loading..." % cutscene_to_load)
		get_tree().change_scene_to_file(cutscene_to_load)
	else:
		print("Error: Scene %s does not exist." % cutscene_to_load)

func _on_continue_pressed():
	print("Continue button pressed!")
	if ResourceLoader.exists(scene_to_load):
		print("Scene %s exists. Loading..." % scene_to_load)
		get_tree().change_scene_to_file(scene_to_load)
	else:
		print("Error: Scene %s does not exist." % scene_to_load)

func _on_quit_pressed():
	print("Quit button pressed!")
	get_tree().quit(0)
