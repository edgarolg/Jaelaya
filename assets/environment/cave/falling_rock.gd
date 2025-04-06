extends Node2D

@export var fall_speed := 400  # Velocidad de caída

func _ready():
	# La roca empieza a caer desde su posición inicial
	set_process(true)

func _process(delta):
	# Hacemos que la roca caiga hacia abajo a una velocidad constante
	position.y += fall_speed * delta  # La roca cae hacia abajo

	# Si la roca ha llegado al fondo de la pantalla, se elimina (opcional)
	if position.y > get_viewport().size.y:
		queue_free()  # Elimina la roca si ha caído fuera de la pantalla
