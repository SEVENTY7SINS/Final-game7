extends Camera2D

@export var player: CharacterBody2D
var map = false
var base = true

func _ready():
	enabled = true
	update_camera_limits()

func _process(delta):
	if player:
		global_position = player.global_position

func update_camera_limits():
	if base:
		limit_left = 0
		limit_right = 6560
		limit_top = 0
		limit_bottom = 4158

	elif map:
		limit_left = 6650
		limit_right = 20400
		limit_top = 0
		limit_bottom = 6650

func _on_portal_b_body_entered(body: Node2D) -> void:
	if body == player:
		map = true
		base = false
		update_camera_limits()


func _on_portal_m_body_entered(body: Node2D) -> void:
	if body == player:
		map = false
		base = true
		update_camera_limits()
