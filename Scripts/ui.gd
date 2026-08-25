extends CanvasLayer
@onready var Sun = $Time/Sun
@onready var Timebar = $Time
@onready var chick = 0
@onready var Days = $Days
@onready var Money = $Money
@onready var healthbar = $Bar/healthbar
@onready var foodbar = $Bar/foodbar
@onready var energybar = $Bar/energybar
@onready var daysalive = $Time/Title

var energy = 0
var energyregen = 0
var dayson = 1
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
	info(delta)
	regen(delta)
	if Input.is_action_pressed("Control"):
		energybar.value -= 5
	if Input.is_action_pressed("1"):
		chick += 1
	Timebar.value = Days.time_left

func bar(delta):
	healthbar.value = ((chick)/4)+(healthbar.max_value * 3/4)
	foodbar.value = ((chick)/4)+(healthbar.max_value * 3/4)
	energybar.value = ((energy)/4)+(healthbar.max_value * 3/4)

func info(delta):
		Money.text = str("  Money: $") + str(chick)
		daysalive.text = str("  Days alive ") + str(dayson)

func sun(delta):
	var percentage = Timebar.value / Timebar.max_value
	Sun.position.x = percentage * Timebar.size.x
	Sun.offset_transform_rotation += .01

func time(delta):
	if $Time.value == $Time.max_value:
		$Time.value = 0

func regen(delta):
	if energybar.value >= healthbar.max_value:
		energyregen = 0
	elif energybar.value < healthbar.max_value:
		energyregen += .001
		energy += energyregen

func _on_days_timeout() -> void:
	dayson += 1
