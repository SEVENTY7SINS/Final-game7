extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Up"):
		position.y -=10
	if Input.is_action_pressed("Down"):
		position.y +=10
	if Input.is_action_pressed("Right"):
		position.x +=10
	if Input.is_action_pressed("Left"):
		position.x -=10
