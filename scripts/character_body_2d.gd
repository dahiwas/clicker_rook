extends CharacterBody2D

@export var speed := 220.0
@export var accel := 1200.0
@export var friction := 1400.0

func _physics_process(delta):
	var input_dir := Vector2.ZERO
	input_dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_dir.y = Input.get_action_strength("ui_down")  - Input.get_action_strength("ui_up")
	input_dir = input_dir.normalized()

	var target_velocity := input_dir * speed

	# Aceleração / desaceleração suave
	if input_dir != Vector2.ZERO:
		velocity = velocity.move_toward(target_velocity, accel * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	move_and_slide()
