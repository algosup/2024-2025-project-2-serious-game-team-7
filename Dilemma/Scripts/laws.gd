extends Node2D

const RECTANGLE_COUNT = 4
var rectangles = []
var active_rectangle = null
var active_index = -1
var stored_variable = -1  # Changed to int, -1 indicates no selection

func _ready():
	create_rectangles()

func create_rectangles():
	var viewport_size = get_viewport().size
	
	for i in range(RECTANGLE_COUNT):
		var rectangle = ColorRect.new()
		rectangle.custom_minimum_size = Vector2(300, 60)
		
		var x_position = (viewport_size.x - rectangle.custom_minimum_size.x) / 2
		var y_position = viewport_size.y * 0.14
		
		rectangle.position = Vector2(x_position, y_position + i * 90)
		rectangle.color = Color(1, 1, 1, 0.9)
		
		add_child(rectangle)
		
		var label = Label.new()
		label.text = "Label %d" % (i + 1)
		label.add_theme_color_override("font_color", Color.BLACK)
		
		label.size = rectangle.custom_minimum_size
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		
		rectangle.add_child(label)
		
		# Make the rectangle clickable
		rectangle.gui_input.connect(_on_rectangle_clicked.bind(i))
		
		rectangles.append(rectangle)

func _on_rectangle_clicked(event, index):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if active_rectangle:
			active_rectangle.queue_free()
			if active_index == index:
				active_rectangle = null
				active_index = -1
				stored_variable = -1  # Reset stored variable when deselecting
				print("Deselected. Stored variable: ", stored_variable)
				return
		
		active_rectangle = create_new_rectangle(index)
		active_index = index
		# Store the index as an integer
		stored_variable = index  
		print("Stored variable: ", stored_variable)

func create_new_rectangle(index):
	var new_rect = ColorRect.new()
	new_rect.size = Vector2(200, 100)
	new_rect.position = rectangles[index].position + Vector2(350, 0)
	new_rect.color = Color(0.8, 0.8, 0.2, 0.9)  # Yellow color
	
	var label = Label.new()
	label.text = "New Rectangle %d" % (index + 1)
	label.add_theme_color_override("font_color", Color.BLACK)
	label.size = new_rect.size
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	
	new_rect.add_child(label)
	add_child(new_rect)
	
	return new_rect

# Function to retrieve the stored variable
func get_stored_variable():
	return stored_variable
