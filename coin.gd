extends CharacterBody2D

var is_collected = false
var target 
var speed = 10000

func collect():
	print("collecting")
	is_collected = true
	target = get_node("/root/Node2D/Player")
	
	
func _process(delta):
	if (is_collected):
		var direction = (target.global_position - global_position).normalized()
		velocity = direction * speed * delta
		move_and_slide()
