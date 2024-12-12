extends Node2D

const RECTANGLE_COUNT = 4
var rectangles = []
var active_rectangle = null  # The currently selected detail rectangle
var active_index = -1  # Index of the active rectangle
var stored_variable = -1  # Debugging
var csv_data = []  # Data loaded from CSV
var vertical_offset = 0.13  # Vertical position for starting rectangles
var accepted_deal = []  # List of accepted diplomatic deal for display

const CSV_FILE_PATH = "res://data/DiploNodes.csv"

# Called when the scene is ready
func _ready():
	load_and_assign_csv_data()
	create_rectangles()
	get_viewport().size_changed.connect(adjust_positions)  # Handle window resizing

# Create rectangles based on the CSV file
func create_rectangles():
	if csv_data.size() > 1:
		# Skip the first row (header) and create rectangles
		for i in range(1, min(csv_data.size(), RECTANGLE_COUNT + 1)):
			var row = csv_data[i]
			if row.size() > 0:
				create_rectangle_from_text(row[0], i - 1)
	adjust_positions()


# Create a rectangle with a given label text and index
func create_rectangle_from_text(text, index):
	var rectangle = ColorRect.new()
	rectangle.custom_minimum_size = Vector2(300, 60)
	rectangle.color = Color(1, 1, 1, 0.9)

	# Create a label inside the rectangle
	var label = Label.new()
	label.text = text
	label.add_theme_color_override("font_color", Color.BLACK)
	label.size = rectangle.custom_minimum_size
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER

	rectangle.add_child(label)

	# Connect input events for rectangle clicks
	rectangle.gui_input.connect(_on_rectangle_clicked.bind(index))

	# Add the rectangle to the scene and list
	add_child(rectangle)
	rectangles.append(rectangle)


# Adjust positions of all rectangles when window size changes
func adjust_positions():
	if rectangles.is_empty():
		return

	var viewport_size = get_viewport_rect().size
	var start_y = viewport_size.y * vertical_offset

	for i in range(rectangles.size()):
		var rectangle = rectangles[i]
		rectangle.position.x = (viewport_size.x - rectangle.custom_minimum_size.x) / 2
		rectangle.position.y = start_y + i * (60 + 30)  # 60px height, 30px spacing


# RECTANGLE INTERACTIONS
# Handle rectangle click events
func _on_rectangle_clicked(event, index):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Remove active rectangle if clicked again
		if active_rectangle:
			active_rectangle.queue_free()
			if active_index == index:
				active_rectangle = null
				active_index = -1
				stored_variable = -1
				print("Deselected. Stored variable: ", stored_variable)
				return

		# Create a new detail rectangle if a different one is clicked
		active_rectangle = create_new_rectangle(index)
		active_index = index
		stored_variable = index
		print("Clicked rectangle index: ", index)


# Create a detailed rectangle showing deal information
func create_new_rectangle(index):
	if index >= 0 and index < rectangles.size():
		# Create a rectangle for the detail view
		var new_rect = ColorRect.new()
		new_rect.size = Vector2(200, 330)
		new_rect.position = rectangles[0].position + Vector2(406, -4)
		new_rect.color = Color(1, 1, 1, 0.9)

		# Use a VBoxContainer for layout
		var vbox = VBoxContainer.new()
		vbox.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		vbox.add_theme_constant_override("separation", 10)
		new_rect.add_child(vbox)

		# Display the deal name from the CSV
		var csv_row = csv_data[index + 1]

		var name_label = Label.new()
		name_label.text = csv_row[0]  # deal name
		name_label.add_theme_font_size_override("font_size", 20)
		name_label.set_autowrap_mode(TextServer.AUTOWRAP_WORD_SMART)
		name_label.add_theme_color_override("font_color", Color.BLACK)
		name_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		vbox.add_child(name_label)

		# Display the deal description from the CSV
		var description_label = Label.new()
		description_label.text = csv_row[3]
		description_label.set_autowrap_mode(TextServer.AUTOWRAP_WORD_SMART)
		description_label.size_flags_vertical = Control.SIZE_EXPAND_FILL
		description_label.add_theme_color_override("font_color", Color.BLACK)
		vbox.add_child(description_label)

		# Add a spacer to push the button to the bottom
		var spacer = Control.new()
		spacer.size_flags_vertical = Control.SIZE_EXPAND_FILL
		vbox.add_child(spacer)

		# Add the "Accept" button
		var accept_button = Button.new()
		accept_button.text = "Accept"
		accept_button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		accept_button.pressed.connect(_on_accept_pressed.bind(index))
		vbox.add_child(accept_button)

		add_child(new_rect)
		return new_rect


