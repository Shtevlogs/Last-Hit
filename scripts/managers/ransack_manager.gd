class_name RansackManager
extends Node

func _on_timer_timeout() -> void:
    var count := 0
    for minion: MinionState in GameState.current.minions:
        if minion.position.y == 0 && !minion.enemy: # player minion at the end
            VfxManager.spawn_vfx(GridHelper.grid_position_to_world_position(minion.position),\
            VfxManager.VFX_FLOATING_NUMBER, 1)
            count += 1
            
    GameState.current.resource_state.player_gold += count
    GameState.current.resource_state.updated.emit()
    
    if count == 7:
        await get_tree().process_frame
        # Level finised detection, kind of a wierd spot, but it works I guess
        LevelManager.go_to_new_level()
