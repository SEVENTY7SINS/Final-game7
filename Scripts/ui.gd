extends Control
@onready var Sun = $Time/Sun
@onready var Timebar = $Time
@onready var chick = 0
@onready var Days = $Days
@onready var Money = $Money
@onready var healthbar = $Bar/healthbar
@onready var foodbar = $Bar/foodbar
@onready var energybar = $Bar/energybar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Timebar.max_value = Days.wait_time
	Timebar.value = Days.wait_time
	Days.start()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time(delta)
	bar(delta)
	sun(delta)
	if Input.is_action_pressed("1"):
		chick += 1
	Timebar.value = Days.time_left

func bar(delta):
	healthbar.value = ((chick)/4)+(healthbar.max_value * 3/4)
	foodbar.value = ((chick)/4)+(healthbar.max_value * 3/4)
	energybar.value = ((chick)/4)+(healthbar.max_value * 3/4)
	Money.text = str("  Money: $") + str(chick)

func sun(delta):
	var percentage = Timebar.value / Timebar.max_value
	Sun.position.x = percentage * Timebar.size.x
	Sun.offset_transform_rotation += .01

func time(delta):
	if $Time.value == $Time.max_value:
		$Time.value = 0
