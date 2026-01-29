class_name GridHelper

static func grid_position_to_world_position(position: Vector2i) -> Vector2:
    var offset := GameConfig.GRID_OFFSET - GameConfig.GRID_MIDPOINT
    return Vector2(position.x * GameConfig.TILE_WIDTH, position.y * GameConfig.TILE_WIDTH) + offset

static func world_position_to_grid_position(position: Vector2) -> Vector2i:
    var offset := GameConfig.GRID_OFFSET - GameConfig.GRID_MIDPOINT
    var unoffsetted := position - offset
    var unscaled := unoffsetted / GameConfig.TILE_WIDTH
    return Vector2i(roundi(unscaled.x), roundi(unscaled.y))

static func is_out_of_bounds(position: Vector2i) -> bool:
    return position.y < 0 || position.y >= GameConfig.GRID_HEIGHT ||\
        position.x < 0 || position.x >= GameConfig.GRID_WIDTH

static func get_minion_or_default(position: Vector2i) -> MinionState:
    var idx := GameState.current.minions.find_custom(
        func(minion: MinionState): return minion.position == position
    )
    if idx == -1:
        return null
    return GameState.current.minions[idx]
