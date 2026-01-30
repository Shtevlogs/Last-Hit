class_name ResourceState
extends _State

var player_gold : int = 0
var warrior_respawn_timer : TimerState = TimerState.new()
var caster_respawn_timer : TimerState = TimerState.new()
var tank_respawn_timer : TimerState = TimerState.new()

func serialize() -> Dictionary:
    return {
        "player_gold": player_gold,
        "warrior_respawn_timer": warrior_respawn_timer.serialize(),
        "caster_respawn_timer": caster_respawn_timer.serialize(),
        "tank_respawn_timer": tank_respawn_timer.serialize()
    }

func deserialize(data: Dictionary) -> _State:
    player_gold = int(data["player_gold"])
    warrior_respawn_timer = TimerState.new().deserialize(data["warrior_respawn_timer"])
    caster_respawn_timer = TimerState.new().deserialize(data["caster_respawn_timer"])
    tank_respawn_timer = TimerState.new().deserialize(data["tank_respawn_timer"])
    return self
