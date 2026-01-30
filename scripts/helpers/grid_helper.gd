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

static func manhattan_distance(a: Vector2i, b: Vector2i) -> int:
    return absi(b.x - a.x) + absi(b.y - a.y)

static func get_minions_at_distance(center: Vector2i, distance: int) -> Array[MinionState]:
    var result: Array[MinionState] = []
    for minion : MinionState in GameState.current.minions:
        if manhattan_distance(center, minion.position) == distance:
            result.append(minion)
    return result

static func get_minions_within_distance(center: Vector2i, max_distance: int) -> Array[MinionState]:
    var result: Array[MinionState] = []
    for d : int in range(max_distance, -1, -1):
        result.append_array(get_minions_at_distance(center, d))
    return result

static func get_nearest_minion(center: Vector2i, enemy: bool) -> MinionState:
    var result: MinionState = null
    var min_distance: int = 9999
    for minion : MinionState in GameState.current.minions:
        if minion.enemy != enemy: continue
        var dist := manhattan_distance(center, minion.position)
        if dist < min_distance:
            min_distance = dist
            result = minion
    return result