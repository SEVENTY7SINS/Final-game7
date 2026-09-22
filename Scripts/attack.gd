extends Node2D

@export var attack_scene1: PackedScene
@export var attack_scene2: PackedScene
@export var attack_scene3: PackedScene
@export var attack_scene4: PackedScene

var weapon: PackedScene

func _ready() -> void:
	weapon = attack_scene4

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("1"):
		weapon = attack_scene1

	elif Input.is_action_just_pressed("2"):
		weapon = attack_scene2

	elif Input.is_action_just_pressed("3"):
		weapon = attack_scene3

	elif Input.is_action_just_pressed("4"):
		weapon = attack_scene4

	if Input.is_action_just_pressed("Space"):
		spawn_attack()

func spawn_attack() -> void:
	if weapon == null:
		return
	call_deferred("_create_attack")

func _create_attack() -> void:
	var attack_instance = weapon.instantiate()

	get_parent().add_child(attack_instance)

	attack_instance.global_position = global_position
	attack_instance.scale = Vector2(5, 5)
