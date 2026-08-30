extends CharacterBody2D

@export var speed = 150.0

var player: CharacterBody2D = null

func set_player(target: CharacterBody2D) -> void:
	player = target

func _physics_process(delta: float) -> void:
	if player == null:
		return

	var direction = global_position.direction_to(player.global_position)

	if global_position.distance_to(player.global_position) > 5.0:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == player:
		print("hello world")
