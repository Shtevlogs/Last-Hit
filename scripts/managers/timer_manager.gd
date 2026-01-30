class_name TimerManager
extends Node

func _process(delta: float) -> void:
    var resources := GameState.current.resource_state
    
    resources.warrior_respawn_timer.time += delta
    resources.caster_respawn_timer.time += delta
    resources.tank_respawn_timer.time += delta
