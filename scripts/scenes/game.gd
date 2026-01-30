class_name Game
extends Node2D

const TILE : PackedScene = preload("uid://dqggwvc805fbi")

@onready var level_root: Node2D = $LevelRoot

func _ready() -> void:
    #TODO: like, move this to tile manager or some shit
    var offset := GameConfig.GRID_OFFSET - GameConfig.GRID_MIDPOINT
    for i : int in GameConfig.GRID_WIDTH:
        for j: int in GameConfig.GRID_HEIGHT:
            var pos := Vector2(i * GameConfig.TILE_WIDTH, j * GameConfig.TILE_WIDTH) + offset
            var new_tile := TILE.instantiate() as Polygon2D
            new_tile.position = pos
            level_root.add_child(new_tile)
    
    LevelManager.start_level(0)
    
func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("action 1"):
        MinionPlacementManager._I._on_spawn_warrior_pressed()
