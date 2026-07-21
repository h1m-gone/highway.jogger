extends Node2D


func startagain() -> void:
	get_tree().change_scene_to_file("res://level_2.tscn")

func loser() -> void:
	$Button2/Label.visible=true
	await get_tree().create_timer(2).timeout
	$Button2/Label.visible=false
func _physics_process(delta: float) -> void:
	$Sprite2D/AnimatedSprite2D.play("default")
	$Sprite2D2/AnimatedSprite2D.play("default")
