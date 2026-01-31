class_name CasterUpgrade
extends _UpgradeLogic

func can_upgrade() -> bool:
    return GameState.current.upgrade_state.caster_upgrade_level < GameConfig.MAX_UPGRADE_LEVEL

func increment_level() -> void:
    GameState.current.upgrade_state.caster_upgrade_level += 1

func get_upgrade_cost() -> int:
    return GameConfig.CASTER_UPGRADE_COST_PER_LEVEL * (GameState.current.upgrade_state.caster_upgrade_level + 1)

func get_upgrade_button_text() -> String:
    if GameState.current.upgrade_state.caster_upgrade_level == 0:
        return "Unlock"
    elif GameState.current.upgrade_state.caster_upgrade_level == GameConfig.MAX_UPGRADE_LEVEL:
        return "Maxed"
    else:
        var caster_logic := _Strategy.get_strategy_singleton(_MinionClass, CasterMinion) as _MinionClass
        var current_cd := caster_logic.get_spawn_cooldown()
        var new_cd := current_cd - GameConfig.CASTER_SPAWN_COOLDOWN_REDUCTION_PER_UPGRADE * \
            GameState.current.upgrade_state.caster_upgrade_level
        return "CD %0.1f-%0.1f" % [current_cd, new_cd]

func get_upgrade_polygon_data() -> PackedVector2Array:
    return GeometryHelper.get_triangle_polygon_data(GameConfig.CASTER_SIZE)
