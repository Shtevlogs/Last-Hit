class_name PlayerDeathManager
extends Node

var state: ResourceState

func _ready() -> void:
    state = GameState.current.resource_state
    state.updated.connect(_on_update)
    
func _on_update() -> void:
    if state.player_hits == 0:
        SFXManager.play(SFXManager.LOSE)
        get_tree().paused = true
        await get_tree().create_timer(GameConfig.LEVEL_TIMEOUT).timeout
        get_tree().paused = false
        
        GameState.current = GameState.new()
        
        SceneManager.load_scene(SceneManager.SceneId.MAIN_MENU)
