extends Node2D
class_name SpawnController;
@export var wave_data_path: String = "res://enemies/wave_data.txt"

static var hasStarted = false;
static var skip = false
static var time_left = 0
var isPlaying = false;
var file: FileAccess;
var waves_data = {};
var waves_time = {};
var wave = 0;
var variance = 0.5;
var time = 0;
var targetTime = -1.0;
var baseHp = 10;
var baseSpeed = 20;
var baseAttack =2;
var enemiesSpawnedThisWave = 0

func _ready() -> void:
	file = FileAccess.open(wave_data_path, FileAccess.READ);
	var counter = 0;
	for i in file.get_as_text().split("\n"):
		if(i != ""):
			waves_data[counter] = i.split(";")[1].split(",");
			waves_time[counter] = i.split(";")[0]
		counter+=1
	$Timer.wait_time = 60
	$Timer.start()
		
func _process(delta: float) -> void:
	time_left = int($Timer.time_left)
	time +=delta;
	if skip:
		$Timer.stop()
		startWave()
		skip = false
	if(wave > 0 and wave <= waves_data.size()):
		var maxEnemiesThisWave = waves_data[wave - 1].size()
		if(time > targetTime and enemiesSpawnedThisWave < maxEnemiesThisWave):
			var generater = get_children()[int(randf() * 5)]
			targetTime = int(waves_time[wave-1])/len(waves_data[wave-1]) + (randf()-0.5) * variance
			enemiesSpawnedThisWave += 1
			var item = waves_data[wave-1]
			var level =  int(item[randf() * len(item)])
			generater.generate_enemy(baseHp * level, baseSpeed* (1 + (0.2 *level)), baseAttack* level)
			time = 0;
		
		

func startWave():
	enemiesSpawnedThisWave = 0
	wave +=1 
	Scores.wave += 1
	targetTime = 0.0
	$Timer.wait_time = float(waves_time[wave-1]) + 30.0
	$Timer.start();

func _on_timer_timeout() -> void:
	startWave()
	pass # Replace with function body.
