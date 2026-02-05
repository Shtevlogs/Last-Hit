class_name EnemyHealthBar
extends Polygon2D

const MAX_Y := -120.0
const MIN_Y := 120.0
const MAX_X := -170.0
const MIN_X := -180.0

func _ready() -> void:
    GameState.current.resource_state.updated.connect(_on_updated)
    
func _on_updated() -> void:
    var percent := float(GameState.current.resource_state.enemy_hits) / 3.0
    var top_y := MIN_Y + (MAX_Y - MIN_Y) * percent
    
    polygon = PackedVector2Array([
        Vector2(MIN_X, MIN_Y),
        Vector2(MAX_X, MIN_Y),
        Vector2(MAX_X, top_y),
        Vector2(MIN_X, top_y)
    ])
