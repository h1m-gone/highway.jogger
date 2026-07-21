extends Node2D


func startagain() -> void:
	get_tree().change_scene_to_file("res://ultimate.tscn")

func loser() -> void:
	get_tree().change_scene_to_file("res://start.tscn")
func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play("default")
