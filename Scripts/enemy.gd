extends Area3D

class_name Enemy

var speed = 20
var health = 0
var max_health = 10
@export var is_fly = false
@export var is_visible = true
@onready var agent = get_node("NavigationAgent3D")


func _ready():
	health = max_health


func _process(delta):
	$Health.text = str(health) + "/" + str(max_health)
	
	if health <= 0:
		queue_free()


func _physics_process(delta):
	agent.target_position = get_tree().current_scene.get_node("Castle").position
	var next_position = agent.get_next_path_position() - position
	agent.velocity = next_position
	$Skin.look_at(agent.get_next_path_position())


func _on_navigation_agent_3d_velocity_computed(safe_velocity):
	var next_safe_position = safe_velocity.normalized() / 1000 * speed
	translate(next_safe_position)


func _on_area_entered(area):
	if area.is_in_group("castle"):
		Stats.lives -= 1
		queue_free()


func _on_speeding_timeout():
	speed = 20


func _on_hiding_timeout():
	hide()
