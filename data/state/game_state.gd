class_name GameState
extends _State
static var current : GameState

var level_number := 0
var resource_state : ResourceState = ResourceState.new()
var minions : Array[MinionState] = []
var level_state : LevelState = LevelState.new()

func serialize() -> Dictionary:
    return {
        "level_number": level_number,
        "resource_state": resource_state.serialize(),
        "minions": serialize_array(minions)
    }

func deserialize(data: Dictionary) -> _State:
    level_number = int(data["level_number"])
    resource_state = ResourceState.new().deserialize(data["resource_state"])
    minions = deserialize_array(MinionState, minions, data["minions"])
    return self
