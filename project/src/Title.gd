extends Control


func _on_Start_Game_pressed():
	var _ignored := get_tree().change_scene("res://src/Level.tscn")
