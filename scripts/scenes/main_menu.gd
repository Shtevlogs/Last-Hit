class_name MainMenu
extends Control

func _on_start_button_pressed() -> void:
    SceneManager.load_scene(SceneManager.GAME)
