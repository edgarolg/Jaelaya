extends Node

@export var scene_to_change: PackedScene

func _ready():
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_packed(scene_to_change)
