extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var currentMoney = 50
var currentTemperature = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Money.value = currentMoney
	$Temperature.value = currentTemperature
