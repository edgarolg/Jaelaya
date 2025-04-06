extends Node

@export var scene_to_change: PackedScene

func _ready():
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_packed(scene_to_change)
