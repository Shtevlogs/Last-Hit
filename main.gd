class_name Main
extends Node

func _ready() -> void:
    SaveHelper.load_save()
    
    SceneManager.load_scene(SceneManager.SceneId.MAIN_MENU)
