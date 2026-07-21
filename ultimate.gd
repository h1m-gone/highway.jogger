extends Node2D


func _on_timer_timeout() -> void:
	$ColorRect.color=Color(randf(),randf(),randf())
	$Timer.start()
