class_name UpgradeSelection
extends Control

@onready var polygon: Polygon2D = $Polygon2D
@onready var button: Button = $Button

@export var upgrade_script: GDScript 

var logic : _UpgradeLogic

func _ready() -> void:
    logic = _Strategy.get_strategy_singleton(_UpgradeLogic, upgrade_script)
    polygon.polygon = logic.get_upgrade_polygon_data()
    GameState.current.resource_state.updated.connect(_refresh_ui)
    _refresh_ui()

func _on_button_pressed() -> void:
    if !logic.can_upgrade(): return
    var cost := logic.get_upgrade_cost()
    if GameState.current.resource_state.player_gold < cost:
        return
    GameState.current.resource_state.player_gold -= cost
    logic.increment_level()
    GameState.current.resource_state.updated.emit()

func _refresh_ui() -> void:
    if logic.can_upgrade() && GameState.current.resource_state.player_gold > logic.get_upgrade_cost():
        button.disabled = false
        polygon.color = ColorConfig.ALLY
    else:
        button.disabled = true
        polygon.color = ColorConfig.ENEMY
    button.text = logic.get_upgrade_button_text()
    
