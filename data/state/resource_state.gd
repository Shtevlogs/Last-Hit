class_name ResourceState
extends _State

var player_gold : int = 0

func serialize() -> Dictionary:
    return {
        "player_gold": player_gold
    }

func deserialize(data: Dictionary) -> _State:
    player_gold = int(data["player_gold"])
    return self
