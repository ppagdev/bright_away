extends Control






func _on_level_select_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
