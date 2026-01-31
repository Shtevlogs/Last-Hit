class_name TankMinion
extends _MinionClass

func get_polygon_data() -> PackedVector2Array:
    return GeometryHelper.get_square_polygon_data(GameConfig.TANK_SIZE)

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
    return GameConfig.TANK_SPAWN_COOLDOWN - \
        (GameState.current.upgrade_state.tank_upgrade_level - 1) * \
        GameConfig.TANK_SPAWN_COOLDOWN_REDUCTION_PER_UPGRADE

func get_range() -> int:
    return GameConfig.TANK_RANGE

func get_cooldown_timer() -> TimerState:
    return GameState.current.resource_state.tank_respawn_timer

func get_can_spawn() -> bool:
    return GameState.current.upgrade_state.tank_upgrade_level > 0

func get_upgrade_level() -> int:
    return GameState.current.upgrade_state.tank_upgrade_level