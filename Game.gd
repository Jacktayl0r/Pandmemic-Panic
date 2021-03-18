extends Node2D

func _ready():
	if Global.reloaded == false:
		get_tree().reload_current_scene()
		Global.reloaded = true
func _on_NPC_dead():
	Global.NPCCount -= 1
	$NPCsfx.play()

func _on_NPC2_dead():
	Global.NPCCount -= 1
	$NPCsfx.play()

func _on_NPC3_dead():
	Global.NPCCount -= 1
	$NPCsfx.play()

func _on_NPC4_dead():
	Global.NPCCount -= 1
	$NPCsfx.play()

func _on_NPC5_dead():
	Global.NPCCount -= 1
	$NPCsfx.play()

func _process(delta):
	if Global.NPCCount <= 0:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene("Gameover.tscn")
		Global.reloaded = false
