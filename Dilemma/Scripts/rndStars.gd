extends Label

# Outer and inner radii for the star
const OUTER_RADIUS = 10
const INNER_RADIUS = 5

# Distance between stars
const STAR_SPACING = 35

# Offset to move the stars to the right
const STAR_OFFSET_X = 25

# Colors for the stars
const STAR_COLOR_ACTIVE = Color.GREEN
const STAR_COLOR_INACTIVE = Color.WHITE

# Array to store the number of active stars for each label
var star_array = []

func _ready():
	# Load star_array dynamically
	load_star_array()
	print("Loaded star_array: ", star_array)
	
	# Get the index of the current label based on its name
	var label_index = get_label_index()
	print("Label name: ", name, ", Index: ", label_index)
	
	# Generate stars under the label and color them based on the array
	if label_index >= 0 and label_index < star_array.size():
		generate_stars(star_array[label_index])
	else:
		push_error("Invalid label index or star_array not loaded properly.")

func load_star_array():
	# Directly access the rndLevels array from GlobalVariables autoload
	if not GlobalVariables.rndLevels or GlobalVariables.rndLevels.size() == 0:
		push_error("rndLevels in GlobalVariables.gd is invalid or empty.")
		star_array = [0, 0, 0, 0, 0, 0]  # Fallback array
	else:
		star_array = GlobalVariables.rndLevels

# Function to map label names to indices
func get_label_index() -> int:
	var labels = ["Solar", "Fusion", "Fision", "Hydro", "Duo", "Wind"]
	var index = labels.find(name)
	return index

# Function to generate stars with color based on star_array value
func generate_stars(active_count: int):
	if active_count < 0 or active_count > 5:
		push_error("Invalid active_count: " + str(active_count))
		return
	for i in range(5):  # Always generate 5 stars
		var star = create_star(OUTER_RADIUS, INNER_RADIUS, 5, STAR_COLOR_INACTIVE)
		star.position = Vector2(STAR_OFFSET_X + i * STAR_SPACING, size.y + 15)
		
		# Set the color based on whether the star is active
		if i < active_count:
			star.color = STAR_COLOR_ACTIVE
		
		add_child(star)

# Function to create a star shape
func create_star(outer_radius: float, inner_radius: float, points: int, color: Color) -> Polygon2D:
	var polygon = Polygon2D.new()
	var vertices = []
	var angle_step = TAU / (points * 2)  # Angle between each vertex (inner/outer alternating)

	for i in range(points * 2):
		var angle = i * angle_step
		var radius = outer_radius if i % 2 == 0 else inner_radius  # Alternate between outer and inner radius
		var x = cos(angle) * radius
		var y = sin(angle) * radius
		vertices.append(Vector2(x, y))

	polygon.polygon = vertices
	polygon.color = color  # Set the initial star color
	return polygon
