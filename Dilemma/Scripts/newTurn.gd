extends Label

# Timer variables
var timer : float = 0
var timer_active : bool = false
var wait_time : float = 3.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check if the label is visible
	if visible:
		if !timer_active:
			# Start the timer
			timer_active = true
			timer = 0.0  # Reset the timer

	if timer_active:
		# Update the timer
		timer += delta
		
		# Check if the time has elapsed
		if timer >= wait_time:
			# Make the label invisible
			visible = false
			timer_active = false  # Stop the timer
