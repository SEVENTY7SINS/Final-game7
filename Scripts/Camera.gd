extends Node2D

@onready var limit = 1
@onready var Player = $Player
const zomo = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Up") and Player.position.y >= position.y:
		position.y -= 10 * limit
	if Input.is_action_pressed("Down") and Player.position.y <= position.y:
		position.y += 10  * limit
	if Input.is_action_pressed("Right") and Player.position.x >= position.x:
		position.x += 10 * limit
	if Input.is_action_pressed("Left") and Player.position.x <= position.x:
		position.x -= 10  * limit
	if Input.is_action_pressed("Shift"):
		limit = 10
	if !Input.is_action_pressed("Shift"):
		limit = 1
	position.x = clamp(position.x, 550, 6000)
	position.y = clamp(position.y, 300, 3850)
