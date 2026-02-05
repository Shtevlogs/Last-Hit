class_name LevelEndManager
extends Node

@onready var timer: Timer = $Timer
@onready var rewards_control: RewardsControl = %RewardsControl

var reward_gold := 50

static var _I : LevelEndManager
func _ready() -> void:
    _I = self

func _on_timer_timeout() -> void:
    GameState.current.resource_state.player_gold += _I.reward_gold
    LevelManager.go_to_new_level()
    SceneManager.load_scene(SceneManager.SceneId.UPGRADE_SCREEN)

#This probably will have a bug when pressing esc, but f it it's the prototype
static func show_end_level() -> void:
    _I.timer.start(GameConfig.LEVEL_TIMEOUT)
    _I.reward_gold = 50 + GameState.current.level_number * GameState.current.level_number
    _I.rewards_control.open_with(_I.reward_gold)
