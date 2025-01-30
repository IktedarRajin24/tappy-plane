extends Node

const PIPE_SPEED:float = 100.0
const PLANE_GROUP:String = "Plane"
const SCROLL_SPEED:float = 100.0

const GAME: PackedScene = preload("res://scenes/game/game.tscn")
const MAIN: PackedScene = preload("res://scenes/main/main.tscn")
func on_load_game() ->void:
	get_tree().change_scene_to_packed(GAME)
	
func on_main_game() ->void:
	get_tree().change_scene_to_packed(MAIN)
	
