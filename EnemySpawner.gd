extends Node2D

@export var enemy_to_spawn : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


func _on_timer_timeout():
	$Timer.start()
	var enemy = enemy_to_spawn.instantiate()
	add_child(enemy)
