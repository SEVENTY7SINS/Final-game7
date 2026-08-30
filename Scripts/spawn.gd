extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_time = 5.0

@onready var player = $"../Player"

var timer = 0.0

func _process(delta: float) -> void:
	timer += delta

	if timer >= spawn_time:
		timer = 0.0
		spawn_enemy()

func spawn_enemy() -> void:
	var enemy = enemy_scene.instantiate()
	get_parent().add_child.call_deferred(enemy)

	enemy.global_position = global_position
	enemy.scale = Vector2(5, 5)
	enemy.set_player(player)
