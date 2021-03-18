extends Area2D

export var speed = 40

var velocity = Vector2()

func _physics_process(delta):

	Global.playerPos = position
	
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
		
	if position.x >= 200:
		position.x -= 0.75
	if position.x <= -200:
		position.x += 0.75
	if position.y >= 200:
		position.y -= 0.75
	if position.y <= -200:
		position.y += 0.75
		
	velocity = velocity.normalized() #Normalizes the direction so diagonal movement is in the same speed
	velocity *= speed * delta #Multiplies the direction to the speed and time passed
	translate(velocity)

	var mousepos = get_global_mouse_position()
	if velocity.x == 0 and velocity.y == 0:
		$PlayerSprite.play("Idle")
	else:
		if mousepos.y > position.y:
			$PlayerSprite.play("Down")
		elif mousepos.y < position.y:
			$PlayerSprite.play("Down")

#func _process(delta):
	#print(Engine.get_frames_per_second())
