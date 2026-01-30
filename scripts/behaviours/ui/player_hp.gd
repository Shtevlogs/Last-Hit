class_name PlayerHp
extends Control

var state : ResourceState

@onready var heart1: Polygon2D = $HBoxContainer/Heart/Polygon2D
@onready var heart2: Polygon2D = $HBoxContainer/Heart2/Polygon2D
@onready var heart3: Polygon2D = $HBoxContainer/Heart3/Polygon2D

var _hearts : Array[Polygon2D]

func _ready() -> void:
    state = GameState.current.resource_state
    state.updated.connect(_on_update_resource)
    _hearts = [heart1, heart2, heart3]

func _on_update_resource() -> void:
    var hits := state.player_hits
    
    for i:int in _hearts.size():
        if i < hits:
            _hearts[i].color = ColorConfig.ENEMY
        else:
            _hearts[i].color = ColorConfig.BURGANDY
