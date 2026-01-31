class_name SceneManager
extends Node

const MAIN_MENU : PackedScene = preload("uid://c2el26t2s3eyj")
const GAME : PackedScene = preload("uid://bkgnymwh1s6iy")
const UPGRADE_SCREEN : PackedScene = preload("uid://de8jh1llp673f")

const _SCENE_PREFABS : Array[PackedScene] = [MAIN_MENU, GAME, UPGRADE_SCREEN]

enum SceneId {
    MAIN_MENU,
    GAME,
    UPGRADE_SCREEN
}

static var _I : SceneManager
func _ready() -> void:
    _I = self

@onready var scene_root: Node = $"../SceneRoot"

static func load_scene(scene: SceneId) -> void:
    if _I.scene_root.get_child_count() != 0:
        _I.scene_root.get_child(0).queue_free()
    var new_scene := _SCENE_PREFABS[scene].instantiate() as Node
    _I.scene_root.add_child(new_scene)
