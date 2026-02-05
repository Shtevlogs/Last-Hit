class_name PlayerClickHelper

static func on_player_click(position: Vector2i) -> void:
    var minion := GridHelper.get_minion_or_default(position)
    if !minion || !minion.enemy: return
    
    var click_damage := GameConfig.PLAYER_CLICK_DAMAGE + \
        (GameState.current.upgrade_state.click_damage_upgrade_level - 1) * \
        GameConfig.PLAYER_CLICK_DAMAGE_PER_UPGRADE

    var killed := MinionHelper.damage_minion(minion, click_damage)
    
    if killed:
        var minion_logic := MinionHelper.get_minion_logic(minion)
        var reward := minion_logic.get_last_hit_reward()
        GameState.current.resource_state.player_mana += reward
        GameState.current.resource_state.updated.emit()
        VfxManager.spawn_vfx(\
            GridHelper.grid_position_to_world_position(minion.position),\
            VfxManager.VFX_FLOATING_NUMBER, reward)
    else:
        #maybe some sort of penalty here?
        pass

static func on_player_damaged() -> void:
    var resource_state := GameState.current.resource_state
    resource_state.player_hits = maxi(0, resource_state.player_hits - 1)
    resource_state.updated.emit()
