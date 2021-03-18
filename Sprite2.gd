extends Sprite

var bulletScene = preload("Bullet.tscn")
var rs_look = Vector2()
var deadzone = 0.1
var canShoot = bool(true)

func _process(delta):
	if Global.mode == "kb":
		look_at(get_global_mouse_position())
	elif Global.mode == "gp":
		if rs_look.length() >= deadzone:
			rotation = rs_look.angle()
	
	if Input.is_action_pressed('fire'):
		if canShoot == true:
			var bulletInstance = bulletScene.instance()
			get_tree().root.add_child(bulletInstance)
			bulletInstance.position = get_parent().position
			var target = get_global_mouse_position()
			var direction_to_mouse = bulletInstance.global_position.direction_to(target).normalized()
		
			if Global.mode == "kb":
				bulletInstance.set_direction(direction_to_mouse)
			elif Global.mode == "gp":
				if rs_look.length() >= deadzone:
					bulletInstance.set_direction(rs_look)
			canShoot = false
			$Timer.start()
			$AudioStreamPlayer.play()

func _physics_process(delta):
	rslook()

func rslook():
	rs_look.y = Input.get_joy_axis(0, JOY_AXIS_3)
	rs_look.x = Input.get_joy_axis(0, JOY_AXIS_2)


func _on_Timer_timeout():
	canShoot = true
