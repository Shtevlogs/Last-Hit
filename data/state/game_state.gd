class_name GameState
extends _State
static var current : GameState

var resource_state : ResourceState = ResourceState.new()
var minions : Array[MinionState] = []

func serialize() -> Dictionary:
    return {
        "resource_state": resource_state.serialize(),
        "minions": serialize_array(minions)
    }

func deserialize(data: Dictionary) -> _State:
    resource_state = ResourceState.new().deserialize(data["resource_state"])
    minions = deserialize_array(MinionState, minions, data["minions"])
    return self
