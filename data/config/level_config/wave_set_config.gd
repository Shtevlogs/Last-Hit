class_name WaveSetConfig

var opening_gambit : Array[WaveConfig]
var remaining_wave_sets : Array[WaveConfig]

func with_opening_gambit(waves: Array[WaveConfig]) -> WaveSetConfig:
    opening_gambit = waves
    return self

func with_remaining_wave_sets(waves: Array[WaveConfig]) -> WaveSetConfig:
    remaining_wave_sets = waves
    return self

func to_state() -> WaveSetState:
    var new_wss := WaveSetState.new()

    for wave in opening_gambit:
        var wave_state := WaveState.new()
        wave_state.timing_offset = wave.timing_offset
        wave_state.position = wave.position
        wave_state.is_enemy = wave.is_enemy
        wave_state.minion_class = wave.minion_class
        new_wss.opening_gambit.append(wave_state)
    for wave in remaining_wave_sets:
        var wave_state := WaveState.new()
        wave_state.timing_offset = wave.timing_offset
        wave_state.position = wave.position
        wave_state.is_enemy = wave.is_enemy
        wave_state.minion_class = wave.minion_class
        new_wss.remaining_wave_sets.append(wave_state)
    return new_wss
