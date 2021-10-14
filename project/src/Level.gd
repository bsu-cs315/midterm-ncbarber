extends Node2D

var player : KinematicBody2D
var enemy : KinematicBody2D
var health := 5
var timer := 0
var score := 0


func _ready():
	spawn_player()
	spawn_enemy(Vector2(256, 385))


func _process(_delta):
	if Input.is_action_pressed("reset"):
		restart_level()
		
	if Input.is_action_pressed("quit"):
		get_tree().quit()
		


func spawn_player():
	player = load("res://src/Player.tscn").instance()
	player.position = Vector2(-180,385)
	call_deferred("add_child", player)


func spawn_enemy(spawn_position):
	enemy = load("res://src/Enemy.tscn").instance()
	enemy.position = spawn_position
	call_deferred("add_child", enemy)


func restart_level():
	var _restart := get_tree().change_scene("res://src/Title.tscn")

