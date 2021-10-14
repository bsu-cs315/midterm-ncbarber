extends Control


func _process(_delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()


func _on_Start_Game_pressed():
	var _ignored := get_tree().change_scene("res://src/Level.tscn")
