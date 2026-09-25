extends CharacterBody2D

@export var speed: float = 250.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var facing: String = "down"


func _physics_process(_delta: float) -> void:
	var input_dir: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	velocity = input_dir * speed
	velocity.y *= 0.5
	move_and_slide()

	if input_dir != Vector2.ZERO:
		facing = get_direction_name(input_dir)
		play_animation("walk_" + facing)
	else:
		play_animation("idle_" + facing)


func get_direction_name(dir: Vector2) -> String:
	var vertical: String = ""
	if dir.y < 0:
		vertical = "up"
	elif dir.y > 0:
		vertical = "down"

	var horizontal: String = ""
	if dir.x < 0:
		horizontal = "left"
	elif dir.x > 0:
		horizontal = "right"

	if vertical != "" and horizontal != "":
		return vertical + "_" + horizontal
	return vertical + horizontal


func play_animation(anim: String) -> void:
	if sprite.sprite_frames.has_animation(anim):
		sprite.play(anim)
	else:
		sprite.stop()
