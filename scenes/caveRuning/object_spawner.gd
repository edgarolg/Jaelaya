extends Node2D

@export var object_scene: PackedScene  # Escena del objeto que caerá
@export var spawn_range_x: Vector2 = Vector2(-600, 600)  # Rango horizontal para la generación
@export var spawn_height: float = -100  # Altura desde donde caerán los objetos
@export var fall_speed: float = 200  # Velocidad de caída
@export var spawn_interval: float = 1.0  # Intervalo entre la generación de objetos (en segundos)
@export var jugador: CharacterBody2D  # Así puedes asignarlo desde el editor

var timer: Timer

func _ready():
	# Crear un temporizador que generará objetos cada cierto tiempo
	timer = Timer.new()
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	timer.start(spawn_interval)  # Inicia el temporizador

# Función que se llama cuando el temporizador se acaba
func _on_timer_timeout():
	spawn_object()

# Función que genera un objeto en una posición aleatoria cerca del jugador
func spawn_object():
	var obj = object_scene.instantiate()  # Creamos una instancia del objeto
	# Calculamos un desplazamiento aleatorio cerca del jugador en el eje X
	var random_x = jugador.position.x + randf_range(-100, 100)  # Generar una posición aleatoria en X cerca del jugador
	obj.position = Vector2(random_x, spawn_height)  # Establecemos la posición de la roca
	add_child(obj)  # Añadimos la roca a la escena
