class_name ClickDamageUpgrade
extends _UpgradeLogic

func can_upgrade() -> bool:
    return GameState.current.upgrade_state.click_damage_upgrade_level < GameConfig.MAX_UPGRADE_LEVEL

func increment_level() -> void:
    GameState.current.upgrade_state.click_damage_upgrade_level += 1

func get_upgrade_cost() -> int:
    return 10

func apply_upgrade() -> void:
    pass

func unapply_upgrade() -> void:
    pass

func get_upgrade_button_text() -> String:
    return "DMG %0s-%s" % [10, 20]

func get_upgrade_polygon_data() -> PackedVector2Array:
    return PackedVector2Array()
