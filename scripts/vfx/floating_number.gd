class_name FloatingNumber
extends Vfx

const LABEL_STARTING_OFFSET := Vector2.UP * GameConfig.TILE_WIDTH / 2.0
const MIN_RAND_ROT := -0.4
const MAX_RAND_ROT := 0.4
const MIN_DIST := 2.5
const MAX_DIST := 4.7
const MIN_TIME := 0.5
const MAX_TIME := 0.8

@onready var label: Label = $LabelOffset/Label
@onready var label_offset: Node2D = $LabelOffset

func _ready() -> void:
    label_offset.position = LABEL_STARTING_OFFSET
    
    var rand_rot := randf_range(MIN_RAND_ROT, MAX_RAND_ROT)
    var rand_dist := randf_range(MIN_DIST, MAX_DIST)
    var rand_dest := LABEL_STARTING_OFFSET + Vector2.UP.rotated(rand_rot) * rand_dist
    var rand_time := randf_range(MIN_TIME, MAX_TIME)
    
    var tween := label_offset.create_tween()
    tween.tween_property(label_offset, "position", rand_dest, rand_time)\
    .finished.connect(func(): queue_free(), CONNECT_ONE_SHOT)

func initialize(param: Variant) -> void:
    label.text = "%s%sg" % ["+" if param > 0 else "", param]
