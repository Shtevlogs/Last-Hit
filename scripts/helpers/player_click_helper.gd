class_name PlayerClickHelper

static func on_player_click(position: Vector2i) -> void:
    var minion := GridHelper.get_minion_or_default(position)
    if !minion || !minion.enemy: return
    
    MinionHelper.damage_minion(minion, GameConfig.PLAYER_CLICK_DAMAGE)
