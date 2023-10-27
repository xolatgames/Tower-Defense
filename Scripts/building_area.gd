extends Area3D


var tower_name = ""
var price = 0
var i_can_build_here = false


func _ready():
	var tower = load("res://Models/Towers/"+tower_name+".fbx")
	tower = tower.instantiate()
	add_child(tower)


func _process(delta):
	i_can_build_here = false
	
	var areas = get_overlapping_areas()
	for i in areas:
		if i.is_in_group("place"):
			position = i.position + Vector3(0, 2, 0)
			i_can_build_here = true


func _input(event):
	if event is InputEventMouseMotion:
		var camera = get_viewport().get_camera_3d()
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * 1000
		
		var query = PhysicsRayQueryParameters3D.create(from, to)
		var result = get_world_3d().direct_space_state.intersect_ray(query)
		
		if result:
			show()
			position = result.position
		else:
			hide()
	
	if event is InputEventMouseButton:
		if !event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if i_can_build_here:
				var areas = get_overlapping_areas()
				
				for i in areas:
					if i.is_in_group("place"):
						var tower_obj = load("res://Towers/"+tower_name+".tscn")
						tower_obj = tower_obj.instantiate()
						tower_obj.position = i.global_position + Vector3(0, 2, 0)
						tower_obj.rotation_degrees.y = 180
						get_tree().current_scene.add_child(tower_obj)
						
						i.queue_free()
				
				Stats.gold -= price
			queue_free()
