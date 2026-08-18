extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$healthbar.value = (($slide.value)/4)+($healthbar.max_value * 3/4)
	$foodbar.value = (($slide.value)/4)+($healthbar.max_value * 3/4)
	$energybar.value = (($slide.value)/4)+($healthbar.max_value * 3/4)
	$Money.text = str("  Money: $") + str($slide.value * $slide.value * $slide.value)
	$Time.value = $slide.value
