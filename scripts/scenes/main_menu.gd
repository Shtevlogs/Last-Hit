class_name MainMenu
extends Control

@onready var start_button: Button = $VBoxContainer/StartButton

func _ready() -> void:
    _update_start_button_text()
    
func _update_start_button_text() -> void:
    if GameState.current.level_number == 0 && !GameState.current.level_state.initialized:
        start_button.text = "Start"
    else:
        start_button.text = "Continue"

func _on_start_button_pressed() -> void:
    SceneManager.load_scene(SceneManager.SceneId.GAME)

func _on_save_button_pressed() -> void:
    SaveHelper.do_save()

func _on_load_button_pressed() -> void:
    SaveHelper.load_save()
    _update_start_button_text()

func _on_reset_button_pressed() -> void:
    SaveHelper.reset_save()
    _update_start_button_text()

func _on_settings_button_pressed() -> void:
    pass # TODO

func _on_exit_button_pressed() -> void:
    get_tree().quit()
