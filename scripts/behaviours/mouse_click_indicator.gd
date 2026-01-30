class_name MouseClickIndicator
extends Node2D

#TODO: this needs to be upgradeable i think
const FULL_CLICK_TIME := 0.8
const CLICK_PERCENT_OFFSET := 0.15

@onready var line: Line2D = $Line2D

var points : Array[Vector2]
var click_time := 0.0
var is_fully_charged := false
var point_cast := PhysicsPointQueryParameters2D.new()

func _ready() -> void:
    for pt: Vector2 in line.points:
        points.append(pt)
    line.clear_points()
    
    point_cast.collide_with_areas = true
    point_cast.collide_with_bodies = false

func _process(delta: float) -> void:
    global_position = get_global_mouse_position()
    
    # On release: fire if fully charged, then reset
    if Input.is_action_just_released("click"):
        if is_fully_charged:
            var space_state = get_world_2d().direct_space_state
            point_cast.position = global_position
            var result = space_state.intersect_point(point_cast, 1)
            if !result.is_empty():
                var minion := (result[0].collider.get_parent() as Minion).state
                PlayerClickHelper.on_player_click(minion.position)
        click_time = 0.0
        visible = false
        is_fully_charged = false
        return
    
    if !Input.is_action_pressed("click"):
        click_time = 0.0
        visible = false
        return
        
    visible = true
    click_time += delta
    
    var actual_click_percent := click_time / FULL_CLICK_TIME
    if actual_click_percent >= 1.0:
        is_fully_charged = true
        actual_click_percent = 1.0  # Hold at full, don't keep counting
    
    line.default_color = ColorConfig.PALE_PURPLE if is_fully_charged else ColorConfig.PURPLE
    var click_percent := clampf(actual_click_percent + CLICK_PERCENT_OFFSET, 0.0, 1.0)
    var click_idx := roundi(click_percent * points.size())
    line.clear_points()
    for i : int in click_idx:
        line.add_point(points[i])
