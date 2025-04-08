extends Node2D
@onready var moving_plat = $AnimatableBody2D/AnimationPlayer

func _ready():
	moving_plat.play("move")
# Called when the node enters the scene tree for the first time.
func _process(_delta):
	GameState.change_cursor()

