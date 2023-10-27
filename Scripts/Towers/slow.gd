extends Area3D


func _process(delta):
	var enemies = get_overlapping_areas()
	for i in enemies:
		if i is Enemy:
			if i.visible:
				i.current_speed = i.speed/2
