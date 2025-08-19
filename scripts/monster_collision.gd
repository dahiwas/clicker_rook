extends CharacterBody2D

@export var monster_path: NodePath

@onready var monster_parent = get_node(monster_path) as Monster

@onready var sprite2d: Sprite2D = $Sprite2D
@onready var life_label: Label = $LifeLabel

@onready var auto_timer: Timer = Timer.new()

func _ready() -> void:
	add_child(auto_timer)
	auto_timer.wait_time = 1.0
	auto_timer.one_shot = false
	auto_timer.autostart = true
	auto_timer.timeout.connect(_on_auto_timer_timeout)

func _on_auto_timer_timeout() -> void:
	if $RectAttack.visible == true:
		monster_parent.dealth_life()
	else:
		auto_timer.stop()  # para se o alvo sumir

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		$RectAttack.visible = true
		auto_timer.start()  # começa o ataque recorrente só quando clicar
		monster_parent.dealth_life()
