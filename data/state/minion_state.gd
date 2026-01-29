class_name MinionState
extends _State

var position: Vector2i = Vector2i.ZERO
var action_cooldown: float = 0.0
var attack_cooldown: float = 0.0
var move_cooldown: float = 0.0

func serialize() -> Dictionary:
    return {
        "position": position
    }

func deserialize(data: Dictionary) -> _State:
    position = deserialize_vector2i(data["position"])
    return self
