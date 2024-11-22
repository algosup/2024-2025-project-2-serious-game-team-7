extends Sprite2D

# Distance to move down when the button is pressed
@export var move_down_distance: float = 2.0

# References to the Line2D nodes
@export var lines: Array[Line2D]  # Array to store the four Line2D nodes

# Target color for green
@export var target_color: Color = Color(1, 0, 0, 1)  # Smooth green

# Number of points to update in the next press
var current_max_point: int = 1

# Store the original position of the button
var original_position: Vector2

func _ready():
	# Save the original position of the sprite
	original_position = position
	# Initialize the starting point
	current_max_point = 1

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

	# Gradually update all lines
	update_all_lines()

func on_button_released():
	# Reset the sprite to its original position
	position = original_position
	print("Button Released: %s" % self.name)

func update_all_lines():
	var updated = false

	# Iterate through each Line2D node
	for line in lines:
		if line and line is Line2D:
			var gradient = line.gradient
			if gradient:
				var colors = gradient.get_colors()

				# Ensure the gradient has enough colors for the points
				while len(colors) < line.get_point_count():
					colors.append(Color(1, 0, 0, 1))  # Default to white
				
				# Update colors up to `current_max_point`
				for i in range(current_max_point):
					if i < line.get_point_count():
						colors[i] = target_color

				# Apply the updated gradient
				gradient.set_colors(colors)
				line.gradient = gradient
				updated = true
				print("Updated Line2D: %s to Point: %d" % [line.name, current_max_point])

	# Increment the maximum point to update on the next press
	if updated:
		current_max_point += 1
		# Reset if all points are updated
		var max_points = 0
		for line in lines:
			if line and line is Line2D:
				max_points = max(max_points, line.get_point_count())
		if current_max_point > max_points:
			current_max_point = 1
