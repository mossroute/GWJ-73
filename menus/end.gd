extends Control
@onready var death_number = $"VBoxContainer/death number"


func _ready():
	death_number.text = str(GameState.deaths)

