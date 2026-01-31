class_name Game
extends Node2D

const TILE : PackedScene = preload("uid://dqggwvc805fbi")

@onready var level_root: Node2D = $LevelRoot

func _ready() -> void:
    #TODO: like, move this to a tile manager or some shit
    var offset := GameConfig.GRID_OFFSET - GameConfig.GRID_MIDPOINT
    for i : int in GameConfig.GRID_WIDTH:
        for j: int in GameConfig.GRID_HEIGHT:
            var pos := Vector2(i * GameConfig.TILE_WIDTH, j * GameConfig.TILE_WIDTH) + offset
            var new_tile := TILE.instantiate() as Polygon2D
            new_tile.position = pos
            level_root.add_child(new_tile)
    
    LevelManager.initialize_level()
    
func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("action 1") && GameState.current.upgrade_state.warrior_upgrade_level > 0:
        MinionPlacementManager.spawn(WarriorMinion)
    if Input.is_action_just_pressed("action 2") && GameState.current.upgrade_state.caster_upgrade_level > 0:
        MinionPlacementManager.spawn(CasterMinion)
    if Input.is_action_just_pressed("action 3") && GameState.current.upgrade_state.tank_upgrade_level > 0:
        MinionPlacementManager.spawn(TankMinion)
    if Input.is_action_just_pressed("esc"):
        SceneManager.load_scene(SceneManager.SceneId.MAIN_MENU)
