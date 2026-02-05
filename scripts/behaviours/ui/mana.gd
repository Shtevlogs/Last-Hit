class_name Mana
extends Label

var state : ResourceState

func _ready() -> void:
    state = GameState.current.resource_state
    state.updated.connect(_on_resource_updated)
    _on_resource_updated()

func _on_resource_updated() -> void:
    text = "%smp" % state.player_mana
