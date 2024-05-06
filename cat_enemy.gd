extends CharacterBody2D

var target
var speed = 1000
var health = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_node("/root/Node2D/Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = (target.global_position - global_position).normalized()
	velocity = direction * speed * delta
	move_and_slide()
	
func take_damage(damage):
	health -= damage
	modulate = $Sprite2D.modulate
	$Sprite2D.modulate = Color(modulate.r + 4, modulate.g, modulate.a)
	if (health <= 0):
		die()

func die():
	queue_free()
	
