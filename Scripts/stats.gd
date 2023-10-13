extends Node


var gold = 3
var lives = 5


func _process(delta):
	if lives <= 0:
		get_tree().current_scene.get_node("Lose").show()
		get_tree().paused = true
