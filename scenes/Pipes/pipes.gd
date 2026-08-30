class_name Pipes

extends Node2D

const MOTION_SPEED = 120
@onready var score_sound: AudioStreamPlayer = $ScoreSound

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _physics_process(delta: float) -> void:
	position.x -= delta * MOTION_SPEED

 
func _on_timer_timeout() -> void:
	queue_free()
  

func _on_pipe_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die()

func _on_laser_body_entered(_body: Node2D) -> void:
	ScoreManager.add_point()
	score_sound.play()
	
