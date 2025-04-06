extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite.play("idle")  # Reproduce la animación idle por defecto

func _process(delta: float) -> void:
	if velocity.length() == 0:
		if animated_sprite.animation != "idle":
			animated_sprite.play("idle")
