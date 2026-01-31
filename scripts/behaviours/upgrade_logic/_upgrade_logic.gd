@abstract
class_name _UpgradeLogic
extends _Strategy

static func save_singletons() -> bool: return true

@abstract func can_upgrade() -> bool
@abstract func increment_level() -> void
@abstract func get_upgrade_cost() -> int
@abstract func get_upgrade_button_text() -> String
@abstract func get_upgrade_polygon_data() -> PackedVector2Array
