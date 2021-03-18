extends AnimatedSprite

func _ready():
	Global.mode = "kb"

func _on_Button_pressed():
	if Global.mode == "kb":
		Global.mode = "gp"
		play("Controller")
	elif Global.mode == "gp":
		Global.mode = "kb"
		play("KB & Mouse")
