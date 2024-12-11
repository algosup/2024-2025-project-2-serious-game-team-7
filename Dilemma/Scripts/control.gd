extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Money.value = GlobalVariables.currentMoney
	$Temperature.value = GlobalVariables.currentTemperature

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
