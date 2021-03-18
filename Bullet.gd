extends Area2D

export var speed = 5
var direction = Vector2.ZERO

func set_direction(direction: Vector2):
	self.direction = direction

func _physics_process(delta):
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		global_position += velocity
	rotation += 10

func _on_Timer_timeout():
	hide()
	queue_free()
