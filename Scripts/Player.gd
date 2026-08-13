extends CharacterBody2D

const zomo = 1
@export var speed = 300


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * speed
	position.x = clamp(position.x, -100, 100)
	position.y = clamp(position.y, -100, 100)
	move_and_slide()
