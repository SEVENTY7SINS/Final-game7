extends Node2D

@onready var limit = 1
@onready var Player = $Player
@onready var Camera = $Camera

var timer = 2.0
var runtimer = 3.0
var running = true
var speed = 30


func _process(delta: float) -> void:
	movement(delta)
	clamping(delta)
	sprint(delta)


func movement(delta):
	if Input.is_action_pressed("Up") and Player.position.y <= Camera.position.y:
		position.y -= speed * limit

	if Input.is_action_pressed("Down") and Player.position.y >= Camera.position.y:
		position.y += speed * limit

	if Input.is_action_pressed("Right") and Player.position.x >= Camera.position.x:
		position.x += speed * limit

	if Input.is_action_pressed("Left") and Player.position.x <= Camera.position.x:
		position.x -= speed * limit


func clamping(delta):
	position.x = clamp(position.x, 7250, 19800)
	position.y = clamp(position.y, 300, 6350)


func sprint(delta):
	# Holding Shift and sprint is available
	if Input.is_action_pressed("Shift") and running:
		limit = 10
		timer -= delta

		# Sprint has run out
		if timer <= 0:
			timer = 0
			running = false
			limit = 1
			print("Sprint finished!")

	# Shift released while sprint has been used
	elif not Input.is_action_pressed("Shift") and timer < 2.0:
		limit = 1
		runtimer -= delta

		# Recharge finished
		if runtimer <= 0:
			timer = 2.0
			runtimer = 3.0
			running = true
			print("Sprint ready!")
