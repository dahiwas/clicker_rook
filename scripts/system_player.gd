extends Node

@export var name_player := "Dahiwas"
@export var exp := 0

func _ready():
	update_exp_label()

func get_exp(value: int):
	exp += value
	update_exp_label()

func update_exp_label():
	$ExpLabel.text = "Experience: %d" % [exp]
