class_name CasterUpgrade
extends _UpgradeLogic

func get_upgrade_cost(upgrade_level: int) -> int:
    return 100

func apply_upgrade(upgrade_level: int) -> void:
    pass

func unapply_upgrade(upgrade_level: int) -> void:
    pass

func get_upgrade_button_text(upgrade_level: int) -> String:
    return "Caster Upgrade"

func get_upgrade_polygon_data() -> PackedVector2Array:
    return GeometryHelper.get_triangle_polygon_data(GameConfig.CASTER_SIZE)