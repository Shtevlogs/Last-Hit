class_name Minion
extends Node2D

var state : MinionState

@onready var warrior_sprite: Polygon2D = $WarriorSprite

func _ready() -> void:
    warrior_sprite.color = Color.RED if state.enemy else Color.BLUE

func _process(delta: float) -> void:
    MinionHelper.tick_cooldowns(delta, state)
    if state.action_cooldown > 0.0:
        return
        
    if GridHelper.is_out_of_bounds(state.position):
        #TODO: damage or lane closing logic
        queue_free()
        return
    
    # TODO: decide on attack/move
    MinionHelper.do_move(self, state)
