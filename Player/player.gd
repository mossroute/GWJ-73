extends CharacterBody2D

@export var speed : float = 100
@export var acce : float = 10
@export var dash_spd : float = 500 
@export var swoop_spd : float = 850

var cursor_position = Vector2()
var can_dash = true
@onready var dtimer: Timer = $dashTimer
@onready var sprite = $AnimatedSprite2D
@onready var sfxplayer = $sfxplayer



func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("swoop") and GameState.can_swoop:
		cursor_position = get_global_mouse_position()
		sprite.play("dash")

		velocity = ((cursor_position - position).normalized()) * swoop_spd
	
	#basic movement
	var direction: Vector2 = Input.get_vector("left","right","up","down")
	if Input.is_action_pressed("dash") and can_dash: #dash
		velocity.x = dash_spd* direction.x
		velocity.y = dash_spd* direction.y
		dtimer.start()
		can_dash = false
		sprite.play("dash")
		sfxplayer.play()
	else: #walk
		velocity.x = move_toward(velocity.x, speed* direction.x, acce)
		velocity.y = move_toward(velocity.y, speed* direction.y, acce)
	if velocity.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	move_and_slide()
	

func _on_timer_timeout() -> void:
	can_dash = true
	sprite.play ("fly")
	pass # Replace with function body.