# Handle acceptance of a deal
func _on_accept_pressed(index):
	print("Accepting deal at index: ", index)  
	var csv_row = csv_data[index + 1]
	var deal_name = csv_row[0]
	
	var money_change = int(csv_data[index + 1][1])  # Money change
	var temperature_change = float(csv_data[index + 1][2])  # Temperature change	
	# Update GlobalVariables
	GlobalVariables.currentMoney += money_change
	GlobalVariables.currentTemperature += temperature_change	
	# Clamp values to avoid exceeding limits
	GlobalVariables.currentMoney = clamp(GlobalVariables.currentMoney, 0, 100)
	GlobalVariables.currentTemperature = clamp(GlobalVariables.currentTemperature, -50, 50)	
	# Print confirmation
	print("Accepted deal:", deal_name)
	print("Money change:", money_change, "-> Current Money:", GlobalVariables.currentMoney)
	print("Temperature change:", temperature_change, "-> Current Temperature:", GlobalVariables.currentTemperature)

	# Remove the active rectangle if it exists
	if active_rectangle:
		active_rectangle.queue_free()
		active_rectangle = null

	# Remove the selected rectangle from the list
	remove_rectangle(index)
	create_accepted_deal_rectangle(deal_name)
	adjust_positions()


# Remove a rectangle by index
func remove_rectangle(index):
	print("Removing rectangle at index: ", index)  
	if index >= 0 and index < rectangles.size():
		var rectangle = rectangles[index]
		rectangles.remove_at(index)
		rectangle.queue_free()

		csv_data.remove_at(index + 1)

		# Reconnect input events after rearranging rectangles
		for i in range(rectangles.size()):
			rectangles[i].gui_input.disconnect(_on_rectangle_clicked)
			rectangles[i].gui_input.connect(_on_rectangle_clicked.bind(i))


# Create a rectangle showing the accepted deal
func create_accepted_deal_rectangle(deal_name):
	var new_rect = ColorRect.new()
	new_rect.custom_minimum_size = Vector2(160, 25)
	new_rect.color = Color(0.8, 0.8, 0.8, 0.9)

	var label = Label.new()
	label.text = deal_name
	label.add_theme_color_override("font_color", Color.BLACK)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.add_theme_font_size_override("font_size", 10)

	new_rect.add_child(label)
	accepted_deal.append(new_rect)
	add_child(new_rect)
	adjust_accepted_deal_positions()


# Adjust accepted deal positions
func adjust_accepted_deal_positions():
	for i in range(accepted_deal.size()):
		var deal_rect = accepted_deal[i]
		deal_rect.position = Vector2(145, 87 + i * 30)


# CSV DATA MANAGEMENT

# Load CSV data into an array
func load_csv(file_path: String) -> Array:
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var data = file.get_as_text()
		file.close()
		var rows = data.split("\n")
		var result = []
		for row in rows:
			if row.strip_edges() != "":
				result.append(row.split(","))
		return result
	else:
		print("Failed to open file: ", file_path)
		return []


# Load CSV data into memory
func load_and_assign_csv_data():
	csv_data = load_csv(CSV_FILE_PATH)
