class_name SpawnButton
extends Button

@export var minion_class : GDScript
var minion_logic : _MinionClass

func _ready() -> void:
    pressed.connect(_on_pressed)
    minion_logic = _Strategy.get_strategy_singleton(_MinionClass, minion_class)

func _on_pressed() -> void:
    MinionPlacementManager.spawn(minion_class)

func _process(_delta: float) -> void:
    var timer_state := minion_logic.get_cooldown_timer()
    var cd_percent := clampf(timer_state.time / minion_logic.get_spawn_cooldown(), 0.0, 1.0)
    
    var text_parts := text.split("\n")
    var second_line : String
    if cd_percent == 1.0:
        second_line = "-Ready-"
    else:
        var cd_num := roundi(cd_percent*10.0)
        var pipes := ""
        for i in cd_num:
            pipes += "]"
        var spaces := ""
        for i in (10 - cd_num):
            spaces += " "
        second_line = "-%s%s-" % [pipes,spaces]
    text = "%s\n%s" % [text_parts[0], second_line]
