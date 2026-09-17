extends CharacterBody2D

@export var speed := 300
@export var sprint_speed := 3000

@onready var Mapportal := $"../Map/MapPort"
@onready var Baseportal := $"../Base/BasePort"
@onready var UI := $Control
@onready var energybar := $Control/Bar/energybar
@onready var store := $Store
@onready var anim := $CollisionShape2D/AnimatedSprite2D

var running := true

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("Left", "Right", "Up", "Down")

	if running and Input.is_action_pressed("Shift") and energybar.value > 0:
		velocity = direction * sprint_speed
		energybar.value = max(energybar.value - 20 * delta, 0)
	else:
		velocity = direction * speed
		if energybar.value < energybar.max_value:
			energybar.value = min(energybar.value + 10 * delta, energybar.max_value)

	move_and_slide()
	_play_movement_animation(direction)

func _play_movement_animation(direction: Vector2) -> void:
	if direction == Vector2.ZERO:
		anim.play("Idle")
		return

	if abs(direction.x) > abs(direction.y) and !Input.is_action_pressed("Shift"):
		if direction.x > 0:
			anim.play("Right")
		else:
			anim.play("Left")
	else:
		if direction.y > 0:
			anim.play("Down")
		else:
			anim.play("Up")
	
	if abs(direction.x) > abs(direction.y) and Input.is_action_pressed("Shift"):
		if direction.x > 0:
			anim.play("Right")
		else:
			anim.play("Left")
	else:
		if direction.y > 0:
			anim.play("Down")
		else:
			anim.play("Up")

func _on_portal_m_body_entered(body: Node2D) -> void:
	if body == self:
		global_position = Mapportal.global_position

func _on_base_portal_body_entered(body: Node2D) -> void:
	if body == self:
		global_position = Baseportal.global_position

func _on_area_2d_body_entered(body: Node2D) -> void:
	pass
