class_name GameState
extends _State
static var current : GameState

var player_units : Array[MinionState] = []
var enemy_units : Array[MinionState] = []

func serialize() -> Dictionary:
    return {
        "player_units": serialize_array(player_units),
        "enemy_units": serialize_array(enemy_units)
    }

func deserialize(data: Dictionary) -> _State:
    player_units = deserialize_array(MinionState, player_units, data["player_units"])
    enemy_units = deserialize_array(MinionState, enemy_units, data["enemy_units"])
    return self
