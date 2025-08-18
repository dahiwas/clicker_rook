# res://scripts/GameManager.gd
class_name GameManager
extends Node

@export var world_scenes: Array[PackedScene] = []  # scenes cujo root é WorldView
@export var world_root: NodePath = ^"."

@export var player_level: int = 1
@export var player_experience: int = 0

var current_world_view: WorldView = null

func _ready() -> void:
	if world_scenes.size() > 0:
		change_world_by_index(0)

func change_world_by_index(i: int) -> void:
	if i < 0 or i >= world_scenes.size():
		return
	change_world_from_scene(world_scenes[i])

func change_world_from_scene(scene: PackedScene) -> void:
	if scene == null:
		return

	_unload_current_world()

	var parent := get_node_or_null(world_root)
	if parent == null:
		parent = self

	var inst := scene.instantiate()
	parent.add_child(inst)

	var view := inst as WorldView
	if view == null:
		push_warning("A cena instanciada não herda de WorldView")
		return

	current_world_view = view
	if current_world_view.world:
		print("Mudou para o mundo:", current_world_view.world.name)

func _unload_current_world() -> void:
	if is_instance_valid(current_world_view):
		current_world_view.queue_free()
		await get_tree().process_frame
	current_world_view = null
