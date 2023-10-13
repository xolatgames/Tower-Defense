extends RigidBody3D


func _on_destroy_timeout():
	queue_free()
