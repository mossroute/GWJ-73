extends Node2D
@onready var plat1 = $mov_plat1/AnimationPlayer
@onready var plat2 = $mov_plat2/AnimationPlayer
@onready var plat3 = $mov_plat3/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	GameState.level = 5
	plat1.play("move")
	plat2.play("move")
	plat3.play("move")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	GameState.change_cursor()
	pass


func _on_winarea_body_entered(body):
	GameState.level = 0 
	get_tree().change_scene_to_file("res://menus/end.tscn")
	pass # Replace with function body.
