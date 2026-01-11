class_name Character

extends Node2D

@onready
var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

enum Character_states {IDLE, ATTACK, DAMAGE}

var current_state = Character_states.IDLE
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.current_state = Character_states.IDLE
	
func _process(delta: float) -> void:
	self.handle_animations()

func handle_animations() -> void:
	match  current_state:
		Character_states.IDLE:
			self.animated_sprite.play("idle")
		_:
			self.animated_sprite.play("idle")
