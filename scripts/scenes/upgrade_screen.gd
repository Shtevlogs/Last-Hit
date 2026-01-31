class_name UpgradeScreen
extends Control

@onready var h_box_container: HBoxContainer = $FlowContainer/HBoxContainer
@onready var h_box_container_2: HBoxContainer = $FlowContainer/HBoxContainer2

func _on_next_level_button_pressed() -> void:
    SceneManager.load_scene(SceneManager.SceneId.GAME)
