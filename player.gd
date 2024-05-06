extends CharacterBody2D

var speed = 100
@export var axe_scene : PackedScene

func _physics_process(delta):
	handle_movement()
	if (Input.is_action_just_pressed("shoot")):
		shoot_projectiles()

func shoot_projectiles():
	# shoot a projectile at mouse position 
	var axe = axe_scene.instantiate()
	var random = randf_range(-1, 1)
	axe.apply_force(Vector2(10000 * random, -20000), Vector2(0,0))
	axe.position = position + Vector2(0, -20)
	get_tree().get_root().add_child(axe)
	print("SHOOTING")
	
	
func handle_movement():
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()


func _on_collection_radius_body_entered(body):
	if(body.has_method("collect")):
		body.collect()
