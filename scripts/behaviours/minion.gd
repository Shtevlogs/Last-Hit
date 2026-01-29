class_name Minion
extends Node2D

var state : MinionState

@onready var warrior_sprite: Polygon2D = $WarriorSprite
@onready var health_bar: HealthBar = $HealthBar

func _ready() -> void:
    warrior_sprite.color = Color.RED if state.enemy else Color.BLUE
    state.destroyed.connect(_on_destroy)
    state.updated.connect(_on_update)

func _process(delta: float) -> void:
    MinionHelper.tick_cooldowns(delta, state)
    if state.action_cooldown > 0.0:
        return
        
    if GridHelper.is_out_of_bounds(state.position):
        #TODO: damage or lane closing logic
        _on_destroy()
        return
    
    var next_position := MinionHelper.get_next_position(state)
    var other_minion := GridHelper.get_minion_or_default(next_position)
    
    #TODO: class-based attack targeting somewhere around here
    if other_minion:
        if other_minion.enemy == state.enemy:
            return # Do nothing for now
        else:
            MinionHelper.do_attack(self, state, other_minion)
    else:
        MinionHelper.do_move(self, state)

func _on_destroy() -> void:
    var idx := GameState.current.minions.find(state)
    if idx >= 0:
        GameState.current.minions.remove_at(idx)
    queue_free()

func _on_update() -> void:
    health_bar.update(float(state.current_health) / float(state.total_health))
