extends Node2D
class_name Monster

@export var type: MonsterType

@export var fase_path: NodePath
@export var system_path: NodePath
@onready var script_fase: Node = get_node(fase_path)
@onready var system_phase: Node = get_node(system_path)


var life: int = 1

func _ready() -> void:
	if type:
		_apply_type()
	update_life_label()

func _apply_type() -> void:
	life = type.health
	if has_node("AnimationPlayer"):
		$AnimationPlayer.playback_speed = max(type.animation_speed, 0.01)
	update_life_label()



func dealth_life():
	life -= 1
	print(life)
	death_monster()
	update_life_label()

func death_monster():
	if life <= 0:
		if system_phase and system_phase.has_method("get_exp"):
			system_phase.get_exp(type.experience_reward)
		if system_phase and system_phase.has_method("add_gold"):
			system_phase.add_gold(type.gold_reward)
		if type.possible_loot:
			_drop_loot_from_type()
		if script_fase and script_fase.has_method("next_step"):
			script_fase.next_step()
		life = type.health
		update_life_label()
		delete_self()

func _drop_loot_from_type() -> void:
	for loot in type.possible_loot:
		if randf() <= loot.drop_chance:
			_spawn_loot(loot)  # <- existe (stub abaixo), então o editor não acusa erro

func _spawn_loot(loot) -> void:
	# Implementar: instanciar cena do item, posicionar, etc.
	pass

func update_life_label():
	var n: String = type.name if type else "Monstro"

func delete_self() -> void:
	queue_free()
