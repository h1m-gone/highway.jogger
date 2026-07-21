extends Node2D
var go=1
var a=3
var life=3
var c=true
var p=true
var o=1
var g=true
var d =true
var h=true
var m=true
func _physics_process(delta: float) -> void:
	$"Label".text="Time Left: "+str($"Timer".time_left).pad_decimals(2)
	if p:
		$"ene".position.y=564
		$Timer.start()
		p=false
	$"ene/AnimatedSprite2D".play("jum")
	$"ene/AnimatedSprite2D2".visible=false
	if c==true: 
		$"ene".position.x-=3
	if g==true:
		$"taco".position.x+=3
	if life ==3:
		$"life/3".visible =true
		$"life/4".visible=false
		$"life/5".visible=false
	elif life ==4:
		$"life/3".visible=false
		$"life/4".visible=true
		$"life/5".visible=false
	elif life ==5:
		$"life/3".visible=false
		$"life/4".visible=false
		$"life/5".visible=true
	elif life==6:
		get_tree().change_scene_to_file("res://gameover_2.tscn")
	if $"ene/AnimatedSprite2D".animation == "bom":
		$"ene/AnimatedSprite2D".scale = Vector2(.1,.1)
	else:
		$"ene/AnimatedSprite2D".scale=Vector2(1.1,1.1)
	if Input.is_action_just_pressed("ui_accept") and go!=3:
		await get_tree().create_timer(.25).timeout
		$"floor/1".position.y=$"floor/1".position.y+40
		go=go+1
		a=a-1
	if Input.is_action_just_pressed("ui_down") and a!=3:
		$"floor/1".position.y=$"floor/1".position.y-40
		a=a+1
		go=go-1
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("go"):
		$"ene".position.x=1300
	elif body.has_method("yes"):
		$"ene2".position.x=1300

func hit(body: Node2D) -> void:
	if body.has_method("go"):
		life+=1
		c=false
		$"ene/AnimatedSprite2D".visible=false
		$"ene/AnimatedSprite2D2".visible=true
		$"ene/AnimatedSprite2D2".play("1")
	elif body.has_method("yes"):
		life+=1
		d=false
		$"ene/AnimatedSprite2D2".play("1")

func righreset(body: Node2D) -> void:
	if body.has_method("no"):
		$Timer3.start(randi_range(1,5))
		g=false



func eat(body: Node2D) -> void:
	if body.has_method("ok"):
		$taco.position.x=-90
		if life>3:
			life-=1
func finishboom() -> void:
	if $"ene/AnimatedSprite2D2".animation == "1":
		$"ene".position.x=1200
		c=true
		$"ene/AnimatedSprite2D2".visible=false
		$"ene/AnimatedSprite2D".visible=true
func leveldone() -> void:
	get_tree().change_scene_to_file("res://gamewin_2.tscn")
func ene_move() -> void:
	if $"ene".position.y>534 and $"ene".position.y<614:
		if randi_range(1,2) == 1:
			$"ene".position.y+=10
		else:
			$"ene".position.y-=10
	elif $"ene".position.y==534:
		$"ene".position.y+=30
	elif $"ene".position.y==614:
		$"ene".position.y-=40
	$Timer2.start()

func tacoreset() -> void:
	$Timer3.stop()
	g=true
	if o==3:
		$taco.position.y=499
		$taco.position.x=-107
		o = 1
	else:
		$taco.position.y+=40
		$taco.position.x=-90
		o+=1
