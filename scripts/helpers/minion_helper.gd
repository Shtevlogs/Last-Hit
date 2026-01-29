class_name MinionHelper

static func get_next_position(state: MinionState) -> Vector2i:
    return state.position + (Vector2i.DOWN if state.enemy else Vector2i.UP)

static func tick_cooldowns(delta:float, state: MinionState) -> void:
    state.action_cooldown = max(0.0, state.action_cooldown - delta)
    state.attack_cooldown = max(0.0, state.attack_cooldown - delta)
    state.move_cooldown = max(0.0, state.move_cooldown - delta)
    
static func do_move(node: Node2D, state: MinionState) -> void:
    if state.action_cooldown > 0.0 || state.move_cooldown > 0.0: return 
    var dest_position := get_next_position(state)
    
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

static func do_attack(node: Node2D, state: MinionState, target: MinionState) -> void:
    if state.action_cooldown > 0.0 || state.attack_cooldown > 0.0: return
    
    var target_position := GridHelper.grid_position_to_world_position(target.position)
    var self_position := GridHelper.grid_position_to_world_position(state.position)
    
    var sep := target_position - self_position
    var dir := sep / sep.length()
    
    # Wiggle attack
    var tween := node.create_tween()
    tween.set_ease(GameConfig.MINION_EASING)
    tween.set_trans(GameConfig.MINION_TRANS)
    tween.tween_property(node, "position", self_position + dir * GameConfig.MINION_ATTACK_DIST, \
        GameConfig.WARRIOR_LUNGE_TIME ).finished.connect(a_attacks_b.bind(state, target))
    tween.set_ease(GameConfig.MINION_EASING)
    tween.set_trans(GameConfig.MINION_TRANS)
    tween.tween_property(node, "position", self_position, \
        GameConfig.WARRIOR_LUNGE_TIME )
        
    state.attack_cooldown = GameConfig.WARRIOR_ATTACK_TIME
    state.action_cooldown = GameConfig.WARRIOR_ACTION_COOLDOWN
    
static func a_attacks_b(_a: MinionState, b: MinionState) -> void:
    b.current_health = max(0, b.current_health - 19) #TODO: damage numbers or whatever
    if b.current_health == 0:
        b.destroyed.emit()
    else:
        b.updated.emit()
