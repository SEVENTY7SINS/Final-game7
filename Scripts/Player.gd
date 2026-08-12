extends Node2D

@onready var limit = 1
@onready var number_value = 1
const zomo = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Up"):
		position.y -= 10 * limit
	if Input.is_action_pressed("Down"):
		position.y += 10  * limit
	if Input.is_action_pressed("Right"):
		position.x += 10 * limit
	if Input.is_action_pressed("Left"):
		position.x -= 10  * limit
	
	position.x = clamp(position.x, 600, 5160)
	position.y = clamp(position.y, 300, 3150)
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			number_value = min(number_value + .1, 100)

		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			number_value = max(number_value - .1, 0)
