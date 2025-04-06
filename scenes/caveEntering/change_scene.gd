extends Area2D

@export var scene_to_load: PackedScene  # Puedes arrastrar la escena desde el editor aquí

func _on_body_entered(body):
	if body.name == "Reportero":  # Asegúrate de que el nodo jugador se llama "Player"
		if scene_to_load:
			get_tree().change_scene_to_packed(scene_to_load)
