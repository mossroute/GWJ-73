extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	GameState.deaths = 0
	GameState.level = 1
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	GameState.change_cursor()
	pass

func _on_winarea_body_entered(body):
	GameState.change_level()
	pass # Replace with function body.
