class_name WarriorUpgrade
extends _UpgradeLogic

func can_upgrade() -> bool:
    return GameState.current.upgrade_state.warrior_upgrade_level < GameConfig.MAX_UPGRADE_LEVEL

func increment_level() -> void:
    GameState.current.upgrade_state.warrior_upgrade_level += 1

func get_upgrade_cost() -> int:
    return 10

func apply_upgrade() -> void:
    pass

func unapply_upgrade() -> void:
    pass

func get_upgrade_button_text() -> String:
    return "CD %0.1d-%0.1d" % [0.8, 1.0]

func get_upgrade_polygon_data() -> PackedVector2Array:
    return GeometryHelper.get_circle_polygon_data(GameConfig.WARRIOR_SIZE)
