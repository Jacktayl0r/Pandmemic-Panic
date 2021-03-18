extends Timer

var timer = 0

func _on_Timer_timeout():
	timer += 1
	
func _process(delta):
	get_parent().text = (str(timer) + " secs")
	
	Global.time = timer
