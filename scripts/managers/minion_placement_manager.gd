class_name MinionPlacementManager
extends Node2D

@onready var minion_spawn_indicator: Node2D = $"../MinionSpawnIndicator"

static var _I : MinionPlacementManager
func _ready() -> void:
    _I = self
    set_process(false)
    
func _process(_delta: float) -> void:
    var mouse_position := get_global_mouse_position()
    var mouse_pos := GridHelper.world_position_to_grid_position(mouse_position)
    if !GridHelper.is_out_of_bounds(mouse_pos):
        Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
        minion_spawn_indicator.visible = true
        minion_spawn_indicator.position = GridHelper.grid_position_to_world_position(Vector2i(mouse_pos.x, GameConfig.GRID_HEIGHT - 1))
        if Input.is_action_just_pressed("click"):
            minion_spawn_indicator.visible = false
            _create_minion(mouse_pos.x)
            Input.set_default_cursor_shape(Input.CURSOR_ARROW)
            set_process(false)
    else:
        minion_spawn_indicator.visible = false
        Input.set_default_cursor_shape(Input.CURSOR_ARROW)

#TODO: handle minion types
func _create_minion(lane: int) -> void:
    var new_minion := MinionState.new()
    new_minion.enemy = false
    new_minion.position = Vector2i(lane, GameConfig.GRID_HEIGHT - 1)
    GameState.current.minions.append(new_minion)
    LevelManager.spawn_minion(new_minion)

func _on_spawn_warrior_pressed() -> void:
    set_process(true)
    #TODO: queue up specific minion type
