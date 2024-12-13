extends Node2D

const RECTANGLE_COUNT = 4
var rectangles = []
var active_rectangle = null
var active_index = -1
var csv_data = []
var vertical_offset = 0.13
var accepted_law = []

const CSV_FILE_PATH = "res://data/DiploNodes.csv"
const SAVE_FILE_PATH = "res://saves/accepted_laws.cfg" # Added for saving logic

var total_choice_sets = 0
var last_processed_turn = -1
var current_choices = []

# New array to store the names of accepted laws
var accepted_law_names = []

func _ready():
	load_and_assign_csv_data()
	load_accepted_laws() # Load previously accepted laws if any
	update_current_choices()
	create_rectangles()
	create_accepted_law_rectangles() # Recreate accepted law rectangles after load
	get_viewport().size_changed.connect(adjust_positions)
	last_processed_turn = GlobalVariables.currentTurn

func _process(delta):
	if GlobalVariables.currentTurn != last_processed_turn:
		update_current_choices()
		create_rectangles()
		last_processed_turn = GlobalVariables.currentTurn

func load_and_assign_csv_data():
	csv_data = load_csv(CSV_FILE_PATH)
	total_choice_sets = (csv_data.size() - 1) / RECTANGLE_COUNT
	print("Total choice sets: ", total_choice_sets)

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

func update_current_choices():
	current_choices.clear()
	var effective_turn = GlobalVariables.currentTurn % total_choice_sets
	var start_index = effective_turn * RECTANGLE_COUNT + 1
	for i in range(RECTANGLE_COUNT):
		var index = start_index + i
		if index < csv_data.size():
			# Only add if not already accepted
			var law_name = csv_data[index][0]
			if law_name not in accepted_law_names:
				current_choices.append(csv_data[index])

func create_rectangles():
	clear_existing_rectangles()
	for i in range(current_choices.size()):
		create_rectangle_from_text(current_choices[i][0], i)
	adjust_positions()

func clear_existing_rectangles():
	for rectangle in rectangles:
		rectangle.queue_free()
	rectangles.clear()

func create_rectangle_from_text(text, index):
	var rectangle = ColorRect.new()
	rectangle.custom_minimum_size = Vector2(300, 60)
	rectangle.color = Color(1, 1, 1, 0.9)

	var label = Label.new()
	label.text = text
	label.add_theme_color_override("font_color", Color.BLACK)
	label.size = rectangle.custom_minimum_size
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER

	# Adjust font size if text is too long
	var font_size = 13  # Default font size
	while label.get_theme_font("font").get_string_size(text, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size).x > 290:
		font_size -= 1
	label.add_theme_font_size_override("font_size", font_size)

	rectangle.add_child(label)
	rectangle.gui_input.connect(_on_rectangle_clicked.bind(index))

	add_child(rectangle)
	rectangles.append(rectangle)

func adjust_positions():
	if rectangles.is_empty():
		return

	var viewport_size = get_viewport_rect().size
	var start_y = viewport_size.y * vertical_offset

	for i in range(rectangles.size()):
		var rectangle = rectangles[i]
		rectangle.position.x = (viewport_size.x - rectangle.custom_minimum_size.x) / 2
		rectangle.position.y = start_y + i * (60 + 30)

func _on_rectangle_clicked(event, index):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if active_rectangle:
			active_rectangle.queue_free()
			if active_index == index:
				active_rectangle = null
				active_index = -1
				return

		active_rectangle = create_new_rectangle(index)
		active_index = index

