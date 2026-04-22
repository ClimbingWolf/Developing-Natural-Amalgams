extends Node2D
class_name SpawnController;
@export var wave_data_path: String = "res://enemies/wave_data.txt"

static var hasStarted = false;
var isPlaying = false;
var file: FileAccess;
var waves_data = {};
var waves_time = {};
var wave = 0;
var variance = 0.5;
var time = 0;
var targetTime = -1;
var baseHp = 10;
var baseSpeed = 50;
var baseAttack =2;

func _ready() -> void:
	file = FileAccess.open(wave_data_path, FileAccess.READ);
	var counter = 0;
	for i in file.get_as_text().split("\n"):
		if(i != ""):
			waves_data[counter] = i.split(";")[1].split(",");
			waves_time[counter] = i.split(";")[0]
		counter+=1
		
func _process(delta: float) -> void:
	time +=delta;
	if(hasStarted):
		$Timer.start()
		isPlaying = true;
		hasStarted = false;
	if(isPlaying && wave > 0):
		if(time > targetTime):
			var generater = get_children()[int(randf() * 5)]
			targetTime = int(waves_time[wave-1])/len(waves_data[wave-1]) + (randf()-0.5) * variance
			var item = waves_data[wave-1]
			var level =  int(item[randf() * len(item)])
			generater.generate_enemy(baseHp * level, baseSpeed* level, baseAttack* level)
			time = 0;
		
		



func _on_timer_timeout() -> void:
	wave +=1 
	Scores.wave += 1
	$Timer.wait_time = int(waves_time[wave-1]);
	$Timer.start();
	pass # Replace with function body.
