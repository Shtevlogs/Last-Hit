class_name GameState
extends _State
static var current : GameState

var minions : Array[MinionState] = []

func serialize() -> Dictionary:
    return {
        "minions": serialize_array(minions)
    }

func deserialize(data: Dictionary) -> _State:
    minions = deserialize_array(MinionState, minions, data["minions"])
    return self
