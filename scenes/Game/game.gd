extends Node

@export var pipes_scene: PackedScene
@onready var upper_spawn: Marker2D = $UpperSpawn
@onready var lower_spawn: Marker2D = $LowerSpawn
@onready var pipes_holder: Node = $PipesHolder

func spawn_pipes(): 
	var scene = pipes_scene.instantiate()
	scene.position.y = randf_range(lower_spawn.position.y, upper_spawn.position.y)
	scene.position.x = lower_spawn.position.x
	pipes_holder.add_child(scene)
	
func _ready() -> void:
	ScoreManager.reset_score()
	spawn_pipes()

func _on_timer_timeout() -> void:
	spawn_pipes()
