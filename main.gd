class_name Main
extends Node

func _ready() -> void:
    #TODO: move me into save game management
    GameState.current = GameState.new()
    
    SceneManager.load_scene(SceneManager.SceneId.MAIN_MENU)
