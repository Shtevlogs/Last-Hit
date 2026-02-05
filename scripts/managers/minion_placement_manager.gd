class_name MinionPlacementManager
extends Node2D

@onready var minion_spawn_indicator: Node2D = $"../MinionSpawnIndicator"

var minion_class_to_spawn: GDScript

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
            var minion_at_location := GridHelper.get_minion_or_default(Vector2i(mouse_pos.x, GameConfig.GRID_HEIGHT - 1))
            if minion_at_location == null:
                _spend_gold_and_cooldowns(minion_class_to_spawn)
                _create_minion(mouse_pos.x)
            minion_spawn_indicator.visible = false
            Input.set_default_cursor_shape(Input.CURSOR_ARROW)
            set_process(false)
    else:
        minion_spawn_indicator.visible = false
        Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _create_minion(lane: int) -> void:
    var new_minion := MinionHelper.create_minion_from_class(minion_class_to_spawn)
    new_minion.enemy = false
    new_minion.position = Vector2i(lane, GameConfig.GRID_HEIGHT - 1)
    LevelManager.spawn_minion(new_minion)

static func _can_spend_mana_and_cooldowns(minion_logic: _MinionClass) -> bool:
    if GameState.current.resource_state.player_mana < minion_logic.get_spawn_cost():
        return false
    if minion_logic.get_cooldown_timer().time < minion_logic.get_spawn_cooldown():
        return false
    return true

static func _spend_gold_and_cooldowns(minion_class: GDScript) -> void:
    var minion_logic := _Strategy.get_strategy_singleton(_MinionClass, minion_class) as _MinionClass
    var cost := minion_logic.get_spawn_cost()
    var cooldown_timer := minion_logic.get_cooldown_timer()
    GameState.current.resource_state.player_mana -= cost
    GameState.current.resource_state.updated.emit()
    cooldown_timer.time = 0.0

static func spawn(minion_class: GDScript) -> void:
    var to_spawn := _Strategy.get_strategy_singleton(_MinionClass, minion_class) as _MinionClass
    if !_can_spend_mana_and_cooldowns(to_spawn): return
    _I.set_process(true)
    _I.minion_class_to_spawn = minion_class
