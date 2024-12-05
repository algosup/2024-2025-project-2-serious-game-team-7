extends Node2D

# A list to store cursor positions for each slider
var cursor_positions = []

# Number of sliders
const SLIDER_COUNT = 6

func _ready():
	# Create multiple sliders dynamically
	for i in range(SLIDER_COUNT):
		create_slider(i)
	
	# Load saved positions
	load_slider_positions()
	
	# Connect to the tree_exiting signal
	get_tree().connect("tree_exiting", Callable(self, "save_slider_positions"))

func create_slider(index):
	# Create a new Line2D for the base line
	var base_line = Line2D.new()
	add_child(base_line)
	
	# Position the line vertically based on the index
	var line_start = Vector2(400, 120 + index * 55)  # Adjust vertical spacing (55px apart)
	var line_end = Vector2(950, 120 + index * 55)
	
	base_line.points = [line_start, line_end]
	base_line.width = 7

	# Create a new Line2D for the cursor
	var cursor = Line2D.new()
	add_child(cursor)
	
	cursor.points = [Vector2(0, -20), Vector2(0, 20)]
	cursor.width = 7
	cursor.position = line_start

	# Add a Label to display the percentage at the end of the line
	var label = Label.new()
	label.text = "0%"  # Initial value
	label.position = Vector2(line_end.x + 10, line_end.y - 10)  # Position to the right of the line
	add_child(label)

	# Store slider data as a dictionary
	cursor_positions.append({
		"base_line": base_line,
		"cursor": cursor,
		"line_start": line_start,
		"line_end": line_end,
		"line_length": line_start.distance_to(line_end),
		"dragging": false,
		"label": label  # Store reference to the label in the slider data
	})

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var mouse_pos = get_global_mouse_position()
				for slider in cursor_positions:
					var cursor_rect = Rect2(slider["cursor"].position - Vector2(5, 20), Vector2(10, 40))
					if cursor_rect.has_point(mouse_pos) or is_point_on_line(mouse_pos, slider):
						slider["dragging"] = true
						move_cursor_to(mouse_pos.x, slider)
			else:
				# Stop dragging for all sliders when the mouse button is released
				for slider in cursor_positions:
					slider["dragging"] = false
	elif event is InputEventMouseMotion:
		for slider in cursor_positions:
			if slider["dragging"]:
				move_cursor_to(event.position.x, slider)

func move_cursor_to(x_position, slider):
	var new_x = clamp(x_position, slider["line_start"].x, slider["line_end"].x)
	slider["cursor"].position.x = new_x
	slider["cursor"].position.y = slider["line_start"].y
	
	# Calculate and update percentage
	var cursor_value = (new_x - slider["line_start"].x) / slider["line_length"]
	var percentage = round(cursor_value * 100)  # Round to nearest integer
	slider["label"].text = "%d%%" % percentage
	
	print_all_cursor_positions()
	save_slider_positions()  # Save after each move

func is_point_on_line(point, slider):
	var margin = 10.0  # Adjust this value to increase/decrease click tolerance
	var interpolation = (point.x - slider["line_start"].x) / slider["line_length"]
	var closest_point = slider["line_start"].lerp(slider["line_end"], interpolation)
	var distance = point.distance_to(closest_point)
	return distance <= margin and point.x >= slider["line_start"].x and point.x <= slider["line_end"].x

func print_all_cursor_positions():
	print("Cursor positions:")
	for i in range(cursor_positions.size()):
		var slider = cursor_positions[i]
		var cursor_value = (slider["cursor"].position.x - slider["line_start"].x) / slider["line_length"]
		print("Slider %d: %d%%" % [i, round(cursor_value * 100)])  # Round in print as well

func save_slider_positions():
	var save_data = []
	for slider in cursor_positions:
		var cursor_value = (slider["cursor"].position.x - slider["line_start"].x) / slider["line_length"]
		save_data.append(cursor_value)
	
	var save_file = FileAccess.open("user://slider_positions.save", FileAccess.WRITE)
	save_file.store_var(save_data)

func load_slider_positions():
	if not FileAccess.file_exists("user://slider_positions.save"):
		return  # No save file exists
	
	var save_file = FileAccess.open("user://slider_positions.save", FileAccess.READ)
	var save_data = save_file.get_var()
	
	for i in range(min(save_data.size(), cursor_positions.size())):
		var slider = cursor_positions[i]
		var new_x = slider["line_start"].x + save_data[i] * slider["line_length"]
		move_cursor_to(new_x, slider)
