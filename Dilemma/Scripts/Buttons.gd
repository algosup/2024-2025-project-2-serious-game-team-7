extends Sprite2D

@export var popup_scene_path: String  # Path to the popup scene
@export var move_down_distance: float = 2.0  # Distance to move down when pressed

# Store the original position to reset later
var original_position: Vector2

# Static reference to the currently active popup and its color
static var active_popup_instance: Node = null
static var active_popup_scene_path: String = ""

# Reference to the node responsible for changing the background color
@export var background_node: Node

# Predefined colors for specific screens
@export var target_color: Color = Color(0.6, 0.9, 0.6, 1.0)  # Default is green

@export var next_turn_button: bool = false

func _ready():
	# Save the original position of the sprite
	original_position = position

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and get_rect().has_point(to_local(event.position)):
			if next_turn_button:
				trigger_next_turn()
			else:
				toggle_popup_and_color()

func toggle_popup_and_color():
	if active_popup_instance and is_instance_valid(active_popup_instance):
		if active_popup_scene_path == popup_scene_path:
			# If the same button is clicked, close the current popup
			print("Closing popup: %s" % active_popup_instance.name)
			active_popup_instance.call_deferred("queue_free")
			active_popup_instance = null
			active_popup_scene_path = ""
		else:
			# If a different button is clicked, close the current popup and open the new one
			print("Switching popup from %s to %s" % [active_popup_scene_path, popup_scene_path])
			active_popup_instance.call_deferred("queue_free")
			active_popup_instance = null
			active_popup_scene_path = ""
			change_background_color()  # Change to the new button's color
			open_popup_scene()
	else:
		# No active popup, open the new one and change color
		change_background_color()
		open_popup_scene()

func open_popup_scene():
	print("Opening popup: %s" % popup_scene_path)
	if ResourceLoader.exists(popup_scene_path):
		var popup_scene = load(popup_scene_path).instantiate()
		if popup_scene:
			print("Popup scene loaded successfully!")
			get_tree().root.add_child(popup_scene)  # Add popup to the root
			popup_scene.z_index = 100  # Ensure the popup is on top

			# Update the static variables
			active_popup_instance = popup_scene
			active_popup_scene_path = popup_scene_path
		else:
			print("Error: Failed to instantiate popup scene: %s" % popup_scene_path)
	else:
		print("Error: Popup scene not found: %s" % popup_scene_path)

func change_background_color():
	if background_node and background_node is CanvasItem:
		# Change the background node's color to the target color
		background_node.modulate = target_color
		print("%s color changed to: %s" % [background_node.name, target_color])
	else:
		print("Background node not set or invalid.")
	
func trigger_next_turn():
	var label: Label
	label = get_node("/root/Control/TurnCount")
	
	GlobalVariables.thisTurnMoney += GlobalVariables.rndMoney
	GlobalVariables.currentMoney = GlobalVariables.thisTurnMoney
	GlobalVariables.currentTemperature = GlobalVariables.thisTurnTemperature
	GlobalVariables.currentTurn += 1
	
	label.text = str(GlobalVariables.currentTurn)
	print('next turn : ', GlobalVariables.currentTurn)
