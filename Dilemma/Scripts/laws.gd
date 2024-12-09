extends Node2D

const RECTANGLE_COUNT = 4
var rectangles = []
var active_rectangle = null
var active_index = -1
var stored_variable = -1  # Changed to int, -1 indicates no selection
var csv_data = []  # Store the CSV data

const CSV_FILE_PATH = "res://data/laws.csv"

func _ready():
	create_rectangles()
	load_and_assign_csv_data()

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
		stored_variable = index  # Store the index as an integer
		#print("Stored variable: ", stored_variable)

func create_new_rectangle(index):
	var new_rect = ColorRect.new()
	new_rect.size = Vector2(200, 330)  # size new rectangle
	new_rect.position = rectangles[0].position + Vector2(406, -4)
	new_rect.color = Color(1, 1, 1, 0.9)
	
	var vbox = VBoxContainer.new()
	vbox.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	vbox.add_theme_constant_override("separation", 10)
	new_rect.add_child(vbox)
	
	var name_label = Label.new()
	name_label.text = csv_data[index + 1][0]  # Name from CSV
	name_label.add_theme_font_size_override("font_size", 20)
	name_label.set_autowrap_mode(TextServer.AUTOWRAP_WORD_SMART)
	name_label.add_theme_color_override("font_color", Color.BLACK)  # Set text color to black
	name_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vbox.add_child(name_label)
	
	var description_label = Label.new()
	description_label.text = csv_data[index + 1][3]  # Description from CSV
	description_label.set_autowrap_mode(TextServer.AUTOWRAP_WORD_SMART)  # Set autowrap mode
	description_label.size_flags_vertical = Control.SIZE_EXPAND_FILL
	description_label.add_theme_color_override("font_color", Color.BLACK)  # Set text color to black
	vbox.add_child(description_label)

	var accept_button = Button.new()
	accept_button.text = "Accept"
	accept_button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	accept_button.pressed.connect(_on_accept_pressed.bind(index))
	vbox.add_child(accept_button)

	add_child(new_rect)
	return new_rect

func _on_accept_pressed(index):
	# Extract data from CSV
	var law_name = csv_data[index + 1][0]  # Law name
	var money_change = int(csv_data[index + 1][1])  # Money change
	var temperature_change = float(csv_data[index + 1][2])  # Temperature change	
	# Update GlobalVariables
	GlobalVariables.currentMoney += money_change
	GlobalVariables.currentTemperature += temperature_change	
	# Clamp values to avoid exceeding limits
	GlobalVariables.currentMoney = clamp(GlobalVariables.currentMoney, 0, 100)
	GlobalVariables.currentTemperature = clamp(GlobalVariables.currentTemperature, -50, 50)	
	# Print confirmation
	print("Accepted law:", law_name)
	print("Money change:", money_change, "-> Current Money:", GlobalVariables.currentMoney)
	print("Temperature change:", temperature_change, "-> Current Temperature:", GlobalVariables.currentTemperature)

# Function to retrieve the stored variable
func get_stored_variable():
	return stored_variable

# Function to load CSV data using FileAccess
func load_csv(file_path: String) -> Array:
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var data = file.get_as_text()
		file.close()

		# Split data into rows
		var rows = data.split("\n")
		var result = []

		for row in rows:
			if row.strip_edges() != "":
				# Split each row into columns
				result.append(row.split(","))
		return result
	else:
		print("Failed to open file: ", file_path)
		return []

# Function to load and assign CSV data to rectangles (starting from the second line)
func load_and_assign_csv_data():
	csv_data = load_csv(CSV_FILE_PATH)
	if csv_data.size() > 1:  # Ensure there's more than just the header row
		for i in range(1, min(csv_data.size(), rectangles.size() + 1)):  # Start from second line
			var row = csv_data[i]
			if row.size() > 3:  # Ensure all required columns are present
				var label = rectangles[i - 1].get_child(0) as Label
				label.text = row[0]  # Assign the first column of the CSV to the label
	else:
		print("No data available in CSV (or only header present).")
