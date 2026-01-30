class_name MinionHelper

static var minion_uid_counter : int = 0

static func get_minion_logic(state: MinionState) -> _MinionClass:
    return _MinionClass.minion_class_to_instance[state.minion_class]

static func get_minion_state_by_uid(uid: int) -> MinionState:
    for minion : MinionState in GameState.current.minions:
        if minion.uid == uid:
            return minion
    return null

static func create_minion_from_class(minion_class: GDScript) -> MinionState:
    var minion_logic := _MinionClass.minion_class_to_instance[minion_class] as _MinionClass
    var new_minion_state := MinionState.new()
    new_minion_state.minion_class = minion_class
    new_minion_state.total_health = minion_logic.get_total_health()
    new_minion_state.current_health = new_minion_state.total_health
    new_minion_state.uid = minion_uid_counter
    minion_uid_counter += 1
    return new_minion_state

static func get_next_position(state: MinionState) -> Vector2i:
    return state.position + (Vector2i.DOWN if state.enemy else Vector2i.UP)

static func tick_cooldowns(delta:float, state: MinionState) -> void:
    state.action_cooldown = max(0.0, state.action_cooldown - delta)
    state.attack_cooldown = max(0.0, state.attack_cooldown - delta)
    state.move_cooldown = max(0.0, state.move_cooldown - delta)
    
static func do_move(node: Node2D, state: MinionState) -> void:
    if state.action_cooldown > 0.0 || state.move_cooldown > 0.0: return 
    var minion_logic := get_minion_logic(state)
    
    var dest_position := get_next_position(state)
    
    #TODO: decide on position updating pre-move vs post-move
    state.position = dest_position
    
    var dest_world_pos := GridHelper.grid_position_to_world_position(dest_position)
    
    var tween := node.create_tween()
    tween.set_ease(GameConfig.MINION_EASING)
    tween.set_trans(GameConfig.MINION_TRANS)
    tween.tween_property(node, "position", dest_world_pos, minion_logic.get_move_time())

    state.move_cooldown = minion_logic.get_move_time()
    state.action_cooldown = minion_logic.get_action_cooldown()

static func do_attack(node: Node2D, state: MinionState, target: MinionState) -> void:
    if state.action_cooldown > 0.0 || state.attack_cooldown > 0.0: return
    var minion_logic := get_minion_logic(state)
    
    var target_position := GridHelper.grid_position_to_world_position(target.position)
    var self_position := GridHelper.grid_position_to_world_position(state.position)
    
    var sep := target_position - self_position
    var dir := sep / sep.length()
    
    # Wiggle attack
    var tween := node.create_tween()
    tween.set_ease(GameConfig.MINION_EASING)
    tween.set_trans(GameConfig.MINION_TRANS)
    tween.tween_property(node, "position", self_position + dir * GameConfig.MINION_ATTACK_DIST, \
        minion_logic.get_lunge_time() ).finished.connect(a_attacks_b.bind(state, target))
    tween.set_ease(GameConfig.MINION_EASING)
    tween.set_trans(GameConfig.MINION_TRANS)
    tween.tween_property(node, "position", self_position, \
        minion_logic.get_lunge_time() )
        
    state.attack_cooldown = minion_logic.get_attack_time()
    state.action_cooldown = minion_logic.get_action_cooldown()
    
static func a_attacks_b(a: MinionState, b: MinionState) -> void:
    var a_logic := get_minion_logic(a)
    damage_minion(b, a_logic.get_attack_damage())

static func damage_minion(state: MinionState, damage: float) -> void:
    state.current_health = max(0, state.current_health - damage)
    if state.current_health == 0:
        state.destroyed.emit()
    else:
        state.updated.emit()
