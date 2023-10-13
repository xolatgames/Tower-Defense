extends Area3D


enum towers_types {Simple, Land, Air}
@export var damage = 1
@export var type : towers_types


func _on_damage_timeout():
	var enemies = get_overlapping_areas()
	for i in enemies:
		if i is Enemy:
			if i.visible:
				match type:
					0:
						i.health -= damage
					1:
						if !i.is_fly:
							i.health -= damage
					2:
						if i.is_fly:
							i.health -= damage
