extends Control

var max_hearts = 5
var current_hearts = 5

@onready var health_bar = $Control/TextureProgress

func _ready():
	update_health_bar()

# Función para reducir la salud
func take_damage(damage_amount):
	current_hearts -= damage_amount
	if current_hearts < 0:
		current_hearts = 0
	update_health_bar()

# Función para curarse
func heal(heal_amount):
	current_hearts += heal_amount
	if current_hearts > max_hearts:
		current_hearts = max_hearts
	update_health_bar()

# Función para actualizar la barra de vida
func update_health_bar():
	health_bar.value = current_hearts
