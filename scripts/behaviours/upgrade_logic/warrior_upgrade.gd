class_name WarriorUpgrade
extends _UpgradeLogic

func can_upgrade() -> bool:
    return GameState.current.upgrade_state.warrior_upgrade_level < GameConfig.MAX_UPGRADE_LEVEL

func increment_level() -> void:
    GameState.current.upgrade_state.warrior_upgrade_level += 1

func get_upgrade_cost() -> int:
    return GameConfig.WARRIOR_UPGRADE_COST_PER_LEVEL * (GameState.current.upgrade_state.warrior_upgrade_level + 1)

func get_upgrade_button_text() -> String:
    if GameState.current.upgrade_state.warrior_upgrade_level == 0:
        return "Unlock"
    elif GameState.current.upgrade_state.warrior_upgrade_level == GameConfig.MAX_UPGRADE_LEVEL:
        return "Maxed"
    else:
        var warrior_logic := _Strategy.get_strategy_singleton(_MinionClass, WarriorMinion) as _MinionClass
        var current_cd := warrior_logic.get_spawn_cooldown()
        var new_cd := current_cd - GameConfig.WARRIOR_SPAWN_COOLDOWN_REDUCTION_PER_UPGRADE * \
            float(GameState.current.upgrade_state.warrior_upgrade_level)
        return "CD %0.1f-%0.1f" % [current_cd, new_cd]

func get_upgrade_polygon_data() -> PackedVector2Array:
    return GeometryHelper.get_circle_polygon_data(GameConfig.WARRIOR_SIZE)
