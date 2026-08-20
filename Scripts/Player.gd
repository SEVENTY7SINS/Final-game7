extends CharacterBody2D

@export var speed = 300
@export var sprint_speed = 3000

var timer = 2.0
var runtimer = 3.0
var running = true


func _physics_process(delta):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")

	sprint(delta)

	if running and Input.is_action_pressed("Shift"):
		velocity = direction * sprint_speed
	else:
		velocity = direction * speed

	move_and_slide()


func sprint(delta):
	if Input.is_action_pressed("Shift") and running:
		timer -= delta

		if timer <= 0:
			timer = 0
			running = false

	elif not Input.is_action_pressed("Shift") and timer < 2.0:
		runtimer -= delta

		if runtimer <= 0:
			timer = 2.0
			runtimer = 3.0
			running = true