func create_new_rectangle(index):
	if index >= 0 and index < current_choices.size():
		var new_rect = ColorRect.new()
		new_rect.size = Vector2(200, 330)
		new_rect.position = rectangles[0].position + Vector2(406, -4)
		new_rect.color = Color(1, 1, 1, 0.9)

		var vbox = VBoxContainer.new()
		vbox.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		vbox.add_theme_constant_override("separation", 10)
		new_rect.add_child(vbox)

		var csv_row = current_choices[index]

		var name_label = Label.new()
		name_label.text = csv_row[0]
		name_label.add_theme_font_size_override("font_size", 20)
		name_label.set_autowrap_mode(TextServer.AUTOWRAP_WORD_SMART)
		name_label.add_theme_color_override("font_color", Color.BLACK)
		name_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		vbox.add_child(name_label)

		var description_label = Label.new()
		description_label.text = csv_row[3]
		description_label.set_autowrap_mode(TextServer.AUTOWRAP_WORD_SMART)
		description_label.size_flags_vertical = Control.SIZE_EXPAND_FILL
		description_label.add_theme_color_override("font_color", Color.BLACK)
		vbox.add_child(description_label)

		var spacer = Control.new()
		spacer.size_flags_vertical = Control.SIZE_EXPAND_FILL
		vbox.add_child(spacer)

		var accept_button = Button.new()
		accept_button.text = "Accept"
		accept_button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		accept_button.pressed.connect(_on_accept_pressed.bind(index))
		vbox.add_child(accept_button)

		add_child(new_rect)
		return new_rect

func _on_accept_pressed(index):
	print("Accepting law at index: ", index)  
	var csv_row = current_choices[index]
	var law_name = csv_row[0]
	
	var money_change = int(csv_row[1])
	var temperature_change = float(csv_row[2])
	
	GlobalVariables.currentMoney += money_change
	GlobalVariables.currentTemperature += temperature_change
	GlobalVariables.currentMoney = clamp(GlobalVariables.currentMoney, 0, 100)
	GlobalVariables.currentTemperature = clamp(GlobalVariables.currentTemperature, -50, 50)
	
	print("Accepted law:", law_name)
	print("Money change:", money_change, "-> Current Money:", GlobalVariables.currentMoney)
	print("Temperature change:", temperature_change, "-> Current Temperature:", GlobalVariables.currentTemperature)

	if active_rectangle:
		active_rectangle.queue_free()
		active_rectangle = null
		active_index = -1

	# Add law to accepted laws list and save
	accepted_law_names.append(law_name)
	save_accepted_laws()

	remove_choice(index)
	create_accepted_law_rectangle(law_name)
	adjust_positions()

func remove_choice(index):
	if index >= 0 and index < current_choices.size():
		current_choices.remove_at(index)
		create_rectangles()  # Recreate rectangles to reflect the removed choice

func create_accepted_law_rectangle(law_name):
	var new_rect = ColorRect.new()
	new_rect.custom_minimum_size = Vector2(160, 25)
	new_rect.color = Color(0.8, 0.8, 0.8, 0.9)

	var label = Label.new()
	label.text = law_name
	label.add_theme_color_override("font_color", Color.BLACK)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER

	# Adjust font size if text is too long
	var font_size = 10  # Default font size
	while label.get_theme_font("font").get_string_size(law_name, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size).x > 150:
		font_size -= 1
	label.add_theme_font_size_override("font_size", font_size)

	new_rect.add_child(label)
	accepted_law.append(new_rect)
	add_child(new_rect)
	adjust_accepted_law_positions()

func adjust_accepted_law_positions():
	for i in range(accepted_law.size()):
		var law_rect = accepted_law[i]
		law_rect.position = Vector2(145, 87 + i * 30)

####################################################
# Saving and Loading State (added logic)
####################################################

func load_accepted_laws():
	var config = ConfigFile.new()
	var err = config.load(SAVE_FILE_PATH)
	if err == OK:
		accepted_law_names = config.get_value("laws", "accepted", [])
	else:
		print("No previous accepted laws found or error loading save file.")

func save_accepted_laws():
	var config = ConfigFile.new()
	config.set_value("laws", "accepted", accepted_law_names)
	config.save(SAVE_FILE_PATH)

func create_accepted_law_rectangles():
	# Recreate rectangles for previously accepted laws
	for law_name in accepted_law_names:
		create_accepted_law_rectangle(law_name)
