extends Area2D

onready var health = 100
var touching = 0
var dirx = 0
var diry = 0
signal dead

func _process(delta):
	if Global.skin1 == false:
		$Sprite.play("1")
		Global.skin1 = true

	elif Global.skin2 == false:
		$Sprite.play("2")
		Global.skin2 = true
		
	elif Global.skin3 == false:
		$Sprite.play("3")
		Global.skin3 = true
		
	elif Global.skin4 == false:
		$Sprite.play("4")
		Global.skin4 = true
		
	elif Global.skin5 == false:
		$Sprite.play("5")
		Global.skin5 = true

func _physics_process(delta):
	#if Global.targetedNPCLocation == Vector2.ZERO:
	Global.targetedNPCLocation = position
	
	if health <=0:
		scale.x -= 0.05
		scale.y -= 0.05
		rotation_degrees += 10
	
	if scale.x <= 0:
		Global.targetedNPCLocation == Vector2.ZERO
		emit_signal("dead")
		hide()
		queue_free()
	
	if touching > 0:
		health -= 0.1 * touching
		
	$Label.text = str(int(health))
	
	if touching == 0 and health <100:
		health += 0.03
	
	position.x += dirx
	position.y += diry
	
	if position.x >= 200:
		position.x -= 0.75
	if position.x <= -200:
		position.x += 0.75
	if position.y >= 200:
		position.y -= 0.75
	if position.y <= -200:
		position.y += 0.75

func _on_Node2D_area_entered(area):
	if area.is_in_group("Bullet"):
		health -= 5
	if area.is_in_group("Enemy"):
		touching +=1

func _on_NPC_area_exited(area):
	if area.is_in_group("Enemy"):
		touching -=1

func _on_Timer_timeout():
	dirx = rand_range(-0.2, 0.2)
	diry = rand_range(-0.2, 0.2)
