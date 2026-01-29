class_name WaveConfig

var timing_offset : float = 0.0
#TODO: var minion_type
var position : Vector2i
var is_enemy : bool = true

func after(offset: float) -> WaveConfig:
    timing_offset = offset
    return self

func at(pos: Vector2i) -> WaveConfig:
    position = pos
    return self

func on(lane: int) -> WaveConfig:
    position = Vector2i(lane, 0)
    return self

func player() -> WaveConfig:
    is_enemy = false
    return self
