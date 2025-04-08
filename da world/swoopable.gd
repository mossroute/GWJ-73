extends Area2D
@onready var sprite = $AnimatedSprite2D


func _on_mouse_entered() -> void:
	GameState.can_swoop = true
	sprite.play("highlight")
	pass # Replace with function body.
func _on_mouse_exited() -> void:
	GameState.can_swoop = false
	sprite.play("fly")
	pass # Replace with function body.

func _on_body_entered(body):
	GameState.swooped = true
	GameState.can_swoop = false
	queue_free()
	pass # Replace with function body.
