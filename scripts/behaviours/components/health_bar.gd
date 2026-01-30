class_name HealthBar
extends Polygon2D

@onready var health_fill: Polygon2D = $HealthFill

var percent := 1.0

#HACK WARNING HACK WARNING
const LEFT_X := -8
const RIGHT_X := 8
const RIGHT_V1 := 2
const RIGHT_V2 := 3

func update(val: float) -> void:
    percent = val
    
    var x_pos := (RIGHT_X - LEFT_X) * percent + LEFT_X
    
    var v1 := health_fill.polygon[RIGHT_V1]
    var v2 := health_fill.polygon[RIGHT_V2]
    
    health_fill.polygon[RIGHT_V1] = Vector2(x_pos, v1.y)
    health_fill.polygon[RIGHT_V2] = Vector2(x_pos, v2.y)
