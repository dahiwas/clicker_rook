class_name GameManager
extends Node

@export var current_world: World	
@export var current_menu: Menu

@export var player_level: int = 1
@export var player_experience: int = 0

func change_world(world: World):
	current_world = world
	print("Mudou para o mund	o: ", world.name)
	
func get_loot_from_monster(monster: MonsterType) -> Array[Loot]:
	var dropped_loot: Array[Loot] = []
	
	for loot in monster.possible_loot:
		if randf() <= loot.drop_chance:
			dropped_loot.append(loot)
	
	return dropped_loot
