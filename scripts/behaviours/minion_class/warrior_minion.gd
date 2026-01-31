class_name WarriorMinion
extends _MinionClass

func get_polygon_data() -> PackedVector2Array:
    return GeometryHelper.get_circle_polygon_data(GameConfig.WARRIOR_SIZE)

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
    return GameConfig.WARRIOR_SPAWN_COOLDOWN - \
        (GameState.current.upgrade_state.warrior_upgrade_level - 1) * \
        GameConfig.WARRIOR_SPAWN_COOLDOWN_REDUCTION_PER_UPGRADE

func get_range() -> int:
    return GameConfig.WARRIOR_RANGE

func get_cooldown_timer() -> TimerState:
    return GameState.current.resource_state.warrior_respawn_timer

func get_can_spawn() -> bool:
    return GameState.current.upgrade_state.warrior_upgrade_level > 0

func get_upgrade_level() -> int:
    return GameState.current.upgrade_state.warrior_upgrade_level