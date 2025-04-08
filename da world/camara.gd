extends Camera2D

@export var random_stregnth : float = 6.0
@export var shake_fade : float = 15.0

var rng = RandomNumberGenerator.new()
var shake_strenght : float = 0.0
@onready var catchsound = $catchsound

@onready var cooldown = $cooldown


func _process(delta):
	if GameState.swooped == true:
		catchsound.play()
		apply_shake()
		zoom.x = lerpf(zoom.x, 2, 2)
		zoom.y = lerpf(zoom.y, 2, 2)
	else:
		zoom.x = lerpf(zoom.x,1,1*delta)
		zoom.y = lerpf(zoom.y,1,1*delta)
	
	if shake_strenght > 0:
		shake_strenght = lerpf(shake_strenght,0,shake_fade * delta)
		offset = randomOffset()

func apply_shake():
	shake_strenght = random_stregnth
	cooldown.start()
	await _on_cooldown_timeout()
	pass

func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strenght, shake_strenght), rng.randf_range(-shake_strenght, shake_strenght))

func _on_cooldown_timeout():
	GameState.swooped = false
	pass # Replace with function body.
