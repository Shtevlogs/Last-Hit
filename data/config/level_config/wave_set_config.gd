class_name WaveSetConfig

var opening_gambit : Array[WaveConfig]
var remaining_wave_sets : Array[WaveConfig]

func with_opening_gambit(waves: Array[WaveConfig]) -> WaveSetConfig:
    opening_gambit = waves
    return self

func with_remaining_wave_sets(waves: Array[WaveConfig]) -> WaveSetConfig:
    remaining_wave_sets = waves
    return self

func clone() -> WaveSetConfig:
    var new_wsc := WaveSetConfig.new()
    new_wsc.opening_gambit = opening_gambit.duplicate()
    new_wsc.remaining_wave_sets = remaining_wave_sets.duplicate()
    return new_wsc
