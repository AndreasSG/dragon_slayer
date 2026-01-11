extends Node2D

enum GameMenuStates {MAIN, TOWN}

var state: GameMenuStates = GameMenuStates.MAIN

@onready
var progress_bar: ProgressBar = %DayProgressBar
@onready
var progress_bar_label: RichTextLabel = %DayProgressLabel

var current_day: int = 5
const MAX_DAYS: int = 5

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

func _progress_days() -> void:
	self.current_day -= 1
	self.progress_bar.value = self.current_day
	progress_bar_label.text = "%s / %s" % [self.current_day, self.MAX_DAYS]

func _town_pressed() -> void:
	self.state = GameMenuStates.TOWN
	self.switch_menu_state()


func _reset_menu() -> void:
	self.state = GameMenuStates.MAIN
	self.switch_menu_state()
