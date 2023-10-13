extends CanvasLayer


func _process(delta):
	$"Money Count".text = str(Stats.gold)
	$"Lives Count".text = str(Stats.lives)


func _on_pause_pressed():
	$Paused.show()
	get_tree().paused = true
