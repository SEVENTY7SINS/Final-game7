extends CharacterBody2D

@export var speed = 300
@export var sprint_speed = 3000

@onready var Mapportal = $"../Map/MapPort"
@onready var Baseportal = $"../Base/BasePort"


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
		pass


func _on_portal_b_body_entered(body: Node2D) -> void:
	if body == self:
		global_position = Mapportal.global_position


func _on_portal_m_body_entered(body: Node2D) -> void:
	if body == self:
		global_position = Baseportal.global_position
