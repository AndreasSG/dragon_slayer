extends Node2D

const ARCHERS_SCENE: PackedScene = preload("res://archer.tscn")
const KNIGHT_SCENE: PackedScene = preload("res://knight.tscn")
const SHIELD_SCENE: PackedScene = preload("res://shield.tscn")

@onready
var ArcherSpawnpoints: Node2D = %ArcherSpawns
@onready
var KnightSpawnpoints: Node2D = %KnightSpawns
@onready
var ShieldSpawnpoints: Node2D = %ShieldSpawns

@export
var units = {"archers": 2, "knights": 3, "shields": 1}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(self.units["archers"])
	self._spawn_units()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _spawn_units():
	for archer in self.units["archers"]:
		_instantiate_unit_scene(ARCHERS_SCENE, ArcherSpawnpoints, archer)
	for knight in self.units["knights"]:
		_instantiate_unit_scene(KNIGHT_SCENE, KnightSpawnpoints, knight)
	for shield in self.units["shields"]:
		_instantiate_unit_scene(SHIELD_SCENE, ShieldSpawnpoints, shield)

func _instantiate_unit_scene(scene: PackedScene, spawnPoints: Node2D, index: int):
		var new_unit = scene.instantiate()
		self.add_child(new_unit)
		var possible_spawns = spawnPoints.get_children()
		var spawn_pos = possible_spawns[index]
		new_unit.global_position = spawn_pos.global_position	
