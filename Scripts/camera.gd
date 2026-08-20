extends Camera2D

@export var map_left = 7250
@export var map_right = 19800
@export var map_top = 300
@export var map_bottom = 6350

@export var follow_speed = 5.0


func _ready():
	limit_left = map_left
	limit_right = map_right
	limit_top = map_top
	limit_bottom = map_bottom
	
	position_smoothing_enabled = true
	position_smoothing_speed = follow_speed
