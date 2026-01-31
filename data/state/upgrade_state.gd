class_name UpgradeState
extends _State

var warrior_upgrade_level : int = 1
var caster_upgrade_level : int = 0
var tank_upgrade_level : int = 0
var click_hold_time_upgrade_level : int = 1
var click_damage_upgrade_level : int = 1

func serialize() -> Dictionary:
    return {
        "warrior_upgrade_level": warrior_upgrade_level,
        "caster_upgrade_level": caster_upgrade_level,
        "tank_upgrade_level": tank_upgrade_level,
        "click_hold_time_upgrade_level": click_hold_time_upgrade_level,
        "click_damage_upgrade_level": click_damage_upgrade_level
    }

func deserialize(data: Dictionary) -> _State:
    warrior_upgrade_level = int(data["warrior_upgrade_level"])
    caster_upgrade_level = int(data["caster_upgrade_level"])
    tank_upgrade_level = int(data["tank_upgrade_level"])
    click_hold_time_upgrade_level = int(data["click_hold_time_upgrade_level"])
    click_damage_upgrade_level = int(data["click_damage_upgrade_level"])
    return self