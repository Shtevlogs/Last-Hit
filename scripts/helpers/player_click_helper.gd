class_name PlayerClickHelper

static func on_player_click(position: Vector2i) -> void:
    var minion := GridHelper.get_minion_or_default(position)
    if !minion || !minion.enemy: return
    
    var killed := MinionHelper.damage_minion(minion, GameConfig.PLAYER_CLICK_DAMAGE)
    
    if killed:
        var minion_logic := MinionHelper.get_minion_logic(minion)
        var reward := minion_logic.get_last_hit_reward()
        GameState.current.resource_state.player_gold += reward
        GameState.current.resource_state.updated.emit()
        VfxManager.spawn_vfx(\
            GridHelper.grid_position_to_world_position(minion.position),\
            VfxManager.VFX_FLOATING_NUMBER, reward)
    else:
        #maybe some sort of penalty here?
        pass
