class_name LevelManager
extends Node

const MINION : PackedScene = preload("uid://bktqfidsx1d8y")

@onready var level_root: Node2D = $"../LevelRoot"

var state : LevelState

static var _I : LevelManager
func _ready() -> void:
    state = GameState.current.level_state
    _I = self
    set_process(false)

func _process(delta : float) -> void:
    state.level_time += delta * (1.0 + float(RansackManager.ransacking_count) * 0.3)
    
    if !state.current_wave_set.opening_gambit.is_empty():
        _process_opening_gambit()
    elif !state.current_wave_set.remaining_wave_sets.is_empty():
        _process_loop()
        
func _process_opening_gambit() -> void:
    var o := state.current_wave_set.opening_gambit
    
    while !o.is_empty() && (o[0].timing_offset + state.last_time_offset) <= state.level_time:
        var wave : WaveState = o.pop_front()
        state.last_time_offset += wave.timing_offset
        _spawn_wave(wave)

func _process_loop() -> void:
    var l := state.current_wave_set.remaining_wave_sets
    
    while (l[state.loop_idx].timing_offset + state.last_time_offset) <= state.level_time:
        var wave : WaveState = l[state.loop_idx]
        state.last_time_offset += wave.timing_offset
        _spawn_wave(wave)
        
        state.loop_idx = (state.loop_idx + 1) % l.size()

func _spawn_wave(wave: WaveState) -> void:
    var location := wave.position
    var minion_at_location := GridHelper.get_minion_or_default(location)
    if minion_at_location != null: # Do a cheeky little second try
        if wave.position.x == 3:
            location = Vector2i(0 if randf() > 0.5 else 6, wave.position.y)
        else:
            location = Vector2i(6 - wave.position.x, wave.position.y)
        minion_at_location = GridHelper.get_minion_or_default(location)
        if minion_at_location != null:
            return
    var new_minion := MinionHelper.create_minion_from_class(wave.minion_class)
    new_minion.position = location
    new_minion.enemy = wave.is_enemy
    _spawn_minion(new_minion)

func _spawn_minion(minion: MinionState, and_append: bool = true) -> void:
    if and_append:
        GameState.current.minions.append(minion)
    var new_minion := MINION.instantiate() as Minion
    new_minion.state = minion
    new_minion.position = GridHelper.grid_position_to_world_position(minion.position)
    level_root.add_child(new_minion)

static func spawn_minion(minion: MinionState, and_append: bool = true) -> void:
    _I._spawn_minion(minion, and_append)

static func start_level(num: int) -> void:
    num = num % LevelConfig.DATA.size()
    _I.state.current_wave_set = LevelConfig.DATA[num].to_state()
    _I.state.level_time = 0.0
    _I.state.loop_idx = 0
    _I.state.last_time_offset = 0.0
    _I.state.initialized = true

static func clear_level() -> void:
    #TODO: change this to mana and do rewards separately
    #GameState.current.resource_state.player_gold = 0
    #GameState.current.resource_state.updated.emit()
    var minions := GameState.current.minions.duplicate()
    for minion: MinionState in minions:
        minion.destroyed.emit()
    #GameState.current.minions = []

static func go_to_new_level() -> void:
    clear_level()
    GameState.current.level_number += 1
    start_level(GameState.current.level_number)
    _I.set_process(true)

static func initialize_level() -> void:
    if GameState.current.level_state.initialized:
        for minion: MinionState in GameState.current.minions:
            spawn_minion(minion, false)
    else:
        clear_level()
        start_level(GameState.current.level_number)
    _I.set_process(true)
