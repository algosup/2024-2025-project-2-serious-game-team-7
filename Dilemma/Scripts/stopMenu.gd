extends Control

@export var menuScene_to_load: String = "res://Scenes/mainMenu.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_quit_pressed() -> void:
	print("Quit button pressed!")
	if ResourceLoader.exists(menuScene_to_load):
		print("Scene %s exists. Loading..." % menuScene_to_load)
		get_tree().change_scene_to_file(menuScene_to_load)
	else:
		print("Error: Scene %s does not exist." % menuScene_to_load)
