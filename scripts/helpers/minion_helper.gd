class_name MinionHelper

static func tick_cooldowns(delta:float, state: MinionState) -> void:
    state.action_cooldown = max(0.0, state.action_cooldown - delta)
    state.attack_cooldown = max(0.0, state.attack_cooldown - delta)
    state.move_cooldown = max(0.0, state.move_cooldown - delta)
    
static func do_move(node: Node2D, state: MinionState) -> void:
    #TODO: player vs enemy move
    var source_position := state.position
    var dest_position := source_position + Vector2i.DOWN
    
    #TODO: decide on position updating pre-move vs post-move
    state.position = dest_position
    
    var dest_world_pos := GridHelper.grid_position_to_world_position(dest_position)
    
    var tween := node.create_tween()
    tween.set_ease(GameConfig.MINION_EASING)
    tween.set_trans(GameConfig.MINION_TRANS)
    #TODO: unit type timings
    tween.tween_property(node, "position", dest_world_pos, GameConfig.WARRIOR_MOVE_TIME)

    state.move_cooldown = GameConfig.WARRIOR_MOVE_TIME
    state.action_cooldown = GameConfig.WARRIOR_ACTION_COOLDOWN
