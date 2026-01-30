@abstract
class_name _MinionClass
extends _Strategy

static func save_singletons() -> bool: return true

@abstract func get_polygon_data() -> PackedVector2Array
@abstract func get_action_cooldown() -> float
@abstract func get_move_time() -> float
@abstract func get_attack_time() -> float
@abstract func get_lunge_time() -> float
@abstract func get_attack_damage() -> int
@abstract func get_total_health() -> int
@abstract func get_last_hit_reward() -> int
@abstract func get_spawn_cost() -> int
@abstract func get_spawn_cooldown() -> float
@abstract func get_range() -> int
