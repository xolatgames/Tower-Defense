extends StaticBody3D


var gold_count = 1


func _on_timer_timeout():
	Stats.gold += gold_count
	
	for i in range(10):
		showGold()


func showGold():
	var gold = load("res://Objects/coin.tscn")
	gold = gold.instantiate()
	gold.position = position + Vector3(randf_range(-0.5, 0.5), 0.5, randf_range(-0.5, 0.5))
	get_tree().current_scene.add_child(gold)
