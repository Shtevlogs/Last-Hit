class_name TimerState
extends _State

var time : float = 0.0

func serialize() -> Dictionary:
    return {
        "time": time
    }

func deserialize(data: Dictionary) -> _State:
    time = float(data["time"])
    return self
