extends Panel


func _on_try_again_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().quit()
