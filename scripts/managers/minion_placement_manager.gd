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
            minion_spawn_indicator.visible = false
            _create_minion(mouse_pos.x)
            Input.set_default_cursor_shape(Input.CURSOR_ARROW)
            set_process(false)
    else:
        minion_spawn_indicator.visible = false
        Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _create_minion(lane: int) -> void:
    var new_minion := MinionHelper.create_minion_from_class(minion_class_to_spawn)
    new_minion.enemy = false
    new_minion.position = Vector2i(lane, GameConfig.GRID_HEIGHT - 1)
    GameState.current.minions.append(new_minion)
    LevelManager.spawn_minion(new_minion)

func _on_spawn_warrior_pressed() -> void:
    var to_spawn := _Strategy.get_strategy_singleton(_MinionClass, WarriorMinion) as _MinionClass
    if !_try_spend_gold_and_cooldowns(to_spawn): return
    set_process(true)
    minion_class_to_spawn = WarriorMinion

func _on_spawn_caster_pressed() -> void:
    var to_spawn := _Strategy.get_strategy_singleton(_MinionClass, CasterMinion) as _MinionClass
    if !_try_spend_gold_and_cooldowns(to_spawn): return
    set_process(true)
    minion_class_to_spawn = CasterMinion

func _on_spawn_tank_pressed() -> void:
    var to_spawn := _Strategy.get_strategy_singleton(_MinionClass, TankMinion) as _MinionClass
    if !_try_spend_gold_and_cooldowns(to_spawn): return
    set_process(true)
    minion_class_to_spawn = TankMinion

func _try_spend_gold_and_cooldowns(minion_logic: _MinionClass) -> bool:
    var cost := minion_logic.get_spawn_cost()
    if GameState.current.resource_state.player_gold < cost:
        return false
    GameState.current.resource_state.player_gold -= cost
    GameState.current.resource_state.updated.emit()
    return true
