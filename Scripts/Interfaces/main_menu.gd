extends Node3D


func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/forest.tscn")


func _on_quit_pressed():
	get_tree().quit()
