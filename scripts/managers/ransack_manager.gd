class_name RansackManager
extends Node

#dirty hack
static var ransacking_count := 0

func _on_timer_timeout() -> void:
    ransacking_count = 0
    for minion: MinionState in GameState.current.minions:
        if minion.position.y == 0 && !minion.enemy: # player minion at the end
            VfxManager.spawn_vfx(GridHelper.grid_position_to_world_position(minion.position),\
            VfxManager.VFX_FLOATING_NUMBER, 1)
            ransacking_count += 1
            
    GameState.current.resource_state.player_gold += ransacking_count
    GameState.current.resource_state.updated.emit()
    
    if ransacking_count == 7:
        await get_tree().process_frame
        # Level finished detection, kind of a wierd spot, but it works I guess
        LevelManager.go_to_new_level()
        SceneManager.load_scene(SceneManager.SceneId.UPGRADE_SCREEN)
