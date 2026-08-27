extends CharacterBody2D

@export var speed = 300
@export var sprint_speed = 3000

@onready var Mapportal = $"../Map/MapPort"
@onready var Baseportal = $"../Base/BasePort"
@onready var UI = $Control
@onready var energybar = $Control/Bar/energybar

var running = true
var maxenergy
var minenergy

func _ready() -> void:
	pass

func _physics_process(delta):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")

	sprint(delta)
	if running and Input.is_action_pressed("Shift"):
		velocity = direction * sprint_speed
	else:
		velocity = direction * speed
	move_and_slide()
	
	maxenergy = energybar.max_value
	minenergy = (energybar.max_value/3)*4
	
	print(energybar.value)

func sprint(delta):
	if Input.is_action_pressed("Shift") and running and energybar.value >= minenergy:
		running = true
	else:
		running = true

func _on_portal_b_body_entered(body: Node2D) -> void:
	if body == self:
		global_position = Mapportal.global_position

func _on_portal_m_body_entered(body: Node2D) -> void:
	if body == self:
		global_position = Baseportal.global_position
