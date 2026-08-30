class_name Tappy

extends CharacterBody2D

const JUMP_FORCE: float = -350.0 

var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")
var _jumped: bool = false
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("fly"): 
		_jumped = true

func _physics_process(delta: float) -> void:
	velocity.y += _gravity * delta # no * delta as move_and_slide has delta in it's calculation. 
	if _jumped: 
		velocity.y = JUMP_FORCE
		_jumped = false
		animation_player.play("fly")
	move_and_slide() # calculate where we end up applying velocity.
	
	if is_on_ceiling() or is_on_floor(): 
		die()

func die(): 
	SignalHub.emit_tappy_died()
	get_tree().paused = true
