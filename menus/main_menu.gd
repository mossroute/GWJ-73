extends Control
signal start_game()

@onready var buttonsvbox = $MarginContainer/VBoxContainer/buttonsvbox


func _on_button_pressed():
	get_tree().change_scene_to_file("res://menus/intro.tscn")

