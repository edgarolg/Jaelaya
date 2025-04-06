extends CharacterBody2D

@export var speed: float = 300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var actionable_finder: Area2D = $Direction/ActionableFinder

var last_direction: String = "idle"
var is_attacking: bool = false
var max_health := 5
var health := max_health
signal health_changed(new_health: int)

var has_shown_dialogue := false

func _physics_process(_delta):
	var input_vector = Vector2.ZERO

	if is_attacking:
		return
	
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	
	velocity = input_vector * speed
	move_and_slide()

	var actionable = actionable_finder.get_overlapping_areas()

	if actionable.size() > 0 and not has_shown_dialogue and is_in_office_scene():
		has_shown_dialogue = true
		DialogueManager.show_example_dialogue_balloon(load("res://scenes/office/talk.dialogue"), "start")

	if actionable.size() == 0:
		has_shown_dialogue = false

	if input_vector != Vector2.ZERO:
		if abs(input_vector.x) > abs(input_vector.y):
			if input_vector.x > 0:
				animated_sprite.play("right")
				last_direction = "right"
			else:
				animated_sprite.play("left")
				last_direction = "left"
		else:
			if input_vector.y > 0:
				animated_sprite.play("down")
				last_direction = "down"
			else:
				animated_sprite.play("up")
				last_direction = "up"
	else:
		animated_sprite.play("idle")

	if Input.is_action_just_pressed("attack"):
		is_attacking = true
		match last_direction:
			"left":
				animated_sprite.play("attack_L")
			"right":
				animated_sprite.play("attack_R")
			"up":
				animated_sprite.play("attack_U")
			"down":
				animated_sprite.play("attack_D")
		await animated_sprite.animation_finished
		is_attacking = false

func take_damage(amount: int):
	health = max(0, health - amount)
	emit_signal("health_changed", health)	
	
	if health <= 0:
		die()

func die():
	print("Game Over")

func is_in_office_scene() -> bool:
	return get_tree().current_scene.scene_file_path.contains("scenes/office")
