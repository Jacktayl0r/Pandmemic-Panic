extends Timer
signal upSpawnRate

var gameTime = 0

func _on_Timer_timeout():
	gameTime += 1

func _process(delta):
	if gameTime == 10:
		emit_signal("upSpawnRate")
		gameTime = 0
