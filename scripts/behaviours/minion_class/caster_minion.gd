class_name CasterMinion
extends _MinionClass

func get_polygon_data() -> PackedVector2Array:
    return PackedVector2Array([
        Vector2(0.0, -8.0),
        Vector2(-7.5, 7.5),
        Vector2(7.5, 7.5)
    ])

func get_action_cooldown() -> float:
    return GameConfig.CASTER_ACTION_COOLDOWN

func get_move_time() -> float:
    return GameConfig.CASTER_MOVE_TIME

func get_attack_time() -> float:
    return GameConfig.CASTER_ATTACK_TIME

func get_lunge_time() -> float:
    return GameConfig.CASTER_LUNGE_TIME

func get_attack_damage() -> int:
    return GameConfig.CASTER_ATTACK_DAMAGE

func get_total_health() -> int:
    return GameConfig.CASTER_TOTAL_HEALTH

func get_last_hit_reward() -> int:
    return GameConfig.CASTER_LAST_HIT_REWARD

func get_spawn_cost() -> int:
    return GameConfig.CASTER_SPAWN_COST

func get_spawn_cooldown() -> float:
    return GameConfig.CASTER_SPAWN_COOLDOWN

func get_range() -> int:
    return GameConfig.CASTER_RANGE
