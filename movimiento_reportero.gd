extends CharacterBody2D

# Speed of the character
@export var speed: float = 300.0

# Reference to the AnimatedSprite2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	# Read input
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()  # Prevent faster diagonal movement
	
	# Move the character
	velocity = input_vector * speed
	move_and_slide()

	# Handle animation based on direction
	if input_vector != Vector2.ZERO:
		if abs(input_vector.x) > abs(input_vector.y):
			if input_vector.x > 0:
				animated_sprite.play("right")
			else:
				animated_sprite.play("left")
		else:
			if input_vector.y > 0:
				animated_sprite.play("down")
			else:
				animated_sprite.play("up")
	else:
		animated_sprite.stop()
