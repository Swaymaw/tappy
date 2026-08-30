extends Control

@onready var game_over_label: Label = $MarginContainer/GameOverLabel
@onready var press_jump_label: Label = $MarginContainer/PressJumpLabel
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var game_over_timer: Timer = $GameOverTimer
@onready var score_label: Label = $MarginContainer/ScoreLabel

func _ready() -> void:
	SignalHub.tappy_died.connect(game_over)
	SignalHub.point_scored.connect(point_scored)
	point_scored(0)

func game_over() -> void: 
	audio_stream_player.play()
	press_jump_label.hide()
	game_over_label.show()
	game_over_timer.start()

func point_scored(score: int) -> void: 
	score_label.text = "%03d" % score

func _unhandled_input(event: InputEvent) -> void:
	if press_jump_label.visible and event.is_action_pressed("fly"): 
		ComplexChange.load_main_scene()

func _on_game_over_timer_timeout() -> void:
	press_jump_label.show()
	game_over_label.hide()
	
