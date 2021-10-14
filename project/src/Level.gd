extends Node2D

var player : KinematicBody2D
var enemy : KinematicBody2D
var health := 5
var timer := 0
var score := 0


func _ready():
	spawn_player()
	spawn_enemy(Vector2(1365, 387))
	spawn_enemy(Vector2(2305, 387))
	spawn_enemy(Vector2(4811, 780))


func _process(_delta):
	if Input.is_action_pressed("reset"):
		restart_game()
		
	if Input.is_action_pressed("quit"):
		get_tree().quit()
		
	if health == 0:
		var _game_over := get_tree().change_scene("res://src/GameOverScreens/Lose.tscn")


func spawn_player():
	player = load("res://src/Player.tscn").instance()
	player.position = Vector2(-180,385)
	call_deferred("add_child", player)


func spawn_enemy(spawn_position):
	enemy = load("res://src/Enemy.tscn").instance()
	var _connection = enemy.connect("player_hit", self, "register_hit")
	enemy.position = spawn_position
	call_deferred("add_child", enemy)


func register_hit():
	$GhostHit.play()
	call_deferred("remove_child", player)
	health -= 1
	spawn_player()


func restart_game():
	var _restart := get_tree().change_scene("res://src/Title.tscn")


func _on_Home_body_entered(body):
	if body == player:
		var _game_over := get_tree().change_scene("res://src/GameOverScreens/Win.tscn")
