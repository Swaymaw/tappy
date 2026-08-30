extends Node

const fileName = "user://tappy_save.dat"

var _score: int

var high_score: int = 0: 
	set(value): 
		if value > high_score: 
			high_score = value

func _ready() -> void:
	SignalHub.tappy_died.connect(on_tappy_died)
	get_from_file()
	

func on_tappy_died() -> void: 
	high_score = _score
	save_to_file()
	reset_score()

func reset_score() -> void: 
	_score = 0

func add_point(): 
	_score += 1
	SignalHub.emit_point_scored(_score)

func save_to_file(): 
	var file = FileAccess.open(fileName, FileAccess.WRITE)
	if !file: 
		return 
	file.store_32(_score)
	
func get_from_file() -> void: 
	var file = FileAccess.open(fileName, FileAccess.READ)
	if !file: 
		return
	high_score = file.get_32()
	
