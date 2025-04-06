extends Node

@export var scene_to_change: PackedScene
@export var time:int
func _ready():
	await get_tree().create_timer(time).timeout
	get_tree().change_scene_to_packed(scene_to_change)
