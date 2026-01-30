class_name WaveState
extends _State

var timing_offset : float = 0.0
var position : Vector2i
var is_enemy : bool = true
var minion_class : GDScript

func serialize() -> Dictionary:
    return {
        "timing_offset": timing_offset,
        "position": position,
        "is_enemy": is_enemy,
        "minion_class": minion_class.get_global_name()
    }

func deserialize(data: Dictionary) -> _State:
    timing_offset = float(data["timing_offset"])
    position = deserialize_vector2i(data["position"])
    is_enemy = bool(data["is_enemy"])
    minion_class = _Strategy.get_strategy(_MinionClass, data["minion_class"])
    return self
