class_name Place
extends Resource

@export var name: String
@export var description: String
@export var background: Texture2D
@export var available_monsters: Array[MonsterType]
@export var monster_spawn_rate: float
@export var required_level: int
@export var unlocked: bool = false
