class_name Loot
extends Resource

@export var name: String
@export var description: String
@export var rarity: String  # "common", "rare", "epic", "legendary"
@export var value: int
@export var icon: Texture2D
@export var drop_chance: float  # 0.0 a 1.0 (0% a 100%)
