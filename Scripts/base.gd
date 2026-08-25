extends Node2D

@onready var Portal = $Portal
@onready var BPortal = $BasePort

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	Portal.rotation_degrees -= .1
	BPortal.rotation_degrees -= .1
