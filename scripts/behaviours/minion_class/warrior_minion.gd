class_name WarriorMinion
extends _MinionClass

static var _cached_polygon_data: PackedVector2Array

static func _create_circle() -> PackedVector2Array:
    var polygon_data: PackedVector2Array = []
    for i in range(360):
        var angle := i * 2.0 * PI / 360.0
        var x := cos(angle)
        var y := sin(angle)
        polygon_data.append(Vector2(x * 7.5, y * 7.5))
    return polygon_data

func get_polygon_data() -> PackedVector2Array:
    if _cached_polygon_data.is_empty():
        _cached_polygon_data = _create_circle()
    return _cached_polygon_data

func get_action_cooldown() -> float:
    return GameConfig.WARRIOR_ACTION_COOLDOWN

func get_move_time() -> float:
    return GameConfig.WARRIOR_MOVE_TIME

func get_attack_time() -> float:
    return GameConfig.WARRIOR_ATTACK_TIME

func get_lunge_time() -> float:
    return GameConfig.WARRIOR_LUNGE_TIME

func get_attack_damage() -> int:
    return GameConfig.WARRIOR_ATTACK_DAMAGE

func get_total_health() -> int:
    return GameConfig.WARRIOR_TOTAL_HEALTH

func get_last_hit_reward() -> int:
    return GameConfig.WARRIOR_LAST_HIT_REWARD

func get_spawn_cost() -> int:
    return GameConfig.WARRIOR_SPAWN_COST

func get_spawn_cooldown() -> float:
    return GameConfig.WARRIOR_SPAWN_COOLDOWN

func get_range() -> int:
    return GameConfig.WARRIOR_RANGE
