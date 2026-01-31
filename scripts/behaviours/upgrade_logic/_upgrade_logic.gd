@abstract
class_name _UpgradeLogic
extends _Strategy

static func save_singletons() -> bool: return true

@abstract func get_upgrade_cost(upgrade_level: int) -> int
@abstract func apply_upgrade(upgrade_level: int) -> void
@abstract func unapply_upgrade(upgrade_level: int) -> void
@abstract func get_upgrade_button_text(upgrade_level: int) -> String
@abstract func get_upgrade_polygon_data() -> PackedVector2Array