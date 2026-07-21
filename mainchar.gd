extends CharacterBody2D
func _physics_process(delta: float) -> void:
	if $ani.animation =="run":
		$runbox.visible=true
	else:
		$runbox.visible=false
	if $ani.animation =="idle" or "jump":
		$idlebox.visible=true
	else:
		$idlebox.visible=false
	if $ani.animation =="fall":
		$fallbox.visible=true
	else:
		$fallbox.visible=false
