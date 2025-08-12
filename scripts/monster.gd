extends CharacterBody2D

@export var life := 10
@export var attack_speed := 1200.0

@export var fase_path: NodePath
@export var system_path: NodePath
@onready var script_fase: Node = get_node(fase_path)
@onready var system_phase: Node = get_node(system_path)

func _ready():
	update_life_label()

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		dealth_life()

func dealth_life():
	life -= 1
	death_monster()
	update_life_label()
	
func death_monster():
	if life <= 0:
		system_phase.get_exp(5)
		if script_fase and script_fase.has_method("next_step"):
			script_fase.next_step()   # ou next_phase(), conforme o seu script da Fase
		life = 10

func update_life_label():
	$LifeLabel.text = "Vida: %d" % life
