extends Node

var level = 1
var score = 0
var remaining_seconds = 0

var win = false
var active_scene

const MUSIC_PREFIX = "res://resources/music/"
const MUSIC_EXTENSION = ".ogg"

func add_score_point():
	score+=1
	
func get_score_points():
	return score
	
func set_remaining_time(remaining):
	remaining_seconds = remaining
	
func get_remaining_time():
	return remaining_seconds

func game_over():
	change_scene("res://scenes/Aftergame.tscn")

func you_win_mf():
	change_scene("res://scenes/Aftergame.tscn")

func change_scene(scene_path):
	var scene_instance = load(scene_path).instance()
	if active_scene != null:
		active_scene.queue_free()
	active_scene = scene_instance
	get_tree().get_root().get_node("Game").add_child(scene_instance)

func play_song(song_name):
	var music_player = get_tree().get_root().get_node("Game").get_node("Music")
	music_player.stop()
	music_player.set_stream(load(MUSIC_PREFIX+song_name+MUSIC_EXTENSION))
	music_player.play()
