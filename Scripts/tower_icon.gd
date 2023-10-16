extends SubViewportContainer


@export var tower_name = ""


func _ready():
	var tower = load("res://Models/Towers/"+tower_name+".fbx")
	tower = tower.instantiate()
	$SubViewport.add_child(tower)
