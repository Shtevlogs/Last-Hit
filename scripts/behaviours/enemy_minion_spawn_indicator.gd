class_name EnemyMinionSpawnIndicator
extends Node2D

var grid_position : Vector2i
var time : float

var time_remaining : float

func _ready() -> void:
    time_remaining = time + 0.05 # add a little so the indicator goes away before enemy spawn
    position = GridHelper.grid_position_to_world_position(grid_position)
    scale = Vector2(0.5, 0.5)

func _process(delta: float) -> void:
    time_remaining -= delta
    if time_remaining <= time * 0.5:
        scale = Vector2(1.0, 1.0)
    if time_remaining <= 0:
        queue_free()
        return
        
    if GridHelper.get_minion_or_default(grid_position) != null:
        queue_free()
