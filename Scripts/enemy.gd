extends CharacterBody2D

@export var speed = 150.0

var player: CharacterBody2D = null

@export var attack_air: PackedScene
@export var attackearth: PackedScene
@export var attack_fire: PackedScene
@export var attack_water: PackedScene

@onready var health = $Health

func set_player(target: CharacterBody2D) -> void:
	player = target

func _physics_process(delta: float) -> void:
	if player == null:
		return

	var direction = global_position.direction_to(player.global_position)

	if health.value <= 0:
		queue_free()
		return

	if global_position.distance_to(player.global_position) > 5.0:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func _on_defence_area_area_entered(area: Area2D) -> void:
	print("AREA ENTERED")
	print("Area name: ", area.name)
	print("Area parent: ", area.get_parent().name)
	print("Area parent type: ", area.get_parent().get_class())
