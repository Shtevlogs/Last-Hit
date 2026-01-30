class_name WaveSetState
extends _State

var opening_gambit : Array[WaveState] = []
var remaining_wave_sets : Array[WaveState] = []

func serialize() -> Dictionary:
    return {
        "opening_gambit": serialize_array(opening_gambit),
        "remaining_wave_sets": serialize_array(remaining_wave_sets)
    }

func deserialize(data: Dictionary) -> _State:
    opening_gambit = deserialize_array(WaveState, opening_gambit, data["opening_gambit"])
    remaining_wave_sets = deserialize_array(WaveState, remaining_wave_sets, data["remaining_wave_sets"])
    return self
