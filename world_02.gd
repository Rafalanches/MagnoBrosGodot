extends Node2D

@onready var player := $player as CharacterBody2D
@onready var player_scene = preload("res://actors/player.tscn")
@onready var camera := $camera as Camera2D
@onready var control = $HUD/control
@onready var player_start_position = $player_start_position

func _ready():
	Globals.player_start_position = player_start_position
	Globals.player = player
	Globals.player.follow_camera(camera)
	Globals.player.player_has_died.connect(game_over)
	control.time_is_up.connect(game_over)

func reload_game():
	await get_tree().create_timer(1.0).timeout
	var new_player = player_scene.instantiate()
	add_child(new_player)
	control.reset_clock_timer()
	Globals.player = new_player
	Globals.player.follow_camera(camera)
	Globals.player.player_has_died.connect(game_over)
	Globals.coins = 0
	Globals.score = 0
	Globals.player_life = 3
	Globals.respawn_player()
	
func game_over():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
