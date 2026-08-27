extends CharacterBody2D

@export var speed = 100
@export var stop_distance = 50

var player


func _ready():
	player = get_tree().get_first_node_in_group("player")


func _physics_process(delta):
	if player:
		var distance = global_position.distance_to(player.global_position)

		if distance > stop_distance:
			var direction = global_position.direction_to(player.global_position)
			velocity = direction * speed
		else:
			velocity = Vector2.ZERO
		move_and_slide()
