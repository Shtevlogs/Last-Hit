class_name LevelState
extends _State

var initialized := false
var current_wave_set : WaveSetState
var level_time : float = 0
var loop_idx : int = 0
var last_time_offset : float = 0

func serialize() -> Dictionary:
    return {
        "initialized": false,
        "current_wave_set": current_wave_set.serialize(),
        "level_time": level_time,
        "loop_idx": loop_idx,
        "last_time_offset": last_time_offset
    }

func deserialize(data: Dictionary) -> _State:
    initialized = bool(data["initialized"])
    current_wave_set = WaveSetState.new().deserialize(data["current_wave_set"])
    level_time = float(data["level_time"])
    loop_idx = int(data["loop_idx"])
    last_time_offset = float(data["last_time_offset"])
    return self
