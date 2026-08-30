extends Node

const MAIN = preload("uid://bk7wx4bliuk8n")
const GAME = preload("uid://vw3vbg4upywc")
const LOADING_SCREEN = preload("uid://bl147vqs4mqrd")

var _next_scene: PackedScene


#region Original
#
#func load_game_screen() -> void: 
	#get_tree().change_scene_to_packed(GAME)
#
#func load_main_scene() -> void: 
	#get_tree().change_scene_to_packed(MAIN)
	
#endregion

#region Simple Transition
func change_to_next() -> void: 
	get_tree().change_scene_to_packed(_next_scene)

func load_game_screen() -> void: 
	_next_scene = GAME 
	get_tree().change_scene_to_packed(LOADING_SCREEN)

func load_main_scene() -> void: 
	_next_scene = MAIN
	get_tree().change_scene_to_packed(LOADING_SCREEN)
