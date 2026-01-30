class_name Minion
extends Node2D

var state : MinionState
var minion_class : _MinionClass

@onready var sprite: Polygon2D = $Sprite
@onready var health_bar: HealthBar = $HealthBar

func _ready() -> void:
    sprite.color = ColorConfig.ENEMY if state.enemy else ColorConfig.ALLY
    state.destroyed.connect(_on_destroy)
    state.updated.connect(_on_update)
    minion_class = MinionHelper.get_minion_logic(state)
    sprite.polygon = minion_class.get_polygon_data()

func _process(delta: float) -> void:
    MinionHelper.tick_cooldowns(delta, state)
    if state.action_cooldown > 0.0:
        return
        
    if GridHelper.is_out_of_bounds(state.position):
        if state.enemy:
            PlayerClickHelper.on_player_damaged()
        _on_destroy()
        return

    if state.target_uid > 0:
        var target := MinionHelper.get_minion_state_by_uid(state.target_uid)
        if target && GridHelper.manhattan_distance(state.position, target.position) <= minion_class.get_range():
            MinionHelper.do_attack(self, state, target)
        else:
            state.target_uid = 0
            return

    var nearest_enemy := GridHelper.get_nearest_minion(state.position, !state.enemy)
    if nearest_enemy && GridHelper.manhattan_distance(state.position, nearest_enemy.position) <= minion_class.get_range():
        #Lock target
        state.target_uid = nearest_enemy.uid
        MinionHelper.do_attack(self, state, nearest_enemy)
        return

    var next_position := MinionHelper.get_next_position(state)
    var other_minion := GridHelper.get_minion_or_default(next_position)
    
    if other_minion: # Blocked
        return # Do nothing for now
    elif state.move_cooldown <= 0.0:
        MinionHelper.do_move(self, state)

func _on_destroy() -> void:
    var idx := GameState.current.minions.find(state)
    if idx >= 0:
        GameState.current.minions.remove_at(idx)
    queue_free()

func _on_update() -> void:
    health_bar.update(float(state.current_health) / float(state.total_health))
