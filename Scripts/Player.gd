extends CharacterBody2D

@export var speed := 300

@onready var Mapportal := $"../Map/MapPort"
@onready var Baseportal := $"../Base/BasePort"
@onready var UI := $Control
@onready var energybar := $Control/Bar/energybar
@onready var store := $Store
@onready var anim := $AnimatedSprite2D
@onready var attack := $Attack

var attacking := false

func _ready() -> void:
	anim.sprite_frames.set_animation_loop("Rights", false)
	anim.sprite_frames.set_animation_loop("Lefts", false)
	anim.sprite_frames.set_animation_loop("Downs", false)
	anim.sprite_frames.set_animation_loop("Ups", false)
	anim.animation_finished.connect(_on_animation_finished)

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("Left", "Right", "Up", "Down")

	if Input.is_action_just_pressed("Space") and not attacking:
		_play_attack_animation(direction)

	if not attacking:
		velocity = direction * speed
		move_and_slide()
		_play_movement_animation(direction)
	else:
		velocity = Vector2.ZERO

func _play_movement_animation(direction: Vector2) -> void:
	if direction == Vector2.ZERO:
		anim.play("Idle")
		return

	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			anim.play("Right")
		else:
			anim.play("Left")
	else:
		if direction.y > 0:
			anim.play("Down")
		else:
			anim.play("Up")

func _play_attack_animation(direction: Vector2) -> void:
	if direction == Vector2.ZERO:
		return

	attacking = true

	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			anim.play("Rights")
		else:
			anim.play("Lefts")
	else:
		if direction.y > 0:
			anim.play("Downs")
		else:
			anim.play("Ups")

func _on_animation_finished() -> void:
	if anim.animation == "Rights" or anim.animation == "Lefts" or anim.animation == "Downs" or anim.animation == "Ups":
		attacking = false

func _on_portal_m_body_entered(body: Node2D) -> void:
	if body == self:
		global_position = Baseportal.global_position

func _on_portal_b_body_entered(body: Node2D) -> void:
	if body == self:
		global_position = Mapportal.global_position
		print("Hi")
