extends Control

var backgroundScene = preload("res://scenes/background.tscn")
var background = backgroundScene.instantiate()
var backgroundImage = "res://assets/images/puzzle-texture.png"

func _ready():
	background.setImage(backgroundImage)
	add_child(background)

func _on_level_select_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
