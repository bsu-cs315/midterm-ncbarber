extends Node2D

var player : KinematicBody2D
var health := 5
var timer := 0
var score := 0


func _ready():
	spawn_player()


func _process(_delta):
	if Input.is_action_pressed("reset"):
		restart_level()
	if Input.is_action_pressed("quit"):
		get_tree().quit()


func spawn_player():
	player = load("res://src/Player.tscn").instance()
	player.position = Vector2(64,385)
	call_deferred("add_child", player)


func restart_level():
	var _restart := get_tree().change_scene("res://src/Title.tscn")

