extends Sprite2D

# Distance to move down when the button is pressed
@export var move_down_distance: float = 2.0

# Store the original position to reset later
var original_position: Vector2

# Reference to the node responsible for changing the background color
@export var background_node: Node

# Predefined colors for specific screens
@export var target_color: Color = Color(0.6, 0.9, 0.6, 1.0)  # Default is white

func _ready():
	# Save the original position of the sprite
	original_position = position

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and get_rect().has_point(to_local(event.position)):
			# Button is pressed
			on_button_pressed()
		elif not event.pressed:
			# Button is released
			on_button_released()

func on_button_pressed():
	# Move the sprite down by the defined distance
	position += Vector2(0, move_down_distance)
	print("Button Pressed: %s" % self.name)

	# Change the screen color
	change_background_color()

func on_button_released():
	# Reset the sprite to its original position
	position = original_position
	print("Button Released: %s" % self.name)

func change_background_color():
	if background_node and background_node is CanvasItem:
		# Change the background node's color to the target color
		background_node.modulate = target_color
		print("%s color changed to: %s" % [background_node.name, target_color])
	else:
		print("Background node not set or invalid.")
