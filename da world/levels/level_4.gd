extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	GameState.level = 3
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	GameState.change_cursor()
	pass


func _on_winarea_body_entered(body):
	get_tree().change_scene_to_file("res://da world/levels/level_3.tscn")
	pass # Replace with function body.
