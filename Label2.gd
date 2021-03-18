extends Label


func _ready():
	text = ("You lasted for " + str(Global.time) + " seconds!")
