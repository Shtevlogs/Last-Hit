class_name UpgradeScreen
extends Control


func _on_next_level_button_pressed() -> void:
    SceneManager.load_scene(SceneManager.SceneId.GAME)
