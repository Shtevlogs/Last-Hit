class_name MouseClickIndicator
extends Node2D

#TODO: this needs to be upgradeable i think
const FULL_CLICK_TIME := 0.8
const CLICK_PERCENT_OFFSET := 0.15

@onready var line: Line2D = $Line2D

var points : Array[Vector2]
var click_time := 0.0
var can_click := true

func _ready() -> void:
    for pt: Vector2 in line.points:
        points.append(pt)
    line.clear_points()

func _process(delta: float) -> void:
    global_position = get_global_mouse_position()
    
    if !can_click && !Input.is_action_pressed("click"):
        can_click = true
        return
    
    if !can_click || !Input.is_action_pressed("click"):
        click_time = 0.0
        visible = false
        return
        
    visible = true
    click_time += delta
    
    var actual_click_percent := click_time / FULL_CLICK_TIME
    var click_percent := clampf(actual_click_percent + CLICK_PERCENT_OFFSET, 0.0, 1.0)
    var click_idx := roundi(click_percent * points.size())
    line.clear_points()
    for i : int in click_idx:
        line.add_point(points[i])
    
    if actual_click_percent >= 1.0:
        click_time = 0.0
        visible = false
        can_click = false
        PlayerClickHelper.on_player_click(GridHelper.world_position_to_grid_position(global_position))
