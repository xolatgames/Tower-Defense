extends Panel


@export var next_level = ""


func _on_next_level_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/"+next_level+".tscn")
