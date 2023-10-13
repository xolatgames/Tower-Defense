extends Node3D


enum enemy_types {Empty, Goblin, Orc, Bird, Ghost}
@export var gold = 3
@export var lives = 5
var wave = 0
@export_category("Enemies")
@export var enemy_name : Array[enemy_types]
@export var enemy_health : Array[int]


func _ready():
	Stats.gold = gold
	Stats.lives = lives


func _on_spawning_enemies_timeout():
	var enemy
	
	if enemy_name.size() > wave:
		if !enemy_name[wave] == 0:
			match enemy_name[wave]:
				1:
					enemy = load("res://Enemies/goblin.tscn")
				2:
					enemy = load("res://Enemies/orc.tscn")
				3:
					enemy = load("res://Enemies/bird.tscn")
				4:
					enemy = load("res://Enemies/ghost.tscn")
			enemy = enemy.instantiate()
			enemy.max_health = enemy_health[wave]
			enemy.position = $"Start enemy position".position
			add_child(enemy)
	else:
		$Win.show()
		get_tree().paused = true
	
	wave += 1
