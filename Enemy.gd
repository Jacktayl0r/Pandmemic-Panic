extends Area2D

export var speed = 0.2
export var health = 10
var big = bool(false)

func _on_Enemy_area_entered(area):
	if area.is_in_group("Bullet"):
		health -= 10

func _physics_process(delta):
	if big == true:
		scale.x -= 0.01
		scale.y -= 0.01
		
	if scale.x <= 0.9:
		big = false
		
	if big == false:
		scale.x += 0.01
		scale.y += 0.01
		
	if scale.x >= 1:
		big = true
	
	if Global.targetedNPCLocation != Vector2.ZERO:
		if Global.targetedNPCLocation.x > position.x:
			position.x += speed
		if Global.targetedNPCLocation.x < position.x:
			position.x -= speed
		if Global.targetedNPCLocation.y > position.y:
			position.y += speed
		if Global.targetedNPCLocation.y < position.y:
			position.y -= speed
			
	if health <= 0:
		scale.x -= 0.05
		scale.y -= 0.05
		rotation_degrees += 10
	
	if scale.x <= 0:
		hide()
		queue_free()
