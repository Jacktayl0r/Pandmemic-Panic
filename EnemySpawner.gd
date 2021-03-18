extends Node2D

var Enemy = preload("Enemy.tscn")
var Enemy2 = preload("Enemy2.tscn")

func spawnEnemy():
	var enemyInstance = Enemy.instance()
	var location = randi()%4+1
	randomize()

	if location == 1:
		enemyInstance.position = Vector2(-185, -185)
	elif location == 2:
		enemyInstance.position = Vector2(185, -185)
	elif location == 3:
		enemyInstance.position = Vector2(185, 185)
	elif location == 4:
		enemyInstance.position = Vector2(-185, 185)
	add_child(enemyInstance)

func spawnEnemy2():
	var enemy2Instance = Enemy2.instance()
	var location = randi()%4+1
	randomize()
	if location == 1:
		enemy2Instance.position = Vector2(-185, -185)
	elif location == 2:
		enemy2Instance.position = Vector2(185, -185)
	elif location == 3:
		enemy2Instance.position = Vector2(185, 185)
	elif location == 4:
		enemy2Instance.position = Vector2(-185, 185)
	add_child(enemy2Instance)

func _on_Timer_timeout():
	spawnEnemy()

func _on_Timer2_timeout():
	spawnEnemy2()

func _on_Timer_upSpawnRate():
	$Timer.wait_time -= 0.01
	$Timer2.wait_time -= 0.01
