extends Control

@onready var pause_menu = $stopMenu
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pause_menu.hide() # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Money.value = GlobalVariables.currentMoney
	$Temperature.value = GlobalVariables.currentTemperature	
	if Input.is_action_just_pressed("TogglePause"):
		pauseMenu()
		
func _updateMoneyAndTemperature(lawMoney: int, lawTemperature: int) -> void:
	GlobalVariables.currentMoney += lawMoney
	GlobalVariables.currentTemperature += lawTemperature
	
	if GlobalVariables.currentMoney < 0:
		GlobalVariables.currentMoney = 0
	if GlobalVariables.currentTemperature < 0:
		GlobalVariables.currentTemperature = 0
	if GlobalVariables.currentMoney > 100:
		GlobalVariables.currentMoney = 100
	if GlobalVariables.currentTemperature > 100:
		GlobalVariables.currentTemperature = 100
		
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 1
		print(pause_menu.get_z_index())
	paused = !paused
