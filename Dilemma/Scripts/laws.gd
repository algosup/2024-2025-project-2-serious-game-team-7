extends Node2D

const RECTANGLE_COUNT = 4
var rectangles = []
var active_rectangle = null
var active_index = -1
var stored_variable = -1
var csv_data = []
var vertical_offset = 0.13  # Adjust this value to change vertical position (0 to 1)

const CSV_FILE_PATH = "res://data/laws.csv"

func _ready():
	create_rectangles()
	load_and_assign_csv_data()
	get_viewport().size_changed.connect(adjust_positions)

func create_rectangles():
	for i in range(RECTANGLE_COUNT):
		var rectangle = ColorRect.new()
		rectangle.custom_minimum_size = Vector2(300, 60)
		rectangle.color = Color(1, 1, 1, 0.9)
		
		var label = Label.new()
		label.text = "Label %d" % (i + 1)
		label.add_theme_color_override("font_color", Color.BLACK)
		label.size = rectangle.custom_minimum_size
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		
		rectangle.add_child(label)
		
		rectangle.gui_input.connect(_on_rectangle_clicked.bind(i))
		
		add_child(rectangle)
		rectangles.append(rectangle)
	
	adjust_positions()

func adjust_positions():
	var viewport_size = get_viewport_rect().size
	var total_height = RECTANGLE_COUNT * 60 + (RECTANGLE_COUNT - 1) * 30  # Height of rectangles + spacing
	var start_y = viewport_size.y * vertical_offset
	
	for i in range(RECTANGLE_COUNT):
		var rectangle = rectangles[i]
		rectangle.position.x = (viewport_size.x - rectangle.custom_minimum_size.x) / 2
		rectangle.position.y = start_y + i * (60 + 30)  # 60 is height, 30 is spacing

func _on_rectangle_clicked(event, index):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if active_rectangle:
			active_rectangle.queue_free()
			if active_index == index:
				active_rectangle = null
				active_index = -1
				stored_variable = -1
				print("Deselected. Stored variable: ", stored_variable)
				return
		
		active_rectangle = create_new_rectangle(index)
		active_index = index
		stored_variable = index

func create_new_rectangle(index):
	var new_rect = ColorRect.new()
	new_rect.size = Vector2(200, 330)
	new_rect.position = rectangles[0].position + Vector2(406, -4)
	new_rect.color = Color(1, 1, 1, 0.9)
	
	var vbox = VBoxContainer.new()
	vbox.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	vbox.add_theme_constant_override("separation", 10)
	new_rect.add_child(vbox)
	
	var name_label = Label.new()
	name_label.text = csv_data[index + 1][0]
	name_label.add_theme_font_size_override("font_size", 20)
	name_label.set_autowrap_mode(TextServer.AUTOWRAP_WORD_SMART)
	name_label.add_theme_color_override("font_color", Color.BLACK)
	name_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vbox.add_child(name_label)
	
	var description_label = Label.new()
	description_label.text = csv_data[index + 1][3]
	description_label.set_autowrap_mode(TextServer.AUTOWRAP_WORD_SMART)
	description_label.size_flags_vertical = Control.SIZE_EXPAND_FILL
	description_label.add_theme_color_override("font_color", Color.BLACK)
	vbox.add_child(description_label)

	var accept_button = Button.new()
	accept_button.text = "Accept"
	accept_button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	accept_button.pressed.connect(_on_accept_pressed.bind(index))
	vbox.add_child(accept_button)

	add_child(new_rect)
	return new_rect

func _on_accept_pressed(index):
	var law_name = csv_data[index + 1][0]
	var money_change = int(csv_data[index + 1][1])
	var temperature_change = float(csv_data[index + 1][2])
	
	GlobalVariables.currentMoney += money_change
	GlobalVariables.currentTemperature += temperature_change
	
	GlobalVariables.currentMoney = clamp(GlobalVariables.currentMoney, 0, 100)
	GlobalVariables.currentTemperature = clamp(GlobalVariables.currentTemperature, -50, 50)
	
	print("Accepted law:", law_name)
	print("Money change:", money_change, "-> Current Money:", GlobalVariables.currentMoney)
	print("Temperature change:", temperature_change, "-> Current Temperature:", GlobalVariables.currentTemperature)

func get_stored_variable():
	return stored_variable

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

func load_and_assign_csv_data():
	csv_data = load_csv(CSV_FILE_PATH)
	if csv_data.size() > 1:
		for i in range(1, min(csv_data.size(), rectangles.size() + 1)):
			var row = csv_data[i]
			if row.size() > 3:
				var label = rectangles[i - 1].get_child(0) as Label
				label.text = row[0]
	else:
		print("No data available in CSV (or only header present).")
