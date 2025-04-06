extends Node

@export var scene_to_change: PackedScene

func _process(_delta):
	if Input.is_action_just_pressed("click"):  # "Enter" por defecto
		get_tree().change_scene_to_packed(scene_to_change)
