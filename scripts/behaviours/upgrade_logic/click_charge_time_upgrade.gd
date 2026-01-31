class_name ClickChargeTimeUpgrade
extends _UpgradeLogic

func can_upgrade() -> bool:
    return GameState.current.upgrade_state.click_hold_time_upgrade_level < GameConfig.MAX_UPGRADE_LEVEL

func increment_level() -> void:
    GameState.current.upgrade_state.click_hold_time_upgrade_level += 1

func get_upgrade_cost() -> int:
    return GameConfig.PLAYER_CHARGE_TIME_UPGRADE_COST_PER_LEVEL * (GameState.current.upgrade_state.click_hold_time_upgrade_level + 1)

func get_upgrade_button_text() -> String:
    if GameState.current.upgrade_state.click_hold_time_upgrade_level == 0:
        return "Unlock"
    elif GameState.current.upgrade_state.click_hold_time_upgrade_level == GameConfig.MAX_UPGRADE_LEVEL:
        return "Maxed"
    else:
        var current_time := GameConfig.PLAYER_FULL_CLICK_TIME - \
            (GameState.current.upgrade_state.click_hold_time_upgrade_level - 1) * \
            GameConfig.PLAYER_FULL_CLICK_TIME_REDUCTION_PER_UPGRADE
        var new_time := current_time - GameConfig.PLAYER_FULL_CLICK_TIME_REDUCTION_PER_UPGRADE
        return "Ch %0.1f-%0.1f" % [current_time, new_time]

func get_upgrade_polygon_data() -> PackedVector2Array:
    return PackedVector2Array()
