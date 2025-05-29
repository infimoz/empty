extends CharacterBody2D

@onready var animatedSprite = $AnimatedSprite2D
@export var speed: int = 200

func _process(delta):
	if velocity.length() > 0:
		var angle = velocity.angle()
		
		# Преобразуем в целое число перед использованием %
		var direction_index = int(round(angle / TAU * 8)) % 8
		
		animatedSprite.play("walk_" + str(direction_index))
	else:
		animatedSprite.play("idle")

func _physics_process(delta):
	var input = Vector2(
		Input.get_axis("+a", "+d"),
		Input.get_axis("+w", "+s")
	)
	
	if input.length() > 0:
		input = input.normalized()
		
	velocity = input * speed
	move_and_slide()
