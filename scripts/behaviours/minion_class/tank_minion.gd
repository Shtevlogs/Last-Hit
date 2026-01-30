class_name TankMinion
extends _MinionClass

func get_polygon_data() -> PackedVector2Array:
    return PackedVector2Array([
        Vector2(9.0, 9.0),
        Vector2(9.0, -9.0),
        Vector2(-9.0, -9.0),
        Vector2(-9.0, 9.0)
    ])

func get_action_cooldown() -> float:
    return GameConfig.TANK_ACTION_COOLDOWN

func get_move_time() -> float:
    return GameConfig.TANK_MOVE_TIME

func get_attack_time() -> float:
    return GameConfig.TANK_ATTACK_TIME

func get_lunge_time() -> float:
    return GameConfig.TANK_LUNGE_TIME

func get_attack_damage() -> int:
    return GameConfig.TANK_ATTACK_DAMAGE

func get_total_health() -> int:
    return GameConfig.TANK_TOTAL_HEALTH

func get_last_hit_reward() -> int:
    return GameConfig.TANK_LAST_HIT_REWARD

func get_spawn_cost() -> int:
    return GameConfig.TANK_SPAWN_COST

func get_spawn_cooldown() -> float:
    return GameConfig.TANK_SPAWN_COOLDOWN

func get_range() -> int:
    return GameConfig.TANK_RANGE
