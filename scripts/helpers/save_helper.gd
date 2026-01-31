class_name SaveHelper

const FORCE_NEW_SAVE := true
const SAVE_PATH := "user://save.json"

static func _static_init() -> void:
    if FORCE_NEW_SAVE:
        reset_save()
        do_save()

static func load_save() -> void:
    var save_file := FileAccess.open(SAVE_PATH, FileAccess.READ)
    if save_file == null:
        reset_save()
        return
    
    var save_data := JSON.parse_string(save_file.get_as_text()) as Dictionary
    GameState.current = GameState.new().deserialize(save_data)
    save_file.close()
    print("Loaded save")

static func do_save() -> void:
    var save_file: FileAccess = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
    save_file.store_string(JSON.stringify(GameState.current.serialize()))
    save_file.close()
    print("Did save")

static func reset_save() -> void:
    GameState.current = GameState.new()
    print("Reset save")
