extends CharacterBody2D

@export var speed := 300
@export var sprint_speed := 3000

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
	anim.sprite_frames.set_animation_loop("Rightsprint", true)
	anim.sprite_frames.set_animation_loop("Leftsprint", true)
	anim.animation_finished.connect(_on_animation_finished)

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("Left", "Right", "Up", "Down")

	if Input.is_action_just_pressed("Space") and not attacking:
		_play_attack_animation(direction)

	if not attacking:
		if Input.is_action_pressed("Shift") and energybar.value > 0:
			velocity = direction * sprint_speed
			_play_sprint_animation(direction)
		else:
			velocity = direction * speed
			_play_movement_animation(direction)

		move_and_slide()
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

func _play_sprint_animation(direction: Vector2) -> void:
	if direction == Vector2.ZERO:
		anim.play("Idle")
		return

	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			play_sprint_animation("Rightsprint")
		else:
			play_sprint_animation("Leftsprint")
	else:
		if direction.y > 0:
			play_sprint_animation("Rightsprint")
		else:
			play_sprint_animation("Leftsprint")

func play_sprint_animation(animation_name: String) -> void:
	if anim.animation != animation_name:
		anim.play(animation_name)

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
