class_name LevelManager
extends Node

const MINION = preload("uid://bktqfidsx1d8y")

@onready var level_root: Node2D = $"../LevelRoot"

var current_wave_set : WaveSetConfig
var level_time : float = 0
var loop_idx : int = 0
var last_time_offset : float = 0

static var _I : LevelManager
func _ready() -> void:
    _I = self
    set_process(false)

func _process(delta : float) -> void:
    level_time += delta
    
    if !current_wave_set.opening_gambit.is_empty():
        _process_opening_gambit()
    elif !current_wave_set.remaining_wave_sets.is_empty():
        _process_loop()
        
func _process_opening_gambit() -> void:
    var o := current_wave_set.opening_gambit
    
    while !o.is_empty() && (o[0].timing_offset + last_time_offset) <= level_time:
        var wave : WaveConfig = o.pop_front()
        last_time_offset += wave.timing_offset
        _spawn_wave(wave)

func _process_loop() -> void:
    var l := current_wave_set.remaining_wave_sets
    
    while (l[loop_idx].timing_offset + last_time_offset) <= level_time:
        var wave : WaveConfig = l[loop_idx]
        last_time_offset += wave.timing_offset
        _spawn_wave(wave)
        
        loop_idx = (loop_idx + 1) % l.size()

func _spawn_wave(wave: WaveConfig) -> void:
    var new_minion_state := MinionState.new()
    new_minion_state.position = wave.position
    var new_minion := MINION.instantiate() as Minion
    new_minion.state = new_minion_state
    new_minion.position = GridHelper.grid_position_to_world_position(new_minion_state.position)
    level_root.add_child(new_minion)

static func start_level(num: int) -> void:
    _I.current_wave_set = LevelConfig.DATA[num].clone()
    _I.level_time = 0.0
    _I.loop_idx = 0
    _I.last_time_offset = 0.0
    _I.set_process(true)
