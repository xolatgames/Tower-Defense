extends Button


@export var tower_name = ""
@export var price = 0


func _ready():
	var tower = load("res://Models/Towers/"+tower_name+".fbx")
	tower = tower.instantiate()
	$SubViewportContainer/SubViewport.add_child(tower)
	
	$Price.text = str(price) + "$"


func _on_button_down():
	if Stats.gold >= price:
		var building_area = load("res://Objects/building_area.tscn")
		building_area = building_area.instantiate()
		building_area.tower_name = tower_name
		building_area.price = price
		get_tree().current_scene.add_child(building_area)
