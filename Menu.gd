extends Control

func _on_Play_button_down():
	get_tree().change_scene("res://Game.tscn")
	Global.NPCCount = 5
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_Credits_button_down():
	get_tree().change_scene("res://Credits.tscn")
