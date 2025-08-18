extends CharacterBody2D

@export var monster_parent = Monster

@onready var sprite2d: Sprite2D = $Sprite2D
@onready var life_label: Label = $LifeLabel



func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		monster_parent.dealth_life()
