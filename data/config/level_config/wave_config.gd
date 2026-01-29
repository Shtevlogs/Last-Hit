class_name WaveConfig

var timing_offset : float = 0.0
#TODO: var minion_type
var position : Vector2i

func with_offset(offset: float) -> WaveConfig:
    timing_offset = offset
    return self

func with_position(pos: Vector2i) -> WaveConfig:
    position = pos
    return self

func with_lane(lane: int) -> WaveConfig:
    position = Vector2i(lane, 0)
    return self
