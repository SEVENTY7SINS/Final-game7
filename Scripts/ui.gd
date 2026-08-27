extends CanvasLayer

@onready var Sun = $Time/Sun
@onready var Timebar = $Time
@onready var Days = $Days
@onready var Money = $Money
@onready var healthbar = $Bar/healthbar
@onready var foodbar = $Bar/foodbar
@onready var energybar = $Bar/energybar
@onready var daysalive = $Time/Title

var chick = 0
var energy = 0.0
var dayson = 1

@export var healing_factor = 2.0
@export var healing_acceleration = 1.0
@export var max_healing_speed = 20.0

var heal_timer = 0.0
var healing_speed = 0.0

func _ready() -> void:
	Timebar.max_value = Days.wait_time
	Timebar.value = Days.wait_time
	Days.start()
	energy = energybar.max_value / 4.0
	energybar.value = energy

func _process(delta: float) -> void:
	time(delta)
	info(delta)
	sun(delta)
	energy_drain(delta)
	energy_regen(delta)

	chick += 1

	Timebar.value = Days.time_left

func info(delta):
	Money.text = "  Money: $" + str(chick)
	daysalive.text = "  Days alive " + str(dayson)

func sun(delta):
	if Timebar.max_value > 0:
		var percentage = Timebar.value / Timebar.max_value
		Sun.position.x = percentage * Timebar.size.x

func time(delta):
	if Timebar.value <= 0:
		Timebar.value = Timebar.max_value

func energy_drain(delta):
	if Input.is_action_pressed("Shift"):
		energy -= 10.0 * delta
		healing_speed = 0.0

	energy = clamp(energy, 0, energybar.max_value / 4.0)
	energybar.value = energy

func energy_regen(delta):
	if Input.is_action_pressed("Shift"):
		healing_speed = 0.0
		return

	if heal_timer > 0:
		heal_timer -= delta
		healing_speed = 0.0
		return

	if energy >= energybar.max_value / 4.0:
		energy = energybar.max_value / 4.0
		energybar.value = energy
		healing_speed = 0.0
		return

	if healing_speed == 0.0:
		healing_speed = healing_factor
	else:
		healing_speed += healing_acceleration * delta

	healing_speed = min(healing_speed, max_healing_speed)

	energy += healing_speed * delta
	energy = clamp(energy, 0, energybar.max_value / 4.0)
	energybar.value = energy

func energy_hit():
	energy -= 10.0
	energy = clamp(energy, 0, energybar.max_value / 4.0)
	energybar.value = energy

	heal_timer = 1.0
	healing_speed = 0.0

func _on_days_timeout() -> void:
	dayson += 1

func receive_value(value):
	print("Received: ", value)
	if chick > value:
		chick -= value
	else:
		print("poor ass")
