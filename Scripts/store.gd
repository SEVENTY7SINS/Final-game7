extends CanvasLayer

@onready var UI = $"../Control"
@onready var theon = $theon

func _ready() -> void:
	theon.pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	UI.receive_value(100)
