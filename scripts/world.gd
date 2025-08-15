class_name World
extends Resource

@export var name: String
@export var description: String
@export var places: Array[Place]
@export var background_music: AudioStream
@export var required_level: int
@export var unlocked: bool = false
@export var current_place: Place
@export var current_monster: MonsterType

func change_place(place: Place):
	if place in self.places:
		current_place = place
		print("Mudou para o lugar: ", place.name)

func spawn_monster() -> MonsterType:
	if current_place and current_place.available_monsters.size() > 0:
		var random_index = randi() % current_place.available_monsters.size()
		current_monster = current_place.available_monsters[random_index]
		return current_monster
	return null
