extends CharacterBody2D

@export var speed = 300
@export var sprint_speed = 3000

@onready var Mapportal = $"../Map/MapPort"
@onready var Baseportal = $"../Base/BasePort"
@onready var UI = $Control
@onready var energybar = $Control/Bar/energybar
@onready var store = $Store

var running = true

func _ready() -> void:
	pass

func _physics_process(delta):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")

	sprint(delta)

	if running and Input.is_action_pressed("Shift") and energybar.value > 0:
		velocity = direction * sprint_speed
	else:
		velocity = direction * speed
	
	move_and_slide()

func sprint(delta):
	if energybar.value <= 0:
		running = false
	else:
		running = true

func _on_portal_b_body_entered(body: Node2D) -> void:
	if body == self:
		global_position = Mapportal.global_position

func _on_portal_m_body_entered(body: Node2D) -> void:
	if body == self:
		global_position = Baseportal.global_position
