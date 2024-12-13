extends Control

@export var scene_to_load: String = "res://Scenes/control.tscn"

func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file(scene_to_load) 
