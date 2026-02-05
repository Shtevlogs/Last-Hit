class_name ClickDamageUpgrade
extends _UpgradeLogic

func can_upgrade() -> bool:
    return GameState.current.upgrade_state.click_damage_upgrade_level < GameConfig.MAX_UPGRADE_LEVEL

func increment_level() -> void:
    GameState.current.upgrade_state.click_damage_upgrade_level += 1

func get_upgrade_cost() -> int:
    return GameConfig.PLAYER_DAMAGE_UPGRADE_COST_PER_LEVEL * (GameState.current.upgrade_state.click_damage_upgrade_level + 1)

func get_upgrade_button_text() -> String:
    if GameState.current.upgrade_state.click_damage_upgrade_level == 0:
        return "Unlock"
    elif GameState.current.upgrade_state.click_damage_upgrade_level == GameConfig.MAX_UPGRADE_LEVEL:
        return "Maxed"
    else:
        var current_damage := GameConfig.PLAYER_CLICK_DAMAGE + \
            (GameState.current.upgrade_state.click_damage_upgrade_level - 1) * \
            GameConfig.PLAYER_CLICK_DAMAGE_PER_UPGRADE
        var new_damage := current_damage + GameConfig.PLAYER_CLICK_DAMAGE_PER_UPGRADE
        return "DMG %d-%d" % [roundi(current_damage), roundi(new_damage)]

func get_upgrade_polygon_data() -> PackedVector2Array:
    return PackedVector2Array([
        Vector2(-8, -8),
        Vector2(4, -4),
        Vector2(2, -1),
        Vector2(5, 3),
        Vector2(3, 5),
        Vector2(-1, 2),
        Vector2(-4, 5),
    ])
