extends Node2D

var player : KinematicBody2D
var enemy : KinematicBody2D
var health := 3
var timer := 0


func _ready():
	# Spawn Player and All set enemies
	spawn_player()
	spawn_enemy(Vector2(1365, 387))
	spawn_enemy(Vector2(2305, 387))
	spawn_enemy(Vector2(4811, 780))
	spawn_enemy(Vector2(3500, 780))
	spawn_enemy(Vector2(3730, -57))
	spawn_enemy(Vector2(878, -1085))
	spawn_enemy(Vector2(2428, -894))


func _process(_delta):
	# Set up for the HUD
	timer = $HUD/Timer.time_left
	$HUD/Lives.text = "Lives Left: %d" % health
	$HUD/TimeLeft.text = "Time Left: %d" % timer
	
	# Watching for if quick commands are hit for testing
	# R for reset
	if Input.is_action_pressed("reset"):
		restart_game()
		
	# esc for quit
	if Input.is_action_pressed("quit"):
		get_tree().quit()
		
	# Exit conditions
	if health == 0:
		var _game_over := get_tree().change_scene("res://src/GameOverScreens/Lose.tscn")
	
	if timer == 0:
		var _game_over := get_tree().change_scene("res://src/GameOverScreens/Lose.tscn")
	
	# Increases the pitch scale of the song to sound faster when time is running low
	if timer > 30:
		$GameSong.pitch_scale = 1
	elif timer < 30 and timer > 10:
		$GameSong.pitch_scale = 1.2
	elif timer < 10:
		$GameSong.pitch_scale = 1.2


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
	call_deferred("remove_child", enemy)
	call_deferred("remove_child", player)
	health -= 1
	call_deferred("add_child", enemy)
	spawn_player()


func restart_game():
	var _restart := get_tree().change_scene("res://src/Title.tscn")


func _on_Home_body_entered(body):
	if body == player:
		var _game_over := get_tree().change_scene("res://src/GameOverScreens/Win.tscn")
