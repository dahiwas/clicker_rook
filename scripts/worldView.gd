class_name WorldView
extends Node2D

@export var world: World
@export var qt_places: int

@onready var monster_container := $MonsterContainer

var respawn_delay = 2

func _ready() -> void:
	if world:
		print("Carregando mundo:", world.name)
		print("Conjunto de places:", world.places)		
		print("Place atual:", world.current_place)
	
	for i in range(qt_places):
		var button := $ButtonContainer.get_node("Button%d" % (i+1))
		button.connect("pressed", Callable(self, "_on_button_pressed").bind(i))

func _on_button_pressed(index: int) -> void:
	if world and index < world.places.size():
		var place: Place = world.places[index]
		change_place(place)

	$Node2D.visible = false
	$ButtonContainer.visible = false

func change_place(place: Place) -> void:
	if world:
		world.change_place(place)
		spawn_monster(monster_container)
		
func spawn_monster(parent: Node) -> void:
	var scene := world.spawn_monster()
	if scene:
		var inst := scene.instantiate()
		parent.add_child(inst)
		
		var monster := inst as Monster
		if monster:
			print('Conectando sinal de monstro')
			monster.connect("died", Callable(self, "_on_monster_died"))
			print('Voce encontrou um ', monster.type.name)
			print('Vida: ',monster.life)
		
func _on_monster_died(monster_type) -> void:
	# respawn suave no próximo frame (ou espere um pouquinho)
	# call_deferred evita conflitos com o momento do queue_free
	print('Recebendo sinal de morte')
	if respawn_delay > 0.0:
		await get_tree().create_timer(respawn_delay).timeout
	call_deferred("spawn_monster", monster_container)
	
