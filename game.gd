extends Node2D

enum GameMenuStates {MAIN, TOWN}

var state: GameMenuStates = GameMenuStates.MAIN

func _ready() -> void:
	self.state = GameMenuStates.MAIN
	switch_menu_state()

func switch_menu_state() -> void:
	match self.state:
		GameMenuStates.MAIN:
			self.hide_canvas_children()
			%MainCanvasGroup.get_node("Main").visible = true
		GameMenuStates.TOWN:
			self.hide_canvas_children()
			%MainCanvasGroup.get_node("Town").visible = true
		_:
			self.hide_canvas_children()
			%MainCanvasGroup.get_node("Main").visible = true

func hide_canvas_children() -> void:
	var children = %MainCanvasGroup.get_children()
	
	for child in children:
		child.visible = false


func _town_pressed() -> void:
	self.state = GameMenuStates.TOWN
	self.switch_menu_state()


func _reset_menu() -> void:
	self.state = GameMenuStates.MAIN
	self.switch_menu_state()
